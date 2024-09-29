package com.ruoyi.wms.domain.vo;

import com.alibaba.excel.annotation.ExcelIgnoreUnannotated;
import com.alibaba.excel.annotation.ExcelProperty;
import com.ruoyi.common.mybatis.core.domain.BaseVo;
import com.ruoyi.wms.domain.entity.Warehouse;
import io.github.linpeilie.annotations.AutoMapper;
import lombok.Data;

import java.io.Serial;


@Data
@ExcelIgnoreUnannotated
@AutoMapper(target = Warehouse.class)
public class WarehouseVo extends BaseVo {

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
    private String warehouseCode;

    /**
     * 名称
     */
    @ExcelProperty(value = "名称")
    private String warehouseName;
    /**
     * 排序
     */
    @ExcelProperty(value = "排序")
    private Long orderNum;
    /**
     * 备注
     */
    @ExcelProperty(value = "备注")
    private String remark;

}
