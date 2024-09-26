package com.ruoyi.wms.domain.vo;

import com.alibaba.excel.annotation.ExcelIgnoreUnannotated;
import com.ruoyi.wms.domain.entity.ShipmentOrder;
import io.github.linpeilie.annotations.AutoMapper;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * 出库单视图对象 wms_shipment_order
 *
 * @author zcc
 * @date 2024-08-01
 */
@Data
@EqualsAndHashCode(callSuper = true)
@ExcelIgnoreUnannotated
@AutoMapper(target = ShipmentOrder.class)
public class ShipmentOrderVo extends BaseOrderVo<ShipmentOrderDetailVo>{

}
