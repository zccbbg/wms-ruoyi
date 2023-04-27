package com.cyl.wms.convert;

import com.cyl.wms.domain.InventoryHistory;
import org.mapstruct.Mapper;
import com.cyl.wms.domain.InventoryCheckDetail;
import com.cyl.wms.pojo.dto.InventoryCheckDetailDTO;
import com.cyl.wms.pojo.vo.InventoryCheckDetailVO;
import java.util.List;
/**
 * 库存盘点单据详情  DO <=> DTO <=> VO / BO / Query
 *
 * @author zcc
 */
@Mapper(componentModel = "spring")
public interface InventoryCheckDetailConvert  {

    /**
     * @param source DO
     * @return DTO
     */
    InventoryCheckDetailDTO do2dto(InventoryCheckDetail source);

    /**
     * @param source DTO
     * @return DO
     */
    InventoryCheckDetail dto2do(InventoryCheckDetailDTO source);

    List<InventoryCheckDetailVO> dos2vos(List<InventoryCheckDetail> list);

    List<InventoryCheckDetail> vos2dos(List<InventoryCheckDetailVO> details);

    InventoryHistory vo2InventoryHistory(InventoryCheckDetailVO it);
}
