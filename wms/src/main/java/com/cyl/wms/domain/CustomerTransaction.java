package com.cyl.wms.domain;

import java.math.BigDecimal;
import java.time.LocalDateTime;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.ruoyi.common.annotation.Excel;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import com.baomidou.mybatisplus.annotation.TableName;
/**
 * 客户账户流水对象 wms_customer_transaction
 * 
 * @author zcc
 */
@ApiModel(description="客户账户流水对象")
@Data
@TableName("wms_customer_transaction")
public class CustomerTransaction {
    public static String ENTER = "11";
    public static String EXIT = "22";
    public static String SHIPMENT = "33";
    private static final long serialVersionUID = 1L;

    @ApiModelProperty("id")
    private Integer id;

    @ApiModelProperty("交易编号")
    @Excel(name = "交易编号")
    private String transactionCode;

    @ApiModelProperty("用户编号")
    @Excel(name = "用户编号")
    private String customerId;

    @ApiModelProperty("交易类型  1：结款  2：应付 ")
    @Excel(name = "交易类型  1：结款  2：应付 ")
    private String transactionType;

    @ApiModelProperty("交易金额")
    @Excel(name = "交易金额")
    private BigDecimal transactionAmount;

    @ApiModelProperty("上期余额")
    @Excel(name = "上期余额")
    private BigDecimal previousBalance;

    @ApiModelProperty("当前余额")
    @Excel(name = "当前余额")
    private BigDecimal currentBalance;

    @ApiModelProperty("出库单号")
    @Excel(name = "出库单号")
    private int shipmentOrderId;

    @ApiModelProperty("备注")
    @Excel(name = "备注")
    private String remark;

    @ApiModelProperty("删除标志")
    private Integer delFlag;

    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @ApiModelProperty("创建时间")
    private LocalDateTime createTime;

    @ApiModelProperty("更新时间")
    private LocalDateTime updateTime;

}
