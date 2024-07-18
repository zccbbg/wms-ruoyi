package com.ruoyi.wms.domain.vo;

import com.fasterxml.jackson.annotation.JsonInclude;

import java.io.Serializable;
import java.util.List;
import java.util.stream.Collectors;

public class ItemTypeTreeSelectVo implements Serializable {


    private static final long serialVersionUID = 1L;

    /**
     * 节点ID
     */
    private Long id;

    /**
     * 节点名称
     */
    private String label;

    /**
     * 子节点
     */
    @JsonInclude(JsonInclude.Include.NON_EMPTY)
    private List<ItemTypeTreeSelectVo> children;

    public ItemTypeTreeSelectVo() {

    }


    public ItemTypeTreeSelectVo(ItemCategoryVo itemType) {
        this.id = itemType.getId();
        this.label = itemType.getCategoryName();
        this.children = itemType.getChildren().stream().map(ItemTypeTreeSelectVo::new).collect(Collectors.toList());
    }


    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getLabel() {
        return label;
    }

    public void setLabel(String label) {
        this.label = label;
    }

    public List<ItemTypeTreeSelectVo> getChildren() {
        return children;
    }

    public void setChildren(List<ItemTypeTreeSelectVo> children) {
        this.children = children;
    }


}
