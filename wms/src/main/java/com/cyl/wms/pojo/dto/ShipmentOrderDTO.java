package com.cyl.wms.pojo.dto;

import java.time.LocalDateTime;
import com.ruoyi.common.core.domain.BaseAudit;
import lombok.Data;
/**
 * 出库单 DTO 对象
 *
 * @author zcc
 */
@Data
public class ShipmentOrderDTO extends BaseAudit {
    private Long id;
    private String shipmentOrderNo;
    private Integer shipmentOrderType;
    private String orderNo;
    private Long customerId;
    private Integer shipmentOrderStatus;
    private Integer checkStatus;
    private Long checkUserId;
    private LocalDateTime checkTime;
    private String remark;
}
