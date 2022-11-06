package com.cyl.wms.pojo.dto;

import com.ruoyi.common.core.domain.BaseAudit;
import lombok.Data;
/**
 * 入库单 DTO 对象
 *
 * @author zcc
 */
@Data
public class ReceiptOrderDTO extends BaseAudit {
    private Long id;
    private String receiptOrderNo;
    private Integer receiptOrderType;
    private Long supplierId;
    private String orderNo;
    private Integer receiptOrderStatus;
    private String remark;
}
