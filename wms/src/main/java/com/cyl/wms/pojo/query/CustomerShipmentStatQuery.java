package com.cyl.wms.pojo.query;

import lombok.Data;

@Data
public class CustomerShipmentStatQuery {
    private String beginTime;
    private String endTime;
    private Long customerId;
    private Long itemTypeId;
}
