package com.ruoyi.wecom.gateway.binding;

import lombok.extern.slf4j.Slf4j;
import org.springframework.boot.autoconfigure.condition.ConditionalOnMissingBean;
import org.springframework.stereotype.Component;

import java.util.Optional;

/**
 * 默认实现（v1 占位）：不引入 MyBatis 依赖，运行时通过自定义
 * {@link SysUserBindingClient} bean 覆盖。
 */
@Slf4j
@Component
@ConditionalOnMissingBean(SysUserBindingClient.class)
public class SysUserBindingClientDefault implements SysUserBindingClient {

    @Override
    public Optional<Long> findUserIdByWecomOpenId(String openId) {
        log.warn("SysUserBindingClientDefault.findUserIdByWecomOpenId called with openId={} (placeholder); "
                + "生产环境必须覆盖为真实 SQL 实现", openId);
        return Optional.empty();
    }

    @Override
    public boolean updateWecomOpenId(Long userId, String openId) {
        log.warn("SysUserBindingClientDefault.updateWecomOpenId called with userId={} openId={} (placeholder); "
                + "生产环境必须覆盖为真实 SQL 实现", userId, openId);
        return false;
    }
}
