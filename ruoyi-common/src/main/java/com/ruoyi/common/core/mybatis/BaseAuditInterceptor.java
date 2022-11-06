package com.ruoyi.common.core.mybatis;

import cn.hutool.core.util.StrUtil;
import com.ruoyi.common.core.domain.BaseAudit;
import com.ruoyi.common.exception.ServiceException;
import com.ruoyi.common.utils.SecurityUtils;
import lombok.extern.slf4j.Slf4j;
import org.apache.ibatis.executor.Executor;
import org.apache.ibatis.mapping.MappedStatement;
import org.apache.ibatis.mapping.SqlCommandType;
import org.apache.ibatis.plugin.Interceptor;
import org.apache.ibatis.plugin.Intercepts;
import org.apache.ibatis.plugin.Invocation;
import org.apache.ibatis.plugin.Signature;
import org.springframework.stereotype.Component;

import java.lang.reflect.Field;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.time.LocalDateTime;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

//@Component
@Slf4j
//@Intercepts(@Signature(type = Executor.class, method = "update", args = {MappedStatement.class, Object.class}))
public class BaseAuditInterceptor implements Interceptor {
    private Map<Class, Method> clazz2Id = new ConcurrentHashMap<>();
    private Method noMethod = BaseAuditInterceptor.class.getMethods()[0];
    @Override
    public Object intercept(Invocation invocation) throws IllegalAccessException, InvocationTargetException {
        if(this.getUserId()!=null){
            fillField(invocation);
        }
        return invocation.proceed();
    }

    private void fillField(Invocation invocation) {
        Object[] args = invocation.getArgs();
        if (args.length < 2) {
            return;
        }
        // 参数1 执行语句
        MappedStatement ms = (MappedStatement) args[0];
        SqlCommandType sqlCommandType = ms.getSqlCommandType();
        // 如果是“增加”或“更新”操作，则继续进行默认操作信息赋值。否则，则退出
        if (sqlCommandType != SqlCommandType.INSERT && sqlCommandType != SqlCommandType.UPDATE) {
            return;
        }

        // 参数2 参数
        Object parameter = args[1];
        // 插入或更新参数可能是 list 或 实体
        if (parameter instanceof List) {
            List real = (List) parameter;
            if (!(real.get(0) instanceof BaseAudit)) {
                return;
            }
            dealList(real);
        } else if (!(parameter instanceof BaseAudit)) {
            return;
        }
        dealItem((BaseAudit) parameter);
    }

    private void dealItem(BaseAudit parameter) {
        Class<?> c = parameter.getClass();
        Method idMethod;
        try {
            if (!clazz2Id.containsKey(c)) {
                try {
                    idMethod = getIdMethod(c);
                    clazz2Id.put(c, idMethod);
                } catch (Exception e) {
                    clazz2Id.put(c, noMethod);
                    return;
                }
            } else if (clazz2Id.get(c) == noMethod) {
                log.error("没有 id 的方法，请添加 @MybatisId注解，或者增加 id 属性");
                return;
            } else {
                idMethod = clazz2Id.get(c);
            }

            Object id = idMethod.invoke(parameter);
            LocalDateTime time = LocalDateTime.now();
            if (id == null) {
                if (parameter.getCreateTime() == null) {
                    parameter.setCreateTime(time);
                }
                if (parameter.getCreateBy() == null) {
                    parameter.setCreateBy(getUserId());
                }
            } else {
                if (parameter.getUpdateBy() == null) {
                    parameter.setUpdateBy(getUserId());
                }
                if (parameter.getUpdateTime() == null) {
                    parameter.setUpdateTime(time);
                }
            }
        } catch (Exception e) {
            log.error("处理 审计参数失败 {}", parameter, e);
        }
    }

    private Long getUserId() {
        try {
            return SecurityUtils.getLoginUser().getUserId();
        } catch (ServiceException e) {
            log.debug("获取当前线程 userId 失败!", e);
            return -1L;
        }
    }

    /**
     * 获取某个类的 id 字段的 get 方法
     *
     * @param c 类
     * @return id get 方法
     */
    private Method getIdMethod(Class c) throws NoSuchMethodException, NoSuchFieldException {
        // 有 @Id 注解
        Field[] fields = c.getDeclaredFields();
        for (Field field : fields) {
            if (field.getAnnotation(MybatisId.class) != null) {
                try {
                    String camel = StrUtil.upperFirst(StrUtil.toCamelCase(field.getName()));
                    return c.getMethod("get" + camel);
                } catch (NoSuchMethodException e) {
                    log.error("@MybatisId 注解的属性 {}，必须有 对应的get 方法", field.getName());
                    throw e;
                }
            }
        }
        Method[] methods = c.getMethods();
        for (Method method : methods) {
            if (method.getAnnotation(MybatisId.class) != null) {
                if (method.getParameterCount() > 0) {
                    log.error("@MybatisId 注解的方法 {} 必须无参数！", method.getName());
                    throw new RuntimeException("@MybatisId 注解的方法必须无参数: " + method.getName());
                }
                return method;
            }
        }
        // 有 id 字段
        Field idFiled = c.getDeclaredField("id");
        if (idFiled != null) {
            try {
                return c.getMethod("getId");
            } catch (NoSuchMethodException e) {
                log.error("@MybatisId 注解的属性 {}，必须有 对应的get 方法", idFiled.getName());
                throw e;
            }
        }
        // 抛出异常
        throw new RuntimeException("无 id 方法");
    }

    private void dealList(List<? extends BaseAudit> real) {
        real.forEach(this::dealItem);
    }
}
