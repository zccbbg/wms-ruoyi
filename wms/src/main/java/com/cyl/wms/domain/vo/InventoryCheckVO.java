package com.cyl.wms.domain.vo;

import java.math.BigDecimal;
import java.time.LocalDateTime;
import com.ruoyi.common.annotation.Excel;
import com.fasterxml.jackson.annotation.JsonFormat;
import com.ruoyi.common.core.domain.BaseAudit;
import lombok.Data;
/**
 * 库存盘点单据 数据视图对象
 * 
 * @author zcc
 */
@Data
public class InventoryCheckVO extends BaseAudit {
   /** ID */
    private Long id;
   /** 库存盘点单号，系统自动生成 */
    @Excel(name = "库存盘点单号，系统自动生成")
    private String inventoryCheckNo;
   /** 库存盘点类型 */
    @Excel(name = "库存盘点类型")
    private Integer inventoryCheckType;
   /** 库存盘点单状态11：盘点中 22：已完成 */
    @Excel(name = "库存盘点单状态11：盘点中 22：已完成")
    private Integer inventoryCheckStatus;
   /** 盈亏数 */
    @Excel(name = "盈亏数")
    private BigDecimal inventoryCheckTotal;
   /** 审核状态 */
    @Excel(name = "审核状态")
    private Integer checkStatus;
   /** 审核人 */
    @Excel(name = "审核人")
    private Long checkUserId;
   /** 审核时间 */
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @Excel(name = "审核时间", width = 30, dateFormat = "yyyy-MM-dd HH:mm:ss")
    private LocalDateTime checkTime;
   /** 所属仓库 */
    @Excel(name = "所属仓库")
    private Long warehouseId;
   /** 所属库区 */
    @Excel(name = "所属库区")
    private Long areaId;
   /** 货架 */
    @Excel(name = "货架")
    private Long rackId;
   /** 附件文件 */
    @Excel(name = "附件文件")
    private String attachment;
   /** 备注 */
    @Excel(name = "备注")
    private String remark;
}
