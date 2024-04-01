package com.cyl.wms.pojo.vo;

import lombok.Data;

import java.math.BigDecimal;

@Data
public class AmountStatByItemTypeVO {
    private Long itemTypeId;
    private BigDecimal amount;
}
