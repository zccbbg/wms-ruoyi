package com.cyl.wms.convert;

import org.mapstruct.Mapper;
import com.cyl.wms.domain.entity.Area;
import com.cyl.wms.domain.vo.AreaVO;
import java.util.List;
/**
 * 库区  ENTITY <=> VO / Form / Query
 *
 * @author zcc
 */
@Mapper(componentModel = "spring")
public interface AreaConvert  {
    List<AreaVO> dos2vos(List<Area> list);
}
