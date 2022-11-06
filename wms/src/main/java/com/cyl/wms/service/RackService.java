package com.cyl.wms.service;

import java.util.Arrays;
import java.util.Collection;
import java.util.List;
import java.time.LocalDateTime;
import java.util.Set;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.cyl.wms.domain.Warehouse;
import com.github.pagehelper.PageHelper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;
import com.cyl.wms.mapper.RackMapper;
import com.cyl.wms.domain.Rack;
import com.cyl.wms.pojo.query.RackQuery;

/**
 * 货架Service业务层处理
 *
 *
 * @author zcc
 */
@Service
public class RackService {
    @Autowired
    private RackMapper rackMapper;

    /**
     * 查询货架
     *
     * @param id 货架主键
     * @return 货架
     */
    public Rack selectById(Long id) {
        return rackMapper.selectById(id);
    }

    /**
     * 查询货架列表
     *
     * @param query 查询条件
     * @param page 分页条件
     * @return 货架
     */
    public List<Rack> selectList(RackQuery query, Pageable page) {
        if (page != null) {
            PageHelper.startPage(page.getPageNumber() + 1, page.getPageSize());
        }
        QueryWrapper<Rack> qw = new QueryWrapper<>();
        qw.eq("del_flag",0);
        String rackNo = query.getRackNo();
        if (!StringUtils.isEmpty(rackNo)) {
            qw.eq("rack_no", rackNo);
        }
        String rackNameLike = query.getRackNameLike();
        if (!StringUtils.isEmpty(rackNameLike)) {
            qw.like("rack_name", rackNameLike);
        }
        Long areaId = query.getAreaId();
        if (areaId != null) {
            qw.eq("area_id", areaId);
        }
        Long warehouseId = query.getWarehouseId();
        if (warehouseId != null) {
            qw.eq("warehouse_id", warehouseId);
        }
        return rackMapper.selectList(qw);
    }

    /**
     * 新增货架
     *
     * @param rack 货架
     * @return 结果
     */
    public int insert(Rack rack) {
        rack.setDelFlag(0);
        rack.setCreateTime(LocalDateTime.now());
        return rackMapper.insert(rack);
    }

    /**
     * 修改货架
     *
     * @param rack 货架
     * @return 结果
     */
    public int update(Rack rack) {
        return rackMapper.updateById(rack);
    }

    /**
     * 批量删除货架
     *
     * @param ids 需要删除的货架主键
     * @return 结果
     */
    public int deleteByIds(Long[] ids) {
        return rackMapper.updateDelFlagByIds(ids);
    }

    /**
     * 删除货架信息
     *
     * @param id 货架主键
     * @return 结果
     */
    public int deleteById(Long id) {
        Long[] ids = {id};
        return rackMapper.updateDelFlagByIds(ids);
    }

    public List<Rack> selectByIdIn(Collection<Long> ids) {
        QueryWrapper<Rack> qw = new QueryWrapper<>();
        qw.in("id",ids);
        return rackMapper.selectList(qw);
    }
}
