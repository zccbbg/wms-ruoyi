package com.cyl.wms.convert;

import org.mapstruct.Mapper;
import com.cyl.wms.domain.entity.Supplier;
import com.cyl.wms.domain.vo.SupplierVO;
import java.util.List;
/**
 * 供应商  ENTITY <=> VO / Form / Query
 *
 * @author zcc
 */
@Mapper(componentModel = "spring")
public interface SupplierConvert  {
    List<SupplierVO> dos2vos(List<Supplier> list);
}
