package com.ruoyi.wecom.gateway;

import com.ruoyi.wecom.gateway.binding.WecomUserBindingService;
import com.ruoyi.wecom.gateway.client.WeComBotClient;
import com.ruoyi.wecom.gateway.config.ExecutorConfig;
import com.ruoyi.wecom.gateway.config.WecomProperties;
import com.ruoyi.wecom.gateway.handler.HandlerServices;
import com.ruoyi.wecom.gateway.router.MessageRouter;
import com.ruoyi.wecom.gateway.wms.WmsInventoryClient;
import org.springframework.boot.autoconfigure.AutoConfiguration;
import org.springframework.boot.context.properties.EnableConfigurationProperties;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Import;

import java.util.concurrent.ExecutorService;

/**
 * Spring Boot 自动配置入口。
 *
 * <p>通过 {@code META-INF/spring/org.springframework.boot.autoconfigure.AutoConfiguration.imports}
 * 注册，由 {@code ruoyi-admin-wms}（或任何使用 spring-boot-starter 的宿主应用）
 * 自动加载。</p>
 */
@AutoConfiguration
@EnableConfigurationProperties(WecomProperties.class)
@Import(ExecutorConfig.class)
public class WeComBotGatewayAutoConfiguration {

    /**
     * 注入 handler 的服务集合。
     */
    @Bean
    public HandlerServices wecomHandlerServices(WecomUserBindingService bindingService,
                                                WmsInventoryClient wmsClient) {
        return new HandlerServices(bindingService, wmsClient);
    }

    /**
     * 路由器单例：构造时通过 {@link java.util.ServiceLoader} 加载所有 handler factory。
     */
    @Bean
    public MessageRouter wecomMessageRouter(HandlerServices services) {
        return new MessageRouter(services);
    }

    /**
     * SDK 客户端包装：在 {@link WeComBotClient#start()} 中连接 wss。
     */
    @Bean(initMethod = "start", destroyMethod = "stop")
    public WeComBotClient weComBotClient(WecomProperties properties,
                                        MessageRouter router,
                                        ExecutorService wecomBusinessExecutor) {
        return new WeComBotClient(properties, router, wecomBusinessExecutor);
    }
}
