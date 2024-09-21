package com.ruoyi.wms.domain.entity;

import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.ruoyi.common.mybatis.core.domain.BaseEntity;
import lombok.Data;
import lombok.EqualsAndHashCode;

import java.io.Serial;
import java.math.BigDecimal;

/**
 * 库存盘点单据详情对象 wms_check_order_detail
 *
 * @author zcc
 * @date 2024-08-13
 */
@Data
@EqualsAndHashCode(callSuper = true)
@TableName("wms_check_order_detail")
public class CheckOrderDetail extends BaseEntity {

    @Serial
    private static final long serialVersionUID=1L;

    /**
     *
     */
    @TableId(value = "id")
    private Long id;
    /**
     * 盘点单id
     */
    private Long checkOrderId;
    /**
     * 规格id
     */
    private Long skuId;
    /**
     * 库存id
     */
    private Long inventoryId;
    /**
     * 库存数量
     */
    private BigDecimal quantity;
    /**
     * 盘点数量
     */
    private BigDecimal checkQuantity;
    /**
     * 所属仓库
     */
    private Long warehouseId;
    /**
     * 备注
     */
    private String remark;

}
