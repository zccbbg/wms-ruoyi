package com.ruoyi.wms.service;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.ruoyi.common.core.utils.MapstructUtils;
import com.ruoyi.common.mybatis.core.page.PageQuery;
import com.ruoyi.common.mybatis.core.page.TableDataInfo;
import com.ruoyi.wms.domain.bo.InventoryHistoryBo;
import com.ruoyi.wms.domain.entity.InventoryHistory;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import com.ruoyi.wms.domain.vo.InventoryHistoryVo;
import com.ruoyi.wms.mapper.InventoryHistoryMapper;

import java.util.Collection;
import java.util.List;
import java.util.Map;

/**
 * 库存记录Service业务层处理
 *
 * @author zcc
 * @date 2024-07-22
 */
@RequiredArgsConstructor
@Service
public class InventoryHistoryService extends ServiceImpl<InventoryHistoryMapper, InventoryHistory> {

    private final InventoryHistoryMapper inventoryHistoryMapper;

    /**
     * 查询库存记录
     */
    public InventoryHistoryVo queryById(Long id){
        return inventoryHistoryMapper.selectVoById(id);
    }

    /**
     * 查询库存记录列表
     */
    public TableDataInfo<InventoryHistoryVo> queryPageList(InventoryHistoryBo bo, PageQuery pageQuery) {
        Page<InventoryHistoryVo> result = inventoryHistoryMapper.selectVoPageByBo(pageQuery.build(), bo);
        return TableDataInfo.build(result);
    }

    /**
     * 查询库存记录列表
     */
    public List<InventoryHistoryVo> queryList(InventoryHistoryBo bo) {
        LambdaQueryWrapper<InventoryHistory> lqw = buildQueryWrapper(bo);
        return inventoryHistoryMapper.selectVoList(lqw);
    }

    private LambdaQueryWrapper<InventoryHistory> buildQueryWrapper(InventoryHistoryBo bo) {
        Map<String, Object> params = bo.getParams();
        LambdaQueryWrapper<InventoryHistory> lqw = Wrappers.lambdaQuery();
        lqw.eq(bo.getOrderId() != null, InventoryHistory::getOrderId, bo.getOrderId());
        lqw.eq(bo.getOrderType() != null, InventoryHistory::getOrderType, bo.getOrderType());
        lqw.eq(bo.getSkuId() != null, InventoryHistory::getSkuId, bo.getSkuId());
        lqw.eq(bo.getQuantity() != null, InventoryHistory::getQuantity, bo.getQuantity());
        lqw.eq(bo.getWarehouseId() != null, InventoryHistory::getWarehouseId, bo.getWarehouseId());
        lqw.eq(bo.getAreaId() != null, InventoryHistory::getAreaId, bo.getAreaId());
        return lqw;
    }

    /**
     * 新增库存记录
     */
    public void insertByBo(InventoryHistoryBo bo) {
        InventoryHistory add = MapstructUtils.convert(bo, InventoryHistory.class);
        inventoryHistoryMapper.insert(add);
    }

    /**
     * 修改库存记录
     */
    public void updateByBo(InventoryHistoryBo bo) {
        InventoryHistory update = MapstructUtils.convert(bo, InventoryHistory.class);
        inventoryHistoryMapper.updateById(update);
    }

    /**
     * 批量删除库存记录
     */
    public void deleteByIds(Collection<Long> ids) {
        inventoryHistoryMapper.deleteBatchIds(ids);
    }
}
