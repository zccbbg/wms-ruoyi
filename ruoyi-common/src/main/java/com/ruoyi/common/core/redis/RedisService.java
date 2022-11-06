package com.ruoyi.common.core.redis;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.concurrent.TimeUnit;

@Service
public class RedisService {
    @Autowired
    private RedisCache redisCache;

    public void setMatchList(Long userId, List<Long> userIds) {
        String key = RedisKeys.MATCH_LIST_OF + userId;
        redisCache.setCacheList(key, userIds);
        redisCache.expire(key, 7, TimeUnit.DAYS);
    }

    public List<Long> getMatchList(Long userId) {
        String key = RedisKeys.MATCH_LIST_OF + userId;
        return redisCache.getCacheList(key);
    }

    interface RedisKeys {
        String MATCH_LIST_OF = "MATCH_LIST_OF_";
    }
}
