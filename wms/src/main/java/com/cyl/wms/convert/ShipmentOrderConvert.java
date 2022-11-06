package com.cyl.wms.convert;

import com.cyl.wms.domain.ShipmentOrder;
import com.cyl.wms.pojo.dto.ShipmentOrderDTO;
import com.cyl.wms.pojo.vo.ShipmentOrderVO;
import com.cyl.wms.pojo.vo.form.ShipmentOrderFrom;
import org.mapstruct.Mapper;

import java.util.List;
/**
 * 出库单  DO <=> DTO <=> VO / BO / Query
 *
 * @author zcc
 */
@Mapper(componentModel = "spring")
public interface ShipmentOrderConvert  {

    /**
     * @param source DO
     * @return DTO
     */
    ShipmentOrderDTO do2dto(ShipmentOrder source);

    /**
     * @param source DTO
     * @return DO
     */
    ShipmentOrder dto2do(ShipmentOrderDTO source);

    List<ShipmentOrderVO> dos2vos(List<ShipmentOrder> list);

    ShipmentOrderFrom do2form(ShipmentOrder bean);
}
