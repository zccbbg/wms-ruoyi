package com.cyl.wms.pojo.vo.form;

import com.cyl.wms.domain.ReceiptOrder;
import com.cyl.wms.pojo.vo.ItemVO;
import com.cyl.wms.pojo.vo.ReceiptOrderDetailVO;
import lombok.Data;

import java.util.List;

@Data
public class ReceiptOrderForm extends ReceiptOrder {
    // 入库单详情
    private List<ReceiptOrderDetailVO> details;
    // 所有商品
    private List<ItemVO> items;
}
