package com.cyl.wms.pojo.query;

import java.math.BigDecimal;
import lombok.Data;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;

/**
 * 库存移动详情 查询 对象
 *
 * @author zcc
 */
@ApiModel(description="库存移动详情 查询 对象")
@Data
public class InventoryMovementDetailQuery {
    @ApiModelProperty("库存移动Id 精确匹配")
    private Long inventoryMovementId;

    @ApiModelProperty("物料 精确匹配")
    private Long itemId;

    @ApiModelProperty("计划数量 精确匹配")
    private BigDecimal planQuantity;

    @ApiModelProperty("实际数量 精确匹配")
    private BigDecimal realQuantity;

    @ApiModelProperty("源货架 精确匹配")
    private Long sourceRackId;

    @ApiModelProperty("源仓库 精确匹配")
    private Long sourceWarehouseId;

    @ApiModelProperty("源库区 精确匹配")
    private Long sourceAreaId;

    @ApiModelProperty("移库状态 精确匹配")
    private Integer moveStatus;

    @ApiModelProperty("目标货架 精确匹配")
    private Long targetRackId;

    @ApiModelProperty("目标仓库 精确匹配")
    private Long targetWarehouseId;

    @ApiModelProperty("目标库区 精确匹配")
    private Long targetAreaId;

}
