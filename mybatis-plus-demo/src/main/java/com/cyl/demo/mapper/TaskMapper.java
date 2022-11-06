package com.cyl.demo.mapper;

import java.util.List;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.cyl.demo.domain.Task;

/**
 * 任务Mapper接口
 * 
 * @author feijinping
 */
public interface TaskMapper extends BaseMapper<Task> {
    /**
     * 查询任务列表
     *
     * @param task 任务
     * @return 任务集合
     */
    List<Task> selectList1(Task task);
}
