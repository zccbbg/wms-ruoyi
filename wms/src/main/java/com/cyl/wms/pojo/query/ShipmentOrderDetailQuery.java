package com.cyl.wms.pojo.query;

import java.math.BigDecimal;
import lombok.Data;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;

/**
 * 出库单详情 查询 对象
 *
 * @author zcc
 */
@ApiModel(description="出库单详情 查询 对象")
@Data
public class ShipmentOrderDetailQuery {
    @ApiModelProperty("出库单 精确匹配")
    private Long shipmentOrderId;

    @ApiModelProperty("物料 精确匹配")
    private Long itemId;

    @ApiModelProperty("计划数量 精确匹配")
    private BigDecimal planQuantity;

    @ApiModelProperty("实际数量 精确匹配")
    private BigDecimal realQuantity;

    @ApiModelProperty("货架 精确匹配")
    private Long rackId;

}
