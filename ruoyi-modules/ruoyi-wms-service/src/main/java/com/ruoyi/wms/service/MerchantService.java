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
import com.ruoyi.wms.domain.bo.MerchantBo;
import com.ruoyi.wms.domain.vo.MerchantVo;
import com.ruoyi.wms.domain.entity.Merchant;
import com.ruoyi.wms.mapper.MerchantMapper;

import java.util.List;
import java.util.Map;
import java.util.Collection;

/**
 * 往来单位Service业务层处理
 *
 * @author zcc
 * @date 2024-07-16
 */
@RequiredArgsConstructor
@Service
public class MerchantService {

    private final MerchantMapper merchantMapper;

    /**
     * 查询往来单位
     */
    public MerchantVo queryById(Long id){
        return merchantMapper.selectVoById(id);
    }

    /**
     * 查询往来单位列表
     */
    public TableDataInfo<MerchantVo> queryPageList(MerchantBo bo, PageQuery pageQuery) {
        LambdaQueryWrapper<Merchant> lqw = buildQueryWrapper(bo);
        Page<MerchantVo> result = merchantMapper.selectVoPage(pageQuery.build(), lqw);
        return TableDataInfo.build(result);
    }

    /**
     * 查询往来单位列表
     */
    public List<MerchantVo> queryList(MerchantBo bo) {
        LambdaQueryWrapper<Merchant> lqw = buildQueryWrapper(bo);
        return merchantMapper.selectVoList(lqw);
    }

    private LambdaQueryWrapper<Merchant> buildQueryWrapper(MerchantBo bo) {
        Map<String, Object> params = bo.getParams();
        LambdaQueryWrapper<Merchant> lqw = Wrappers.lambdaQuery();
        lqw.eq(StringUtils.isNotBlank(bo.getMerchantNo()), Merchant::getMerchantNo, bo.getMerchantNo());
        lqw.like(StringUtils.isNotBlank(bo.getMerchantName()), Merchant::getMerchantName, bo.getMerchantName());
        lqw.eq(bo.getMerchantType() != null, Merchant::getMerchantType, bo.getMerchantType());
        return lqw;
    }

    /**
     * 新增往来单位
     */
    public Boolean insertByBo(MerchantBo bo) {
        Merchant add = MapstructUtils.convert(bo, Merchant.class);
        return merchantMapper.insert(add) > 0;
    }

    /**
     * 修改往来单位
     */
    public Boolean updateByBo(MerchantBo bo) {
        Merchant update = MapstructUtils.convert(bo, Merchant.class);
        return merchantMapper.updateById(update) > 0;
    }

    /**
     * 批量删除往来单位
     */
    public Boolean deleteByIds(Collection<Long> ids) {
        return merchantMapper.deleteBatchIds(ids) > 0;
    }
}
