package com.cyl.wms.domain.vo;

import java.math.BigDecimal;
import java.util.List;

import com.ruoyi.common.annotation.Excel;
import com.fasterxml.jackson.annotation.JsonFormat;
import com.ruoyi.common.core.domain.BaseAudit;
import lombok.Data;
/**
 * 库存盘点单据详情 数据视图对象
 * 
 * @author zcc
 */
@Data
public class InventoryCheckDetailVO extends BaseAudit {
   /** ID */
    private Long id;
   /** 库存盘点单 */
    @Excel(name = "库存盘点单")
    private Long inventoryCheckId;
   /** 物料 */
    @Excel(name = "物料")
    private Long itemId;
   /** 库存数量 */
    @Excel(name = "库存数量")
    private BigDecimal quantity;
   /** 盘点数量 */
    @Excel(name = "盘点数量")
    private BigDecimal checkQuantity;
   /** 所属仓库 */
    @Excel(name = "所属仓库")
    private Long warehouseId;
   /** 所属库区 */
    @Excel(name = "所属库区")
    private Long areaId;
   /** 货架 */
    @Excel(name = "货架")
    private Long rackId;
   /** 备注 */
    @Excel(name = "备注")
    private String remark;
    private List<Long> place;
}
