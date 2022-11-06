package com.cyl.wms.pojo.vo;

import java.math.BigDecimal;
import java.util.List;

import com.ruoyi.common.annotation.Excel;
import com.fasterxml.jackson.annotation.JsonFormat;
import com.ruoyi.common.core.domain.BaseAudit;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

/**
 * 出库单详情 数据视图对象
 *
 * @author zcc
 */
@Data
public class ShipmentOrderDetailVO extends BaseAudit {
  /**
   * ID
   */
  private Long id;
  /**
   * 出库单
   */
  @Excel(name = "出库单")
  private Long shipmentOrderId;
  /**
   * 物料
   */
  @Excel(name = "物料")
  private Long itemId;
  /**
   * 计划数量
   */
  @Excel(name = "计划数量")
  private BigDecimal planQuantity;
  /**
   * 实际数量
   */
  @Excel(name = "实际数量")
  private BigDecimal realQuantity;
  /**
   * 货架
   */
  @Excel(name = "货架")
  private Long rackId;
  /**
   * 备注
   */
  @Excel(name = "备注")
  private String remark;

  /**
   * 所属仓库
   */
  @Excel(name = "所属仓库")
  private Long warehouseId;

  @ApiModelProperty("删除标识")
  private Integer delFlag;
  /**
   * 所属库区
   */
  @Excel(name = "所属库区")
  private Long areaId;

  @Excel(name = "出库状态")
  private Integer shipmentOrderStatus;
  private List<Long> place;
}
