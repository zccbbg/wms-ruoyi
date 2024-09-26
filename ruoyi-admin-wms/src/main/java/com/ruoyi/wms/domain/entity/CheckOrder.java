package com.ruoyi.wms.domain.entity;

import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * 库存盘点单据对象 wms_check_order
 *
 * @author zcc
 * @date 2024-08-13
 */
@Data
@EqualsAndHashCode(callSuper = true)
@TableName("wms_check_order")
public class CheckOrder extends BaseOrder {

    /**
     * 仓库id
     */
    private Long warehouseId;

}
