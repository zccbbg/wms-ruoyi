package com.cyl.wms.domain;

import java.math.BigDecimal;
import com.ruoyi.common.annotation.Excel;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import com.ruoyi.common.core.domain.BaseAudit;
import lombok.Data;
import com.baomidou.mybatisplus.annotation.TableName;
/**
 * 库存盘点单据详情对象 wms_inventory_check_detail
 * 
 * @author zcc
 */
@ApiModel(description="库存盘点单据详情对象")
@Data
@TableName("wms_inventory_check_detail")
public class InventoryCheckDetail extends BaseAudit {
    private static final long serialVersionUID = 1L;

    @ApiModelProperty("ID")
    private Long id;

    @ApiModelProperty("库存盘点单")
    @Excel(name = "库存盘点单")
    private Long inventoryCheckId;

    @ApiModelProperty("物料")
    @Excel(name = "物料")
    private Long itemId;

    @ApiModelProperty("库存数量")
    @Excel(name = "库存数量")
    private BigDecimal quantity;

    @ApiModelProperty("盘点数量")
    @Excel(name = "盘点数量")
    private BigDecimal checkQuantity;

    @ApiModelProperty("所属仓库")
    @Excel(name = "所属仓库")
    private Long warehouseId;

    @ApiModelProperty("所属库区")
    @Excel(name = "所属库区")
    private Long areaId;

    @ApiModelProperty("货架")
    @Excel(name = "货架")
    private Long rackId;

    @ApiModelProperty("删除标识")
    private Integer delFlag;

    @ApiModelProperty("备注")
    @Excel(name = "备注")
    private String remark;

}
