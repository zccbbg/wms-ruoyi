package com.cyl.wms.service;

import java.math.BigDecimal;
import java.util.Arrays;
import java.util.LinkedList;
import java.util.List;
import java.time.LocalDateTime;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.cyl.wms.convert.ShipmentOrderDetailConvert;
import com.cyl.wms.domain.ReceiptOrderDetail;
import com.cyl.wms.pojo.vo.ReceiptOrderDetailVO;
import com.cyl.wms.pojo.vo.ShipmentOrderDetailVO;
import com.github.pagehelper.PageHelper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;
import com.cyl.wms.mapper.ShipmentOrderDetailMapper;
import com.cyl.wms.domain.ShipmentOrderDetail;
import com.cyl.wms.pojo.query.ShipmentOrderDetailQuery;

/**
 * 出库单详情Service业务层处理
 *
 *
 * @author zcc
 */
@Service
public class ShipmentOrderDetailService {
    @Autowired
    private ShipmentOrderDetailMapper shipmentOrderDetailMapper;
    @Autowired
    private ShipmentOrderDetailConvert convert;

    /**
     * 查询出库单详情
     *
     * @param id 出库单详情主键
     * @return 出库单详情
     */
    public ShipmentOrderDetail selectById(Long id) {
        return shipmentOrderDetailMapper.selectById(id);
    }

    /**
     * 查询出库单详情列表
     *
     * @param query 查询条件
     * @param page 分页条件
     * @return 出库单详情
     */
    public List<ShipmentOrderDetail> selectList(ShipmentOrderDetailQuery query, Pageable page) {
        if (page != null) {
            PageHelper.startPage(page.getPageNumber() + 1, page.getPageSize());
        }
        QueryWrapper<ShipmentOrderDetail> qw = new QueryWrapper<>();
        qw.eq("del_flag",0);
        Long shipmentOrderId = query.getShipmentOrderId();
        if (shipmentOrderId != null) {
            qw.eq("shipment_order_id", shipmentOrderId);
        }
        Long itemId = query.getItemId();
        if (itemId != null) {
            qw.eq("item_id", itemId);
        }
        BigDecimal planQuantity = query.getPlanQuantity();
        if (planQuantity != null) {
            qw.eq("plan_quantity", planQuantity);
        }
        BigDecimal realQuantity = query.getRealQuantity();
        if (realQuantity != null) {
            qw.eq("real_quantity", realQuantity);
        }
        Long rackId = query.getRackId();
        if (rackId != null) {
            qw.eq("rack_id", rackId);
        }
        return shipmentOrderDetailMapper.selectList(qw);
    }


    public List<ShipmentOrderDetailVO> toVos(List<ShipmentOrderDetail> items){
        List<ShipmentOrderDetailVO> list = convert.dos2vos(items);
        list.forEach(itemVO ->{
            List<Long> place = new LinkedList<>();
            if(itemVO.getWarehouseId()!=null){
                place.add(itemVO.getWarehouseId());
            }
            if(itemVO.getAreaId()!=null){
                place.add(itemVO.getAreaId());
            }
            if(itemVO.getRackId()!=null){
                place.add(itemVO.getRackId());
            }
            itemVO.setPlace(place);
        });
        return list;
    }

    /**
     * 新增出库单详情
     *
     * @param shipmentOrderDetail 出库单详情
     * @return 结果
     */
    public int insert(ShipmentOrderDetail shipmentOrderDetail) {
        shipmentOrderDetail.setDelFlag(0);
        shipmentOrderDetail.setCreateTime(LocalDateTime.now());
        return shipmentOrderDetailMapper.insert(shipmentOrderDetail);
    }

    /**
     * 修改出库单详情
     *
     * @param shipmentOrderDetail 出库单详情
     * @return 结果
     */
    public int update(ShipmentOrderDetail shipmentOrderDetail) {
        return shipmentOrderDetailMapper.updateById(shipmentOrderDetail);
    }

    /**
     * 批量删除出库单详情
     *
     * @param ids 需要删除的出库单详情主键
     * @return 结果
     */
    public int deleteByIds(Long[] ids) {
        return shipmentOrderDetailMapper.updateDelFlagByIds(ids);
    }

    /**
     * 删除出库单详情信息
     *
     * @param id 出库单详情主键
     * @return 结果
     */
    public int deleteById(Long id) {
        Long[] ids = {id};
        return shipmentOrderDetailMapper.updateDelFlagByIds(ids);
    }
}
