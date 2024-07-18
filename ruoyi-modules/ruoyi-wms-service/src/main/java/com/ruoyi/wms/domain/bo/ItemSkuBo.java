package com.ruoyi.wms.domain.bo;

import com.ruoyi.common.core.validate.AddGroup;
import com.ruoyi.common.core.validate.EditGroup;
import com.ruoyi.common.mybatis.core.domain.BaseEntity;
import com.ruoyi.wms.domain.entity.ItemSku;
import io.github.linpeilie.annotations.AutoMapper;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import lombok.Data;
import lombok.EqualsAndHashCode;

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
     * sku编码
     */
    private String outSkuId;

    /**
     * 入库价格
     */
    private BigDecimal inPrice;

    /**
     * 出库价格
     */
    private BigDecimal outPrice;

    /**
     * 库存预警
     */
    private BigDecimal quantity;

    /**
     * 商品名称
     */
    private String itemName;

    /**
     * 商品编码
     */
    private String itemNo;

    /**
     * 商品分类
     */
    private String itemCategory;
}
