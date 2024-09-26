package com.ruoyi.wms.domain.vo;

import com.alibaba.excel.annotation.ExcelIgnoreUnannotated;
import com.alibaba.excel.annotation.ExcelProperty;
import com.ruoyi.wms.domain.entity.MovementOrderDetail;
import io.github.linpeilie.annotations.AutoMapper;
import lombok.Data;
import lombok.EqualsAndHashCode;

import java.math.BigDecimal;

/**
 * 库存移动详情视图对象 wms_movement_order_detail
 *
 * @author zcc
 * @date 2024-08-09
 */
@Data
@EqualsAndHashCode(callSuper = true)
@ExcelIgnoreUnannotated
@AutoMapper(target = MovementOrderDetail.class)
public class MovementOrderDetailVo extends BaseOrderDetailVo {



    /**
     * 源仓库
     */
    @ExcelProperty(value = "源仓库")
    private Long sourceWarehouseId;

    /**
     * 目标仓库
     */
    @ExcelProperty(value = "目标仓库")
    private Long targetWarehouseId;

    private BigDecimal remainQuantity;
}
