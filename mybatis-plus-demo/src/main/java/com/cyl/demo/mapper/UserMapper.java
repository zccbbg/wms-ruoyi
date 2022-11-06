package com.cyl.demo.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.cyl.demo.domain.User2;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface UserMapper extends BaseMapper<User2> {
    int countByExample();
}
