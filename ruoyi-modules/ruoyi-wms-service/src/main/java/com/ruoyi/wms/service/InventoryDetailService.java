package com.ruoyi.wms.service;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.ruoyi.common.core.utils.MapstructUtils;
import com.ruoyi.common.mybatis.core.page.TableDataInfo;
import com.ruoyi.common.mybatis.core.page.PageQuery;
import com.ruoyi.common.core.utils.StringUtils;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import com.ruoyi.wms.domain.bo.InventoryDetailBo;
import com.ruoyi.wms.domain.vo.InventoryDetailVo;
import com.ruoyi.wms.domain.entity.InventoryDetail;
import com.ruoyi.wms.mapper.InventoryDetailMapper;

import java.util.List;
import java.util.Map;
import java.util.Collection;

/**
 * 库存详情Service业务层处理
 *
 * @author zcc
 * @date 2024-07-22
 */
@RequiredArgsConstructor
@Service
public class InventoryDetailService extends ServiceImpl<InventoryDetailMapper, InventoryDetail> {

    private final InventoryDetailMapper inventoryDetailMapper;

    /**
     * 查询库存详情
     */
    public InventoryDetailVo queryById(Long id){
        return inventoryDetailMapper.selectVoById(id);
    }

    /**
     * 查询库存详情列表
     */
    public TableDataInfo<InventoryDetailVo> queryPageList(InventoryDetailBo bo, PageQuery pageQuery) {
        LambdaQueryWrapper<InventoryDetail> lqw = buildQueryWrapper(bo);
        Page<InventoryDetailVo> result = inventoryDetailMapper.selectVoPage(pageQuery.build(), lqw);
        return TableDataInfo.build(result);
    }

    /**
     * 查询库存详情列表
     */
    public List<InventoryDetailVo> queryList(InventoryDetailBo bo) {
        LambdaQueryWrapper<InventoryDetail> lqw = buildQueryWrapper(bo);
        return inventoryDetailMapper.selectVoList(lqw);
    }

    private LambdaQueryWrapper<InventoryDetail> buildQueryWrapper(InventoryDetailBo bo) {
        Map<String, Object> params = bo.getParams();
        LambdaQueryWrapper<InventoryDetail> lqw = Wrappers.lambdaQuery();
        lqw.eq(bo.getReceiptOrderId() != null, InventoryDetail::getReceiptOrderId, bo.getReceiptOrderId());
        lqw.eq(StringUtils.isNotBlank(bo.getReceiptOrderType()), InventoryDetail::getReceiptOrderType, bo.getReceiptOrderType());
        lqw.eq(StringUtils.isNotBlank(bo.getOrderNo()), InventoryDetail::getOrderNo, bo.getOrderNo());
        lqw.eq(bo.getType() != null, InventoryDetail::getType, bo.getType());
        lqw.eq(bo.getSkuId() != null, InventoryDetail::getSkuId, bo.getSkuId());
        lqw.eq(bo.getWarehouseId() != null, InventoryDetail::getWarehouseId, bo.getWarehouseId());
        lqw.eq(bo.getAreaId() != null, InventoryDetail::getAreaId, bo.getAreaId());
        lqw.eq(bo.getQuantity() != null, InventoryDetail::getQuantity, bo.getQuantity());
        lqw.eq(bo.getExpirationTime() != null, InventoryDetail::getExpirationTime, bo.getExpirationTime());
        lqw.eq(bo.getAmount() != null, InventoryDetail::getAmount, bo.getAmount());
        lqw.eq(bo.getRemainQuantity() != null, InventoryDetail::getRemainQuantity, bo.getRemainQuantity());
        return lqw;
    }

    /**
     * 新增库存详情
     */
    public void insertByBo(InventoryDetailBo bo) {
        InventoryDetail add = MapstructUtils.convert(bo, InventoryDetail.class);
        inventoryDetailMapper.insert(add);
    }

    /**
     * 修改库存详情
     */
    public void updateByBo(InventoryDetailBo bo) {
        InventoryDetail update = MapstructUtils.convert(bo, InventoryDetail.class);
        inventoryDetailMapper.updateById(update);
    }

    /**
     * 批量删除库存详情
     */
    public void deleteByIds(Collection<Long> ids) {
        inventoryDetailMapper.deleteBatchIds(ids);
    }
}
