package com.ruoyi.wms.service;

import cn.hutool.core.collection.CollUtil;
import cn.hutool.core.util.RandomUtil;
import cn.hutool.core.util.StrUtil;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.ruoyi.common.core.exception.ServiceException;
import com.ruoyi.common.core.exception.base.BaseException;
import com.ruoyi.common.core.utils.MapstructUtils;
import com.ruoyi.common.mybatis.core.page.PageQuery;
import com.ruoyi.common.mybatis.core.page.TableDataInfo;
import com.ruoyi.wms.mapper.ItemSkuMapper;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.context.annotation.Lazy;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.ruoyi.wms.domain.bo.ItemSkuBo;
import com.ruoyi.wms.domain.entity.ItemCategory;
import com.ruoyi.wms.domain.entity.ItemSku;
import com.ruoyi.wms.domain.vo.ItemSkuVo;
import com.ruoyi.wms.domain.vo.ItemVo;
import com.ruoyi.wms.mapper.ItemCategoryMapper;

import java.util.*;
import java.util.function.Function;
import java.util.stream.Collectors;

@RequiredArgsConstructor(onConstructor_ = {@Lazy})
@Service
@Slf4j
public class ItemSkuService extends ServiceImpl<ItemSkuMapper, ItemSku> {


    private final ItemSkuMapper itemSkuMapper;
    private final ItemService itemService;
    private final ItemCategoryMapper itemCategoryMapper;
    private final InventoryService inventoryService;

    /**
     * 查询sku信息
     */

    public ItemSkuVo queryById(Long id) {
        return itemSkuMapper.selectVoById(id);
    }

    /**
     * 根据skuId查询sku信息
     *
     * @param itemIds skuId
     */

    public List<ItemSkuVo> queryByIds(List<Long> itemIds) {
        LambdaQueryWrapper<ItemSku> lambdaQueryWrapper = Wrappers.lambdaQuery();
        lambdaQueryWrapper.in(ItemSku::getItemId, itemIds);
        List<ItemSkuVo> itemSkuVos = itemSkuMapper.selectVoList();
        // 注入itemName
        injectItemInfo(itemSkuVos);
        return itemSkuVos;
    }

    /**
     * 根据itemId忽略逻辑删除标识查询sku信息
     * @param itemIds
     * @return
     */
    public List<ItemSkuVo> queryByIdsIgnoreDelFlag(Collection<Long> itemIds) {
        if (CollUtil.isEmpty(itemIds)) {
            return CollUtil.newArrayList();
        }
        List<ItemSkuVo> skuVoList = MapstructUtils.convert(itemSkuMapper.selectByIdsIgnoreDelFlag(itemIds), ItemSkuVo.class);
        injectItemInfo(skuVoList);
        return skuVoList;
    }

    /**
     * 查询sku信息列表，用于出入库的选择组件
     */

    public TableDataInfo<ItemSkuVo> queryPageList(ItemSkuBo bo, PageQuery pageQuery) {
        //开始查sku
        IPage<ItemSkuVo> result = itemSkuMapper.selectByBo(pageQuery.build(), bo);
        return TableDataInfo.build(result);
    }

    /**
     * 注入itemName
     *
     * @param records sku信息列表
     */
    private void injectItemInfo(List<ItemSkuVo> records) {
        List<Long> itemIds = records.stream().map(ItemSkuVo::getItemId).toList();
        if (!CollUtil.isEmpty(itemIds)) {
            Map<Long, ItemVo> itemMap = itemService.queryByIdsIgnoreDelFlag(itemIds).stream().collect(Collectors.toMap(ItemVo::getId, Function.identity()));
            records.forEach(itemSkuVo -> {
                ItemVo itemVo = itemMap.get(itemSkuVo.getItemId());
                itemSkuVo.setItemName(itemVo.getItemName());
                itemSkuVo.setItemNo(itemVo.getItemNo());
                itemSkuVo.setItemId(itemVo.getId());
            });
        }

    }

    private void injectItemTypeName(List<ItemSkuVo> records) {
        List<Long> itemIdList = records.stream().map(ItemSkuVo::getItemId).toList();
        if (CollUtil.isNotEmpty(itemIdList)) {
            List<ItemVo> itemVos = itemService.queryById(itemIdList);
            Map<Long, String> itemToCategoryMap = itemVos.stream().collect(Collectors.toMap(ItemVo::getId, ItemVo::getItemCategory));
            Set<String> typeSet = itemVos.stream().map(ItemVo::getItemCategory).collect(Collectors.toSet());
            LambdaQueryWrapper<ItemCategory> wrapper = new LambdaQueryWrapper<>();
            wrapper.in(ItemCategory::getId, typeSet);
            Map<Long, ItemCategory> itemCategoryMap = itemCategoryMapper.selectList(wrapper).stream().collect(Collectors.toMap(ItemCategory::getId, Function.identity()));
            records.forEach(itemSkuVo -> {
                itemSkuVo.setItemCategoryName(itemCategoryMap.get(Long.valueOf(itemToCategoryMap.get(itemSkuVo.getItemId()))).getCategoryName());
                itemSkuVo.setItemCategoryId(itemCategoryMap.get(Long.valueOf(itemToCategoryMap.get(itemSkuVo.getItemId()))).getId());
            });
        }
    }

