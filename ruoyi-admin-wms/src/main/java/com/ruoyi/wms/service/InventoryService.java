package com.ruoyi.wms.service;

import cn.hutool.core.collection.CollUtil;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.ruoyi.common.core.constant.HttpStatus;
import com.ruoyi.common.core.exception.ServiceException;
import com.ruoyi.common.core.utils.MapstructUtils;
import com.ruoyi.common.mybatis.core.page.PageQuery;
import com.ruoyi.common.mybatis.core.page.TableDataInfo;
import com.ruoyi.wms.domain.bo.BaseOrderDetailBo;
import com.ruoyi.wms.domain.bo.CheckOrderDetailBo;
import com.ruoyi.wms.domain.bo.InventoryBo;
import com.ruoyi.wms.domain.entity.Inventory;
import com.ruoyi.wms.domain.vo.InventoryVo;
import com.ruoyi.wms.domain.vo.ItemSkuMapVo;
import com.ruoyi.wms.mapper.InventoryMapper;
import jakarta.validation.constraints.NotEmpty;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.math.BigDecimal;
import java.util.*;
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
            Map<Long, ItemSkuMapVo> itemSkuMap = itemSkuService.queryItemSkuMapVosByIds(skuIds);
            vos.forEach(it -> {
                ItemSkuMapVo itemSkuMapVo = itemSkuMap.get(it.getSkuId());
                it.setItemSku(itemSkuMapVo.getItemSku());
                it.setItem(itemSkuMapVo.getItem());
            });
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
            return TableDataInfo.build(inventoryMapper.queryWarehouseBoardList(pageQuery.build(), bo));
    }

    public TableDataInfo<InventoryVo> queryItemBoardList(InventoryBo bo, PageQuery pageQuery) {
        Page<InventoryVo> result = inventoryMapper.queryItemBoardList(pageQuery.build(), bo);
        return TableDataInfo.build(result);
    }

    public void updateInventory(List<CheckOrderDetailBo> details) {
        List<Inventory> updateInventoryList=new LinkedList<>();
        List<Inventory> insertInventoryList=new LinkedList<>();

        details.forEach(detail -> {
            LambdaQueryWrapper<Inventory> wrapper = Wrappers.lambdaQuery();
            if(detail.getInventoryId()!=null){
                wrapper.eq(Inventory::getId,detail.getInventoryId());
                Inventory inventory = inventoryMapper.selectOne(wrapper);
                if(inventory.getQuantity().compareTo(detail.getQuantity())!=0){
                    ItemSkuMapVo itemSkuMapVo = itemSkuService.queryItemSkuMapVo(detail.getSkuId());
                    throw new ServiceException(
                        "账面库存不匹配："+itemSkuMapVo.getItem().getItemName()+"（"+itemSkuMapVo.getItemSku().getSkuName()+"）",
                        HttpStatus.CONFLICT,
                        "填写账面库存："+detail.getQuantity()+" 实际账面库存："+inventory.getQuantity());
                }else {
                    if(!inventory.getQuantity().equals(detail.getCheckQuantity())){
                        inventory.setQuantity(detail.getCheckQuantity());
                        updateInventoryList.add(inventory);
                    }
                }
            }else{
                wrapper.eq(Inventory::getSkuId,detail.getSkuId());
                wrapper.eq(Inventory::getWarehouseId,detail.getWarehouseId());
                Inventory inventory = inventoryMapper.selectOne(wrapper);
                if(inventory != null){
                    ItemSkuMapVo itemSkuMapVo = itemSkuService.queryItemSkuMapVo(detail.getSkuId());
                    throw new ServiceException(
                        "账面库存不匹配："+itemSkuMapVo.getItem().getItemName()+"（"+itemSkuMapVo.getItemSku().getSkuName()+"）",
                        HttpStatus.CONFLICT,
                        "填写账面库存：0, 实际账面库存："+inventory.getQuantity());
                }else {
                    inventory = new Inventory();
                    inventory.setSkuId(detail.getSkuId());
                    inventory.setWarehouseId(detail.getWarehouseId());
                    inventory.setQuantity(detail.getCheckQuantity());
                    insertInventoryList.add(inventory);
                }
            }
        });
        if(CollUtil.isNotEmpty(updateInventoryList)){
            inventoryMapper.updateBatchById(updateInventoryList);
        }
        if(CollUtil.isNotEmpty(insertInventoryList)){
            inventoryMapper.insertBatch(insertInventoryList);
        }
    }

    @Transactional
    public void add(List<? extends BaseOrderDetailBo> details) {
        List<Inventory> addList = new LinkedList<>();
        List<Inventory> updateList = new LinkedList<>();
        details.forEach(orderDetailsBo -> {
            LambdaQueryWrapper<Inventory> wrapper = Wrappers.lambdaQuery();
            wrapper.eq(Inventory::getWarehouseId, orderDetailsBo.getWarehouseId());
            wrapper.eq(Inventory::getSkuId, orderDetailsBo.getSkuId());
            Inventory result = inventoryMapper.selectOne(wrapper);
            if(result!=null){
                BigDecimal before = result.getQuantity();
                BigDecimal after = before.add(orderDetailsBo.getQuantity());
                result.setQuantity(after);
                orderDetailsBo.setAfterQuantity(after);
                orderDetailsBo.setBeforeQuantity(before);
                updateList.add(result);
            }else {
                orderDetailsBo.setBeforeQuantity(BigDecimal.ZERO);
                orderDetailsBo.setAfterQuantity(orderDetailsBo.getQuantity());
                Inventory inventory = MapstructUtils.convert(orderDetailsBo, Inventory.class);
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
     * @param details
     */
    @Transactional
    public void subtract(List<? extends BaseOrderDetailBo> details) {
        List<Inventory> updateList = new LinkedList<>();
        details.forEach(shipmentOrderDetailBo -> {
            LambdaQueryWrapper<Inventory> wrapper = Wrappers.lambdaQuery();
            wrapper.eq(Inventory::getWarehouseId, shipmentOrderDetailBo.getWarehouseId());
            wrapper.eq(Inventory::getSkuId, shipmentOrderDetailBo.getSkuId());
            Inventory result = inventoryMapper.selectOne(wrapper);
            if(result==null){
                ItemSkuMapVo itemSkuMapVo = itemSkuService.queryItemSkuMapVo(shipmentOrderDetailBo.getSkuId());
                throw new ServiceException("库存不足", HttpStatus.CONFLICT,itemSkuMapVo.getItem().getItemName()+"（"+itemSkuMapVo.getItemSku().getSkuName()+"）库存不足，当前库存：0");
            }
            BigDecimal beforeQuantity = result.getQuantity();
            BigDecimal afterQuantity = beforeQuantity.subtract(shipmentOrderDetailBo.getQuantity());
            if(afterQuantity.signum() == -1){
                ItemSkuMapVo itemSkuMapVo = itemSkuService.queryItemSkuMapVo(shipmentOrderDetailBo.getSkuId());
                throw new ServiceException("库存不足", HttpStatus.CONFLICT,itemSkuMapVo.getItem().getItemName()+"（"+itemSkuMapVo.getItemSku().getSkuName()+"）库存不足，当前库存："+ beforeQuantity);
            }
            shipmentOrderDetailBo.setBeforeQuantity(beforeQuantity);
            shipmentOrderDetailBo.setAfterQuantity(afterQuantity);
            result.setQuantity(afterQuantity);
            updateList.add(result);
        });
        updateBatchById(updateList);
    }

    public boolean existsByWarehouseId(Long warehouseId) {
        LambdaQueryWrapper<Inventory> lqw = Wrappers.lambdaQuery();
        lqw.eq(Inventory::getWarehouseId, warehouseId);
        return inventoryMapper.exists(lqw);
    }
}
