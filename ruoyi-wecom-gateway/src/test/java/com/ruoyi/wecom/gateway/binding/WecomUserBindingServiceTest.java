package com.ruoyi.wecom.gateway.binding;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Tag;
import org.junit.jupiter.api.Test;

import java.util.Optional;
import java.util.concurrent.atomic.AtomicInteger;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNotNull;
import static org.junit.jupiter.api.Assertions.assertTrue;

/**
 * WecomUserBindingService 单元测试（用 fake {@link SysUserBindingClient}）。
 */
@Tag("dev")
class WecomUserBindingServiceTest {

    private FakeBindingClient fakeClient;
    private WecomUserBindingService service;

    @BeforeEach
    void setUp() {
        fakeClient = new FakeBindingClient();
        service = new WecomUserBindingService(fakeClient);
    }

    @Test
    void findUserIdByOpenId_nullOrEmpty_returnsEmpty() {
        assertTrue(service.findUserIdByOpenId(null).isEmpty());
        assertTrue(service.findUserIdByOpenId("").isEmpty());
    }

    @Test
    void findUserIdByOpenId_cacheMiss_callsClientOnce() {
        fakeClient.map.put("open-1", 100L);
        Optional<Long> r1 = service.findUserIdByOpenId("open-1");
        assertEquals(100L, r1.orElse(null));
        assertEquals(1, fakeClient.callCount.get());

        // 第二次命中缓存，client 不再调用
        Optional<Long> r2 = service.findUserIdByOpenId("open-1");
        assertEquals(100L, r2.orElse(null));
        assertEquals(1, fakeClient.callCount.get());
    }

    @Test
    void findUserIdByOpenId_notBound_returnsEmpty_andCachesNegativeResult() {
        // open-2 未在 client 映射中 → 返回 empty
        assertTrue(service.findUserIdByOpenId("open-2").isEmpty());
        // 第二次仍返回 empty（负缓存命中，不再查 client）
        assertTrue(service.findUserIdByOpenId("open-2").isEmpty());
        assertEquals(1, fakeClient.callCount.get());
    }

    @Test
    void invalidate_removesCacheEntry_nextCallHitsClient() {
        fakeClient.map.put("open-3", 200L);
        assertEquals(200L, service.findUserIdByOpenId("open-3").orElse(null));
        assertEquals(1, fakeClient.callCount.get());

        service.invalidate("open-3");
        assertEquals(200L, service.findUserIdByOpenId("open-3").orElse(null));
        assertEquals(2, fakeClient.callCount.get());
    }

    @Test
    void clearAll_clearsCache() {
        fakeClient.map.put("open-4", 300L);
        service.findUserIdByOpenId("open-4");
        assertEquals(1, service.cacheSize());

        service.clearAll();
        assertEquals(0, service.cacheSize());
    }

    @Test
    void putDirect_writesCache_withoutClientCall() {
        service.putDirect("open-direct", 999L);
        assertEquals(999L, service.findUserIdByOpenId("open-direct").orElse(null));
        assertEquals(0, fakeClient.callCount.get());
    }

    @Test
    void putDirect_nullUserId_createsNegativeCache() {
        service.putDirect("open-neg", null);
        assertTrue(service.findUserIdByOpenId("open-neg").isEmpty());
        assertEquals(0, fakeClient.callCount.get());
    }

    @Test
    void constructor_rejectsNullClient() {
        try {
            new WecomUserBindingService(null);
        } catch (NullPointerException npe) {
            assertNotNull(npe);
            return;
        }
        org.junit.jupiter.api.Assertions.fail("expected NullPointerException for null client");
    }

    static class FakeBindingClient implements SysUserBindingClient {
        final java.util.Map<String, Long> map = new java.util.HashMap<>();
        final AtomicInteger callCount = new AtomicInteger(0);

        @Override
        public Optional<Long> findUserIdByWecomOpenId(String openId) {
            callCount.incrementAndGet();
            return Optional.ofNullable(map.get(openId));
        }
    }
}
