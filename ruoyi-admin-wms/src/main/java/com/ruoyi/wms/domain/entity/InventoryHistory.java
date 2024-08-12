package com.ruoyi.wms.domain.entity;

import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.ruoyi.common.mybatis.core.domain.BaseHistoryEntity;
import lombok.Data;
import lombok.EqualsAndHashCode;

import java.io.Serial;
import java.math.BigDecimal;
import java.time.LocalDateTime;

/**
 * 库存记录对象 wms_inventory_history
 *
 * @author zcc
 * @date 2024-07-22
 */
@Data
@EqualsAndHashCode(callSuper = true)
@TableName("wms_inventory_history")
public class InventoryHistory extends BaseHistoryEntity {

    @Serial
    private static final long serialVersionUID=1L;

    /**
     *
     */
    @TableId(value = "id")
    private Long id;
    /**
     * 操作id（出库、入库、库存移动表单id）
     */
    private Long orderId;
    /**
     * 操作单号（入库、出库、移库、盘库单号）
     */
    private String orderNo;
    /**
     * 操作类型
     */
    private Integer orderType;
    /**
     * 物料ID
     */
    private Long skuId;
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
     * 库存变化
     */
    private BigDecimal quantity;
    /**
     * 备注
     */
    private String remark;
    /**
     * 所属仓库
     */
    private Long warehouseId;
    /**
     * 所属库区
     */
    private Long areaId;

}
