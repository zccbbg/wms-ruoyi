package com.ruoyi.wms.service;

import cn.hutool.core.collection.CollUtil;
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
import com.ruoyi.wms.domain.bo.InventoryBo;
import com.ruoyi.wms.domain.bo.InventoryDetailBo;
import com.ruoyi.wms.domain.bo.MovementOrderBo;
import com.ruoyi.wms.domain.bo.MovementOrderDetailBo;
import com.ruoyi.wms.domain.entity.InventoryDetail;
import com.ruoyi.wms.domain.entity.InventoryHistory;
import com.ruoyi.wms.domain.entity.MovementOrder;
import com.ruoyi.wms.domain.entity.MovementOrderDetail;
import com.ruoyi.wms.domain.vo.MovementOrderVo;
import com.ruoyi.wms.mapper.InventoryDetailMapper;
import com.ruoyi.wms.mapper.MovementOrderMapper;
import jakarta.validation.constraints.NotEmpty;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDateTime;
import java.util.*;

/**
 * 移库单Service业务层处理
 *
 * @author zcc
 * @date 2024-08-09
 */
@RequiredArgsConstructor
@Service
public class MovementOrderService {

    private final MovementOrderMapper movementOrderMapper;
    private final MovementOrderDetailService movementOrderDetailService;
    private final InventoryService inventoryService;
    private final InventoryDetailService inventoryDetailService;
    private final InventoryDetailMapper inventoryDetailMapper;
    private final InventoryHistoryService inventoryHistoryService;


    /**
     * 查询移库单
     */
    public MovementOrderVo queryById(Long id) {
        MovementOrderVo movementOrderVo = movementOrderMapper.selectVoById(id);
        if (movementOrderVo == null) {
            throw new BaseException("移库单不存在");
        }
        movementOrderVo.setDetails(movementOrderDetailService.queryByMovementOrderId(id));
        return movementOrderVo;
    }

    /**
     * 查询移库单列表
     */
    public TableDataInfo<MovementOrderVo> queryPageList(MovementOrderBo bo, PageQuery pageQuery) {
        LambdaQueryWrapper<MovementOrder> lqw = buildQueryWrapper(bo);
        Page<MovementOrderVo> result = movementOrderMapper.selectVoPage(pageQuery.build(), lqw);
        return TableDataInfo.build(result);
    }

    /**
     * 查询移库单列表
     */
    public List<MovementOrderVo> queryList(MovementOrderBo bo) {
        LambdaQueryWrapper<MovementOrder> lqw = buildQueryWrapper(bo);
        return movementOrderMapper.selectVoList(lqw);
    }

    private LambdaQueryWrapper<MovementOrder> buildQueryWrapper(MovementOrderBo bo) {
        Map<String, Object> params = bo.getParams();
        LambdaQueryWrapper<MovementOrder> lqw = Wrappers.lambdaQuery();
        lqw.eq(StringUtils.isNotBlank(bo.getMovementOrderNo()), MovementOrder::getMovementOrderNo, bo.getMovementOrderNo());
        lqw.eq(bo.getSourceWarehouseId() != null, MovementOrder::getSourceWarehouseId, bo.getSourceWarehouseId());
        lqw.eq(bo.getSourceAreaId() != null, MovementOrder::getSourceAreaId, bo.getSourceAreaId());
        lqw.eq(bo.getTargetWarehouseId() != null, MovementOrder::getTargetWarehouseId, bo.getTargetWarehouseId());
        lqw.eq(bo.getTargetAreaId() != null, MovementOrder::getTargetAreaId, bo.getTargetAreaId());
        lqw.eq(bo.getMovementOrderStatus() != null, MovementOrder::getMovementOrderStatus, bo.getMovementOrderStatus());
        lqw.eq(bo.getTotalQuantity() != null, MovementOrder::getTotalQuantity, bo.getTotalQuantity());
        lqw.orderByDesc(BaseEntity::getCreateTime);
        return lqw;
    }

    /**
     * 新增移库单
     */
    @Transactional
    public void insertByBo(MovementOrderBo bo) {
        // 1.校验移库单号唯一性
        validateMovementOrderNo(bo.getMovementOrderNo());
        // 2.创建移库单
        MovementOrder add = MapstructUtils.convert(bo, MovementOrder.class);
        movementOrderMapper.insert(add);
        bo.setId(add.getId());
        // 3.创建移库单明细
        List<MovementOrderDetail> addDetailList = MapstructUtils.convert(bo.getDetails(), MovementOrderDetail.class);
        addDetailList.forEach(it -> {
            it.setMovementOrderId(add.getId());
        });
        movementOrderDetailService.saveDetails(addDetailList);
    }

    private void validateMovementOrderNo(String movementOrderNo) {
        LambdaQueryWrapper<MovementOrder> lambdaQueryWrapper = Wrappers.lambdaQuery();
        lambdaQueryWrapper.eq(MovementOrder::getMovementOrderNo, movementOrderNo);
        if (movementOrderMapper.exists(lambdaQueryWrapper)) {
            throw new BaseException("移库单号重复，请手动修改");
        }
    }

