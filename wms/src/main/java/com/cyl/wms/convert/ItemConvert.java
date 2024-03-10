package com.cyl.wms.convert;

import org.mapstruct.Mapper;
import com.cyl.wms.domain.entity.Item;
import com.cyl.wms.domain.vo.ItemVO;
import java.util.List;
/**
 * 物料  ENTITY <=> VO / Form / Query
 *
 * @author zcc
 */
@Mapper(componentModel = "spring")
public interface ItemConvert  {
    List<ItemVO> dos2vos(List<Item> list);

    ItemVO toVo(Item source);
}
