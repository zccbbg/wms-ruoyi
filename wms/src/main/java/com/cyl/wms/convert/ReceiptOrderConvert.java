package com.cyl.wms.convert;

import com.cyl.wms.domain.form.ReceiptOrderForm;
import org.mapstruct.Mapper;
import com.cyl.wms.domain.entity.ReceiptOrder;
import com.cyl.wms.domain.vo.ReceiptOrderVO;
import java.util.List;
/**
 * 入库单  ENTITY <=> VO / Form / Query
 *
 * @author zcc
 */
@Mapper(componentModel = "spring")
public interface ReceiptOrderConvert  {
    List<ReceiptOrderVO> dos2vos(List<ReceiptOrder> list);

    ReceiptOrderForm do2form(ReceiptOrder bean);
}
