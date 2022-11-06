package com.cyl.wms.service;

import java.math.BigDecimal;
import java.util.Arrays;
import java.util.LinkedList;
import java.util.List;
import java.time.LocalDateTime;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.cyl.wms.convert.InventoryMovementDetailConvert;
import com.cyl.wms.domain.ShipmentOrderDetail;
import com.cyl.wms.pojo.vo.InventoryMovementDetailVO;
import com.cyl.wms.pojo.vo.ShipmentOrderDetailVO;
import com.github.pagehelper.PageHelper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;
import com.cyl.wms.mapper.InventoryMovementDetailMapper;
import com.cyl.wms.domain.InventoryMovementDetail;
import com.cyl.wms.pojo.query.InventoryMovementDetailQuery;

/**
 * 库存移动详情Service业务层处理
 *
 *
 * @author zcc
 */
@Service
public class InventoryMovementDetailService {
    @Autowired
    private InventoryMovementDetailMapper inventoryMovementDetailMapper;
    @Autowired
    private InventoryMovementDetailConvert convert;

    /**
     * 查询库存移动详情
     *
     * @param id 库存移动详情主键
     * @return 库存移动详情
     */
    public InventoryMovementDetail selectById(Long id) {
        return inventoryMovementDetailMapper.selectById(id);
    }

    /**
     * 查询库存移动详情列表
     *
     * @param query 查询条件
     * @param page 分页条件
     * @return 库存移动详情
     */
    public List<InventoryMovementDetail> selectList(InventoryMovementDetailQuery query, Pageable page) {
        if (page != null) {
            PageHelper.startPage(page.getPageNumber() + 1, page.getPageSize());
        }
        QueryWrapper<InventoryMovementDetail> qw = new QueryWrapper<>();
        qw.eq("del_flag",0);
        Long inventoryMovementId = query.getInventoryMovementId();
        if (inventoryMovementId != null) {
            qw.eq("inventory_movement_id", inventoryMovementId);
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
        Long sourceRackId = query.getSourceRackId();
        if (sourceRackId != null) {
            qw.eq("source_rack_id", sourceRackId);
        }
        Long sourceWarehouseId = query.getSourceWarehouseId();
        if (sourceWarehouseId != null) {
            qw.eq("source_warehouse_id", sourceWarehouseId);
        }
        Long sourceAreaId = query.getSourceAreaId();
        if (sourceAreaId != null) {
            qw.eq("source_area_id", sourceAreaId);
        }
        Integer moveStatus = query.getMoveStatus();
        if (moveStatus != null) {
            qw.eq("move_status", moveStatus);
        }
        Long targetRackId = query.getTargetRackId();
        if (targetRackId != null) {
            qw.eq("target_rack_id", targetRackId);
        }
        Long targetWarehouseId = query.getTargetWarehouseId();
        if (targetWarehouseId != null) {
            qw.eq("target_warehouse_id", targetWarehouseId);
        }
        Long targetAreaId = query.getTargetAreaId();
        if (targetAreaId != null) {
            qw.eq("target_area_id", targetAreaId);
        }
        return inventoryMovementDetailMapper.selectList(qw);
    }

    public List<InventoryMovementDetailVO> toVos(List<InventoryMovementDetail> items){
        List<InventoryMovementDetailVO> list = convert.dos2vos(items);
        list.forEach(itemVO ->{
            List<Long> sourcePlace = new LinkedList<>();
            List<Long> targetPlace = new LinkedList<>();
            if(itemVO.getSourceWarehouseId()!=null){
                sourcePlace.add(itemVO.getSourceWarehouseId());
            }
            if(itemVO.getSourceAreaId()!=null){
                sourcePlace.add(itemVO.getSourceAreaId());
            }
            if(itemVO.getSourceRackId()!=null){
                sourcePlace.add(itemVO.getSourceRackId());
            }
            itemVO.setSourcePlace(sourcePlace);
            if(itemVO.getTargetWarehouseId()!=null){
                targetPlace.add(itemVO.getTargetWarehouseId());
            }
            if(itemVO.getTargetAreaId()!=null){
                targetPlace.add(itemVO.getTargetAreaId());
            }
            if(itemVO.getTargetRackId()!=null){
                targetPlace.add(itemVO.getTargetRackId());
            }
            itemVO.setTargetPlace(targetPlace);
        });
        return list;
    }

    /**
     * 新增库存移动详情
     *
     * @param inventoryMovementDetail 库存移动详情
     * @return 结果
     */
    public int insert(InventoryMovementDetail inventoryMovementDetail) {
        inventoryMovementDetail.setDelFlag(0);
        inventoryMovementDetail.setCreateTime(LocalDateTime.now());
        return inventoryMovementDetailMapper.insert(inventoryMovementDetail);
    }

    /**
     * 修改库存移动详情
     *
     * @param inventoryMovementDetail 库存移动详情
     * @return 结果
     */
    public int update(InventoryMovementDetail inventoryMovementDetail) {
        return inventoryMovementDetailMapper.updateById(inventoryMovementDetail);
    }

    /**
     * 批量删除库存移动详情
     *
     * @param ids 需要删除的库存移动详情主键
     * @return 结果
     */
    public int deleteByIds(Long[] ids) {
        return inventoryMovementDetailMapper.updateDelFlagByIds(ids);
    }

    /**
     * 删除库存移动详情信息
     *
     * @param id 库存移动详情主键
     * @return 结果
     */
    public int deleteById(Long id) {
        Long[] ids = {id};
        return inventoryMovementDetailMapper.updateDelFlagByIds(ids);
    }
}
