package com.cyl.wms.convert;

import com.cyl.wms.domain.entity.InventoryHistory;
import org.mapstruct.Mapper;
import com.cyl.wms.domain.entity.ShipmentOrderDetail;
import com.cyl.wms.domain.vo.ShipmentOrderDetailVO;
import org.apache.commons.lang3.SerializationUtils;
import org.mapstruct.Mapping;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
/**
 * 出库单详情  ENTITY <=> VO / Form / Query
 *
 * @author zcc
 */
@Mapper(componentModel = "spring")
public interface ShipmentOrderDetailConvert  {
    List<ShipmentOrderDetailVO> dos2vos(List<ShipmentOrderDetail> list);

    List<ShipmentOrderDetail> vos2dos(List<ShipmentOrderDetailVO> details);

    @Mapping(target = "quantity", source = "realQuantity")
    InventoryHistory do2InventoryHistory(ShipmentOrderDetailVO it);

    /*
     * 深拷贝
     * @param original 原始集合
     * @return 拷贝后的集合
     * */
    default Collection<ShipmentOrderDetailVO> copyList(Collection<ShipmentOrderDetailVO> original) {
        List<ShipmentOrderDetailVO> deepCopy = new ArrayList<>();

        for (ShipmentOrderDetailVO element : original) {
            byte[] serializedObject = SerializationUtils.serialize(element);
            ShipmentOrderDetailVO clonedElement = SerializationUtils.deserialize(serializedObject);
            deepCopy.add(clonedElement);
        }

        return deepCopy;
    }
}
