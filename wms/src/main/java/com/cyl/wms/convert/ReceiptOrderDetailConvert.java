package com.cyl.wms.convert;

import com.cyl.wms.domain.InventoryHistory;
import com.cyl.wms.domain.ReceiptOrderDetail;
import com.cyl.wms.pojo.dto.ReceiptOrderDetailDTO;
import com.cyl.wms.pojo.vo.ReceiptOrderDetailVO;
import org.mapstruct.Mapper;
import org.mapstruct.Mapping;

import java.util.List;

/**
 * 入库单详情  DO <=> DTO <=> VO / BO / Query
 *
 * @author zcc
 */
@Mapper(componentModel = "spring")
public interface ReceiptOrderDetailConvert {

    /**
     * @param source DO
     * @return DTO
     */
    ReceiptOrderDetailDTO do2dto(ReceiptOrderDetail source);

    /**
     * @param source DTO
     * @return DO
     */
    ReceiptOrderDetail dto2do(ReceiptOrderDetailDTO source);

    /**
     * @param source DO
     * @return VO
     */
    ReceiptOrderDetailVO toVo(ReceiptOrderDetail source);

    List<ReceiptOrderDetailVO> dos2vos(List<ReceiptOrderDetail> list);

    List<ReceiptOrderDetail> vos2dos(List<ReceiptOrderDetailVO> details);

    @Mapping(target = "quantity", source = "realQuantity")
    InventoryHistory do2InventoryHistory(ReceiptOrderDetailVO it);
}
