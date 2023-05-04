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
 * 供应商账户流水对象 wms_supplier_transaction
 * 
 * @author zcc
 */
@ApiModel(description="供应商账户流水对象")
@Data
@TableName("wms_supplier_transaction")
public class SupplierTransaction {
    public static String ENTER = "11";
    public static String EXIT = "22";
    public static String RECEIPT = "33";
    private static final long serialVersionUID = 1L;

    private int id;

    @ApiModelProperty("交易编号")
    @Excel(name = "交易编号")
    private String transactionCode;

    @ApiModelProperty("供应商编号")
    @Excel(name = "供应商编号")
    private String supplierId;

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

    @ApiModelProperty("入库单号")
    @Excel(name = "入库单号")
    private int receiptOrderId;

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
