package com.cyl.wms.mapper;

import com.baomidou.mybatisplus.core.conditions.Wrapper;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.core.toolkit.Constants;
import com.cyl.wms.domain.entity.Inventory;
import com.cyl.wms.domain.entity.InventoryHistory;
import org.apache.ibatis.annotations.Param;

import java.time.LocalDateTime;
import java.util.Collection;
import java.util.List;

/**
 * 库存Mapper接口
 *
 * @author zcc
 */
public interface InventoryMapper extends BaseMapper<Inventory> {
    /**
     * 查询库存
     *
     * @param queryWrapper 库存
     * @return 库存集合
     */
    List<Inventory> selectListGroupByWarehouseId(@Param(Constants.WRAPPER) Wrapper<Inventory> queryWrapper);

    /**
     * 查询库存
     *
     * @param queryWrapper 库存
     * @return 库存集合
     */
    List<Inventory> selectListGroupByAreaId(@Param(Constants.WRAPPER) QueryWrapper<Inventory> queryWrapper);

    /**
     * 查询库存
     *
     * @param queryWrapper 库存
     * @return 库存集合
     */
    List<Inventory> selectListGroupByItemTypeId(@Param(Constants.WRAPPER) QueryWrapper<Inventory> queryWrapper);

    /**
     * 查询库存列表
     *
     * @param inventory 库存
     * @return 库存集合
     */
    List<Inventory> selectByEntity(Inventory inventory);

    /**
     * 批量软删除
     *
     * @param ids
     * @return
     */
    int updateDelFlagByIds(@Param("ids") Long[] ids);

    int batchUpdateQuantityById(@Param("list") Collection<Inventory> list, @Param("updateTime") LocalDateTime updateTime, @Param("userId") Long userId);

    List<Inventory> selectAllByWarehouseAndItemId(@Param("list") Collection<InventoryHistory> list);

    List<Inventory> selectAllByAreaAndItemId(@Param("list") Collection<InventoryHistory> list);

    List<Inventory> selectAllByRackAndItemId(@Param("list") Collection<InventoryHistory> list);

    int batchInsert(@Param("list") Collection<Inventory> list);

    List<Inventory> selectWarning();

    /**
     * 查询所有有效的物料(仓库，物料未被删除)
     *
     */
    List<Inventory> selectValidAll();

    List<Inventory> selectLastInventory(@Param("itemId")Long itemId, @Param("sort")String sort);
    List<Inventory> selectLastInventoryForReceipt(@Param("itemId")Long itemId, @Param("sort")String sort);
}
