package com.ruoyi.wms.domain.entity;

import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.ruoyi.common.mybatis.core.domain.BaseEntity;
import lombok.Data;
import lombok.EqualsAndHashCode;

import java.io.Serial;

/**
 * 往来单位对象 wms_merchant
 *
 * @author zcc
 * @date 2024-07-16
 */
@Data
@EqualsAndHashCode(callSuper = true)
@TableName("wms_merchant")
public class Merchant extends BaseEntity {

    @Serial
    private static final long serialVersionUID=1L;

    /**
     * id
     */
    @TableId(value = "id")
    private Long id;
    /**
     * 编号
     */
    private String merchantCode;
    /**
     * 名称
     */
    private String merchantName;
    /**
     * 企业类型
     */
    private Integer merchantType;
    /**
     * 级别
     */
    private String merchantLevel;
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
     * Email
     */
    private String email;
    /**
     * 备注
     */
    private String remark;

}
