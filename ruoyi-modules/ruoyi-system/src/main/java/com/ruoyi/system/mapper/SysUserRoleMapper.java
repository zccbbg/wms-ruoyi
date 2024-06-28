package com.ruoyi.system.mapper;

import com.rouyi.common.mybatis.core.mapper.BaseMapperPlus;
import com.ruoyi.system.domain.entity.SysUserRole;

import java.util.List;

/**
 * 用户与角色关联表 数据层
 *
 * @author Lion Li
 */
public interface SysUserRoleMapper extends BaseMapperPlus<SysUserRole, SysUserRole> {

    List<Long> selectUserIdsByRoleId(Long roleId);

}
