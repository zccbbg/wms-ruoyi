package com.ruoyi.wms.domain.entity;

import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.ruoyi.common.mybatis.core.domain.BaseEntity;
import com.ruoyi.common.mybatis.core.domain.PlaceAndItem;
import com.ruoyi.wms.domain.bo.InventoryDetailBo;
import io.github.linpeilie.annotations.AutoMapper;
import lombok.Data;
import lombok.EqualsAndHashCode;

import java.io.Serial;
import java.math.BigDecimal;
import java.time.LocalDateTime;

/**
 * 库存详情对象 wms_inventory_detail
 *
 * @author zcc
 * @date 2024-07-22
 */
@Data
@EqualsAndHashCode(callSuper = true)
@TableName("wms_inventory_detail")
@AutoMapper(target = InventoryDetailBo.class, reverseConvertGenerate = false)
public class InventoryDetail extends BaseEntity implements PlaceAndItem {

    @Serial
    private static final long serialVersionUID=1L;

    /**
     *
     */
    @TableId(value = "id")
    private Long id;
    /**
     * 入库单id
     */
    private Long receiptOrderId;
    /**
     * 入库单类型
     */
    private String receiptOrderType;
    /**
     * 单号
     */
    private String orderNo;
    /**
     * 类型 1：入库 2：移库 3：盘库
     */
    private Integer type;
    /**
     * sku的ID
     */
    private Long skuId;
    /**
     * 所属仓库
     */
    private Long warehouseId;
    /**
     * 所属库区
     */
    private Long areaId;
    /**
     * 入库数量
     */
    private BigDecimal quantity;
    /**
     * 批号
     */
    private String batchNo;
    /**
     * 生产日期
     */
    private LocalDateTime productionDate;
    /**
     * 过期时间
     */
    private LocalDateTime expirationDate;
    /**
     * 金额
     */
    private BigDecimal amount;
    /**
     * 备注
     */
    private String remark;
    /**
     * 剩余数量
     */
    private BigDecimal remainQuantity;

}
