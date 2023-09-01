package com.cyl.wms.service;

import cn.hutool.core.collection.CollUtil;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.conditions.update.LambdaUpdateWrapper;
import com.cyl.wms.constant.ShipmentOrderConstant;
import com.cyl.wms.convert.DeliveryConvert;
import com.cyl.wms.convert.ShipmentOrderConvert;
import com.cyl.wms.convert.ShipmentOrderDetailConvert;
import com.cyl.wms.domain.*;
import com.cyl.wms.mapper.ShipmentOrderDetailMapper;
import com.cyl.wms.mapper.ShipmentOrderMapper;
import com.cyl.wms.pojo.query.DeliveryQuery;
import com.cyl.wms.pojo.query.ItemQuery;
import com.cyl.wms.pojo.query.ShipmentOrderDetailQuery;
import com.cyl.wms.pojo.query.ShipmentOrderQuery;
import com.cyl.wms.pojo.vo.ItemVO;
import com.cyl.wms.pojo.vo.ReceiptOrderVO;
import com.cyl.wms.pojo.vo.ShipmentOrderDetailVO;
import com.cyl.wms.pojo.vo.ShipmentOrderVO;
import com.cyl.wms.pojo.vo.form.OrderWaveFrom;
import com.cyl.wms.pojo.vo.form.ShipmentOrderFrom;
import com.github.pagehelper.PageHelper;
import com.ruoyi.common.core.domain.entity.SysUser;
import com.ruoyi.common.exception.ServiceException;
import com.ruoyi.common.utils.DateUtils;
import com.ruoyi.common.utils.SecurityUtils;
import com.ruoyi.system.mapper.SysUserMapper;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.CollectionUtils;

import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.util.*;
import java.util.stream.Collectors;

/**
 * 出库单Service业务层处理
 *
 * @author zcc
 */
@Service
@Slf4j
public class ShipmentOrderService {
    @Autowired
    private ShipmentOrderMapper shipmentOrderMapper;
    @Autowired
    private ShipmentOrderConvert convert;
    @Autowired
    private ShipmentOrderDetailConvert detailConvert;
    @Autowired
    private ShipmentOrderDetailMapper shipmentOrderDetailMapper;
    @Autowired
    private ShipmentOrderDetailService shipmentOrderDetailService;
    @Autowired
    private ItemService itemService;
    @Autowired
    private DeliveryConvert deliveryConvert;
    @Autowired
    private DeliveryService deliveryService;
    @Autowired
    private InventoryHistoryService inventoryHistoryService;
    @Autowired
    private InventoryService inventoryService;
    @Autowired
    private CustomerTransactionService customerTransactionService;
    @Autowired
    private SysUserMapper userMapper;

    /**
     * 查询出库单
     *
     * @param id 出库单主键
     * @return 出库单
     */
    public ShipmentOrderFrom selectById(Long id) {
        ShipmentOrder order = shipmentOrderMapper.selectById(id);
        if (order == null) {
            return null;
        }
        ShipmentOrderDetailQuery query = new ShipmentOrderDetailQuery();
        query.setShipmentOrderId(id);
        ShipmentOrderFrom form = convert.do2form(order);
        List<ShipmentOrderDetail> shipmentOrderDetails = shipmentOrderDetailService.selectList(query, null);
        List<ShipmentOrderDetailVO> shipmentOrderDetailVOS = shipmentOrderDetailService.toVos(shipmentOrderDetails);
        form.setDetails(shipmentOrderDetailVOS);
        if (!CollUtil.isEmpty(form.getDetails())) {
            List<Long> itemIds = form.getDetails().stream().map(ShipmentOrderDetailVO::getItemId).distinct().collect(Collectors.toList());
            ItemQuery query1 = new ItemQuery();
            query1.setIds(itemIds);
            List<Item> list = itemService.selectList(query1, null);
            List<ItemVO> items = itemService.toVos(list);
            form.setItems(items);

            DeliveryQuery deliveryQuery = new DeliveryQuery();
            deliveryQuery.setShipmentOrderId(id);
            List<Delivery> deliveries = deliveryService.selectList(deliveryQuery, null);
            form.setDelivery(deliveryConvert.dos2vos(deliveries));
        }
        return form;
    }

