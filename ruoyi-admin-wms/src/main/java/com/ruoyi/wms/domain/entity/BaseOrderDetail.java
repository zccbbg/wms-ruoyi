package com.ruoyi.wms.domain.entity;

import com.baomidou.mybatisplus.annotation.TableId;
import com.ruoyi.common.mybatis.core.domain.BaseEntity;
import lombok.Data;
import lombok.EqualsAndHashCode;

import java.math.BigDecimal;

@Data
@EqualsAndHashCode(callSuper=true)
public class BaseOrderDetail extends BaseEntity {
    /**
     *
     */
    @TableId(value = "id")
    private Long id;
    /**
     * 入库单号
     */
    private Long orderId;
    /**
     * 规格id
     */
    private Long skuId;
    /**
     * 入库数量
     */
    private BigDecimal quantity;
    /**
     * 金额
     */
    private BigDecimal amount;
    /**
     * 备注
     */
    private String remark;
}
