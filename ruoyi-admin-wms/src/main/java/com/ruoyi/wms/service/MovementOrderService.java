package com.ruoyi.wms.service;

import cn.hutool.core.collection.CollUtil;
import com.ruoyi.common.core.constant.ServiceConstants;
import com.ruoyi.common.core.exception.ServiceException;
import com.ruoyi.common.core.exception.base.BaseException;
import com.ruoyi.common.core.utils.MapstructUtils;
import com.ruoyi.common.mybatis.core.domain.BaseEntity;
import com.ruoyi.common.mybatis.core.domain.PlaceAndItem;
import com.ruoyi.common.mybatis.core.page.TableDataInfo;
import com.ruoyi.common.mybatis.core.page.PageQuery;
import com.ruoyi.common.core.utils.StringUtils;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.ruoyi.common.satoken.utils.LoginHelper;
import com.ruoyi.wms.domain.bo.*;
import com.ruoyi.wms.domain.entity.InventoryDetail;
import com.ruoyi.wms.domain.entity.InventoryHistory;
import com.ruoyi.wms.domain.entity.MovementOrderDetail;
import com.ruoyi.wms.mapper.InventoryDetailMapper;
import jakarta.validation.constraints.NotEmpty;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import com.ruoyi.wms.domain.vo.MovementOrderVo;
import com.ruoyi.wms.domain.entity.MovementOrder;
import com.ruoyi.wms.mapper.MovementOrderMapper;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDateTime;
import java.util.*;
import java.util.function.Function;
import java.util.stream.Collectors;

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
        // 1.校验
        validateBeforeMove(bo);
        // 2.按源仓库库区规格合并商品明细数量
        List<List<InventoryBo>> mergedInventoryList = mergeMovementOrderDetailByPlaceAndItem(bo.getDetails());
        // 3.校验库存记录
        List<InventoryDetailBo> inventoryDetailBoList = convertMovementOrderDetailToInventoryDetail(bo.getDetails());
        inventoryDetailService.validateRemainQuantity(inventoryDetailBoList);
        // 4.保存移库单核移库单明细
        if (Objects.isNull(bo.getId())) {
            insertByBo(bo);
        } else {
            updateByBo(bo);
        }
        // 5.更新库存
        List<InventoryBo> mergedShipmentInventoryList = mergedInventoryList.get(0);
        mergedShipmentInventoryList.forEach(mergedShipmentInventory -> mergedShipmentInventory.setQuantity(mergedShipmentInventory.getQuantity().negate()));
        inventoryService.updateInventoryQuantity(mergedShipmentInventoryList);
        inventoryService.updateInventoryQuantity(mergedInventoryList.get(1));
        // 6.更新入库记录剩余数
        inventoryDetailMapper.updateRemainQuantity(inventoryDetailBoList, LoginHelper.getUsername(), LocalDateTime.now());
        // 7.创建入库记录
        createNewInventoryDetail(bo);
        // 8.创建库存记录
        saveInventoryHistory(bo);
    }

    private void validateBeforeMove(MovementOrderBo bo) {
        if (CollUtil.isEmpty(bo.getDetails())) {
            throw new BaseException("商品明细不能为空！");
        }
    }

    /**
     * 按仓库库区规格合并商品明细的数量
     * @param movementOrderDetailBoList
     * @return 返回两个集合 下标0对应出库 下标1对应入库
     */
    public List<List<InventoryBo>> mergeMovementOrderDetailByPlaceAndItem(@NotEmpty List<MovementOrderDetailBo> movementOrderDetailBoList) {
        Map<String, InventoryBo> mergedShipmentMap = new HashMap<>();
        Map<String, InventoryBo> mergedReceiptMap = new HashMap<>();
        movementOrderDetailBoList.forEach(detail -> {
            String mergedShipmentKey = detail.getKey();
            String mergedReceiptKey = detail.getTargetWarehouseId() + "_" + detail.getTargetAreaId() + "_" + detail.getSkuId();
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
            if (mergedReceiptMap.containsKey(mergedReceiptKey)) {
                InventoryBo mergedInventoryBo = mergedReceiptMap.get(mergedReceiptKey);
                mergedInventoryBo.setQuantity(mergedInventoryBo.getQuantity().add(detail.getQuantity()));
            } else {
                InventoryBo mergedInventoryBo = new InventoryBo();
                mergedInventoryBo.setWarehouseId(detail.getTargetWarehouseId());
                mergedInventoryBo.setAreaId(detail.getTargetAreaId());
                mergedInventoryBo.setSkuId(detail.getSkuId());
                mergedInventoryBo.setQuantity(detail.getQuantity());
                mergedReceiptMap.put(mergedShipmentKey, mergedInventoryBo);
            }
        });
        return Arrays.asList(new ArrayList<>(mergedShipmentMap.values()), new ArrayList<>(mergedReceiptMap.values()));
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
    public void createNewInventoryDetail(MovementOrderBo bo) {
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
    public void saveInventoryHistory(MovementOrderBo bo) {
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
