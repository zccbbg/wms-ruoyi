package com.ruoyi.wms.domain.vo;

import com.alibaba.excel.annotation.ExcelIgnoreUnannotated;
import com.alibaba.excel.annotation.ExcelProperty;
import com.ruoyi.wms.domain.entity.ItemSku;
import io.github.linpeilie.annotations.AutoMapper;
import lombok.Data;

import java.io.Serial;
import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;



@Data
@ExcelIgnoreUnannotated
@AutoMapper(target = ItemSku.class)
public class ItemSkuVo implements Serializable {

    @Serial
    private static final long serialVersionUID = 1L;

    /**
     *
     */
    @ExcelProperty(value = "")
    private Long id;

    /**
     * 规格名称
     */
    @ExcelProperty(value = "规格名称")
    private String skuName;

    /**
     *
     */
    @ExcelProperty(value = "")
    private Long itemId;

    /**
     *
     */
    @ExcelProperty(value = "")
    private String itemName;

    /**
     *
     */
    @ExcelProperty(value = "")
    private String itemNo;

    /**
     * sku编码
     */
    @ExcelProperty(value = "sku编码")
    private String outSkuId;

    /**
     * 入库价格
     */
    @ExcelProperty(value = "入库价格")
    private BigDecimal inPrice;

    /**
     * 出库价格
     */
    @ExcelProperty(value = "出库价格")
    private BigDecimal outPrice;

    /**
     * 库存预警
     */
    @ExcelProperty(value = "库存预警")
    private BigDecimal quantity;

    /**
     * 所属分类名称
     */
    @ExcelProperty(value = "所属分类名称")
    private String itemCategoryName;

    private Integer delFlag;

    private Long itemCategoryId;

}
