package com.cyl.demo.pojo.query;

import java.time.LocalDateTime;
import lombok.Data;

/**
 * 任务 查询 对象
 *
 * @author feijinping
 */
@Data
public class TaskQuery {
    /** 事件编码 精确匹配 */
    private String taskNo;

    /** 事件名称 模糊匹配 */
    private String taskNameLike;

    /** 事发地点 不等于 */
    private String taskAddressNotEqual;

    /** 事发时间 大于 */
    private LocalDateTime incidentTimeGreatThan;

    /** 病例数 大于等于 */
    private Integer numberOfCasesGreatThanOrEqual;

    /** 接报部门id 小于 */
    private Long receiveDepartmentIdLessThan;

    /** 报告单位id 小于 */
    private Long reportDepartmentIdLessThan;

    /** 接报人id 范围 */
    private Long[] receiveUserIdRange;

    /** 报告人id 精确匹配 */
    private Long reportUserId;

    /** 报告来源 精确匹配 */
    private Integer taskSource;

    /** 报告电话 精确匹配 */
    private String phone;

    /** 接报时间 精确匹配 */
    private LocalDateTime receiveTime;

    /** 事件状态 精确匹配 */
    private Integer taskStatus;

    /** 事件性质 精确匹配 */
    private Integer natureOfEvent;

    /** 事件类型 精确匹配 */
    private Integer taskType;

    /** 事发场所 精确匹配 */
    private Integer incidentPlace;

    /** 事件分级 精确匹配 */
    private Integer eventLevel;

    /** 发布时间 范围 */
    private LocalDateTime[] publishTimeRange;

    /** 软删除 精确匹配 */
    private Integer disabled;

}
