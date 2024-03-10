package com.cyl.wms.convert;

import com.cyl.wms.domain.entity.InventoryHistory;
import org.mapstruct.Mapper;
import com.cyl.wms.domain.entity.InventoryMovementDetail;
import com.cyl.wms.domain.vo.InventoryMovementDetailVO;
import org.mapstruct.Mapping;

import java.util.List;
/**
 * 库存移动详情  ENTITY <=> VO / Form / Query
 *
 * @author zcc
 */
@Mapper(componentModel = "spring")
public interface InventoryMovementDetailConvert  {
    List<InventoryMovementDetailVO> dos2vos(List<InventoryMovementDetail> list);

    List<InventoryMovementDetail> vos2dos(List<InventoryMovementDetailVO> details);

    @Mapping(target = "quantity", source = "realQuantity")
    InventoryHistory do2InventoryHistory(InventoryMovementDetailVO it);
}
