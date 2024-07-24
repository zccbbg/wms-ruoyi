package com.ruoyi.wms.service;

import cn.hutool.core.lang.Assert;
import cn.hutool.core.util.StrUtil;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.ruoyi.common.core.utils.MapstructUtils;
import com.ruoyi.common.mybatis.core.page.PageQuery;
import com.ruoyi.common.mybatis.core.page.TableDataInfo;
import com.ruoyi.wms.domain.bo.ItemCategoryBo;
import com.ruoyi.wms.domain.entity.Item;
import com.ruoyi.wms.domain.vo.ItemCategoryVo;
import com.ruoyi.wms.domain.vo.ItemTypeTreeSelectVo;
import com.ruoyi.wms.mapper.ItemCategoryMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import com.ruoyi.wms.domain.entity.ItemCategory;
import com.ruoyi.wms.mapper.ItemMapper;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import static cn.hutool.core.lang.Validator.isNotNull;

@RequiredArgsConstructor
@Service
public class ItemCategoryService extends ServiceImpl<ItemCategoryMapper, ItemCategory> {

    private final ItemCategoryMapper itemCategoryMapper;
    private final ItemMapper itemMapper;

    /**
     * 查询物料类型
     */

    public ItemCategoryVo queryById(Long id) {
        return itemCategoryMapper.selectVoById(id);
    }

    /**
     * 查询物料类型列表
     */

    public TableDataInfo<ItemCategoryVo> queryPageList(ItemCategoryBo bo, PageQuery pageQuery) {
        LambdaQueryWrapper<ItemCategory> lqw = buildQueryWrapper(bo);
        Page<ItemCategoryVo> result = itemCategoryMapper.selectVoPage(pageQuery.build(), lqw);
        return TableDataInfo.build(result);
    }

    /**
     * 查询物料类型列表
     */

    public List<ItemCategoryVo> queryList(ItemCategoryBo bo) {
        LambdaQueryWrapper<ItemCategory> lqw = buildQueryWrapper(bo);
        lqw.orderByAsc(ItemCategory::getOrderNum);
        return itemCategoryMapper.selectVoList(lqw);
    }

    private LambdaQueryWrapper<ItemCategory> buildQueryWrapper(ItemCategoryBo bo) {
        Map<String, Object> params = bo.getParams();
        LambdaQueryWrapper<ItemCategory> lqw = Wrappers.lambdaQuery();
        lqw.eq(bo.getParentId() != null, ItemCategory::getParentId, bo.getParentId());
        lqw.like(StrUtil.isNotBlank(bo.getCategoryName()), ItemCategory::getCategoryName, bo.getCategoryName());
        lqw.eq(bo.getOrderNum() != null, ItemCategory::getOrderNum, bo.getOrderNum());
        lqw.eq(StrUtil.isNotBlank(bo.getStatus()), ItemCategory::getStatus, bo.getStatus());
        return lqw;
    }

    /**
     * 新增物料类型
     */

    public void insertByBo(ItemCategoryBo bo) {
        validateItemTypeName(bo);
        ItemCategory add = MapstructUtils.convert(bo, ItemCategory.class);
        LambdaQueryWrapper<ItemCategory> wrapper = new LambdaQueryWrapper<>();
        if (bo.getParentId() != null){
            wrapper.eq(ItemCategory::getParentId, bo.getParentId());
        }else {
            wrapper.eq(ItemCategory::getParentId, 0L);
        }
        //查当前级别排序最大值
        wrapper.orderByDesc(ItemCategory::getOrderNum);
        wrapper.last("limit 1");
        ItemCategory itemType = itemCategoryMapper.selectOne(wrapper);
        add.setOrderNum(itemType == null ? 0L : itemType.getOrderNum() + 1);
        itemCategoryMapper.insert(add);
    }

    /**
     * 修改物料类型
     */

    public void updateByBo(ItemCategoryBo bo) {
        validateItemTypeName(bo);
        ItemCategory update = MapstructUtils.convert(bo, ItemCategory.class);
        itemCategoryMapper.updateById(update);
    }