    /**
     * 查询sku信息列表
     */

    public List<ItemSkuVo> queryList(ItemSkuBo bo) {
        LambdaQueryWrapper<ItemSku> lqw = buildQueryWrapper(bo);
        return itemSkuMapper.selectVoList(lqw);
    }

    private LambdaQueryWrapper<ItemSku> buildQueryWrapper(ItemSkuBo bo) {
        Map<String, Object> params = bo.getParams();
        LambdaQueryWrapper<ItemSku> lqw = Wrappers.lambdaQuery();
        lqw.like(StrUtil.isNotBlank(bo.getSkuName()), ItemSku::getSkuName, bo.getSkuName());
        lqw.eq(bo.getItemId() != null, ItemSku::getItemId, bo.getItemId());
        lqw.eq(StrUtil.isNotBlank(bo.getOutSkuId()), ItemSku::getOutSkuId, bo.getOutSkuId());
        return lqw;
    }

    /**
     * 新增sku信息
     */

    public Boolean insertByBo(ItemSkuBo bo) {
        ItemSku add = MapstructUtils.convert(bo, ItemSku.class);
        return itemSkuMapper.insert(add) > 0;
    }

    /**
     * 修改sku信息
     */

    public Boolean updateByBo(ItemSkuBo bo) {
        ItemSku update = MapstructUtils.convert(bo, ItemSku.class);
        return itemSkuMapper.updateById(update) > 0;
    }

    public void deleteById(Long id) {
        validIdBeforeDelete(id);
        itemSkuMapper.deleteById(id);
    }

    private void validIdBeforeDelete(Long id) {
        // 只有一个不能删除
        ItemSku itemSku = itemSkuMapper.selectById(id);

        if(queryListByItemId(itemSku.getItemId()).size() > 1){
            throw new BaseException("至少包含一个商品规格");
        }
        // 校验库存是否已关联
        if (inventoryService.checkInventoryBySkuIds(List.of(id))) {
            throw new ServiceException("规格" + itemSku.getSkuName() + "已有业务关联，无法删除！", HttpStatus.CONFLICT.value());
        }
    }

    /**
     * 批量删除sku信息
     */

    public Boolean deleteByIds(Collection<Long> ids) {
        // 校验库存是否已关联
        if (inventoryService.checkInventoryBySkuIds(ids)) {
            return false;
        }
        // 删除
        itemSkuMapper.deleteBatchIds(ids);
        return true;
    }

    /**
     * 批量保存商品sku
     * @param itemId 商品id
     * @param sku    商品sku
     */
    @Transactional
    public void saveSku(Long itemId, List<ItemSkuBo> sku) {
        List<ItemSku> itemSkuList = MapstructUtils.convert(sku, ItemSku.class);
        // 填充条码和itemId
        this.populate(itemSkuList, itemId);
        saveOrUpdateBatch(itemSkuList);
    }

    /**
     * 填充sku的条码和itemId
     * @param itemSkuList
     * @param itemId
     */
    public void populate(List<ItemSku> itemSkuList, Long itemId) {
        for (ItemSku itemSku : itemSkuList) {
            if (StrUtil.isBlank(itemSku.getOutSkuId())) {
                itemSku.setOutSkuId(RandomUtil.randomNumbers(8));
            }
            itemSku.setItemId(itemId);
        }
    }

    /**
     * 查询sku列表
     *
     * @param id 商品id
     */

    public List<ItemSkuVo> queryListByItemId(Long id) {
        LambdaQueryWrapper<ItemSku> lqw = Wrappers.lambdaQuery();
        lqw.eq(ItemSku::getItemId, id);
        return itemSkuMapper.selectVoList(lqw);
    }

    public List<ItemSku> queryByItemIds(Collection<Long> itemIds) {
        if (CollUtil.isEmpty(itemIds)) {
            return Collections.emptyList();
        }
        LambdaQueryWrapper<ItemSku> lqw = Wrappers.lambdaQuery();
        lqw.in(ItemSku::getItemId, itemIds);
        return itemSkuMapper.selectList(lqw);
    }
}
