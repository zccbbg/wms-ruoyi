package com.cyl.wms.pojo.dto;

import com.ruoyi.common.core.domain.BaseAudit;
import lombok.Data;
/**
 * 仓库 DTO 对象
 *
 * @author zcc
 */
@Data
public class WarehouseDTO extends BaseAudit {
    private Long id;
    private String warehouseNo;
    private String warehouseName;
    private String remark;
}
