package com.ruoyi.wms.service;

import com.ruoyi.common.core.exception.ServiceException;
import com.ruoyi.common.core.utils.MapstructUtils;
import com.ruoyi.common.mybatis.core.domain.BaseEntity;
import com.ruoyi.common.mybatis.core.page.TableDataInfo;
import com.ruoyi.common.mybatis.core.page.PageQuery;
import com.ruoyi.common.core.utils.StringUtils;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.ruoyi.wms.domain.entity.Item;
import com.ruoyi.wms.mapper.ItemMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;
import com.ruoyi.wms.domain.bo.ItemBrandBo;
import com.ruoyi.wms.domain.vo.ItemBrandVo;
import com.ruoyi.wms.domain.entity.ItemBrand;
import com.ruoyi.wms.mapper.ItemBrandMapper;

import java.util.List;
import java.util.Map;
import java.util.Collection;

/**
 * 商品品牌Service业务层处理
 *
 * @author zcc
 * @date 2024-07-30
 */
@RequiredArgsConstructor
@Service
public class ItemBrandService {

    private final ItemBrandMapper itemBrandMapper;
    private final ItemMapper itemMapper;

    /**
     * 查询商品品牌
     */
    public ItemBrandVo queryById(Long id){
        return itemBrandMapper.selectVoById(id);
    }

    /**
     * 查询商品品牌列表
     */
    public TableDataInfo<ItemBrandVo> queryPageList(ItemBrandBo bo, PageQuery pageQuery) {
        LambdaQueryWrapper<ItemBrand> lqw = buildQueryWrapper(bo);
        Page<ItemBrandVo> result = itemBrandMapper.selectVoPage(pageQuery.build(), lqw);
        return TableDataInfo.build(result);
    }

    /**
     * 查询商品品牌列表
     */
    public List<ItemBrandVo> queryList(ItemBrandBo bo) {
        LambdaQueryWrapper<ItemBrand> lqw = buildQueryWrapper(bo);
        return itemBrandMapper.selectVoList(lqw);
    }

    private LambdaQueryWrapper<ItemBrand> buildQueryWrapper(ItemBrandBo bo) {
        Map<String, Object> params = bo.getParams();
        LambdaQueryWrapper<ItemBrand> lqw = Wrappers.lambdaQuery();
        lqw.like(StringUtils.isNotBlank(bo.getBrandName()), ItemBrand::getBrandName, bo.getBrandName());
        lqw.orderByDesc(BaseEntity::getCreateTime);
        return lqw;
    }

    /**
     * 新增商品品牌
     */
    public void insertByBo(ItemBrandBo bo) {
        ItemBrand add = MapstructUtils.convert(bo, ItemBrand.class);
        itemBrandMapper.insert(add);
    }

    /**
     * 修改商品品牌
     */
    public void updateByBo(ItemBrandBo bo) {
        ItemBrand update = MapstructUtils.convert(bo, ItemBrand.class);
        itemBrandMapper.updateById(update);
    }

    /**
     * 批量删除商品品牌
     */
    public void deleteById(Long id) {
        validateIdBeforeDelete(id);
        itemBrandMapper.deleteById(id);
    }

    private void validateIdBeforeDelete(Long id) {
        LambdaQueryWrapper<Item> itemLambdaQueryWrapper = Wrappers.lambdaQuery();
        itemLambdaQueryWrapper.eq(Item::getItemBrand, id);
        if (itemMapper.exists(itemLambdaQueryWrapper)) {
            throw new ServiceException("品牌已有业务关联，无法删除！", HttpStatus.CONFLICT.value());
        }
    }
}
