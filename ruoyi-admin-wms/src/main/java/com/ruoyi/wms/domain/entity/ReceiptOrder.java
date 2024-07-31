package com.ruoyi.wms.domain.entity;

import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.ruoyi.common.mybatis.core.domain.BaseEntity;
import lombok.Data;
import lombok.EqualsAndHashCode;

import java.io.Serial;
import java.math.BigDecimal;

/**
 * 入库单对象 wms_receipt_order
 *
 * @author zcc
 * @date 2024-07-19
 */
@Data
@EqualsAndHashCode(callSuper = true)
@TableName("wms_receipt_order")
public class ReceiptOrder extends BaseEntity {

    @Serial
    private static final long serialVersionUID=1L;

    /**
     *
     */
    @TableId(value = "id")
    private Long id;
    /**
     * 入库单号
     */
    private String receiptOrderNo;
    /**
     * 入库类型
     */
    private Long receiptOrderType;
    /**
     * 供应商
     */
    private Long merchantId;
    /**
     * 订单号
     */
    private String orderNo;
    /**
     * 商品总数
     */
    private BigDecimal totalQuantity;
    /**
     * 订单金额
     */
    private BigDecimal payableAmount;
    /**
     * 入库状态
     */
    private Integer receiptOrderStatus;
    /**
     * 仓库id
     */
    private Long warehouseId;
    /**
     * 库区id
     */
    private Long areaId;
    /**
     * 备注
     */
    private String remark;

}
