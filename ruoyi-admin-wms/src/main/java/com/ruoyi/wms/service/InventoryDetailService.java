package com.ruoyi.wms.service;

import cn.hutool.core.collection.CollUtil;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.ruoyi.common.core.exception.base.BaseException;
import com.ruoyi.common.core.utils.MapstructUtils;
import com.ruoyi.common.core.utils.StringUtils;
import com.ruoyi.common.mybatis.core.page.PageQuery;
import com.ruoyi.common.mybatis.core.page.TableDataInfo;
import com.ruoyi.wms.domain.vo.ItemSkuVo;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import com.ruoyi.wms.domain.bo.InventoryDetailBo;
import com.ruoyi.wms.domain.entity.InventoryDetail;
import com.ruoyi.wms.domain.vo.InventoryDetailVo;
import com.ruoyi.wms.mapper.InventoryDetailMapper;

import java.math.BigDecimal;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.util.*;
import java.util.function.Function;
import java.util.stream.Collectors;

/**
 * 库存详情Service业务层处理
 *
 * @author zcc
 * @date 2024-07-22
 */
@RequiredArgsConstructor
@Service
public class InventoryDetailService extends ServiceImpl<InventoryDetailMapper, InventoryDetail> {

    private final InventoryDetailMapper inventoryDetailMapper;
    private final ItemSkuService itemSkuService;

    /**
     * 查询库存详情
     */
    public InventoryDetailVo queryById(Long id){
        return inventoryDetailMapper.selectVoById(id);
    }

    /**
     * 查询库存详情列表
     */
    public TableDataInfo<InventoryDetailVo> queryPageList(InventoryDetailBo bo, PageQuery pageQuery) {
        if (bo.getDaysToExpires() != null) {
            LocalDateTime expirationStartTime = LocalDateTime.of(LocalDate.now(), LocalTime.MIN);
            bo.setExpirationStartTime(expirationStartTime);
            LocalDateTime expirationEndTime = expirationStartTime.plusDays(bo.getDaysToExpires());
            bo.setExpirationEndTime(expirationEndTime);
        }
        Page<InventoryDetailVo> result = inventoryDetailMapper.selectPageByBo(pageQuery.build(), bo);
        return TableDataInfo.build(result);
    }

    /**
     * 查询库存详情列表
     */
    public List<InventoryDetailVo> queryList(InventoryDetailBo bo) {
        List<InventoryDetailVo> vos = inventoryDetailMapper.selectListByBo(bo);
        if (CollUtil.isEmpty(vos)) {
            return vos;
        }
        Set<Long> skuIds = vos.stream().map(InventoryDetailVo::getSkuId).collect(Collectors.toSet());
        Map<Long, ItemSkuVo> itemSkuMap = itemSkuService.queryVosByIds(skuIds).stream().collect(Collectors.toMap(ItemSkuVo::getId, Function.identity()));
        vos.forEach(it -> it.setItemSku(itemSkuMap.get(it.getSkuId())));
        return vos;
    }

    private LambdaQueryWrapper<InventoryDetail> buildQueryWrapper(InventoryDetailBo bo) {
        Map<String, Object> params = bo.getParams();
        LambdaQueryWrapper<InventoryDetail> lqw = Wrappers.lambdaQuery();
        lqw.eq(bo.getReceiptOrderId() != null, InventoryDetail::getReceiptOrderId, bo.getReceiptOrderId());
        lqw.eq(StringUtils.isNotBlank(bo.getReceiptOrderType()), InventoryDetail::getReceiptOrderType, bo.getReceiptOrderType());
        lqw.eq(StringUtils.isNotBlank(bo.getOrderNo()), InventoryDetail::getOrderNo, bo.getOrderNo());
        lqw.eq(bo.getType() != null, InventoryDetail::getType, bo.getType());
        lqw.eq(bo.getSkuId() != null, InventoryDetail::getSkuId, bo.getSkuId());
        lqw.eq(bo.getWarehouseId() != null, InventoryDetail::getWarehouseId, bo.getWarehouseId());
        lqw.eq(bo.getAreaId() != null, InventoryDetail::getAreaId, bo.getAreaId());
        lqw.eq(bo.getQuantity() != null, InventoryDetail::getQuantity, bo.getQuantity());
        lqw.eq(bo.getExpirationDate() != null, InventoryDetail::getExpirationDate, bo.getExpirationDate());
        lqw.eq(bo.getAmount() != null, InventoryDetail::getAmount, bo.getAmount());
        lqw.eq(bo.getRemainQuantity() != null, InventoryDetail::getRemainQuantity, bo.getRemainQuantity());
        return lqw;
    }

    /**
     * 新增库存详情
     */
    public void insertByBo(InventoryDetailBo bo) {
        InventoryDetail add = MapstructUtils.convert(bo, InventoryDetail.class);
        inventoryDetailMapper.insert(add);
    }

    /**
     * 修改库存详情
     */
    public void updateByBo(InventoryDetailBo bo) {
        InventoryDetail update = MapstructUtils.convert(bo, InventoryDetail.class);
        inventoryDetailMapper.updateById(update);
    }

    /**
     * 批量删除库存详情
     */
    public void deleteByIds(Collection<Long> ids) {
        inventoryDetailMapper.deleteBatchIds(ids);
    }

    /**
     * 校验入库记录剩余数
     * @param inventoryDetailBoList
     */
    public void validateRemainQuantity(List<InventoryDetailBo> inventoryDetailBoList) {
        if (CollUtil.isEmpty(inventoryDetailBoList)) {
            return;
        }
        List<InventoryDetail> inventoryDetailList = inventoryDetailMapper.selectBatchIds(inventoryDetailBoList.stream().map(InventoryDetailBo::getId).toList());
        if (CollUtil.isEmpty(inventoryDetailList)) {
            throw new BaseException("库存不足");
        }
        Map<Long, BigDecimal> remainQuantityMap = inventoryDetailList
            .stream()
            .collect(Collectors.toMap(InventoryDetail::getId, InventoryDetail::getRemainQuantity));
        boolean validResult = inventoryDetailBoList
            .stream()
            .anyMatch(inventoryDetailBo ->
                !remainQuantityMap.containsKey(inventoryDetailBo.getId())
                    || remainQuantityMap.get(inventoryDetailBo.getId()).compareTo(inventoryDetailBo.getShipmentQuantity()) < 0
            );
        if (validResult) {
            throw new BaseException("库存不足");
        }
    }

    public void clearDataWithZeroRemainQuantity() {
        LambdaQueryWrapper<InventoryDetail> wrapper = Wrappers.lambdaQuery();
        wrapper.eq(InventoryDetail::getRemainQuantity, 0);
        inventoryDetailMapper.delete(wrapper);
    }
}
