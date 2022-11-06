package com.cyl.demo.service;

import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Page;
import java.util.List;
import com.cyl.demo.domain.Task;
import com.cyl.demo.pojo.query.TaskQuery;

/**
 * 任务Service接口
 * 
 * @author feijinping
 */
public interface ITaskService {
    /**
     * 查询任务
     * 
     * @param id 任务主键
     * @return 任务
     */
    Task selectById(Long id);

    /**
     * 查询任务列表
     * 
     * @param query 查询条件
     * @param page 分页条件
     * @return 任务集合
     */
    List<Task> selectList(TaskQuery query, Pageable page);

    /**
     * 新增任务
     * 
     * @param task 任务
     * @return 结果
     */
    int insert(Task task);

    /**
     * 修改任务
     * 
     * @param task 任务
     * @return 结果
     */
    int update(Task task);

    /**
     * 批量删除任务
     * 
     * @param ids 需要删除的任务主键集合
     * @return 结果
     */
    int deleteByIds(Long[] ids);

    /**
     * 删除任务信息
     * 
     * @param id 任务主键
     * @return 结果
     */
    int deleteById(Long id);
}
