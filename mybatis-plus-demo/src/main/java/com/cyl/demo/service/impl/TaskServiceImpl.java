package com.cyl.demo.service.impl;

import java.util.Arrays;
import java.util.List;
import java.time.LocalDateTime;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.github.pagehelper.PageHelper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.apache.commons.lang3.StringUtils;
import com.cyl.demo.mapper.TaskMapper;
import com.cyl.demo.domain.Task;
import com.cyl.demo.pojo.query.TaskQuery;
import com.cyl.demo.service.ITaskService;

/**
 * 任务Service业务层处理
 * 
 * @author feijinping
 */
@Service
public class TaskServiceImpl implements ITaskService {
    @Autowired
    private TaskMapper taskMapper;

    /**
     * 查询任务
     * 
     * @param id 任务主键
     * @return 任务
     */
    @Override
    public Task selectById(Long id) {
        return taskMapper.selectById(id);
    }

    /**
     * 查询任务列表
     * 
     * @param query 查询条件
     * @param page 分页条件
     * @return 任务
     */
    @Override
    public List<Task> selectList(TaskQuery query, Pageable page) {
        if (page != null) {
            PageHelper.startPage(page.getPageNumber() + 1, page.getPageSize());
        }
        QueryWrapper<Task> qw = new QueryWrapper<>();
        String taskNo = query.getTaskNo();
        if (!StringUtils.isEmpty(taskNo)) {
            qw.eq("task_no", taskNo);
        }
        String taskNameLike = query.getTaskNameLike();
        if (!StringUtils.isEmpty(taskNameLike)) {
            qw.like("task_name", taskNameLike);
        }
        String taskAddressNotEqual = query.getTaskAddressNotEqual();
        if (!StringUtils.isEmpty(taskAddressNotEqual)) {
            qw.ne("task_address", taskAddressNotEqual);
        }
        LocalDateTime incidentTimeGreatThan = query.getIncidentTimeGreatThan();
        if (incidentTimeGreatThan != null) {
            qw.gt("incident_time", incidentTimeGreatThan);
        }
        Integer numberOfCasesGreatThanOrEqual = query.getNumberOfCasesGreatThanOrEqual();
        if (numberOfCasesGreatThanOrEqual != null) {
            qw.ge("number_of_cases", numberOfCasesGreatThanOrEqual);
        }
        Long receiveDepartmentIdLessThan = query.getReceiveDepartmentIdLessThan();
        if (receiveDepartmentIdLessThan != null) {
            qw.lt("receive_department_id", receiveDepartmentIdLessThan);
        }
        Long reportDepartmentIdLessThan = query.getReportDepartmentIdLessThan();
        if (reportDepartmentIdLessThan != null) {
            qw.lt("report_department_id", reportDepartmentIdLessThan);
        }
        Long[] receiveUserIdRange = query.getReceiveUserIdRange();
        if (receiveUserIdRange != null && receiveUserIdRange.length == 2) {
            Long start = receiveUserIdRange[0];
            if (start != null) {
                qw.ge("receive_user_id", start);
            }
            Long end = receiveUserIdRange[0];
            if (end != null) {
                qw.le("receive_user_id", end);
            }
        }
        Long reportUserId = query.getReportUserId();
        if (reportUserId != null) {
            qw.eq("report_user_id", reportUserId);
        }
        Integer taskSource = query.getTaskSource();
        if (taskSource != null) {
            qw.eq("task_source", taskSource);
        }
        String phone = query.getPhone();
        if (!StringUtils.isEmpty(phone)) {
            qw.eq("phone", phone);
        }
        LocalDateTime receiveTime = query.getReceiveTime();
        if (receiveTime != null) {
            qw.eq("receive_time", receiveTime);
        }
        Integer taskStatus = query.getTaskStatus();
        if (taskStatus != null) {
            qw.eq("task_status", taskStatus);
        }
        Integer natureOfEvent = query.getNatureOfEvent();
        if (natureOfEvent != null) {
            qw.eq("nature_of_event", natureOfEvent);
        }
        Integer taskType = query.getTaskType();
        if (taskType != null) {
            qw.eq("task_type", taskType);
        }
        Integer incidentPlace = query.getIncidentPlace();
        if (incidentPlace != null) {
            qw.eq("incident_place", incidentPlace);
        }
        Integer eventLevel = query.getEventLevel();
        if (eventLevel != null) {
            qw.eq("event_level", eventLevel);
        }
        LocalDateTime[] publishTimeRange = query.getPublishTimeRange();
        if (publishTimeRange != null && publishTimeRange.length == 2) {
            LocalDateTime start = publishTimeRange[0];
            if (start != null) {
                qw.ge("publish_time", start);
            }
            LocalDateTime end = publishTimeRange[0];
            if (end != null) {
                qw.le("publish_time", end);
            }
        }
        Integer disabled = query.getDisabled();
        if (disabled != null) {
            qw.eq("disabled", disabled);
        }
        return taskMapper.selectList(qw);
    }

    /**
     * 新增任务
     * 
     * @param task 任务
     * @return 结果
     */
    @Override
    public int insert(Task task) {
        task.setCreateTime(LocalDateTime.now());
        return taskMapper.insert(task);
    }

    /**
     * 修改任务
     * 
     * @param task 任务
     * @return 结果
     */
    @Override
    public int update(Task task) {
        return taskMapper.updateById(task);
    }

    /**
     * 批量删除任务
     * 
     * @param ids 需要删除的任务主键
     * @return 结果
     */
    @Override
    public int deleteByIds(Long[] ids) {
        return taskMapper.deleteBatchIds(Arrays.asList(ids));
    }

    /**
     * 删除任务信息
     * 
     * @param id 任务主键
     * @return 结果
     */
    @Override
    public int deleteById(Long id) {
        return taskMapper.deleteById(id);
    }
}
