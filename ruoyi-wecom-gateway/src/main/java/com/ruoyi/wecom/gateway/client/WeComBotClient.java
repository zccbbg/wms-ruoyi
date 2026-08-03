package com.ruoyi.wecom.gateway.client;

import com.ruoyi.wecom.gateway.config.WecomProperties;
import com.ruoyi.wecom.gateway.router.MessageRouter;
import io.github.cloudsen.ai.wecom.WeComAiBotClient;
import io.github.cloudsen.ai.wecom.WeComAiBotClientOptions;
import io.github.cloudsen.ai.wecom.WeComAiBotListener;
import io.github.cloudsen.ai.wecom.model.BaseMessage;
import io.github.cloudsen.ai.wecom.model.WsFrame;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

import java.util.concurrent.ExecutorService;

/**
 * 企业微信 AI Bot 客户端（CloudSen SDK 包装）。
 *
 * <p>v1.1 决策文档 §5.3：薄包装，避免业务逻辑泄漏到 SDK 调用层。</p>
 *
 * <p>职责：
 * <ol>
 *   <li>构造 {@link WeComAiBotClientOptions}（含可配置参数）</li>
 *   <li>注册 {@link WeComAiBotListener}（text message 路由 + error 兜底）</li>
 *   <li>连接 / 断开生命周期管理（由 Spring {@code initMethod} / {@code destroyMethod} 触发）</li>
 *   <li>异步回复（避免阻塞 SDK 回调线程）</li>
 * </ol>
 */
@Slf4j
@RequiredArgsConstructor
public class WeComBotClient {

    private final WecomProperties properties;
    private final MessageRouter router;
    private final ExecutorService wecomBusinessExecutor;

    private WeComAiBotClient sdkClient;

    /**
     * 由 Spring 启动时调用。
     */
    public synchronized void start() {
        if (!properties.isEnabled()) {
            log.info("WeComBotClient disabled (wecom.bot.enabled=false), skip connection");
            return;
        }
        if (properties.getBotId() == null || properties.getBotId().isEmpty()
                || properties.getSecret() == null || properties.getSecret().isEmpty()) {
            log.warn("WeComBotClient missing botId/secret, skip connection");
            return;
        }

        WeComAiBotClientOptions opts = WeComAiBotClientOptions.builder(properties.getBotId(), properties.getSecret())
                .heartbeatIntervalMillis(properties.getHeartbeatIntervalMillis())
                .maxReconnectAttempts(properties.getMaxReconnectAttempts())
                .build();

        this.sdkClient = new WeComAiBotClient(opts);
        this.sdkClient.addListener(buildListener());
        try {
            this.sdkClient.connect();
            log.info("WeComBotClient connected: botId={} wsUrl={}", properties.getBotId(), properties.getWsUrl());
        } catch (Exception e) {
            log.error("WeComBotClient connect failed", e);
        }
    }

    /**
     * 由 Spring 关闭时调用。
     */
    public synchronized void stop() {
        if (sdkClient != null && sdkClient.isConnected()) {
            try {
                sdkClient.disconnect();
                log.info("WeComBotClient disconnected");
            } catch (Exception e) {
                log.warn("WeComBotClient disconnect failed", e);
            }
        }
    }

    private WeComAiBotListener buildListener() {
        return new WeComAiBotListener() {
            @Override
            public void onTextMessage(WsFrame<BaseMessage> frame) {
                // 异步处理避免阻塞 SDK 回调线程
                wecomBusinessExecutor.submit(() -> handleText(frame));
            }

            @Override
            public void onError(Throwable error) {
                log.error("Wecom SDK error", error);
            }

            @Override
            public void onDisconnected(String reason) {
                log.warn("Wecom SDK disconnected: {}", reason);
            }
        };
    }

    private void handleText(WsFrame<BaseMessage> frame) {
        try {
            String reply = router.route(frame);
            if (reply == null || reply.isEmpty()) {
                return;
            }
            if (reply.length() > 4096) {
                log.warn("reply too long ({} chars), truncate", reply.length());
                reply = reply.substring(0, 4096) + "\n...(内容过长已截断)";
            }
            sdkClient.replySimpleText(frame, reply);
        } catch (Exception e) {
            log.error("handleText unexpected error", e);
        }
    }

    /**
     * 测试用：判断当前是否已连接。
     */
    public boolean isConnected() {
        return sdkClient != null && sdkClient.isConnected();
    }
}
