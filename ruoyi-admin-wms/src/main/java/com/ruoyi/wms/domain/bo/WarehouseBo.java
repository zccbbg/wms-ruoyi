package com.ruoyi.wms.domain.bo;

import com.ruoyi.common.core.validate.AddGroup;
import com.ruoyi.common.core.validate.EditGroup;
import com.ruoyi.common.mybatis.core.domain.BaseEntity;
import io.github.linpeilie.annotations.AutoMapper;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import lombok.Data;
import lombok.EqualsAndHashCode;
import com.ruoyi.wms.domain.entity.Warehouse;

@Data
@EqualsAndHashCode(callSuper = true)
@AutoMapper(target = Warehouse.class, reverseConvertGenerate = false)
public class WarehouseBo extends BaseEntity {

    /**
     *
     */
    @NotNull(message = "不能为空", groups = { EditGroup.class })
    private Long id;

    /**
     * 编号
     */
    private String warehouseCode;

    /**
     * 名称
     */
    @NotBlank(message = "名称不能为空", groups = { AddGroup.class, EditGroup.class })
    private String warehouseName;

    /**
     * 备注
     */
    private String remark;

    /**
     * 排序
     */
    private Long orderNum;
}
