package com.cyl.wms.pojo.dto;

import com.ruoyi.common.core.domain.BaseAudit;
import lombok.Data;
/**
 * 客户 DTO 对象
 *
 * @author zcc
 */
@Data
public class CustomerDTO extends BaseAudit {
    private Long id;
    private String customerNo;
    private String customerName;
    private String address;
    private String mobile;
    private String tel;
    private String customerPerson;
    private String customerLevel;
    private String email;
    private String remark;
}
