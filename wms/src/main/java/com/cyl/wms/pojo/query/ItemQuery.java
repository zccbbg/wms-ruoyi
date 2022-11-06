package com.cyl.wms.pojo.query;

import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.util.List;

import lombok.Data;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;

/**
 * 物料 查询 对象
 *
 * @author zcc
 */
@ApiModel(description="物料 查询 对象")
@Data
public class ItemQuery {
    @ApiModelProperty("搜索内容")
    private String search;
    private List<Long> ids;
    @ApiModelProperty("编号 精确匹配")
    private String itemNo;

    @ApiModelProperty("名称 精确匹配")
    private String itemNameLike;

    @ApiModelProperty("分类 精确匹配")
    private String itemType;

    @ApiModelProperty("单位类别 精确匹配")
    private String unit;

    @ApiModelProperty("所属货架 精确匹配")
    private Long rackId;

    @ApiModelProperty("所属库区 精确匹配")
    private Long areaId;

    @ApiModelProperty("所属仓库 精确匹配")
    private Long warehouseId;

    @ApiModelProperty("安全库存 精确匹配")
    private BigDecimal quantity;

    @ApiModelProperty("有效期 精确匹配")
    private LocalDateTime expiryDate;

}
