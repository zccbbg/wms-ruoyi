package com.cyl.wms.pojo.vo;

import java.math.BigDecimal;
import com.ruoyi.common.annotation.Excel;
import com.fasterxml.jackson.annotation.JsonFormat;
import com.ruoyi.common.core.domain.BaseAudit;
import lombok.Data;
/**
 * 库存 数据视图对象
 *
 * @author zcc
 */
@Data
public class InventoryVO extends BaseAudit implements AreaAndItemInfo {
   /** ID */
    private Long id;
   /** 物料ID */
    @Excel(name = "物料ID")
    private Long itemId;
    // 物料名称
    private String itemName;
    // 物料编号
    private String itemNo;

   /** 货架id */
    @Excel(name = "货架id")
    private Long rackId;
    // 货架 名称
    private String rackName;
    @Excel(name = "仓库id")
    private Long warehouseId;
    // 仓库 名称
    private String warehouseName;
    @Excel(name = "库区id")
    private Long areaId;
    // 库区 名称
    private String areaName;
   /** 库存 */
    @Excel(name = "库存")
    private BigDecimal quantity;
   /** 备注 */
    @Excel(name = "备注")
    private String remark;
}
