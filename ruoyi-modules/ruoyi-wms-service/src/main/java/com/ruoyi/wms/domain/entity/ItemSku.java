package com.ruoyi.wms.domain.entity;

import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableLogic;
import com.baomidou.mybatisplus.annotation.TableName;
import com.ruoyi.common.mybatis.core.domain.BaseEntity;
import lombok.Data;
import lombok.EqualsAndHashCode;

import java.io.Serial;
import java.math.BigDecimal;
import java.util.Date;

@Data
@EqualsAndHashCode(callSuper = true)
@TableName("wms_item_sku")
public class ItemSku extends BaseEntity {

    @Serial
    private static final long serialVersionUID = 1L;

    /**
     *
     */
    @TableId(value = "id")
    private Long id;

    /**
     * 规格名称
     */
    private String skuName;

    /**
     *
     */
    private Long itemId;

    /**
     * sku编码
     */
    private String outSkuId;

    /**
     * 入库价格
     */
    private BigDecimal inPrice;

    /**
     * 出库价格
     */
    private BigDecimal outPrice;

    /**
     * 库存预警
     */
    private BigDecimal quantity;

    /**
     * 删除标识
     */
    @TableLogic
    private Integer delFlag;


}
