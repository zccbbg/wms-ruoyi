package com.ruoyi.framework.aspectj;

import com.alibaba.fastjson.JSON;
import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.AfterThrowing;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.core.env.Environment;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import java.util.Arrays;
import java.util.stream.Collectors;

/**
 * Aspect for logging execution of service and repository Spring components.
 * <p>
 * By default, it only runs with the "dev" profile.
 */
@Aspect
@Component
public class LoggingAspect {
    private final Logger log = LoggerFactory.getLogger(this.getClass());
    private final Environment env;

    public LoggingAspect(Environment env) {
        this.env = env;
    }

    /**
     * Pointcut that matches all repositories, services and Web REST endpoints.
     */
    @Pointcut("within(@org.springframework.stereotype.Repository *)" +
            " || within(@org.springframework.stereotype.Service *)" +
            " || within(@org.springframework.web.bind.annotation.RestController *)")
    public void springBeanPointcut() {
        // Method is empty as this is just a Pointcut, the implementations are in the advices.
    }

    @Pointcut("@annotation(org.springframework.scheduling.annotation.Scheduled)")
    public void scheduledJob() {
        // Method is empty as this is just a Pointcut, the implementations are in the advices.
    }

    /**
     * Pointcut that matches all repositories, services and Web REST endpoints.
     */
    @Pointcut("within(@org.springframework.web.bind.annotation.RestController *)")
    public void springBeanResourcePointcut() {
        // Method is empty as this is just a Pointcut, the implementations are in the advices.
    }

    /**
     * Advice that logs methods throwing exceptions.
     *
     * @param joinPoint join point for advice
     * @param e         exception
     */
    @AfterThrowing(pointcut = "springBeanPointcut() && scheduledJob()", throwing = "e")
    public void logAfterThrowing(JoinPoint joinPoint, Throwable e) {
        log.error("Exception in {}.{}() with cause = \'{}\' and exception = \'{}\'", joinPoint.getSignature().getDeclaringTypeName(),
                joinPoint.getSignature().getName(), e.getCause() != null ? e.getCause() : "NULL", e.getMessage(), e);
    }

    /**
     * Advice that logs when a method is entered and exited.
     *
     * @param joinPoint join point for advice
     * @return result
     * @throws Throwable throws IllegalArgumentException
     */
    @Around("scheduledJob()")
    public Object scheduledJobAround(ProceedingJoinPoint joinPoint) throws Throwable {
        String clazzName = joinPoint.getSignature().getDeclaringTypeName(),
                funcName = joinPoint.getSignature().getName();
        long start = System.currentTimeMillis();
        log.info("执行定时任务 {} {}.{}", start, clazzName, funcName);
        Object result = joinPoint.proceed();
        long end = System.currentTimeMillis();
        log.info("执行定时任务 {} {}.{}, host {} ms", start, clazzName, funcName, end - start);
        return result;
    }

    @Around("springBeanResourcePointcut()")
    public Object logAround(ProceedingJoinPoint joinPoint) throws Throwable {
        try {

            log.info("Enter: {}.{}() with argument[s] = {}", joinPoint.getSignature().getDeclaringTypeName(),
                    joinPoint.getSignature().getName(), convertString(joinPoint.getArgs()));

            Object result = joinPoint.proceed();
            log.debug("Exit: {}.{}() with result = {}", joinPoint.getSignature().getDeclaringTypeName(),
                    joinPoint.getSignature().getName(), result);
            return result;
        } catch (IllegalArgumentException e) {
            log.error("Illegal argument: {} in {}.{}()", Arrays.toString(joinPoint.getArgs()),
                    joinPoint.getSignature().getDeclaringTypeName(), joinPoint.getSignature().getName());
            throw e;
        }
    }

    private String convertString(Object[] args) {
        if (args == null || args.length == 0) {
            return "[]";
        }
        String params = Arrays.stream(args).map(it -> {
            if (it instanceof ServletResponse) {
                return "ServletResponse";
            }
            if (it instanceof ServletRequest) {
                return "ServletRequest";
            }
            if (it instanceof MultipartFile) {
                MultipartFile f = (MultipartFile) it;
                return String.format("{fileName: \"%s\", name:\"%s\", contentType: \"%s\", size: \"%d\"}",
                        f.getOriginalFilename(), f.getName(), f.getContentType(), f.getSize());
            }
            return JSON.toJSONString(it);
        }).collect(Collectors.joining(","));
        return "[" + params + "]";
    }
}
