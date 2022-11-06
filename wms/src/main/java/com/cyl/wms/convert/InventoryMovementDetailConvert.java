package com.cyl.wms.convert;

import com.cyl.wms.domain.InventoryHistory;
import org.mapstruct.Mapper;
import com.cyl.wms.domain.InventoryMovementDetail;
import com.cyl.wms.pojo.dto.InventoryMovementDetailDTO;
import com.cyl.wms.pojo.vo.InventoryMovementDetailVO;
import org.mapstruct.Mapping;

import java.util.List;

/**
 * 库存移动详情  DO <=> DTO <=> VO / BO / Query
 *
 * @author zcc
 */
@Mapper(componentModel = "spring")
public interface InventoryMovementDetailConvert {

  /**
   * @param source DO
   * @return DTO
   */
  InventoryMovementDetailDTO do2dto(InventoryMovementDetail source);

  /**
   * @param source DTO
   * @return DO
   */
  InventoryMovementDetail dto2do(InventoryMovementDetailDTO source);

  List<InventoryMovementDetailVO> dos2vos(List<InventoryMovementDetail> list);

  List<InventoryMovementDetail> vos2dos(List<InventoryMovementDetailVO> details);

  @Mapping(target = "quantity", source = "realQuantity")
  InventoryHistory do2InventoryHistory(InventoryMovementDetailVO it);
}
