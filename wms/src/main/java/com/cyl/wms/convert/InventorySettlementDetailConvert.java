package com.cyl.wms.convert;

import com.cyl.wms.domain.InventorySettlementDetail;
import com.cyl.wms.pojo.dto.InventorySettlementDetailDTO;
import com.cyl.wms.pojo.vo.InventorySettlementDetailVO;
import org.mapstruct.Mapper;

import java.util.List;
/**
 * 库存结算明细  DO <=> DTO <=> VO / BO / Query
 *
 * @author zcc
 */
@Mapper(componentModel = "spring")
public interface InventorySettlementDetailConvert  {

    /**
     * @param source DO
     * @return DTO
     */
    InventorySettlementDetailDTO do2dto(InventorySettlementDetail source);

    /**
     * @param source DTO
     * @return DO
     */
    InventorySettlementDetail dto2do(InventorySettlementDetailDTO source);

    List<InventorySettlementDetailVO> dos2vos(List<InventorySettlementDetail> list);

    List<InventorySettlementDetail> vos2dos(List<InventorySettlementDetailVO> details);

    List<InventorySettlementDetailVO> toVos(List<InventorySettlementDetail> inventoryCheckDetails);
}
