package com.ruoyi.wms.service;

import cn.hutool.core.collection.CollUtil;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.ruoyi.common.core.utils.MapstructUtils;
import com.ruoyi.common.mybatis.core.page.TableDataInfo;
import com.ruoyi.common.mybatis.core.page.PageQuery;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.ruoyi.wms.domain.entity.InventoryDetail;
import com.ruoyi.wms.domain.vo.ItemSkuVo;
import com.ruoyi.wms.mapper.InventoryDetailMapper;
import com.ruoyi.wms.mapper.InventoryMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import com.ruoyi.wms.domain.bo.ShipmentOrderDetailBo;
import com.ruoyi.wms.domain.vo.ShipmentOrderDetailVo;
import com.ruoyi.wms.domain.entity.ShipmentOrderDetail;
import com.ruoyi.wms.mapper.ShipmentOrderDetailMapper;
import org.springframework.transaction.annotation.Transactional;

import java.math.BigDecimal;
import java.util.*;
import java.util.function.Function;
import java.util.stream.Collectors;

/**
 * 出库单详情Service业务层处理
 *
 * @author zcc
 * @date 2024-08-01
 */
@RequiredArgsConstructor
@Service
public class ShipmentOrderDetailService extends ServiceImpl<ShipmentOrderDetailMapper, ShipmentOrderDetail> {

    private final ShipmentOrderDetailMapper shipmentOrderDetailMapper;
    private final ItemSkuService itemSkuService;
    private final InventoryMapper inventoryMapper;
    private final InventoryDetailMapper inventoryDetailMapper;

    /**
     * 查询出库单详情
     */
    public ShipmentOrderDetailVo queryById(Long id){
        return shipmentOrderDetailMapper.selectVoById(id);
    }

    /**
     * 查询出库单详情列表
     */
    public TableDataInfo<ShipmentOrderDetailVo> queryPageList(ShipmentOrderDetailBo bo, PageQuery pageQuery) {
        LambdaQueryWrapper<ShipmentOrderDetail> lqw = buildQueryWrapper(bo);
        Page<ShipmentOrderDetailVo> result = shipmentOrderDetailMapper.selectVoPage(pageQuery.build(), lqw);
        return TableDataInfo.build(result);
    }

    /**
     * 查询出库单详情列表
     */
    public List<ShipmentOrderDetailVo> queryList(ShipmentOrderDetailBo bo) {
        LambdaQueryWrapper<ShipmentOrderDetail> lqw = buildQueryWrapper(bo);
        return shipmentOrderDetailMapper.selectVoList(lqw);
    }

    private LambdaQueryWrapper<ShipmentOrderDetail> buildQueryWrapper(ShipmentOrderDetailBo bo) {
        Map<String, Object> params = bo.getParams();
        LambdaQueryWrapper<ShipmentOrderDetail> lqw = Wrappers.lambdaQuery();
        lqw.eq(bo.getShipmentOrderId() != null, ShipmentOrderDetail::getShipmentOrderId, bo.getShipmentOrderId());
        lqw.eq(bo.getSkuId() != null, ShipmentOrderDetail::getSkuId, bo.getSkuId());
        lqw.eq(bo.getQuantity() != null, ShipmentOrderDetail::getQuantity, bo.getQuantity());
        lqw.eq(bo.getAmount() != null, ShipmentOrderDetail::getAmount, bo.getAmount());
        lqw.eq(bo.getWarehouseId() != null, ShipmentOrderDetail::getWarehouseId, bo.getWarehouseId());
        lqw.eq(bo.getAreaId() != null, ShipmentOrderDetail::getAreaId, bo.getAreaId());
        return lqw;
    }

    /**
     * 新增出库单详情
     */
    public void insertByBo(ShipmentOrderDetailBo bo) {
        ShipmentOrderDetail add = MapstructUtils.convert(bo, ShipmentOrderDetail.class);
        shipmentOrderDetailMapper.insert(add);
    }

    /**
     * 修改出库单详情
     */
    public void updateByBo(ShipmentOrderDetailBo bo) {
        ShipmentOrderDetail update = MapstructUtils.convert(bo, ShipmentOrderDetail.class);
        shipmentOrderDetailMapper.updateById(update);
    }

    /**
     * 批量删除出库单详情
     */
    public void deleteByIds(Collection<Long> ids) {
        shipmentOrderDetailMapper.deleteBatchIds(ids);
    }

    @Transactional
    public void saveDetails(List<ShipmentOrderDetail> list) {
        if (CollUtil.isEmpty(list)) {
            return;
        }
        saveOrUpdateBatch(list);
    }

    public List<ShipmentOrderDetailVo> queryByShipmentOrderId(Long shipmentOrderId) {
        ShipmentOrderDetailBo bo = new ShipmentOrderDetailBo();
        bo.setShipmentOrderId(shipmentOrderId);
        List<ShipmentOrderDetailVo> details = queryList(bo);
        if (CollUtil.isEmpty(details)) {
            return Collections.EMPTY_LIST;
        }
        // 查规格
        Set<Long> skuIds = details
            .stream()
            .map(ShipmentOrderDetailVo::getSkuId)
            .collect(Collectors.toSet());
        Map<Long, ItemSkuVo> itemSkuMap = itemSkuService.queryVosByIds(skuIds)
            .stream()
            .collect(Collectors.toMap(ItemSkuVo::getId, Function.identity()));
        // 查剩余库存
        List<Long> inventoryDetailIds = details
            .stream()
            .map(ShipmentOrderDetailVo::getInventoryDetailId)
            .toList();
        Map<Long, BigDecimal> remainQuantityMap = inventoryDetailMapper.selectBatchIds(inventoryDetailIds)
            .stream()
            .collect(Collectors.toMap(InventoryDetail::getId, InventoryDetail::getRemainQuantity));
        details.forEach(detail -> {
            detail.setItemSku(itemSkuMap.get(detail.getSkuId()));
            detail.setRemainQuantity(remainQuantityMap.getOrDefault(detail.getInventoryDetailId(), BigDecimal.ZERO));
        });
        return details;
    }
}
