package com.cyl.wms.pojo.dto;

import java.math.BigDecimal;
import java.time.LocalDateTime;
import com.ruoyi.common.core.domain.BaseAudit;
import lombok.Data;
/**
 * 库存盘点单据 DTO 对象
 *
 * @author zcc
 */
@Data
public class InventoryCheckDTO extends BaseAudit {
    private Long id;
    private String inventoryCheckNo;
    private Integer inventoryCheckType;
    private Integer inventoryCheckStatus;
    private BigDecimal inventoryCheckTotal;
    private Integer checkStatus;
    private Long checkUserId;
    private LocalDateTime checkTime;
    private Long warehouseId;
    private Long areaId;
    private Long rackId;
    private String attachment;
    private String remark;
}
