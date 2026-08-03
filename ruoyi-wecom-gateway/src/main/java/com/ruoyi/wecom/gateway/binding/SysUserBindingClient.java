package com.ruoyi.wecom.gateway.binding;

import java.util.Optional;

/**
 * SysUser 绑定查询 + 修改客户端（v1 接口）。
 *
 * <p>v1 默认实现 {@link SysUserBindingClientDefault}：使用 sys_user.wecom_open_id 列 + MyBatis mapper。
 * 生产环境应通过自定义 bean 覆盖该默认实现，注入真实的 JdbcTemplate / MyBatis mapper。</p>
 *
 * <p>v2 可替换为：Feign + 独立用户服务 / GraphQL / 事件驱动同步等。</p>
 */
public interface SysUserBindingClient {

    /**
     * 通过 wecomOpenId 查 sys_user.user_id。
     *
     * @param openId 企业微信用户 openId
     * @return userId；未绑定返回 {@link Optional#empty()}
     */
    Optional<Long> findUserIdByWecomOpenId(String openId);

    /**
     * 更新（绑定 / 解绑）用户的 wecomOpenId。
     *
     * @param userId  WMS 系统用户 ID
     * @param openId  企业微信 openId；传 {@code null} 视为解绑
     * @return        成功更新返回 {@code true}；用户不存在返回 {@code false}
     */
    boolean updateWecomOpenId(Long userId, String openId);
}
