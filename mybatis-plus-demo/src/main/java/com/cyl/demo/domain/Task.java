package com.cyl.demo.domain;

import java.time.LocalDateTime;

import com.baomidou.mybatisplus.annotation.TableName;
import com.fasterxml.jackson.annotation.JsonFormat;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseAudit;
import lombok.Data;
/**
 * 任务对象 cscdc_task
 * 
 * @author feijinping
 */
@Data
@TableName("cscdc_task")
public class Task extends BaseAudit {
    private static final long serialVersionUID = 1L;

    /** $column.columnComment */
    private Long id;

    /** 事件编码 */
    @Excel(name = "事件编码")
    private String taskNo;

    /** 事件名称 */
    @Excel(name = "事件名称")
    private String taskName;

    /** 事发地点 */
    @Excel(name = "事发地点")
    private String taskAddress;

    /** 事发时间 */
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @Excel(name = "事发时间", width = 30, dateFormat = "yyyy-MM-dd HH:mm:ss")
    private LocalDateTime incidentTime;

    /** 病例数 */
    @Excel(name = "病例数")
    private Integer numberOfCases;

    /** 接报部门id */
    @Excel(name = "接报部门id")
    private Long receiveDepartmentId;

    /** 报告单位id */
    @Excel(name = "报告单位id")
    private Long reportDepartmentId;

    /** 接报人id */
    @Excel(name = "接报人id")
    private Long receiveUserId;

    /** 报告人id */
    @Excel(name = "报告人id")
    private Long reportUserId;

    /** 报告来源 */
    @Excel(name = "报告来源")
    private Integer taskSource;

    /** 报告电话 */
    @Excel(name = "报告电话")
    private String phone;

    /** 接报时间 */
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @Excel(name = "接报时间", width = 30, dateFormat = "yyyy-MM-dd HH:mm:ss")
    private LocalDateTime receiveTime;

    /** 事件描述 */
    @Excel(name = "事件描述")
    private String remark;

    /** 事件状态(发布状态) */
    @Excel(name = "事件状态(发布状态)")
    private Integer taskStatus;

    /** 事件性质 */
    @Excel(name = "事件性质")
    private Integer natureOfEvent;

    /** 事件类型 */
    @Excel(name = "事件类型")
    private Integer taskType;

    /** 事发场所 */
    @Excel(name = "事发场所")
    private Integer incidentPlace;

    /** 事件分级 */
    @Excel(name = "事件分级")
    private Integer eventLevel;

    /** 发布时间 */
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @Excel(name = "发布时间", width = 30, dateFormat = "yyyy-MM-dd HH:mm:ss")
    private LocalDateTime publishTime;

    /** 软删除 */
    @Excel(name = "软删除")
    private Integer disabled;

}
