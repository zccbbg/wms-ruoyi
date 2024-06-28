## 230627
1. 删除 snail-job monitor-admin ruoyi-extend 基本用不到
2. 优化 获取aop代理的方式 减少与其他使用aop的功能冲突的概率

## 230620
1. 完成重构 common, framework 包结构, 参照 cloud 版本拆分子模块 ;
update 更新模块包名 ;
2. 使用 jdk17 语法优化代码
3. mapstruct-plus 接入替换 BeanUtil ,用于实体类转换 ; 原先BeanUtil 对jdk17实体类转换会出错。

## 230613
1.删除vue代码，vue相关代码重新建项目。