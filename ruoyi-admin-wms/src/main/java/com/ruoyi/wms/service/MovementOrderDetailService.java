package com.ruoyi.wms.service;

import cn.hutool.core.collection.CollUtil;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.ruoyi.common.core.utils.MapstructUtils;
import com.ruoyi.common.mybatis.core.page.PageQuery;
import com.ruoyi.common.mybatis.core.page.TableDataInfo;
import com.ruoyi.wms.domain.bo.MovementOrderDetailBo;
import com.ruoyi.wms.domain.entity.MovementOrderDetail;
import com.ruoyi.wms.domain.vo.MovementOrderDetailVo;
import com.ruoyi.wms.mapper.MovementOrderDetailMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Collection;
import java.util.Collections;
import java.util.List;
import java.util.Map;

/**
 * 库存移动详情Service业务层处理
 *
 * @author zcc
 * @date 2024-08-09
 */
@RequiredArgsConstructor
@Service
public class MovementOrderDetailService extends ServiceImpl<MovementOrderDetailMapper, MovementOrderDetail> {

    private final MovementOrderDetailMapper movementOrderDetailMapper;
    private final ItemSkuService itemSkuService;

    /**
     * 查询库存移动详情
     */
    public MovementOrderDetailVo queryById(Long id){
        return movementOrderDetailMapper.selectVoById(id);
    }

    /**
     * 查询库存移动详情列表
     */
    public TableDataInfo<MovementOrderDetailVo> queryPageList(MovementOrderDetailBo bo, PageQuery pageQuery) {
        LambdaQueryWrapper<MovementOrderDetail> lqw = buildQueryWrapper(bo);
        Page<MovementOrderDetailVo> result = movementOrderDetailMapper.selectVoPage(pageQuery.build(), lqw);
        return TableDataInfo.build(result);
    }

    /**
     * 查询库存移动详情列表
     */
    public List<MovementOrderDetailVo> queryList(MovementOrderDetailBo bo) {
        LambdaQueryWrapper<MovementOrderDetail> lqw = buildQueryWrapper(bo);
        return movementOrderDetailMapper.selectVoList(lqw);
    }

    private LambdaQueryWrapper<MovementOrderDetail> buildQueryWrapper(MovementOrderDetailBo bo) {
        Map<String, Object> params = bo.getParams();
        LambdaQueryWrapper<MovementOrderDetail> lqw = Wrappers.lambdaQuery();
        lqw.eq(bo.getOrderId() != null, MovementOrderDetail::getOrderId, bo.getOrderId());
        lqw.eq(bo.getSkuId() != null, MovementOrderDetail::getSkuId, bo.getSkuId());
        lqw.eq(bo.getQuantity() != null, MovementOrderDetail::getQuantity, bo.getQuantity());
        lqw.eq(bo.getSourceWarehouseId() != null, MovementOrderDetail::getSourceWarehouseId, bo.getSourceWarehouseId());
        lqw.eq(bo.getTargetWarehouseId() != null, MovementOrderDetail::getTargetWarehouseId, bo.getTargetWarehouseId());
        return lqw;
    }

    /**
     * 新增库存移动详情
     */
    public void insertByBo(MovementOrderDetailBo bo) {
        MovementOrderDetail add = MapstructUtils.convert(bo, MovementOrderDetail.class);
        movementOrderDetailMapper.insert(add);
    }

    /**
     * 修改库存移动详情
     */
    public void updateByBo(MovementOrderDetailBo bo) {
        MovementOrderDetail update = MapstructUtils.convert(bo, MovementOrderDetail.class);
        movementOrderDetailMapper.updateById(update);
    }

    /**
     * 批量删除库存移动详情
     */
    public void deleteByIds(Collection<Long> ids) {
        movementOrderDetailMapper.deleteBatchIds(ids);
    }

    @Transactional
    public void saveDetails(List<MovementOrderDetail> list) {
        if (CollUtil.isEmpty(list)) {
            return;
        }
        saveOrUpdateBatch(list);
    }

    /**
     * 根据移库单id查询移库单详情
     * @param movementOrderId
     * @return
     */
    public List<MovementOrderDetailVo> queryByMovementOrderId(Long movementOrderId) {
        MovementOrderDetailBo bo = new MovementOrderDetailBo();
        bo.setOrderId(movementOrderId);
        List<MovementOrderDetailVo> details = queryList(bo);
        if (CollUtil.isEmpty(details)) {
            return Collections.emptyList();
        }
        itemSkuService.setItemSkuMap(details);
        return details;
    }
}
