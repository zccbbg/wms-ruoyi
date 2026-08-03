package com.ruoyi.wecom.gateway.config;

import lombok.Data;
import org.springframework.boot.context.properties.ConfigurationProperties;

/**
 * 企业微信 AI Bot 网关配置。
 *
 * 配置前缀: wecom.bot
 */
@Data
@ConfigurationProperties(prefix = "wecom.bot")
public class WecomProperties {

    /**
     * 是否启用机器人网关（dev / local profile 设为 false 跳过 wss 连接）。
     */
    private boolean enabled = true;

    /**
     * 机器人 ID（来自企业微信管理后台"智能机器人"配置）。
     */
    private String botId;

    /**
     * 机器人密钥（来自企业微信管理后台"智能机器人"配置）。
     */
    private String secret;

    /**
     * WSS 地址，默认 wss://openws.work.weixin.qq.com。
     */
    private String wsUrl = "wss://openws.work.weixin.qq.com";

    /**
     * 心跳间隔（毫秒），默认 30s。
     */
    private long heartbeatIntervalMillis = 30_000L;

    /**
     * 请求超时（毫秒），默认 10s。
     */
    private long requestTimeoutMillis = 10_000L;

    /**
     * 最大重连尝试次数，-1 表示无限。
     */
    private int maxReconnectAttempts = 10;

    /**
     * 最大鉴权失败重试次数，-1 表示无限。
     */
    private int maxAuthFailureAttempts = 5;

    /**
     * 业务执行器核心线程数。
     */
    private int businessCoreThreads = 10;

    /**
     * 业务执行器最大线程数。
     */
    private int businessMaxThreads = 20;

    /**
     * 业务执行器队列容量。
     */
    private int businessQueueCapacity = 100;

    /**
     * 业务线程池默认超时（秒）。
     */
    private int businessTimeoutSeconds = 10;

    /**
     * WMS 内部 API 调用基础地址（同一进程内默认为空）。
     */
    private String wmsBaseUrl = "";

    /**
     * 绑定页面基础 URL（用于在欢迎消息中生成绑定链接）。
     */
    private String bindBaseUrl = "http://localhost:8080";
}
