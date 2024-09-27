package com.ruoyi.wms.service;

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
import com.ruoyi.wms.domain.entity.CheckOrder;
import com.ruoyi.wms.domain.entity.CheckOrderDetail;
import com.ruoyi.wms.domain.vo.CheckOrderVo;
import com.ruoyi.wms.mapper.CheckOrderMapper;
import lombok.RequiredArgsConstructor;
import org.apache.commons.lang3.SerializationUtils;
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
        lqw.eq(StringUtils.isNotBlank(bo.getOrderNo()), CheckOrder::getOrderNo, bo.getOrderNo());
        lqw.eq(bo.getOrderStatus() != null, CheckOrder::getOrderStatus, bo.getOrderStatus());
        lqw.eq(bo.getTotalQuantity() != null, CheckOrder::getTotalQuantity, bo.getTotalQuantity());
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
        validateCheckOrderNo(bo.getOrderNo());
        // 创建盘库单
        CheckOrder add = MapstructUtils.convert(bo, CheckOrder.class);
        checkOrderMapper.insert(add);
        // 创建盘库单明细
        List<CheckOrderDetail> addDetailList = MapstructUtils.convert(bo.getDetails(), CheckOrderDetail.class);
        addDetailList.forEach(it -> it.setOrderId(add.getId()));
        checkOrderDetailService.saveDetails(addDetailList);
    }

    private void validateCheckOrderNo(String checkOrderNo) {
        LambdaQueryWrapper<CheckOrder> lambdaQueryWrapper = Wrappers.lambdaQuery();
        lambdaQueryWrapper.eq(CheckOrder::getOrderNo, checkOrderNo);
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
        detailList.forEach(it -> it.setOrderId(bo.getId()));
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
        if (ServiceConstants.CheckOrderStatus.FINISH.equals(checkOrderVo.getOrderStatus())) {
            throw new ServiceException("盘库单【" + checkOrderVo.getOrderNo() + "】已盘库完成，无法删除！");
        }
    }

    /**
     * 批量删除库存盘点单据
     */
    public void deleteByIds(Collection<Long> ids) {
        checkOrderMapper.deleteBatchIds(ids);
    }

    /**
     * @param bo
     */
    @Transactional
    public void check(CheckOrderBo bo) {
        List<CheckOrderDetailBo> details = bo.getDetails();
        // 保存盘库单 check order
        if (Objects.isNull(bo.getId())) {
            insertByBo(bo);
        } else {
            updateByBo(bo);
        }
        // 保存库存 inventory
        inventoryService.updateInventory(details);
        // 新增库存记录 inventory history
        CheckOrderBo filterBo = this.filterCheckOrderDetail(bo);
        inventoryHistoryService.saveInventoryHistory(filterBo, ServiceConstants.InventoryHistoryOrderType.CHECK, true);
    }

    private CheckOrderBo filterCheckOrderDetail(CheckOrderBo bo) {
        CheckOrderBo filterBo = SerializationUtils.clone(bo);
        List<CheckOrderDetailBo> details = filterBo.getDetails().stream().filter(detail -> {
            BigDecimal result = detail.getCheckQuantity().subtract(detail.getQuantity());
            return result.signum() != 0;
        }).map(detail->{
            BigDecimal result = detail.getCheckQuantity().subtract(detail.getQuantity());
            detail.setBeforeQuantity(detail.getQuantity());
            detail.setAfterQuantity(detail.getCheckQuantity());
            detail.setQuantity(result);
            return detail;
        }).toList();
        filterBo.setDetails(details);
        return filterBo;
    }
}