    /**
     * 修改移库单
     */
    @Transactional
    public void updateByBo(MovementOrderBo bo) {
        // 1.更新移库单
        MovementOrder update = MapstructUtils.convert(bo, MovementOrder.class);
        movementOrderMapper.updateById(update);
        // 2.保存移库单明细
        List<MovementOrderDetail> detailList = MapstructUtils.convert(bo.getDetails(), MovementOrderDetail.class);
        detailList.forEach(it -> it.setMovementOrderId(bo.getId()));
        movementOrderDetailService.saveDetails(detailList);
    }

    /**
     * 删除移库单
     * @param id
     */
    public void deleteById(Long id) {
        validateIdBeforeDelete(id);
        movementOrderMapper.deleteById(id);
    }

    private void validateIdBeforeDelete(Long id) {
        MovementOrderVo movementOrderVo = queryById(id);
        if (movementOrderVo == null) {
            throw new BaseException("移库单不存在");
        }
        if (ServiceConstants.MovementOrderStatus.FINISH.equals(movementOrderVo.getMovementOrderStatus())) {
            throw new ServiceException("移库单【" + movementOrderVo.getMovementOrderNo() + "】已移库，无法删除！");
        }
    }

    /**
     * 批量删除移库单
     */
    public void deleteByIds(Collection<Long> ids) {
        movementOrderMapper.deleteBatchIds(ids);
    }

    /**
     * 移库
     * @param bo
     */
    @Transactional
    public void move(MovementOrderBo bo) {

        List<InventoryDetailBo> inventoryDetailBoList = convertMovementOrderDetailToInventoryDetail(bo.getDetails());

        // 1.校验商品明细不能为空！
        validateBeforeMove(bo);

        // 2.校验库存记录
        inventoryDetailService.validateRemainQuantity(inventoryDetailBoList);

        // 3.保存移库单核移库单明细
        if (Objects.isNull(bo.getId())) {
            insertByBo(bo);
        } else {
            updateByBo(bo);
        }
        // 4.更新库存Inventory
        List<InventoryBo> mergedShipmentInventoryList = mergeShipmentDetailByPlaceAndItem(bo.getDetails());
        List<InventoryBo> mergedReceiptInventoryList = mergeReceiptDetailByPlaceAndItem(bo.getDetails());
        mergedShipmentInventoryList.forEach(mergedShipmentInventory -> mergedShipmentInventory.setQuantity(mergedShipmentInventory.getQuantity().negate()));
        inventoryService.updateInventoryQuantity(mergedShipmentInventoryList);
        inventoryService.updateInventoryQuantity(mergedReceiptInventoryList);

        // 5.更新库存明细InventoryDetail: deductInventoryDetailQuantity移出扣减库存，addInventoryDetail为移入增加库存
        inventoryDetailMapper.deductInventoryDetailQuantity(inventoryDetailBoList, LoginHelper.getUsername(), LocalDateTime.now());
        addInventoryDetail(bo);

        // 6.创建库存记录流水
        createInventoryHistory(bo);
    }

    private void validateBeforeMove(MovementOrderBo bo) {
        if (CollUtil.isEmpty(bo.getDetails())) {
            throw new BaseException("商品明细不能为空！");
        }
    }

    /**
     * 按仓库库区规格合并商品明细的数量
     * @param movementOrderDetailBoList
     */
    public List<InventoryBo> mergeShipmentDetailByPlaceAndItem(@NotEmpty List<MovementOrderDetailBo> movementOrderDetailBoList) {
        Map<String, InventoryBo> mergedShipmentMap = new HashMap<>();
        movementOrderDetailBoList.forEach(detail -> {
            String mergedShipmentKey = detail.getKey();
            if (mergedShipmentMap.containsKey(mergedShipmentKey)) {
                InventoryBo mergedInventoryBo = mergedShipmentMap.get(mergedShipmentKey);
                mergedInventoryBo.setQuantity(mergedInventoryBo.getQuantity().add(detail.getQuantity()));
            } else {
                InventoryBo mergedInventoryBo = new InventoryBo();
                mergedInventoryBo.setWarehouseId(detail.getSourceWarehouseId());
                mergedInventoryBo.setAreaId(detail.getSourceAreaId());
                mergedInventoryBo.setSkuId(detail.getSkuId());
                mergedInventoryBo.setQuantity(detail.getQuantity());
                mergedShipmentMap.put(mergedShipmentKey, mergedInventoryBo);
            }
        });

        return new ArrayList<>(mergedShipmentMap.values());
    }

