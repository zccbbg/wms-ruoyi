package com.cyl.demo.pojo.vo;

import java.time.LocalDateTime;
import com.ruoyi.common.core.domain.BaseAudit;
import lombok.Data;
/**
 * 任务 数据视图对象
 * 
 * @author feijinping
 */
@Data
public class TaskVO extends BaseAudit {
    private Long id;
    private String taskNo;
    private String taskName;
    private String taskAddress;
    private LocalDateTime incidentTime;
    private Integer numberOfCases;
    private Long receiveDepartmentId;
    private Long reportDepartmentId;
    private Long receiveUserId;
    private Long reportUserId;
    private Integer taskSource;
    private String phone;
    private LocalDateTime receiveTime;
    private String remark;
    private Integer taskStatus;
    private Integer natureOfEvent;
    private Integer taskType;
    private Integer incidentPlace;
    private Integer eventLevel;
    private LocalDateTime publishTime;
    private Integer disabled;
}
