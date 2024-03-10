package com.cyl.wms.domain.vo;

import com.ruoyi.common.annotation.Excel;
import com.fasterxml.jackson.annotation.JsonFormat;
import com.ruoyi.common.core.domain.BaseAudit;
import lombok.Data;
/**
 * 物料类型表 数据视图对象
 * 
 * @author zcc
 */
@Data
public class ItemTypeVO extends BaseAudit {
   /** 物料类型id */
    private Long itemTypeId;
   /** 父物料类型id */
    @Excel(name = "父物料类型id")
    private Long parentId;
   /** 祖级列表 */
    @Excel(name = "祖级列表")
    private String ancestors;
   /** 物料类型名称 */
    @Excel(name = "物料类型名称")
    private String typeName;
   /** 显示顺序 */
    @Excel(name = "显示顺序")
    private Integer orderNum;
   /** 物料类型状态（0正常 1停用） */
    @Excel(name = "物料类型状态", readConverterExp = "0=正常,1=停用")
    private String status;
}
