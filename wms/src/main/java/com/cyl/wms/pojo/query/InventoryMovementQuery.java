package com.cyl.wms.pojo.query;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

/**
 * 库存移动 查询 对象
 *
 * @author zcc
 */
@ApiModel(description="库存移动 查询 对象")
@Data
public class InventoryMovementQuery {
    @ApiModelProperty("库存移动编号 精确匹配")
    private String inventoryMovementNo;

    @ApiModelProperty("状态 精确匹配")
    private Integer status;

}
