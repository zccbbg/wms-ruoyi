package com.cyl.wms.service;

import java.util.*;
import java.time.LocalDateTime;
import java.util.stream.Collectors;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.cyl.wms.domain.ItemTypeTreeSelect;
import com.github.pagehelper.PageHelper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;
import com.cyl.wms.mapper.ItemTypeMapper;
import com.cyl.wms.domain.ItemType;
import com.cyl.wms.pojo.query.ItemTypeQuery;

/**
 * 物料类型表Service业务层处理
 *
 *
 * @author zcc
 */
@Service
public class ItemTypeService {
    @Autowired
    private ItemTypeMapper itemTypeMapper;

    /**
     * 查询物料类型表
     *
     * @param ids 物料类型表主键
     * @return 物料类型表
     */
    public List<ItemType> selectByIdIn(Collection<Long> ids) {
        if (ids.isEmpty()){
            return Collections.emptyList();
        }
        QueryWrapper<ItemType> qw = new QueryWrapper<>();
        qw.in("item_type_id",ids);
        return itemTypeMapper.selectList(qw);
    }

    /**
     * 查询物料类型表
     *
     * @param itemTypeId 物料类型表主键
     * @return 物料类型表
     */
    public ItemType selectByItemTypeId(Long itemTypeId) {
        return itemTypeMapper.selectById(itemTypeId);
    }

    /**
     * 查询物料类型表列表
     *
     * @param query 查询条件
     * @param page 分页条件
     * @return 物料类型表
     */
    public List<ItemType> selectList(ItemTypeQuery query, Pageable page) {
        if (page != null) {
            PageHelper.startPage(page.getPageNumber() + 1, page.getPageSize());
        }
        QueryWrapper<ItemType> qw = new QueryWrapper<>();
        qw.eq("del_flag",0);
        Long parentId = query.getParentId();
        if (parentId != null) {
            qw.eq("parent_id", parentId);
        }
        String ancestors = query.getAncestors();
        if (!StringUtils.isEmpty(ancestors)) {
            qw.eq("ancestors", ancestors);
        }
        String typeNameLike = query.getTypeNameLike();
        if (!StringUtils.isEmpty(typeNameLike)) {
            qw.like("type_name", typeNameLike);
        }
        Integer orderNum = query.getOrderNum();
        if (orderNum != null) {
            qw.eq("order_num", orderNum);
        }
        String status = query.getStatus();
        if (!StringUtils.isEmpty(status)) {
            qw.eq("status", status);
        }
        return itemTypeMapper.selectList(qw);
    }

    /**
     * 新增物料类型表
     *
     * @param itemType 物料类型表
     * @return 结果
     */
    public int insert(ItemType itemType) {
        itemType.setDelFlag(String.valueOf(0));
        itemType.setCreateTime(LocalDateTime.now());
        return itemTypeMapper.insert(itemType);
    }

    /**
     * 修改物料类型表
     *
     * @param itemType 物料类型表
     * @return 结果
     */
    public int update(ItemType itemType) {
        return itemTypeMapper.updateById(itemType);
    }

    /**
     * 批量删除物料类型表
     *
     * @param itemTypeIds 需要删除的物料类型表主键
     * @return 结果
     */
    public int deleteByItemTypeIds(Long[] itemTypeIds) {
        return itemTypeMapper.updateDelFlagByIds(itemTypeIds);
    }

    /**
     * 删除物料类型表信息
     *
     * @param itemTypeId 物料类型表主键
     * @return 结果
     */
    public int deleteByItemTypeId(Long itemTypeId) {
        Long[] itemTypeIds = {itemTypeId};
        return itemTypeMapper.updateDelFlagByIds(itemTypeIds);
    }

    public List<ItemTypeTreeSelect> buildItemTypeTreeSelect(List<ItemType> itemTypes) {
        List<ItemType> itemTypeTrees = buildDeptTree(itemTypes);
        return itemTypeTrees.stream().map(ItemTypeTreeSelect::new).collect(Collectors.toList());
    }

    /**
     * 构建前端所需要树结构
     *
     * @param itemTypes 部门列表
     * @return 树结构列表
     */
    public List<ItemType> buildDeptTree(List<ItemType> itemTypes) {
        List<ItemType> returnList = new ArrayList<>();
        List<Long> tempList = new ArrayList<Long>();
        for (ItemType dept : itemTypes) {
            tempList.add(dept.getItemTypeId());
        }
        for (Iterator<ItemType> iterator = itemTypes.iterator(); iterator.hasNext(); ) {
            ItemType dept = (ItemType) iterator.next();
            // 如果是顶级节点, 遍历该父节点的所有子节点
            if (!tempList.contains(dept.getParentId())) {
                recursionFn(itemTypes, dept);
                returnList.add(dept);
            }
        }
        if (returnList.isEmpty()) {
            returnList = itemTypes;
        }
        return returnList;
    }

    /**
     * 递归列表
     */
    private void recursionFn(List<ItemType> list, ItemType t) {
        // 得到子节点列表
        List<ItemType> childList = getChildList(list, t);
        t.setChildren(childList);
        for (ItemType tChild : childList) {
            if (hasChild(list, tChild)) {
                recursionFn(list, tChild);
            }
        }
    }

    /**
     * 得到子节点列表
     */
    private List<ItemType> getChildList(List<ItemType> list, ItemType t) {
        List<ItemType> tlist = new ArrayList<>();
        for (ItemType n : list) {
            if (com.ruoyi.common.utils.StringUtils.isNotNull(n.getParentId()) && n.getParentId().longValue() == t.getItemTypeId().longValue()) {
                tlist.add(n);
            }
        }
        return tlist;
    }

    /**
     * 判断是否有子节点
     */
    private boolean hasChild(List<ItemType> list, ItemType t) {
        return getChildList(list, t).size() > 0 ? true : false;
    }
}
