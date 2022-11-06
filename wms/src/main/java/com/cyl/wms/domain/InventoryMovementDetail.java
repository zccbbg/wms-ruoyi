package com.cyl.wms.domain;

import java.math.BigDecimal;
import com.ruoyi.common.annotation.Excel;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import com.ruoyi.common.core.domain.BaseAudit;
import lombok.Data;
import com.baomidou.mybatisplus.annotation.TableName;
/**
 * 库存移动详情对象 wms_inventory_movement_detail
 * 
 * @author zcc
 */
@ApiModel(description="库存移动详情对象")
@Data
@TableName("wms_inventory_movement_detail")
public class InventoryMovementDetail extends BaseAudit {
    private static final long serialVersionUID = 1L;

    @ApiModelProperty("ID")
    private Long id;

    @ApiModelProperty("库存移动Id")
    @Excel(name = "库存移动Id")
    private Long inventoryMovementId;

    @ApiModelProperty("物料")
    @Excel(name = "物料")
    private Long itemId;

    @ApiModelProperty("计划数量")
    @Excel(name = "计划数量")
    private BigDecimal planQuantity;

    @ApiModelProperty("实际数量")
    @Excel(name = "实际数量")
    private BigDecimal realQuantity;

    @ApiModelProperty("删除标识")
    private Integer delFlag;

    @ApiModelProperty("备注")
    @Excel(name = "备注")
    private String remark;

    @ApiModelProperty("源货架")
    @Excel(name = "源货架")
    private Long sourceRackId;

    @ApiModelProperty("源仓库")
    @Excel(name = "源仓库")
    private Long sourceWarehouseId;

    @ApiModelProperty("源库区")
    @Excel(name = "源库区")
    private Long sourceAreaId;

    @ApiModelProperty("移库状态")
    @Excel(name = "移库状态")
    private Integer moveStatus;

    @ApiModelProperty("目标货架")
    @Excel(name = "目标货架")
    private Long targetRackId;

    @ApiModelProperty("目标仓库")
    @Excel(name = "目标仓库")
    private Long targetWarehouseId;

    @ApiModelProperty("目标库区")
    @Excel(name = "目标库区")
    private Long targetAreaId;

}
