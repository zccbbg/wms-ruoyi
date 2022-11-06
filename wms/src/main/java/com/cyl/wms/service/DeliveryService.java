package com.cyl.wms.service;

import java.time.LocalDateTime;
import java.util.Arrays;
import java.util.List;
import java.time.LocalDateTime;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.github.pagehelper.PageHelper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;
import com.cyl.wms.mapper.DeliveryMapper;
import com.cyl.wms.domain.Delivery;
import com.cyl.wms.pojo.query.DeliveryQuery;

/**
 * 发货记录Service业务层处理
 *
 *
 * @author zcc
 */
@Service
public class DeliveryService {
    @Autowired
    private DeliveryMapper deliveryMapper;

    /**
     * 查询发货记录
     *
     * @param id 发货记录主键
     * @return 发货记录
     */
    public Delivery selectById(Long id) {
        return deliveryMapper.selectById(id);
    }

    /**
     * 查询发货记录列表
     *
     * @param query 查询条件
     * @param page 分页条件
     * @return 发货记录
     */
    public List<Delivery> selectList(DeliveryQuery query, Pageable page) {
        if (page != null) {
            PageHelper.startPage(page.getPageNumber() + 1, page.getPageSize());
        }
        QueryWrapper<Delivery> qw = new QueryWrapper<>();
        qw.eq("del_flag",0);
        Long shipmentOrderId = query.getShipmentOrderId();
        if (shipmentOrderId != null) {
            qw.eq("shipment_order_id", shipmentOrderId);
        }
        Long carrierId = query.getCarrierId();
        if (carrierId != null) {
            qw.eq("carrier_id", carrierId);
        }
        LocalDateTime deliveryDate = query.getDeliveryDate();
        if (deliveryDate != null) {
            qw.eq("delivery_date", deliveryDate);
        }
        String trackingNo = query.getTrackingNo();
        if (!StringUtils.isEmpty(trackingNo)) {
            qw.eq("tracking_no", trackingNo);
        }
        return deliveryMapper.selectList(qw);
    }

    /**
     * 新增发货记录
     *
     * @param delivery 发货记录
     * @return 结果
     */
    public int insert(Delivery delivery) {
        delivery.setDelFlag(0);
        delivery.setCreateTime(LocalDateTime.now());
        return deliveryMapper.insert(delivery);
    }

    /**
     * 修改发货记录
     *
     * @param delivery 发货记录
     * @return 结果
     */
    public int update(Delivery delivery) {
        return deliveryMapper.updateById(delivery);
    }

    /**
     * 批量删除发货记录
     *
     * @param ids 需要删除的发货记录主键
     * @return 结果
     */
    public int deleteByIds(Long[] ids) {
        return deliveryMapper.updateDelFlagByIds(ids);
    }

    /**
     * 删除发货记录信息
     *
     * @param id 发货记录主键
     * @return 结果
     */
    public int deleteById(Long id) {
        Long[] ids = {id};
        return deliveryMapper.updateDelFlagByIds(ids);
    }
}
