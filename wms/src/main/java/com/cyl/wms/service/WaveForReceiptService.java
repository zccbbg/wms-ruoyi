package com.cyl.wms.service;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.cyl.wms.constant.ReceiptOrderConstant;
import com.cyl.wms.convert.ReceiptOrderDetailConvert;
import com.cyl.wms.domain.*;
import com.cyl.wms.mapper.ReceiptOrderDetailMapper;
import com.cyl.wms.mapper.ReceiptOrderMapper;
import com.cyl.wms.mapper.WaveMapper;
import com.cyl.wms.pojo.vo.ReceiptOrderDetailVO;
import com.cyl.wms.pojo.vo.form.OrderWaveReceiptFrom;
import com.ruoyi.common.exception.ServiceException;
import com.ruoyi.common.utils.SecurityUtils;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.util.*;
import java.util.concurrent.atomic.AtomicReference;
import java.util.stream.Collectors;

@Service
@Slf4j
public class WaveForReceiptService {

    @Autowired
    private ReceiptOrderService receiptOrderService;
    @Autowired
    private ReceiptOrderDetailService receiptOrderDetailService;
    @Autowired
    private ReceiptOrderDetailMapper receiptOrderDetailMapper;
    @Autowired
    private ReceiptOrderMapper receiptOrderMapper;
    @Autowired
    private ReceiptOrderDetailConvert receiptOrderDetailConvert;
    @Autowired
    private InventoryService inventoryService;
    @Autowired
    private WaveMapper waveMapper;
    @Autowired
    private InventoryHistoryService inventoryHistoryService;



    @Transactional
    public OrderWaveReceiptFrom getReceiptOrders(Long id) {
        Wave wave = waveMapper.selectById(id);
        if (wave == null || wave.getType() != 1) {
            throw new ServiceException("批次单不存在");
        }
        String waveNo = wave.getWaveNo();
        OrderWaveReceiptFrom orderWaveFrom = receiptOrderService.selectDetailByWaveNo(waveNo);
        orderWaveFrom.setRemark(wave.getRemark());
        orderWaveFrom.setStatus(wave.getStatus());
        return orderWaveFrom;
    }

    @Transactional
    public int creatWaveForReceipt(Wave wave) {
        ArrayList<Long> orderIds = wave.getIds();
        log.info("入库单进行波次作业:{}", orderIds);
        wave.setWaveNo("WV" + System.currentTimeMillis());
        wave.setStatus("1");
        wave.setDelFlag(0);
        wave.setType(1);
        wave.setCreateTime(LocalDateTime.now());
        boolean flag = waveMapper.insert(wave) > 0;
        if (flag) {
            // 变更相应订单的波次号
            for (Long orderId : orderIds) {
                receiptOrderService.updateWaveNo(orderId, wave.getWaveNo());
            }
        }
        return flag ? 1 : 0;
    }

    @Transactional
    public OrderWaveReceiptFrom allocatedInventoryForReceipt(Long id, Integer type) {
        log.info("波次单为入库分配仓库,波次单id:{}", id);
        Wave wave = waveMapper.selectById(id);
        String waveNo = wave.getWaveNo();
        OrderWaveReceiptFrom receiptFrom = receiptOrderService.selectDetailByWaveNo(waveNo);
        receiptFrom.setStatus(wave.getStatus());
        receiptFrom.setRemark(wave.getRemark());
        List<ReceiptOrderDetailVO> originalDetail = (List<ReceiptOrderDetailVO>) receiptOrderDetailConvert.copyList(receiptFrom.getDetails());

        List<ReceiptOrderDetailVO> originalDetails = aggregatedReceiptOrderDetailVOS(originalDetail);
        // 根据itemId分组，统计数量
        Map<Long, BigDecimal> collect = originalDetails.parallelStream().collect(Collectors.groupingBy(ReceiptOrderDetailVO::getItemId,
                Collectors.reducing(BigDecimal.ZERO, ReceiptOrderDetailVO::getPlanQuantity, BigDecimal::add)));

        List<Inventory> inventoryList = new ArrayList<>();

        //collect分配库存
        collect.forEach((itemId, quantity) -> {
            log.info("波次单分配仓库,波次单id:{},物料id：{},数量：{}", id, itemId, quantity);
            Inventory inventory = inventoryService.
                    allocatedInventoryForReceipt(itemId, quantity, type);
            inventoryList.add(inventory);
        });
        Map<Long, Inventory> itemMap = inventoryList.stream().collect(Collectors.toMap(it -> it.getItemId(), it -> it));
        originalDetails.forEach(it->{
            Inventory inventory = itemMap.get(it.getItemId());
            if (inventory != null) {
                it.setWarehouseId(inventory.getWarehouseId());
                it.setAreaId(inventory.getAreaId());
                it.setRackId(inventory.getRackId());
            }
        });
        receiptFrom.setAllocationDetails(originalDetails);
        return receiptFrom;
    }

