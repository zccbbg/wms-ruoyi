package com.cyl.wms.convert;

import com.cyl.wms.domain.InventoryHistory;
import org.mapstruct.Mapper;
import com.cyl.wms.domain.Inventory;
import com.cyl.wms.pojo.dto.InventoryDTO;
import com.cyl.wms.pojo.vo.InventoryVO;
import java.util.List;
/**
 * 库存  DO <=> DTO <=> VO / BO / Query
 *
 * @author zcc
 */
@Mapper(componentModel = "spring")
public interface InventoryConvert  {

    /**
     * @param source DO
     * @return DTO
     */
    InventoryDTO do2dto(Inventory source);

    /**
     * @param source DTO
     * @return DO
     */
    Inventory dto2do(InventoryDTO source);

    List<InventoryVO> dos2vos(List<Inventory> list);

    Inventory inventoryHistory2invertory(InventoryHistory it);
}