    /**
     * 查询出库单列表
     *
     * @param query 查询条件
     * @param page  分页条件
     * @return 出库单
     */
    public Page<ShipmentOrderVO> selectList(ShipmentOrderQuery query, Pageable page) {
        if (page != null) {
            PageHelper.startPage(page.getPageNumber() + 1, page.getPageSize());
        }
        QueryWrapper<ShipmentOrder> qw = new QueryWrapper<>();
        qw.orderByDesc("id");
        qw.eq("del_flag", 0);
        String shipmentOrderNo = query.getShipmentOrderNo();
        if (!StringUtils.isEmpty(shipmentOrderNo)) {
            qw.eq("shipment_order_no", shipmentOrderNo);
        }
        Integer shipmentOrderType = query.getShipmentOrderType();
        if (shipmentOrderType != null) {
            qw.eq("shipment_order_type", shipmentOrderType);
        }
        String orderNo = query.getOrderNo();
        if (!StringUtils.isEmpty(orderNo)) {
            qw.eq("order_no", orderNo);
        }
        Long customerId = query.getCustomerId();
        if (customerId != null) {
            qw.eq("customer_id", customerId);
        }
        Integer shipmentOrderStatus = query.getShipmentOrderStatus();
        if (shipmentOrderStatus != null) {
            qw.eq("shipment_order_status", shipmentOrderStatus);
        }
        List<ShipmentOrder> list = shipmentOrderMapper.selectList(qw);
        if (CollectionUtils.isEmpty(list)) {
            return new PageImpl<>(Collections.EMPTY_LIST, page, 0);
        }
        List<ShipmentOrderVO> res = convert.dos2vos(list);
        if (!CollUtil.isEmpty(res)) {
            List<Long> ids = res.stream().map(ShipmentOrderVO::getId).collect(Collectors.toList());
            Map<Long, Integer> id2count = shipmentOrderDetailMapper.countByOrderId(ids)
                    .stream().collect(Collectors.toMap(ShipmentOrderVO::getId, ShipmentOrderVO::getDetailCount));
            Map<Long, String> nickNameMap = userMapper.selectByBatchIds(res.stream().map(ShipmentOrderVO::getCreateBy).collect(Collectors.toSet())).stream().collect(Collectors.toMap(SysUser::getUserId, SysUser::getNickName));
            res.forEach(it -> {
                it.setDetailCount(id2count.get(it.getId()));
                it.setCreateByName(nickNameMap.get(it.getCreateBy()));
            });
        }
        return new PageImpl<>(res, page, ((com.github.pagehelper.Page) list).getTotal());
    }

    /**
     * 新增出库单
     *
     * @param shipmentOrder 出库单
     * @return 结果
     */
    public int insert(ShipmentOrder shipmentOrder) {
        shipmentOrder.setDelFlag(0);
        shipmentOrder.setCreateTime(LocalDateTime.now());
        return shipmentOrderMapper.insert(shipmentOrder);
    }

    /**
     * 修改出库单
     *
     * @param shipmentOrder 出库单
     * @return 结果
     */
    public int update(ShipmentOrder shipmentOrder) {
        return shipmentOrderMapper.updateById(shipmentOrder);
    }

