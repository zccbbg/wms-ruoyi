package com.ruoyi.wms.service;

import cn.hutool.core.collection.CollUtil;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.ruoyi.common.core.utils.MapstructUtils;
import com.ruoyi.common.mybatis.core.page.PageQuery;
import com.ruoyi.common.mybatis.core.page.TableDataInfo;
import com.ruoyi.common.satoken.utils.LoginHelper;
import com.ruoyi.wms.domain.bo.InventoryBo;
import com.ruoyi.wms.domain.entity.Inventory;
import com.ruoyi.wms.domain.vo.InventoryVo;
import com.ruoyi.wms.mapper.InventoryMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDateTime;
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
        LambdaQueryWrapper<Inventory> lqw = buildQueryWrapper(bo);
        Page<InventoryVo> result = inventoryMapper.selectVoPage(pageQuery.build(), lqw);
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
        Map<String, Object> params = bo.getParams();
        LambdaQueryWrapper<Inventory> lqw = Wrappers.lambdaQuery();
        lqw.eq(bo.getSkuId() != null, Inventory::getSkuId, bo.getSkuId());
        lqw.eq(bo.getWarehouseId() != null, Inventory::getWarehouseId, bo.getWarehouseId());
        lqw.eq(bo.getAreaId() != null, Inventory::getAreaId, bo.getAreaId());
        lqw.eq(bo.getQuantity() != null, Inventory::getQuantity, bo.getQuantity());
        return lqw;
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
    public synchronized void updateInventoryQuantity(List<Inventory> list) {
        Function<Inventory, String> keyFunction = it -> it.getWarehouseId() + "_" + it.getAreaId() + "_" + it.getSkuId();
        Map<String, Long> existMap = inventoryMapper.selectList().stream().collect(Collectors.toMap(keyFunction, Inventory::getId));
        List<Inventory> addList = new LinkedList<>();
        List<Inventory> updateList = new LinkedList<>();
        list.forEach(it -> {
            Long inventoryId = existMap.get(keyFunction.apply(it));
            if (inventoryId != null) {
                it.setId(inventoryId);
                updateList.add(it);
            } else {
                addList.add(it);
            }
        });
        if (addList.size() > 0) {
            saveBatch(addList);
        }
        if (updateList.size() > 0) {
            inventoryMapper.updateQuantity(updateList, LocalDateTime.now(), LoginHelper.getUsername());
        }
    }

    /**
     * 校验规格是否有库存
     * @param skuIds
     * @return
     */
    public boolean checkInventoryBySkuIds(Collection<Long> skuIds) {
        if (CollUtil.isEmpty(skuIds)) {
            return false;
        }
        LambdaQueryWrapper<Inventory> lqw = Wrappers.lambdaQuery();
        lqw.in(Inventory::getSkuId, skuIds);
        Long count = inventoryMapper.selectCount(lqw);
        return count != null && count > 0;
    }

    /**
     * 校验该库区是否有库存
     * @param areaIds
     * @return
     */
    public boolean checkInventoryByAreaIds(Collection<Long> areaIds) {
        if (CollUtil.isEmpty(areaIds)) {
            return false;
        }
        LambdaQueryWrapper<Inventory> lqw = Wrappers.lambdaQuery();
        lqw.in(Inventory::getAreaId, areaIds);
        Long count = inventoryMapper.selectCount(lqw);
        return count != null && count > 0;
    }
}
