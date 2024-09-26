package com.ruoyi.wms.domain.vo;

import com.alibaba.excel.annotation.ExcelIgnoreUnannotated;
import com.ruoyi.wms.domain.entity.ShipmentOrderDetail;
import io.github.linpeilie.annotations.AutoMapper;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * 出库单详情视图对象 wms_shipment_order_detail
 *
 * @author zcc
 * @date 2024-08-01
 */
@Data
@EqualsAndHashCode(callSuper = true)
@ExcelIgnoreUnannotated
@AutoMapper(target = ShipmentOrderDetail.class)
public class ShipmentOrderDetailVo extends BaseOrderDetailVo{


}
