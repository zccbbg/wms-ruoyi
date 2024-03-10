package com.cyl.wms.convert;

import com.cyl.wms.domain.entity.InventoryHistory;
import org.mapstruct.Mapper;
import com.cyl.wms.domain.entity.Inventory;
import com.cyl.wms.domain.vo.InventoryVO;
import java.util.List;
/**
 * 库存  ENTITY <=> VO / Form / Query
 *
 * @author zcc
 */
@Mapper(componentModel = "spring")
public interface InventoryConvert  {
    List<InventoryVO> dos2vos(List<Inventory> list);

    Inventory inventoryHistory2invertory(InventoryHistory it);
}
