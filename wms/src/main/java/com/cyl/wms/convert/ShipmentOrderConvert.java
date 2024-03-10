package com.cyl.wms.convert;

import com.cyl.wms.domain.form.ShipmentOrderFrom;
import org.mapstruct.Mapper;
import com.cyl.wms.domain.entity.ShipmentOrder;
import com.cyl.wms.domain.vo.ShipmentOrderVO;
import java.util.List;
/**
 * 出库单  ENTITY <=> VO / Form / Query
 *
 * @author zcc
 */
@Mapper(componentModel = "spring")
public interface ShipmentOrderConvert  {
    List<ShipmentOrderVO> dos2vos(List<ShipmentOrder> list);

    ShipmentOrderFrom do2form(ShipmentOrder bean);
}