    /**
     * 批量删除出库单
     *
     * @param ids 需要删除的出库单主键
     * @return 结果
     */
    @Transactional
    public int deleteByIds(Long[] ids) {
        int flag = 0;
        for (Long id : ids) {
            ShipmentOrder shipmentOrder = shipmentOrderMapper.selectById(id);
            if (shipmentOrder == null) {
                continue;
            }
            Integer shipmentOrderStatus = shipmentOrder.getShipmentOrderStatus();

            // 1. 逻辑删除出库单
            flag += shipmentOrderMapper.updateDelFlagByIds(ids);

            // 2. 逻辑删除出库单详情
            shipmentOrderDetailService.updateDelFlag(shipmentOrder);

            if (shipmentOrderStatus != ShipmentOrderConstant.ALL_IN && shipmentOrderStatus != ShipmentOrderConstant.PART_IN) {
                // 未出库的可以直接删除
                continue;
            }

            // 3. 查询库存记录
            List<InventoryHistory> inventoryHistories = inventoryHistoryService.selectByForm(shipmentOrder.getId(), shipmentOrder.getShipmentOrderType());

            // 翻转库存记录的数量
            inventoryHistories.forEach(it -> {
                it.setQuantity(it.getQuantity().negate());
                log.info("回滚库存:{} 数量：{}", it.getWarehouseId() + "_" + it.getAreaId() + "_" + it.getRackId() + "_" + it.getItemId(), it.getQuantity());
            });

            // 4. 回滚库存
            inventoryService.batchUpdate1(inventoryHistories);

            // 5. 删除库存记录
            inventoryHistoryService.deleteByForm(shipmentOrder.getId(), shipmentOrder.getShipmentOrderType());

            // todo 6. 回滚供应商流水
//            supplierTransactionService.deleteByForm(shipmentOrder.getId(), shipmentOrder.getReceiptOrderType());
        }
        return flag;
    }

    /**
     * 删除出库单信息
     *
     * @param id 出库单主键
     * @return 结果
     */
    public int deleteById(Long id) {
        Long[] ids = {id};
        return shipmentOrderMapper.updateDelFlagByIds(ids);
    }

    @Transactional
    public int add(ShipmentOrderFrom order) {
        int res;
        order.setDelFlag(0);
        order.setCreateTime(LocalDateTime.now());
        res = shipmentOrderMapper.insert(order);
        saveDetails(order.getId(), order.getDetails());
        if (order.getReceivableAmount() != null && order.getCustomerId() != null) {
            //保存订单金额到客户流水表
            saveOrUpdatePayAmount(order);
        }
        return res;


    }

