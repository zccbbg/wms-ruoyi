package com.cyl.wms.service;

import cn.hutool.core.collection.CollUtil;
import cn.hutool.core.util.StrUtil;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.cyl.wms.convert.ItemConvert;
import com.cyl.wms.domain.Area;
import com.cyl.wms.domain.Item;
import com.cyl.wms.domain.ItemType;
import com.cyl.wms.domain.Warehouse;
import com.cyl.wms.mapper.ItemMapper;
import com.cyl.wms.pojo.query.ItemQuery;
import com.cyl.wms.pojo.vo.ItemVO;
import com.github.pagehelper.PageHelper;
import com.ruoyi.common.utils.SecurityUtils;
import com.ruoyi.common.utils.SortUtil;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.util.*;
import java.util.stream.Collectors;

/**
 * 物料Service业务层处理
 *
 * @author zcc
 */
@Service
public class ItemService {
    @Autowired
    private ItemMapper itemMapper;
    @Autowired
    private ItemConvert convert;

    @Autowired
    private ItemTypeService itemTypeService;
    @Autowired
    private WarehouseService warehouseService;
    @Autowired
    private AreaService areaService;

    public List<ItemVO> toVos(List<Item> items) {
        List<ItemVO> list = convert.dos2vos(items);
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

    public ItemVO toVo(Item item) {
        ItemVO itemVO = convert.toVo(item);

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
        return itemVO;
    }

    /**
     * 查询物料
     *
     * @param id 物料主键
     * @return 物料
     */
    public Item selectById(Long id) {
        return itemMapper.selectById(id);
    }

    /**
     * 查询物料列表
     *
     * @param query 查询条件
     * @param page  分页条件
     * @return 物料
     */
    public List<Item> selectList(ItemQuery query, Pageable page) {
        if (page != null) {
            PageHelper.startPage(page.getPageNumber() + 1, page.getPageSize());
        }
        QueryWrapper<Item> qw = new QueryWrapper<>();
        qw.orderByDesc("id");
        if (!StrUtil.isEmpty(query.getSearch())) {
            String search = query.getSearch();
            qw.eq("create_by", SecurityUtils.getUserId());
            qw.and((qw1) -> {
                qw1 = qw1.like("item_no", search)
                        .or()
                        .like("item_name", search);
                if (search.matches("^\\d+$")) {
                    qw1.eq("id", Long.valueOf(search));
                }
            });
            return itemMapper.selectList(qw);
        }
        if (!CollUtil.isEmpty(query.getIds())) {
            qw.in("id", query.getIds());
        }
        qw.eq("del_flag", 0);
        String itemNo = query.getItemNo();
        if (!StringUtils.isEmpty(itemNo)) {
            qw.eq("item_no", itemNo);
        }
        String itemNameLike = query.getItemNameLike();
        if (!StringUtils.isEmpty(itemNameLike)) {
            qw.like("item_name", itemNameLike);
        }
        String itemType = query.getItemType();
        if (!StringUtils.isEmpty(itemType)) {
            qw.eq("item_type", itemType);
        }
        String unit = query.getUnit();
        if (!StringUtils.isEmpty(unit)) {
            qw.eq("unit", unit);
        }
        Long rackId = query.getRackId();
        if (rackId != null) {
            qw.eq("rack_id", rackId);
        }
        Long areaId = query.getAreaId();
        if (areaId != null) {
            qw.eq("area_id", areaId);
        }
        Long warehouseId = query.getWarehouseId();
        if (warehouseId != null) {
            qw.eq("warehouse_id", warehouseId);
        }
        BigDecimal quantity = query.getQuantity();
        if (quantity != null) {
            qw.eq("quantity", quantity);
        }
        LocalDateTime expiryDate = query.getExpiryDate();
        if (expiryDate != null) {
            qw.eq("expiry_date", expiryDate);
        }
        return getItemList(qw);
    }

    /**
     * 新增物料
     *
     * @param item 物料
     * @return 结果
     */
    public int insert(Item item) {
        item.setDelFlag(0);
        item.setCreateTime(LocalDateTime.now());
        return itemMapper.insert(item);
    }

    /**
     * 修改物料
     *
     * @param item 物料
     * @return 结果
     */
    public int update(Item item) {
        return itemMapper.updateById(item);
    }

    /**
     * 批量删除物料
     *
     * @param ids 需要删除的物料主键
     * @return 结果
     */
    public int deleteByIds(Long[] ids) {
        return itemMapper.updateDelFlagByIds(ids);
    }

    /**
     * 删除物料信息
     *
     * @param id 物料主键
     * @return 结果
     */
    public int deleteById(Long id) {
        Long[] ids = {id};
        return itemMapper.updateDelFlagByIds(ids);
    }

    public List<Item> selectByIdIn(Collection<Long> ids) {
        QueryWrapper<Item> qw = new QueryWrapper<>();
        qw.in("id", ids);
        return itemMapper.selectList(qw);
    }

    public List<Item> getAllSaftyItems(){
        QueryWrapper<Item> qw = new QueryWrapper<>();
        qw.eq("del_flag", 0);
        qw.isNotNull("quantity");
        return this.getItemList(qw);
    }
    private List<Item> getItemList(QueryWrapper<Item> qw) {
        List<Item> items = itemMapper.selectList(qw);
        injectTypeName(items);
        injectWarehouseName(items);
        injectAreaName(items);
        return items;
    }

    /**
     * 注入物料类别名称
     *
     * @param res 物料
     */
    public void injectTypeName(List<Item> res) {
        if (CollUtil.isEmpty(res)) {
            return;
        }
        Set<Long> types = res.stream().map(Item::getItemType).filter(Objects::nonNull).map(Long::valueOf).collect(Collectors.toSet());
        Map<Long, ItemType> itemTypes = itemTypeService.selectByIdIn(types).stream().collect(Collectors.toMap(ItemType::getItemTypeId, it -> it));
        res.forEach(it -> {
            Long typeId;
            try {
                typeId = Long.parseLong(it.getItemType());
            } catch (NumberFormatException e) {
                return;
            }
            if (it.getItemName() != null && itemTypes.containsKey(typeId)) {
                it.setItemTypeName(itemTypes.get(typeId).getTypeName());
            }
        });
    }

    /**
     * 注入仓库名称
     * @param res 物料
     */
    public void injectWarehouseName(List<Item> res){
        if (CollUtil.isEmpty(res)){
            return;
        }
        Set<Long> warehouses = res.stream().map(Item::getWarehouseId).collect(Collectors.toSet());
        Map<Long, Warehouse> warehouseMap = warehouseService.selectByIdIn(warehouses).stream().collect(Collectors.toMap(Warehouse::getId, it -> it));
        res.forEach(it -> {
            if (it.getWarehouseId() != null && warehouseMap.containsKey(it.getWarehouseId())){
                it.setWarehouseName(warehouseMap.get(it.getWarehouseId()).getWarehouseName());
            }
        });
    }

    /**
     * 注入库区名称
     * @param res 物料
     */
    public void injectAreaName(List<Item> res){
        if (CollUtil.isEmpty(res)){
            return;
        }
        Set<Long> areas = res.stream().map(Item::getAreaId).collect(Collectors.toSet());
        Map<Long, Area> areaMap = areaService.selectByIdIn(areas).stream().collect(Collectors.toMap(Area::getId, it -> it));
        res.forEach(it -> {
            if (it.getAreaId() != null && areaMap.containsKey(it.getAreaId())){
                it.setAreaName(areaMap.get(it.getAreaId()).getAreaName());
            }
        });
    }

    /**
     * 查询过期物料
     * @param page 分页条件
     * @return 结果
     */
    public List<Item> queryExpiry(Pageable page) {
        if (page != null){
            PageHelper.startPage(page.getPageNumber() + 1, page.getPageSize(), SortUtil.sort2string(page.getSort()));
        }
        List<Item> items = itemMapper.selectExpiry();
        injectTypeName(items);
        return items;
    }
}
