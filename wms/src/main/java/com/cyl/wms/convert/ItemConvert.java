package com.cyl.wms.convert;

import org.mapstruct.Mapper;
import com.cyl.wms.domain.Item;
import com.cyl.wms.pojo.dto.ItemDTO;
import com.cyl.wms.pojo.vo.ItemVO;
import java.util.List;
/**
 * 物料  DO <=> DTO <=> VO / BO / Query
 *
 * @author zcc
 */
@Mapper(componentModel = "spring")
public interface ItemConvert  {

    /**
     * @param source DO
     * @return DTO
     */
    ItemDTO do2dto(Item source);

    /**
     * @param source DTO
     * @return DO
     */
    Item dto2do(ItemDTO source);

    /**
     * @param source DO
     * @return VO
     */
    ItemVO toVo(Item source);

    List<ItemVO> dos2vos(List<Item> list);
}
