package com.ruoyi.wms.domain.vo;

import com.alibaba.excel.annotation.ExcelIgnoreUnannotated;
import com.ruoyi.wms.domain.entity.ReceiptOrder;
import io.github.linpeilie.annotations.AutoMapper;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * 入库单视图对象 wms_receipt_order
 *
 * @author zcc
 * @date 2024-07-19
 */
@Data
@EqualsAndHashCode(callSuper = true)
@ExcelIgnoreUnannotated
@AutoMapper(target = ReceiptOrder.class)
public class ReceiptOrderVo extends BaseOrderVo<ReceiptOrderDetailVo> {

}
