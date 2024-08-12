package com.ruoyi.wms.domain.bo;

import com.ruoyi.wms.domain.entity.MovementOrder;
import com.ruoyi.common.core.validate.AddGroup;
import com.ruoyi.common.core.validate.EditGroup;
import com.ruoyi.common.mybatis.core.domain.BaseEntity;
import lombok.Data;
import lombok.EqualsAndHashCode;
import jakarta.validation.constraints.*;
import io.github.linpeilie.annotations.AutoMapper;

import java.math.BigDecimal;
import java.util.List;

/**
 * 移库单业务对象 wms_movement_order
 *
 * @author zcc
 * @date 2024-08-09
 */

@Data
@EqualsAndHashCode(callSuper = true)
@AutoMapper(target = MovementOrder.class, reverseConvertGenerate = false)
public class MovementOrderBo extends BaseEntity {

    /**
     *
     */
    @NotNull(message = "不能为空", groups = { EditGroup.class })
    private Long id;

    /**
     * 移库单号
     */
    @NotBlank(message = "移库单号不能为空", groups = { AddGroup.class, EditGroup.class })
    private String movementOrderNo;

    /**
     * 源仓库
     */
    @NotNull(message = "源仓库不能为空", groups = { AddGroup.class, EditGroup.class })
    private Long sourceWarehouseId;

    /**
     * 源库区
     */
    private Long sourceAreaId;

    /**
     * 目标仓库
     */
    @NotNull(message = "目标仓库不能为空", groups = { AddGroup.class, EditGroup.class })
    private Long targetWarehouseId;

    /**
     * 目标库区
     */
    private Long targetAreaId;

    /**
     * 状态
     */
    private Integer movementOrderStatus;

    /**
     * 总数量
     */
    private BigDecimal totalQuantity;

    /**
     * 备注
     */
    private String remark;

    List<MovementOrderDetailBo> details;

}
