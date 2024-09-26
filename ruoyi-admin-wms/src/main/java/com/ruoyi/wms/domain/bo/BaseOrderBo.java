package com.ruoyi.wms.domain.bo;

import com.ruoyi.common.core.validate.AddGroup;
import com.ruoyi.common.core.validate.EditGroup;
import com.ruoyi.common.mybatis.core.domain.BaseEntity;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import lombok.Data;

import java.math.BigDecimal;
import java.util.List;

@Data
public class BaseOrderBo<T extends BaseOrderDetailBo> extends BaseEntity {
    /**
     *
     */
    @NotNull(message = "不能为空", groups = { EditGroup.class })
    private Long id;

    /**
     * 业务单号
     */
    @NotBlank(message = "入库业务单号单号不能为空", groups = { AddGroup.class, EditGroup.class })
    private String bizOrderNo;

    /**
     * 入库类型
     */
    @NotNull(message = "订单类型不能为空", groups = { AddGroup.class, EditGroup.class })
    private Long orderType;

    /**
     * 供应商
     */
    private Long merchantId;

    /**
     * 订单号
     */
    private String orderNo;

    /**
     * 商品总数
     */
    private BigDecimal totalQuantity;

    /**
     * 订单金额
     */
    private BigDecimal amount;

    /**
     * 订单状态
     */
    private Integer orderStatus;

    /**
     * 仓库id
     */
    @NotNull(message = "仓库不能为空", groups = { AddGroup.class, EditGroup.class })
    private Long warehouseId;

    /**
     * 备注
     */
    private String remark;

    /**
     * 商品信息
     */
    private List<T> details;
}
