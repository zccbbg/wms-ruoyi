package com.cyl.wms.domain;

import com.fasterxml.jackson.annotation.JsonInclude;

import java.io.Serializable;
import java.util.List;
import java.util.stream.Collectors;

/**
 * Treeselect树结构实体类
 *
 * @author zhangcheng
 */
public class ItemTypeTreeSelect implements Serializable {


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
    private List<ItemTypeTreeSelect> children;

    public ItemTypeTreeSelect() {

    }


    public ItemTypeTreeSelect(ItemType itemType) {
        this.id = itemType.getItemTypeId();
        this.label = itemType.getTypeName();
        this.children = itemType.getChildren().stream().map(ItemTypeTreeSelect::new).collect(Collectors.toList());
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

    public List<ItemTypeTreeSelect> getChildren() {
        return children;
    }

    public void setChildren(List<ItemTypeTreeSelect> children) {
        this.children = children;
    }


}
