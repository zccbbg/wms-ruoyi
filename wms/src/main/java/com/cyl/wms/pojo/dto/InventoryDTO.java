package com.cyl.wms.pojo.dto;

import java.math.BigDecimal;
import com.ruoyi.common.core.domain.BaseAudit;
import lombok.Data;
/**
 * 库存 DTO 对象
 *
 * @author zcc
 */
@Data
public class InventoryDTO extends BaseAudit {
    private Long id;
    private Long itemId;
    private Long warehouseId;
    private Long areaId;
    private Long rackId;
    private BigDecimal quantity;
    private String remark;
}
