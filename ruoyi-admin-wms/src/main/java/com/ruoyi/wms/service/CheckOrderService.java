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
import com.ruoyi.wms.domain.bo.CheckOrderBo;
import com.ruoyi.wms.domain.bo.CheckOrderDetailBo;
import com.ruoyi.wms.domain.bo.InventoryBo;
import com.ruoyi.wms.domain.entity.CheckOrder;
import com.ruoyi.wms.domain.entity.CheckOrderDetail;
import com.ruoyi.wms.domain.entity.InventoryHistory;
import com.ruoyi.wms.domain.vo.CheckOrderVo;
import com.ruoyi.wms.mapper.CheckOrderMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.math.BigDecimal;
import java.util.Collection;
import java.util.List;
import java.util.Map;
import java.util.Objects;

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
        List<InventoryBo> shipmentList = splitOutShipmentData(details);
        List<InventoryBo> receiptList = splitOutReceiptData(bo);
        // 有盘亏出库
        if (CollUtil.isNotEmpty(shipmentList)) {
            // todo 校验入库记录剩余数
            //inventoryService.validateRemainQuantity(shipmentList);
            // todo 扣减入库记录剩余数
            //inventoryMapper.deductInventoryDetailQuantity(shipmentList, LoginHelper.getUsername(), LocalDateTime.now());

            // 扣减库存
            inventoryService.updateInventoryQuantity(shipmentList);
            // 创建库存记录流水
            createInventoryHistory(shipmentList, bo.getId(), bo.getCheckOrderNo());
        }
        // 有盘盈入库
        if (CollUtil.isNotEmpty(receiptList)) {
            // 加库存
            inventoryService.updateInventoryQuantity(receiptList);
            // 创建库存记录流水
            createInventoryHistory(receiptList, bo.getId(), bo.getCheckOrderNo());
        }
    }

    private void calcProfitAndLoss(List<CheckOrderDetailBo> details) {
        details.forEach(detail -> detail.setProfitAndLoss(detail.getCheckQuantity().subtract(detail.getQuantity())));
    }

    public List<InventoryBo> splitOutShipmentData(List<CheckOrderDetailBo> details) {
        return details.stream()
            .filter(detail -> detail.getProfitAndLoss().compareTo(BigDecimal.ZERO) < 0)
            .map(filteredDetail -> {
                InventoryBo inventoryBo = new InventoryBo();
                inventoryBo.setSkuId(filteredDetail.getSkuId());
                inventoryBo.setWarehouseId(filteredDetail.getWarehouseId());
                inventoryBo.setQuantity(filteredDetail.getProfitAndLoss());
                return inventoryBo;
            }).toList();
    }

    public List<InventoryBo> splitOutReceiptData(CheckOrderBo bo) {
        return bo.getDetails().stream()
            .filter(detail -> detail.getProfitAndLoss().compareTo(BigDecimal.ZERO) > 0)
            .map(filteredDetail -> {
                InventoryBo inventoryDetailBo = new InventoryBo();
                inventoryDetailBo.setSkuId(filteredDetail.getSkuId());
                inventoryDetailBo.setWarehouseId(filteredDetail.getWarehouseId());
                inventoryDetailBo.setQuantity(filteredDetail.getProfitAndLoss());
                inventoryDetailBo.setCreateTime(filteredDetail.getReceiptTime());
                return inventoryDetailBo;
            }).toList();
    }

    @Transactional
    public void createInventoryHistory(List<InventoryBo> inventoryDetailBoList, Long checkOrderId, String checkOrderNo) {
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
