package com.cyl.wms.domain;

import com.ruoyi.common.annotation.Excel;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import com.ruoyi.common.core.domain.BaseAudit;
import lombok.Data;
import com.baomidou.mybatisplus.annotation.TableName;
/**
 * 入库单对象 wms_receipt_order
 * 
 * @author zcc
 */
@ApiModel(description="入库单对象")
@Data
@TableName("wms_receipt_order")
public class ReceiptOrder extends BaseAudit {
    private static final long serialVersionUID = 1L;

    @ApiModelProperty("ID")
    private Long id;

    @ApiModelProperty("入库单号")
    @Excel(name = "入库单号")
    private String receiptOrderNo;

    @ApiModelProperty("入库类型")
    @Excel(name = "入库类型")
    private Integer receiptOrderType;

    @ApiModelProperty("供应商")
    @Excel(name = "供应商")
    private Long supplierId;

    @ApiModelProperty("订单号")
    @Excel(name = "订单号")
    private String orderNo;

    @ApiModelProperty("入库状态")
    @Excel(name = "入库状态")
    private Integer receiptOrderStatus;

    @ApiModelProperty("备注")
    @Excel(name = "备注")
    private String remark;

    @ApiModelProperty("删除标识")
    private Integer delFlag;

}
