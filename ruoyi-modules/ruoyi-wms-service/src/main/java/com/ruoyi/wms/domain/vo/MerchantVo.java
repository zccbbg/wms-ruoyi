package com.ruoyi.wms.domain.vo;

import com.alibaba.excel.annotation.ExcelIgnoreUnannotated;
import com.alibaba.excel.annotation.ExcelProperty;
import com.ruoyi.common.excel.annotation.ExcelDictFormat;
import com.ruoyi.common.excel.convert.ExcelDictConvert;
import com.ruoyi.wms.domain.entity.Merchant;
import lombok.Data;
import io.github.linpeilie.annotations.AutoMapper;

import java.io.Serializable;

/**
 * 往来单位视图对象 wms_merchant
 *
 * @author zcc
 * @date 2024-07-05
 */
@Data
@ExcelIgnoreUnannotated
@AutoMapper(target = Merchant.class)
public class MerchantVo implements Serializable {

    private static final long serialVersionUID = 1L;

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
     * 地址
     */
    @ExcelProperty(value = "地址")
    private String address;

    /**
     * 级别
     */
    @ExcelProperty(value = "级别")
    private String merchantLevel;


}
