package com.cyl.wms.convert;

import com.cyl.wms.pojo.vo.form.InventoryCheckFrom;
import org.mapstruct.Mapper;
import com.cyl.wms.domain.InventoryCheck;
import com.cyl.wms.pojo.dto.InventoryCheckDTO;
import com.cyl.wms.pojo.vo.InventoryCheckVO;
import java.util.List;
/**
 * 库存盘点单据  DO <=> DTO <=> VO / BO / Query
 *
 * @author zcc
 */
@Mapper(componentModel = "spring")
public interface InventoryCheckConvert  {

    /**
     * @param source DO
     * @return DTO
     */
    InventoryCheckDTO do2dto(InventoryCheck source);

    /**
     * @param source DTO
     * @return DO
     */
    InventoryCheck dto2do(InventoryCheckDTO source);

    List<InventoryCheckVO> dos2vos(List<InventoryCheck> list);

    InventoryCheckFrom do2form(InventoryCheck inventoryCheck);
}
