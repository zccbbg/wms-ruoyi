package com.cyl.wms.mapper;

import java.util.Collection;
import java.util.List;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Param;
import com.cyl.wms.domain.InventoryHistory;

/**
 * 库存记录Mapper接口
 * 
 * @author zcc
 */
public interface InventoryHistoryMapper extends BaseMapper<InventoryHistory> {
    /**
     * 查询库存记录列表
     *
     * @param inventoryHistory 库存记录
     * @return 库存记录集合
     */
    List<InventoryHistory> selectByEntity(InventoryHistory inventoryHistory);

    /**
     * 批量软删除
     * @param ids
     * @return
    */
    int updateDelFlagByIds(@Param("ids") Long[] ids);

    int batchInsert(@Param("list") Collection<InventoryHistory> list);
}
