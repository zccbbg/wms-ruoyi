package com.cyl.wms.domain.form;

import com.cyl.wms.domain.entity.ReceiptOrder;
import com.cyl.wms.domain.vo.ItemVO;
import com.cyl.wms.domain.vo.ReceiptOrderDetailVO;
import lombok.Data;

import java.util.List;

@Data
public class ReceiptOrderForm extends ReceiptOrder {
    // 入库单详情
    private List<ReceiptOrderDetailVO> details;
    // 所有商品
    private List<ItemVO> items;
}
