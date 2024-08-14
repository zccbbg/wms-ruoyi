package com.ruoyi.wms.service;

import cn.hutool.core.collection.CollUtil;
import com.ruoyi.common.core.constant.ServiceConstants;
import com.ruoyi.common.core.exception.ServiceException;
import com.ruoyi.common.core.exception.base.BaseException;
import com.ruoyi.common.core.utils.MapstructUtils;
import com.ruoyi.common.mybatis.core.domain.BaseEntity;
import com.ruoyi.common.mybatis.core.page.TableDataInfo;
import com.ruoyi.common.mybatis.core.page.PageQuery;
import com.ruoyi.common.core.utils.StringUtils;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.ruoyi.common.satoken.utils.LoginHelper;
import com.ruoyi.wms.domain.bo.CheckOrderDetailBo;
import com.ruoyi.wms.domain.bo.InventoryBo;
import com.ruoyi.wms.domain.bo.InventoryDetailBo;
import com.ruoyi.wms.domain.entity.CheckOrderDetail;
import com.ruoyi.wms.domain.entity.InventoryDetail;
import com.ruoyi.wms.domain.entity.InventoryHistory;
import com.ruoyi.wms.mapper.InventoryDetailMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import com.ruoyi.wms.domain.bo.CheckOrderBo;
import com.ruoyi.wms.domain.vo.CheckOrderVo;
import com.ruoyi.wms.domain.entity.CheckOrder;
import com.ruoyi.wms.mapper.CheckOrderMapper;
import org.springframework.transaction.annotation.Transactional;

import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.util.*;

/**
 * 库存盘点单据Service业务层处理
 *
 * @author zcc
 * @date 2024-08-13
 */
@RequiredArgsConstructor
@Service
public class CheckOrderService {

    private final CheckOrderMapper checkOrderMapper;
    private final CheckOrderDetailService checkOrderDetailService;
    private final InventoryDetailService inventoryDetailService;
    private final InventoryDetailMapper inventoryDetailMapper;
    private final InventoryService inventoryService;
    private final InventoryHistoryService inventoryHistoryService;

    /**
     * 查询库存盘点单据
     */
    public CheckOrderVo queryById(Long id){
        CheckOrderVo checkOrderVo = checkOrderMapper.selectVoById(id);
        if (checkOrderVo == null) {
            throw new BaseException("盘库单不存在");
        }
        checkOrderVo.setDetails(checkOrderDetailService.queryByCheckOrderId(id));
        return checkOrderVo;
    }

    /**
     * 查询库存盘点单据列表
     */
    public TableDataInfo<CheckOrderVo> queryPageList(CheckOrderBo bo, PageQuery pageQuery) {
        LambdaQueryWrapper<CheckOrder> lqw = buildQueryWrapper(bo);
        Page<CheckOrderVo> result = checkOrderMapper.selectVoPage(pageQuery.build(), lqw);
        return TableDataInfo.build(result);
    }

    /**
     * 查询库存盘点单据列表
     */
    public List<CheckOrderVo> queryList(CheckOrderBo bo) {
        LambdaQueryWrapper<CheckOrder> lqw = buildQueryWrapper(bo);
        return checkOrderMapper.selectVoList(lqw);
    }

    private LambdaQueryWrapper<CheckOrder> buildQueryWrapper(CheckOrderBo bo) {
        Map<String, Object> params = bo.getParams();
        LambdaQueryWrapper<CheckOrder> lqw = Wrappers.lambdaQuery();
        lqw.eq(StringUtils.isNotBlank(bo.getCheckOrderNo()), CheckOrder::getCheckOrderNo, bo.getCheckOrderNo());
        lqw.eq(bo.getCheckOrderStatus() != null, CheckOrder::getCheckOrderStatus, bo.getCheckOrderStatus());
        lqw.eq(bo.getCheckOrderTotal() != null, CheckOrder::getCheckOrderTotal, bo.getCheckOrderTotal());
        lqw.eq(bo.getWarehouseId() != null, CheckOrder::getWarehouseId, bo.getWarehouseId());
        lqw.eq(bo.getAreaId() != null, CheckOrder::getAreaId, bo.getAreaId());
        lqw.orderByDesc(BaseEntity::getCreateTime);
        return lqw;
    }

