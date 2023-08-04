package com.cyl.wms.constant;

public interface ReceiptOrderConstant {
    // 未入库
    int NOT_IN = 0;
    // 在途
    int IN_PATH = 1;
    // 部分入库
    int PART_IN = 2;
    // 全部入库
    int ALL_IN = 3;
    // 作废
    int DROP = 2;

    /*订单类型*/
    //采购
    int PURCHASE = 1;
    //外协
    int OUTSOURCING = 2;
    //退货
    int RETURN = 3;
    //盘盈入库
    int CHECK_IN = 32;
}
