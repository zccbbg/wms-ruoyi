package com.ruoyi.wms.domain.bo;

import com.ruoyi.wms.domain.entity.ItemBrand;
import com.ruoyi.common.core.validate.AddGroup;
import com.ruoyi.common.core.validate.EditGroup;
import com.ruoyi.common.mybatis.core.domain.BaseEntity;
import lombok.Data;
import lombok.EqualsAndHashCode;
import jakarta.validation.constraints.*;
import io.github.linpeilie.annotations.AutoMapper;


/**
 * 商品品牌业务对象 wms_item_brand
 *
 * @author zcc
 * @date 2024-07-30
 */

@Data
@EqualsAndHashCode(callSuper = true)
@AutoMapper(target = ItemBrand.class, reverseConvertGenerate = false)
public class ItemBrandBo extends BaseEntity {

    /**
     * 
     */
    @NotNull(message = "不能为空", groups = { EditGroup.class })
    private Long id;

    /**
     * 品牌名称
     */
    @NotBlank(message = "品牌名称不能为空", groups = { AddGroup.class, EditGroup.class })
    private String brandName;


}
