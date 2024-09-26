package com.ruoyi.wms.domain.entity;

import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * 出库单对象 wms_shipment_order
 *
 * @author zcc
 * @date 2024-08-01
 */
@Data
@EqualsAndHashCode(callSuper = true)
@TableName("wms_shipment_order")
public class ShipmentOrder extends BaseOrder {
    /**
     * 仓库id
     */
    private Long warehouseId;

    /**
     * 入库类型
     */
    private Long optType;
    /**
     * 业务订单号
     */
    private String bizOrderNo;
    /**
     * 供应商
     */
    private Long merchantId;

}
