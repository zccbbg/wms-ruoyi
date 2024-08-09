package com.ruoyi.wms.domain.vo;

import com.alibaba.excel.annotation.ExcelIgnoreUnannotated;
import com.alibaba.excel.annotation.ExcelProperty;
import com.ruoyi.common.excel.annotation.ExcelDictFormat;
import com.ruoyi.common.excel.convert.ExcelDictConvert;
import com.ruoyi.common.mybatis.core.domain.BaseEntity;
import com.ruoyi.wms.domain.entity.InventoryHistory;
import io.github.linpeilie.annotations.AutoMapper;
import lombok.Data;

import java.io.Serial;
import java.io.Serializable;
import java.math.BigDecimal;
import java.time.LocalDateTime;

/**
 * 库存记录视图对象 wms_inventory_history
 *
 * @author zcc
 * @date 2024-07-22
 */
@Data
@ExcelIgnoreUnannotated
@AutoMapper(target = InventoryHistory.class)
public class InventoryHistoryVo extends BaseEntity implements Serializable {

    @Serial
    private static final long serialVersionUID = 1L;

    /**
     *
     */
    @ExcelProperty(value = "")
    private Long id;

    /**
     * 操作id（出库、入库、库存移动表单id）
     */
    @ExcelProperty(value = "操作id", converter = ExcelDictConvert.class)
    @ExcelDictFormat(readConverterExp = "出=库、入库、库存移动表单id")
    private Long formId;

    /**
     * 操作单号（入库、出库、移库、盘库单号）
     */
    @ExcelProperty(value = "操作单号")
    private String formNo;

    /**
     * 操作类型
     */
    @ExcelProperty(value = "操作类型")
    private Integer formType;

    /**
     * 物料ID
     */
    @ExcelProperty(value = "物料ID")
    private Long skuId;

    /**
     * 批号
     */
    @ExcelProperty(value = "批号")
    private String batchNumber;

    /**
     * 生产日期
     */
    @ExcelProperty(value = "生产日期")
    private LocalDateTime productionDate;

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
     * 库存变化
     */
    @ExcelProperty(value = "库存变化")
    private BigDecimal quantity;

    /**
     * 备注
     */
    @ExcelProperty(value = "备注")
    private String remark;

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

    private ItemSkuVo itemSku;

    private ItemVo item;

}
