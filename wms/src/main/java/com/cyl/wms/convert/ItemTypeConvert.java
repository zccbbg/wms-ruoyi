package com.cyl.wms.convert;

import org.mapstruct.Mapper;
import com.cyl.wms.domain.entity.ItemType;
import com.cyl.wms.domain.vo.ItemTypeVO;
import java.util.List;
/**
 * 物料类型表  ENTITY <=> VO / Form / Query
 *
 * @author zcc
 */
@Mapper(componentModel = "spring")
public interface ItemTypeConvert  {
    List<ItemTypeVO> dos2vos(List<ItemType> list);
}
