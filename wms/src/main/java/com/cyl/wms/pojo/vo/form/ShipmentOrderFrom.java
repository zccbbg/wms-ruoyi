package com.cyl.wms.pojo.vo.form;

import com.cyl.wms.domain.ShipmentOrder;
import com.cyl.wms.domain.ShipmentOrderDetail;
import com.cyl.wms.pojo.vo.ItemVO;
import com.cyl.wms.pojo.vo.ShipmentOrderDetailVO;
import lombok.Data;

import java.util.List;

@Data
public class ShipmentOrderFrom extends ShipmentOrder {
  // 出库单详情
  private List<ShipmentOrderDetailVO> details;
  // 所有商品
  private List<ItemVO> items;
}
