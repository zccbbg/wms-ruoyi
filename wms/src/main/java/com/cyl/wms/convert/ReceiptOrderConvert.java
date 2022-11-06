package com.cyl.wms.convert;

import com.cyl.wms.pojo.vo.form.ReceiptOrderForm;
import org.mapstruct.Mapper;
import com.cyl.wms.domain.ReceiptOrder;
import com.cyl.wms.pojo.dto.ReceiptOrderDTO;
import com.cyl.wms.pojo.vo.ReceiptOrderVO;
import java.util.List;
/**
 * 入库单  DO <=> DTO <=> VO / BO / Query
 *
 * @author zcc
 */
@Mapper(componentModel = "spring")
public interface ReceiptOrderConvert  {

    /**
     * @param source DO
     * @return DTO
     */
    ReceiptOrderDTO do2dto(ReceiptOrder source);

    /**
     * @param source DTO
     * @return DO
     */
    ReceiptOrder dto2do(ReceiptOrderDTO source);

    List<ReceiptOrderVO> dos2vos(List<ReceiptOrder> list);

    ReceiptOrderForm do2form(ReceiptOrder bean);
}
