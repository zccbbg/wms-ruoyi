package com.cyl.wms.convert;

import org.mapstruct.Mapper;
import com.cyl.wms.domain.entity.InventoryHistory;
import com.cyl.wms.domain.vo.InventoryHistoryVO;
import java.util.List;
/**
 * 库存记录  ENTITY <=> VO / Form / Query
 *
 * @author zcc
 */
@Mapper(componentModel = "spring")
public interface InventoryHistoryConvert  {
    List<InventoryHistoryVO> dos2vos(List<InventoryHistory> list);
}
