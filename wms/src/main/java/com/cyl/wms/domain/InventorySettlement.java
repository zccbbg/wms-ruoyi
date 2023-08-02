package com.cyl.wms.domain;

import com.baomidou.mybatisplus.annotation.TableName;
import com.fasterxml.jackson.annotation.JsonFormat;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseAudit;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import java.time.LocalDateTime;

/**
 * 库存结算单对象 wms_inventory_settlement
 * 
 * @author zcc
 */
@ApiModel(description="库存结算单对象")
@Data
@TableName("wms_inventory_settlement")
public class InventorySettlement extends BaseAudit {
    private static final long serialVersionUID = 1L;

    @ApiModelProperty("ID")
    private Long id;

    @ApiModelProperty("库存结算单状态11：结算中 22：已完成")
    @Excel(name = "库存结算单状态11：结算中 22：已完成")
    private Integer inventorySettlementStatus;

    @ApiModelProperty("结算类型,1:月结，2:年结")
    @Excel(name = "结算类型,1:月结，2:年结")
    private Integer settlementType;

    /**
     * 开始时间
     */
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private LocalDateTime inventorySettlementStartTime;

    /**
     * 结束时间
     */
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private LocalDateTime inventorySettlementEndTime;

    @ApiModelProperty("删除标识")
    private Integer delFlag;

    @ApiModelProperty("备注")
    @Excel(name = "备注")
    private String remark;

    @ApiModelProperty("库存结算单号")
    @Excel(name = "库存结算单号")
    private String inventorySettlementNo;

}
