package com.cyl.wms.convert;

import org.mapstruct.Mapper;
import com.cyl.wms.domain.entity.CustomerTransaction;
import com.cyl.wms.domain.vo.CustomerTransactionVO;
import java.util.List;
/**
 * 客户账户流水  ENTITY <=> VO / Form / Query
 *
 * @author zcc
 */
@Mapper(componentModel = "spring")
public interface CustomerTransactionConvert  {
    List<CustomerTransactionVO> dos2vos(List<CustomerTransaction> list);
}
