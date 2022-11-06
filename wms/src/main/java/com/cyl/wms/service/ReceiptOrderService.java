package com.cyl.wms.service;

import cn.hutool.core.collection.CollUtil;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.cyl.wms.constant.ReceiptOrderConstant;
import com.cyl.wms.convert.ReceiptOrderConvert;
import com.cyl.wms.convert.ReceiptOrderDetailConvert;
import com.cyl.wms.domain.InventoryHistory;
import com.cyl.wms.domain.Item;
import com.cyl.wms.domain.ReceiptOrder;
import com.cyl.wms.domain.ReceiptOrderDetail;
import com.cyl.wms.mapper.ReceiptOrderDetailMapper;
import com.cyl.wms.mapper.ReceiptOrderMapper;
import com.cyl.wms.pojo.query.ItemQuery;
import com.cyl.wms.pojo.query.ReceiptOrderDetailQuery;
import com.cyl.wms.pojo.query.ReceiptOrderQuery;
import com.cyl.wms.pojo.vo.ItemVO;
import com.cyl.wms.pojo.vo.ReceiptOrderDetailVO;
import com.cyl.wms.pojo.vo.ReceiptOrderVO;
import com.cyl.wms.pojo.vo.form.ReceiptOrderForm;
import com.github.pagehelper.PageHelper;
import com.ruoyi.common.utils.SecurityUtils;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.math.BigDecimal;
import java.security.Security;
import java.time.LocalDateTime;
import java.util.*;
import java.util.stream.Collectors;

/**
 * 入库单Service业务层处理
 *
 * @author zcc
 */
@Service
@Slf4j
public class ReceiptOrderService {
    @Autowired
    private ReceiptOrderMapper receiptOrderMapper;
    @Autowired
    private ReceiptOrderConvert receiptOrderConvert;
    @Autowired
    private ReceiptOrderDetailConvert receiptOrderDetailConvert;
    @Autowired
    private ReceiptOrderDetailMapper receiptOrderDetailMapper;
    @Autowired
    private ReceiptOrderDetailService receiptOrderDetailService;
    @Autowired
    private ItemService itemService;
    @Autowired
    private InventoryHistoryService inventoryHistoryService;

    @Autowired
    private InventoryService inventoryService;

    /**
     * 查询入库单
     *
     * @param id 入库单主键
     * @return 入库单
     */
    public ReceiptOrderForm selectById(Long id) {
        ReceiptOrder order = receiptOrderMapper.selectById(id);
        if (order == null) {
            return null;
        }
        ReceiptOrderDetailQuery query = new ReceiptOrderDetailQuery();
        query.setReceiptOrderId(id);
        ReceiptOrderForm form = receiptOrderConvert.do2form(order);
        List<ReceiptOrderDetail> receiptOrderDetails = receiptOrderDetailService.selectList(query, null);
        List<ReceiptOrderDetailVO> receiptOrderDetailVOS = receiptOrderDetailService.toVos(receiptOrderDetails);
        form.setDetails(receiptOrderDetailVOS);
        if (!CollUtil.isEmpty(form.getDetails())) {
            List<Long> itemIds = form.getDetails().stream().map(ReceiptOrderDetailVO::getItemId).distinct().collect(Collectors.toList());
            ItemQuery query1 = new ItemQuery();
            query1.setIds(itemIds);
            List<Item> list = itemService.selectList(query1, null);
            List<ItemVO> items = itemService.toVos(list);
            form.setItems(items);
        }
        return form;
    }

    /**
     * 查询入库单列表
     *
     * @param query 查询条件
     * @param page  分页条件
     * @return 入库单
     */
    public List<ReceiptOrderVO> selectList(ReceiptOrderQuery query) {
        List<ReceiptOrder> list = selectList1(query);
        return receiptOrderConvert.dos2vos(list);
    }

    public Page<ReceiptOrderVO> selectList(ReceiptOrderQuery query, Pageable page) {
        if (page != null) {
            PageHelper.startPage(page.getPageNumber() + 1, page.getPageSize(), "create_time desc");
        }
        List<ReceiptOrder> list = selectList1(query);
        List<ReceiptOrderVO> res = receiptOrderConvert.dos2vos(list);
        if (!CollUtil.isEmpty(res)) {
            List<Long> ids = res.stream().map(ReceiptOrderVO::getId).collect(Collectors.toList());
            Map<Long, Integer> id2count = receiptOrderDetailMapper.countByOrderId(ids).stream().collect(Collectors.toMap(ReceiptOrderVO::getId, ReceiptOrderVO::getDetailCount));
            res.forEach(it -> it.setDetailCount(id2count.get(it.getId())));
        }
        return new PageImpl<>(res, page, ((com.github.pagehelper.Page) list).getTotal());
    }

