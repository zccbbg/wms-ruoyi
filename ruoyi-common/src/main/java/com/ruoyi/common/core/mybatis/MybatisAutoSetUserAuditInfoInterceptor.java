package com.ruoyi.common.core.mybatis;

import com.ruoyi.common.core.domain.BaseAudit;
import com.ruoyi.common.exception.ServiceException;
import com.ruoyi.common.utils.SecurityUtils;
import lombok.extern.slf4j.Slf4j;
import org.apache.ibatis.executor.Executor;
import org.apache.ibatis.mapping.*;
import org.apache.ibatis.plugin.*;
import org.springframework.stereotype.Component;

import java.time.LocalDateTime;
import java.util.*;

@Component
@Slf4j
@Intercepts(value = {@Signature(type = Executor.class, method = "update", args = {MappedStatement.class, Object.class})})
public class MybatisAutoSetUserAuditInfoInterceptor implements Interceptor {

    private static final Integer INDEX_ZERO = 0;
    private static final Integer INDEX_ONE = 1;

    @Override
    public Object intercept(Invocation invocation) throws Throwable {
        autoSetUserAuditInfo(invocation);
        return invocation.proceed();
    }

    private void autoSetUserAuditInfo(Invocation invocation){
        Object[] queryArgs = invocation.getArgs();
        MappedStatement mappedStatement = (MappedStatement) queryArgs[INDEX_ZERO];
        if(!mappedStatement.getId().contains("com.cyl")){
            return;
        }
        Long userId = this.getUserId();
        if (userId == null) {
            return;
        }
        SqlCommandType sqlCommandType = mappedStatement.getSqlCommandType();
        // 如果是“增加”或“更新”操作，则继续进行默认操作信息赋值。否则，则退出
        if (sqlCommandType != SqlCommandType.INSERT && sqlCommandType != SqlCommandType.UPDATE) {
            return;
        }
        Object object = queryArgs[INDEX_ONE];
        if (object instanceof List) {
            List objectList = (List) object;
            if (!(objectList.get(0) instanceof BaseAudit)) {
                return;
            }
            dealList(objectList,sqlCommandType);
        } else if (object instanceof Map) {
            Map<String, Object> map = (Map<String, Object>)object;
            Iterator<Map.Entry<String, Object>> iterable = map.entrySet().iterator();
            Set<Object> objects = new HashSet<>();
            while (iterable.hasNext()) {
                objects.add(iterable.next().getValue());
            }
            objects.stream().filter(it -> it instanceof BaseAudit).forEach(it -> this.dealItem((BaseAudit) it,sqlCommandType));
        } else if (object instanceof BaseAudit) {
            dealItem((BaseAudit)object,sqlCommandType);
        }
        return;

    }

    private void dealItem(BaseAudit parameter,SqlCommandType sqlCommandType){

        try {
            LocalDateTime time = LocalDateTime.now();
            if (sqlCommandType == SqlCommandType.INSERT ) {
                parameter.setCreateTime(time);
                parameter.setCreateBy(getUserId());
            }
            else if (sqlCommandType == SqlCommandType.UPDATE ) {
                parameter.setUpdateBy(getUserId());
                parameter.setUpdateTime(time);
            }
        } catch (Exception e) {
            log.error("处理 审计参数失败 {}", parameter, e);
        }
    }

    private void dealList(List<? extends BaseAudit> list,SqlCommandType sqlCommandType) {
        list.forEach(item->{
            dealItem(item,sqlCommandType);
        });
    }

    @Override
    public Object plugin(Object target) {
        return Plugin.wrap(target, this);
    }

    @Override
    public void setProperties(Properties properties) {

    }

    private Long getUserId() {
        try {
            return SecurityUtils.getLoginUser().getUserId();
        } catch (ServiceException e) {
            return null;
        }
    }
}
