package com.ruoyi.wms.service;

import cn.hutool.core.collection.CollUtil;
import cn.hutool.core.util.StrUtil;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.ruoyi.common.core.utils.MapstructUtils;
import com.ruoyi.common.mybatis.core.page.PageQuery;
import com.ruoyi.common.mybatis.core.page.TableDataInfo;
import com.ruoyi.wms.domain.bo.ItemBo;
import com.ruoyi.wms.domain.bo.ItemSkuBo;
import com.ruoyi.wms.domain.entity.Item;
import com.ruoyi.wms.domain.entity.ItemCategory;
import com.ruoyi.wms.domain.entity.ItemSku;
import com.ruoyi.wms.domain.vo.ItemCategoryVo;
import com.ruoyi.wms.domain.vo.ItemSkuVo;
import com.ruoyi.wms.domain.vo.ItemVo;
import com.ruoyi.wms.mapper.ItemCategoryMapper;
import com.ruoyi.wms.mapper.ItemMapper;
import com.ruoyi.wms.mapper.ItemSkuMapper;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Collection;
import java.util.List;
import java.util.Map;
import java.util.function.Function;
import java.util.stream.Collectors;

@RequiredArgsConstructor
@Service
@Log4j2
public class ItemService {

    private final ItemMapper baseMapper;
    private final ItemSkuService itemSkuService;
    private final ItemSkuMapper itemSkuMapper;
    private final ItemCategoryMapper itemCategoryMapper;

    /**
     * 查询物料
     */

    public ItemVo queryById(Long id) {
        ItemVo item = baseMapper.selectVoById(id);
        item.setSku(itemSkuService.queryListByItemId(id));
        return item;
    }

    /**
     * 查询物料
     *
     * @param itemIds ids
     */

    public List<ItemVo> queryById(List<Long> itemIds) {
        if (itemIds == null || itemIds.isEmpty()) {
            return CollUtil.newArrayList();
        }
        LambdaQueryWrapper<Item> lambdaQueryWrapper = Wrappers.lambdaQuery();
        lambdaQueryWrapper.in(Item::getId, itemIds);
        return baseMapper.selectVoList(lambdaQueryWrapper);
    }

    /**
     * 忽略删除标识查询商品
     * @param ids
     * @return
     */
    public List<ItemVo> queryByIdsIgnoreDelFlag(Collection<Long> ids) {
        if (CollUtil.isEmpty(ids)) {
            return CollUtil.newArrayList();
        }
        return MapstructUtils.convert(baseMapper.selectByIdsIgnoreDelFlag(ids), ItemVo.class);
    }

    /**
     * 查询物料列表
     */

    public TableDataInfo<ItemVo> queryPageList(ItemBo bo, PageQuery pageQuery) {
        LambdaQueryWrapper<Item> lqw = buildQueryWrapper(bo);
        Page<ItemVo> result = baseMapper.selectVoPage(pageQuery.build(), lqw);
        List<ItemVo> itemVoList = result.getRecords();
        if (!CollUtil.isEmpty(itemVoList)) {
            LambdaQueryWrapper<ItemCategory> itemTypeWrapper = new LambdaQueryWrapper<>();
            itemTypeWrapper.in(ItemCategory::getId, itemVoList.stream().map(ItemVo::getItemCategory).collect(Collectors.toSet()));
            Map<Long, ItemCategoryVo> itemCategoryVoMap = itemCategoryMapper.selectVoList(itemTypeWrapper).stream().collect(Collectors.toMap(ItemCategoryVo::getId, Function.identity()));
            itemVoList.forEach(itemVo -> {
                itemVo.setItemCategoryInfo(itemCategoryVoMap.get(Long.valueOf(itemVo.getItemCategory())));
            });
        }
        return TableDataInfo.build(result);
    }

    /**
     * 查询物料列表
     */

    public List<ItemVo> queryList(ItemBo bo) {
        LambdaQueryWrapper<Item> lqw = buildQueryWrapper(bo);
        return baseMapper.selectVoList(lqw);
    }

    private LambdaQueryWrapper<Item> buildQueryWrapper(ItemBo bo) {
        Map<String, Object> params = bo.getParams();
        LambdaQueryWrapper<Item> lqw = Wrappers.lambdaQuery();
        lqw.eq(StrUtil.isNotBlank(bo.getItemNo()), Item::getItemNo, bo.getItemNo());
        // 主键集合
        lqw.in(!CollUtil.isEmpty(bo.getIds()), Item::getId, bo.getIds());
        lqw.like(StrUtil.isNotBlank(bo.getItemName()), Item::getItemName, bo.getItemName());
        if (!StrUtil.isBlank(bo.getItemCategory())){
            Long parentId = Long.valueOf(bo.getItemCategory());
            List<Long> subIdList = this.buildSubItemTypeIdList(parentId);
            subIdList.add(Long.valueOf(bo.getItemCategory()));
            lqw.in(Item::getItemCategory, subIdList);
        }
        lqw.eq(StrUtil.isNotBlank(bo.getUnit()), Item::getUnit, bo.getUnit());
        return lqw;
    }

