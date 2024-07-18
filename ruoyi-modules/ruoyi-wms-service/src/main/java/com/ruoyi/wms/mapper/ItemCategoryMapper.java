package com.ruoyi.wms.mapper;

import com.ruoyi.common.mybatis.core.mapper.BaseMapperPlus;
import com.ruoyi.wms.domain.entity.ItemCategory;
import com.ruoyi.wms.domain.vo.ItemCategoryVo;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface ItemCategoryMapper extends BaseMapperPlus<ItemCategory, ItemCategoryVo> {
    int updateOrderNum(@Param("list") List<ItemCategory> list);
}
