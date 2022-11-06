package com.cyl.wms.convert;

import com.cyl.wms.pojo.vo.form.InventoryMovementFrom;
import org.mapstruct.Mapper;
import com.cyl.wms.domain.InventoryMovement;
import com.cyl.wms.pojo.dto.InventoryMovementDTO;
import com.cyl.wms.pojo.vo.InventoryMovementVO;

import java.util.List;

/**
 * 库存移动  DO <=> DTO <=> VO / BO / Query
 *
 * @author zcc
 */
@Mapper(componentModel = "spring")
public interface InventoryMovementConvert {

  /**
   * @param source DO
   * @return DTO
   */
  InventoryMovementDTO do2dto(InventoryMovement source);

  /**
   * @param source DTO
   * @return DO
   */
  InventoryMovement dto2do(InventoryMovementDTO source);

  List<InventoryMovementVO> dos2vos(List<InventoryMovement> list);

  InventoryMovementFrom do2form(InventoryMovement order);
}
