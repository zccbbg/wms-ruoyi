package com.cyl.wms.domain;

import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.util.List;

import com.baomidou.mybatisplus.annotation.TableField;
import com.ruoyi.common.annotation.Excel;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import com.ruoyi.common.core.domain.BaseAudit;
import lombok.Data;
import com.baomidou.mybatisplus.annotation.TableName;
/**
 * 库存盘点单据对象 wms_inventory_check
 * 
 * @author zcc
 */
@ApiModel(description="库存盘点单据对象")
@Data
@TableName("wms_inventory_check")
public class InventoryCheck extends BaseAudit {
    private static final long serialVersionUID = 1L;

    public static String CREATED = "11";
    public static String FINISH = "22";

    @ApiModelProperty("ID")
    private Long id;

    @ApiModelProperty("库存盘点单号，系统自动生成")
    @Excel(name = "库存盘点单号，系统自动生成")
    private String inventoryCheckNo;

    @ApiModelProperty("库存盘点类型")
    @Excel(name = "库存盘点类型")
    private Integer inventoryCheckType;

    @ApiModelProperty("库存盘点单状态11：盘点中 22：已完成")
    @Excel(name = "库存盘点单状态11：盘点中 22：已完成")
    private Integer inventoryCheckStatus;

    @ApiModelProperty("盈亏数")
    @Excel(name = "盈亏数")
    private BigDecimal inventoryCheckTotal;

    @ApiModelProperty("审核状态")
    @Excel(name = "审核状态")
    private Integer checkStatus;

    @ApiModelProperty("审核人")
    @Excel(name = "审核人")
    private Long checkUserId;

    @ApiModelProperty("审核时间")
    @Excel(name = "审核时间", width = 30, dateFormat = "yyyy-MM-dd HH:mm:ss")
    private LocalDateTime checkTime;

    @ApiModelProperty("所属仓库")
    @Excel(name = "所属仓库")
    private Long warehouseId;

    @ApiModelProperty("所属库区")
    @Excel(name = "所属库区")
    private Long areaId;

    @ApiModelProperty("货架")
    @Excel(name = "货架")
    private Long rackId;

    @ApiModelProperty("附件文件")
    @Excel(name = "附件文件")
    private String attachment;

    @ApiModelProperty("备注")
    @Excel(name = "备注")
    private String remark;

    @ApiModelProperty("删除标识")
    private Integer delFlag;

    @TableField(exist = false)
    private List<Long> place;

}