    @Transactional
    public int confirmWaveForReceipt(OrderWaveReceiptFrom order) {
        //获取波次单
        Wave wave = waveMapper.selectById(order.getId());
        //数据库中的详情
        Map<Long, ReceiptOrderDetailVO> dbDetailMap = order.getDetails().stream().collect(Collectors.toMap(it->it.getId(),it->it));
        //修改之后的详情
        List<ReceiptOrderDetailVO> details = order.getAllocationDetails();
        List<ReceiptOrderDetail> orderDetails = receiptOrderDetailConvert.vos2dos(details);
//        // 删除入库单明细表
        List<Long> orderIds = details.stream().map(ReceiptOrderDetailVO::getReceiptOrderId).distinct().collect(Collectors.toList());
        LambdaQueryWrapper<ReceiptOrderDetail> deleteWrapper = new LambdaQueryWrapper<>();
        deleteWrapper.in(ReceiptOrderDetail::getReceiptOrderId, orderIds);
        receiptOrderDetailMapper.delete(deleteWrapper);

        List<InventoryHistory> adds = new ArrayList<>();
        LocalDateTime now = LocalDateTime.now();
        Long userId = SecurityUtils.getUserId();

        //获取订单
        Map<Long, ReceiptOrder> orderMap1 = receiptOrderMapper.selectList(new QueryWrapper<ReceiptOrder>().in("id", orderDetails.stream().map(it->it.getReceiptOrderId()).collect(Collectors.toSet()))).stream().collect(Collectors.toMap(it -> it.getId(), it -> it));


        details.forEach(it -> {
            Integer status = it.getReceiptOrderStatus();
            if (status == ReceiptOrderConstant.NOT_IN || status == ReceiptOrderConstant.DROP) {
                // 未入库，跳过
                return;
            }
            ReceiptOrderDetailVO dbObj = dbDetailMap.get(it.getId());
            if (dbObj == null || !Objects.equals(dbObj.getReceiptOrderStatus(),status) || !Objects.equals(it.getRealQuantity(), dbObj.getRealQuantity())) {
                //计算真实的入库数量
                BigDecimal added;
                if (dbObj == null || dbObj.getReceiptOrderStatus() == ReceiptOrderConstant.NOT_IN) {
                    added = it.getRealQuantity();
                } else {
                    added = it.getRealQuantity().subtract(dbObj.getRealQuantity());
                }
                InventoryHistory h = receiptOrderDetailConvert.do2InventoryHistory(it);
                h.setFormId(order.getId());
                h.setQuantity(added);
                h.setFormType(orderMap1.get(it.getReceiptOrderId()).getReceiptOrderType());
                h.setDelFlag(0);
                h.setId(null);
                h.setCreateTime(now);
                h.setCreateBy(userId);
                adds.add(h);
            }
        });
        if (!adds.isEmpty()) {
            int add1 = inventoryHistoryService.batchInsert(adds);
//            adds.forEach(it -> it.setQuantity(it.getQuantity().negate()));
            int update1 = inventoryService.batchUpdate1(adds);
            log.info("inventoryHistory: {}, inventory: {}", add1, update1);
        }
        int batchInsert = receiptOrderDetailMapper.batchInsert(orderDetails);

        //先按照入库单ID分组
        Map<Long, List<ReceiptOrderDetail>> map = orderDetails.stream().collect(Collectors.groupingBy(it -> it.getReceiptOrderId()));
        Map<Long, ReceiptOrder> orderMap = receiptOrderMapper.selectList(new QueryWrapper<ReceiptOrder>().in("id", map.keySet())).stream().collect(Collectors.toMap(it -> it.getId(), it -> it));
        // 2.2 更新入库单
        AtomicReference<Boolean> finish = new AtomicReference<>(true);
        map.forEach((key, val) -> {
            //判断入库单的整体状态
            Set<Integer> statusList = val.stream().map(ReceiptOrderDetail::getReceiptOrderStatus).collect(Collectors.toSet());
            ReceiptOrder receiptOrder = orderMap.get(key);
            if (statusList.size() == 1) {
                receiptOrder.setReceiptOrderStatus(statusList.iterator().next());
            } else if (statusList.size() == 2) {
                if (statusList.contains(ReceiptOrderConstant.DROP) && statusList.contains(ReceiptOrderConstant.ALL_IN)) {
                    //此时单据状态只有报废和全部入库，则入库单状态为全部入库
                    receiptOrder.setReceiptOrderStatus(ReceiptOrderConstant.ALL_IN);
                } else if (statusList.contains(ReceiptOrderConstant.PART_IN) || statusList.contains(ReceiptOrderConstant.ALL_IN)) {
                    //此时单据状态有两个，包含部分入库和全部入库都是部分入库
                    receiptOrder.setReceiptOrderStatus(ReceiptOrderConstant.PART_IN);
                }

            } else if (statusList.contains(ReceiptOrderConstant.PART_IN) || statusList.contains(ReceiptOrderConstant.ALL_IN)) {
                //此时单据状态有两个，包含部分入库和全部入库都是部分入库
                receiptOrder.setReceiptOrderStatus(ReceiptOrderConstant.PART_IN);
            }
            if (finish.get()) {
                finish.set(receiptOrder.getReceiptOrderStatus() == ReceiptOrderConstant.ALL_IN);
            }
            receiptOrderMapper.updateById(receiptOrder);
        });
        //判断是否开始入库
        Set<Integer> totalStatusList = orderDetails.stream().map(it -> it.getReceiptOrderStatus()).collect(Collectors.toSet());
        if (totalStatusList.size() == 1 && totalStatusList.contains(ReceiptOrderConstant.NOT_IN)) {
            wave.setStatus("1");
        } else {
            wave.setStatus(finish.get() ? "3" : "2");
        }
        if (!Objects.equals(order.getRemark(), wave.getRemark())) {
            wave.setRemark(order.getRemark());
        }
        waveMapper.updateById(wave);
        return batchInsert;
    }

