package com.ruoyi.wms.domain.bo;

import com.ruoyi.wms.domain.entity.ReceiptOrder;
import com.ruoyi.common.core.validate.AddGroup;
import com.ruoyi.common.core.validate.EditGroup;
import com.ruoyi.common.mybatis.core.domain.BaseEntity;
import lombok.Data;
import lombok.EqualsAndHashCode;
import jakarta.validation.constraints.*;
import io.github.linpeilie.annotations.AutoMapper;

import java.math.BigDecimal;

/**
 * 入库单业务对象 wms_receipt_order
 *
 * @author zcc
 * @date 2024-07-19
 */

@Data
@EqualsAndHashCode(callSuper = true)
@AutoMapper(target = ReceiptOrder.class, reverseConvertGenerate = false)
public class ReceiptOrderBo extends BaseEntity {

    /**
     * 
     */
    @NotNull(message = "不能为空", groups = { EditGroup.class })
    private Long id;

    /**
     * 入库单号
     */
    @NotBlank(message = "入库单号不能为空", groups = { AddGroup.class, EditGroup.class })
    private String receiptOrderNo;

    /**
     * 入库类型
     */
    @NotNull(message = "入库类型不能为空", groups = { AddGroup.class, EditGroup.class })
    private Long receiptOrderType;

    /**
     * 供应商
     */
    @NotNull(message = "供应商不能为空", groups = { AddGroup.class, EditGroup.class })
    private Long merchantId;

    /**
     * 订单号
     */
    @NotBlank(message = "订单号不能为空", groups = { AddGroup.class, EditGroup.class })
    private String orderNo;

    /**
     * 订单金额
     */
    @NotNull(message = "订单金额不能为空", groups = { AddGroup.class, EditGroup.class })
    private BigDecimal payableAmount;

    /**
     * 入库状态
     */
    @NotNull(message = "入库状态不能为空", groups = { AddGroup.class, EditGroup.class })
    private Integer receiptOrderStatus;

    /**
     * 备注
     */
    @NotBlank(message = "备注不能为空", groups = { AddGroup.class, EditGroup.class })
    private String remark;


}
