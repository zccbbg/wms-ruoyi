package com.cyl.wms.convert;

import org.mapstruct.Mapper;
import com.cyl.wms.domain.Customer;
import com.cyl.wms.pojo.dto.CustomerDTO;
import com.cyl.wms.pojo.vo.CustomerVO;
import java.util.List;
/**
 * 客户  DO <=> DTO <=> VO / BO / Query
 *
 * @author zcc
 */
@Mapper(componentModel = "spring")
public interface CustomerConvert  {

    /**
     * @param source DO
     * @return DTO
     */
    CustomerDTO do2dto(Customer source);

    /**
     * @param source DTO
     * @return DO
     */
    Customer dto2do(CustomerDTO source);

    List<CustomerVO> dos2vos(List<Customer> list);
}