    @Transactional
    public Integer cancelAllocatedInventoryForReceipt(Long id) {
        Wave wave = waveMapper.selectById(id);
        String waveNo = wave.getWaveNo();
        OrderWaveReceiptFrom orderFrom = receiptOrderService.selectDetailByWaveNo(waveNo);
        List<ReceiptOrderDetailVO> originalDetail = (List<ReceiptOrderDetailVO>) receiptOrderDetailConvert.copyList(orderFrom.getDetails());

        List<ReceiptOrderDetailVO> originalDetails = aggregatedReceiptOrderDetailVOS(originalDetail);
        // 删除入库单明细表
        List<Long> orderIds = originalDetail.stream().map(ReceiptOrderDetailVO::getReceiptOrderId).distinct().collect(Collectors.toList());
        LambdaQueryWrapper<ReceiptOrderDetail> deleteWrapper = new LambdaQueryWrapper<>();
        deleteWrapper.in(ReceiptOrderDetail::getReceiptOrderId, orderIds);
        receiptOrderDetailMapper.delete(deleteWrapper);

        // 插入入库单明细表
        List<ReceiptOrderDetail> orderDetails = receiptOrderDetailConvert.vos2dos(originalDetails);
        orderDetails.forEach(detail -> {
            detail.setDelFlag(0);
            detail.setReceiptOrderStatus(ReceiptOrderConstant.NOT_IN);
        });
        return receiptOrderDetailMapper.batchInsert(orderDetails);
    }

    @Transactional
    public Integer deleteByIdsForReceipt(Long[] ids) {
        receiptOrderService.deleteByWaveIds(waveMapper.selectList(new LambdaQueryWrapper<Wave>()
                        .select(Wave::getWaveNo)
                        .in(Wave::getId, Arrays.asList(ids)))
                .stream().map(Wave::getWaveNo).collect(Collectors.toList()));
        return waveMapper.updateDelFlagByIds(ids);
    }

    private ReceiptOrderDetailVO convert2voForReceipt(ReceiptOrderDetailVO originalOrder, ReceiptOrderDetailVO availableDetail, BigDecimal availableQuantity) {
        ReceiptOrderDetailVO shipmentOrderDetailVO2 = new ReceiptOrderDetailVO();
        shipmentOrderDetailVO2.setOrderNo(originalOrder.getOrderNo());
        shipmentOrderDetailVO2.setItemId(originalOrder.getItemId());
        shipmentOrderDetailVO2.setReceiptOrderId(originalOrder.getReceiptOrderId());
        shipmentOrderDetailVO2.setPlanQuantity(availableQuantity);
        shipmentOrderDetailVO2.setRealQuantity(availableQuantity);
        shipmentOrderDetailVO2.setWarehouseId(availableDetail.getWarehouseId());
        shipmentOrderDetailVO2.setAreaId(availableDetail.getAreaId());
        shipmentOrderDetailVO2.setPlace(availableDetail.getPlace());
        shipmentOrderDetailVO2.setDelFlag(0);
        // 默认入库状态为未入库
        shipmentOrderDetailVO2.setReceiptOrderStatus(ReceiptOrderConstant.NOT_IN);
        return shipmentOrderDetailVO2;
    }


    private static List<ReceiptOrderDetailVO> aggregatedReceiptOrderDetailVOS(List<ReceiptOrderDetailVO> originalDetail) {
        // 单个入库单分配后库区，还可以波次？ 可以，这一步就是重新聚合订单分散得拣货数据。
        // 聚合入库单，防止用户先前分配过库存。如果分配过库存，需要把分配过的库存加回来。保留原始订单信息
        Map<String, ReceiptOrderDetailVO> aggregatedDetails = new HashMap<>();
        originalDetail.forEach(vo -> {
            String key = vo.getItemId() + "_" + vo.getOrderNo();
            aggregatedDetails.merge(key, vo, (existingVo, newVo) -> {
                existingVo.setPlanQuantity(existingVo.getPlanQuantity().add(newVo.getPlanQuantity()));
                existingVo.setDelFlag(0);
                return existingVo;
            });
        });
        return new ArrayList<>(aggregatedDetails.values());
    }
}
