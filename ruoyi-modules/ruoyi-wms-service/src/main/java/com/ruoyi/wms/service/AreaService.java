package com.ruoyi.wms.service;

import cn.hutool.core.collection.CollUtil;
import cn.hutool.core.util.StrUtil;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.ruoyi.common.core.utils.MapstructUtils;
import com.ruoyi.common.mybatis.core.page.PageQuery;
import com.ruoyi.common.mybatis.core.page.TableDataInfo;
import com.ruoyi.wms.domain.bo.AreaBo;
import com.ruoyi.wms.domain.entity.Area;
import com.ruoyi.wms.domain.vo.AreaVo;
import com.ruoyi.wms.mapper.AreaMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.Collection;
import java.util.List;
import java.util.Map;

@RequiredArgsConstructor
@Service
public class AreaService {

    private final AreaMapper baseMapper;

    /**
     * 查询库区
     */

    public AreaVo queryById(Long id) {
        return baseMapper.selectVoById(id);
    }

    /**
     * 查询库区列表
     */

    public TableDataInfo<AreaVo> queryPageList(AreaBo bo, PageQuery pageQuery) {
        LambdaQueryWrapper<Area> lqw = buildQueryWrapper(bo);
        Page<AreaVo> result = baseMapper.selectVoPage(pageQuery.build(), lqw);
        return TableDataInfo.build(result);
    }

    /**
     * 查询库区列表
     */

    public List<AreaVo> queryList(AreaBo bo) {
        LambdaQueryWrapper<Area> lqw = buildQueryWrapper(bo);
        return baseMapper.selectVoList(lqw);
    }

    /**
     * 获取该仓库下的库区数量
     *
     * @param id 仓库id
     */

    public Long countByWarehouseId(Long id) {
        LambdaQueryWrapper<Area> lqw = Wrappers.lambdaQuery();
        lqw.eq(Area::getWarehouseId, id);
        return baseMapper.selectCount(lqw);
    }

    private LambdaQueryWrapper<Area> buildQueryWrapper(AreaBo bo) {
        Map<String, Object> params = bo.getParams();
        LambdaQueryWrapper<Area> lqw = Wrappers.lambdaQuery();
        lqw.eq(StrUtil.isNotBlank(bo.getAreaNo()), Area::getAreaNo, bo.getAreaNo());
        lqw.like(StrUtil.isNotBlank(bo.getAreaName()), Area::getAreaName, bo.getAreaName());
        lqw.eq(bo.getWarehouseId() != null, Area::getWarehouseId, bo.getWarehouseId());
        return lqw;
    }

    /**
     * 新增库区
     */

    public Boolean insertByBo(AreaBo bo) {
        validEntityBeforeSave(bo);
        Area add = MapstructUtils.convert(bo, Area.class);
        boolean flag = baseMapper.insert(add) > 0;
        if (flag) {
            bo.setId(add.getId());
        }
        return flag;
    }

    /**
     * 修改库区
     */

    public Boolean updateByBo(AreaBo bo) {
        validEntityBeforeSave(bo);
        Area update = MapstructUtils.convert(bo, Area.class);
        return baseMapper.updateById(update) > 0;
    }

    private void validateAreaNameAndNo(AreaBo area) {
        LambdaQueryWrapper<Area> queryWrapper = Wrappers.lambdaQuery();
        queryWrapper.eq(Area::getWarehouseId, area.getWarehouseId());
        queryWrapper.eq(Area::getAreaName, area.getAreaName());
        queryWrapper.ne(area.getId() != null, Area::getId, area.getId());
        boolean result = baseMapper.selectCount(queryWrapper) == 0;
        if (!result) {
            throw new RuntimeException("库区名称重复");
        }
        if (StrUtil.isBlank(area.getAreaNo())) {
            return;
        }
        queryWrapper.clear();
        queryWrapper.eq(Area::getAreaNo, area.getAreaNo());
        queryWrapper.ne(area.getId() != null, Area::getId, area.getId());
        result = baseMapper.selectCount(queryWrapper) == 0;
        if (!result) {
            throw new RuntimeException("库区编号重复");
        }
    }

    /**
     * 保存前的数据校验
     */
    private void validEntityBeforeSave(AreaBo entity){
        validateAreaNameAndNo(entity);
    }

    /**
     * 批量删除库区
     */

    public Boolean deleteWithValidByIds(Collection<Long> ids, Boolean isValid) {
        return baseMapper.deleteBatchIds(ids) > 0;
    }
    /*
     * 删除前的数据校验
     * */
    private void validEntityBeforeDelete(Collection<Long> ids) {
        ids.forEach(id -> {
            AreaVo areaVo = queryById(id);
            // 获取该仓库下的库区数量,如果只有一个,则不能删除
            if (countByWarehouseId(areaVo.getWarehouseId()) == 1) {
                throw new RuntimeException("该仓库下只有一个库区,不能删除");
            }
        });

    }

    public List<AreaVo> queryByIdsIgnoreDelFlag(Collection<Long> ids) {
        if (CollUtil.isEmpty(ids)) {
            return CollUtil.newArrayList();
        }
        return baseMapper.queryByIdsIgnoreDelFlag(ids);
    }
}
