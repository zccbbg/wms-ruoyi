package com.ruoyi.wms.service;

import cn.hutool.core.collection.CollUtil;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.ruoyi.common.core.utils.MapstructUtils;
import com.ruoyi.common.mybatis.core.page.TableDataInfo;
import com.ruoyi.common.mybatis.core.page.PageQuery;
import com.ruoyi.common.core.utils.StringUtils;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.ruoyi.wms.domain.entity.MovementOrderDetail;
import com.ruoyi.wms.domain.vo.InventoryDetailVo;
import com.ruoyi.wms.domain.vo.ItemSkuVo;
import com.ruoyi.wms.domain.vo.MovementOrderDetailVo;
import com.ruoyi.wms.mapper.InventoryDetailMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import com.ruoyi.wms.domain.bo.CheckOrderDetailBo;
import com.ruoyi.wms.domain.vo.CheckOrderDetailVo;
import com.ruoyi.wms.domain.entity.CheckOrderDetail;
import com.ruoyi.wms.mapper.CheckOrderDetailMapper;
import org.springframework.transaction.annotation.Transactional;

import java.math.BigDecimal;
import java.util.*;
import java.util.function.Function;
import java.util.stream.Collectors;

/**
 * 库存盘点单据详情Service业务层处理
 *
 * @author zcc
 * @date 2024-08-13
 */
@RequiredArgsConstructor
@Service
public class CheckOrderDetailService extends ServiceImpl<CheckOrderDetailMapper, CheckOrderDetail> {

    private final CheckOrderDetailMapper checkOrderDetailMapper;
    private final ItemSkuService itemSkuService;
    private final InventoryDetailMapper inventoryDetailMapper;

    /**
     * 查询库存盘点单据详情
     */
    public CheckOrderDetailVo queryById(Long id){
        return checkOrderDetailMapper.selectVoById(id);
    }

    /**
     * 查询库存盘点单据详情列表
     */
    public TableDataInfo<CheckOrderDetailVo> queryPageList(CheckOrderDetailBo bo, PageQuery pageQuery) {
        LambdaQueryWrapper<CheckOrderDetail> lqw = buildQueryWrapper(bo);
        Page<CheckOrderDetailVo> result = checkOrderDetailMapper.selectVoPage(pageQuery.build(), lqw);
        if (CollUtil.isEmpty(result.getRecords())) {
            return TableDataInfo.build(result);
        }
        Set<Long> skuIds = result.getRecords().stream().map(CheckOrderDetailVo::getSkuId).collect(Collectors.toSet());
        Map<Long, ItemSkuVo> itemSkuMap = itemSkuService.queryVosByIds(skuIds)
            .stream()
            .collect(Collectors.toMap(ItemSkuVo::getId, Function.identity()));
        result.getRecords().forEach(detail -> detail.setItemSku(itemSkuMap.get(detail.getSkuId())));
        return TableDataInfo.build(result);
    }

    /**
     * 查询库存盘点单据详情列表
     */
    public List<CheckOrderDetailVo> queryList(CheckOrderDetailBo bo) {
        LambdaQueryWrapper<CheckOrderDetail> lqw = buildQueryWrapper(bo);
        return checkOrderDetailMapper.selectVoList(lqw);
    }

    private LambdaQueryWrapper<CheckOrderDetail> buildQueryWrapper(CheckOrderDetailBo bo) {
        Map<String, Object> params = bo.getParams();
        LambdaQueryWrapper<CheckOrderDetail> lqw = Wrappers.lambdaQuery();
        lqw.eq(bo.getCheckOrderId() != null, CheckOrderDetail::getCheckOrderId, bo.getCheckOrderId());
        lqw.eq(bo.getSkuId() != null, CheckOrderDetail::getSkuId, bo.getSkuId());
        lqw.eq(bo.getQuantity() != null, CheckOrderDetail::getQuantity, bo.getQuantity());
        lqw.eq(bo.getCheckQuantity() != null, CheckOrderDetail::getCheckQuantity, bo.getCheckQuantity());
        lqw.eq(bo.getWarehouseId() != null, CheckOrderDetail::getWarehouseId, bo.getWarehouseId());
        lqw.eq(bo.getAreaId() != null, CheckOrderDetail::getAreaId, bo.getAreaId());
        lqw.eq(bo.getInventoryDetailId() != null, CheckOrderDetail::getInventoryDetailId, bo.getInventoryDetailId());
        lqw.apply(bo.getHaveProfitAndLoss() != null && bo.getHaveProfitAndLoss(), "quantity != check_quantity");
        return lqw;
    }

    /**
     * 新增库存盘点单据详情
     */
    public void insertByBo(CheckOrderDetailBo bo) {
        CheckOrderDetail add = MapstructUtils.convert(bo, CheckOrderDetail.class);
        checkOrderDetailMapper.insert(add);
    }

    /**
     * 修改库存盘点单据详情
     */
    public void updateByBo(CheckOrderDetailBo bo) {
        CheckOrderDetail update = MapstructUtils.convert(bo, CheckOrderDetail.class);
        checkOrderDetailMapper.updateById(update);
    }

    /**
     * 批量删除库存盘点单据详情
     */
    public void deleteByIds(Collection<Long> ids) {
        checkOrderDetailMapper.deleteBatchIds(ids);
    }

    @Transactional
    public void saveDetails(List<CheckOrderDetail> list) {
        if (CollUtil.isEmpty(list)) {
            return;
        }
        saveOrUpdateBatch(list);
    }

    public List<CheckOrderDetailVo> queryByCheckOrderId(Long checkOrderId) {
        CheckOrderDetailBo bo = new CheckOrderDetailBo();
        bo.setCheckOrderId(checkOrderId);
        List<CheckOrderDetailVo> details = queryList(bo);
        if (CollUtil.isEmpty(details)) {
            return Collections.emptyList();
        }
        Set<Long> skuIds = details
            .stream()
            .map(CheckOrderDetailVo::getSkuId)
            .collect(Collectors.toSet());
        Map<Long, ItemSkuVo> itemSkuMap = itemSkuService.queryVosByIds(skuIds)
            .stream()
            .collect(Collectors.toMap(ItemSkuVo::getId, Function.identity()));
        List<Long> inventoryDetailIds = details.stream().map(CheckOrderDetailVo::getInventoryDetailId).toList();
        Map<Long, BigDecimal> remainQuantityMap = inventoryDetailMapper.selectVoBatchIds(inventoryDetailIds)
            .stream().collect(Collectors.toMap(InventoryDetailVo::getId, InventoryDetailVo::getRemainQuantity));
        details.forEach(it -> {
            it.setItemSku(itemSkuMap.get(it.getSkuId()));
            it.setRemainQuantity(remainQuantityMap.getOrDefault(it.getInventoryDetailId(), BigDecimal.ZERO));
        });
        return details;
    }
}
