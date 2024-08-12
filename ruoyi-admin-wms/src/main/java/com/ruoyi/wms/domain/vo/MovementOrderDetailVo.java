package com.ruoyi.wms.domain.vo;

import java.math.BigDecimal;
import com.ruoyi.wms.domain.entity.MovementOrderDetail;
import com.alibaba.excel.annotation.ExcelIgnoreUnannotated;
import com.alibaba.excel.annotation.ExcelProperty;
import com.ruoyi.common.excel.annotation.ExcelDictFormat;
import com.ruoyi.common.excel.convert.ExcelDictConvert;
import lombok.Data;
import io.github.linpeilie.annotations.AutoMapper;

import java.io.Serializable;
import java.io.Serial;
import java.time.LocalDateTime;

/**
 * 库存移动详情视图对象 wms_movement_order_detail
 *
 * @author zcc
 * @date 2024-08-09
 */
@Data
@ExcelIgnoreUnannotated
@AutoMapper(target = MovementOrderDetail.class)
public class MovementOrderDetailVo implements Serializable {

    @Serial
    private static final long serialVersionUID = 1L;

    /**
     *
     */
    @ExcelProperty(value = "")
    private Long id;

    /**
     * 移库单Id
     */
    @ExcelProperty(value = "移库单Id")
    private Long movementOrderId;

    /**
     * 规格id
     */
    @ExcelProperty(value = "规格id")
    private Long skuId;

    /**
     * 数量
     */
    @ExcelProperty(value = "数量")
    private BigDecimal quantity;

    /**
     * 备注
     */
    @ExcelProperty(value = "备注")
    private String remark;

    /**
     * 批号
     */
    @ExcelProperty(value = "批号")
    private String batchNo;

    /**
     * 生产日期
     */
    @ExcelProperty(value = "生产日期")
    private LocalDateTime productionDate;

    /**
     * 过期时间
     */
    @ExcelProperty(value = "过期时间")
    private LocalDateTime expirationDate;

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
     * 入库记录id
     */
    @ExcelProperty(value = "入库记录id")
    private Long inventoryDetailId;

    private ItemSkuVo itemSku;

    private InventoryDetailVo inventoryDetail;

    private BigDecimal remainQuantity;
}
