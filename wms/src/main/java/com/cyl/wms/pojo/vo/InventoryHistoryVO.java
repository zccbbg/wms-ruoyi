package com.cyl.wms.pojo.vo;

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
    @Excel(name = "编号")
    private Long id;
    /**
     * 操作id（出库、入库、库存移动表单id）
     */
    private Long formId;
    /**
     * 操作类型
     */
    private Integer formType;
    /**
     * 操作类型名称
     */
    @Excel(name = "操作类型")
    private String formTypeName;
    /**
     * 物料ID
     */
    private Long itemId;
    @Excel(name = "物料名称")
    private String itemName;
    @Excel(name = "物料编码")
    private String itemNo;
    /**
     * 货架id
     */
    private Long rackId;
    private String rackName;
    private Long warehouseId;
    @Excel(name = "仓库名称")
    private String warehouseName;
    private Long areaId;

    @Excel(name = "库区名称")
    private String areaName;
    /**
     * 库存变化
     */
    @Excel(name = "库存变化")
    private BigDecimal quantity;
    /**
     * 备注
     */
    @Excel(name = "备注")
    private String remark;

    private String itemUnit;
    private String itemUnitPrice;
    private String itemSpecification;
    private String itemFactory;
    /**
     * 客户或供应商姓名
     */
    private String name;
    /**
     * 出入库单号
     */
    private String orderId;

    private String receiptOrderNo;
    private String shipmentOrderNo;
    private String customerName;
    private String supplierName;
}
