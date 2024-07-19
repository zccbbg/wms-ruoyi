package com.ruoyi.wms.service;

import cn.hutool.core.collection.CollUtil;
import cn.hutool.core.util.RandomUtil;
import cn.hutool.core.util.StrUtil;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.conditions.update.LambdaUpdateWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.ruoyi.common.core.utils.MapstructUtils;
import com.ruoyi.common.mybatis.core.page.PageQuery;
import com.ruoyi.common.mybatis.core.page.TableDataInfo;
import com.ruoyi.wms.domain.bo.ItemSkuBo;
import com.ruoyi.wms.domain.entity.ItemCategory;
import com.ruoyi.wms.domain.entity.ItemSku;
import com.ruoyi.wms.domain.vo.ItemSkuVo;
import com.ruoyi.wms.domain.vo.ItemVo;
import com.ruoyi.wms.mapper.ItemCategoryMapper;
import com.ruoyi.wms.mapper.ItemMapper;
import com.ruoyi.wms.mapper.ItemSkuMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.context.annotation.Lazy;
import org.springframework.stereotype.Service;

import java.util.*;
import java.util.function.Function;
import java.util.stream.Collectors;

@RequiredArgsConstructor(onConstructor_ = {@Lazy})
@Service
public class ItemSkuService extends ServiceImpl<ItemSkuMapper, ItemSku> {


    private final ItemSkuMapper itemSkuMapper;
    private final ItemService itemService;
    private final ItemCategoryMapper itemCategoryMapper;
    private final ItemMapper itemMapper;

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


    /**
     * 批量删除sku信息
     */

    public Boolean deleteByIds(Collection<Long> ids) {
        return itemSkuMapper.deleteBatchIds(ids) > 0;
    }

    /**
     * 批量新增商品sku
     * 1.a)校验传入sku规格条码彼此唯一性。 b)校验传入sku和不同商品下sku唯一性
     * 2.查询商品未删sku
     * 3.比较传入的sku和1中查到的，标记需要删除的sku
     * 4.批量删除，更新，新增....
     *
     * @param itemId 商品id
     * @param sku    商品sku
     */

    public void saveSku(Long itemId, List<ItemSkuBo> sku) {
        // 校验，填充条码
        this.generateOutSkuId(sku, itemId);
        List<ItemSkuVo> itemSkuInDb = this.queryListByItemId(itemId);
        //商品在库里的sku为空，肯定是新增，直接批量插入就行了
        if (CollUtil.isEmpty(itemSkuInDb)) {
            sku.forEach(item -> item.setItemId(itemId));
            itemSkuMapper.insertBatch(MapstructUtils.convert(sku, ItemSku.class));
        }
        // 标记删除集合
        List<ItemSkuVo> deleteList = this.markDeleteItemSkuList(sku, itemSkuInDb);
        // 批量删除
        this.batchUpdateDelFlag(deleteList.stream().map(ItemSkuVo::getId).collect(Collectors.toList()));
        // 批量新增sku
        // 遍历sku绑定商品id
        sku.forEach(item -> item.setItemId(itemId));
        // 筛出更新和新增集合
        List<ItemSkuBo> addList = sku.stream().filter(it -> it.getId() == null).toList();
        List<ItemSkuBo> updateList = sku.stream().filter(it -> it.getId() != null).toList();
        // 批量新增
        if (CollUtil.isNotEmpty(addList)) {
            saveBatch(MapstructUtils.convert(addList, ItemSku.class));
        }
        if (CollUtil.isNotEmpty(updateList)) {
            saveOrUpdateBatch(MapstructUtils.convert(updateList, ItemSku.class));
        }
    }

    /**
     * 标记需要删除的sku
     *
     * @param saveList 需要保存的sku
     * @param dbList   库中的sku
     * @return 删除集合
     */
    private List<ItemSkuVo> markDeleteItemSkuList(List<ItemSkuBo> saveList, List<ItemSkuVo> dbList) {
        List<ItemSkuVo> deleteList = new ArrayList<>();
        Map<Long, ItemSkuBo> saveMap = saveList.stream().collect(Collectors.toMap(ItemSkuBo::getId, Function.identity(), (v1, v2) -> v1));
        dbList.forEach(item -> {
            if (saveMap.get(item.getId()) == null) {
                deleteList.add(item);
            }
        });
        return deleteList;
    }

