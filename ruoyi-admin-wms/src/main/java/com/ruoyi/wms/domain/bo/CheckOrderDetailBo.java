package com.ruoyi.wms.domain.bo;

import com.ruoyi.wms.domain.entity.CheckOrderDetail;
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
     * 所属库区
     */
    @NotNull(message = "所属库区不能为空", groups = { AddGroup.class, EditGroup.class })
    private Long areaId;
    /**
     * 批号
     */
    private String batchNo;

    /**
     * 生产日期
     */
    private LocalDateTime productionDate;

    /**
     * 过期日期
     */
    private LocalDateTime expirationDate;

    /**
     * 入库时间
     */
    private LocalDateTime receiptTime;

    /**
     * 入库记录id
     */
    @NotNull(message = "入库记录id不能为空", groups = { AddGroup.class, EditGroup.class })
    private Long inventoryDetailId;

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
