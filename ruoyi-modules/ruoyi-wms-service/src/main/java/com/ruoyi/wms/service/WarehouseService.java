package com.ruoyi.wms.service;

import cn.hutool.core.collection.CollUtil;
import cn.hutool.core.collection.CollectionUtil;
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

    public Boolean insertByBo(WarehouseBo bo) {
        validEntityBeforeSave(bo);
        Warehouse add = MapstructUtils.convert(bo, Warehouse.class);
        add.setOrderNum(this.getNextOrderNum());
        return baseMapper.insert(add) > 0;
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

    public Boolean updateByBo(WarehouseBo bo) {
        validEntityBeforeSave(bo);
        Warehouse update = MapstructUtils.convert(bo, Warehouse.class);
        return baseMapper.updateById(update) > 0;
    }

    /**
     * 保存前的数据校验
     */
    private void validEntityBeforeSave(WarehouseBo entity) {
        validateWarehouseNameAndNo(entity);
    }

    private void validateWarehouseNameAndNo(WarehouseBo warehouse) {
        LambdaQueryWrapper<Warehouse> queryWrapper = Wrappers.lambdaQuery();
        queryWrapper.eq(Warehouse::getWarehouseName, warehouse.getWarehouseName()).or().eq(StrUtil.isNotBlank(warehouse.getWarehouseNo()), Warehouse::getWarehouseNo, warehouse.getWarehouseNo());
        List<Warehouse> warehouseList = baseMapper.selectList(queryWrapper);
        boolean validateNameResult = warehouseList.stream().anyMatch(
            it -> Objects.equals(it.getWarehouseName(), warehouse.getWarehouseName()) && !Objects.equals(it.getId(), warehouse.getId()));
        if (validateNameResult) {
            throw new RuntimeException("仓库名称重复");
        }
        boolean validateNoResult = warehouseList.stream().anyMatch(
            it -> Objects.equals(it.getWarehouseNo(), warehouse.getWarehouseNo()) && !Objects.equals(it.getId(), warehouse.getId()));
        if (validateNoResult) {
            throw new RuntimeException("仓库编号重复");
        }
    }

    /**
     * 批量删除仓库
     */

    public Boolean deleteWithValidByIds(Collection<Long> ids, Boolean isValid) {
        List<Long> areaIdList = this.getAreaIdInWarehouse(ids);
        boolean flag = baseMapper.deleteBatchIds(ids) > 0;
        if (flag && CollUtil.isNotEmpty(areaIdList)) {
            flag = areaMapper.deleteBatchIds(areaIdList) > 0;
        }
        return flag;
    }

    private List<Long> getAreaIdInWarehouse(Collection<Long> ids) {
        LambdaQueryWrapper<Area> wrapper = new LambdaQueryWrapper<>();
        wrapper.in(Area::getWarehouseId, ids);
        return areaMapper.selectList(wrapper).stream().map(Area::getId).collect(Collectors.toList());
    }


    /*
     * 删除前的数据校验
     * */
    private void validEntityBeforeDelete(Collection<Long> ids) {
        ids.forEach(id -> {
            // 获取该仓库下的库区数量
            if (areaService.countByWarehouseId(id) > 0) {
                throw new RuntimeException("该仓库下存在库区，不能删除");
            }
        });

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
        saveOrUpdateBatch(updateList);
    }
}
