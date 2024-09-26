package com.ruoyi.wms.domain.bo;

import com.ruoyi.wms.domain.entity.ShipmentOrderDetail;
import io.github.linpeilie.annotations.AutoMapper;
import io.github.linpeilie.annotations.AutoMappers;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * 出库单详情业务对象 wms_shipment_order_detail
 *
 * @author zcc
 * @date 2024-08-01
 */

@Data
@EqualsAndHashCode(callSuper = true)
@AutoMappers({
    @AutoMapper(target = ShipmentOrderDetail.class, reverseConvertGenerate = false),
    @AutoMapper(target = InventoryBo.class, reverseConvertGenerate = false)
})
public class ShipmentOrderDetailBo extends BaseOrderDetailBo{

}
