package com.cyl.wms.service;

import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.util.*;
import java.time.LocalDateTime;
import java.util.stream.Collectors;

import cn.hutool.core.collection.CollUtil;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.cyl.wms.constant.ShipmentOrderConstant;
import com.cyl.wms.convert.ShipmentOrderConvert;
import com.cyl.wms.convert.ShipmentOrderDetailConvert;
import com.cyl.wms.domain.*;
import com.cyl.wms.mapper.ShipmentOrderDetailMapper;
import com.cyl.wms.pojo.query.ItemQuery;
import com.cyl.wms.pojo.query.ShipmentOrderDetailQuery;
import com.cyl.wms.pojo.vo.*;
import com.cyl.wms.pojo.vo.form.ReceiptOrderForm;
import com.cyl.wms.pojo.vo.form.ShipmentOrderFrom;
import com.github.pagehelper.PageHelper;
import com.ruoyi.common.constant.HttpStatus;
import com.ruoyi.common.exception.ServiceException;
import com.ruoyi.common.utils.SecurityUtils;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.Pageable;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;
import com.cyl.wms.mapper.ShipmentOrderMapper;
import com.cyl.wms.pojo.query.ShipmentOrderQuery;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.CollectionUtils;

/**
 * 出库单Service业务层处理
 *
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
    private InventoryHistoryService inventoryHistoryService;
    @Autowired
    private InventoryService inventoryService;

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
        }
        return form;
    }

    /**
     * 查询出库单列表
     *
     * @param query 查询条件
     * @param page 分页条件
     * @return 出库单
     */
    public Page<ShipmentOrderVO> selectList(ShipmentOrderQuery query, Pageable page) {
        if (page != null) {
            PageHelper.startPage(page.getPageNumber() + 1, page.getPageSize());
        }
        QueryWrapper<ShipmentOrder> qw = new QueryWrapper<>();
        qw.orderByDesc("id");
        qw.eq("del_flag",0);
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
            res.forEach(it -> it.setDetailCount(id2count.get(it.getId())));
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
    public int deleteByIds(Long[] ids) {
        return shipmentOrderMapper.updateDelFlagByIds(ids);
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
    public int addOrUpdate(ShipmentOrderFrom order) {
        int res;
        // 1. 新增
        if (order.getId() == null) {
            order.setDelFlag(0);
            order.setCreateTime(LocalDateTime.now());
            res = shipmentOrderMapper.insert(order);
            saveDetails(order.getId(), order.getDetails());
            return res;
        }
        // 2. 编辑
        QueryWrapper<ShipmentOrderDetail> qw = new QueryWrapper<>();
        qw.eq("shipment_order_id", order.getId());

        // 新旧入库单详情对比， 生成 库存记录修改
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
            boolean success = inventoryService.canOutStock(it.getItemId(), it.getWarehouseId(), it.getAreaId(), it.getRackId(), added);
            if (!success) {
                throw new ServiceException("库存不足", HttpStatus.BAD_REQUEST);
            }

            // 1. 前一次的实际数量是 0
            InventoryHistory h = detailConvert.do2InventoryHistory(it);
            h.setFormId(order.getId());
            h.setFormType(order.getShipmentOrderType());
            h.setQuantity(added);
            h.setDelFlag(0);
            h.setId(null);
            h.setCreateTime(now);
            h.setCreateBy(userId);
            adds.add(h);
        });
        if (adds.size() > 0) {
            int add1 = inventoryHistoryService.batchInsert(adds);
            adds.forEach(it->it.setQuantity(it.getQuantity().negate()));
            int update1 = inventoryService.batchUpdate1(adds);
            log.info("inventoryHistory: {}, inventory: {}", add1, update1);
        }
        // 2.1 先删除details 再重新保存
        shipmentOrderDetailMapper.delete(qw);
        saveDetails(order.getId(), order.getDetails());

        // 2.2 更新出库单
        //判断出库单的整体状态
        Set<Integer> statusList = order.getDetails().stream().map(it -> it.getShipmentOrderStatus()).collect(Collectors.toSet());
        if (statusList.size() == 1) {
            order.setShipmentOrderStatus(statusList.iterator().next());
        }else if (statusList.contains(ShipmentOrderConstant.PART_IN)) {
            order.setShipmentOrderStatus(ShipmentOrderConstant.PART_IN);
        }
        res = shipmentOrderMapper.updateById(order);
        return res;

    }

    private void saveDetails(Long orderId, List<ShipmentOrderDetailVO> details) {
        if (!CollUtil.isEmpty(details)) {
            details.forEach(it -> it.setShipmentOrderId(orderId));
            List<ShipmentOrderDetail> shipmentOrderDetails = detailConvert.vos2dos(details);
            shipmentOrderDetailMapper.batchInsert(shipmentOrderDetails);
        }
    }
}
