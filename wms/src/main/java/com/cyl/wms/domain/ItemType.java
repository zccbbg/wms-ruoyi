package com.cyl.wms.domain;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseAudit;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

import javax.validation.constraints.NotBlank;
import java.util.ArrayList;
import java.util.List;

/**
 * 物料类型表对象 wms_item_type
 *
 * @author zhangcheng
 */
@ApiModel(description = "物料类型表对象")
@TableName("wms_item_type")
public class ItemType extends BaseAudit {
    private static final long serialVersionUID = 1L;

    @ApiModelProperty("物料类型id")
    @TableField(value = "item_type_id")
    @TableId(type = IdType.AUTO)
    private Long itemTypeId;

    public Long getItemTypeId() {
        return itemTypeId;
    }

    public void setItemTypeId(Long itemTypeId) {
        this.itemTypeId = itemTypeId;
    }

    public String getTypeName() {
        return typeName;
    }

    public void setTypeName(String typeName) {
        this.typeName = typeName;
    }

    public void setChildren(List<ItemType> children) {
        this.children = children;
    }

    @ApiModelProperty("父物料类型id")
    @Excel(name = "父物料类型id")
    private Long parentId;

    @ApiModelProperty("祖级列表")
    @Excel(name = "祖级列表")
    private String ancestors;

    @ApiModelProperty("物料类型名称")
    @Excel(name = "物料类型名称")
    private String typeName;

    @ApiModelProperty("显示顺序")
    @Excel(name = "显示顺序")
    private String orderNum;

    @ApiModelProperty("物料类型状态（0正常 1停用）")
    @Excel(name = "物料类型状态", readConverterExp = "0=正常,1=停用")
    private String status;

    @ApiModelProperty("删除标志（0代表存在 2代表删除）")
    private String delFlag;

    /**
     * 父部门名称
     */
    @TableField(exist = false)
    private String parentName = "11";
    /**
     * 子部门
     */
    @TableField(exist = false)
    private List<ItemType> children = new ArrayList<ItemType>();

    public List<ItemType> getChildren() {
        return children;
    }

    public Long getParentId() {
        return parentId;
    }

    public void setParentId(Long parentId) {
        this.parentId = parentId;
    }

    public String getAncestors() {
        return ancestors;
    }

    public void setAncestors(String ancestors) {
        this.ancestors = ancestors;
    }


    @NotBlank(message = "显示顺序不能为空")
    public String getOrderNum() {
        return orderNum;
    }

    public void setOrderNum(String orderNum) {
        this.orderNum = orderNum;
    }


    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getDelFlag() {
        return delFlag;
    }

    public void setDelFlag(String delFlag) {
        this.delFlag = delFlag;
    }

    public String getParentName() {
        return parentName;
    }

    public void setParentName(String parentName) {
        this.parentName = parentName;
    }


    @Override
    public String toString() {
        return new ToStringBuilder(this, ToStringStyle.MULTI_LINE_STYLE)
                .append("itemTypeId", getItemTypeId())
                .append("parentId", getParentId())
                .append("ancestors", getAncestors())
                .append("typeName", getTypeName())
                .append("orderNum", getOrderNum())
                .append("status", getStatus())
                .append("delFlag", getDelFlag())
                .append("createBy", getCreateBy())
                .append("createTime", getCreateTime())
                .append("updateBy", getUpdateBy())
                .append("updateTime", getUpdateTime())
                .toString();
    }
}
