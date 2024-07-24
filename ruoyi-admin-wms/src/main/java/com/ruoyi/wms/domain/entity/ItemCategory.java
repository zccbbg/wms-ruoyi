package com.ruoyi.wms.domain.entity;

import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.ruoyi.common.mybatis.core.domain.BaseEntity;
import lombok.Data;
import lombok.EqualsAndHashCode;

import java.io.Serial;

@Data
@EqualsAndHashCode(callSuper = true)
@TableName("wms_item_category")
public class ItemCategory extends BaseEntity {

    @Serial
    private static final long serialVersionUID = 1L;

    /**
     * 物料类型id
     */
    @TableId(value = "id")
    private Long id;

    /**
     * 父物料类型id
     */
    private Long parentId;

    /**
     * 物料类型名称
     */
    private String categoryName;

    /**
     * 显示顺序
     */
    private Long orderNum;

    /**
     * 物料类型状态（0停用 1正常）
     */
    private String status;

}
