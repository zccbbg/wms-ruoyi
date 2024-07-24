package com.ruoyi.wms.domain.vo;

import com.alibaba.excel.annotation.ExcelIgnoreUnannotated;
import com.alibaba.excel.annotation.ExcelProperty;
import com.baomidou.mybatisplus.annotation.TableField;
import com.ruoyi.common.excel.annotation.ExcelDictFormat;
import com.ruoyi.common.excel.convert.ExcelDictConvert;
import io.github.linpeilie.annotations.AutoMapper;
import lombok.Data;
import com.ruoyi.wms.domain.entity.ItemCategory;

import java.io.Serial;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;


@Data
@ExcelIgnoreUnannotated
@AutoMapper(target = ItemCategory.class)
public class ItemCategoryVo implements Serializable {

    @Serial
    private static final long serialVersionUID = 1L;

    /**
     * 物料类型id
     */
    @ExcelProperty(value = "物料类型id")
    private Long id;

    /**
     * 父物料类型id
     */
    @ExcelProperty(value = "父物料类型id")
    private Long parentId;

    /**
     * 祖级列表
     */
    @ExcelProperty(value = "祖级列表")
    private String ancestors;

    /**
     * 物料类型名称
     */
    @ExcelProperty(value = "物料类型名称")
    private String categoryName;

    /**
     * 显示顺序
     */
    @ExcelProperty(value = "显示顺序")
    private Long orderNum;

    /**
     * 物料类型状态（0正常 1停用）
     */
    @ExcelProperty(value = "物料类型状态", converter = ExcelDictConvert.class)
    @ExcelDictFormat(readConverterExp = "0=正常,1=停用")
    private String status;

    /**
     * 子物料类型
     */
    @TableField(exist = false)
    private List<ItemCategoryVo> children = new ArrayList<ItemCategoryVo>();

}
