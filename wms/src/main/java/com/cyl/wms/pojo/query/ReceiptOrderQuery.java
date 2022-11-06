package com.cyl.wms.pojo.query;

import lombok.Data;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;

/**
 * 入库单 查询 对象
 *
 * @author zcc
 */
@ApiModel(description="入库单 查询 对象")
@Data
public class ReceiptOrderQuery {
    @ApiModelProperty("入库单号 精确匹配")
    private String receiptOrderNo;

    @ApiModelProperty("入库类型 精确匹配")
    private Integer receiptOrderType;

    @ApiModelProperty("供应商 精确匹配")
    private Long supplierId;

    @ApiModelProperty("订单号 精确匹配")
    private String orderNo;

    @ApiModelProperty("入库状态 精确匹配")
    private Integer receiptOrderStatus;

}
