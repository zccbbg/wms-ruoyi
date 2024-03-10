package com.cyl.wms.convert;

import org.mapstruct.Mapper;
import com.cyl.wms.domain.entity.Rack;
import com.cyl.wms.domain.vo.RackVO;
import java.util.List;
/**
 * 货架  ENTITY <=> VO / Form / Query
 *
 * @author zcc
 */
@Mapper(componentModel = "spring")
public interface RackConvert  {
    List<RackVO> dos2vos(List<Rack> list);
}
