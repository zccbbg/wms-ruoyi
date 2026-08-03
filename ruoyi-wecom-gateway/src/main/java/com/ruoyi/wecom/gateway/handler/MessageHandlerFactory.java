package com.ruoyi.wecom.gateway.handler;

import com.ruoyi.wecom.gateway.binding.WecomUserBindingService;
import com.ruoyi.wecom.gateway.wms.WmsInventoryClient;

/**
 * {@link MessageHandler} SPI 工厂：JDK {@link java.util.ServiceLoader} 只能调用
 * 无参构造或静态 {@code provider()} 方法，Spring 注入的依赖无法直接被 ServiceLoader 看到。
 *
 * <p>解决方案：每个具体 handler 在 {@code META-INF/services/} 里列出
 * 本接口的实现（一个 {@code static} 工厂方法），由 {@link com.ruoyi.wecom.gateway.router.MessageRouter}
 * 在加载时调用 {@code create(services)} 注入 Spring bean。</p>
 *
 * <p>无参 {@code create()} 形式用于无依赖 handler（v1+）。</p>
 */
public interface MessageHandlerFactory {

    /**
     * 创建 handler 实例。
     *
     * @param services Spring 注入的服务集合（v1.1 §5.4：解耦所有 handler 与 Spring）
     * @return 新的 handler 实例（实现类负责自己缓存/单例策略）
     */
    MessageHandler create(HandlerServices services);
}
