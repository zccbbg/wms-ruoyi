package com.cyl.wms.convert;

import org.mapstruct.Mapper;
import com.cyl.wms.domain.Warehouse;
import com.cyl.wms.pojo.dto.WarehouseDTO;
import com.cyl.wms.pojo.vo.WarehouseVO;
import java.util.List;
/**
 * 仓库  DO <=> DTO <=> VO / BO / Query
 *
 * @author zcc
 */
@Mapper(componentModel = "spring")
public interface WarehouseConvert  {

    /**
     * @param source DO
     * @return DTO
     */
    WarehouseDTO do2dto(Warehouse source);

    /**
     * @param source DTO
     * @return DO
     */
    Warehouse dto2do(WarehouseDTO source);

    List<WarehouseVO> dos2vos(List<Warehouse> list);
}
