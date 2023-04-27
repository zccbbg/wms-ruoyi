package com.cyl.wms.pojo.query;

import lombok.Data;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;

/**
 * 物料类型表 查询 对象
 *
 * @author zcc
 */
@ApiModel(description="物料类型表 查询 对象")
@Data
public class ItemTypeQuery {
    @ApiModelProperty("父物料类型id 精确匹配")
    private Long parentId;

    @ApiModelProperty("祖级列表 精确匹配")
    private String ancestors;

    @ApiModelProperty("物料类型名称 精确匹配")
    private String typeNameLike;

    @ApiModelProperty("显示顺序 精确匹配")
    private Integer orderNum;

    @ApiModelProperty("物料类型状态（0正常 1停用） 精确匹配")
    private String status;

}
