package com.cyl.wms.domain;

import com.ruoyi.common.annotation.Excel;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import com.ruoyi.common.core.domain.BaseAudit;
import lombok.Data;
import com.baomidou.mybatisplus.annotation.TableName;
/**
 * 供应商对象 wms_supplier
 * 
 * @author zcc
 */
@ApiModel(description="供应商对象")
@Data
@TableName("wms_supplier")
public class Supplier extends BaseAudit {
    private static final long serialVersionUID = 1L;

    @ApiModelProperty("ID")
    private Long id;

    @ApiModelProperty("供应商编号")
    @Excel(name = "供应商编号")
    private String supplierNo;

    @ApiModelProperty("供应商名称")
    @Excel(name = "供应商名称")
    private String supplierName;

    @ApiModelProperty("供应商地址")
    @Excel(name = "供应商地址")
    private String address;

    @ApiModelProperty("手机号")
    @Excel(name = "手机号")
    private String mobileNo;

    @ApiModelProperty("座机号")
    @Excel(name = "座机号")
    private String telNo;

    @ApiModelProperty("联系人")
    @Excel(name = "联系人")
    private String contact;

    @ApiModelProperty("级别")
    @Excel(name = "级别")
    private String level;

    @ApiModelProperty("Email")
    @Excel(name = "Email")
    private String email;

    @ApiModelProperty("备注")
    @Excel(name = "备注")
    private String remark;

    @ApiModelProperty("删除标识")
    private Integer delFlag;

}