    private List<ReceiptOrder> selectList1(ReceiptOrderQuery query) {
        QueryWrapper<ReceiptOrder> qw = new QueryWrapper<>();
        qw.eq("del_flag", 0);
        String receiptOrderNo = query.getReceiptOrderNo();
        if (!StringUtils.isEmpty(receiptOrderNo)) {
            qw.eq("receipt_order_no", receiptOrderNo);
        }
        Integer receiptOrderType = query.getReceiptOrderType();
        if (receiptOrderType != null) {
            qw.eq("receipt_order_type", receiptOrderType);
        }
        Long supplierId = query.getSupplierId();
        if (supplierId != null) {
            qw.eq("supplier_id", supplierId);
        }
        String orderNo = query.getOrderNo();
        if (!StringUtils.isEmpty(orderNo)) {
            qw.eq("order_no", orderNo);
        }
        Integer receiptOrderStatus = query.getReceiptOrderStatus();
        if (receiptOrderStatus != null) {
            qw.eq("receipt_order_status", receiptOrderStatus);
        }
        return receiptOrderMapper.selectList(qw);
    }

    /**
     * 新增或更新入库单以及入库明细
     *
     * @param receiptOrder 入库单
     * @return 结果
     */
    @Transactional
    public int addOrUpdate(ReceiptOrderForm receiptOrder) {
        int res;
        // 1. 新增
        if (receiptOrder.getId() == null) {
            receiptOrder.setDelFlag(0);
            receiptOrder.setCreateTime(LocalDateTime.now());
            res = receiptOrderMapper.insert(receiptOrder);
            saveDetails(receiptOrder.getId(), receiptOrder.getDetails());
            return res;
        }
        // 2. 编辑
        QueryWrapper<ReceiptOrderDetail> qw = new QueryWrapper<>();
        qw.eq("receipt_order_id", receiptOrder.getId());

        // 新旧入库单详情对比， 生成 库存记录修改
        List<ReceiptOrderDetailVO> details = receiptOrder.getDetails();
        Map<Long, ReceiptOrderDetail> dbDetailMap = receiptOrderDetailMapper.selectList(qw).stream().collect(Collectors.toMap(ReceiptOrderDetail::getId, it -> it));
        List<InventoryHistory> adds = new ArrayList<>();
        LocalDateTime now = LocalDateTime.now();
        Long userId = SecurityUtils.getUserId();
        details.forEach(it -> {
            Integer status = it.getReceiptOrderStatus();
            if (status != ReceiptOrderConstant.PART_IN && status != ReceiptOrderConstant.ALL_IN) {
                return;
            }
            // 新增时， status一定是未入库， 所以这个地方必定有值
            ReceiptOrderDetail dbDetail = dbDetailMap.get(it.getId());
            // 如果上次的状态不是部分入库或者全部入库，则本次的库存变化为本次的全部
            Integer status1 = dbDetail.getReceiptOrderStatus();
            BigDecimal added;
            if (status1 != ReceiptOrderConstant.PART_IN && status1 != ReceiptOrderConstant.ALL_IN) {
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

            // 1. 前一次的实际数量是 0
            InventoryHistory h = receiptOrderDetailConvert.do2InventoryHistory(it);
            h.setFormId(receiptOrder.getId());
            h.setFormType(receiptOrder.getReceiptOrderType());
            h.setQuantity(added);
            h.setDelFlag(0);
            h.setId(null);
            h.setCreateTime(now);
            h.setCreateBy(userId);
            adds.add(h);
        });

        if (adds.size() > 0) {
            int add1 = inventoryHistoryService.batchInsert(adds);
            int update1 = inventoryService.batchUpdate1(adds);
            log.info("inventoryHistory: {}, inventory: {}", add1, update1);
        }
        // 2.1 编辑或发货入库，都要先删除details 再重新保存
        receiptOrderDetailMapper.delete(qw);
        saveDetails(receiptOrder.getId(), receiptOrder.getDetails());

        // 2.2 更新入库单
        res = receiptOrderMapper.updateById(receiptOrder);
        return res;
    }

    private void saveDetails(Long orderId, List<ReceiptOrderDetailVO> details) {
        if (!CollUtil.isEmpty(details)) {
            details.forEach(it -> it.setReceiptOrderId(orderId));
            List<ReceiptOrderDetail> receiptOrders = receiptOrderDetailConvert.vos2dos(details);
            receiptOrderDetailMapper.batchInsert(receiptOrders);
        }
    }

    /**
     * 修改入库单
     *
     * @param receiptOrder 入库单
     * @return 结果
     */
    public int update(ReceiptOrder receiptOrder) {
        return receiptOrderMapper.updateById(receiptOrder);
    }

    /**
     * 批量删除入库单
     *
     * @param ids 需要删除的入库单主键
     * @return 结果
     */
    public int deleteByIds(Long[] ids) {
        return receiptOrderMapper.updateDelFlagByIds(ids);
    }

    /**
     * 删除入库单信息
     *
     * @param id 入库单主键
     * @return 结果
     */
    public int deleteById(Long id) {
        Long[] ids = {id};
        return receiptOrderMapper.updateDelFlagByIds(ids);
    }
}
