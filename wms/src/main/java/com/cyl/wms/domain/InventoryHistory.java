package com.cyl.wms.domain;

import java.math.BigDecimal;

import com.cyl.wms.pojo.vo.PlaceAndItem;
import com.ruoyi.common.annotation.Excel;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import com.ruoyi.common.core.domain.BaseAudit;
import lombok.Data;
import com.baomidou.mybatisplus.annotation.TableName;
/**
 * 库存记录对象 wms_inventory_history
 * 
 * @author zcc
 */
@ApiModel(description="库存记录对象")
@Data
@TableName("wms_inventory_history")
public class InventoryHistory extends BaseAudit implements PlaceAndItem {
    private static final long serialVersionUID = 1L;

    @ApiModelProperty("ID")
    private Long id;

    @ApiModelProperty("操作id（出库、入库、库存移动表单id）")
    @Excel(name = "操作id", readConverterExp = "出库、入库、库存移动表单id")
    private Long formId;

    @ApiModelProperty("操作类型")
    @Excel(name = "操作类型")
    private Integer formType;

    @ApiModelProperty("物料ID")
    @Excel(name = "物料ID")
    private Long itemId;

    @ApiModelProperty("所属仓库")
    @Excel(name = "所属仓库")
    private Long warehouseId;

    @ApiModelProperty("所属库区")
    @Excel(name = "所属库区")
    private Long areaId;

    @ApiModelProperty("货架id")
    @Excel(name = "货架id")
    private Long rackId;

    @ApiModelProperty("库存变化")
    @Excel(name = "库存变化")
    private BigDecimal quantity;

    @ApiModelProperty("备注")
    @Excel(name = "备注")
    private String remark;

    @ApiModelProperty("删除标识")
    private Integer delFlag;

}