    /**
     * 按仓库库区规格合并商品明细的数量
     * @param movementOrderDetailBoList
     */
    public List<InventoryBo> mergeReceiptDetailByPlaceAndItem(@NotEmpty List<MovementOrderDetailBo> movementOrderDetailBoList) {
        Map<String, InventoryBo> mergedReceiptMap = new HashMap<>();
        movementOrderDetailBoList.forEach(detail -> {
            String mergedReceiptKey = detail.getTargetWarehouseId() + "_" + detail.getTargetAreaId() + "_" + detail.getSkuId();
            if (mergedReceiptMap.containsKey(mergedReceiptKey)) {
                InventoryBo mergedInventoryBo = mergedReceiptMap.get(mergedReceiptKey);
                mergedInventoryBo.setQuantity(mergedInventoryBo.getQuantity().add(detail.getQuantity()));
            } else {
                InventoryBo mergedInventoryBo = new InventoryBo();
                mergedInventoryBo.setWarehouseId(detail.getTargetWarehouseId());
                mergedInventoryBo.setAreaId(detail.getTargetAreaId());
                mergedInventoryBo.setSkuId(detail.getSkuId());
                mergedInventoryBo.setQuantity(detail.getQuantity());
                mergedReceiptMap.put(mergedReceiptKey, mergedInventoryBo);
            }
        });
        return new ArrayList<>(mergedReceiptMap.values());
    }

    public List<InventoryDetailBo> convertMovementOrderDetailToInventoryDetail(List<MovementOrderDetailBo> movementOrderDetailBoList) {
        return movementOrderDetailBoList
            .stream()
            .map(detail -> {
                InventoryDetailBo inventoryDetailBo = new InventoryDetailBo();
                inventoryDetailBo.setId(detail.getInventoryDetailId());
                inventoryDetailBo.setShipmentQuantity(detail.getQuantity());
                return inventoryDetailBo;
            }).toList();
    }

    /**
     * 移库完成创建入库记录
     * @param bo
     */
    @Transactional
    public void addInventoryDetail(MovementOrderBo bo) {
        List<InventoryDetail> addInventoryDetailList = bo.getDetails().stream().map(it -> {
            InventoryDetail addInventoryDetail = new InventoryDetail();
            addInventoryDetail.setReceiptOrderId(bo.getId());
            addInventoryDetail.setType(ServiceConstants.InventoryDetailType.MOVEMENT);
            addInventoryDetail.setSkuId(it.getSkuId());
            addInventoryDetail.setWarehouseId(it.getTargetWarehouseId());
            addInventoryDetail.setAreaId(it.getTargetAreaId());
            addInventoryDetail.setQuantity(it.getQuantity());
            addInventoryDetail.setBatchNo(it.getBatchNo());
            addInventoryDetail.setProductionDate(it.getProductionDate());
            addInventoryDetail.setExpirationDate(it.getExpirationDate());
            addInventoryDetail.setRemainQuantity(it.getQuantity());
            return addInventoryDetail;
        }).toList();
        inventoryDetailService.saveBatch(addInventoryDetailList);
    }

    /**
     * 移库完成创建库存记录
     * @param bo
     */
    @Transactional
    public void createInventoryHistory(MovementOrderBo bo) {
        List<InventoryHistory> addInventoryHistoryList = new LinkedList<>();
        bo.getDetails().forEach(detail -> {
            InventoryHistory shipmentInventoryHistory = new InventoryHistory();
            shipmentInventoryHistory.setWarehouseId(detail.getSourceWarehouseId());
            shipmentInventoryHistory.setAreaId(detail.getSourceAreaId());
            shipmentInventoryHistory.setSkuId(detail.getSkuId());
            shipmentInventoryHistory.setQuantity(detail.getQuantity().negate());
            shipmentInventoryHistory.setBatchNo(detail.getBatchNo());
            shipmentInventoryHistory.setProductionDate(detail.getProductionDate());
            shipmentInventoryHistory.setExpirationDate(detail.getExpirationDate());
            shipmentInventoryHistory.setOrderId(bo.getId());
            shipmentInventoryHistory.setOrderNo(bo.getMovementOrderNo());
            shipmentInventoryHistory.setOrderType(ServiceConstants.InventoryHistoryOrderType.MOVEMENT);
            addInventoryHistoryList.add(shipmentInventoryHistory);
            InventoryHistory receiptInventoryHistory = new InventoryHistory();
            receiptInventoryHistory.setWarehouseId(detail.getTargetWarehouseId());
            receiptInventoryHistory.setAreaId(detail.getTargetAreaId());
            receiptInventoryHistory.setSkuId(detail.getSkuId());
            receiptInventoryHistory.setQuantity(detail.getQuantity());
            receiptInventoryHistory.setBatchNo(detail.getBatchNo());
            receiptInventoryHistory.setProductionDate(detail.getProductionDate());
            receiptInventoryHistory.setExpirationDate(detail.getExpirationDate());
            receiptInventoryHistory.setOrderId(bo.getId());
            receiptInventoryHistory.setOrderNo(bo.getMovementOrderNo());
            receiptInventoryHistory.setOrderType(ServiceConstants.InventoryHistoryOrderType.MOVEMENT);
            addInventoryHistoryList.add(receiptInventoryHistory);
        });
        inventoryHistoryService.saveBatch(addInventoryHistoryList);
    }
}
