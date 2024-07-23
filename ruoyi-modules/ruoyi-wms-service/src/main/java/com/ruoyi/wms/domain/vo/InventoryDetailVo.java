package com.ruoyi.wms.domain.vo;

import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import com.ruoyi.wms.domain.entity.InventoryDetail;
import com.alibaba.excel.annotation.ExcelIgnoreUnannotated;
import com.alibaba.excel.annotation.ExcelProperty;
import com.ruoyi.common.excel.annotation.ExcelDictFormat;
import com.ruoyi.common.excel.convert.ExcelDictConvert;
import lombok.Data;
import io.github.linpeilie.annotations.AutoMapper;

import java.io.Serializable;
import java.io.Serial;

/**
 * 库存详情视图对象 wms_inventory_detail
 *
 * @author zcc
 * @date 2024-07-22
 */
@Data
@ExcelIgnoreUnannotated
@AutoMapper(target = InventoryDetail.class)
public class InventoryDetailVo implements Serializable {

    @Serial
    private static final long serialVersionUID = 1L;

    /**
     *
     */
    @ExcelProperty(value = "")
    private Long id;

    /**
     * 入库单id
     */
    @ExcelProperty(value = "入库单id")
    private Long receiptOrderId;

    /**
     * 入库单类型
     */
    @ExcelProperty(value = "入库单类型")
    private String receiptOrderType;

    /**
     * 单号
     */
    @ExcelProperty(value = "单号")
    private String orderNo;

    /**
     * 类型 1：入库 2：移库 3：盘库
     */
    @ExcelProperty(value = "类型 1：入库 2：移库 3：盘库")
    private Integer type;

    /**
     * sku的ID
     */
    @ExcelProperty(value = "sku的ID")
    private Long skuId;

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
     * 入库数量
     */
    @ExcelProperty(value = "入库数量")
    private BigDecimal quantity;

    /**
     * 过期时间
     */
    @ExcelProperty(value = "过期时间")
    private LocalDateTime expirationTime;

    /**
     * 金额
     */
    @ExcelProperty(value = "金额")
    private BigDecimal amount;

    /**
     * 备注
     */
    @ExcelProperty(value = "备注")
    private String remark;

    /**
     * 剩余数量
     */
    @ExcelProperty(value = "剩余数量")
    private BigDecimal remainQuantity;


}