    public int update(ShipmentOrderFrom order) {
        int res;
        QueryWrapper<ShipmentOrderDetail> qw = new QueryWrapper<>();
        qw.eq("shipment_order_id", order.getId());

        // 新旧出库单详情对比， 生成 库存记录修改
        List<ShipmentOrderDetailVO> details = order.getDetails();
        Map<Long, ShipmentOrderDetail> dbDetailMap = shipmentOrderDetailMapper.selectList(qw).stream().collect(Collectors.toMap(ShipmentOrderDetail::getId, it -> it));
        List<InventoryHistory> adds = new ArrayList<>();
        LocalDateTime now = LocalDateTime.now();
        Long userId = SecurityUtils.getUserId();
        details.forEach(it -> {
            Integer status = it.getShipmentOrderStatus();
            if (status != ShipmentOrderConstant.PART_IN && status != ShipmentOrderConstant.ALL_IN) {
                return;
            }
            // 新增时， status一定是未出库， 所以这个地方必定有值
            ShipmentOrderDetail dbDetail = dbDetailMap.get(it.getId());
            // 如果上次的状态不是部分出库或者全部出库，则本次的库存变化为本次的全部
            Integer status1 = dbDetail.getShipmentOrderStatus();
            BigDecimal added;

            if (status1 != ShipmentOrderConstant.PART_IN && status1 != ShipmentOrderConstant.ALL_IN) {
                added = it.getRealQuantity();
            } else {
                BigDecimal before = dbDetail.getRealQuantity() == null ? BigDecimal.ZERO : dbDetail.getRealQuantity();
                BigDecimal after = it.getRealQuantity() == null ? BigDecimal.ZERO : it.getRealQuantity();
                // 数量变化有问题
                if (before.compareTo(after) >= 0) {
                    return;
                }
                added = after.subtract(before);
            }
            //判断库存是否足够出库
            inventoryService.checkInventory(it.getItemId(), it.getWarehouseId(), it.getAreaId(), it.getRackId(), added);

            // 1. 前一次的实际数量是 0
            InventoryHistory h = detailConvert.do2InventoryHistory(it);
            h.setFormId(order.getId());
            h.setFormType(order.getShipmentOrderType());
            h.setQuantity(added.negate());
            h.setDelFlag(0);
            h.setId(null);
            h.setCreateTime(now);
            h.setCreateBy(userId);
            adds.add(h);
        });
        if (!adds.isEmpty()) {
            int add1 = inventoryHistoryService.batchInsert(adds);
//            adds.forEach(it -> it.setQuantity(it.getQuantity().negate()));
            int update1 = inventoryService.batchUpdate1(adds);
            log.info("inventoryHistory: {}, inventory: {}", add1, update1);
        }
        // 2.1 先删除details 再重新保存
        shipmentOrderDetailMapper.delete(qw);
        saveDetails(order.getId(), order.getDetails());
        if (order.getReceivableAmount() != null && order.getCustomerId() != null) {
            //保存订单金额到客户流水表
            saveOrUpdatePayAmount(order);
        }

        // 2.2 更新出库单
        //判断出库单的整体状态
        Set<Integer> statusList = order.getDetails().stream().map(ShipmentOrderDetailVO::getShipmentOrderStatus).collect(Collectors.toSet());
        if (statusList.size() == 1) {
            order.setShipmentOrderStatus(statusList.iterator().next());
        } else if (statusList.size() == 2) {
            if (statusList.contains(ShipmentOrderConstant.DROP) && statusList.contains(ShipmentOrderConstant.ALL_IN)) {
                //此时单据状态只有报废和全部出库，则出库单状态为全部出库
                order.setShipmentOrderStatus(ShipmentOrderConstant.ALL_IN);
            } else if (statusList.contains(ShipmentOrderConstant.PART_IN) || statusList.contains(ShipmentOrderConstant.ALL_IN)) {
                //此时单据状态有两个，包含部分出库和全部出库都是部分出库
                order.setShipmentOrderStatus(ShipmentOrderConstant.PART_IN);
            }

        } else if (statusList.contains(ShipmentOrderConstant.PART_IN) || statusList.contains(ShipmentOrderConstant.ALL_IN)) {
            //此时单据状态有两个，包含部分出库和全部出库都是部分出库
            order.setShipmentOrderStatus(ShipmentOrderConstant.PART_IN);
        }

        res = shipmentOrderMapper.updateById(order);
        return res;
    }

    /**
     * 保存订单金额到用户流水表
     *
     * @param shipmentOrder 出库单
     */
    private void saveOrUpdatePayAmount(ShipmentOrder shipmentOrder) {
        //todo 更换用户
        //todo 删除出库单
        CustomerTransaction customerTransaction = new CustomerTransaction();
        customerTransaction.setCustomerId(String.valueOf(shipmentOrder.getCustomerId()));
        customerTransaction.setTransactionType(CustomerTransaction.SHIPMENT);
        customerTransaction.setTransactionAmount(shipmentOrder.getReceivableAmount());
        customerTransaction.setShipmentOrderId(shipmentOrder.getId().intValue());
        customerTransaction.setTransactionCode("TS-" + DateUtils.randomId());
        customerTransactionService.insert(customerTransaction);
    }

    private void saveDetails(Long orderId, List<ShipmentOrderDetailVO> details) {
        if (!CollUtil.isEmpty(details)) {
            details.forEach(it -> it.setShipmentOrderId(orderId));
            List<ShipmentOrderDetail> shipmentOrderDetails = detailConvert.vos2dos(details);
            shipmentOrderDetailMapper.batchInsert(shipmentOrderDetails);
        }
    }

