package com.ruoyi.wms.domain.vo;

import com.ruoyi.wms.domain.entity.Merchant;
import com.alibaba.excel.annotation.ExcelIgnoreUnannotated;
import com.alibaba.excel.annotation.ExcelProperty;
import com.ruoyi.common.excel.annotation.ExcelDictFormat;
import com.ruoyi.common.excel.convert.ExcelDictConvert;
import lombok.Data;
import io.github.linpeilie.annotations.AutoMapper;

import java.io.Serializable;
import java.io.Serial;

/**
 * 往来单位视图对象 wms_merchant
 *
 * @author zcc
 * @date 2024-07-16
 */
@Data
@ExcelIgnoreUnannotated
@AutoMapper(target = Merchant.class)
public class MerchantVo implements Serializable {

    @Serial
    private static final long serialVersionUID = 1L;

    /**
     * id
     */
    @ExcelProperty(value = "id")
    private Long id;

    /**
     * 编号
     */
    @ExcelProperty(value = "编号")
    private String merchantNo;

    /**
     * 名称
     */
    @ExcelProperty(value = "名称")
    private String merchantName;

    /**
     * 企业类型
     */
    @ExcelProperty(value = "企业类型", converter = ExcelDictConvert.class)
    @ExcelDictFormat(dictType = "merchant_type")
    private Integer merchantType;

    /**
     * 级别
     */
    @ExcelProperty(value = "级别")
    private String merchantLevel;

    /**
     * 联系人
     */
    @ExcelProperty(value = "联系人")
    private String contactPerson;

    /**
     * 备注
     */
    @ExcelProperty(value = "备注")
    private String remark;


}