    private boolean validateOutSkuIdIfExist(List<ItemSkuVo> skuVoList) {
        ArrayList<ItemSkuVo> collect =
            skuVoList.stream().collect(Collectors.collectingAndThen(
                Collectors.toCollection(() -> new TreeSet<>(Comparator.comparing(ItemSkuVo::getOutSkuId))), ArrayList::new));
        if (collect.size() < skuVoList.size()) {
            return true;
        }
        Long itemId = skuVoList.get(0).getItemId();
        LambdaQueryWrapper<ItemSku> wrapper = new LambdaQueryWrapper<>();
        wrapper.in(ItemSku::getOutSkuId, skuVoList.stream().map(ItemSkuVo::getOutSkuId).toList());
        List<ItemSku> itemSkuList = itemSkuMapper.selectList(wrapper);
        return itemSkuList.size() > 0 && itemSkuList.stream().anyMatch(it -> !it.getItemId().equals(itemId));
    }

    private void generateOutSkuId(List<ItemSkuBo> skuVoList, Long itemId) {
        // 先校验用户填的条码是否唯一 1.本商品下比较 2.与库里其余sku比较
        List<ItemSkuBo> hasOutSkuIdList = skuVoList.stream().filter(it -> StrUtil.isNotBlank(it.getOutSkuId())).toList();
        ArrayList<ItemSkuBo> validateHasResult = hasOutSkuIdList.stream().collect(Collectors.collectingAndThen(
            Collectors.toCollection(() -> new TreeSet<>(Comparator.comparing(ItemSkuBo::getOutSkuId))), ArrayList::new));
        if (validateHasResult.size() < hasOutSkuIdList.size()) {
            throw new RuntimeException("规格条码重复");
        }
        LambdaQueryWrapper<ItemSku> wrapper = Wrappers.lambdaQuery();
        if (CollUtil.isNotEmpty(hasOutSkuIdList)) {
            wrapper.in(ItemSku::getOutSkuId, hasOutSkuIdList.stream().map(ItemSkuBo::getOutSkuId).toList());
            wrapper.ne(ItemSku::getItemId, itemId);
            Long countResult = itemSkuMapper.selectCount(wrapper);
            if (countResult != null && countResult > 0L) {
                throw new RuntimeException("条码重复");
            }
        }
        // 拿库里非本商品的sku
        wrapper.clear();
        wrapper.eq(ItemSku::getItemId, itemId);
        List<ItemSku> skuListInDb = itemSkuMapper.selectList(wrapper);
        // 循环生成未填条码，校验通过加入sku中
        for (ItemSkuBo itemSkuVo : skuVoList) {
            if (StrUtil.isBlank(itemSkuVo.getOutSkuId())) {
                boolean flag = true;
                while (flag) {
                    String outSkuId = RandomUtil.randomNumbers(8);
                    flag = hasOutSkuIdList.stream().anyMatch(it -> it.getOutSkuId().equals(outSkuId));
                    if (!flag) {
                        flag = skuListInDb.stream().anyMatch(it -> it.getOutSkuId().equals(outSkuId));
                    }
                    if (!flag) {
                        itemSkuVo.setOutSkuId(outSkuId);
                    }
                }
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

    /**
     * 批量软删除sku
     *
     * @param itemSkuIds
     */
    public void batchUpdateDelFlag(Collection<Long> itemSkuIds) {
        if (CollUtil.isEmpty(itemSkuIds)) {
            return;
        }
        LambdaUpdateWrapper<ItemSku> wrapper = new LambdaUpdateWrapper<>();
        wrapper.in(ItemSku::getId, itemSkuIds);
        wrapper.set(ItemSku::getDelFlag, 2);
        itemSkuMapper.update(null, wrapper);
    }
}
