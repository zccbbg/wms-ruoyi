package com.cyl.wms.domain;

import java.math.BigDecimal;
import java.time.LocalDateTime;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.ruoyi.common.annotation.Excel;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import com.ruoyi.common.core.domain.BaseAudit;
import lombok.Data;
import com.baomidou.mybatisplus.annotation.TableName;
import org.springframework.format.annotation.DateTimeFormat;

/**
 * 物料对象 wms_item
 * 
 * @author zcc
 */
@ApiModel(description="物料对象")
@Data
@TableName("wms_item")
public class Item extends BaseAudit {
    private static final long serialVersionUID = 1L;

    @ApiModelProperty("ID")
    private Long id;

    @ApiModelProperty("编号")
    @Excel(name = "编号")
    private String itemNo;

    @ApiModelProperty("名称")
    @Excel(name = "名称")
    private String itemName;

    @ApiModelProperty("分类")
    @Excel(name = "分类")
    private String itemType;

    @ApiModelProperty("单位类别")
    @Excel(name = "单位类别")
    private String unit;

    @ApiModelProperty("所属货架")
    @Excel(name = "所属货架")
    private Long rackId;

    @ApiModelProperty("所属库区")
    @Excel(name = "所属库区")
    private Long areaId;

    @ApiModelProperty("所属仓库")
    @Excel(name = "所属仓库")
    private Long warehouseId;

    @ApiModelProperty("安全库存")
    @Excel(name = "安全库存")
    private BigDecimal quantity;

    @ApiModelProperty("有效期")
    @Excel(name = "有效期", width = 30, dateFormat = "yyyy-MM-dd HH:mm:ss")
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private LocalDateTime expiryDate;

    @ApiModelProperty("删除标识")
    private Integer delFlag;

    @ApiModelProperty("备注")
    @Excel(name = "备注")
    private String remark;

}
