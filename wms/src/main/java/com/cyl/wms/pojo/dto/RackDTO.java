package com.cyl.wms.pojo.dto;

import com.ruoyi.common.core.domain.BaseAudit;
import lombok.Data;
/**
 * 货架 DTO 对象
 *
 * @author zcc
 */
@Data
public class RackDTO extends BaseAudit {
    private Long id;
    private String rackNo;
    private String rackName;
    private Long areaId;
    private Long warehouseId;
    private String remark;
}
