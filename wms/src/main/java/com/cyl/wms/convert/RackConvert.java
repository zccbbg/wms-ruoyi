package com.cyl.wms.convert;

import org.mapstruct.Mapper;
import com.cyl.wms.domain.Rack;
import com.cyl.wms.pojo.dto.RackDTO;
import com.cyl.wms.pojo.vo.RackVO;
import java.util.List;
/**
 * 货架  DO <=> DTO <=> VO / BO / Query
 *
 * @author zcc
 */
@Mapper(componentModel = "spring")
public interface RackConvert  {

    /**
     * @param source DO
     * @return DTO
     */
    RackDTO do2dto(Rack source);

    /**
     * @param source DTO
     * @return DO
     */
    Rack dto2do(RackDTO source);

    List<RackVO> dos2vos(List<Rack> list);
}
