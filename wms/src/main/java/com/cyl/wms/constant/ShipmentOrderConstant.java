package com.cyl.wms.constant;

public interface ShipmentOrderConstant {

  // 未出库
  int NOT_IN = 11;
  // 部分出库
  int PART_IN = 12;
  // 全部出库
  int ALL_IN = 13;
  // 作废
  int DROP = 14;

  /*订单类型*/
  int SALE = 11;
  int OUTSOURCING = 12;
  int RANSFER = 13;
  //部门领料出库
  int DEPT = 14;
  //盘亏出库
  int CHECK_OUT = 31;
}
