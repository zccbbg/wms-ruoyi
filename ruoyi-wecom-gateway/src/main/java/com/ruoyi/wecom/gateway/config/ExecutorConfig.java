package com.ruoyi.wecom.gateway.config;

import lombok.RequiredArgsConstructor;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import java.util.concurrent.ExecutorService;
import java.util.concurrent.LinkedBlockingQueue;
import java.util.concurrent.ThreadPoolExecutor;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.ThreadFactory;
import java.util.concurrent.atomic.AtomicInteger;

/**
 * 业务执行器配置：异步处理 WMS API 调用，避免阻塞 SDK 回调线程。
 */
@Configuration
@RequiredArgsConstructor
public class ExecutorConfig {

    private final WecomProperties properties;

    /**
     * 业务执行器：用于异步调用 WMS API + 异步回复。
     *
     * <p>配置：
     * <ul>
     *   <li>核心线程：{@code businessCoreThreads}</li>
     *   <li>最大线程：{@code businessMaxThreads}</li>
     *   <li>队列容量：{@code businessQueueCapacity}</li>
     *   <li>拒绝策略：{@link ThreadPoolExecutor.AbortPolicy}（业务繁忙时快速失败，避免消息积压）</li>
     * </ul>
     */
    @Bean(destroyMethod = "shutdown")
    public ExecutorService wecomBusinessExecutor() {
        WecomProperties p = properties;
        return new ThreadPoolExecutor(
                p.getBusinessCoreThreads(),
                p.getBusinessMaxThreads(),
                60L, TimeUnit.SECONDS,
                new LinkedBlockingQueue<>(p.getBusinessQueueCapacity()),
                new NamedThreadFactory("wecom-business-"),
                new ThreadPoolExecutor.AbortPolicy()
        );
    }

    private static class NamedThreadFactory implements ThreadFactory {
        private final String prefix;
        private final AtomicInteger counter = new AtomicInteger(0);

        NamedThreadFactory(String prefix) {
            this.prefix = prefix;
        }

        @Override
        public Thread newThread(Runnable r) {
            Thread t = new Thread(r, prefix + counter.incrementAndGet());
            t.setDaemon(true);
            return t;
        }
    }
}
