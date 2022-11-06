package com.cyl.wms.pojo.dto;

import com.ruoyi.common.core.domain.BaseAudit;
import lombok.Data;
/**
 * 供应商 DTO 对象
 *
 * @author zcc
 */
@Data
public class SupplierDTO extends BaseAudit {
    private Long id;
    private String supplierNo;
    private String supplierName;
    private String address;
    private String mobileNo;
    private String telNo;
    private String contact;
    private String level;
    private String email;
    private String remark;
}
