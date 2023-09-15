package com.cyl.wms.service;

import cn.hutool.core.collection.CollUtil;
import cn.hutool.core.util.StrUtil;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.cyl.wms.convert.InventoryHistoryConvert;
import com.cyl.wms.domain.*;
import com.cyl.wms.mapper.*;
import com.cyl.wms.pojo.query.InventoryHistoryQuery;
import com.cyl.wms.pojo.vo.InventoryHistoryVO;
import com.github.pagehelper.PageHelper;
import com.ruoyi.common.constant.CommonConstant;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.util.*;
import java.util.stream.Collectors;

/**
 * 库存记录Service业务层处理
 *
 * @author zcc
 */
@Service
public class InventoryHistoryService {
    @Autowired
    private InventoryHistoryMapper inventoryHistoryMapper;
    @Autowired
    private InventoryHistoryConvert inventoryHistoryConvert;
    @Autowired
    private InventoryService inventoryService;
    @Autowired
    private ReceiptOrderMapper receiptOrderMapper;
    @Autowired
    private ShipmentOrderMapper shipmentOrderMapper;
    @Autowired
    private CustomerMapper customerMapper;
    @Autowired
    private SupplierMapper supplierMapper;

    /**
     * 查询库存记录
     *
     * @param id 库存记录主键
     * @return 库存记录
     */
    public InventoryHistory selectById(Long id) {
        return inventoryHistoryMapper.selectById(id);
    }

    /**
     * 查询库存记录列表
     *
     * @param query 查询条件
     * @return 库存记录
     */
    public List<InventoryHistoryVO> selectList(InventoryHistoryQuery query) {
        List<InventoryHistory> list = queryInventoryHistories(query);
        List<InventoryHistoryVO> res = inventoryHistoryConvert.dos2vos(list);
        inventoryService.injectAreaAndItemInfo(res);
        inventoryService.injectDictDataLabel(res);
        return res;
    }

    /**
     * 注入顾客或供应商姓名，出入库单号
     * @param res
     */
    private void injectOrderIdAndName(List<InventoryHistoryVO> res) {
        List<Long> receiptIds = res.stream().filter(it -> it.getFormType() < 10).map(InventoryHistoryVO::getFormId).collect(Collectors.toList());
        List<Long> shipmentIds = res.stream().filter(it -> it.getFormType() > 10).map(InventoryHistoryVO::getFormId).collect(Collectors.toList());
        Map<Long, String> receiptOrderMap = new HashMap<>();
        Map<Long, String> supplierMap = new HashMap<>();
        Map<Long, Long> receiptMap = new HashMap<>();
        Map<Long, String> shipmentOrderMap = new HashMap<>();
        Map<Long, String> customerMap = new HashMap<>();
        Map<Long, Long> shipmentMap = new HashMap<>();
        if (CollUtil.isNotEmpty(receiptIds)) {
            List<ReceiptOrder> receiptOrderList = receiptOrderMapper.selectBatchIds(receiptIds);
            receiptMap = receiptOrderList.stream().collect(Collectors.toMap(ReceiptOrder::getId, v -> Optional.ofNullable(v.getSupplierId()).orElse(0L)));
            Set<Long> supplierIds = receiptOrderList.stream().map(ReceiptOrder::getSupplierId).collect(Collectors.toSet());
            if (CollUtil.isNotEmpty(supplierIds)) {
                supplierMap = supplierMapper.selectBatchIds(supplierIds).stream().collect(Collectors.toMap(Supplier::getId, Supplier::getSupplierName));
            }
            receiptOrderMap = receiptOrderList.stream().collect(Collectors.toMap(ReceiptOrder::getId, ReceiptOrder::getReceiptOrderNo));
        }
        if (CollUtil.isNotEmpty(shipmentIds)) {
            List<ShipmentOrder> shipmentOrderList = shipmentOrderMapper.selectBatchIds(shipmentIds);
            shipmentMap = shipmentOrderList.stream().collect(Collectors.toMap(ShipmentOrder::getId, v -> Optional.ofNullable(v.getCustomerId()).orElse(0L)));
            Set<Long> customerIds = shipmentOrderList.stream().map(ShipmentOrder::getCustomerId).collect(Collectors.toSet());
            if (CollUtil.isNotEmpty(customerIds)) {
                customerMap = customerMapper.selectBatchIds(customerIds).stream().collect(Collectors.toMap(Customer::getId, Customer::getCustomerName));
            }
            shipmentOrderMap = shipmentOrderList.stream().collect(Collectors.toMap(ShipmentOrder::getId, ShipmentOrder::getShipmentOrderNo));
        }
        for (InventoryHistoryVO vo : res) {
            if (vo.getFormType() < 10) {
                vo.setOrderId(receiptOrderMap.get(vo.getFormId()));
                vo.setName(supplierMap.get(receiptMap.get(vo.getFormId())));
            } else if (vo.getFormType() > 10){
                vo.setOrderId(shipmentOrderMap.get(vo.getFormId()));
                vo.setName(customerMap.get(shipmentMap.get(vo.getFormId())));
            }
        }
    }

