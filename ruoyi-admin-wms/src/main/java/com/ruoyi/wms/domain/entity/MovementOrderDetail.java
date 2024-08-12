package com.ruoyi.wms.domain.entity;

import com.baomidou.mybatisplus.annotation.*;
import lombok.Data;
import lombok.EqualsAndHashCode;
import com.ruoyi.common.mybatis.core.domain.BaseEntity;

import java.math.BigDecimal;

import java.io.Serial;
import java.time.LocalDateTime;

/**
 * 库存移动详情对象 wms_movement_order_detail
 *
 * @author zcc
 * @date 2024-08-09
 */
@Data
@EqualsAndHashCode(callSuper = true)
@TableName("wms_movement_order_detail")
public class MovementOrderDetail extends BaseEntity {

    @Serial
    private static final long serialVersionUID=1L;

    /**
     *
     */
    @TableId(value = "id")
    private Long id;
    /**
     * 移库单Id
     */
    private Long movementOrderId;
    /**
     * 规格id
     */
    private Long skuId;
    /**
     * 数量
     */
    private BigDecimal quantity;
    /**
     * 备注
     */
    private String remark;
    /**
     * 源仓库
     */
    private Long sourceWarehouseId;
    /**
     * 源库区
     */
    private Long sourceAreaId;
    /**
     * 目标仓库
     */
    private Long targetWarehouseId;
    /**
     * 目标库区
     */
    private Long targetAreaId;
    /**
     * 批号
     */
    private String batchNo;
    /**
     * 生产日期
     */
    private LocalDateTime productionDate;
    /**
     * 过期时间
     */
    private LocalDateTime expirationDate;
    /**
     * 入库记录id
     */
    private Long inventoryDetailId;

}
