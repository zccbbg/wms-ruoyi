package com.ruoyi.wms.service;

import cn.hutool.core.collection.CollUtil;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.ruoyi.common.core.exception.base.BaseException;
import com.ruoyi.common.core.utils.MapstructUtils;
import com.ruoyi.common.core.utils.StringUtils;
import com.ruoyi.common.mybatis.core.domain.BaseEntity;
import com.ruoyi.common.mybatis.core.domain.PlaceAndItem;
import com.ruoyi.common.mybatis.core.page.PageQuery;
import com.ruoyi.common.mybatis.core.page.TableDataInfo;
import com.ruoyi.wms.domain.bo.InventoryBo;
import jakarta.validation.constraints.NotEmpty;
import jakarta.validation.constraints.NotNull;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import com.ruoyi.wms.domain.bo.InventoryDetailBo;
import com.ruoyi.wms.domain.entity.InventoryDetail;
import com.ruoyi.wms.domain.vo.InventoryDetailVo;
import com.ruoyi.wms.mapper.InventoryDetailMapper;

import java.math.BigDecimal;
import java.util.*;
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
        Page<InventoryDetailVo> result = inventoryDetailMapper.selectPageByBo(pageQuery.build(), bo);
        return TableDataInfo.build(result);
    }

    /**
     * 查询库存详情列表
     */
    public List<InventoryDetailVo> queryList(InventoryDetailBo bo) {
        LambdaQueryWrapper<InventoryDetail> lqw = buildQueryWrapper(bo);
        return inventoryDetailMapper.selectVoList(lqw);
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
        lqw.eq(bo.getExpirationTime() != null, InventoryDetail::getExpirationTime, bo.getExpirationTime());
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
     * 计算出库数据
     * @param warehouseId
     * @param inventoryBoList
     */
    public List<InventoryDetailBo> calcShipmentInventoryDetailData(@NotNull Long warehouseId, @NotEmpty List<InventoryBo> inventoryBoList) {
        LambdaQueryWrapper<InventoryDetail> inventoryDetailLambdaQueryWrapper = Wrappers.lambdaQuery();
        inventoryDetailLambdaQueryWrapper.eq(InventoryDetail::getWarehouseId, warehouseId);
        inventoryDetailLambdaQueryWrapper.in(InventoryDetail::getAreaId, inventoryBoList.stream().map(InventoryBo::getAreaId).toList());
        inventoryDetailLambdaQueryWrapper.gt(InventoryDetail::getRemainQuantity, 0);
        inventoryDetailLambdaQueryWrapper.orderByAsc(InventoryDetail::getSkuId, InventoryDetail::getWarehouseId, InventoryDetail::getAreaId, BaseEntity::getCreateTime);
        List<InventoryDetail> inventoryDetailList = inventoryDetailMapper.selectList(inventoryDetailLambdaQueryWrapper);
        if (CollUtil.isEmpty(inventoryDetailList)) {
            throw new BaseException("库存不足");
        }
        Set<String> inventoryDetailSizeGroupByKey = inventoryDetailList.stream().map(PlaceAndItem::getKey).collect(Collectors.toSet());
        if (inventoryDetailSizeGroupByKey.size() < inventoryBoList.size()) {
            throw new BaseException("库存不足");
        }
        // 计算得到的出库数据集合
        List<InventoryDetailBo> shipmentList = new LinkedList<>();
        // 本次需出库数map
        Map<String, BigDecimal> needMap = inventoryBoList.stream().collect(Collectors.toMap(PlaceAndItem::getKey, InventoryBo::getQuantity));
        String lastKey = "";
        for (InventoryDetail detail : inventoryDetailList) {
            String currentKey = detail.getKey();
            if (!needMap.containsKey(currentKey)) {
                continue;
            }
            BigDecimal needQuantity = needMap.get(currentKey);
            if (lastKey.equals(currentKey) && needQuantity.compareTo(BigDecimal.ZERO) > 0) {
                // 该位置下商品还有入库明细，看下需要出库的数量是否为0，大于0继续出，小于等于0直接跳过
                allocateShipmentData(needMap, needQuantity, currentKey, MapstructUtils.convert(detail, InventoryDetailBo.class), shipmentList);
            } else if (!lastKey.equals(currentKey)) {
                // 如果不一样，看下上一个位置下的商品剩余数是否为0，不为0则库存不足了
                if (!"".equals(lastKey) && needMap.get(lastKey).compareTo(BigDecimal.ZERO) > 0) {
                    throw new BaseException("库存不足");
                }
                // 上一个足够，继续下一个
                allocateShipmentData(needMap, needQuantity, currentKey, MapstructUtils.convert(detail, InventoryDetailBo.class), shipmentList);
            }
            lastKey = currentKey;
        }
        return shipmentList;
    }

    /**
     * 分配出库的inventoryDetail
     * @param needMap 所需出库数据map
     * @param needQuantity 所需出库数
     * @param currentKey 当前key
     * @param detail 当前入库记录
     * @param shipmentInventoryDetailDataBoList 最终分配数据集
     */
    private void allocateShipmentData(Map<String, BigDecimal> needMap, BigDecimal needQuantity, String currentKey, InventoryDetailBo detail, List<InventoryDetailBo> shipmentInventoryDetailDataBoList) {
        // 计算这条入库明细可出多少数量
        BigDecimal shipmentQuantity = needQuantity.compareTo(detail.getRemainQuantity()) > 0 ? detail.getRemainQuantity() : needQuantity;
        // 更新所需出库数据map
        needMap.put(currentKey, needQuantity.subtract(shipmentQuantity));
        // 放入最终出库数据集
        detail.setShipmentQuantity(shipmentQuantity);
        shipmentInventoryDetailDataBoList.add(detail);
    }
}