    private List<Long> buildSubItemTypeIdList(Long parentId) {
        LambdaQueryWrapper<ItemCategory> itemTypeWrapper = new LambdaQueryWrapper<>();
        itemTypeWrapper.eq(ItemCategory::getParentId, parentId);
        return itemCategoryMapper.selectList(itemTypeWrapper).stream().map(ItemCategory::getId).collect(Collectors.toList());
    }

    /**
     * 新增物料
     */

//    public Boolean insertByBo(ItemBo bo) {
//        Item add = MapstructUtils.convert(bo, Item.class);
//        validEntityBeforeSave(add);
//        boolean flag = baseMapper.insert(add) > 0;
//        if (flag) {
//            bo.setId(add.getId());
//        }
//        return flag;
//    }

    /**
     * 新增物料
     *
     * @param bo
     */


    @Transactional
    public boolean insertByForm(ItemBo bo) {
        log.info("新增物料:{}", bo.getSku());
        validEntityBeforeSave(bo);
        Item item = MapstructUtils.convert(bo, Item.class);
        boolean flag = baseMapper.insert(item) > 0;
        if (flag) {
            bo.setId(item.getId());
            flag = itemSkuService.saveSku(bo.getId(), bo.getSku());
        }
        return flag;
    }



    /**
     * 修改物料
     */

//    public Boolean updateByBo(ItemBo bo) {
//        Item update = MapstructUtils.convert(bo, Item.class);
//        validEntityBeforeSave(update);
//        return baseMapper.updateById(update) > 0;
//    }

    /**
     * 修改物料
     *
     * @param bo
     */

    public Boolean updateByForm(ItemBo bo) {
        validEntityBeforeSave(bo);
        log.info("新增物料:{}", bo.getSku());
        boolean flag = baseMapper.updateById(MapstructUtils.convert(bo, Item.class)) > 0;
        if (flag) {
             flag = itemSkuService.saveSku(bo.getId(), bo.getSku());
        }
        return flag;
    }

    /**
     * 保存前的数据校验
     */
    private void validEntityBeforeSave(ItemBo entity) {
        if (!validateItemName(entity)) {
            throw new RuntimeException("商品名称重复");
        }
        if (!validateItemNo(entity)) {
            throw new RuntimeException("商品编号重复");
        }
        if (!validateItemSku(entity.getSku())) {
            throw new RuntimeException("商品规格重复");
        }
    }

    private boolean validateItemName(ItemBo item) {
        LambdaQueryWrapper<Item> queryWrapper = Wrappers.lambdaQuery();
        queryWrapper.eq(Item::getItemName, item.getItemName());
        queryWrapper.ne(item.getId() != null, Item::getId, item.getId());
        return baseMapper.selectCount(queryWrapper) == 0;
    }
    private boolean validateItemNo(ItemBo form) {
        if (StrUtil.isBlank(form.getItemNo())) {
            return true;
        }
        LambdaQueryWrapper<Item> queryWrapper = Wrappers.lambdaQuery();
        queryWrapper.eq(Item::getItemNo, form.getItemNo());
        queryWrapper.ne(form.getId() != null, Item::getId, form.getId());
        return baseMapper.selectCount(queryWrapper) == 0;
    }

    private boolean validateItemSku(List<ItemSkuBo> skuVoList) {
         return skuVoList.stream().map(ItemSkuBo::getSkuName).distinct().count() == skuVoList.size();
    }

    /**
     * 批量删除物料
     */

    public Boolean deleteWithValidByIds(Collection<Long> ids, Boolean isValid) {
        boolean flag =  baseMapper.deleteBatchIds(ids) > 0;
        if (flag) {
            LambdaQueryWrapper<ItemSku> wrapper = new LambdaQueryWrapper<>();
            wrapper.in(ItemSku::getItemId, ids);
            List<Long> skuIds = itemSkuMapper.selectList(wrapper).stream().map(ItemSku::getId).toList();
            flag = itemSkuService.batchUpdateDelFlag(skuIds) > 0;
        }
        return flag;
    }
}
