package com.cyl.wms.convert;

import org.mapstruct.Mapper;
import com.cyl.wms.domain.entity.Customer;
import com.cyl.wms.domain.vo.CustomerVO;
import java.util.List;
/**
 * 客户  ENTITY <=> VO / Form / Query
 *
 * @author zcc
 */
@Mapper(componentModel = "spring")
public interface CustomerConvert  {
    List<CustomerVO> dos2vos(List<Customer> list);
}
