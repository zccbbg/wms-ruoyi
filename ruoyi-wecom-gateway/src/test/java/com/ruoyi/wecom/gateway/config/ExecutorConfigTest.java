package com.ruoyi.wecom.gateway.config;

import org.junit.jupiter.api.Tag;
import org.junit.jupiter.api.Test;

import java.util.concurrent.ExecutorService;
import java.util.concurrent.Future;
import java.util.concurrent.TimeUnit;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertTrue;

/**
 * ExecutorConfig 单元测试。
 */
@Tag("dev")
class ExecutorConfigTest {

    @Test
    void wecomBusinessExecutor_usesConfiguredThreads() throws Exception {
        WecomProperties props = new WecomProperties();
        ExecutorConfig config = new ExecutorConfig(props);
        ExecutorService exec = config.wecomBusinessExecutor();

        Future<Integer> f = exec.submit(() -> 42);
        assertEquals(42, f.get(2, TimeUnit.SECONDS));
        exec.shutdown();
        assertTrue(exec.awaitTermination(2, TimeUnit.SECONDS));
    }

    @Test
    void executor_usesCustomCoreAndMax() throws Exception {
        WecomProperties props = new WecomProperties();
        props.setBusinessCoreThreads(2);
        props.setBusinessMaxThreads(4);
        props.setBusinessQueueCapacity(10);

        ExecutorService exec = new ExecutorConfig(props).wecomBusinessExecutor();
        Future<String> f = exec.submit(() -> Thread.currentThread().getName());
        String name = f.get(2, TimeUnit.SECONDS);
        assertTrue(name.startsWith("wecom-business-"), name);
        exec.shutdown();
    }
}
