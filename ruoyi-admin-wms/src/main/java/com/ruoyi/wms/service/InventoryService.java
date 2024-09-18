package com.ruoyi.wms.service;

import cn.hutool.core.collection.CollUtil;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.ruoyi.common.core.constant.HttpStatus;
import com.ruoyi.common.core.exception.ServiceException;
import com.ruoyi.common.core.utils.MapstructUtils;
import com.ruoyi.common.core.utils.ValidatorUtils;
import com.ruoyi.common.core.validate.AddGroup;
import com.ruoyi.common.mybatis.core.page.PageQuery;
import com.ruoyi.common.mybatis.core.page.TableDataInfo;
import com.ruoyi.wms.domain.bo.InventoryBo;
import com.ruoyi.wms.domain.entity.Inventory;
import com.ruoyi.wms.domain.vo.InventoryVo;
import com.ruoyi.wms.domain.vo.ItemSkuVo;
import com.ruoyi.wms.mapper.InventoryMapper;
import jakarta.validation.constraints.NotEmpty;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.math.BigDecimal;
import java.util.*;
import java.util.function.Function;
import java.util.stream.Collectors;

/**
 * 库存Service业务层处理
 *
 * @author zcc
 * @date 2024-07-19
 */
@RequiredArgsConstructor
@Service
public class InventoryService extends ServiceImpl<InventoryMapper, Inventory> {

    private final InventoryMapper inventoryMapper;
    private final ItemSkuService itemSkuService;

    /**
     * 查询库存
     */
    public InventoryVo queryById(Long id){
        return inventoryMapper.selectVoById(id);
    }

    /**
     * 查询库存列表
     */
    public List<InventoryVo> queryList(InventoryBo bo) {
        LambdaQueryWrapper<Inventory> lqw = buildQueryWrapper(bo);
        List<InventoryVo> vos = inventoryMapper.selectVoList(lqw);
        if(CollUtil.isNotEmpty(vos)){
            Set<Long> skuIds = vos.stream().map(InventoryVo::getSkuId).collect(Collectors.toSet());
            Map<Long, ItemSkuVo> itemSkuMap = itemSkuService.queryVosByIds(skuIds).stream().collect(Collectors.toMap(ItemSkuVo::getId, Function.identity()));
            vos.forEach(it -> it.setItemSku(itemSkuMap.get(it.getSkuId())));
        }
        return vos;
    }

    private LambdaQueryWrapper<Inventory> buildQueryWrapper(InventoryBo bo) {
        LambdaQueryWrapper<Inventory> wrapper = Wrappers.lambdaQuery();
        wrapper.eq(bo.getSkuId() != null, Inventory::getSkuId, bo.getSkuId());
        wrapper.eq(bo.getWarehouseId() != null, Inventory::getWarehouseId, bo.getWarehouseId());
        wrapper.eq(bo.getQuantity() != null, Inventory::getQuantity, bo.getQuantity());
        return wrapper;
    }

    /**
     * 新增库存
     */
    public void insertByBo(InventoryBo bo) {
        Inventory add = MapstructUtils.convert(bo, Inventory.class);
        inventoryMapper.insert(add);
    }

    /**
     * 修改库存
     */
    public void updateByBo(InventoryBo bo) {
        Inventory update = MapstructUtils.convert(bo, Inventory.class);
        inventoryMapper.updateById(update);
    }

    /**
     * 批量删除库存
     */
    public void deleteByIds(Collection<Long> ids) {
        inventoryMapper.deleteBatchIds(ids);
    }

