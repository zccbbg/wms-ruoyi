package com.cyl.wms.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.cyl.wms.domain.entity.InventorySettlementDetail;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * 库存结算明细Mapper接口
 * 
 * @author zcc
 */
public interface InventorySettlementDetailMapper extends BaseMapper<InventorySettlementDetail> {
    /**
     * 查询库存结算明细列表
     *
     * @param inventorySettlementDetail 库存结算明细
     * @return 库存结算明细集合
     */
    List<InventorySettlementDetail> selectByEntity(InventorySettlementDetail inventorySettlementDetail);

    /**
     * 批量软删除
     * @param ids
     * @return
    */
    int updateDelFlagByIds(@Param("ids") Long[] ids);

    /**
     * 批量插入
     * @param inventorySettlementDetails 库存结算单据详情
     * @return 插入结果
     */
    int batchInsert(List<InventorySettlementDetail> inventorySettlementDetails);
}
