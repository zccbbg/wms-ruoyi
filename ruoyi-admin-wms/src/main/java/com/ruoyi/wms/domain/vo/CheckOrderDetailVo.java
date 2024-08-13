package com.ruoyi.wms.domain.vo;

import java.math.BigDecimal;
import com.ruoyi.wms.domain.entity.CheckOrderDetail;
import com.alibaba.excel.annotation.ExcelIgnoreUnannotated;
import com.alibaba.excel.annotation.ExcelProperty;
import com.ruoyi.common.excel.annotation.ExcelDictFormat;
import com.ruoyi.common.excel.convert.ExcelDictConvert;
import lombok.Data;
import io.github.linpeilie.annotations.AutoMapper;

import java.io.Serializable;
import java.io.Serial;

/**
 * 库存盘点单据详情视图对象 wms_check_order_detail
 *
 * @author zcc
 * @date 2024-08-13
 */
@Data
@ExcelIgnoreUnannotated
@AutoMapper(target = CheckOrderDetail.class)
public class CheckOrderDetailVo implements Serializable {

    @Serial
    private static final long serialVersionUID = 1L;

    /**
     * 
     */
    @ExcelProperty(value = "")
    private Long id;

    /**
     * 盘点单id
     */
    @ExcelProperty(value = "盘点单id")
    private Long checkOrderId;

    /**
     * 规格id
     */
    @ExcelProperty(value = "规格id")
    private Long skuId;

    /**
     * 库存数量
     */
    @ExcelProperty(value = "库存数量")
    private BigDecimal quantity;

    /**
     * 盘点数量
     */
    @ExcelProperty(value = "盘点数量")
    private BigDecimal checkQuantity;

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
     * 入库记录id
     */
    @ExcelProperty(value = "入库记录id")
    private Long inventoryDetailId;

    /**
     * 备注
     */
    @ExcelProperty(value = "备注")
    private String remark;


}
