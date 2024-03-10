package com.cyl.wms.convert;

import com.cyl.wms.domain.form.InventoryMovementFrom;
import org.mapstruct.Mapper;
import com.cyl.wms.domain.entity.InventoryMovement;
import com.cyl.wms.domain.vo.InventoryMovementVO;
import java.util.List;
/**
 * 库存移动  ENTITY <=> VO / Form / Query
 *
 * @author zcc
 */
@Mapper(componentModel = "spring")
public interface InventoryMovementConvert  {
    List<InventoryMovementVO> dos2vos(List<InventoryMovement> list);

    InventoryMovementFrom do2form(InventoryMovement order);
}
