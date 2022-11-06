package com.cyl.wms.convert;

import org.mapstruct.Mapper;
import com.cyl.wms.domain.Supplier;
import com.cyl.wms.pojo.dto.SupplierDTO;
import com.cyl.wms.pojo.vo.SupplierVO;
import java.util.List;
/**
 * 供应商  DO <=> DTO <=> VO / BO / Query
 *
 * @author zcc
 */
@Mapper(componentModel = "spring")
public interface SupplierConvert  {

    /**
     * @param source DO
     * @return DTO
     */
    SupplierDTO do2dto(Supplier source);

    /**
     * @param source DTO
     * @return DO
     */
    Supplier dto2do(SupplierDTO source);

    List<SupplierVO> dos2vos(List<Supplier> list);
}
