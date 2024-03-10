package com.cyl.wms.domain.query;

import lombok.Data;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;

/**
 * 货区 查询 对象
 *
 * @author zcc
 */
@ApiModel(description="货区 查询 对象")
@Data
public class AreaQuery {
    @ApiModelProperty("货区编号 精确匹配")
    private String areaNo;

    @ApiModelProperty("货区名称 精确匹配")
    private String areaNameLike;

    @ApiModelProperty("所属仓库ID 精确匹配")
    private Long warehouseId;

}
