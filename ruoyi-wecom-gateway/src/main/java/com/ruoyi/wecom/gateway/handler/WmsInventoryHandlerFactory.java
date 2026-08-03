package com.ruoyi.wecom.gateway.handler;

/**
 * WmsInventoryHandler 的 SPI 工厂。
 *
 * <p>在 {@code META-INF/services/com.ruoyi.wecom.gateway.handler.MessageHandlerFactory}
 * 中列出此工厂类，{@link com.ruoyi.wecom.gateway.router.MessageRouter} 通过
 * {@link java.util.ServiceLoader} 实例化此工厂，并调用 {@link #create(HandlerServices)}
 * 注入 Spring 管理的依赖。</p>
 */
public class WmsInventoryHandlerFactory implements MessageHandlerFactory {

    @Override
    public MessageHandler create(HandlerServices services) {
        return new WmsInventoryHandler(services.bindingService(), services.wmsClient());
    }
}
