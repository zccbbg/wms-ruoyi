package com.cyl.wms.pojo.vo;

import java.math.BigDecimal;
import java.util.List;

import com.ruoyi.common.annotation.Excel;
import com.fasterxml.jackson.annotation.JsonFormat;
import com.ruoyi.common.core.domain.BaseAudit;
import lombok.Data;
/**
 * 入库单详情 数据视图对象
 * 
 * @author zcc
 */
@Data
public class ReceiptOrderDetailVO extends BaseAudit {
   /** ID */
    private Long id;
   /** 入库单号 */
    @Excel(name = "入库单号")
    private Long receiptOrderId;
   /** 物料 */
    @Excel(name = "物料")
    private Long itemId;
   /** 计划数量 */
    @Excel(name = "计划数量")
    private BigDecimal planQuantity;
   /** 实际数量 */
    @Excel(name = "实际数量")
    private BigDecimal realQuantity;
   /** 所属货架 */
    @Excel(name = "所属货架")
    private Long rackId;
   /** 备注 */
    @Excel(name = "备注")
    private String remark;
   /** 所属仓库 */
    @Excel(name = "所属仓库")
    private Long warehouseId;
   /** 所属库区 */
    @Excel(name = "所属库区")
    private Long areaId;
   /** 入库状态 */
    @Excel(name = "入库状态")
    private Integer receiptOrderStatus;
    private Integer delFlag;
    private List<Long> place;
}
