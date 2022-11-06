package com.cyl.demo.convert;

import org.mapstruct.Mapper;
import com.cyl.demo.domain.Task;
import com.cyl.demo.pojo.dto.TaskDTO;
import com.cyl.demo.pojo.vo.TaskVO;
import java.util.List;
/**
 * 任务  DO <=> DTO <=> VO / BO / Query
 *
 * @author feijinping
 */
@Mapper(componentModel = "spring")
public interface TaskConvert  {

    /**
     * @param source DO
     * @return DTO
     */
    TaskDTO do2dto(Task source);

    /**
     * @param source DTO
     * @return DO
     */
    Task dto2do(TaskDTO source);

    List<TaskVO> dos2vos(List<Task> list);
}
