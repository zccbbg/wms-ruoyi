package com.ruoyi.wms.service;

import cn.hutool.core.collection.CollUtil;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.ruoyi.common.core.exception.base.BaseException;
import com.ruoyi.common.core.utils.MapstructUtils;
import com.ruoyi.common.core.utils.ValidatorUtils;
import com.ruoyi.common.core.validate.AddGroup;
import com.ruoyi.common.mybatis.core.domain.PlaceAndItem;
import com.ruoyi.common.mybatis.core.page.PageQuery;
import com.ruoyi.common.mybatis.core.page.TableDataInfo;
import com.ruoyi.wms.domain.bo.*;
import com.ruoyi.wms.domain.entity.Inventory;
import com.ruoyi.wms.domain.vo.InventoryVo;
import com.ruoyi.wms.mapper.InventoryMapper;
import jakarta.validation.constraints.NotEmpty;
import jakarta.validation.constraints.NotNull;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.BeanUtils;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Collection;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
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
    private final InventoryDetailService inventoryDetailService;

    /**
     * 查询库存
     */
    public InventoryVo queryById(Long id){
        return inventoryMapper.selectVoById(id);
    }

    /**
     * 查询库存列表
     */
    public TableDataInfo<InventoryVo> queryPageList(InventoryBo bo, PageQuery pageQuery) {
        Page<InventoryVo> result = inventoryMapper.selectVoPageByBo(pageQuery.build(), bo);
        return TableDataInfo.build(result);
    }

    /**
     * 查询库存列表
     */
    public List<InventoryVo> queryList(InventoryBo bo) {
        LambdaQueryWrapper<Inventory> lqw = buildQueryWrapper(bo);
        return inventoryMapper.selectVoList(lqw);
    }

    private LambdaQueryWrapper<Inventory> buildQueryWrapper(InventoryBo bo) {
        LambdaQueryWrapper<Inventory> wrapper = Wrappers.lambdaQuery();
        wrapper.eq(bo.getSkuId() != null, Inventory::getSkuId, bo.getSkuId());
        wrapper.eq(bo.getWarehouseId() != null, Inventory::getWarehouseId, bo.getWarehouseId());
        wrapper.eq(bo.getAreaId() != null, Inventory::getAreaId, bo.getAreaId());
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
     * 更新库存
     * @param list
     */
    @Transactional
    public synchronized void updateInventoryQuantity(List<InventoryBo> list) {
        list.forEach(inventoryBo -> {
            ValidatorUtils.validate(inventoryBo, AddGroup.class);
        });

        List<Inventory> addList = new LinkedList<>();
        List<Inventory> updateList = new LinkedList<>();
        list.forEach(inventoryBo -> {
            LambdaQueryWrapper<Inventory> wrapper = Wrappers.lambdaQuery();
            wrapper.eq(Inventory::getWarehouseId, inventoryBo.getWarehouseId());
            wrapper.eq(Inventory::getAreaId, inventoryBo.getAreaId());
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
     * 校验规格是否有库存
     * @param skuIds
     * @return
     */
    public boolean existsBySkuIds(@NotEmpty Collection<Long> skuIds) {
        LambdaQueryWrapper<Inventory> lqw = Wrappers.lambdaQuery();
        lqw.in(Inventory::getSkuId, skuIds);
        return inventoryMapper.exists(lqw);
    }

    /**
     * 校验该库区是否有库存
     * @param areaIds
     * @return
     */
    public boolean existsByAreaIds(@NotEmpty Collection<Long> areaIds) {
        LambdaQueryWrapper<Inventory> lqw = Wrappers.lambdaQuery();
        lqw.in(Inventory::getAreaId, areaIds);
        return inventoryMapper.exists(lqw);
    }

    /**
     * 校验库存并计算出库数据
     * @param warehouseId
     * @param inventoryBoList
     */
    public ShipmentDataBo validateInventoryAndCalcShipmentData(@NotNull Long warehouseId, @NotEmpty List<InventoryBo> inventoryBoList) {
        List<InventoryBo> shipmentInventoryList = validateInventoryAndCalcShipmentInventoryData(warehouseId, inventoryBoList);
        List<InventoryDetailBo> shipmentInventoryDetailList = inventoryDetailService.calcShipmentInventoryDetailData(warehouseId, inventoryBoList);
        ShipmentDataBo shipmentDataBo = new ShipmentDataBo(shipmentInventoryDetailList, shipmentInventoryList);
        return shipmentDataBo;
    }

    public List<InventoryBo> validateInventoryAndCalcShipmentInventoryData(@NotNull Long warehouseId, @NotEmpty List<InventoryBo> inventoryBoList) {
        LambdaQueryWrapper<Inventory> inventoryLambdaQueryWrapper = Wrappers.lambdaQuery();
        inventoryLambdaQueryWrapper.eq(Inventory::getWarehouseId, warehouseId);
        inventoryLambdaQueryWrapper.in(Inventory::getAreaId, inventoryBoList.stream().map(InventoryBo::getAreaId).toList());
        inventoryLambdaQueryWrapper.gt(Inventory::getQuantity, 0);
        List<Inventory> inventoryList = inventoryMapper.selectList(inventoryLambdaQueryWrapper);
        if (CollUtil.isEmpty(inventoryList)) {
            throw new BaseException("库存不足");
        }
        Map<String, Inventory> inventoryMap = inventoryList.stream().collect(Collectors.toMap(PlaceAndItem::getKey, Function.identity()));
        List<InventoryBo> shipmentData = new LinkedList<>();
        for (InventoryBo bo : inventoryBoList) {
            Inventory inventory = inventoryMap.get(bo.getKey());
            if (inventory == null || inventory.getQuantity().compareTo(bo.getQuantity()) < 0) {
                throw new BaseException("库存不足");
            }
            InventoryBo addData = new InventoryBo();
            BeanUtils.copyProperties(bo, addData);
            addData.setQuantity(bo.getQuantity().negate());
            shipmentData.add(addData);
        }
        return shipmentData;
    }
}
