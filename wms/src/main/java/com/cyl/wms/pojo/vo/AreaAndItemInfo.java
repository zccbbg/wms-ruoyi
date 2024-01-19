package com.cyl.wms.pojo.vo;

import java.math.BigDecimal;

public interface AreaAndItemInfo extends PlaceAndItem {
    void setItemName(String name);

    void setWarehouseName(String name);

    void setAreaName(String name);

    void setRackName(String name);

    void setItemNo(String name);


    default void setItemUnit(String unit){}

    default void setItemUnitPrice(String money) {}

    default void setItemSpecification(String specification) {}

    default void setItemFactory(String factory){}

    default void setName(String name){}

    default void setOrderId(String orderId){}

    default void setItemDelFlag(Integer delFlag) {

    }

    default void setWarehouseDelFlag(Integer delFlag) {

    }

    default void setSafetyQuantity(BigDecimal safetyQuantity) {}
}
