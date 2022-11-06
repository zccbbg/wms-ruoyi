package com.cyl.wms.service;

import cn.hutool.core.collection.CollUtil;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.cyl.wms.convert.InventoryConvert;
import com.cyl.wms.domain.*;
import com.cyl.wms.mapper.InventoryMapper;
import com.cyl.wms.pojo.query.InventoryQuery;
import com.cyl.wms.pojo.vo.AreaAndItemInfo;
import com.cyl.wms.pojo.vo.InventoryVO;
import com.cyl.wms.pojo.vo.PlaceAndItem;
import com.github.pagehelper.PageHelper;
import com.ruoyi.common.constant.CommonConstant;
import com.ruoyi.common.utils.SecurityUtils;
import com.ruoyi.common.utils.SortUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Example;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.util.*;
import java.util.function.Function;
import java.util.stream.Collectors;

/**
 * 库存Service业务层处理
 *
 * @author zcc
 */
@Service
public class InventoryService {
    @Autowired
    private InventoryMapper inventoryMapper;
    @Autowired
    private InventoryConvert inventoryConvert;
    @Autowired
    private WarehouseService warehouseService;
    @Autowired
    private AreaService areaService;
    @Autowired
    private RackService rackService;
    @Autowired
    private ItemService itemService;

    /**
     * 查询库存
     *
     * @param id 库存主键
     * @return 库存
     */
    public Inventory selectById(Long id) {
        return inventoryMapper.selectById(id);
    }

    /**
     * 查询库存列表
     *
     * @param query 查询条件
     * @param page  分页条件
     * @return 库存
     */
    public List<Inventory> selectList(InventoryQuery query, Pageable page) {
        if (page != null) {
            PageHelper.startPage(page.getPageNumber() + 1, page.getPageSize(), SortUtil.sort2stringOrDefault(page.getSort()));
        }
        QueryWrapper<Inventory> qw = new QueryWrapper<>();
        qw.eq("del_flag" , 0);
        Long itemId = query.getItemId();
        if (itemId != null) {
            qw.eq("item_id" , itemId);
        }
        Long rackId = query.getRackId();
        if (rackId != null) {
            qw.eq("rack_id" , rackId);
        }
        if (query.getWarehouseId() != null) {
            qw.eq("warehouse_id" , query.getWarehouseId());
        }
        if (query.getAreaId() != null) {
            qw.eq("area_id" , query.getAreaId());
        }
        if (query.getQuantityStart() != null) {
            qw.ge("quantity" , query.getQuantityStart());
        }
        if (query.getQuantityEnd() != null) {
            qw.le("quantity" , query.getQuantityEnd());
        }
        return inventoryMapper.selectList(qw);
    }

    /**
     * 新增库存
     *
     * @param inventory 库存
     * @return 结果
     */
    public int insert(Inventory inventory) {
        inventory.setDelFlag(0);
        inventory.setCreateTime(LocalDateTime.now());
        if (inventory.getWarehouseId() == null) {
            inventory.setWarehouseId(-1L);
        }
        if (inventory.getAreaId() == null) {
            inventory.setAreaId(-1L);
        }
        if (inventory.getRackId() == null) {
            inventory.setRackId(-1L);
        }
        return inventoryMapper.insert(inventory);
    }

    /**
     * 修改库存
     *
     * @param inventory 库存
     * @return 结果
     */
    public int update(Inventory inventory) {
        return inventoryMapper.updateById(inventory);
    }

    /**
     * 批量删除库存
     *
     * @param ids 需要删除的库存主键
     * @return 结果
     */
    public int deleteByIds(Long[] ids) {
        return inventoryMapper.updateDelFlagByIds(ids);
    }

    /**
     * 删除库存信息
     *
     * @param id 库存主键
     * @return 结果
     */
    public int deleteById(Long id) {
        Long[] ids = {id};
        return inventoryMapper.updateDelFlagByIds(ids);
    }

    public boolean canOutStock(Long itemId, Long warehouseId, Long areaId, Long rackId, BigDecimal quantity) {
        QueryWrapper<Inventory> qw = new QueryWrapper<>();
        qw.eq("item_id" , itemId)
                .eq("warehouse_id" , warehouseId)
                .ge("quantity" , quantity);
        if (rackId != null) {
            qw.eq("rack_id" , rackId);
        }
        if (areaId != null) {
            qw.eq("area_id" , areaId);
        }
        return inventoryMapper.selectCount(qw) > 0;
    }

    public int batchUpdate1(List<InventoryHistory> list) {
        if (CollUtil.isEmpty(list)) {
            return 0;
        }
        LocalDateTime now = LocalDateTime.now();
        Long userId = SecurityUtils.getUserId();
        // 对插入的数据进行分组
        List<InventoryHistory> racks = new ArrayList<>();
        List<InventoryHistory> areas = new ArrayList<>();
        List<InventoryHistory> warehouses = new ArrayList<>();
        list.forEach(it -> {
            if (it.getRackId() != null) {
                racks.add(it);
                return;
            }
            if (it.getAreaId() != null) {
                areas.add(it);
                return;
            }
            warehouses.add(it);
        });
        int res = 0;
        if (warehouses.size() > 0) {
            res += saveData(warehouses, now, userId,
                    it -> it.getWarehouseId() + "_" + it.getItemId(),
                    inventoryMapper::selectAllByWarehouseAndItemId
            );
        }
        if (areas.size() > 0) {
            res += saveData(areas, now, userId,
                    it -> it.getWarehouseId() + "_" + it.getAreaId() + "_" + it.getItemId(),
                    inventoryMapper::selectAllByAreaAndItemId
            );
        }
        if (racks.size() > 0) {
            res += saveData(racks, now, userId,
                    it -> it.getWarehouseId() + "_" + it.getAreaId() + "_" + it.getRackId() + "_" + it.getItemId(),
                    inventoryMapper::selectAllByRackAndItemId
            );
        }
        return res;
    }

