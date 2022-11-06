package com.cyl.wms.constant;

public interface InventoryMovementConstant {
  // 未操作
  int NOT_IN = 21;
  // 部分移动
  int PART_IN = 22;
  // 移动完毕
  int ALL_IN = 23;
  // 作废
  int DROP = 24;


  //调拨出库
  int OUT_TYPE = 21;
  //调拨入库
  int IN_TYPE = 22;
}
