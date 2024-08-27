package com.ruoyi.wms.domain.bo;

import com.ruoyi.common.core.validate.AddGroup;
import com.ruoyi.common.core.validate.EditGroup;
import com.ruoyi.common.mybatis.core.domain.BaseEntity;
import io.github.linpeilie.annotations.AutoMapper;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import lombok.Data;
import lombok.EqualsAndHashCode;
import com.ruoyi.wms.domain.entity.ItemSku;

import java.math.BigDecimal;

@Data
@EqualsAndHashCode(callSuper = true)
@AutoMapper(target = ItemSku.class, reverseConvertGenerate = false)
public class ItemSkuBo extends BaseEntity {

    /**
     *
     */
    @NotNull(message = "不能为空", groups = { EditGroup.class })
    private Long id;

    /**
     * 规格名称
     */
    @NotBlank(message = "规格名称不能为空", groups = { AddGroup.class, EditGroup.class })
    private String skuName;

    /**
     *
     */
    @NotNull(message = "不能为空", groups = { AddGroup.class, EditGroup.class })
    private Long itemId;

    /**
     * sku条码
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

    /**
     * 商品名称
     */
    private String itemName;

    /**
     * 商品编码
     */
    private String itemCode;

    /**
     * 商品分类
     */
    private String itemCategory;

    private Long itemBrand;
}
