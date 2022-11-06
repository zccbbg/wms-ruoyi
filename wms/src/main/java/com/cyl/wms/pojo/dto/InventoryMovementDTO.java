package com.cyl.wms.pojo.dto;

import java.time.LocalDateTime;
import com.ruoyi.common.core.domain.BaseAudit;
import lombok.Data;
/**
 * 库存移动 DTO 对象
 *
 * @author zcc
 */
@Data
public class InventoryMovementDTO extends BaseAudit {
    private Long id;
    private String inventoryMovementNo;
    private Long sourceRackId;
    private Long targetRackId;
    private Integer status;
    private Integer checkStatus;
    private Long checkUserId;
    private LocalDateTime checkTime;
    private String remark;
}
