package com.cyl.wms.pojo.query;

import lombok.Data;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;

/**
 * 客户 查询 对象
 *
 * @author zcc
 */
@ApiModel(description="客户 查询 对象")
@Data
public class CustomerQuery {
    @ApiModelProperty("客户编号 精确匹配")
    private String customerNo;

    @ApiModelProperty("客户名称 精确匹配")
    private String customerNameLike;

    @ApiModelProperty("客户地址 精确匹配")
    private String address;

    @ApiModelProperty("手机号 精确匹配")
    private String mobile;

    @ApiModelProperty("座机号 精确匹配")
    private String tel;

    @ApiModelProperty("联系人 精确匹配")
    private String customerPerson;

    @ApiModelProperty("级别 精确匹配")
    private String customerLevel;

    @ApiModelProperty("Email 精确匹配")
    private String email;

}
