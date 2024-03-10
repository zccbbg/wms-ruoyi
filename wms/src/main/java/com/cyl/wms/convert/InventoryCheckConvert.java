package com.cyl.wms.convert;

import com.cyl.wms.domain.form.InventoryCheckFrom;
import org.mapstruct.Mapper;
import com.cyl.wms.domain.entity.InventoryCheck;
import com.cyl.wms.domain.vo.InventoryCheckVO;
import java.util.List;
/**
 * 库存盘点单据  ENTITY <=> VO / Form / Query
 *
 * @author zcc
 */
@Mapper(componentModel = "spring")
public interface InventoryCheckConvert  {
    List<InventoryCheckVO> dos2vos(List<InventoryCheck> list);

    InventoryCheckFrom do2form(InventoryCheck inventoryCheck);
}
