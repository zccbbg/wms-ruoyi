package com.ruoyi.wms.domain.vo;

import java.math.BigDecimal;

import com.ruoyi.common.mybatis.core.domain.BaseVo;
import com.ruoyi.wms.domain.entity.CheckOrder;
import com.alibaba.excel.annotation.ExcelIgnoreUnannotated;
import com.alibaba.excel.annotation.ExcelProperty;
import com.ruoyi.common.excel.annotation.ExcelDictFormat;
import com.ruoyi.common.excel.convert.ExcelDictConvert;
import lombok.Data;
import io.github.linpeilie.annotations.AutoMapper;

import java.io.Serializable;
import java.io.Serial;
import java.util.List;

/**
 * 库存盘点单据视图对象 wms_check_order
 *
 * @author zcc
 * @date 2024-08-13
 */
@Data
@ExcelIgnoreUnannotated
@AutoMapper(target = CheckOrder.class)
public class CheckOrderVo extends BaseVo {

    @Serial
    private static final long serialVersionUID = 1L;

    /**
     *
     */
    @ExcelProperty(value = "")
    private Long id;

    /**
     * 盘点单号
     */
    @ExcelProperty(value = "盘点单号")
    private String checkOrderNo;

    /**
     * 库存盘点单状态 -1：作废 0：未盘库 1：已盘库
     */
    @ExcelProperty(value = "库存盘点单状态 -1：作废 0：未盘库 1：已盘库")
    private Integer checkOrderStatus;

    /**
     * 盈亏数
     */
    @ExcelProperty(value = "盈亏数")
    private BigDecimal checkOrderTotal;

    /**
     * 所属仓库
     */
    @ExcelProperty(value = "所属仓库")
    private Long warehouseId;

    /**
     * 所属库区
     */
    @ExcelProperty(value = "所属库区")
    private Long areaId;

    /**
     * 备注
     */
    @ExcelProperty(value = "备注")
    private String remark;

    private List<CheckOrderDetailVo> details;
}
