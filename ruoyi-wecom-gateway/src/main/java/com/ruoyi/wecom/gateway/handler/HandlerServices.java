package com.ruoyi.wecom.gateway.handler;

import com.ruoyi.wecom.gateway.binding.WecomUserBindingService;
import com.ruoyi.wecom.gateway.wms.WmsInventoryClient;

/**
 * Handler 依赖的服务集合。
 *
 * <p>由 {@link com.ruoyi.wecom.gateway.WeComBotGatewayAutoConfiguration} 构造，
 * 在 {@link MessageRouter} 加载 {@link MessageHandlerFactory} 时传入。</p>
 */
public record HandlerServices(
        WecomUserBindingService bindingService,
        WmsInventoryClient wmsClient
) {
}
