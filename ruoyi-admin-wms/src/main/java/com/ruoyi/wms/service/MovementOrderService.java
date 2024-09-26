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
import com.ruoyi.wms.domain.bo.MovementOrderBo;
import com.ruoyi.wms.domain.entity.MovementOrder;
import com.ruoyi.wms.domain.entity.MovementOrderDetail;
import com.ruoyi.wms.domain.vo.MovementOrderVo;
import com.ruoyi.wms.mapper.MovementOrderMapper;
import lombok.RequiredArgsConstructor;
import org.apache.commons.lang3.SerializationUtils;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Collection;
import java.util.List;
import java.util.Map;
import java.util.Objects;

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
        lqw.eq(StringUtils.isNotBlank(bo.getOrderNo()), MovementOrder::getOrderNo, bo.getOrderNo());
        lqw.eq(bo.getSourceWarehouseId() != null, MovementOrder::getSourceWarehouseId, bo.getSourceWarehouseId());
        lqw.eq(bo.getTargetWarehouseId() != null, MovementOrder::getTargetWarehouseId, bo.getTargetWarehouseId());
        lqw.eq(bo.getOrderStatus() != null, MovementOrder::getOrderStatus, bo.getOrderStatus());
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
        validateMovementOrderNo(bo.getOrderNo());
        // 2.创建移库单
        MovementOrder add = MapstructUtils.convert(bo, MovementOrder.class);
        movementOrderMapper.insert(add);
        bo.setId(add.getId());
        // 3.创建移库单明细
        List<MovementOrderDetail> addDetailList = MapstructUtils.convert(bo.getDetails(), MovementOrderDetail.class);
        addDetailList.forEach(it -> {
            it.setOrderId(add.getId());
        });
        movementOrderDetailService.saveDetails(addDetailList);
    }

    private void validateMovementOrderNo(String movementOrderNo) {
        LambdaQueryWrapper<MovementOrder> lambdaQueryWrapper = Wrappers.lambdaQuery();
        lambdaQueryWrapper.eq(MovementOrder::getOrderNo, movementOrderNo);
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
        detailList.forEach(it -> it.setOrderId(bo.getId()));
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
        if (ServiceConstants.MovementOrderStatus.FINISH.equals(movementOrderVo.getOrderStatus())) {
            throw new ServiceException("移库单【" + movementOrderVo.getOrderNo() + "】已移库，无法删除！");
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


        // 1.校验商品明细不能为空！
        validateBeforeMove(bo);

        // 3.保存移库单核移库单明细
        if (Objects.isNull(bo.getId())) {
            insertByBo(bo);
        } else {
            updateByBo(bo);
        }
        // 4.更新库存Inventory
        MovementOrderBo shipmentBo = getShipmentBo(bo);
        inventoryService.subtract(shipmentBo.getDetails());

        MovementOrderBo receiptBo = getReceiptBo(bo);
        inventoryService.add(receiptBo.getDetails());


        // 6.创建库存记录流水
        inventoryHistoryService.saveInventoryHistory(shipmentBo, ServiceConstants.InventoryHistoryOrderType.MOVEMENT,false);
        inventoryHistoryService.saveInventoryHistory(receiptBo, ServiceConstants.InventoryHistoryOrderType.MOVEMENT,true);
    }

    private MovementOrderBo getReceiptBo(MovementOrderBo bo) {

        MovementOrderBo receiptBo = SerializationUtils.clone(bo);
        receiptBo.getDetails().forEach(detail -> detail.setWarehouseId(detail.getTargetWarehouseId()));
        return receiptBo;
    }

    private MovementOrderBo getShipmentBo(MovementOrderBo bo) {
        MovementOrderBo shipmentBo = SerializationUtils.clone(bo);
        shipmentBo.getDetails().forEach(detail -> detail.setWarehouseId(detail.getSourceWarehouseId()));
        return shipmentBo;
    }

    private void validateBeforeMove(MovementOrderBo bo) {
        if (CollUtil.isEmpty(bo.getDetails())) {
            throw new BaseException("商品明细不能为空！");
        }
    }
}
