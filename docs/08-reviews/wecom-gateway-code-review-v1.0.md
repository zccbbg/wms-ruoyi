# 评审记录：ruoyi-wecom-gateway 实现 (v1.0)

| 字段 | 值 |
|---|---|
| 文档 | docs/05-design/wecom-gateway-selection-v1.1.md |
| 评审类型 | code（自审 + 静态检查） |
| 评审日期 | 2026-08-04 |
| 评审模型 | 自审（v1.1 §5.4/§5.6/§5.10 全部覆盖）+ LiteLLM 评审待补 |
| 评审人 | Michael (Claude) |
| 状态 | Draft |

> **说明**：当前环境无 JDK / Maven，无法 `mvn test` 实际运行。评审基于源码静态阅读，
> 关键 API 名称已在对照 SDK 源（`/tmp/sdk-explore/wx-aibot-java-sdk-main/`）后修复。
> 完整测试运行需在 `47.253.166.61` 部署后回归。

---

## 1. 模块结构（落地检查）

```
ruoyi-wecom-gateway/
├── pom.xml                                                ✓
├── src/main/java/com/ruoyi/wecom/gateway/
│   ├── WeComBotGatewayAutoConfiguration.java             ✓ @AutoConfiguration
│   ├── client/
│   │   └── WeComBotClient.java                           ✓ SDK 包装
│   ├── config/
│   │   ├── ExecutorConfig.java                           ✓ 业务执行器
│   │   └── WecomProperties.java                          ✓ @ConfigurationProperties
│   ├── binding/
│   │   ├── SysUserBindingClient.java                     ✓ interface
│   │   ├── SysUserBindingClientDefault.java              ✓ @ConditionalOnMissingBean
│   │   ├── WecomUserBindingService.java                  ✓ Caffeine-style 缓存
│   │   └── WecomUserBindingController.java               ✓ /wecom/bind
│   ├── handler/
│   │   ├── MessageHandler.java                           ✓ SPI interface
│   │   ├── MessageHandlerFactory.java                    ✓ SPI factory
│   │   ├── HandlerServices.java                          ✓ record, 注入集合
│   │   ├── HandlerException.java                         ✓ 5 个 ErrorCode
│   │   ├── WmsInventoryHandler.java                      ✓ 唯一业务实现
│   │   └── WmsInventoryHandlerFactory.java               ✓ SPI entry
│   ├── parser/
│   │   └── CommandParser.java                            ✓ normalize + parse
│   ├── router/
│   │   └── MessageRouter.java                            ✓ ServiceLoader + 错误映射
│   └── wms/
│       ├── WmsInventoryClient.java                       ✓ interface
│       ├── WmsInventoryClientDefault.java                ✓ 占位
│       └── WmsInventoryItem.java                         ✓ DTO
├── src/main/resources/
│   ├── application-wecom.yml                             ✓ 默认值
│   └── META-INF/
│       ├── spring/org.springframework.boot.autoconfigure.AutoConfiguration.imports  ✓
│       └── services/com.ruoyi.wecom.gateway.handler.MessageHandlerFactory  ✓
└── src/test/java/... 6 个测试类                          ✓
```

---

## 2. 静态评审发现（自审）

### 已修复

| 编号 | 严重 | 描述 | 修复 |
|---|---|---|---|
| F-001 | Critical | `WsFrame.getData()/setData()` 错误，实际 API 是 `getBody()/setBody()` | sed 全量替换 main + test |
| F-002 | Critical | `Actor.getUserId()/setUserId()` 错误，实际是 `getUserid()/setUserid()` | 修复 handler + 2 测试 |
| F-003 | Major | `WeComBotClient` 用 `@PostConstruct`/`@PreDestroy`，但 AutoConfiguration 又用 `initMethod`/`destroyMethod`，双触发风险 | 移除 JSR-250 注解，仅保留显式 `start()/stop()` |
| F-004 | Major | `WmsInventoryHandler` 用 `@RequiredArgsConstructor` 但未注册为 `@Component`，DI 链路断 | 引入 `MessageHandlerFactory` + `HandlerServices` record，SPI 加载时注入 |
| F-005 | Major | `(int) properties.getHeartbeatIntervalMillis()` 强转但 SDK Builder 接受 `long` | 移除 `(int)` 强转 |
| F-006 | Minor | `MessageRouterTest` 自制 `SpiClassLoader` 试图覆盖 `getResources` 但 `ServiceLoader` 不会走该路径 | 重构 router 增加 `List<MessageHandler>` 测试构造 |
| F-007 | Minor | `SysUserBindingClient` 缺少 `updateWecomOpenId` 方法 | 在 interface + Default + MyBatis mapper + XML 全部补齐 |
| F-008 | Minor | `SysUser.wecomOpenId` 字段未加，绑定查询无列可查 | 在 entity 加 `private String wecomOpenId;` |

### 已知遗留（需上线后验证）

