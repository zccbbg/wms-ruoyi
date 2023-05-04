package com.cyl.wms.pojo.dto;

import java.math.BigDecimal;
import java.time.LocalDateTime;
import lombok.Data;
/**
 * 客户账户流水 DTO 对象
 *
 * @author zcc
 */
@Data
public class CustomerTransactionDTO {
    private Integer id;
    private String transactionCode;
    private String customerId;
    private String transactionType;
    private BigDecimal transactionAmount;
    private BigDecimal previousBalance;
    private BigDecimal currentBalance;
    private Long shipmentOrderId;
    private String remark;
    private LocalDateTime createTime;
    private LocalDateTime updateTime;
}
