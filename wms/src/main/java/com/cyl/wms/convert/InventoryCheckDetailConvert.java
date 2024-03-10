package com.cyl.wms.convert;

import com.cyl.wms.domain.entity.InventoryHistory;
import org.mapstruct.Mapper;
import com.cyl.wms.domain.entity.InventoryCheckDetail;
import com.cyl.wms.domain.vo.InventoryCheckDetailVO;
import java.util.List;
/**
 * 库存盘点单据详情  ENTITY <=> VO / Form / Query
 *
 * @author zcc
 */
@Mapper(componentModel = "spring")
public interface InventoryCheckDetailConvert  {
    List<InventoryCheckDetailVO> dos2vos(List<InventoryCheckDetail> list);

    List<InventoryCheckDetail> vos2dos(List<InventoryCheckDetailVO> details);

    InventoryHistory vo2InventoryHistory(InventoryCheckDetailVO it);
}
