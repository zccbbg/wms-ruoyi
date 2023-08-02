package com.cyl.wms.pojo.query;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

/**
 * 库存结算单 查询 对象
 *
 * @author zcc
 */
@ApiModel(description="库存结算单 查询 对象")
@Data
public class InventorySettlementQuery {
    @ApiModelProperty("库存结算单状态11：结算中 22：已完成 精确匹配")
    private Integer inventorySettlementStatus;

    @ApiModelProperty("结算类型,1:月结，2:年结 精确匹配")
    private Integer settlementType;

    @ApiModelProperty("库存结算单号 精确匹配")
    private String inventorySettlementNo;

}
