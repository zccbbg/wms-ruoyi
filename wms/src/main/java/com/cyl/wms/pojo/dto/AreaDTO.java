package com.cyl.wms.pojo.dto;

import com.ruoyi.common.core.domain.BaseAudit;
import lombok.Data;
/**
 * 货区 DTO 对象
 *
 * @author zcc
 */
@Data
public class AreaDTO extends BaseAudit {
    private Long id;
    private String areaNo;
    private String areaName;
    private Long warehouseId;
    private String remark;
}
