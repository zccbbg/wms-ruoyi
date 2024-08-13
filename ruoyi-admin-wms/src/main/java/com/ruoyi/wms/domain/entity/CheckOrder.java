package com.ruoyi.wms.domain.entity;

import com.baomidou.mybatisplus.annotation.*;
import lombok.Data;
import lombok.EqualsAndHashCode;
import com.ruoyi.common.mybatis.core.domain.BaseEntity;

import java.math.BigDecimal;

import java.io.Serial;

/**
 * 库存盘点单据对象 wms_check_order
 *
 * @author zcc
 * @date 2024-08-13
 */
@Data
@EqualsAndHashCode(callSuper = true)
@TableName("wms_check_order")
public class CheckOrder extends BaseEntity {

    @Serial
    private static final long serialVersionUID=1L;

    /**
     * 
     */
    @TableId(value = "id")
    private Long id;
    /**
     * 盘点单号
     */
    private String checkOrderNo;
    /**
     * 库存盘点单状态 -1：作废 0：未盘库 1：已盘库
     */
    private Integer checkOrderStatus;
    /**
     * 盈亏数
     */
    private BigDecimal checkOrderTotal;
    /**
     * 所属仓库
     */
    private Long warehouseId;
    /**
     * 所属库区
     */
    private Long areaId;
    /**
     * 备注
     */
    private String remark;

}
