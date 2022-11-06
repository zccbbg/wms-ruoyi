package com.cyl.wms.pojo.query;

import java.time.LocalDateTime;
import lombok.Data;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;

/**
 * 发货记录 查询 对象
 *
 * @author zcc
 */
@ApiModel(description="发货记录 查询 对象")
@Data
public class DeliveryQuery {
    @ApiModelProperty("出库单主表Id 精确匹配")
    private Long shipmentOrderId;

    @ApiModelProperty("承运商Id 精确匹配")
    private Long carrierId;

    @ApiModelProperty("发货日期 精确匹配")
    private LocalDateTime deliveryDate;

    @ApiModelProperty("快递单号 精确匹配")
    private String trackingNo;

}
