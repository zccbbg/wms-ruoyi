package com.ruoyi.wms.mapper;

import com.baomidou.mybatisplus.core.conditions.Wrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.core.toolkit.Constants;
import com.ruoyi.common.mybatis.core.mapper.BaseMapperPlus;
import com.ruoyi.wms.domain.entity.Warehouse;
import com.ruoyi.wms.domain.vo.WarehouseVo;
import org.apache.ibatis.annotations.Param;

import java.util.Collection;
import java.util.List;

public interface WarehouseMapper extends BaseMapperPlus<Warehouse, WarehouseVo> {
}
