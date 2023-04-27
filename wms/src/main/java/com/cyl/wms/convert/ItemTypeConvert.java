package com.cyl.wms.convert;

import org.mapstruct.Mapper;
import com.cyl.wms.domain.ItemType;
import com.cyl.wms.pojo.dto.ItemTypeDTO;
import com.cyl.wms.pojo.vo.ItemTypeVO;
import java.util.List;
/**
 * 物料类型表  DO <=> DTO <=> VO / BO / Query
 *
 * @author zcc
 */
@Mapper(componentModel = "spring")
public interface ItemTypeConvert  {

    /**
     * @param source DO
     * @return DTO
     */
    ItemTypeDTO do2dto(ItemType source);

    /**
     * @param source DTO
     * @return DO
     */
    ItemType dto2do(ItemTypeDTO source);

    List<ItemTypeVO> dos2vos(List<ItemType> list);
}
