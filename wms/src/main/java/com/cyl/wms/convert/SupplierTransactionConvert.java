package com.cyl.wms.convert;

import org.mapstruct.Mapper;
import com.cyl.wms.domain.entity.SupplierTransaction;
import com.cyl.wms.domain.vo.SupplierTransactionVO;
import java.util.List;
/**
 * 供应商账户流水  ENTITY <=> VO / Form / Query
 *
 * @author zcc
 */
@Mapper(componentModel = "spring")
public interface SupplierTransactionConvert  {
    List<SupplierTransactionVO> dos2vos(List<SupplierTransaction> list);
}
