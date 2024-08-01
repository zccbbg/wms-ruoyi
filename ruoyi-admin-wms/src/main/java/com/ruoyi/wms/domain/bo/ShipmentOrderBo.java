package com.ruoyi.wms.domain.bo;

import com.ruoyi.wms.domain.entity.ShipmentOrder;
import com.ruoyi.common.core.validate.AddGroup;
import com.ruoyi.common.core.validate.EditGroup;
import com.ruoyi.common.mybatis.core.domain.BaseEntity;
import lombok.Data;
import lombok.EqualsAndHashCode;
import jakarta.validation.constraints.*;
import io.github.linpeilie.annotations.AutoMapper;

import java.math.BigDecimal;

/**
 * 出库单业务对象 wms_shipment_order
 *
 * @author zcc
 * @date 2024-08-01
 */

@Data
@EqualsAndHashCode(callSuper = true)
@AutoMapper(target = ShipmentOrder.class, reverseConvertGenerate = false)
public class ShipmentOrderBo extends BaseEntity {

    /**
     * 
     */
    @NotNull(message = "不能为空", groups = { EditGroup.class })
    private Long id;

    /**
     * 出库单号，系统自动生成
     */
    @NotBlank(message = "出库单号，系统自动生成不能为空", groups = { AddGroup.class, EditGroup.class })
    private String shipmentOrderNo;

    /**
     * 出库类型
     */
    @NotNull(message = "出库类型不能为空", groups = { AddGroup.class, EditGroup.class })
    private Long shipmentOrderType;

    /**
     * 出库订单
     */
    @NotBlank(message = "出库订单不能为空", groups = { AddGroup.class, EditGroup.class })
    private String orderNo;

    /**
     * 客户
     */
    @NotNull(message = "客户不能为空", groups = { AddGroup.class, EditGroup.class })
    private Long merchantId;

    /**
     * 订单金额
     */
    @NotNull(message = "订单金额不能为空", groups = { AddGroup.class, EditGroup.class })
    private BigDecimal receivableAmount;

    /**
     * 出库数量
     */
    @NotNull(message = "出库数量不能为空", groups = { AddGroup.class, EditGroup.class })
    private BigDecimal totalQuantity;

    /**
     * 出库单状态
     */
    @NotNull(message = "出库单状态不能为空", groups = { AddGroup.class, EditGroup.class })
    private Integer shipmentOrderStatus;

    /**
     * 备注
     */
    @NotBlank(message = "备注不能为空", groups = { AddGroup.class, EditGroup.class })
    private String remark;


}
