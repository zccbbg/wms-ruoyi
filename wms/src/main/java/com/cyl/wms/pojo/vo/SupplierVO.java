package com.cyl.wms.pojo.vo;

import com.ruoyi.common.annotation.Excel;
import com.fasterxml.jackson.annotation.JsonFormat;
import com.ruoyi.common.core.domain.BaseAudit;
import lombok.Data;
/**
 * 供应商 数据视图对象
 * 
 * @author zcc
 */
@Data
public class SupplierVO extends BaseAudit {
   /** ID */
    private Long id;
   /** 供应商编号 */
    @Excel(name = "供应商编号")
    private String supplierNo;
   /** 供应商名称 */
    @Excel(name = "供应商名称")
    private String supplierName;
   /** 供应商地址 */
    @Excel(name = "供应商地址")
    private String address;
   /** 手机号 */
    @Excel(name = "手机号")
    private String mobileNo;
   /** 座机号 */
    @Excel(name = "座机号")
    private String telNo;
   /** 联系人 */
    @Excel(name = "联系人")
    private String contact;
   /** 级别 */
    @Excel(name = "级别")
    private String level;
   /** Email */
    @Excel(name = "Email")
    private String email;
   /** 备注 */
    @Excel(name = "备注")
    private String remark;
}
