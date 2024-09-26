package com.ruoyi.wms.domain.vo;

import com.alibaba.excel.annotation.ExcelIgnoreUnannotated;
import com.ruoyi.wms.domain.entity.ReceiptOrderDetail;
import io.github.linpeilie.annotations.AutoMapper;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * 入库单详情视图对象 wms_receipt_order_detail
 *
 * @author zcc
 * @date 2024-07-19
 */
@Data
@EqualsAndHashCode(callSuper = true)
@ExcelIgnoreUnannotated
@AutoMapper(target = ReceiptOrderDetail.class)
public class ReceiptOrderDetailVo extends BaseOrderDetailVo{

}
