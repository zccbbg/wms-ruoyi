package com.ruoyi.wms.service;

import cn.hutool.core.collection.CollUtil;
import cn.hutool.core.lang.Assert;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.ruoyi.common.core.constant.ServiceConstants;
import com.ruoyi.common.core.exception.ServiceException;
import com.ruoyi.common.core.exception.base.BaseException;
import com.ruoyi.common.core.utils.MapstructUtils;
import com.ruoyi.common.core.utils.StringUtils;
import com.ruoyi.common.mybatis.core.domain.BaseEntity;
import com.ruoyi.common.mybatis.core.page.PageQuery;
import com.ruoyi.common.mybatis.core.page.TableDataInfo;
import com.ruoyi.common.satoken.utils.LoginHelper;
import com.ruoyi.wms.domain.bo.*;
import com.ruoyi.wms.domain.entity.InventoryHistory;
import com.ruoyi.wms.domain.entity.ShipmentOrder;
import com.ruoyi.wms.domain.entity.ShipmentOrderDetail;
import com.ruoyi.wms.domain.vo.ShipmentOrderVo;
import com.ruoyi.wms.mapper.InventoryDetailMapper;
import com.ruoyi.wms.mapper.ShipmentOrderMapper;
import jakarta.validation.constraints.NotEmpty;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDateTime;
import java.util.*;

/**
 * 出库单Service业务层处理
 *
 * @author zcc
 * @date 2024-08-01
 */
@RequiredArgsConstructor
@Service
public class ShipmentOrderService {

    private final ShipmentOrderMapper shipmentOrderMapper;
    private final ShipmentOrderDetailService shipmentOrderDetailService;
    private final InventoryService inventoryService;
    private final InventoryDetailMapper inventoryDetailMapper;
    private final InventoryHistoryService inventoryHistoryService;
    private final InventoryDetailService inventoryDetailService;

    /**
     * 查询出库单
     */
    public ShipmentOrderVo queryById(Long id){
        ShipmentOrderVo shipmentOrderVo = shipmentOrderMapper.selectVoById(id);
        if (shipmentOrderVo == null) {
            throw new BaseException("出库单不存在");
        }
        shipmentOrderVo.setDetails(shipmentOrderDetailService.queryByShipmentOrderId(shipmentOrderVo.getId()));
        return shipmentOrderVo;
    }

    /**
     * 查询出库单列表
     */
    public TableDataInfo<ShipmentOrderVo> queryPageList(ShipmentOrderBo bo, PageQuery pageQuery) {
        LambdaQueryWrapper<ShipmentOrder> lqw = buildQueryWrapper(bo);
        Page<ShipmentOrderVo> result = shipmentOrderMapper.selectVoPage(pageQuery.build(), lqw);
        return TableDataInfo.build(result);
    }

    /**
     * 查询出库单列表
     */
    public List<ShipmentOrderVo> queryList(ShipmentOrderBo bo) {
        LambdaQueryWrapper<ShipmentOrder> lqw = buildQueryWrapper(bo);
        return shipmentOrderMapper.selectVoList(lqw);
    }

    private LambdaQueryWrapper<ShipmentOrder> buildQueryWrapper(ShipmentOrderBo bo) {
        Map<String, Object> params = bo.getParams();
        LambdaQueryWrapper<ShipmentOrder> lqw = Wrappers.lambdaQuery();
        lqw.eq(StringUtils.isNotBlank(bo.getShipmentOrderNo()), ShipmentOrder::getShipmentOrderNo, bo.getShipmentOrderNo());
        lqw.eq(bo.getShipmentOrderType() != null, ShipmentOrder::getShipmentOrderType, bo.getShipmentOrderType());
        lqw.eq(StringUtils.isNotBlank(bo.getOrderNo()), ShipmentOrder::getOrderNo, bo.getOrderNo());
        lqw.eq(bo.getMerchantId() != null, ShipmentOrder::getMerchantId, bo.getMerchantId());
        lqw.eq(bo.getReceivableAmount() != null, ShipmentOrder::getReceivableAmount, bo.getReceivableAmount());
        lqw.eq(bo.getTotalQuantity() != null, ShipmentOrder::getTotalQuantity, bo.getTotalQuantity());
        lqw.eq(bo.getShipmentOrderStatus() != null, ShipmentOrder::getShipmentOrderStatus, bo.getShipmentOrderStatus());
        lqw.orderByDesc(BaseEntity::getCreateTime);
        return lqw;
    }

