package com.cyl.wms.pojo.vo;

import com.cyl.wms.handler.DictDealHandler;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseAudit;
import lombok.Data;

import java.math.BigDecimal;

/**
 * 库存记录 数据视图对象
 *
 * @author zcc
 */
@Data
public class InventoryHistoryVO extends BaseAudit implements AreaAndItemInfo {
    /**
     * ID
     */
    @Excel(name = "编号" )
    private Long id;
    /**
     * 操作id（出库、入库、库存移动表单id）
     */
    @Excel(name = "操作id" , readConverterExp = "出库、入库、库存移动表单id" )
    private Long formId;
    /**
     * 操作类型
     */
    @Excel(name = "操作类型", handler = DictDealHandler.class, args = {"wms_receipt_type", "wms_shipment_type", "wms_movement_type"})
    private Integer formType;
    /**
     * 物料ID
     */
    @Excel(name = "物料ID" )
    private Long itemId;
    @Excel(name = "物料名称" )
    private String itemName;
    @Excel(name = "物料编码" )
    private String itemNo;
    /**
     * 货架id
     */
    @Excel(name = "货架id" )
    private Long rackId;
    @Excel(name = "货架名称" )
    private String rackName;
    @Excel(name = "仓库id" )
    private Long warehouseId;
    @Excel(name = "仓库名称" )
    private String warehouseName;
    @Excel(name = "库区id" )
    private Long areaId;

    @Excel(name = "库区名称" )
    private String areaName;
    /**
     * 库存变化
     */
    @Excel(name = "库存变化" )
    private BigDecimal quantity;
    /**
     * 备注
     */
    @Excel(name = "备注" )
    private String remark;
}
