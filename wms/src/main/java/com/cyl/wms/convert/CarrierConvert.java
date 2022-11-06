package com.cyl.wms.convert;

import org.mapstruct.Mapper;
import com.cyl.wms.domain.Carrier;
import com.cyl.wms.pojo.dto.CarrierDTO;
import com.cyl.wms.pojo.vo.CarrierVO;
import java.util.List;
/**
 * 承运商  DO <=> DTO <=> VO / BO / Query
 *
 * @author zcc
 */
@Mapper(componentModel = "spring")
public interface CarrierConvert  {

    /**
     * @param source DO
     * @return DTO
     */
    CarrierDTO do2dto(Carrier source);

    /**
     * @param source DTO
     * @return DO
     */
    Carrier dto2do(CarrierDTO source);

    List<CarrierVO> dos2vos(List<Carrier> list);
}
