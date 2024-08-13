package com.ruoyi.wms.service;

import com.ruoyi.common.core.utils.MapstructUtils;
import com.ruoyi.common.mybatis.core.page.TableDataInfo;
import com.ruoyi.common.mybatis.core.page.PageQuery;
import com.ruoyi.common.core.utils.StringUtils;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import com.ruoyi.wms.domain.bo.CheckOrderBo;
import com.ruoyi.wms.domain.vo.CheckOrderVo;
import com.ruoyi.wms.domain.entity.CheckOrder;
import com.ruoyi.wms.mapper.CheckOrderMapper;

import java.util.List;
import java.util.Map;
import java.util.Collection;

/**
 * 库存盘点单据Service业务层处理
 *
 * @author zcc
 * @date 2024-08-13
 */
@RequiredArgsConstructor
@Service
public class CheckOrderService {

    private final CheckOrderMapper checkOrderMapper;

    /**
     * 查询库存盘点单据
     */
    public CheckOrderVo queryById(Long id){
        return checkOrderMapper.selectVoById(id);
    }

    /**
     * 查询库存盘点单据列表
     */
    public TableDataInfo<CheckOrderVo> queryPageList(CheckOrderBo bo, PageQuery pageQuery) {
        LambdaQueryWrapper<CheckOrder> lqw = buildQueryWrapper(bo);
        Page<CheckOrderVo> result = checkOrderMapper.selectVoPage(pageQuery.build(), lqw);
        return TableDataInfo.build(result);
    }

    /**
     * 查询库存盘点单据列表
     */
    public List<CheckOrderVo> queryList(CheckOrderBo bo) {
        LambdaQueryWrapper<CheckOrder> lqw = buildQueryWrapper(bo);
        return checkOrderMapper.selectVoList(lqw);
    }

    private LambdaQueryWrapper<CheckOrder> buildQueryWrapper(CheckOrderBo bo) {
        Map<String, Object> params = bo.getParams();
        LambdaQueryWrapper<CheckOrder> lqw = Wrappers.lambdaQuery();
        lqw.eq(StringUtils.isNotBlank(bo.getCheckOrderNo()), CheckOrder::getCheckOrderNo, bo.getCheckOrderNo());
        lqw.eq(bo.getCheckOrderStatus() != null, CheckOrder::getCheckOrderStatus, bo.getCheckOrderStatus());
        lqw.eq(bo.getCheckOrderTotal() != null, CheckOrder::getCheckOrderTotal, bo.getCheckOrderTotal());
        lqw.eq(bo.getWarehouseId() != null, CheckOrder::getWarehouseId, bo.getWarehouseId());
        lqw.eq(bo.getAreaId() != null, CheckOrder::getAreaId, bo.getAreaId());
        return lqw;
    }

    /**
     * 新增库存盘点单据
     */
    public void insertByBo(CheckOrderBo bo) {
        CheckOrder add = MapstructUtils.convert(bo, CheckOrder.class);
        checkOrderMapper.insert(add);
    }

    /**
     * 修改库存盘点单据
     */
    public void updateByBo(CheckOrderBo bo) {
        CheckOrder update = MapstructUtils.convert(bo, CheckOrder.class);
        checkOrderMapper.updateById(update);
    }

    /**
     * 批量删除库存盘点单据
     */
    public void deleteByIds(Collection<Long> ids) {
        checkOrderMapper.deleteBatchIds(ids);
    }
}
