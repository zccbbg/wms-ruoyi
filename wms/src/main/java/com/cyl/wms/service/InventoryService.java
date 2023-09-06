package com.cyl.wms.service;

import cn.hutool.core.collection.CollUtil;
import cn.hutool.core.util.StrUtil;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.cyl.wms.convert.InventoryConvert;
import com.cyl.wms.domain.*;
import com.cyl.wms.mapper.InventoryMapper;
import com.cyl.wms.pojo.query.InventoryQuery;
import com.cyl.wms.pojo.vo.AreaAndItemInfo;
import com.cyl.wms.pojo.vo.InventoryHistoryVO;
import com.cyl.wms.pojo.vo.InventoryVO;
import com.cyl.wms.pojo.vo.PlaceAndItem;
import com.github.pagehelper.PageHelper;
import com.ruoyi.common.constant.CommonConstant;
import com.ruoyi.common.constant.HttpStatus;
import com.ruoyi.common.core.domain.entity.SysDictData;
import com.ruoyi.common.exception.ServiceException;
import com.ruoyi.common.exception.WmsServiceException;
import com.ruoyi.common.utils.SecurityUtils;
import com.ruoyi.common.utils.SortUtil;
import com.ruoyi.system.service.ISysDictDataService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

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
@Slf4j
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
    @Autowired
    private ItemTypeService itemTypeService;
    @Autowired
    private ISysDictDataService sysDictDataService;

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
            PageHelper.startPage(page.getPageNumber() + 1, page.getPageSize());
        }
        QueryWrapper<Inventory> qw = new QueryWrapper<>();
        Long itemId = query.getItemId();
        if (itemId != null) {
            qw.eq("item_id", itemId);
        }
        Long rackId = query.getRackId();
        if (rackId != null) {
            qw.eq("rack_id", rackId);
        }
        if (query.getWarehouseId() != null) {
            qw.eq("warehouse_id", query.getWarehouseId());
        }
        if (query.getAreaId() != null) {
            qw.eq("area_id", query.getAreaId());
        }
        if (query.getQuantityStart() != null) {
            qw.ge("quantity", query.getQuantityStart());
        }
        if (query.getQuantityEnd() != null) {
            qw.le("quantity", query.getQuantityEnd());
        }
        return getInventoryList(query.getPanelType(), qw);
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

    public List<Inventory> getInventoryList(Long panelType, QueryWrapper<Inventory> qw) {
        List<Inventory> items;
        if (Objects.equals(panelType, InventoryQuery.WAREHOUSE)) {
            qw.eq("del_flag", 0);
            items = inventoryMapper.selectListGroupByWarehouseId(qw);
        } else if (Objects.equals(panelType, InventoryQuery.AREA)) {
            qw.eq("del_flag", 0);
            items = inventoryMapper.selectListGroupByAreaId(qw);
        } else if (Objects.equals(panelType, InventoryQuery.ITEMTYPE)) {
            qw.eq("wi.del_flag", 0);
            items = inventoryMapper.selectListGroupByItemTypeId(qw);
        } else {
            // 物料
            qw.eq("del_flag", 0);
            qw.orderBy(true, false, "item_id");
            items = inventoryMapper.selectList(qw);
        }
        if (CollUtil.isEmpty(items)) {
            return items;
        }
        return items;
    }

    private void injectItemType(List<InventoryVO> items) {
        if (CollUtil.isEmpty(items)) {
            return;
        }
        Set<Long> itemIds = items.stream().map(InventoryVO::getItemId).collect(Collectors.toSet());
        Map<Long, Long> itemIdAndTypeId = itemService.selectByIdIn(itemIds).stream().filter(item -> StrUtil.isNotBlank(item.getItemType())).collect(Collectors.toMap(Item::getId, it -> Long.parseLong(it.getItemType())));
        Map<Long, ItemType> itemTypeMap = itemTypeService.selectByIdIn(itemIdAndTypeId.values()).stream().collect(Collectors.toMap(ItemType::getItemTypeId, it -> it));
        items.forEach(it -> {
            Long type_key = itemIdAndTypeId.get(it.getItemId());
            if (it.getItemId() != null && itemTypeMap.containsKey(type_key)) {
                it.setItemTypeName(itemTypeMap.get(type_key).getTypeName());
            }
        });
    }

    public boolean canOutStock(Long itemId, Long warehouseId, Long areaId, Long rackId, BigDecimal quantity) {
        QueryWrapper<Inventory> qw = new QueryWrapper<>();
        qw.eq("item_id", itemId)
                .eq("warehouse_id", warehouseId)
                .ge("quantity", quantity);
        if (rackId != null) {
            qw.eq("rack_id", rackId);
        }
        if (areaId != null) {
            qw.eq("area_id", areaId);
        }
        return inventoryMapper.selectCount(qw) > 0;
    }

    /*
     * 根据物料id查询库存
     * */
    public Inventory queryInventoryByItemId(Long itemId, Long warehouseId, Long areaId, Long rackId) {
        QueryWrapper<Inventory> qw = new QueryWrapper<>();
        qw.eq("item_id", itemId).eq("warehouse_id", warehouseId);
        if (rackId != null) {
            qw.eq("rack_id", rackId);
        }
        if (areaId != null) {
            qw.eq("area_id", areaId);
        }
        return inventoryMapper.selectOne(qw);
    }

    /*
     * 判断库存是否足够出库
     * */
    public void checkInventory(Long itemId, Long warehouseId, Long areaId, Long rackId, BigDecimal added) {
        HashMap<String, Object> map = new HashMap<>();
        map.put("itemId", itemId);
        Inventory inventory = this.queryInventoryByItemId(itemId, warehouseId, areaId, rackId);
        if (inventory == null) {
            Item item = itemService.selectById(itemId);
            String msg = "商品：" + item.getItemName() + "(" + item.getItemNo() + ")" + ",<span style='color:red'>库存不存在</span> 无法出库</br>";
            throw new WmsServiceException(msg, HttpStatus.INVENTORY_SHORTAGE, map);
        } else if (inventory.getQuantity().compareTo(added) < 0) {
            Item item = itemService.selectById(itemId);
            String msg = "商品：[<span style='color:red'>" + item.getItemName() + "</span>] 库存不足，无法出库" +
                    "</br>计划数量：<span >" + added + "</span>";
            throw new WmsServiceException(msg, HttpStatus.INVENTORY_SHORTAGE, map);
        }
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
        //将updates按照id分组
        Map<Long, List<Inventory>> collect = updates.stream().collect(Collectors.groupingBy(it -> it.getId()));
        List<Inventory> saveList = new ArrayList<>();
        collect.forEach((k, v) -> {
            Inventory inventory = new Inventory();
            BeanUtils.copyProperties(v.get(0), inventory);
            BigDecimal amount = BigDecimal.ZERO;
            for (Inventory it : v) {
                amount = amount.add(it.getQuantity());
            }
            inventory.setQuantity(amount);
            saveList.add(inventory);
        });
        if (CollUtil.isEmpty(saveList)) {
            return 0;
        }
        int re = 0;
        for (int s = 0; s < saveList.size(); s += CommonConstant.BATCH_SIZE) {
            re += inventoryMapper.batchUpdateQuantityById(
                    saveList.subList(s, Math.min(s + CommonConstant.BATCH_SIZE, saveList.size())),
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
        injectItemType(res);
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
                Warehouse warehouse = warehouses.get(it.getWarehouseId());
                it.setWarehouseName(warehouse.getWarehouseName());
                it.setWarehouseDelFlag(warehouse.getDelFlag());
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
                it.setItemDelFlag(item.getDelFlag());
            }
        });
    }

    public Page<InventoryVO> queryWarning(Pageable page) {
        if (page != null) {
            PageHelper.startPage(page.getPageNumber() + 1, page.getPageSize(), SortUtil.sort2string(page.getSort()));
        }
        List<Inventory> inventories = inventoryMapper.selectWarning();
        List<InventoryVO> res = inventoryConvert.dos2vos(inventories);
        injectAreaAndItemInfo(res);
        List<Item> allItems = itemService.getAllSaftyItems();
        Map<Long, BigDecimal> saftyItems = allItems.stream().collect(Collectors.toMap(Item::getId, item -> item.getQuantity()));
        res.forEach(item -> {
            BigDecimal saftyQuantify = saftyItems.get(item.getItemId());
            item.setSaftyQuantity(saftyQuantify);
        });
        return new PageImpl<>(res, page, ((com.github.pagehelper.Page) inventories).getTotal());
    }

    public List<InventoryVO> queryAll(InventoryQuery query) {

        List<Inventory> list = selectList(query, null);
        List<InventoryVO> res = inventoryConvert.dos2vos(list);
        injectAreaAndItemInfo(res);
        return res;
    }

    /**
     * 查询所有有效的物料
     */
    public List<InventoryVO> queryValidAll() {
        List<Inventory> list = inventoryMapper.selectValidAll();
        List<InventoryVO> res = inventoryConvert.dos2vos(list);
        injectAreaAndItemInfo(res);
        return res;
    }

    /**
     * 注入物料编码和名称
     *
     * @param res 物料
     */
    public void injectItemNoAndItemName(List<Inventory> res) {
        if (CollUtil.isEmpty(res)) {
            return;
        }
        Set<Long> items = res.stream().map(Inventory::getItemId).collect(Collectors.toSet());
        Map<Long, Item> itemMap = itemService.selectByIdIn(items).stream().collect(Collectors.toMap(Item::getId, it -> it));
        res.forEach(it -> {
            if (it.getItemId() != null && itemMap.containsKey(it.getItemId())) {
                it.setItemNo(itemMap.get(it.getItemId()).getItemNo());
                it.setItemName(itemMap.get(it.getItemId()).getItemName());
            }
        });
    }

    /**
     * 注入仓库名称
     *
     * @param res 物料
     */
    public void injectWarehouseName(List<Inventory> res) {
        if (CollUtil.isEmpty(res)) {
            return;
        }
        Set<Long> warehouses = res.stream().map(Inventory::getWarehouseId).collect(Collectors.toSet());
        Map<Long, Warehouse> warehouseMap = warehouseService.selectByIdIn(warehouses).stream().collect(Collectors.toMap(Warehouse::getId, it -> it));
        res.forEach(it -> {
            if (it.getWarehouseId() != null && warehouseMap.containsKey(it.getWarehouseId())) {
                it.setWarehouseName(warehouseMap.get(it.getWarehouseId()).getWarehouseName());
            }
        });
    }

    /**
     * 注入库区名称
     *
     * @param res 物料
     */
    public void injectAreaName(List<Inventory> res) {
        if (CollUtil.isEmpty(res)) {
            return;
        }
        Set<Long> areas = res.stream().map(Inventory::getAreaId).collect(Collectors.toSet());
        Map<Long, Area> areaMap = areaService.selectByIdIn(areas).stream().collect(Collectors.toMap(Area::getId, it -> it));
        res.forEach(it -> {
            if (it.getAreaId() != null && areaMap.containsKey(it.getAreaId())) {
                it.setAreaName(areaMap.get(it.getAreaId()).getAreaName());
            }
        });
    }

    public void injectDictDataLabel(List<InventoryHistoryVO> res) {
        if (CollUtil.isEmpty(res)) {
            return;
        }
        Set<String> dictTypes = new HashSet<>();
        dictTypes.add("wms_inventory_oper_type");
        Map<String, SysDictData> sysDictDataMap = sysDictDataService.selectDictDataByTypes(dictTypes).stream().collect(Collectors.toMap(SysDictData::getDictValue, it -> it));
        res.forEach(it -> {
            if (it.getFormType() != null && sysDictDataMap.containsKey(String.valueOf(it.getFormType()))) {
                it.setFormTypeName(sysDictDataMap.get(String.valueOf(it.getFormType())).getDictLabel());
            }
        });
    }

    /**
     * 逻辑删除 库存记录
     *
     * @param itemIds 物料ids
     */
    public Integer deleteByItemIds(Long[] itemIds) {
        LambdaQueryWrapper<Inventory> inventoryLambdaQueryWrapper = new LambdaQueryWrapper<>();
        inventoryLambdaQueryWrapper.select(Inventory::getId);
        inventoryLambdaQueryWrapper.in(Inventory::getItemId, Arrays.asList(itemIds));
        // 物料对应的库存记录id
        List<Long> ids = inventoryMapper.selectList(inventoryLambdaQueryWrapper)
                .stream().map(Inventory::getId).collect(Collectors.toList());
        if (CollUtil.isEmpty(ids)) {
            return 0;
        }
        Long[] idArr = ids.toArray(new Long[0]);
        return inventoryMapper.updateDelFlagByIds(idArr);
    }

    /**
     * 逻辑删除 库存记录
     *
     * @param warehouseIds 仓库ids
     */
    @Transactional
    public Integer deleteByWarehouseIds(Long[] warehouseIds) {
        LambdaQueryWrapper<Inventory> inventoryLambdaQueryWrapper = new LambdaQueryWrapper<>();
        inventoryLambdaQueryWrapper.select(Inventory::getId);
        inventoryLambdaQueryWrapper.in(Inventory::getWarehouseId, Arrays.asList(warehouseIds));
        // 仓库对应的库存记录id
        List<Long> ids = inventoryMapper.selectList(inventoryLambdaQueryWrapper)
                .stream().map(Inventory::getId).collect(Collectors.toList());
        if (CollUtil.isEmpty(ids)) {
            return 0;
        }
        Long[] idArr = ids.toArray(new Long[0]);
        return inventoryMapper.updateDelFlagByIds(idArr);
    }

    /*
     * 根据库存分配规则分配库存
     * @param itemId 物料id
     * @param planQuantity 计划数量
     * */
    public List<ShipmentOrderDetail> allocatedInventory(Long itemId, BigDecimal planQuantity, Integer type) {
        List<Inventory> inventoryList = new ArrayList<>();
        if (type == 1) {
            //  默认使用仓库库存数量最小优先原则
            inventoryList = inventoryMapper.selectLastInventory(itemId, "asc");
        } else if (type == 2) {
            //使用仓库库存数量最大优先原则
            inventoryList = inventoryMapper.selectLastInventory(itemId, "desc");
        }

        if (CollUtil.isEmpty(inventoryList)) {
            log.error("库存不足,itemId:{},计划数量：{}", itemId, planQuantity);
            throw new ServiceException("库存不足", HttpStatus.CONFIRMATION);
        }
        // 拆分物料明细
        List<ShipmentOrderDetail> shipmentOrderDetailList = new ArrayList<>();
        for (Inventory inventory : inventoryList) {
            ShipmentOrderDetail shipmentOrderDetail = new ShipmentOrderDetail();
            BigDecimal allocatedQuantity;
            if (inventory.getQuantity().compareTo(planQuantity) > 0) {
                allocatedQuantity = planQuantity;
            } else {
                allocatedQuantity = inventory.getQuantity();
            }
            shipmentOrderDetail.setPlanQuantity(allocatedQuantity);
            shipmentOrderDetail.setRealQuantity(allocatedQuantity);
            shipmentOrderDetail.setWarehouseId(inventory.getWarehouseId());
            shipmentOrderDetail.setAreaId(inventory.getAreaId());
            shipmentOrderDetail.setRackId(inventory.getRackId());
            shipmentOrderDetail.setItemId(itemId);
            shipmentOrderDetailList.add(shipmentOrderDetail);
            planQuantity = planQuantity.subtract(inventory.getQuantity());
            if (planQuantity.compareTo(BigDecimal.ZERO) <= 0) {
                break;
            }
        }
        // 库存不足
        if (planQuantity.compareTo(BigDecimal.ZERO) > 0) {
            throw new ServiceException("库存不足", HttpStatus.CONFIRMATION);
        }
        return shipmentOrderDetailList;
    }

    public Inventory allocatedInventoryForReceipt(Long itemId, BigDecimal planQuantity, Integer type) {
        List<Inventory> inventoryList = new ArrayList<>();
        if (type == 1) {
            //  默认使用仓库库存数量最小优先原则
            inventoryList = inventoryMapper.selectLastInventoryForReceipt(itemId, "asc");
        } else if (type == 2) {
            //使用仓库库存数量最大优先原则
            inventoryList = inventoryMapper.selectLastInventoryForReceipt(itemId, "desc");
        }

        if (CollUtil.isEmpty(inventoryList)) {
            throw new ServiceException("没有仓库", HttpStatus.CONFIRMATION);
        }
        return inventoryList.get(0);
    }
}
