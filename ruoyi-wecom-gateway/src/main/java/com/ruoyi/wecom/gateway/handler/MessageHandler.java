package com.ruoyi.wecom.gateway.handler;

import io.github.cloudsen.ai.wecom.model.BaseMessage;
import io.github.cloudsen.ai.wecom.model.WsFrame;

/**
 * 消息处理器 SPI（v1 详见 docs/05-design/wecom-gateway-selection-v1.1.md §5.4）。
 *
 * <p>所有接入 WMS/CRM/HR 的指令都实现此接口，通过 JDK {@link java.util.ServiceLoader}
 * 配合 {@link MessageHandlerFactory} 注册（{@code META-INF/services/com.ruoyi.wecom.gateway.handler.MessageHandlerFactory}）。</p>
 *
 * <p>v1 唯一实现：{@code WmsInventoryHandler}（指令：{@code 查库存 <SKU>}）。</p>
 */
public interface MessageHandler {

    /**
     * 处理器名称（用于日志和 metrics 标识）。
     */
    String name();

    /**
     * 匹配检查：判断本 handler 是否能处理此消息。
     *
     * <p>推荐：精确匹配第一个空格前的指令名 + 剩余参数。匹配前文本应已 normalize
     * （trim、collapse 中间多空格、统一 lower-case）。</p>
     *
     * <p>例：{@code WmsInventoryHandler.matches("查库存 SKU-001") → true}，
     * {@code matches("hello") → false}。</p>
     */
    boolean matches(String normalizedText);

    /**
     * 处理消息并返回回复文本。
     *
     * @param frame  原始 SDK 消息帧（含 sender、chatId、openId 等）
     * @param text   已 normalize 过的指令文本
     * @return       回复文本（≤ 4096 字符；超长应使用流式回复）
     * @throws       HandlerException 业务异常（用户输入错误、权限不足等可恢复错误）
     */
    String handle(WsFrame<BaseMessage> frame, String text) throws HandlerException;
}
