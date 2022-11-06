package com.cyl.wms.pojo.query;

import lombok.Data;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;

/**
 * 货架 查询 对象
 *
 * @author zcc
 */
@ApiModel(description="货架 查询 对象")
@Data
public class RackQuery {
    @ApiModelProperty("货架编号 精确匹配")
    private String rackNo;

    @ApiModelProperty("货架名称 精确匹配")
    private String rackNameLike;

    @ApiModelProperty("所属货区 精确匹配")
    private Long areaId;

    @ApiModelProperty("所属仓库 精确匹配")
    private Long warehouseId;

}
