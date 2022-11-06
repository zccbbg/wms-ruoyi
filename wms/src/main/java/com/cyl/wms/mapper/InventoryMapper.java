package com.cyl.wms.mapper;

import java.time.LocalDateTime;
import java.util.Collection;
import java.util.List;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.cyl.wms.domain.InventoryHistory;
import org.apache.ibatis.annotations.Param;
import com.cyl.wms.domain.Inventory;

/**
 * 库存Mapper接口
 * 
 * @author zcc
 */
public interface InventoryMapper extends BaseMapper<Inventory> {
    /**
     * 查询库存列表
     *
     * @param inventory 库存
     * @return 库存集合
     */
    List<Inventory> selectByEntity(Inventory inventory);

    /**
     * 批量软删除
     * @param ids
     * @return
    */
    int updateDelFlagByIds(@Param("ids") Long[] ids);

    int batchUpdateQuantityById(@Param("list") Collection<Inventory> list, @Param("updateTime") LocalDateTime updateTime, @Param("userId") Long userId);

    List<Inventory> selectAllByWarehouseAndItemId(@Param("list") Collection<InventoryHistory> list);
    List<Inventory> selectAllByAreaAndItemId(@Param("list") Collection<InventoryHistory> list);
    List<Inventory> selectAllByRackAndItemId(@Param("list") Collection<InventoryHistory> list);

    int batchInsert(@Param("list") Collection<Inventory> list);
}
