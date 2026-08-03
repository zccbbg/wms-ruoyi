package com.ruoyi.wecom.gateway.wms;

import java.util.List;

/**
 * WMS 库存查询客户端接口。
 *
 * <p>v1.1 决策文档 §5.5/§5.6：实际生产实现走 ruoyi-system 服务（同进程时
 * 走 internal service；sidecar 时走 Feign）。</p>
 */
public interface WmsInventoryClient {

    /**
     * 查询库存。
     *
     * @param userId 已绑定的 WMS 用户 ID（用于权限过滤）
     * @param skus   要查询的 SKU 列表（去重后传入）
     * @return       库存记录列表
     * @throws       WmsUpstreamException WMS 5xx/超时
     */
    List<WmsInventoryItem> queryInventory(long userId, List<String> skus) throws WmsUpstreamException;

    /**
     * WMS 上游错误（5xx、超时）。
     */
    class WmsUpstreamException extends Exception {
        public WmsUpstreamException(String message) {
            super(message);
        }

        public WmsUpstreamException(String message, Throwable cause) {
            super(message, cause);
        }
    }
}
