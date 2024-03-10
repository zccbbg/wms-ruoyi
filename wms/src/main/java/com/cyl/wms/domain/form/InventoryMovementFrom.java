package com.cyl.wms.domain.form;

import com.cyl.wms.domain.entity.InventoryMovement;
import com.cyl.wms.domain.vo.InventoryMovementDetailVO;
import com.cyl.wms.domain.vo.ItemVO;
import lombok.Data;

import java.util.List;

@Data
public class InventoryMovementFrom extends InventoryMovement {
  // 详情
  private List<InventoryMovementDetailVO> details;
  // 所有商品
  private List<ItemVO> items;
}
