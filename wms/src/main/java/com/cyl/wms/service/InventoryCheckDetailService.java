package com.cyl.wms.service;

import java.math.BigDecimal;
import java.util.Arrays;
import java.util.LinkedList;
import java.util.List;
import java.time.LocalDateTime;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.cyl.wms.convert.InventoryCheckDetailConvert;
import com.cyl.wms.domain.InventoryHistory;
import com.cyl.wms.pojo.vo.InventoryCheckDetailVO;
import com.github.pagehelper.PageHelper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;
import com.cyl.wms.mapper.InventoryCheckDetailMapper;
import com.cyl.wms.domain.InventoryCheckDetail;
import com.cyl.wms.pojo.query.InventoryCheckDetailQuery;

/**
 * 库存盘点单据详情Service业务层处理
 *
 *
 * @author zcc
 */
@Service
public class InventoryCheckDetailService {
    @Autowired
    private InventoryCheckDetailMapper inventoryCheckDetailMapper;

    @Autowired
    private InventoryCheckDetailConvert convert;

    /**
     * 查询库存盘点单据详情
     *
     * @param id 库存盘点单据详情主键
     * @return 库存盘点单据详情
     */
    public InventoryCheckDetail selectById(Long id) {
        return inventoryCheckDetailMapper.selectById(id);
    }

    public List<InventoryCheckDetailVO> toVos(List<InventoryCheckDetail> items) {
        List<InventoryCheckDetailVO> list = convert.dos2vos(items);
        list.forEach(itemVO -> {
            List<Long> place = new LinkedList<>();
            if (itemVO.getWarehouseId() != null) {
                place.add(itemVO.getWarehouseId());
            }
            if (itemVO.getAreaId() != null) {
                place.add(itemVO.getAreaId());
            }
            if (itemVO.getRackId() != null) {
                place.add(itemVO.getRackId());
            }
            itemVO.setPlace(place);
        });
        return list;
    }

    /**
     * 查询库存盘点单据详情列表
     *
     * @param query 查询条件
     * @param page 分页条件
     * @return 库存盘点单据详情
     */
    public List<InventoryCheckDetail> selectList(InventoryCheckDetailQuery query, Pageable page) {
        if (page != null) {
            PageHelper.startPage(page.getPageNumber() + 1, page.getPageSize());
        }
        QueryWrapper<InventoryCheckDetail> qw = new QueryWrapper<>();
        qw.eq("del_flag",0);
        Long inventoryCheckId = query.getInventoryCheckId();
        if (inventoryCheckId != null) {
            qw.eq("inventory_check_id", inventoryCheckId);
        }
        Long itemId = query.getItemId();
        if (itemId != null) {
            qw.eq("item_id", itemId);
        }
        BigDecimal quantity = query.getQuantity();
        if (quantity != null) {
            qw.eq("quantity", quantity);
        }
        BigDecimal checkQuantity = query.getCheckQuantity();
        if (checkQuantity != null) {
            qw.eq("check_quantity", checkQuantity);
        }
        Long warehouseId = query.getWarehouseId();
        if (warehouseId != null) {
            qw.eq("warehouse_id", warehouseId);
        }
        Long areaId = query.getAreaId();
        if (areaId != null) {
            qw.eq("area_id", areaId);
        }
        Long rackId = query.getRackId();
        if (rackId != null) {
            qw.eq("rack_id", rackId);
        }
        return inventoryCheckDetailMapper.selectList(qw);
    }

    /**
     * 新增库存盘点单据详情
     *
     * @param inventoryCheckDetail 库存盘点单据详情
     * @return 结果
     */
    public int insert(InventoryCheckDetail inventoryCheckDetail) {
        inventoryCheckDetail.setDelFlag(0);
        inventoryCheckDetail.setCreateTime(LocalDateTime.now());
        return inventoryCheckDetailMapper.insert(inventoryCheckDetail);
    }

    /**
     * 修改库存盘点单据详情
     *
     * @param inventoryCheckDetail 库存盘点单据详情
     * @return 结果
     */
    public int update(InventoryCheckDetail inventoryCheckDetail) {
        return inventoryCheckDetailMapper.updateById(inventoryCheckDetail);
    }

    /**
     * 批量删除库存盘点单据详情
     *
     * @param ids 需要删除的库存盘点单据详情主键
     * @return 结果
     */
    public int deleteByIds(Long[] ids) {
        return inventoryCheckDetailMapper.updateDelFlagByIds(ids);
    }

    /**
     * 删除库存盘点单据详情信息
     *
     * @param id 库存盘点单据详情主键
     * @return 结果
     */
    public int deleteById(Long id) {
        Long[] ids = {id};
        return inventoryCheckDetailMapper.updateDelFlagByIds(ids);
    }

    public InventoryHistory vo2InventoryHistory(InventoryCheckDetailVO it) {
        return convert.vo2InventoryHistory(it);
    }
}
