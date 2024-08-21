package com.ruoyi.wms.mapper;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.ruoyi.common.mybatis.core.mapper.BaseMapperPlus;
import com.ruoyi.wms.domain.bo.InventoryBo;
import com.ruoyi.wms.domain.entity.Inventory;
import com.ruoyi.wms.domain.vo.InventoryVo;
import org.apache.ibatis.annotations.Param;

/**
 * 库存Mapper接口
 *
 * @author zcc
 * @date 2024-07-19
 */
public interface InventoryMapper extends BaseMapperPlus<Inventory, InventoryVo> {

    Page<InventoryVo> queryItemBoardList(Page<InventoryVo> page, @Param("bo") InventoryBo bo);
    Page<InventoryVo> queryAreaBoardList(Page<InventoryVo> page, @Param("bo") InventoryBo bo);

    Page<InventoryVo> selectBoardPageByWarehouse(Page<InventoryVo> page, @Param("bo") InventoryBo bo);
}
