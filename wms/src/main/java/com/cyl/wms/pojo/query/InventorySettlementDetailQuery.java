package com.cyl.wms.pojo.query;

import com.fasterxml.jackson.annotation.JsonFormat;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import java.math.BigDecimal;
import java.time.LocalDateTime;

/**
 * 库存结算明细 查询 对象
 *
 * @author zcc
 */
@ApiModel(description="库存结算明细 查询 对象")
@Data
public class InventorySettlementDetailQuery {
    @ApiModelProperty("结算单id 精确匹配")
    private Long settlementId;

    @ApiModelProperty("结算类型,1:月结，2:年结 精确匹配")
    private Integer settlementType;

    @ApiModelProperty("物料id 精确匹配")
    private Long itemId;

    @ApiModelProperty("编号 精确匹配")
    private String itemNo;

    @ApiModelProperty("名称 精确匹配")
    private String itemNameLike;

    @ApiModelProperty("仓库id 精确匹配")
    private Long warehouseId;

    @ApiModelProperty("仓库编号 精确匹配")
    private String warehouseNo;

    @ApiModelProperty("仓库名称 精确匹配")
    private String warehouseNameLike;

    @ApiModelProperty("库区id 精确匹配")
    private Long areaId;

    @ApiModelProperty("库区编号 精确匹配")
    private String areaNo;

    @ApiModelProperty("库区名称 精确匹配")
    private String areaNameLike;

    @ApiModelProperty("上期结存 精确匹配")
    private BigDecimal previousBalance;

    @ApiModelProperty("本期入库 精确匹配")
    private BigDecimal currentEnter;

    @ApiModelProperty("本期出库 精确匹配")
    private BigDecimal currentOut;

    @ApiModelProperty("本期盘点 精确匹配")
    private BigDecimal currentCheck;

    @ApiModelProperty("本期结存 精确匹配")
    private BigDecimal currentBalance;

    /**
     * 开始时间
     */
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private LocalDateTime startTime;

    /**
     * 结束时间
     */
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private LocalDateTime endTime;

}