    private int saveData(List<InventoryHistory> list, LocalDateTime now, Long userId,
                         Function<PlaceAndItem, String> keyFunc,
                         Function<List<InventoryHistory>, List<Inventory>> listFunc) {
        List<Inventory> exists = listFunc.apply(list);
        Map<String, Long> existKeys = exists.stream().collect(Collectors.toMap(keyFunc, Inventory::getId));
        List<Inventory> updates = new ArrayList<>();
        List<Inventory> adds1 = new ArrayList<>();
        list.forEach(it -> {
            String key = keyFunc.apply(it);
            Inventory v;
            if (existKeys.containsKey(key)) {
                v = new Inventory();
                v.setId(existKeys.get(key));
                v.setQuantity(it.getQuantity());
                updates.add(v);
                return;
            }
            v = inventoryConvert.inventoryHistory2invertory(it);
            v.setCreateTime(now);
            v.setCreateBy(userId);
            adds1.add(v);
        });
        int re1 = batchUpdateQuantity(updates, now, userId);
        int re2 = batchInsert(adds1);
        return re1 + re2;
    }

    public int batchUpdateQuantity(List<Inventory> updates, LocalDateTime updateTime, Long userId) {
        if (CollUtil.isEmpty(updates)) {
            return 0;
        }
        int re = 0;
        for (int s = 0; s < updates.size(); s += CommonConstant.BATCH_SIZE) {
            re += inventoryMapper.batchUpdateQuantityById(
                    updates.subList(s, Math.min(s + CommonConstant.BATCH_SIZE, updates.size())),
                    updateTime,
                    userId
            );
        }
        return re;
    }

    public int batchInsert(List<Inventory> list) {
        if (CollUtil.isEmpty(list)) {
            return 0;
        }
        int re = 0;
        for (int s = 0; s < list.size(); s += CommonConstant.BATCH_SIZE) {
            re += inventoryMapper.batchInsert(list.subList(s, Math.min(s + CommonConstant.BATCH_SIZE, list.size())));
        }
        return re;
    }

    public Page<InventoryVO> queryPage(InventoryQuery query, Pageable page) {
        List<Inventory> list = selectList(query, page);
        List<InventoryVO> res = inventoryConvert.dos2vos(list);
        injectAreaAndItemInfo(res);
        return new PageImpl<>(res, page, ((com.github.pagehelper.Page) list).getTotal());
    }

    public void injectAreaAndItemInfo(List<? extends AreaAndItemInfo> res) {
        if (CollUtil.isEmpty(res)) {
            return;
        }
        // 注入 仓库，货区，货架 id
        Set<Long> warehouseIds = new HashSet<>();
        Set<Long> areaIds = new HashSet<>();
        Set<Long> rackIds = new HashSet<>();
        Set<Long> itemIds = new HashSet<>();
        res.forEach(it -> {
            if (it.getWarehouseId() != null) {
                warehouseIds.add(it.getWarehouseId());
            }
            if (it.getAreaId() != null) {
                areaIds.add(it.getAreaId());
            }
            if (it.getRackId() != null) {
                rackIds.add(it.getRackId());
            }
            if (it.getItemId() != null) {
                itemIds.add(it.getItemId());
            }
        });
        Map<Long, Warehouse> warehouses = warehouseService.selectByIdIn(warehouseIds)
                .stream().collect(Collectors.toMap(Warehouse::getId, it -> it));
        Map<Long, Area> areas = areaService.selectByIdIn(areaIds)
                .stream().collect(Collectors.toMap(Area::getId, it -> it));
        Map<Long, Rack> racks = rackService.selectByIdIn(rackIds)
                .stream().collect(Collectors.toMap(Rack::getId, it -> it));
        Map<Long, Item> items = itemService.selectByIdIn(itemIds)
                .stream().collect(Collectors.toMap(Item::getId, it -> it));

        res.forEach(it -> {
            if (it.getWarehouseId() != null && warehouses.containsKey(it.getWarehouseId())) {
                it.setWarehouseName(warehouses.get(it.getWarehouseId()).getWarehouseName());
            }
            if (it.getAreaId() != null && areas.containsKey(it.getAreaId())) {
                it.setAreaName(areas.get(it.getAreaId()).getAreaName());
            }
            if (it.getRackId() != null && racks.containsKey(it.getRackId())) {
                it.setRackName(racks.get(it.getRackId()).getRackName());
            }
            if (it.getItemId() != null && items.containsKey(it.getItemId())) {
                Item item = items.get(it.getItemId());
                it.setItemName(item.getItemName());
                it.setItemNo(item.getItemNo());
            }
        });
    }
}
