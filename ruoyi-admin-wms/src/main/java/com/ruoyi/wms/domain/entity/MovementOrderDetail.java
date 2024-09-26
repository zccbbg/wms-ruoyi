package com.ruoyi.wms.domain.entity;

import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * 库存移动详情对象 wms_movement_order_detail
 *
 * @author zcc
 * @date 2024-08-09
 */
@Data
@EqualsAndHashCode(callSuper = true)
@TableName("wms_movement_order_detail")
public class MovementOrderDetail extends BaseOrderDetail {

    /**
     * 源仓库
     */
    private Long sourceWarehouseId;
    /**
     * 目标仓库
     */
    private Long targetWarehouseId;

}
