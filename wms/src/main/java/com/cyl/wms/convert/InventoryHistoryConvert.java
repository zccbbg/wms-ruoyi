package com.cyl.wms.convert;

import org.mapstruct.Mapper;
import com.cyl.wms.domain.InventoryHistory;
import com.cyl.wms.pojo.dto.InventoryHistoryDTO;
import com.cyl.wms.pojo.vo.InventoryHistoryVO;
import java.util.List;
/**
 * 库存记录  DO <=> DTO <=> VO / BO / Query
 *
 * @author zcc
 */
@Mapper(componentModel = "spring")
public interface InventoryHistoryConvert  {

    /**
     * @param source DO
     * @return DTO
     */
    InventoryHistoryDTO do2dto(InventoryHistory source);

    /**
     * @param source DTO
     * @return DO
     */
    InventoryHistory dto2do(InventoryHistoryDTO source);

    List<InventoryHistoryVO> dos2vos(List<InventoryHistory> list);
}