    /**
     * 增加库存
     * @param list
     */
    @Transactional
    public void addInventoryQuantity(List<InventoryBo> list) {
        list.forEach(inventoryBo -> {
            ValidatorUtils.validate(inventoryBo, AddGroup.class);
        });

        List<Inventory> addList = new LinkedList<>();
        List<Inventory> updateList = new LinkedList<>();
        list.forEach(inventoryBo -> {
            LambdaQueryWrapper<Inventory> wrapper = Wrappers.lambdaQuery();
            wrapper.eq(Inventory::getWarehouseId, inventoryBo.getWarehouseId());
            wrapper.eq(Inventory::getSkuId, inventoryBo.getSkuId());
            Inventory result = inventoryMapper.selectOne(wrapper);
            if(result!=null){
                result.setQuantity(result.getQuantity().add(inventoryBo.getQuantity()));
                updateList.add(result);
            }else {
                Inventory inventory = MapstructUtils.convert(inventoryBo, Inventory.class);
                addList.add(inventory);
            }
        });
        if (addList.size() > 0) {
            saveBatch(addList);
        }
        if (updateList.size() > 0) {
            updateBatchById(updateList);
        }
    }

    /**
     * 扣减库存
     * @param list
     */
    @Transactional
    public void subtractInventoryQuantity(List<InventoryBo> list) {
        list.forEach(inventoryBo -> {
            ValidatorUtils.validate(inventoryBo, AddGroup.class);
        });

        List<Inventory> updateList = new LinkedList<>();
        list.forEach(inventoryBo -> {
            LambdaQueryWrapper<Inventory> wrapper = Wrappers.lambdaQuery();
            wrapper.eq(Inventory::getWarehouseId, inventoryBo.getWarehouseId());
            wrapper.eq(Inventory::getSkuId, inventoryBo.getSkuId());
            Inventory result = inventoryMapper.selectOne(wrapper);
            if(result==null){
                ItemSkuVo itemSkuVo = itemSkuService.queryById(inventoryBo.getSkuId());
                throw new ServiceException("库存不足", HttpStatus.NOT_ACCEPTABLE,itemSkuVo.getItem().getItemName()+"（"+itemSkuVo.getSkuName()+"）库存不足，当前库存：0");
            }
            BigDecimal quantity = result.getQuantity().subtract(inventoryBo.getQuantity());
            if(quantity.signum() == -1){
                ItemSkuVo itemSkuVo = itemSkuService.queryById(inventoryBo.getSkuId());
                throw new ServiceException("库存不足", HttpStatus.NOT_ACCEPTABLE,itemSkuVo.getItem().getItemName()+"（"+itemSkuVo.getSkuName()+"）库存不足，当前库存："+result.getQuantity());
            }
            result.setQuantity(quantity);
            updateList.add(result);
        });
        updateBatchById(updateList);
    }

    /**
     * 校验规格是否有库存
     * @param skuIds
     * @return
     */
    public boolean existsBySkuIds(@NotEmpty Collection<Long> skuIds) {
        LambdaQueryWrapper<Inventory> lqw = Wrappers.lambdaQuery();
        lqw.in(Inventory::getSkuId, skuIds);
        return inventoryMapper.exists(lqw);
    }

    public TableDataInfo<InventoryVo> queryWarehouseBoardList(InventoryBo bo, PageQuery pageQuery) {
            TableDataInfo<InventoryVo> tableDataInfo = TableDataInfo.build(inventoryMapper.selectBoardPageByWarehouse(pageQuery.build(), bo));
            if (CollUtil.isEmpty(tableDataInfo.getRows())) {
                return tableDataInfo;
            }
            Set<Long> skuIds = tableDataInfo.getRows().stream().map(InventoryVo::getSkuId).collect(Collectors.toSet());
            Map<Long, ItemSkuVo> skuMap = itemSkuService.queryVosByIds(skuIds).stream().collect(Collectors.toMap(ItemSkuVo::getId, Function.identity()));
            tableDataInfo.getRows().forEach(it -> {
                ItemSkuVo itemSku = skuMap.get(it.getSkuId());
                it.setItemSku(itemSku);
                it.setItem(itemSku.getItem());
            });
            return tableDataInfo;
    }

    public TableDataInfo<InventoryVo> queryItemBoardList(InventoryBo bo, PageQuery pageQuery) {
        Page<InventoryVo> result = inventoryMapper.queryItemBoardList(pageQuery.build(), bo);
        return TableDataInfo.build(result);
    }

}
