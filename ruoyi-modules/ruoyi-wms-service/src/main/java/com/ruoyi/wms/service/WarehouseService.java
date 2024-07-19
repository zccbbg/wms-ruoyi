package com.ruoyi.wms.service;

import cn.hutool.core.collection.CollUtil;
import cn.hutool.core.collection.CollectionUtil;
import cn.hutool.core.lang.Assert;
import cn.hutool.core.util.StrUtil;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.ruoyi.common.core.utils.MapstructUtils;
import com.ruoyi.common.mybatis.core.page.PageQuery;
import com.ruoyi.common.mybatis.core.page.TableDataInfo;
import com.ruoyi.wms.domain.bo.WarehouseBo;
import com.ruoyi.wms.domain.entity.Area;
import com.ruoyi.wms.domain.entity.Warehouse;
import com.ruoyi.wms.domain.vo.WarehouseVo;
import com.ruoyi.wms.mapper.AreaMapper;
import com.ruoyi.wms.mapper.WarehouseMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.*;
import java.util.function.Function;
import java.util.stream.Collectors;

@RequiredArgsConstructor
@Service
public class WarehouseService extends ServiceImpl<WarehouseMapper, Warehouse> {

    private final WarehouseMapper baseMapper;
    private final AreaService areaService;
    private final AreaMapper areaMapper;

    /**
     * 查询仓库
     */

    public WarehouseVo queryById(Long id) {
        return baseMapper.selectVoById(id);
    }

    /**
     * 查询仓库列表
     */

    public TableDataInfo<WarehouseVo> queryPageList(WarehouseBo bo, PageQuery pageQuery) {
        LambdaQueryWrapper<Warehouse> lqw = buildQueryWrapper(bo);
        Page<WarehouseVo> result = baseMapper.selectVoPage(pageQuery.build(), lqw);
        return TableDataInfo.build(result);
    }

    /**
     * 查询仓库列表
     */

    public List<WarehouseVo> queryList(WarehouseBo bo) {
        LambdaQueryWrapper<Warehouse> lqw = buildQueryWrapper(bo);
        return baseMapper.selectVoList(lqw);
    }

    private LambdaQueryWrapper<Warehouse> buildQueryWrapper(WarehouseBo bo) {
        Map<String, Object> params = bo.getParams();
        LambdaQueryWrapper<Warehouse> lqw = Wrappers.lambdaQuery();
        lqw.eq(StrUtil.isNotBlank(bo.getWarehouseNo()), Warehouse::getWarehouseNo, bo.getWarehouseNo());
        lqw.like(StrUtil.isNotBlank(bo.getWarehouseName()), Warehouse::getWarehouseName, bo.getWarehouseName());
        lqw.orderByAsc(Warehouse::getOrderNum);
        return lqw;
    }

    /**
     * 新增仓库
     */

    public void insertByBo(WarehouseBo bo) {
        validateWarehouseNameAndNo(bo);
        Warehouse add = MapstructUtils.convert(bo, Warehouse.class);
        add.setOrderNum(this.getNextOrderNum());
        baseMapper.insert(add);
    }

    private Long getNextOrderNum() {
        LambdaQueryWrapper<Warehouse> wrapper = new LambdaQueryWrapper<>();
        wrapper.orderByDesc(Warehouse::getOrderNum);
        wrapper.last("limit 1");
        Warehouse warehouse = baseMapper.selectOne(wrapper);
        return warehouse == null ? 0L : warehouse.getOrderNum() + 1;
    }

    /**
     * 修改仓库
     */

    public void updateByBo(WarehouseBo bo) {
        validateWarehouseNameAndNo(bo);
        Warehouse update = MapstructUtils.convert(bo, Warehouse.class);
        baseMapper.updateById(update);
    }

    private void validateWarehouseNameAndNo(WarehouseBo warehouse) {
        LambdaQueryWrapper<Warehouse> queryWrapper = Wrappers.lambdaQuery();
        queryWrapper.eq(Warehouse::getWarehouseName, warehouse.getWarehouseName()).or().eq(StrUtil.isNotBlank(warehouse.getWarehouseNo()), Warehouse::getWarehouseNo, warehouse.getWarehouseNo());
        List<Warehouse> warehouseList = baseMapper.selectList(queryWrapper);
        boolean validateNameResult = warehouseList.stream().anyMatch(
            it -> Objects.equals(it.getWarehouseName(), warehouse.getWarehouseName()) && !Objects.equals(it.getId(), warehouse.getId()));
        Assert.isFalse(validateNameResult, "仓库名称重复");
        boolean validateNoResult = warehouseList.stream().anyMatch(
            it -> Objects.equals(it.getWarehouseNo(), warehouse.getWarehouseNo()) && !Objects.equals(it.getId(), warehouse.getId()));
        Assert.isFalse(validateNoResult, "仓库编号重复");
    }

    /**
     * 批量删除仓库
     */

    public void deleteWithValidByIds(Collection<Long> ids) {
        List<Long> areaIdList = this.getAreaIdInWarehouse(ids);
        baseMapper.deleteBatchIds(ids);
        if (CollUtil.isNotEmpty(areaIdList)) {
            areaMapper.deleteBatchIds(areaIdList);
        }
    }

    private List<Long> getAreaIdInWarehouse(Collection<Long> ids) {
        LambdaQueryWrapper<Area> wrapper = new LambdaQueryWrapper<>();
        wrapper.in(Area::getWarehouseId, ids);
        return areaMapper.selectList(wrapper).stream().map(Area::getId).collect(Collectors.toList());
    }

    public List<WarehouseVo> queryByIdsIgnoreDelFlag(Collection<Long> ids) {
        if (CollUtil.isEmpty(ids)) {
            return CollUtil.newArrayList();
        }
        return baseMapper.selectByIdsIgnoreDelFlag(ids);
    }

    public void updateOrderNum(List<WarehouseBo> tree) {
        if (CollUtil.isEmpty(tree)) {
            return;
        }
        List<Warehouse> updateList = MapstructUtils.convert(tree, Warehouse.class);
        for (int i = 0; i < updateList.size(); i++) {
            updateList.get(i).setOrderNum((long) i);
        }
        saveOrUpdateBatch(updateList);
    }
}
