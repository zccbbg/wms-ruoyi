package com.cyl.wms.mapper;

import java.util.List;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Param;
import com.cyl.wms.domain.entity.Area;

/**
 * 货区Mapper接口
 * 
 * @author zcc
 */
public interface AreaMapper extends BaseMapper<Area> {
    /**
     * 查询货区列表
     *
     * @param area 货区
     * @return 货区集合
     */
    List<Area> selectByEntity(Area area);

    /**
     * 批量软删除
     * @param ids
     * @return
    */
    int updateDelFlagByIds(@Param("ids") Long[] ids);
}
