package com.cyl.wms.convert;

import org.mapstruct.Mapper;
import com.cyl.wms.domain.entity.Carrier;
import com.cyl.wms.domain.vo.CarrierVO;
import java.util.List;
/**
 * 承运商  ENTITY <=> VO / Form / Query
 *
 * @author zcc
 */
@Mapper(componentModel = "spring")
public interface CarrierConvert  {
    List<CarrierVO> dos2vos(List<Carrier> list);
}
