package com.cyl.wms.convert;

import com.cyl.wms.domain.InventorySettlement;
import com.cyl.wms.pojo.dto.InventorySettlementDTO;
import com.cyl.wms.pojo.vo.InventorySettlementVO;
import com.cyl.wms.pojo.vo.form.InventorySettlementFrom;
import org.mapstruct.Mapper;

import java.util.List;
/**
 * 库存结算单  DO <=> DTO <=> VO / BO / Query
 *
 * @author zcc
 */
@Mapper(componentModel = "spring")
public interface InventorySettlementConvert  {

    /**
     * @param source DO
     * @return DTO
     */
    InventorySettlementDTO do2dto(InventorySettlement source);

    /**
     * @param source DTO
     * @return DO
     */
    InventorySettlement dto2do(InventorySettlementDTO source);

    List<InventorySettlementVO> dos2vos(List<InventorySettlement> list);

    InventorySettlementFrom do2form(InventorySettlement inventorySettlement);
}
