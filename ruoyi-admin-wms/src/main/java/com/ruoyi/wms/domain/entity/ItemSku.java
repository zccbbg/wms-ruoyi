package com.ruoyi.wms.domain.entity;

import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.ruoyi.common.mybatis.core.domain.BaseEntity;
import lombok.Data;
import lombok.EqualsAndHashCode;

import java.io.Serial;
import java.math.BigDecimal;

@Data
@EqualsAndHashCode(callSuper = true)
@TableName("wms_item_sku")
public class ItemSku extends BaseEntity {

    @Serial
    private static final long serialVersionUID = 1L;

    /**
     *
     */
    @TableId(value = "id")
    private Long id;

    /**
     * 规格名称
     */
    private String skuName;

    /**
     *
     */
    private Long itemId;

    /**
     * 条码
     */
    private String barcode;

    /**
     * 编码
     */
    private String skuCode;


    /**
     * 长(cm)
     */
    private BigDecimal length;

    /**
     * 宽(cm)
     */
    private BigDecimal width;

    /**
     * 高(cm)
     */
    private BigDecimal height;

    /**
     * 毛重(kg)
     */
    private BigDecimal grossWeight;

    /**
     * 净重(kg)
     */
    private BigDecimal netWeight;

    /**
     * 成本价(元)
     */
    private BigDecimal costPrice;

    /**
     * 销售价(元)
     */
    private BigDecimal sellingPrice;
}
