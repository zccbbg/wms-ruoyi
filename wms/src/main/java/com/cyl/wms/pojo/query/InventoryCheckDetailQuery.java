package com.cyl.wms.pojo.query;

import java.math.BigDecimal;
import lombok.Data;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;

/**
 * 库存盘点单据详情 查询 对象
 *
 * @author zcc
 */
@ApiModel(description="库存盘点单据详情 查询 对象")
@Data
public class InventoryCheckDetailQuery {
    @ApiModelProperty("库存盘点单 精确匹配")
    private Long inventoryCheckId;

    @ApiModelProperty("物料 精确匹配")
    private Long itemId;

    @ApiModelProperty("库存数量 精确匹配")
    private BigDecimal quantity;

    @ApiModelProperty("盘点数量 精确匹配")
    private BigDecimal checkQuantity;

    @ApiModelProperty("所属仓库 精确匹配")
    private Long warehouseId;

    @ApiModelProperty("所属库区 精确匹配")
    private Long areaId;

    @ApiModelProperty("货架 精确匹配")
    private Long rackId;

}
