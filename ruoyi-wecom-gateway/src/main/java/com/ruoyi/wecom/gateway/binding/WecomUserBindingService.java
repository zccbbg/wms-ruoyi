package com.ruoyi.wecom.gateway.binding;

import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.time.Duration;
import java.util.Objects;
import java.util.Optional;
import java.util.concurrent.ConcurrentHashMap;

/**
 * 用户绑定服务：openId ↔ sys_user.userId 双向查询。
 *
 * <p>v1 内存实现：使用 {@link ConcurrentHashMap} 缓存绑定关系，
 * TTL 5 分钟（防止用户解绑后机器人仍持有旧 token）。</p>
 *
 * <p>v2 计划：迁移到 Redis（{@code wms:wecom:binding:{openId}} → userId）。</p>
 */
@Slf4j
@Service
public class WecomUserBindingService {

    /**
     * 缓存条目（用户 ID + 过期时间）。
     */
    private record CacheEntry(Long userId, long expireAtMillis) {
        boolean isExpired() {
            return System.currentTimeMillis() >= expireAtMillis;
        }
    }

    private static final Duration CACHE_TTL = Duration.ofMinutes(5);

    private final ConcurrentHashMap<String, CacheEntry> openIdToUserId = new ConcurrentHashMap<>();
    private final SysUserBindingClient client;

    @Autowired
    public WecomUserBindingService(SysUserBindingClient client) {
        this.client = client;
    }

    /**
     * 通过 openId 查询绑定的 userId。
     *
     * <p>命中缓存且未过期 → 直接返回；未命中或已过期 → 调用 {@link SysUserBindingClient}
     * 查 DB 后回填缓存。</p>
     *
     * @param openId  企业微信用户 openId
     * @return 绑定的 userId；未绑定返回 {@link Optional#empty()}
     */
    public Optional<Long> findUserIdByOpenId(String openId) {
        if (openId == null || openId.isEmpty()) {
            return Optional.empty();
        }

        CacheEntry cached = openIdToUserId.get(openId);
        if (cached != null && !cached.isExpired()) {
            return Optional.ofNullable(cached.userId());
        }

        // 缓存未命中或已过期，查询 DB
        Long userId = client.findUserIdByWecomOpenId(openId).orElse(null);
        long expireAt = System.currentTimeMillis() + CACHE_TTL.toMillis();
        openIdToUserId.put(openId, new CacheEntry(userId, expireAt));
        return Optional.ofNullable(userId);
    }

    /**
     * 让缓存失效（v1 内存缓存用）。v2 Redis 可直接用 del。
     */
    public void invalidate(String openId) {
        openIdToUserId.remove(openId);
    }

    /**
     * 测试用：清空所有缓存。
     */
    public void clearAll() {
        openIdToUserId.clear();
    }

    /**
     * 测试用：当前缓存条目数。
     */
    public int cacheSize() {
        return openIdToUserId.size();
    }

    /**
     * 测试用：直接写缓存（不查 DB）。{@code userId == null} 视作"未绑定"负缓存。
     */
    public void putDirect(String openId, Long userId) {
        Objects.requireNonNull(openId, "openId");
        long expireAt = System.currentTimeMillis() + CACHE_TTL.toMillis();
        openIdToUserId.put(openId, new CacheEntry(userId, expireAt));
        log.debug("putDirect openId={} userId={} expireAt={}", openId, userId, expireAt);
    }
}