    /*
     * 单个订单分配仓库(填充详情单的仓库id,库区id,货架id)
     * @param id 出库单id
     * 1.根据出库单id查询出库单详情
     * 2.根据出库单详情的商品id，数量
     * 3.根据库存分配规则分配库存
     * 4.修改出库单详情
     * 5.修改出库单
     * */
    @Transactional
    public void allocatedInventory(long id, Integer type) {
        log.info("单个订单分配仓库,出库单id:{}", id);
        // 1.根据出库单id查询出库单
        ShipmentOrder shipmentOrder = shipmentOrderMapper.selectById(id);
        if (shipmentOrder == null) {
            log.info("单个订单分配仓库--出库单不存在,{}", id);
            throw new ServiceException("出库单不存在");
        }
        // 2.根据出库单id查询出库单详情
        List<ShipmentOrderDetail> allocationDetails = new ArrayList<>();
        List<ShipmentOrderDetail> shipmentOrderDetails = shipmentOrderDetailMapper.selectListGroupByItemId(id);
        log.info("出库单详情\n{}", shipmentOrderDetails);
        // 3.获取出库单详情的商品id，数量
        shipmentOrderDetails.forEach(shipmentOrderDetail -> {
            // 4.根据库存分配规则分配库存
            List<ShipmentOrderDetail> shipmentOrderDetail1 = inventoryService.allocatedInventory(shipmentOrderDetail.getItemId(),
                    shipmentOrderDetail.getPlanQuantity(), type);
            allocationDetails.addAll(shipmentOrderDetail1);
        });
        allocationDetails.forEach(it -> {
            // 5.修改出库单详情
            it.setShipmentOrderId(shipmentOrder.getId());
            it.setShipmentOrderStatus(ShipmentOrderConstant.NOT_IN);
            it.setDelFlag(0);
        });
        // 6.修改出库单
        shipmentOrderDetailService.deleteByOrderId(shipmentOrder.getId());
        shipmentOrderDetailMapper.batchInsert(allocationDetails);
//        log.info("分配库存详情\n{}", allocationDetails);

    }

    public void updateWaveNo(Long orderId, String waveNo) {
        ShipmentOrder shipmentOrder = shipmentOrderMapper.selectById(orderId);
        if (shipmentOrder == null) {
            throw new ServiceException("出库单不存在");
        }
        String orderNo = shipmentOrder.getShipmentOrderNo();
        if (shipmentOrder.getShipmentOrderStatus() == ShipmentOrderConstant.ALL_IN || shipmentOrder.getShipmentOrderStatus() == ShipmentOrderConstant.PART_IN) {
            throw new ServiceException("订单" + orderNo + "已经出库，不能分配波次");
        }
        if (!StringUtils.isEmpty(shipmentOrder.getWaveNo())) {
            throw new ServiceException("订单" + orderNo + "已经分配波次，不能重复分配");
        }
        shipmentOrder.setWaveNo(waveNo);
        shipmentOrderMapper.updateById(shipmentOrder);
    }

    /*
     *
     * */
    public OrderWaveFrom selectDetailByWaveNo(String waveNo) {
        OrderWaveFrom form = new OrderWaveFrom();
        List<ShipmentOrderDetail> shipmentOrderDetails = shipmentOrderDetailMapper.selectDetailByWaveNo(waveNo);
        List<ShipmentOrderDetailVO> shipmentOrderDetailVOS = shipmentOrderDetailService.toVos(shipmentOrderDetails);
        form.setDetails(shipmentOrderDetailVOS);
        if (!CollUtil.isEmpty(form.getDetails())) {
            List<Long> itemIds = form.getDetails().stream()
                    .map(ShipmentOrderDetailVO::getItemId).distinct().collect(Collectors.toList());
            ItemQuery query1 = new ItemQuery();
            query1.setIds(itemIds);
            List<Item> list = itemService.selectList(query1, null);
            List<ItemVO> items = itemService.toVos(list);
            form.setItems(items);
        }
        return form;
    }

    public void deleteByWaveIds(Collection<String> ids) {
        LambdaUpdateWrapper<ShipmentOrder> qw = new LambdaUpdateWrapper<>();
        qw.in(ShipmentOrder::getWaveNo, ids);
        qw.set(ShipmentOrder::getWaveNo, null);
        shipmentOrderMapper.update(null, qw);
    }
}
