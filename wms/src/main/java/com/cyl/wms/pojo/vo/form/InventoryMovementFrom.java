package com.cyl.wms.pojo.vo.form;

import com.cyl.wms.domain.InventoryMovement;
import com.cyl.wms.pojo.vo.InventoryMovementDetailVO;
import com.cyl.wms.pojo.vo.ItemVO;
import lombok.Data;

import java.util.List;

@Data
public class InventoryMovementFrom extends InventoryMovement {
  // 详情
  private List<InventoryMovementDetailVO> details;
  // 所有商品
  private List<ItemVO> items;
}
