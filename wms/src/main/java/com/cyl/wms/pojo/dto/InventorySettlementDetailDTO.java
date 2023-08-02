package com.cyl.wms.pojo.dto;

import com.ruoyi.common.core.domain.BaseAudit;
import lombok.Data;

import java.math.BigDecimal;
/**
 * 库存结算明细 DTO 对象
 *
 * @author zcc
 */
@Data
public class InventorySettlementDetailDTO extends BaseAudit {
    private Long id;
    private Long settlementId;
    private Integer settlementType;
    private Long itemId;
    private String itemNo;
    private String itemName;
    private Long warehouseId;
    private String warehouseNo;
    private String warehouseName;
    private Long areaId;
    private String areaNo;
    private String areaName;
    private BigDecimal previousBalance;
    private BigDecimal currentEnter;
    private BigDecimal currentOut;
    private BigDecimal currentCheck;
    private BigDecimal currentBalance;
    private String remark;
}
