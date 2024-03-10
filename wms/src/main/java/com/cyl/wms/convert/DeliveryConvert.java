package com.cyl.wms.convert;

import org.mapstruct.Mapper;
import com.cyl.wms.domain.entity.Delivery;
import com.cyl.wms.domain.vo.DeliveryVO;
import java.util.List;
/**
 * 发货记录  ENTITY <=> VO / Form / Query
 *
 * @author zcc
 */
@Mapper(componentModel = "spring")
public interface DeliveryConvert  {
    List<DeliveryVO> dos2vos(List<Delivery> list);
}
