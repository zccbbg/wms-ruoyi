package com.ruoyi.wms.domain.bo;

import com.ruoyi.wms.domain.entity.InventoryDetail;
import com.ruoyi.common.core.validate.AddGroup;
import com.ruoyi.common.core.validate.EditGroup;
import com.ruoyi.common.mybatis.core.domain.BaseEntity;
import lombok.Data;
import lombok.EqualsAndHashCode;
import jakarta.validation.constraints.*;
import io.github.linpeilie.annotations.AutoMapper;

import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;

/**
 * 库存详情业务对象 wms_inventory_detail
 *
 * @author zcc
 * @date 2024-07-22
 */

@Data
@EqualsAndHashCode(callSuper = true)
@AutoMapper(target = InventoryDetail.class, reverseConvertGenerate = false)
public class InventoryDetailBo extends BaseEntity {

    /**
     *
     */
    @NotNull(message = "不能为空", groups = { EditGroup.class })
    private Long id;

    /**
     * 入库单id
     */
    @NotNull(message = "入库单id不能为空", groups = { AddGroup.class, EditGroup.class })
    private Long receiptOrderId;

    /**
     * 入库单类型
     */
    @NotBlank(message = "入库单类型不能为空", groups = { AddGroup.class, EditGroup.class })
    private String receiptOrderType;

    /**
     * 单号
     */
    @NotBlank(message = "单号不能为空", groups = { AddGroup.class, EditGroup.class })
    private String orderNo;

    /**
     * 类型 1：入库 2：移库 3：盘库
     */
    @NotNull(message = "类型 1：入库 2：移库 3：盘库不能为空", groups = { AddGroup.class, EditGroup.class })
    private Integer type;

    /**
     * sku的ID
     */
    @NotNull(message = "sku的ID不能为空", groups = { AddGroup.class, EditGroup.class })
    private Long skuId;

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
     * 入库数量
     */
    @NotNull(message = "入库数量不能为空", groups = { AddGroup.class, EditGroup.class })
    private BigDecimal quantity;

    /**
     * 过期时间
     */
    @NotNull(message = "过期时间不能为空", groups = { AddGroup.class, EditGroup.class })
    private LocalDateTime expirationTime;

    /**
     * 金额
     */
    @NotNull(message = "金额不能为空", groups = { AddGroup.class, EditGroup.class })
    private BigDecimal amount;

    /**
     * 备注
     */
    @NotBlank(message = "备注不能为空", groups = { AddGroup.class, EditGroup.class })
    private String remark;

    /**
     * 剩余数量
     */
    @NotNull(message = "剩余数量不能为空", groups = { AddGroup.class, EditGroup.class })
    private BigDecimal remainQuantity;


}
