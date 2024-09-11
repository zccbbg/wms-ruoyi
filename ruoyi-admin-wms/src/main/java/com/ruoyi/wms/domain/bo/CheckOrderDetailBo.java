package com.ruoyi.wms.domain.bo;

import com.ruoyi.common.core.validate.AddGroup;
import com.ruoyi.common.core.validate.EditGroup;
import com.ruoyi.common.mybatis.core.domain.BaseEntity;
import com.ruoyi.wms.domain.entity.CheckOrderDetail;
import io.github.linpeilie.annotations.AutoMapper;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import lombok.Data;
import lombok.EqualsAndHashCode;

import java.math.BigDecimal;

/**
 * 库存盘点单据详情业务对象 wms_check_order_detail
 *
 * @author zcc
 * @date 2024-08-13
 */

@Data
@EqualsAndHashCode(callSuper = true)
@AutoMapper(target = CheckOrderDetail.class, reverseConvertGenerate = false)
public class CheckOrderDetailBo extends BaseEntity {

    /**
     *
     */
    @NotNull(message = "不能为空", groups = { EditGroup.class })
    private Long id;

    /**
     * 盘点单id
     */
    @NotNull(message = "盘点单id不能为空", groups = { AddGroup.class, EditGroup.class })
    private Long checkOrderId;

    /**
     * 规格id
     */
    @NotNull(message = "规格id不能为空", groups = { AddGroup.class, EditGroup.class })
    private Long skuId;

    /**
     * 库存数量
     */
    @NotNull(message = "库存数量不能为空", groups = { AddGroup.class, EditGroup.class })
    private BigDecimal quantity;

    /**
     * 盘点数量
     */
    @NotNull(message = "盘点数量不能为空", groups = { AddGroup.class, EditGroup.class })
    private BigDecimal checkQuantity;

    /**
     * 盈亏数
     */
    private BigDecimal profitAndLoss;

    /**
     * 所属仓库
     */
    @NotNull(message = "所属仓库不能为空", groups = { AddGroup.class, EditGroup.class })
    private Long warehouseId;

    /**
     * 备注
     */
    @NotBlank(message = "备注不能为空", groups = { AddGroup.class, EditGroup.class })
    private String remark;

    /**
     * 有盈亏
     */
    private Boolean haveProfitAndLoss;
}
