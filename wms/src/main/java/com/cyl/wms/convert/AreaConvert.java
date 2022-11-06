package com.cyl.wms.convert;

import org.mapstruct.Mapper;
import com.cyl.wms.domain.Area;
import com.cyl.wms.pojo.dto.AreaDTO;
import com.cyl.wms.pojo.vo.AreaVO;
import java.util.List;
/**
 * 货区  DO <=> DTO <=> VO / BO / Query
 *
 * @author zcc
 */
@Mapper(componentModel = "spring")
public interface AreaConvert  {

    /**
     * @param source DO
     * @return DTO
     */
    AreaDTO do2dto(Area source);

    /**
     * @param source DTO
     * @return DO
     */
    Area dto2do(AreaDTO source);

    List<AreaVO> dos2vos(List<Area> list);
}
