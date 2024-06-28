package com.ruoyi.demo.mapper;

import com.rouyi.common.mybatis.annotation.DataColumn;
import com.rouyi.common.mybatis.annotation.DataPermission;
import com.rouyi.common.mybatis.core.mapper.BaseMapperPlus;
import com.ruoyi.demo.domain.entity.TestTree;
import com.ruoyi.demo.domain.vo.TestTreeVo;

/**
 * 测试树表Mapper接口
 *
 * @author Lion Li
 * @date 2021-07-26
 */
@DataPermission({
    @DataColumn(key = "deptName", value = "dept_id"),
    @DataColumn(key = "userName", value = "user_id")
})
public interface TestTreeMapper extends BaseMapperPlus<TestTree, TestTreeVo> {

}
