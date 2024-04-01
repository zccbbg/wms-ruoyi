package com.cyl.wms.pojo.vo;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseAudit;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import org.springframework.format.annotation.DateTimeFormat;

import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.util.List;

/**
 * 出库单详情 数据视图对象
 *
 * @author zcc
 */
@Data
public class ShipmentOrderDetailVO extends BaseAudit {
    private static final long serialVersionUID = 1L;
    /**
     * ID
     */
    private Long id;
    /**
     * 订单号
     */
    @Excel(name = "订单号")
    private String orderNo;
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

    @Excel(name = "金额")
    private BigDecimal money;

    @ApiModelProperty("删除标识")
    private Integer delFlag;
    /**
     * 所属库区
     */
    @Excel(name = "所属库区")
    private Long areaId;

    @Excel(name = "出库状态")
    private Integer shipmentOrderStatus;

    /**
     * 生产日期
     */
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private LocalDateTime productionDate;

    /**
     * 有效期
     */
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private LocalDateTime expiryDate;

    /**
     * 批次
     */
    private String batch;

    private List<Long> place;

    private ItemVO item;

    private Long itemType;

    private String customerName;

    private Long customerId;
}
