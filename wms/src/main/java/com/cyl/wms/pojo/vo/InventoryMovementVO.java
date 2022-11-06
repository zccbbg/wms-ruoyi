package com.cyl.wms.pojo.vo;

import java.time.LocalDateTime;

import com.ruoyi.common.annotation.Excel;
import com.fasterxml.jackson.annotation.JsonFormat;
import com.ruoyi.common.core.domain.BaseAudit;
import lombok.Data;

/**
 * 库存移动 数据视图对象
 *
 * @author zcc
 */
@Data
public class InventoryMovementVO extends BaseAudit {
  /**
   * ID
   */
  private Long id;
  /**
   * 库存移动编号
   */
  @Excel(name = "库存移动编号")
  private String inventoryMovementNo;
  /**
   * 原货架Id
   */
  @Excel(name = "原货架Id")
  private Long sourceRackId;
  /**
   * 目标货架
   */
  @Excel(name = "目标货架")
  private Long targetRackId;
  /**
   * 状态
   */
  @Excel(name = "状态")
  private Integer status;
  /**
   * 审核状态
   */
  @Excel(name = "审核状态")
  private Integer checkStatus;
  /**
   * 审核人
   */
  @Excel(name = "审核人")
  private Long checkUserId;
  /**
   * 审核时间
   */
  @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
  @Excel(name = "审核时间", width = 30, dateFormat = "yyyy-MM-dd HH:mm:ss")
  private LocalDateTime checkTime;
  /**
   * 备注
   */
  @Excel(name = "备注")
  private String remark;
  private Integer detailCount;
  private Integer itemCount;
}
