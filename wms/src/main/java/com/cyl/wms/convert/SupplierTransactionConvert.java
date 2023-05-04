package com.cyl.wms.convert;

import org.mapstruct.Mapper;
import com.cyl.wms.domain.SupplierTransaction;
import com.cyl.wms.pojo.dto.SupplierTransactionDTO;
import com.cyl.wms.pojo.vo.SupplierTransactionVO;
import java.util.List;
/**
 * 供应商账户流水  DO <=> DTO <=> VO / BO / Query
 *
 * @author zcc
 */
@Mapper(componentModel = "spring")
public interface SupplierTransactionConvert  {

    /**
     * @param source DO
     * @return DTO
     */
    SupplierTransactionDTO do2dto(SupplierTransaction source);

    /**
     * @param source DTO
     * @return DO
     */
    SupplierTransaction dto2do(SupplierTransactionDTO source);

    List<SupplierTransactionVO> dos2vos(List<SupplierTransaction> list);
}
