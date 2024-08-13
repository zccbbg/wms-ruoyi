package com.ruoyi.common.core.constant;

public class ServiceConstants {
    /**
     * 入库单状态
     */
    public class ReceiptOrderStatus {
        public static final Integer INVALID = -1;
        public static final Integer PENDING = 0;
        public static final Integer FINISH = 1;
    }

    /**
     * 入库记录类型
     */
    public class InventoryDetailType{
        public static final Integer RECEIPT = 1;
        public static final Integer MOVEMENT = 2;
        public static final Integer CHECK = 3;

    }

    /**
     * 出库单状态
     */
    public class ShipmentOrderStatus {
        public static final Integer INVALID = -1;
        public static final Integer PENDING = 0;
        public static final Integer FINISH = 1;
    }

    /**
     * 库存记录操作类型
     */
    public class InventoryHistoryOrderType {
        public static final Integer RECEIPT = 1;
        public static final Integer SHIPMENT = 2;
        public static final Integer MOVEMENT = 3;
        public static final Integer CHECK = 4;
    }

    /**
     * 移库单状态
     */
    public class MovementOrderStatus {
        public static final Integer INVALID = -1;
        public static final Integer PENDING = 0;
        public static final Integer FINISH = 1;
    }

    /**
     * 盘库单状态
     */
    public class CheckOrderStatus {
        public static final Integer INVALID = -1;
        public static final Integer PENDING = 0;
        public static final Integer FINISH = 1;
    }
}
