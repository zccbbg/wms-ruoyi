package com.ruoyi.wms.service;

import cn.hutool.core.collection.CollUtil;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.ruoyi.common.core.utils.MapstructUtils;
import com.ruoyi.common.mybatis.core.page.PageQuery;
import com.ruoyi.common.mybatis.core.page.TableDataInfo;
import com.ruoyi.wms.domain.bo.ReceiptOrderDetailBo;
import com.ruoyi.wms.domain.vo.ItemSkuVo;
import com.ruoyi.wms.mapper.ReceiptOrderDetailMapper;
import jakarta.validation.constraints.NotNull;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.ruoyi.wms.domain.entity.ReceiptOrderDetail;
import com.ruoyi.wms.domain.vo.ReceiptOrderDetailVo;

import java.util.*;
import java.util.function.Function;
import java.util.stream.Collectors;

/**
 * 入库单详情Service业务层处理
 *
 * @author zcc
 * @date 2024-07-19
 */
@RequiredArgsConstructor
@Service
public class ReceiptOrderDetailService extends ServiceImpl<ReceiptOrderDetailMapper, ReceiptOrderDetail> {

    private final ReceiptOrderDetailMapper receiptOrderDetailMapper;
    private final ItemSkuService itemSkuService;

    /**
     * 查询入库单详情
     */
    public ReceiptOrderDetailVo queryById(Long id){
        return receiptOrderDetailMapper.selectVoById(id);
    }

    /**
     * 查询入库单详情列表
     */
    public TableDataInfo<ReceiptOrderDetailVo> queryPageList(ReceiptOrderDetailBo bo, PageQuery pageQuery) {
        LambdaQueryWrapper<ReceiptOrderDetail> lqw = buildQueryWrapper(bo);
        Page<ReceiptOrderDetailVo> result = receiptOrderDetailMapper.selectVoPage(pageQuery.build(), lqw);
        return TableDataInfo.build(result);
    }

    /**
     * 查询入库单详情列表
     */
    public List<ReceiptOrderDetailVo> queryList(ReceiptOrderDetailBo bo) {
        LambdaQueryWrapper<ReceiptOrderDetail> lqw = buildQueryWrapper(bo);
        return receiptOrderDetailMapper.selectVoList(lqw);
    }

    private LambdaQueryWrapper<ReceiptOrderDetail> buildQueryWrapper(ReceiptOrderDetailBo bo) {
        Map<String, Object> params = bo.getParams();
        LambdaQueryWrapper<ReceiptOrderDetail> lqw = Wrappers.lambdaQuery();
        lqw.eq(bo.getReceiptOrderId() != null, ReceiptOrderDetail::getReceiptOrderId, bo.getReceiptOrderId());
        lqw.eq(bo.getSkuId() != null, ReceiptOrderDetail::getSkuId, bo.getSkuId());
        lqw.eq(bo.getQuantity() != null, ReceiptOrderDetail::getQuantity, bo.getQuantity());
        lqw.eq(bo.getAmount() != null, ReceiptOrderDetail::getAmount, bo.getAmount());
        lqw.eq(bo.getWarehouseId() != null, ReceiptOrderDetail::getWarehouseId, bo.getWarehouseId());
        lqw.eq(bo.getAreaId() != null, ReceiptOrderDetail::getAreaId, bo.getAreaId());
        return lqw;
    }

    /**
     * 新增入库单详情
     */
    public void insertByBo(ReceiptOrderDetailBo bo) {
        ReceiptOrderDetail add = MapstructUtils.convert(bo, ReceiptOrderDetail.class);
        receiptOrderDetailMapper.insert(add);
    }

    /**
     * 修改入库单详情
     */
    public void updateByBo(ReceiptOrderDetailBo bo) {
        ReceiptOrderDetail update = MapstructUtils.convert(bo, ReceiptOrderDetail.class);
        receiptOrderDetailMapper.updateById(update);
    }

    /**
     * 批量删除入库单详情
     */
    public void deleteByIds(Collection<Long> ids) {
        receiptOrderDetailMapper.deleteBatchIds(ids);
    }

    /**
     * 根据入库单id删除入库单详情
     */
    public void deleteByReceiptOrderId(@NotNull Long receiptOrderId) {
        LambdaQueryWrapper<ReceiptOrderDetail> lqw = Wrappers.lambdaQuery();
        lqw.eq(ReceiptOrderDetail::getReceiptOrderId, receiptOrderId);
        receiptOrderDetailMapper.delete(lqw);
    }

    @Transactional
    public void saveDetails(List<ReceiptOrderDetail> list) {
        if (CollUtil.isEmpty(list)) {
            return;
        }
        saveOrUpdateBatch(list);
    }

    public List<ReceiptOrderDetailVo> queryByReceiptOrderId(Long receiptOrderId) {
        ReceiptOrderDetailBo bo = new ReceiptOrderDetailBo();
        bo.setReceiptOrderId(receiptOrderId);
        List<ReceiptOrderDetailVo> details = queryList(bo);
        if (CollUtil.isEmpty(details)) {
            return Collections.emptyList();
        }
        Set<Long> skuIds = details
            .stream()
            .map(ReceiptOrderDetailVo::getSkuId)
            .collect(Collectors.toSet());
        Map<Long, ItemSkuVo> itemSkuMap = itemSkuService.queryVosByIds(skuIds)
            .stream()
            .collect(Collectors.toMap(ItemSkuVo::getId, Function.identity()));
        details.forEach(detail -> detail.setItemSku(itemSkuMap.get(detail.getSkuId())));
        return details;
    }
}
