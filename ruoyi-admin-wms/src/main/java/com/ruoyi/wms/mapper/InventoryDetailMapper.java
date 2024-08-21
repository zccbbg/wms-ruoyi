package com.ruoyi.wms.mapper;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.ruoyi.common.mybatis.core.mapper.BaseMapperPlus;
import com.ruoyi.wms.domain.bo.InventoryDetailBo;
import com.ruoyi.wms.domain.entity.InventoryDetail;
import com.ruoyi.wms.domain.vo.InventoryDetailVo;
import org.apache.ibatis.annotations.Param;

import java.time.LocalDateTime;
import java.util.List;

/**
 * 库存详情Mapper接口
 *
 * @author zcc
 * @date 2024-07-22
 */
public interface InventoryDetailMapper extends BaseMapperPlus<InventoryDetail, InventoryDetailVo> {
    void deductInventoryDetailQuantity(@Param("list")List<InventoryDetailBo> list, @Param("updateBy") String updateBy, @Param("updateTime") LocalDateTime updateTime);

    Page<InventoryDetailVo> selectPageByBo(Page<InventoryDetailVo> page, @Param("bo") InventoryDetailBo bo);

    List<InventoryDetailVo> selectListByBo(@Param("bo") InventoryDetailBo bo);
}
