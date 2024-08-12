package com.ruoyi.wms.domain.bo;

import com.ruoyi.common.mybatis.core.domain.PlaceAndItem;
import com.ruoyi.wms.domain.entity.MovementOrderDetail;
import com.ruoyi.common.core.validate.AddGroup;
import com.ruoyi.common.core.validate.EditGroup;
import com.ruoyi.common.mybatis.core.domain.BaseEntity;
import lombok.Data;
import lombok.EqualsAndHashCode;
import jakarta.validation.constraints.*;
import io.github.linpeilie.annotations.AutoMapper;

import java.math.BigDecimal;
import java.time.LocalDateTime;

/**
 * 库存移动详情业务对象 wms_movement_order_detail
 *
 * @author zcc
 * @date 2024-08-09
 */

@Data
@EqualsAndHashCode(callSuper = true)
@AutoMapper(target = MovementOrderDetail.class, reverseConvertGenerate = false)
public class MovementOrderDetailBo extends BaseEntity implements PlaceAndItem {

    /**
     *
     */
    @NotNull(message = "不能为空", groups = { EditGroup.class })
    private Long id;

    /**
     * 移库单Id
     */
    @NotNull(message = "移库单Id不能为空", groups = { AddGroup.class, EditGroup.class })
    private Long movementOrderId;

    /**
     * 规格id
     */
    @NotNull(message = "规格id不能为空", groups = { AddGroup.class, EditGroup.class })
    private Long skuId;

    /**
     * 数量
     */
    @NotNull(message = "数量不能为空", groups = { AddGroup.class, EditGroup.class })
    private BigDecimal quantity;

    /**
     * 备注
     */
    @NotBlank(message = "备注不能为空", groups = { AddGroup.class, EditGroup.class })
    private String remark;

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
     * 源仓库
     */
    @NotNull(message = "源仓库不能为空", groups = { AddGroup.class, EditGroup.class })
    private Long sourceWarehouseId;

    /**
     * 源库区
     */
    @NotNull(message = "源库区不能为空", groups = { AddGroup.class, EditGroup.class })
    private Long sourceAreaId;

    /**
     * 目标仓库
     */
    @NotNull(message = "目标仓库不能为空", groups = { AddGroup.class, EditGroup.class })
    private Long targetWarehouseId;

    /**
     * 目标库区
     */
    @NotNull(message = "目标库区不能为空", groups = { AddGroup.class, EditGroup.class })
    private Long targetAreaId;

    /**
     * 入库记录id
     */
    @NotNull(message = "入库记录id不能为空", groups = { AddGroup.class, EditGroup.class })
    private Long inventoryDetailId;


    @Override
    public Long getWarehouseId() {
        return this.getSourceWarehouseId();
    }

    @Override
    public Long getAreaId() {
        return this.getSourceAreaId();
    }
}