    /**
     * 新增库存盘点单据
     */
    @Transactional
    public void insertByBo(CheckOrderBo bo) {
        // 校验盘库单号唯一性
        validateCheckOrderNo(bo.getCheckOrderNo());
        // 创建盘库单
        CheckOrder add = MapstructUtils.convert(bo, CheckOrder.class);
        checkOrderMapper.insert(add);
        // 创建盘库单明细
        List<CheckOrderDetail> addDetailList = MapstructUtils.convert(bo.getDetails(), CheckOrderDetail.class);
        addDetailList.forEach(it -> it.setCheckOrderId(add.getId()));
        checkOrderDetailService.saveDetails(addDetailList);
    }

    private void validateCheckOrderNo(String checkOrderNo) {
        LambdaQueryWrapper<CheckOrder> lambdaQueryWrapper = Wrappers.lambdaQuery();
        lambdaQueryWrapper.eq(CheckOrder::getCheckOrderNo, checkOrderNo);
        if (checkOrderMapper.exists(lambdaQueryWrapper)) {
            throw new BaseException("盘库单号重复，请手动修改");
        }
    }

    /**
     * 修改库存盘点单据
     */
    @Transactional
    public void updateByBo(CheckOrderBo bo) {
        // 更新盘库单
        CheckOrder update = MapstructUtils.convert(bo, CheckOrder.class);
        checkOrderMapper.updateById(update);
        // 保存盘库单明细
        List<CheckOrderDetail> detailList = MapstructUtils.convert(bo.getDetails(), CheckOrderDetail.class);
        detailList.forEach(it -> it.setCheckOrderId(bo.getId()));
        checkOrderDetailService.saveDetails(detailList);
    }

    public void deleteById(Long id) {
        validateIdBeforeDelete(id);
        checkOrderMapper.deleteById(id);
    }

    private void validateIdBeforeDelete(Long id) {
        CheckOrderVo checkOrderVo = queryById(id);
        if (checkOrderVo == null) {
            throw new BaseException("盘库单不存在");
        }
        if (ServiceConstants.CheckOrderStatus.FINISH.equals(checkOrderVo.getCheckOrderStatus())) {
            throw new ServiceException("盘库单【" + checkOrderVo.getCheckOrderNo() + "】已盘库完成，无法删除！");
        }
    }

    /**
     * 批量删除库存盘点单据
     */
    public void deleteByIds(Collection<Long> ids) {
        checkOrderMapper.deleteBatchIds(ids);
    }

    /**
     * 盘库结束
     * 拆分出盘盈入库和盘亏出库的
     * 有出库的话要校验
     * 分别对入库与出库根据仓库库区规格进行合并——用于更新库存
     * 更新入库记录剩余数
     * 更新库存
     * 记流水
     * @param bo
     */
    @Transactional
    public void check(CheckOrderBo bo) {
        List<CheckOrderDetailBo> details = bo.getDetails();
        // 保存盘库单
        if (Objects.isNull(bo.getId())) {
            insertByBo(bo);
        } else {
            updateByBo(bo);
        }
        // 计算盈亏数
        calcProfitAndLoss(details);
        // 拆分盘盈入库和盘盈出库数据
        List<InventoryDetailBo> shipmentList = splitOutShipmentData(details);
        List<InventoryDetailBo> receiptList = splitOutReceiptData(bo);
        // 有盘亏出库
        if (CollUtil.isNotEmpty(shipmentList)) {
            // 校验入库记录剩余数
            inventoryDetailService.validateRemainQuantity(shipmentList);
            // 扣减入库记录剩余数
            inventoryDetailMapper.deductInventoryDetailQuantity(shipmentList, LoginHelper.getUsername(), LocalDateTime.now());
            // 合并
            List<InventoryBo> mergedDeductInventoryBoList = mergeInventoryDetailByPlaceAndItem(shipmentList);
            // 扣减库存
            inventoryService.updateInventoryQuantity(mergedDeductInventoryBoList);
            // 创建库存记录流水
            createInventoryHistory(shipmentList, bo.getId(), bo.getCheckOrderNo());
        }
        // 有盘盈入库
        if (CollUtil.isNotEmpty(receiptList)) {
            // 合并
            List<InventoryBo> mergedAddInventoryBoList = mergeInventoryDetailByPlaceAndItem(receiptList);
            // 加库存
            inventoryService.updateInventoryQuantity(mergedAddInventoryBoList);
            // 创建入库记录
            inventoryDetailService.saveBatch(MapstructUtils.convert(receiptList, InventoryDetail.class));
            // 创建库存记录流水
            createInventoryHistory(receiptList, bo.getId(), bo.getCheckOrderNo());
        }
    }

