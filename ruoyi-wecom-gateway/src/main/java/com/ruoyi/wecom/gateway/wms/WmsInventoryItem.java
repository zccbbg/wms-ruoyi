package com.ruoyi.wecom.gateway.wms;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * WMS 库存查询结果 DTO。
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
public class WmsInventoryItem {

    /** SKU 编码。 */
    private String sku;

    /** 库存数量。 */
    private Long quantity;

    /** 单位（件/箱/kg）。 */
    private String unit;

    /** 仓库编码（v1 多仓库时区分）。 */
    private String warehouse;
}
