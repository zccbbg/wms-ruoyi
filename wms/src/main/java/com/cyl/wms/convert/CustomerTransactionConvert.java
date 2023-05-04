package com.cyl.wms.convert;

import org.mapstruct.Mapper;
import com.cyl.wms.domain.CustomerTransaction;
import com.cyl.wms.pojo.dto.CustomerTransactionDTO;
import com.cyl.wms.pojo.vo.CustomerTransactionVO;
import java.util.List;
/**
 * 客户账户流水  DO <=> DTO <=> VO / BO / Query
 *
 * @author zcc
 */
@Mapper(componentModel = "spring")
public interface CustomerTransactionConvert  {

    /**
     * @param source DO
     * @return DTO
     */
    CustomerTransactionDTO do2dto(CustomerTransaction source);

    /**
     * @param source DTO
     * @return DO
     */
    CustomerTransaction dto2do(CustomerTransactionDTO source);

    List<CustomerTransactionVO> dos2vos(List<CustomerTransaction> list);
}
