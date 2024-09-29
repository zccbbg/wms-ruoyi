package com.ruoyi.wms.domain.bo;

import com.ruoyi.wms.domain.entity.Inventory;
import com.ruoyi.wms.domain.entity.ReceiptOrderDetail;
import io.github.linpeilie.annotations.AutoMapper;
import io.github.linpeilie.annotations.AutoMappers;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * 入库单详情业务对象 wms_receipt_order_detail
 *
 * @author zcc
 * @date 2024-07-19
 */

@Data
@EqualsAndHashCode(callSuper = true)
@AutoMappers({
    @AutoMapper(target = ReceiptOrderDetail.class, reverseConvertGenerate = false),
    @AutoMapper(target = Inventory.class, reverseConvertGenerate = false)
})
public class ReceiptOrderDetailBo extends BaseOrderDetailBo {


}
