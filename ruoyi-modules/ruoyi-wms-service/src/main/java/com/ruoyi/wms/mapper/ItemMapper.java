package com.ruoyi.wms.mapper;

import com.ruoyi.common.mybatis.core.mapper.BaseMapperPlus;
import com.ruoyi.wms.domain.entity.Item;
import com.ruoyi.wms.domain.vo.ItemVo;
import org.apache.ibatis.annotations.Param;

import java.util.Collection;
import java.util.List;

public interface ItemMapper extends BaseMapperPlus<Item, ItemVo> {

    List<Item> selectByIdsIgnoreDelFlag(@Param("list") Collection<Long> ids);
}
