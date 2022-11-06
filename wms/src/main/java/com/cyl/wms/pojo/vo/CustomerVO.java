package com.cyl.wms.pojo.vo;

import com.ruoyi.common.annotation.Excel;
import com.fasterxml.jackson.annotation.JsonFormat;
import com.ruoyi.common.core.domain.BaseAudit;
import lombok.Data;
/**
 * 客户 数据视图对象
 * 
 * @author zcc
 */
@Data
public class CustomerVO extends BaseAudit {
   /** ID */
    private Long id;
   /** 客户编号 */
    @Excel(name = "客户编号")
    private String customerNo;
   /** 客户名称 */
    @Excel(name = "客户名称")
    private String customerName;
   /** 客户地址 */
    @Excel(name = "客户地址")
    private String address;
   /** 手机号 */
    @Excel(name = "手机号")
    private String mobile;
   /** 座机号 */
    @Excel(name = "座机号")
    private String tel;
   /** 联系人 */
    @Excel(name = "联系人")
    private String customerPerson;
   /** 级别 */
    @Excel(name = "级别")
    private String customerLevel;
   /** Email */
    @Excel(name = "Email")
    private String email;
   /** 备注 */
    @Excel(name = "备注")
    private String remark;
}
