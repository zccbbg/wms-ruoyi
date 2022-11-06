package com.cyl.wms.pojo.query;

import lombok.Data;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;

/**
 * 供应商 查询 对象
 *
 * @author zcc
 */
@ApiModel(description="供应商 查询 对象")
@Data
public class SupplierQuery {
    @ApiModelProperty("供应商编号 精确匹配")
    private String supplierNo;

    @ApiModelProperty("供应商名称 精确匹配")
    private String supplierNameLike;

    @ApiModelProperty("供应商地址 精确匹配")
    private String address;

    @ApiModelProperty("手机号 精确匹配")
    private String mobileNo;

    @ApiModelProperty("座机号 精确匹配")
    private String telNo;

    @ApiModelProperty("联系人 精确匹配")
    private String contact;

    @ApiModelProperty("级别 精确匹配")
    private String level;

    @ApiModelProperty("Email 精确匹配")
    private String email;

}