    /**
     * 暂存出库单
     */
    @Transactional
    public void insertByBo(ShipmentOrderBo bo) {
        // 校验出库单号唯一性
        validateShipmentOrderNo(bo.getShipmentOrderNo());
        // 创建出库单
        ShipmentOrder add = MapstructUtils.convert(bo, ShipmentOrder.class);
        shipmentOrderMapper.insert(add);
        bo.setId(add.getId());
        List<ShipmentOrderDetailBo> detailBoList = bo.getDetails();
        List<ShipmentOrderDetail> addDetailList = MapstructUtils.convert(detailBoList, ShipmentOrderDetail.class);
        addDetailList.forEach(it -> it.setShipmentOrderId(add.getId()));
        shipmentOrderDetailService.saveDetails(addDetailList);
    }

    public void validateShipmentOrderNo(String shipmentOrderNo) {
        LambdaQueryWrapper<ShipmentOrder> receiptOrderLqw = Wrappers.lambdaQuery();
        receiptOrderLqw.eq(ShipmentOrder::getShipmentOrderNo, shipmentOrderNo);
        ShipmentOrder shipmentOrder = shipmentOrderMapper.selectOne(receiptOrderLqw);
        Assert.isNull(shipmentOrder, "出库单号重复，请手动修改");
    }


    /**
     * 修改出库单
     */
    @Transactional
    public void updateByBo(ShipmentOrderBo bo) {
        // 更新出库单
        ShipmentOrder update = MapstructUtils.convert(bo, ShipmentOrder.class);
        shipmentOrderMapper.updateById(update);
        // 保存出库单明细
        List<ShipmentOrderDetail> detailList = MapstructUtils.convert(bo.getDetails(), ShipmentOrderDetail.class);
        detailList.forEach(it -> it.setShipmentOrderId(bo.getId()));
        shipmentOrderDetailService.saveDetails(detailList);
    }

    /**
     * 批量删除出库单
     */
    public void deleteById(Long id) {
        validateIdBeforeDelete(id);
        shipmentOrderMapper.deleteById(id);
    }

    public void validateIdBeforeDelete(Long id) {
        ShipmentOrderVo shipmentOrderVo = queryById(id);
        if (shipmentOrderVo == null) {
            throw new BaseException("出库单不存在");
        }
        if (ServiceConstants.ShipmentOrderStatus.FINISH.equals(shipmentOrderVo.getShipmentOrderStatus())) {
            throw new ServiceException("出库单【" + shipmentOrderVo.getShipmentOrderNo() + "】已出库，无法删除！", HttpStatus.CONFLICT.value());
        }
    }

