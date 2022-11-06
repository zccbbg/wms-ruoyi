package com.cyl.wms.pojo.query;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import java.math.BigDecimal;

/**
 * 库存 查询 对象
 *
 * @author zcc
 */
@ApiModel(description = "库存 查询 对象")
@Data
public class InventoryQuery {
    @ApiModelProperty("物料ID 精确匹配")
    private Long itemId;

    @ApiModelProperty("货架id 精确匹配")
    private Long warehouseId;

    @ApiModelProperty("区 id")
    private Long areaId;

    @ApiModelProperty("货架 id")
    private Long rackId;

    @ApiModelProperty("库存 起始值")
    private BigDecimal quantityStart;
    @ApiModelProperty("库存 结束值")
    private BigDecimal quantityEnd;

}
