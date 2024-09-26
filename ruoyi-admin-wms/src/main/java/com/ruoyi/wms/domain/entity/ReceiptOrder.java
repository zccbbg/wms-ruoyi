package com.ruoyi.wms.domain.entity;

import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * 入库单对象 wms_receipt_order
 *
 * @author zcc
 * @date 2024-07-19
 */
@Data
@EqualsAndHashCode(callSuper = true)
@TableName("wms_receipt_order")
public class ReceiptOrder extends BaseOrder {
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
