package com.ruoyi.wecom.gateway.config;

import org.junit.jupiter.api.Tag;
import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertFalse;
import static org.junit.jupiter.api.Assertions.assertTrue;

/**
 * WecomProperties 默认值 + setter/getter 测试。
 */
@Tag("dev")
class WecomPropertiesTest {

    @Test
    void defaults_areSensible() {
        WecomProperties p = new WecomProperties();
        assertTrue(p.isEnabled(), "default enabled=true");
        assertEquals("wss://openws.work.weixin.qq.com", p.getWsUrl());
        assertEquals(30_000L, p.getHeartbeatIntervalMillis());
        assertEquals(10_000L, p.getRequestTimeoutMillis());
        assertEquals(10, p.getMaxReconnectAttempts());
        assertEquals(5, p.getMaxAuthFailureAttempts());
        assertEquals(10, p.getBusinessCoreThreads());
        assertEquals(20, p.getBusinessMaxThreads());
        assertEquals(100, p.getBusinessQueueCapacity());
        assertEquals(10, p.getBusinessTimeoutSeconds());
    }

    @Test
    void setters_roundTrip() {
        WecomProperties p = new WecomProperties();
        p.setEnabled(false);
        p.setBotId("bot-1");
        p.setSecret("secret-1");
        p.setWsUrl("wss://test");
        p.setMaxReconnectAttempts(-1);
        p.setBusinessCoreThreads(5);

        assertFalse(p.isEnabled());
        assertEquals("bot-1", p.getBotId());
        assertEquals("secret-1", p.getSecret());
        assertEquals("wss://test", p.getWsUrl());
        assertEquals(-1, p.getMaxReconnectAttempts());
        assertEquals(5, p.getBusinessCoreThreads());
    }
}
