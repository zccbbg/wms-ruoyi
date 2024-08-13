package com.ruoyi.wms.domain.bo;

import com.ruoyi.wms.domain.entity.CheckOrder;
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
 * 库存盘点单据业务对象 wms_check_order
 *
 * @author zcc
 * @date 2024-08-13
 */

@Data
@EqualsAndHashCode(callSuper = true)
@AutoMapper(target = CheckOrder.class, reverseConvertGenerate = false)
public class CheckOrderBo extends BaseEntity {

    /**
     *
     */
    @NotNull(message = "不能为空", groups = { EditGroup.class })
    private Long id;

    /**
     * 盘点单号
     */
    @NotBlank(message = "盘点单号不能为空", groups = { AddGroup.class, EditGroup.class })
    private String checkOrderNo;

    /**
     * 库存盘点单状态 -1：作废 0：未盘库 1：已盘库
     */
    private Integer checkOrderStatus;

    /**
     * 盈亏数
     */
    @NotNull(message = "盈亏数不能为空", groups = { AddGroup.class, EditGroup.class })
    private BigDecimal checkOrderTotal;

    /**
     * 所属仓库
     */
    @NotNull(message = "所属仓库不能为空", groups = { AddGroup.class, EditGroup.class })
    private Long warehouseId;

    /**
     * 所属库区
     */
    private Long areaId;

    /**
     * 备注
     */
    private String remark;

    private List<CheckOrderDetailBo> details;

}
