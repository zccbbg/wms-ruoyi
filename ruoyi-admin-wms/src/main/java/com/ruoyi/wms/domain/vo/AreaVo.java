package com.ruoyi.wms.domain.vo;

import com.alibaba.excel.annotation.ExcelIgnoreUnannotated;
import com.alibaba.excel.annotation.ExcelProperty;
import io.github.linpeilie.annotations.AutoMapper;
import lombok.Data;
import com.ruoyi.wms.domain.entity.Area;

import java.io.Serial;
import java.io.Serializable;


@Data
@ExcelIgnoreUnannotated
@AutoMapper(target = Area.class)
public class AreaVo implements Serializable {

    @Serial
    private static final long serialVersionUID = 1L;

    /**
     *
     */
    @ExcelProperty(value = "")
    private Long id;

    /**
     * 编号
     */
    @ExcelProperty(value = "编号")
    private String areaCode;

    /**
     * 名称
     */
    @ExcelProperty(value = "名称")
    private String areaName;

    /**
     * 所属仓库ID
     */
    @ExcelProperty(value = "所属仓库ID")
    private Long warehouseId;

    /**
     * 备注
     */
    @ExcelProperty(value = "备注")
    private String remark;
}