    private List<InventoryHistory> queryInventoryHistories(InventoryHistoryQuery query) {
        QueryWrapper<InventoryHistory> qw = new QueryWrapper<>();
        qw.eq("del_flag", 0);
        Long formId = query.getFormId();
        if (formId != null) {
            qw.eq("form_id", formId);
        }
        Integer formType = query.getFormType();
        if (formType != null) {
            qw.eq("form_type", formType);
        }
        Long itemId = query.getItemId();
        if (itemId != null) {
            qw.eq("item_id", itemId);
        }
        if (query.getWarehouseId() != null) {
            qw.eq("warehouse_id", query.getWarehouseId());
        }
        if (query.getAreaId() != null) {
            qw.eq("area_id", query.getAreaId());
        }
        Long rackId = query.getRackId();
        if (rackId != null) {
            qw.eq("rack_id", rackId);
        }
        BigDecimal quantity = query.getQuantity();
        if (quantity != null) {
            qw.eq("quantity", quantity);
        }
        if (StrUtil.isNotBlank(query.getBeginTime()) && StrUtil.isNotBlank(query.getEndTime())) {
            qw.between("create_time", query.getBeginTime(), query.getEndTime());
        }
        List<InventoryHistory> list = inventoryHistoryMapper.selectList(qw);
        return list;
    }

    public Page<InventoryHistoryVO> selectList(InventoryHistoryQuery query, Pageable page) {
        PageHelper.startPage(page.getPageNumber() + 1, page.getPageSize(), "create_time desc");
        List<InventoryHistoryVO> list = inventoryHistoryMapper.selectPageList(query);
        inventoryService.injectAreaAndItemInfo(list);
        return new PageImpl<>(list, page, ((com.github.pagehelper.Page) list).getTotal());
    }

    /**
     * 新增库存记录
     *
     * @param inventoryHistory 库存记录
     * @return 结果
     */
    public int insert(InventoryHistory inventoryHistory) {
        inventoryHistory.setDelFlag(0);
        inventoryHistory.setCreateTime(LocalDateTime.now());
        return inventoryHistoryMapper.insert(inventoryHistory);
    }

    /**
     * 修改库存记录
     *
     * @param inventoryHistory 库存记录
     * @return 结果
     */
    public int update(InventoryHistory inventoryHistory) {
        return inventoryHistoryMapper.updateById(inventoryHistory);
    }

    /**
     * 批量删除库存记录
     *
     * @param ids 需要删除的库存记录主键
     * @return 结果
     */
    public int deleteByIds(Long[] ids) {
        return inventoryHistoryMapper.updateDelFlagByIds(ids);
    }

    /**
     * 删除库存记录信息
     *
     * @param id 库存记录主键
     * @return 结果
     */
    public int deleteById(Long id) {
        Long[] ids = {id};
        return inventoryHistoryMapper.updateDelFlagByIds(ids);
    }

    /**
     * 删除库存记录信息
     *
     * @param formId   单据id
     * @param formType 单据类型
     * @return 结果
     */
    public int deleteByForm(Long formId, Integer... formType) {
        LambdaQueryWrapper<InventoryHistory> qw = new LambdaQueryWrapper<InventoryHistory>()
                .eq(InventoryHistory::getFormId, formId);
        if (formType.length > 0) {
            List<Integer> list = Arrays.asList(formType);
            qw.in(InventoryHistory::getFormType, list);
        }
        return inventoryHistoryMapper.delete(qw);
    }

    /**
     * 查询库存记录信息
     *
     * @param formId   单据id
     * @param formType 单据类型
     * @return 结果
     */
    public List<InventoryHistory> selectByForm(Long formId, Integer... formType) {
        LambdaQueryWrapper<InventoryHistory> qw = new LambdaQueryWrapper<InventoryHistory>()
                .eq(InventoryHistory::getFormId, formId);
        if (formType.length > 0) {
            List<Integer> list = Arrays.asList(formType);
            qw.in(InventoryHistory::getFormType, list);
        }
        return inventoryHistoryMapper.selectList(qw);
    }

    /**
     * 批量新增库存记录
     *
     * @param list 库存记录列表
     * @return 结果
     */
    public int batchInsert(List<InventoryHistory> list) {
        if (CollUtil.isEmpty(list)) {
            return 0;
        }
        int re = 0;
        for (int s = 0; s < list.size(); s += CommonConstant.BATCH_SIZE) {
            re += inventoryHistoryMapper.batchInsert(list.subList(s, Math.min(s + CommonConstant.BATCH_SIZE, list.size())));
        }
        return re;
    }

}
