package com.ruoyi.wms.domain.entity;

import com.baomidou.mybatisplus.annotation.TableId;
import com.ruoyi.common.mybatis.core.domain.BaseEntity;
import lombok.Data;
import lombok.EqualsAndHashCode;

import java.math.BigDecimal;

@Data
@EqualsAndHashCode(callSuper = true)
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
     * 备注
     */
    private String remark;

}