    private void validateItemTypeName(ItemCategoryBo bo) {
        LambdaQueryWrapper<ItemCategory> queryWrapper = Wrappers.lambdaQuery();
        queryWrapper.eq(ItemCategory::getCategoryName, bo.getCategoryName());
        queryWrapper.ne(bo.getId() != null, ItemCategory::getId, bo.getId());
        Assert.isTrue(itemCategoryMapper.selectCount(queryWrapper) == 0, "分类名重复");
    }

    /**
     * 批量删除物料类型
     */

    public void deleteByIds(List<Long> ids) {
        // 有子分类不能删
        LambdaQueryWrapper<ItemCategory> itemCategoryLqw = new LambdaQueryWrapper<>();
        itemCategoryLqw.in(ItemCategory::getParentId, ids);
        Assert.state(itemCategoryMapper.selectCount(itemCategoryLqw) == 0, "删除失败！请先删除该分类下的子分类！");
        // 被商品应用了不能删
        LambdaQueryWrapper<Item> itemLqw = Wrappers.lambdaQuery();
        itemLqw.in(Item::getItemCategory, ids);
        Assert.state(itemMapper.selectCount(itemLqw) == 0, "删除失败！分类已被商品使用！");
        // 删除
        LambdaQueryWrapper<ItemCategory> deleteWrapper = new LambdaQueryWrapper<>();
        deleteWrapper.in(ItemCategory::getId, ids);
        itemCategoryMapper.delete(deleteWrapper);
    }

    /**
     * @param itemTypes
     * @return
     */

    public List<ItemTypeTreeSelectVo> buildItemTypeTreeSelect(List<ItemCategoryVo> itemTypes) {
        List<ItemCategoryVo> itemTypeTrees = buildDeptTree(itemTypes);
        return itemTypeTrees.stream().map(ItemTypeTreeSelectVo::new).collect(Collectors.toList());
    }

    /**
     * 构建前端所需要树结构
     *
     * @param itemTypes 部门列表
     * @return 树结构列表
     */
    private List<ItemCategoryVo> buildDeptTree(List<ItemCategoryVo> itemTypes) {
        List<ItemCategoryVo> returnList = new ArrayList<>();
        List<Long> tempList = new ArrayList<Long>();
        for (ItemCategoryVo dept : itemTypes) {
            tempList.add(dept.getId());
        }
        for (ItemCategoryVo dept : itemTypes) {
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
    private void recursionFn(List<ItemCategoryVo> list, ItemCategoryVo t) {
        // 得到子节点列表
        List<ItemCategoryVo> childList = getChildList(list, t);
        t.setChildren(childList);
        for (ItemCategoryVo tChild : childList) {
            if (hasChild(list, tChild)) {
                recursionFn(list, tChild);
            }
        }
    }

    /**
     * 得到子节点列表
     */
    private List<ItemCategoryVo> getChildList(List<ItemCategoryVo> list, ItemCategoryVo t) {
        List<ItemCategoryVo> tlist = new ArrayList<>();
        for (ItemCategoryVo n : list) {
            if (isNotNull(n.getParentId()) && n.getParentId().longValue() == t.getId().longValue()) {
                tlist.add(n);
            }
        }
        return tlist;
    }

    /**
     * 判断是否有子节点
     */
    private boolean hasChild(List<ItemCategoryVo> list, ItemCategoryVo t) {
        return getChildList(list, t).size() > 0;
    }

    public void updateOrderNum(List<ItemTypeTreeSelectVo> tree) {
        List<ItemCategory> updateList = new ArrayList<>();
        for (int i = 0; i < tree.size(); i++) {
            ItemCategory itemType = new ItemCategory();
            itemType.setId(tree.get(i).getId());
            itemType.setOrderNum((long) i);
            updateList.add(itemType);
        }
        saveOrUpdateBatch(updateList);
    }
}
