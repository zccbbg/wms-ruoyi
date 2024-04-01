package com.cyl.wms.pojo.vo;

import lombok.Data;

import java.math.BigDecimal;
import java.util.List;

@Data
public class CustomerShipmentStatVO {
    private Long customerId;
    private String customerName;
    private List<AmountStatByItemTypeVO> data;
    private BigDecimal total;
    //查询出customerId customerName amount type
}
