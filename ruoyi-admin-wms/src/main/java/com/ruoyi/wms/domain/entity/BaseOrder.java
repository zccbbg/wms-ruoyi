package com.ruoyi.wms.domain.entity;

import com.baomidou.mybatisplus.annotation.TableId;
import com.ruoyi.common.mybatis.core.domain.BaseEntity;
import lombok.Data;

import java.math.BigDecimal;

@Data
public class BaseOrder extends BaseEntity {

    /**
     *
     */
    @TableId(value = "id")
    private Long id;
    /**
     * 入库单号
     */
    private String orderNo;
    /**
     * 入库类型
     */
    private Long orderType;
    /**
     * 供应商
     */
    private Long merchantId;
    /**
     * 业务订单号
     */
    private String bizOrderNo;
    /**
     * 商品总数
     */
    private BigDecimal totalQuantity;
    /**
     * 订单总金额
     */
    private BigDecimal totalAmount;
    /**
     * 订单状态
     */
    private Integer orderStatus;
    /**
     * 仓库id
     */
    private Long warehouseId;
    /**
     * 备注
     */
    private String remark;

}
