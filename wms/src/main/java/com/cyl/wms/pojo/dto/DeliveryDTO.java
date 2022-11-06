package com.cyl.wms.pojo.dto;

import java.time.LocalDateTime;
import com.ruoyi.common.core.domain.BaseAudit;
import lombok.Data;
/**
 * 发货记录 DTO 对象
 *
 * @author zcc
 */
@Data
public class DeliveryDTO extends BaseAudit {
    private Long id;
    private Long shipmentOrderId;
    private Long carrierId;
    private LocalDateTime deliveryDate;
    private String trackingNo;
    private String remark;
}
