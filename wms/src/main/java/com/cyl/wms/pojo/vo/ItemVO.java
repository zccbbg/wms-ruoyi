package com.cyl.wms.pojo.vo;

import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.util.List;

import com.ruoyi.common.annotation.Excel;
import com.fasterxml.jackson.annotation.JsonFormat;
import com.ruoyi.common.core.domain.BaseAudit;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
/**
 * 物料 数据视图对象
 * 
 * @author zcc
 */
@Data
public class ItemVO extends BaseAudit {
   /** ID */
    private Long id;
   /** 编号 */
    @Excel(name = "编号")
    private String itemNo;
   /** 名称 */
    @Excel(name = "名称")
    private String itemName;
   /** 分类 */
    @Excel(name = "分类")
    private String itemType;
   /** 单位类别 */
    @Excel(name = "单位类别")
    private String unit;
   /** 所属货架 */
    @Excel(name = "所属货架")
    private Long rackId;
   /** 所属库区 */
    @Excel(name = "所属库区")
    private Long areaId;
   /** 所属仓库 */
    @Excel(name = "所属仓库")
    private Long warehouseId;
   /** 安全库存 */
    @Excel(name = "安全库存")
    private BigDecimal quantity;
   /** 有效期 */
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @Excel(name = "有效期", width = 30, dateFormat = "yyyy-MM-dd HH:mm:ss")
    private LocalDateTime expiryDate;
   /** 备注 */
    @Excel(name = "备注")
    private String remark;
    private List<Long> place;
    private Integer delFlag;
}