    /**
     * 出库
     * @param bo
     */
    @Transactional
    public void shipment(ShipmentOrderBo bo) {
        // 1.校验商品明细不能为空！
        validateBeforeShipment(bo);
        // 2.按仓库库区规格合并商品明细数量
        List<InventoryBo> mergedInventoryBoList = mergeShipmentOrderDetailByPlaceAndItem(bo.getDetails());
        // 3.校验库存明细
        List<InventoryDetailBo> inventoryDetailBoList = convertShipmentOrderDetailToInventoryDetail(bo.getDetails());
        inventoryDetailService.validateRemainQuantity(inventoryDetailBoList);
        // 4. 保存入库单和入库单明细
        if (Objects.isNull(bo.getId())) {
            insertByBo(bo);
        } else {
            updateByBo(bo);
        }
        // 5.更新库存：Inventory表
        mergedInventoryBoList.forEach(mergedInventoryBo -> mergedInventoryBo.setQuantity(mergedInventoryBo.getQuantity().negate()));
        inventoryService.updateInventoryQuantity(mergedInventoryBoList);
        // 6.更新库存明细：InventoryHistory表
        inventoryDetailMapper.deductInventoryDetailQuantity(inventoryDetailBoList, LoginHelper.getUsername(), LocalDateTime.now());
        // 7.创建库存记录
        saveInventoryHistory(bo);
    }

    /**
     * 按仓库库区规格合并商品明细的数量
     * @param shipmentOrderDetailBoList
     * @return
     */
    public List<InventoryBo> mergeShipmentOrderDetailByPlaceAndItem(@NotEmpty List<ShipmentOrderDetailBo> shipmentOrderDetailBoList) {
        Map<String, InventoryBo> mergedMap = new HashMap<>();
        shipmentOrderDetailBoList.forEach(detail -> {
            String mergedKey = detail.getKey();
            if (mergedMap.containsKey(mergedKey)) {
                InventoryBo mergedInventoryBo = mergedMap.get(mergedKey);
                mergedInventoryBo.setQuantity(mergedInventoryBo.getQuantity().add(detail.getQuantity()));
                return;
            }
            InventoryBo mergedInventoryBo = new InventoryBo();
            mergedInventoryBo.setWarehouseId(detail.getWarehouseId());
            mergedInventoryBo.setAreaId(detail.getAreaId());
            mergedInventoryBo.setSkuId(detail.getSkuId());
            mergedInventoryBo.setQuantity(detail.getQuantity());
            mergedMap.put(mergedKey, mergedInventoryBo);
        });
        return new ArrayList<>(mergedMap.values());
    }


    public List<InventoryDetailBo> convertShipmentOrderDetailToInventoryDetail(List<ShipmentOrderDetailBo> shipmentOrderDetailBoList) {
        return shipmentOrderDetailBoList
            .stream()
            .map(detail -> {
                InventoryDetailBo inventoryDetailBo = new InventoryDetailBo();
                inventoryDetailBo.setId(detail.getInventoryDetailId());
                inventoryDetailBo.setShipmentQuantity(detail.getQuantity());
                return inventoryDetailBo;
            }).toList();
    }

    private void saveInventoryHistory(ShipmentOrderBo bo){
        List<InventoryHistory> inventoryHistoryList = new LinkedList<>();
        bo.getDetails().forEach(detail -> {
            InventoryHistory inventoryHistory = new InventoryHistory();
            inventoryHistory.setOrderId(bo.getId());
            inventoryHistory.setOrderNo(bo.getShipmentOrderNo());
            inventoryHistory.setOrderType(ServiceConstants.InventoryHistoryOrderType.SHIPMENT);
            inventoryHistory.setSkuId(detail.getSkuId());
            inventoryHistory.setQuantity(detail.getQuantity().negate());
            inventoryHistory.setWarehouseId(detail.getWarehouseId());
            inventoryHistory.setAreaId(detail.getAreaId());
            inventoryHistory.setBatchNo(detail.getBatchNo());
            inventoryHistory.setProductionDate(detail.getProductionDate());
            inventoryHistory.setExpirationDate(detail.getExpirationDate());
            inventoryHistory.setAmount(detail.getAmount());
            inventoryHistoryList.add(inventoryHistory);
        });
        inventoryHistoryService.saveBatch(inventoryHistoryList);
    }

    private void validateBeforeShipment(ShipmentOrderBo bo) {
        if (CollUtil.isEmpty(bo.getDetails())) {
            throw new BaseException("商品明细不能为空！");
        }
    }
}
