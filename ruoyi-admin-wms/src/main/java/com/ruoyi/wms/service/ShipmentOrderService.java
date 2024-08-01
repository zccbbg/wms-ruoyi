package com.ruoyi.wms.service;

import com.ruoyi.common.core.utils.MapstructUtils;
import com.ruoyi.common.mybatis.core.page.TableDataInfo;
import com.ruoyi.common.mybatis.core.page.PageQuery;
import com.ruoyi.common.core.utils.StringUtils;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import com.ruoyi.wms.domain.bo.ShipmentOrderBo;
import com.ruoyi.wms.domain.vo.ShipmentOrderVo;
import com.ruoyi.wms.domain.entity.ShipmentOrder;
import com.ruoyi.wms.mapper.ShipmentOrderMapper;

import java.util.List;
import java.util.Map;
import java.util.Collection;

/**
 * 出库单Service业务层处理
 *
 * @author zcc
 * @date 2024-08-01
 */
@RequiredArgsConstructor
@Service
public class ShipmentOrderService {

    private final ShipmentOrderMapper shipmentOrderMapper;

    /**
     * 查询出库单
     */
    public ShipmentOrderVo queryById(Long id){
        return shipmentOrderMapper.selectVoById(id);
    }

    /**
     * 查询出库单列表
     */
    public TableDataInfo<ShipmentOrderVo> queryPageList(ShipmentOrderBo bo, PageQuery pageQuery) {
        LambdaQueryWrapper<ShipmentOrder> lqw = buildQueryWrapper(bo);
        Page<ShipmentOrderVo> result = shipmentOrderMapper.selectVoPage(pageQuery.build(), lqw);
        return TableDataInfo.build(result);
    }

    /**
     * 查询出库单列表
     */
    public List<ShipmentOrderVo> queryList(ShipmentOrderBo bo) {
        LambdaQueryWrapper<ShipmentOrder> lqw = buildQueryWrapper(bo);
        return shipmentOrderMapper.selectVoList(lqw);
    }

    private LambdaQueryWrapper<ShipmentOrder> buildQueryWrapper(ShipmentOrderBo bo) {
        Map<String, Object> params = bo.getParams();
        LambdaQueryWrapper<ShipmentOrder> lqw = Wrappers.lambdaQuery();
        lqw.eq(StringUtils.isNotBlank(bo.getShipmentOrderNo()), ShipmentOrder::getShipmentOrderNo, bo.getShipmentOrderNo());
        lqw.eq(bo.getShipmentOrderType() != null, ShipmentOrder::getShipmentOrderType, bo.getShipmentOrderType());
        lqw.eq(StringUtils.isNotBlank(bo.getOrderNo()), ShipmentOrder::getOrderNo, bo.getOrderNo());
        lqw.eq(bo.getMerchantId() != null, ShipmentOrder::getMerchantId, bo.getMerchantId());
        lqw.eq(bo.getReceivableAmount() != null, ShipmentOrder::getReceivableAmount, bo.getReceivableAmount());
        lqw.eq(bo.getTotalQuantity() != null, ShipmentOrder::getTotalQuantity, bo.getTotalQuantity());
        lqw.eq(bo.getShipmentOrderStatus() != null, ShipmentOrder::getShipmentOrderStatus, bo.getShipmentOrderStatus());
        return lqw;
    }

    /**
     * 新增出库单
     */
    public void insertByBo(ShipmentOrderBo bo) {
        ShipmentOrder add = MapstructUtils.convert(bo, ShipmentOrder.class);
        shipmentOrderMapper.insert(add);
    }

    /**
     * 修改出库单
     */
    public void updateByBo(ShipmentOrderBo bo) {
        ShipmentOrder update = MapstructUtils.convert(bo, ShipmentOrder.class);
        shipmentOrderMapper.updateById(update);
    }

    /**
     * 批量删除出库单
     */
    public void deleteByIds(Collection<Long> ids) {
        shipmentOrderMapper.deleteBatchIds(ids);
    }
}