    private void calcProfitAndLoss(List<CheckOrderDetailBo> details) {
        details.forEach(detail -> detail.setProfitAndLoss(detail.getCheckQuantity().subtract(detail.getQuantity())));
    }

    public List<InventoryDetailBo> splitOutShipmentData(List<CheckOrderDetailBo> details) {
        return details.stream()
            .filter(detail -> detail.getProfitAndLoss().compareTo(BigDecimal.ZERO) < 0)
            .map(filteredDetail -> {
                InventoryDetailBo inventoryDetailBo = new InventoryDetailBo();
                inventoryDetailBo.setId(filteredDetail.getInventoryDetailId());
                inventoryDetailBo.setSkuId(filteredDetail.getSkuId());
                inventoryDetailBo.setWarehouseId(filteredDetail.getWarehouseId());
                inventoryDetailBo.setAreaId(filteredDetail.getAreaId());
                inventoryDetailBo.setQuantity(filteredDetail.getProfitAndLoss());
                inventoryDetailBo.setBatchNo(filteredDetail.getBatchNo());
                inventoryDetailBo.setProductionDate(filteredDetail.getProductionDate());
                inventoryDetailBo.setExpirationDate(filteredDetail.getExpirationDate());
                inventoryDetailBo.setShipmentQuantity(filteredDetail.getProfitAndLoss().abs());
                return inventoryDetailBo;
            }).toList();
    }

    public List<InventoryDetailBo> splitOutReceiptData(CheckOrderBo bo) {
        return bo.getDetails().stream()
            .filter(detail -> detail.getProfitAndLoss().compareTo(BigDecimal.ZERO) > 0)
            .map(filteredDetail -> {
                InventoryDetailBo inventoryDetailBo = new InventoryDetailBo();
                inventoryDetailBo.setReceiptOrderId(bo.getId());
                inventoryDetailBo.setType(ServiceConstants.InventoryDetailType.CHECK);
                inventoryDetailBo.setSkuId(filteredDetail.getSkuId());
                inventoryDetailBo.setWarehouseId(filteredDetail.getWarehouseId());
                inventoryDetailBo.setAreaId(filteredDetail.getAreaId());
                inventoryDetailBo.setQuantity(filteredDetail.getProfitAndLoss());
                inventoryDetailBo.setBatchNo(filteredDetail.getBatchNo());
                inventoryDetailBo.setProductionDate(filteredDetail.getProductionDate());
                inventoryDetailBo.setExpirationDate(filteredDetail.getExpirationDate());
                inventoryDetailBo.setRemainQuantity(filteredDetail.getProfitAndLoss());
                inventoryDetailBo.setCreateTime(filteredDetail.getReceiptTime());
                return inventoryDetailBo;
            }).toList();
    }

    private List<InventoryBo> mergeInventoryDetailByPlaceAndItem(List<InventoryDetailBo> details) {
        Map<String, InventoryBo> mergedMap = new HashMap<>();
        details.forEach(detail -> {
            String mergedKey = detail.getKey();
            if (mergedMap.containsKey(mergedKey)) {
                InventoryBo mergedInventoryBo = mergedMap.get(mergedKey);
                mergedInventoryBo.setQuantity(mergedInventoryBo.getQuantity().add(detail.getQuantity()));
            } else {
                InventoryBo mergedInventoryBo = new InventoryBo();
                mergedInventoryBo.setWarehouseId(detail.getWarehouseId());
                mergedInventoryBo.setAreaId(detail.getAreaId());
                mergedInventoryBo.setSkuId(detail.getSkuId());
                mergedInventoryBo.setQuantity(detail.getQuantity());
                mergedMap.put(mergedKey, mergedInventoryBo);
            }
        });
        return new ArrayList<>(mergedMap.values());
    }

    @Transactional
    public void createInventoryHistory(List<InventoryDetailBo> inventoryDetailBoList, Long checkOrderId, String checkOrderNo) {
        List<InventoryHistory> addInventoryHistoryList = inventoryDetailBoList.stream().map(bo -> {
            InventoryHistory addInventoryHistory = MapstructUtils.convert(bo, InventoryHistory.class);
            addInventoryHistory.setId(null);
            addInventoryHistory.setOrderId(checkOrderId);
            addInventoryHistory.setOrderNo(checkOrderNo);
            addInventoryHistory.setOrderType(ServiceConstants.InventoryHistoryOrderType.CHECK);
            return addInventoryHistory;
        }).toList();
        inventoryHistoryService.saveBatch(addInventoryHistoryList);
    }
}
