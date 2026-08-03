package com.ruoyi.wecom.gateway.router;

import com.ruoyi.wecom.gateway.handler.HandlerException;
import com.ruoyi.wecom.gateway.handler.HandlerServices;
import com.ruoyi.wecom.gateway.handler.MessageHandler;
import com.ruoyi.wecom.gateway.handler.MessageHandlerFactory;
import com.ruoyi.wecom.gateway.parser.CommandParser;
import io.github.cloudsen.ai.wecom.model.BaseMessage;
import io.github.cloudsen.ai.wecom.model.WsFrame;
import lombok.extern.slf4j.Slf4j;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.ServiceConfigurationError;
import java.util.ServiceLoader;

/**
 * 消息路由器：归一化 → 匹配 handler → 处理 → 错误映射。
 *
 * <p>v1.1 决策文档 §5.4 设计：使用 JDK {@link ServiceLoader} 加载 {@link MessageHandlerFactory}，
 * 工厂负责注入 Spring bean（v1 通过构造 {@link HandlerServices} 传入）。</p>
 *
 * <p>顺序按 SPI 文件声明顺序匹配第一个 {@link MessageHandler#matches(String)} 命中的实现。</p>
 *
 * <p>未匹配任何 handler 时返回通用"未知指令"回复（不抛异常）。</p>
 *
 * <p>所有业务异常统一收口为用户友好文案（v1.1 §5.10）。</p>
 */
@Slf4j
public class MessageRouter {

    private final List<MessageHandler> handlers;

    /**
     * 构造时通过 {@link ServiceLoader#load(Class)} 加载所有 {@link MessageHandlerFactory}，
     * 工厂使用传入的 {@link HandlerServices} 注入 Spring bean。
     *
     * <p>线程安全：handler 列表在构造时固定，运行期不可变。</p>
     *
     * @param services    注入到 handler 的 Spring 服务集合
     * @param classLoader 用于 SPI 加载的 class loader（测试时可注入自定义 classloader）
     */
    public MessageRouter(HandlerServices services, ClassLoader classLoader) {
        this.handlers = loadHandlers(services, classLoader);
        if (log.isInfoEnabled()) {
            log.info("MessageRouter loaded {} handler(s): {}",
                    handlers.size(),
                    handlers.stream().map(MessageHandler::name).toList());
        }
    }

    /**
     * 便利构造：使用当前线程的 context class loader。
     */
    public MessageRouter(HandlerServices services) {
        this(services, Thread.currentThread().getContextClassLoader());
    }

    /**
     * 测试用构造：直接传入 handler 列表，跳过 SPI 加载。
     *
     * <p>生产代码不应使用此构造（应用启动路径应走 SPI 加载以便插件化）。</p>
     */
    public MessageRouter(List<MessageHandler> explicitHandlers) {
        this.handlers = List.copyOf(explicitHandlers);
    }

    private static List<MessageHandler> loadHandlers(HandlerServices services, ClassLoader cl) {
        List<MessageHandler> list = new ArrayList<>();
        try {
            ServiceLoader<MessageHandlerFactory> sl = ServiceLoader.load(MessageHandlerFactory.class, cl);
            for (MessageHandlerFactory f : sl) {
                try {
                    list.add(f.create(services));
                } catch (Exception e) {
                    log.error("failed to instantiate handler from factory {}: {}",
                            f.getClass().getName(), e.toString());
                }
            }
        } catch (ServiceConfigurationError e) {
            log.warn("ServiceLoader config error: {}", e.getMessage());
        }
        return Collections.unmodifiableList(list);
    }

    /**
     * 路由并处理一条消息，返回回复文本。
     *
     * <p>处理流程：
     * <ol>
     *   <li>提取 {@code frame.data.text.content}，归一化</li>
     *   <li>遍历 handlers，匹配第一个 {@code matches() == true}</li>
     *   <li>调用 {@code handle()}</li>
     *   <li>未匹配或抛异常时，根据 {@link HandlerException.ErrorCode} 映射用户文案</li>
     * </ol>
     */
    public String route(WsFrame<BaseMessage> frame) {
        if (frame == null || frame.getBody() == null) {
            log.warn("route() called with null frame or null data");
            return "消息为空，请重试";
        }
        BaseMessage data = frame.getBody();
        if (data.getText() == null || data.getText().getContent() == null) {
            log.debug("non-text message skipped: msgType={}", data.getMsgType());
            return "暂仅支持文本指令";
        }

        String raw = data.getText().getContent();
        String normalized = CommandParser.normalize(raw);
        if (normalized.isEmpty()) {
            return "请输入指令";
        }

        MessageHandler matched = null;
        for (MessageHandler h : handlers) {
            try {
                if (h.matches(normalized)) {
                    matched = h;
                    break;
                }
            } catch (Exception e) {
                log.warn("handler {} matches() threw, skip: {}", h.name(), e.toString());
            }
        }

        if (matched == null) {
            log.info("no handler matched for raw='{}' normalized='{}'", raw, normalized);
            return "未知指令：" + raw + "\n\n支持：查库存 <SKU>";
        }

        log.info("dispatch to handler={} raw='{}' sender={}", matched.name(), raw, data.getFrom());
        try {
            return matched.handle(frame, normalized);
        } catch (HandlerException he) {
            log.warn("handler {} business error: code={} msg={}", matched.name(), he.getCode(), he.getMessage());
            return mapBusinessError(he);
        } catch (Exception e) {
            log.error("handler {} unexpected error", matched.name(), e);
            return "系统繁忙，请稍后再试";
        }
    }

    /**
     * 业务异常 → 用户友好文案（v1.1 §5.10）。
     */
    private String mapBusinessError(HandlerException he) {
        return switch (he.getCode()) {
            case USER_INPUT_INVALID -> he.getMessage() != null ? he.getMessage() : "输入格式有误";
            case NOT_BINDED -> "您尚未绑定 WMS 账号，请先到绑定页面完成绑定";
            case PERMISSION_DENIED -> "您没有此操作的权限";
            case WMS_UPSTREAM_ERROR -> "WMS 服务暂不可用，请稍后再试";
            case INTERNAL_ERROR -> "系统繁忙，请稍后再试";
        };
    }

    /**
     * 当前已注册的 handler 数量（测试 / 健康检查用）。
     */
    public int handlerCount() {
        return handlers.size();
    }
}