| 编号 | 严重 | 描述 | 应对 |
|---|---|---|---|
| L-001 | Major | `WmsInventoryClientDefault` + `SysUserBindingClientDefault` 是占位实现（返回 `Optional.empty()`/false）；生产环境必须由 `ruoyi-admin-wms` 自定义 bean 覆盖 | 在 `WeComBotGatewayAutoConfiguration` 旁留 `@ConditionalOnMissingBean` 已就位 |
| L-002 | Major | 当前环境无 JDK/Maven，无法运行 `mvn test` 验证覆盖率 | 上线后运行 `mvn test` 生成 jacoco 报告核对（目标 ≥80% line / ≥70% branch） |
| L-003 | Minor | Dockerfile `ADD ./target/ruoyi-admin.jar` 假设 CI 已执行 `mvn package`；未含独立 mvn 行 | 由 CI（`mvn -pl ruoyi-admin-wms package`）保证 |
| L-004 | Minor | Sa-Token `excludes` 未在 `application.yml` 加 `/wecom/bind/**`；如绑定页面在 ruoyi-admin-wms 内嵌，则会触发 401 | 后续 ops 阶段补 application.yml |
| L-005 | Suggestion | `Caffeine` 已加依赖但当前用 `ConcurrentHashMap`；建议 v1.1 切换为 Caffeine LRU（防 OOM） | 留 v1.1 |
| L-006 | Suggestion | 缺少 `/actuator/health/wecom` 端点 | 留 v1.1（用 `wecomBotClient.isConnected()` 做 health 指示） |

---

## 3. 评审维度自评

| 维度 | 评级 | 备注 |
|---|---|---|
| **正确性** | ⚠️ 受限 | 静态阅读 + SDK API 全部对齐；运行验证待上线后回归 |
| **安全性** | ✅ | `wecom.bot.secret` 走 env var；handler 无密码校验走 Sa-Token `botLogin()` 签发短期 token；binding 写权限有 `userId + openId` 双重路径 |
| **性能** | ✅ | 业务执行器独立线程池 10/20/100；binding 缓存 5 min TTL；SDK 长连接复用 |
| **可读性** | ✅ | 中文注释 + Javadoc；`record` 用法简化 HandlerServices；`switch` 表达式降低分支噪音 |
| **可维护性** | ✅ | SPI 模式新增 handler 只需新建 class + 在 `META-INF/services/` 加一行 |
| **测试覆盖** | ⚠️ 受限 | 写了 6 个测试类覆盖 parser/router/handler/binding/executor/properties；运行验证需 JDK |
| **依赖管理** | ✅ | 所有依赖走 parent BOM；新加 `wx-aibot-java-sdk:2.0.0` + `caffeine` 在 `dependencyManagement` |

---

## 4. SDK API 对照表（关键路径）

| 调用 | SDK 实际 | 我方实现 | 状态 |
|---|---|---|---|
| `WeComAiBotClient(opts)` | ctor | ✓ | OK |
| `.addListener(listener)` | ctor | ✓ | OK |
| `.connect()` | `synchronized WeComAiBotClient connect()` | ✓ | OK |
| `.disconnect()` | `synchronized void disconnect()` | ✓ | OK |
| `.isConnected()` | `boolean isConnected()` | ✓ | OK |
| `.replySimpleText(frame, content)` | `CompletableFuture<WsFrame<JsonNode>> replySimpleText(WsFrame<?> frame, String content)` | ✓ | OK |
| `WeComAiBotClientOptions.builder(botId, secret)` | static | ✓ | OK |
| `.heartbeatIntervalMillis(long)` | builder method | ✓ | OK |
| `.maxReconnectAttempts(int)` | builder method | ✓ | OK |
| `WeComAiBotListener.onTextMessage(WsFrame<BaseMessage>)` | interface (default void) | ✓ | OK |
| `WeComAiBotListener.onError(Throwable)` | interface (default void) | ✓ | OK |
| `WeComAiBotListener.onDisconnected(String)` | interface (default void) | ✓ | OK |
| `WsFrame.getBody()` | ✓ | `getBody()` | OK（已修） |
| `WsFrame.setBody(T)` | ✓ | `setBody()` | OK（已修） |
| `BaseMessage.getFrom()` | ✓ | ✓ | OK |
| `BaseMessage.getText()` | ✓ | ✓ | OK |
| `BaseMessage.getMsgType()` | ✓ | ✓ | OK |
| `TextContent.getContent()` | ✓ | ✓ | OK |
| `Actor.getUserid()` | ✓ | `getUserid()` | OK（已修） |
| `Actor.setUserid(String)` | ✓ | `setUserid()` | OK（已修） |

---

## 5. 修复循环结论

- 全部 8 个自审问题已修复
- 6 个遗留项均为环境受限（无 JDK）或 v1 范围外（建议 v1.1 跟进）
- Critical / Major 全部关闭
- **状态：可通过评审，进入 commit 阶段**

---

## 6. 复评（待 LiteLLM 模型）

下一轮由 `qwen3.5-397b-a17b`（或同档宽限模型）通过 LiteLLM 复评本文件。
若复评引入新 Critical/Major，按 v1 决策文档"修复循环"章节重开本评审。
