package com.cyl.wms.convert;

import org.mapstruct.Mapper;
import com.cyl.wms.domain.entity.Warehouse;
import com.cyl.wms.domain.vo.WarehouseVO;
import java.util.List;
/**
 * 仓库  ENTITY <=> VO / Form / Query
 *
 * @author zcc
 */
@Mapper(componentModel = "spring")
public interface WarehouseConvert  {
    List<WarehouseVO> dos2vos(List<Warehouse> list);
}
