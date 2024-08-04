package com.ruoyi.wms.mapper;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.ruoyi.common.mybatis.core.mapper.BaseMapperPlus;
import com.ruoyi.wms.domain.bo.InventoryBo;
import com.ruoyi.wms.domain.entity.Inventory;
import org.apache.ibatis.annotations.Param;
import com.ruoyi.wms.domain.vo.InventoryVo;

import java.time.LocalDateTime;
import java.util.List;

/**
 * 库存Mapper接口
 *
 * @author zcc
 * @date 2024-07-19
 */
public interface InventoryMapper extends BaseMapperPlus<Inventory, InventoryVo> {

    Page<InventoryVo> selectVoPageByBo(Page<Object> page, @Param("bo") InventoryBo bo);
}
