package com.ruoyi.wms.service;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.ruoyi.common.core.exception.ServiceException;
import com.ruoyi.common.core.utils.MapstructUtils;
import com.ruoyi.common.core.utils.StringUtils;
import com.ruoyi.common.mybatis.core.page.PageQuery;
import com.ruoyi.common.mybatis.core.page.TableDataInfo;
import com.ruoyi.wms.domain.entity.Merchant;
import com.ruoyi.wms.domain.entity.ReceiptOrder;
import com.ruoyi.wms.domain.vo.MerchantVo;
import com.ruoyi.wms.mapper.MerchantMapper;
import com.ruoyi.wms.mapper.ReceiptOrderMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;
import com.ruoyi.wms.domain.bo.MerchantBo;

import java.util.Collection;
import java.util.List;
import java.util.Map;

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
    private final ReceiptOrderMapper receiptOrderMapper;

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
        lqw.eq(StringUtils.isNotBlank(bo.getMerchantCode()), Merchant::getMerchantCode, bo.getMerchantCode());
        lqw.like(StringUtils.isNotBlank(bo.getMerchantName()), Merchant::getMerchantName, bo.getMerchantName());
        lqw.eq(bo.getMerchantType() != null, Merchant::getMerchantType, bo.getMerchantType());
        return lqw;
    }

    /**
     * 新增往来单位
     */
    public void insertByBo(MerchantBo bo) {
        Merchant add = MapstructUtils.convert(bo, Merchant.class);
        merchantMapper.insert(add);
    }

    /**
     * 修改往来单位
     */
    public void updateByBo(MerchantBo bo) {
        Merchant update = MapstructUtils.convert(bo, Merchant.class);
        merchantMapper.updateById(update);
    }

    /**
     * 删除往来单位
     */
    public void deleteById(Long id) {
        validateIdBeforeDelete(id);
        merchantMapper.deleteById(id);
    }

    private void validateIdBeforeDelete(Long id) {
        LambdaQueryWrapper<ReceiptOrder> receiptOrderLqw = Wrappers.lambdaQuery();
        receiptOrderLqw.eq(ReceiptOrder::getMerchantId, id);
        Long receiptOrderCount = receiptOrderMapper.selectCount(receiptOrderLqw);
        if (receiptOrderCount != null && receiptOrderCount > 0) {
            throw new ServiceException("企业已有业务关联，无法删除！", HttpStatus.CONFLICT.value());
        }
    }

    /**
     * 批量删除往来单位
     */
    public void deleteByIds(Collection<Long> ids) {
        merchantMapper.deleteBatchIds(ids);
    }
}
