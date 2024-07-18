package com.ruoyi.wms.mapper;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.ruoyi.common.mybatis.core.mapper.BaseMapperPlus;
import com.ruoyi.wms.domain.bo.ItemSkuBo;
import com.ruoyi.wms.domain.entity.ItemSku;
import com.ruoyi.wms.domain.vo.ItemSkuVo;
import org.apache.ibatis.annotations.Param;

import java.util.Collection;
import java.util.List;

public interface ItemSkuMapper extends BaseMapperPlus<ItemSku, ItemSkuVo> {

    /**
     *
     * @param itemIds
     * @return
     */
    List<ItemSku> selectByIdsIgnoreDelFlag(@Param("list") Collection<Long> itemIds);

    int batchUpdate(@Param("list") Collection<ItemSku> list);

    IPage<ItemSkuVo> selectByBo(IPage<ItemSkuVo> page, @Param("bo") ItemSkuBo bo);
}
