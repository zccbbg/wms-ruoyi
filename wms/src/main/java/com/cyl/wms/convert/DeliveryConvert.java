package com.cyl.wms.convert;

import org.mapstruct.Mapper;
import com.cyl.wms.domain.Delivery;
import com.cyl.wms.pojo.dto.DeliveryDTO;
import com.cyl.wms.pojo.vo.DeliveryVO;
import java.util.List;
/**
 * 发货记录  DO <=> DTO <=> VO / BO / Query
 *
 * @author zcc
 */
@Mapper(componentModel = "spring")
public interface DeliveryConvert  {

    /**
     * @param source DO
     * @return DTO
     */
    DeliveryDTO do2dto(Delivery source);

    /**
     * @param source DTO
     * @return DO
     */
    Delivery dto2do(DeliveryDTO source);

    List<DeliveryVO> dos2vos(List<Delivery> list);
}
