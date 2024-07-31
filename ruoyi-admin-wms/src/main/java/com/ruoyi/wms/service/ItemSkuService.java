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
import com.ruoyi.wms.mapper.ItemMapper;
import com.ruoyi.wms.mapper.ItemSkuMapper;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.context.annotation.Lazy;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.ruoyi.wms.domain.bo.ItemSkuBo;
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
    private final ItemMapper itemMapper;

    /**
     * 查询sku信息
     */

    public ItemSkuVo queryById(Long id) {
        return itemSkuMapper.selectVoById(id);
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
        lqw.eq(StrUtil.isNotBlank(bo.getBarcode()), ItemSku::getBarcode, bo.getBarcode());
        lqw.orderByDesc(ItemSku::getItemId);
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
        validateIdBeforeDelete(id);
        itemSkuMapper.deleteById(id);
    }

    private void validateIdBeforeDelete(Long id) {
        // 只有一个不能删除
        ItemSku itemSku = itemSkuMapper.selectById(id);

        if(queryListByItemId(itemSku.getItemId()).size() > 1){
            throw new BaseException("至少包含一个商品规格");
        }
        // 校验库存是否已关联
        if (inventoryService.existsBySkuIds(List.of(id))) {
            throw new ServiceException("规格" + itemSku.getSkuName() + "已有业务关联，无法删除！", HttpStatus.CONFLICT.value());
        }
    }

    private void validateSkuIdsBeforeDelete(Collection<Long> skuIds) {
        if (inventoryService.existsBySkuIds(skuIds)) {
            throw new ServiceException("商品已有业务关联，无法删除！", HttpStatus.CONFLICT.value());
        }
    }
    /**
     * 批量删除sku信息
     */

    public void deleteByIds(Collection<Long> ids) {
        // 校验库存是否已关联
        validateSkuIdsBeforeDelete(ids);
        // 删除
        itemSkuMapper.deleteBatchIds(ids);
    }

    /**
     * 批量保存商品sku
     * @param sku    商品sku
     */
    @Transactional
    public void saveOrUpdateBatchByBo(List<ItemSkuBo> sku) {
        List<ItemSku> itemSkuList = MapstructUtils.convert(sku, ItemSku.class);
        saveOrUpdateBatch(itemSkuList);
    }

    /**
     * 填充sku的编码
     * @param itemSkuList
     */
    public void setOutSkuId(List<ItemSkuBo> itemSkuList) {
        for (ItemSkuBo itemSkuBo : itemSkuList) {
            if (StrUtil.isBlank(itemSkuBo.getBarcode())) {
                itemSkuBo.setBarcode(RandomUtil.randomNumbers(8));
            }
        }
    }

    public void setItemId(List<ItemSkuBo> itemSkuList,Long itemId) {
        for (ItemSkuBo itemSkuBo : itemSkuList) {
            if (StrUtil.isBlank(itemSkuBo.getBarcode())) {
                itemSkuBo.setItemId(itemId);
            }
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

    public List<ItemSkuVo> queryVosByIds(Collection<Long> ids) {
        if (CollUtil.isEmpty(ids)) {
            return Collections.emptyList();
        }
        List<ItemSkuVo> vos = itemSkuMapper.selectVoBatchIds(ids);
        if (CollUtil.isEmpty(vos)) {
            return Collections.emptyList();
        }
        Set<Long> itemIds = vos.stream().map(ItemSkuVo::getItemId).collect(Collectors.toSet());
        Map<Long, ItemVo> itemMap = itemMapper.selectVoBatchIds(itemIds).stream().collect(Collectors.toMap(ItemVo::getId, Function.identity()));
        vos.forEach(vo -> vo.setItem(itemMap.get(vo.getItemId())));
        return vos;
    }
}
