package com.ruoyi.wms.domain.bo;

import com.ruoyi.common.core.validate.AddGroup;
import com.ruoyi.common.core.validate.EditGroup;
import com.ruoyi.wms.domain.entity.CheckOrderDetail;
import io.github.linpeilie.annotations.AutoMapper;
import jakarta.validation.constraints.NotNull;
import lombok.Data;
import lombok.EqualsAndHashCode;

import java.math.BigDecimal;

/**
 * 库存盘点单据详情业务对象 wms_check_order_detail
 *
 * @author zcc
 * @date 2024-08-13
 */

@Data
@EqualsAndHashCode(callSuper = true)
@AutoMapper(target = CheckOrderDetail.class, reverseConvertGenerate = false)
public class CheckOrderDetailBo extends BaseOrderDetailBo {

    /**
     * 盘点数量
     */
    private BigDecimal checkQuantity;

    /**
     * 盈亏数
     */
    private BigDecimal profitAndLoss;

    /**
     * 库存id
     */
    private Long inventoryId;

    /**
     * 有盈亏
     */
    private Boolean haveProfitAndLoss;
}
