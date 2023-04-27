package com.cyl.wms.pojo.dto;

import com.ruoyi.common.core.domain.BaseAudit;
import lombok.Data;
/**
 * 物料类型表 DTO 对象
 *
 * @author zcc
 */
@Data
public class ItemTypeDTO extends BaseAudit {
    private Long itemTypeId;
    private Long parentId;
    private String ancestors;
    private String typeName;
    private Integer orderNum;
    private String status;
}
