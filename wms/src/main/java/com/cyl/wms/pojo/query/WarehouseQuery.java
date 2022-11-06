package com.cyl.wms.pojo.query;

import lombok.Data;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;

/**
 * 仓库 查询 对象
 *
 * @author zcc
 */
@ApiModel(description="仓库 查询 对象")
@Data
public class WarehouseQuery {
    @ApiModelProperty("仓库编号 精确匹配")
    private String warehouseNo;

    @ApiModelProperty("仓库名称 精确匹配")
    private String warehouseNameLike;

}
