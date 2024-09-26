package com.ruoyi.wms.domain.bo;

import com.ruoyi.wms.domain.entity.CheckOrder;
import io.github.linpeilie.annotations.AutoMapper;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * 库存盘点单据业务对象 wms_check_order
 *
 * @author zcc
 * @date 2024-08-13
 */

@Data
@EqualsAndHashCode(callSuper = true)
@AutoMapper(target = CheckOrder.class, reverseConvertGenerate = false)
public class CheckOrderBo extends BaseOrderBo<CheckOrderDetailBo> {

}
