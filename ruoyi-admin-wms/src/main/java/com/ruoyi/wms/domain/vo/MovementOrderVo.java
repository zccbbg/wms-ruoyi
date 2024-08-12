package com.ruoyi.wms.domain.vo;

import java.math.BigDecimal;

import com.ruoyi.common.mybatis.core.domain.BaseVo;
import com.ruoyi.wms.domain.entity.MovementOrder;
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
 * 移库单视图对象 wms_movement_order
 *
 * @author zcc
 * @date 2024-08-09
 */
@Data
@ExcelIgnoreUnannotated
@AutoMapper(target = MovementOrder.class)
public class MovementOrderVo extends BaseVo{

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
    private String movementOrderNo;

    /**
     * 源仓库
     */
    @ExcelProperty(value = "源仓库")
    private Long sourceWarehouseId;

    /**
     * 源库区
     */
    @ExcelProperty(value = "源库区")
    private Long sourceAreaId;

    /**
     * 目标仓库
     */
    @ExcelProperty(value = "目标仓库")
    private Long targetWarehouseId;

    /**
     * 目标库区
     */
    @ExcelProperty(value = "目标库区")
    private Long targetAreaId;

    /**
     * 状态
     */
    @ExcelProperty(value = "状态")
    private Integer movementOrderStatus;

    /**
     * 总数量
     */
    @ExcelProperty(value = "总数量")
    private BigDecimal totalQuantity;

    /**
     * 备注
     */
    @ExcelProperty(value = "备注")
    private String remark;

    List<MovementOrderDetailVo> details;
}
