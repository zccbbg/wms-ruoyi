package com.ruoyi.wms.domain.vo;

import com.alibaba.excel.annotation.ExcelIgnoreUnannotated;
import com.alibaba.excel.annotation.ExcelProperty;
import com.ruoyi.wms.domain.entity.CheckOrderDetail;
import io.github.linpeilie.annotations.AutoMapper;
import lombok.Data;
import lombok.EqualsAndHashCode;

import java.math.BigDecimal;

/**
 * 库存盘点单据详情视图对象 wms_check_order_detail
 *
 * @author zcc
 * @date 2024-08-13
 */
@Data
@EqualsAndHashCode(callSuper = true)
@ExcelIgnoreUnannotated
@AutoMapper(target = CheckOrderDetail.class)
public class  CheckOrderDetailVo extends BaseOrderDetailVo {

    /**
     * 盘点数量
     */
    @ExcelProperty(value = "盘点数量")
    private BigDecimal checkQuantity;

    /**
     * 库存id
     */
    private Long inventoryId;

}
