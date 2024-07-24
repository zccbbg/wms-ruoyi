package com.ruoyi.wms.domain.entity;

import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.ruoyi.common.mybatis.core.domain.BaseEntity;
import lombok.Data;
import lombok.EqualsAndHashCode;

import java.io.Serial;
import java.math.BigDecimal;

/**
 * 库存记录对象 wms_inventory_history
 *
 * @author zcc
 * @date 2024-07-22
 */
@Data
@EqualsAndHashCode(callSuper = true)
@TableName("wms_inventory_history")
public class InventoryHistory extends BaseEntity {

    @Serial
    private static final long serialVersionUID=1L;

    /**
     *
     */
    @TableId(value = "id")
    private Long id;
    /**
     * 操作id（出库、入库、库存移动表单id）
     */
    private Long formId;
    /**
     * 操作类型
     */
    private Long formType;
    /**
     * 物料ID
     */
    private Long skuId;
    /**
     * 库存变化
     */
    private BigDecimal quantity;
    /**
     * 备注
     */
    private String remark;
    /**
     * 所属仓库
     */
    private Long warehouseId;
    /**
     * 所属库区
     */
    private Long areaId;

}
