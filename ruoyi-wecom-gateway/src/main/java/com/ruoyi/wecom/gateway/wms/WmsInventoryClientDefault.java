package com.ruoyi.wecom.gateway.wms;

import lombok.extern.slf4j.Slf4j;
import org.springframework.boot.autoconfigure.condition.ConditionalOnMissingBean;
import org.springframework.stereotype.Component;

import java.util.List;

/**
 * WMS 库存查询客户端默认实现（占位）。
 *
 * <p>v1 真实集成通过 ruoyi-admin-wms 内的 internal API：使用 Sa-Token
 * 为 userId 签发短期 token，调用 {@code /wms/inventory/listNoPage}
 * 鉴权 + 权限过滤。</p>
 *
 * <p>本类不引入 HTTP 客户端以保持 gateway 模块轻量；运行时通过自定义
 * {@link WmsInventoryClient} bean 覆盖。</p>
 */
@Slf4j
@Component
@ConditionalOnMissingBean(WmsInventoryClient.class)
public class WmsInventoryClientDefault implements WmsInventoryClient {

    @Override
    public List<WmsInventoryItem> queryInventory(long userId, List<String> skus) throws WmsUpstreamException {
        log.warn("WmsInventoryClientDefault.queryInventory called with userId={} skus={} (placeholder); "
                + "生产环境必须覆盖为真实 WMS 调用", userId, skus);
        // 占位返回空（视作"未找到库存"），避免误用
        return List.of();
    }
}
