package com.ruoyi.wms.domain.entity;

import com.baomidou.mybatisplus.annotation.*;
import com.ruoyi.common.mybatis.core.domain.BaseEntity;
import lombok.Data;
import lombok.EqualsAndHashCode;


/**
 * 往来单位对象 wms_merchant
 *
 * @author zcc
 * @date 2024-07-05
 */
@Data
@EqualsAndHashCode(callSuper = true)
@TableName("wms_merchant")
public class Merchant extends BaseEntity {

    private static final long serialVersionUID=1L;

    /**
     *
     */
    @TableId(value = "id")
    private Long id;
    /**
     * 编号
     */
    private String merchantNo;
    /**
     * 名称
     */
    private String merchantName;
    /**
     * 开户行
     */
    private String bankName;
    /**
     * 银行账户
     */
    private String bankAccount;
    /**
     * 地址
     */
    private String address;
    /**
     * 手机号
     */
    private String mobile;
    /**
     * 座机号
     */
    private String tel;
    /**
     * 联系人
     */
    private String contactPerson;
    /**
     * 级别
     */
    private String merchantLevel;
    /**
     * Email
     */
    private String email;
    /**
     * 备注
     */
    private String remark;
    /**
     * 删除标识
     */
    @TableLogic
    private Integer delFlag;

}
