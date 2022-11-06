package com.cyl.wms.pojo.query;

import java.time.LocalDateTime;
import lombok.Data;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;

/**
 * 出库单 查询 对象
 *
 * @author zcc
 */
@ApiModel(description="出库单 查询 对象")
@Data
public class ShipmentOrderQuery {
    @ApiModelProperty("出库单号，系统自动生成 精确匹配")
    private String shipmentOrderNo;

    @ApiModelProperty("出库类型 精确匹配")
    private Integer shipmentOrderType;

    @ApiModelProperty("出库订单 精确匹配")
    private String orderNo;

    @ApiModelProperty("客户 精确匹配")
    private Long customerId;

    @ApiModelProperty("出库单状态 精确匹配")
    private Integer shipmentOrderStatus;

}
