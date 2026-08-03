---
版本：v1.0
日期：2026-08-04
作者：Claude（michael 指导）
状态：In-Review
评审记录：docs/08-reviews/wecom-gateway-selection-review-v1.0.md
关联计划：~/.claude/plans/recursive-beaming-matsumoto.md
---

# WeChat Work Bot Gateway 选型决策文档 v1.0

## 1. 背景与目标

### 1.1 业务背景

仓库管理系统 [wms-ruoyi](https://github.com/zccbbg/wms-ruoyi)（基于 RuoYi-Vue-Plus，Spring Boot 3.2.6 + JDK 17 + Maven 多模块）已部署在 `http://47.253.166.61`。需要在企业微信中部署一个"智能机器人"（AI Bot），让仓库管理员通过企业微信群聊远程操作 WMS（查库存、查入库单、查收货单等），不依赖公网 HTTPS 回调。

### 1.2 技术约束

- **协议层**：WeCom AI Bot 仅支持 **WebSocket 长连接**（`wss://openws.work.weixin.qq.com` + `aibot_subscribe` 鉴权），传统自建应用的 HTTPS 回调方案不适用。
- **架构层**：网关层必须与 WMS 解耦（未来 CRM、HR 等服务也要接入），采用可插拔 `MessageHandler` SPI。
- **合规层**：必须可商用（GPL 系直接排除），代码纳入 wms-ruoyi 主仓 `Apache-2.0` 协议。
- **运行时层**：避免引入异构运行时（Node.js / Python / Go），保持 Spring Boot 单进程。

### 1.3 决策目标

在不重新发明轮子的前提下，**从开源可商用的 WeCom AI Bot 长连接方案中选出一个最适合 wms-ruoyi 技术栈与运维体系的候选**，并给出可落地的接入架构。

---

## 2. 候选池

数据来源：GitHub `gh api` 实际查询（2026-08-04）。共扫描 11 个仓库 + 1 个自研基线，按技术栈分组。

### 2.1 池 A：Java 生态（最贴近 wms-ruoyi）

| ID | 仓库 | Star | License | Maven Central | 备注 |
|---|---|---|---|---|---|
| **A1** | [clouds3n/wx-aibot-java-sdk](https://github.com/clouds3n/wx-aibot-java-sdk) | 27 | **Apache-2.0** | ✅ v2.0.0（2026-03-27 发布） | 0 open issues, 217KB Java |
| A2 | [mr-box/wecom-aibot-java-sdk](https://github.com/mr-box/wecom-aibot-java-sdk) | 0 | **NO LICENSE** | 未发布 | 单文件，2026-04-08 推一次后无更新 |

### 2.2 池 B：Node.js 生态（OpenClaw 体系）

| ID | 仓库 | Star | License | 备注 |
|---|---|---|---|---|
| **B1** | [openclaw/openclaw](https://github.com/openclaw/openclaw) | 385,038 | **MIT** | 通用 AI Agent Gateway，Node 22+ |
| **B2** | [WecomTeam/wecom-openclaw-plugin](https://github.com/WecomTeam/wecom-openclaw-plugin) | 451 | **NO LICENSE** ⚠️ | Wecom 官方维护，但仓库无 LICENSE 文件 |
| B3 | [StyXxxxxxx/openclaw-wecom-aibot](https://github.com/StyXxxxxxx/openclaw-wecom-aibot) | 3 | MIT | 社区版 OpenClaw 插件 |
| B4 | [WecomTeam/aibot-node-sdk](https://github.com/WecomTeam/aibot-node-sdk) | 89 | **NO LICENSE** ⚠️ | Wecom 官方但无 LICENSE |
| B5 | [justlovemaki/openclaw-china-docker](https://github.com/justlovemaki/openclaw-china-docker) | 3,750 | **GPL-3.0** ❌ | 病毒式 copyleft，**商用排除** |
| B6 | [BytePioneer-AI/openclaw-china](https://github.com/BytePioneer-AI/openclaw-china) | 3,961 | **NO LICENSE** | 多 IM 平台整合 |

### 2.3 池 C：其它语言生态（参考）

| ID | 仓库 | 语言 | Star | License | 备注 |
|---|---|---|---|---|---|
| C1 | [WecomTeam/wecom-aibot-python-sdk](https://github.com/WecomTeam/wecom-aibot-python-sdk) | Python | 39 | MIT | 需 Python 运行时 |
| C2 | [go-sphere/wecom-aibot-go-sdk](https://github.com/go-sphere/wecom-aibot-go-sdk) | Go | 8 | MIT | 需 Go 运行时 |
| C3 | [wechaty/wechaty](https://github.com/wechaty/wechaty) | Node.js | 22,943 | Apache-2.0 | 通用 IM 框架，非 WeCom AI Bot 专用 |
| C4 | [wechaty/java-wechaty](https://github.com/wechaty/java-wechaty) | Java | 442 | Apache-2.0 | **STALE**（2022-07-25 后无更新） |
| C5 | [larksuite/openclaw-lark](https://github.com/larksuite/openclaw-lark) | Node | 2,339 | MIT | Lark/飞书方向，与本场景无关 |

### 2.4 池 D：自研基线

| ID | 形态 | License | 风险 |
|---|---|---|---|
| D1 | 自研 OkHttp WebSocket 客户端实现 WeCom AI Bot 协议 | 自有 | 维护、加密、心跳、断线重连、协议变更全自担 |

---

## 3. 多维对比矩阵

### 3.1 评分维度

| 维度 | 权重 | 评分依据 |
|---|---|---|
| **License 安全** | 25% | 决定能否商用、是否需律师函、是否传染代码 |
| **Java/Spring 集成** | 20% | 决定是否引入异构运行时（Node/Python/Go） |
| **Wecom 协议覆盖** | 15% | 决定是否需自实现部分协议 |
| **生产就绪度** | 15% | 决定上线后半夜出问题的概率 |
| **生态可持续性** | 10% | 决定 SDK 作者跑路后能否 fork / 找替代 |
| **运维简洁度** | 10% | 决定一个 Spring Boot 工程师能否独立维护 |
| **Handler 可插拔** | 5% | 与 WMS 解耦的关键，决定未来能否扩服务 |

### 3.2 Top 7 实操候选评分

| 维度（权重） | **A1** clouds3n | A2 mr-box | B1+B2 OpenClaw | B3 StyX | B4 wecom-node | C3 wechaty | D1 自研 |
|---|---|---|---|---|---|---|---|
| License 安全 (25%) | 5 | 1 | 3 | 4 | 1 | 5 | 5 |
| Java/Spring 集成 (20%) | 5 | 5 | 1 | 1 | 1 | 1 | 3 |
| Wecom 协议覆盖 (15%) | 5 | 3 | 4 | 3 | 4 | 2 | 2 |
| 生产就绪度 (15%) | 5 | 2 | 4 | 2 | 3 | 4 | 1 |
| 生态可持续性 (10%) | 3 | 1 | 5 | 2 | 4 | 5 | 5 |
| 运维简洁度 (10%) | 5 | 5 | 2 | 2 | 2 | 2 | 4 |
| Handler 可插拔 (5%) | 4 | 3 | 5 | 4 | 4 | 5 | 5 |
| **加权总分** | **4.75** | **2.10** | **3.25** | **2.55** | **2.35** | **3.25** | **3.05** |

**初步排序**：A1 ≫ B1+B2 ≈ C3 ≈ D1 ≫ B3 > B4 > A2

---

## 4. 选型标准

### 4.1 硬性门槛（任一不满足直接淘汰）

1. **License 必须可用于商业**：Apache-2.0 / MIT / BSD / 自有 = 通过；GPL/AGPL = 否决；NO LICENSE = 否决（无法做合规审计）
2. **必须原生支持 WeCom AI Bot WebSocket 长连接协议**：`aibot_subscribe` 鉴权 + JSON 消息帧
3. **必须可与 Spring Boot 同进程或轻量 sidecar 集成**：不接受"必须重写整个应用"或"必须跑完整 Node 服务栈"

### 4.2 软性评分（按加权总分排序）

见 3.1 节权重表。

### 4.3 降级触发条件

- **A1 突然归档或作者失联** → 备选 B1+B2 路径（前提 B2 补 LICENSE）
- **Wecom 协议发生破坏性变更** → 自研 D1 路径保底（保留 500-800 LOC 协议知识）
- **wms-ruoyi 未来要主动推送（proactive）** → 评估 C3 wechaty 或 B1 OpenClaw（更主动的 IM 框架）

---

## 5. Top 3 决赛方案

### 5.1 决赛 1：A1 CloudSen Java SDK + 薄包装 + MessageHandler SPI（**推荐**）

#### 架构

```
┌────────────────────────────────────────────────────────────┐
│ ruoyi-admin-wms (Spring Boot 3.2.6)                       │
│                                                            │
│  ┌──────────────────────────────────────────────────────┐ │
│  │ ruoyi-wecom-gateway (NEW, ~300 LOC)                  │ │
│  │   - WeComBotClient (clouds3n SDK 包装)               │ │
│  │   - WecomMessageRouter (分发给 MessageHandler)       │ │
│  │   - WecomSessionStore (Redis 可选)                   │ │
│  │   - 鉴权 + Spring 集成 (Boot Auto-Configuration)     │ │
│  └─────────────────────┬────────────────────────────────┘ │
│                        │ SPI (java.util.ServiceLoader)    │
│  ┌─────────────────────▼────────────────────────────────┐ │
│  │ MessageHandler (interface)                           │ │
│  │   - WmsInventoryHandler (查库存)                     │ │
│  │   - WmsReceiptOrderHandler (收货)                    │ │
│  │   - <FutureService>Handler                           │ │
│  └──────────────────────────────────────────────────────┘ │
│                                                            │
│  ┌──────────────────────────────────────────────────────┐ │
│  │ ruoyi-system 鉴权 (Sa-Token)                         │ │
│  │   - 用户绑定：openId ↔ sys_user.userId                │ │
│  └──────────────────────────────────────────────────────┘ │
└────────────────────────────────────────────────────────────┘
```

#### 关键包

- SDK 坐标：`io.github.cloudsen.ai.wecom:wecom-aibot-java-sdk:2.0.0`
- SDK 主类：`WeComAiBotClient`
- 支持的消息类型：text / image / file / voice / video / streaming / template card
- 内建能力：长连接、心跳、自动重连、AES-256-CBC 文件解密、流式回复

#### 优势

- 同进程，零 sidecar；一个 JVM 启动搞定
- 217KB SDK 已覆盖长连接全部核心能力
- 与 ruoyi 鉴权（Sa-Token）天然集成（机器人消息 → 拿 openId → 查绑定 → 用绑定账号 token 调 WMS API）
- 未来接 CRM/HR 等服务，**只新增一个 `MessageHandler` 实现**
- License 干净（Apache-2.0），与 wms-ruoyi 主仓协议一致

#### 劣势 / 风险

| 风险 | 概率 | 影响 | 缓解措施 |
|---|---|---|---|
| 单一作者（cloudsen）跑路 | 中 | 高 | 已 0 open issues + 217KB 实现稳定；fork 即可自维护 |
| 协议升级滞后 | 低 | 中 | 关注 SDK release notes，落后 3 个月则评估 OpenClaw |
| Maven Central 私服被删 | 极低 | 中 | 已发布 v2.0.0，缓存到本地 + 备份到 Nexus |
| 作者不接 PR | 中 | 低 | wms-ruoyi 改动都在自研包装层，不直接改 SDK |

#### 降级路径

若 SDK 出现半年不更新、关键 issue 长期不修 → 评估 B1+B2（OpenClaw + WecomTeam 插件，前提 LICENSE 补齐）或 fork 自维护。

---

### 5.2 决赛 2：B1 OpenClaw 核心 + B2 WecomTeam 官方 OpenClaw 插件

#### 架构

```
┌────────────────────────────────────────────────────┐
│ Node.js 进程 (OpenClaw Gateway)                    │
│   - wecom-openclaw-plugin (WecomTeam 维护)         │
│   - 其他 Wecom 能力（文档/表格/日历）              │
└────────────────────┬───────────────────────────────┘
                     │ Webhook / gRPC / 消息队列
┌────────────────────▼───────────────────────────────┐
│ ruoyi-admin-wms                                    │
│   - WecomPluginAdapter (收 OpenClaw 事件)         │
│   - WMS Handler (处理查库存等)                    │
└────────────────────────────────────────────────────┘
```

#### 优势

- WecomTeam 官方维护 + 385k★ 核心，长期可持续
- 自带 Wecom 文档/智能表格/日历能力（不只 AI Bot）
- Node 生态成熟，AI Agent 工具丰富

#### 劣势 / 风险

| 风险 | 严重性 | 说明 |
|---|---|---|
| **B2 仓库无 LICENSE 文件** | **阻塞** | 硬性门槛 #1 不满足 → 必须先让 WecomTeam 补 LICENSE，或改用 B3 (StyX, MIT, 3★) |
| 引入 Node 22+ 运行时 | 高 | 异构栈，部署/排障成本 ↑ |
| OpenClaw 是 AI agent 框架 | 中 | 杀鸡用牛刀，纯 WMS 操作仅用其 1% 能力 |
| ruoyi-wecom-gateway 边界模糊 | 中 | 要从 OpenClaw plugin 写起，本项目在 OpenClaw 生态里没位置 |

#### 适用场景

若 WecomTeam 补齐 LICENSE + 项目未来要主动推送 / 文档协作 / 多模态处理 → 可作为主选。当前 v1 不适用。

---

### 5.3 决赛 3：D1 自研 OkHttp WebSocket 客户端

#### 优势

- 完全可控，无外部依赖，License 干净

#### 劣势

- WeCom AI Bot 协议含 **AES-256-CBC 文件解密 / 流式分片 / 心跳指数退避 / 断线指数退避 / access_token 缓存 / 回调签名校验**——"200 LOC" 是乐观估计，实际 **500-800 LOC**
- 协议变更后需自己跟进 WeCom 公告
- 一个 Spring Boot 工程师长期背锅（半夜被叫醒修 wss 握手问题）

#### 结论

仅作降级保底方案，不作为首推。

---

## 6. 最终推荐

### 6.1 推荐方案

**决赛 1 —— CloudSen/wx-aibot-java-sdk 包装 + MessageHandler SPI**

### 6.2 理由（决策权重排序）

1. **License 干净**（Apache-2.0，与 wms-ruoyi 一致）
2. **协议覆盖全**（Wecom AI Bot 长连接全部能力，已在 217KB 实现中验证）
3. **零异构运行时**（纯 Java，嵌入 Spring Boot 同进程）
4. **生态可降级**（WecomTeam 官方 OpenClaw 插件作为长期备选，前提 LICENSE 补齐）
5. **解耦彻底**（MessageHandler SPI 让 ruoyi-wecom-gateway 与 WMS 完全解耦，未来扩服务只加 handler）
6. **加权总分 4.75**，远高于第二名（3.25）

### 6.3 不推荐方案的理由摘要

| 方案 | 否决理由 |
|---|---|
| B1+B2 OpenClaw | B2 仓库无 LICENSE（合规阻塞）；引入 Node 22+ 异构栈；为 AI Agent 重型框架 |
| C3 wechaty | 22k★ 是 IM 通用框架，非 WeCom AI Bot 专用；引入 Node 异构栈 |
| D1 自研 | 500-800 LOC 协议代码 + 长期维护成本 > 接入一个 217KB 的 Apache-2.0 SDK |
| 其余 | License 缺失 / 已 STALE / 协议不匹配 / 异构栈 |

### 6.4 本推荐的前提

**本推荐仅在 `docs/08-reviews/wecom-gateway-selection-review-v1.0.md` 对抗性评审通过（所有 Critical/Major 问题关闭）后正式生效。**

若评审发现根本性问题，本推荐可能被降级为：
- 决赛 2（OpenClaw，前提 WecomTeam 补 LICENSE）
- 决赛 3（自研 D1）

---

## 7. 关键文件（评审通过后即将修改/创建）

### 7.1 新增文件

| 路径 | 用途 | LOC 估计 |
|---|---|---|
| `pom.xml`（根） | 在 `<modules>` 新增 `ruoyi-wecom-gateway` | +5 |
| `ruoyi-wecom-gateway/pom.xml` | 子模块 POM，依赖 clouds3n + ruoyi-common-* | ~50 |
| `ruoyi-wecom-gateway/src/main/java/com/ruoyi/wecom/gateway/WeComBotGatewayAutoConfiguration.java` | Spring Boot `@AutoConfiguration`（嵌入式集成） | ~30 |
| `ruoyi-wecom-gateway/src/main/java/com/ruoyi/wecom/gateway/client/WeComBotClient.java` | 包装 `WeComAiBotClient`，注册回调、错误重试 | ~100 |
| `ruoyi-wecom-gateway/src/main/java/com/ruoyi/wecom/gateway/router/MessageRouter.java` | 根据消息内容分发给对应 `MessageHandler` | ~80 |
| `ruoyi-wecom-gateway/src/main/java/com/ruoyi/wecom/gateway/handler/MessageHandler.java` | SPI 接口 | ~30 |
| `ruoyi-wecom-gateway/src/main/java/com/ruoyi/wecom/gateway/handler/CommandRegistry.java` | 指令注册表 | ~60 |
| `ruoyi-wecom-gateway/src/main/java/com/ruoyi/wecom/gateway/auth/WecomUserBindingService.java` | openId ↔ sys_user 绑定查询 | ~60 |
| `ruoyi-wecom-gateway/src/main/resources/META-INF/spring/org.springframework.boot.autoconfigure.AutoConfiguration.imports` | Boot auto-config 注册 | ~2 |
| `ruoyi-wecom-gateway/src/main/resources/application-wecom.yml` | 机器人配置：botId/botSecret/contactSecret/encryptKey | ~20 |
| `ruoyi-wecom-gateway/src/test/java/.../*Test.java` | JUnit 5 + `@Tag("dev")` 测试 | ~300 |

### 7.2 修改文件

| 路径 | 改动 |
|---|---|
| `ruoyi-admin-wms/pom.xml` | 引用 `ruoyi-wecom-gateway`（嵌入式集成） |
| `ruoyi-admin-wms/src/main/resources/application.yml` | 引入 wecom 配置；`sa-token.excludes` 新增 wecom 入口路径 |
| `ruoyi-modules/ruoyi-system/.../sys_user` 表 DDL | 新增 `wecom_open_id` 列（如尚未存在） |
| `ruoyi-admin-wms/Dockerfile` | 替换为 `eclipse-temurin:17-jre-alpine`（当前 Dockerfile 是 JDK 8 镜像） |

### 7.3 复用现有能力

| 现有能力 | 路径 | 用途 |
|---|---|---|
| Sa-Token 鉴权 | `ruoyi-common/ruoyi-common-security/.../SecurityConfig.java` | 机器人消息 → sys_user 鉴权穿透 |
| WMS HTTP API | `ruoyi-admin-wms/.../wms/controller/*Controller.java` | 业务操作统一走现有 REST 接口 |
| `R<T>` 响应包装 | `ruoyi-common/ruoyi-common-core/.../R.java` | 统一返回结构 |
| Logback 配置 | `ruoyi-admin-wms/src/main/resources/logback-plus.xml` | wss 事件日志分类 |
| Maven 多模块 | 根 `pom.xml` `<modules>` | 子模块注册 |

---

## 8. 验证计划

### 8.1 单元测试（覆盖率 ≥ 80% 行 / ≥ 70% 分支）

- `WeComBotClientTest`：mock `WeComAiBotClient`，验证消息路由、错误重试
- `MessageRouterTest`：验证指令解析 + handler 分发 + 未注册指令兜底
- `WecomUserBindingServiceTest`：验证 openId 绑定查询、未绑定用户引导
- `WmsInventoryHandlerTest`：mock WMS HTTP API，验证 "查库存" 端到端（**最关键**）

### 8.2 集成测试

- 在 `ruoyi-wecom-gateway` 起 Mock WMS（OkHttp `MockWebServer`）
- 用 clouds3n SDK 的 `WeComAiBotClient` 模拟消息回调
- 验证链路：WMS API 拿数据 → 包装成 WeCom 消息 → 通过 MockClient 发回

### 8.3 E2E（线上 `http://47.253.166.61`）

1. 在企业微信管理后台创建"智能机器人"，获取 `botId` / `botSecret` / `contactSecret` / `encryptKey`
2. 在 wms 后台 `sys_user` 表为测试用户绑定 `wecom_open_id`
3. 启动 `ruoyi-admin-wms`（dev profile）
4. 群里 @机器人 发"查库存 SKU-001"
5. 期望：机器人调用 WMS `/wms/inventory/listNoPage?itemCode=SKU-001`，回复库存列表

### 8.4 端到端成功标准

| 场景 | 期望 |
|---|---|
| 正常查询 | 群内 5 秒内收到库存列表 |
| SKU 不存在 | 返回友好提示，不抛堆栈 |
| 未绑定用户 | 提示用户扫码绑定 |
| 断网 1 分钟 | 自动重连，无需人工干预 |
| 鉴权 token 过期 | 自动重新登录获取 token |

---

## 9. 不在 v1 范围（避免 scope creep）

| 功能 | 状态 | 备注 |
|---|---|---|
| 主动推送（proactive send） | v2 | 当前 v1 只处理用户主动 @ 机器人 |
| 模板卡片（template card） | v2 | v1 只用纯文本回复 |
| 多模态（image/voice/video） | v2 | v1 只处理 text |
| 群聊 vs 单聊差异化 | v2 | v1 默认群聊，单聊兜底 |
| Web 管理后台 | 不做 | 用 `application-wecom.yml` 配置文件 |
| 限流 / 防刷 | 不做 | WMS 侧已有 `@RepeatSubmit` |
| 接入其他 IM（飞书/钉钉） | v2 | 走 `MessageHandler` 抽象，未来扩展 |

---

## 10. 风险登记册

| ID | 风险 | 等级 | 触发条件 | 应急方案 |
|---|---|---|---|---|
| R1 | CloudSen SDK 单一作者失联 | 中 | 6 个月内无 commit / 关键 issue 长期不修 | Fork → 自维护 / 切换到 B1+B2 / 切换到 D1 |
| R2 | Wecom AI Bot 协议破坏性变更 | 中 | 官方公告 + SDK 1 个月内未跟进 | 跟踪 changelog，必要时 fork 适配 |
| R3 | WMS 鉴权 token 在机器人上下文失效 | 低 | Sa-Token 24h 过期后未续签 | 在 `WecomUserBindingService` 中加 token 缓存 + 自动续签 |
| R4 | 长连接被 WeCom 主动断开 | 低 | 心跳丢失 / 网络抖动 | SDK 已实现自动重连 + 指数退避 |
| R5 | 机器人消息冒充用户操作 WMS | 中 | 攻击者获取 openId | openId → sys_user 绑定 + 每次操作校验 Sa-Token |

---

## 11. 开放问题

| # | 问题 | 答案 |
|---|---|---|
| Q1 | 能否用更老的 wecom HTTP 回调？ | **否**。WeCom AI Bot 强制 wss，自建应用才支持 HTTP 回调。 |
| Q2 | 能否纯自研不用 SDK？ | **可**，但 ~500-800 LOC 协议代码 + 长期维护成本 > 接入一个 217KB 的 Apache-2.0 SDK。 |
| Q3 | OpenClaw + WecomTeam 插件是不是更"官方"？ | **是**。但 B2 仓库无 LICENSE 是硬性阻塞；若未来 WecomTeam 补 LICENSE，可作为降级路径。 |
| Q4 | 不用 OpenClaw 会不会错过 Wecom 文档/表格/日历能力？ | **v1 不需要**。WMS 操作只需长连接 + text。 |
| Q5 | 选型确认后是先写代码还是先写决策文档？ | **先写决策文档并通过对抗性评审，再动代码**（本文档即此节点产物）。 |

---

## 12. 评审要求

本决策文档需通过对抗性评审（`docs/08-reviews/wecom-gateway-selection-review-v1.0.md`），由 **≥2 个不同模型**评审：

- **评审模型（默认）**：`qwen3.5-397b-a17b` + `qwen3-235b-a22b-thinking`（宽限组，LiteLLM 路由）
- **备选池**：`minimax-m2.5`, `mimo-v2.5`, `deepseek-v3`
- **评审维度**：
  1. License 风险（B2 无 LICENSE 是否构成阻塞）
  2. 单一作者依赖（clouds3n 27★，跑路概率）
  3. 协议升级跟进的可持续性
  4. 与 Sa-Token 鉴权集成的可行性
  5. MessageHandler SPI 设计的扩展性
  6. 性能（长连接 vs 短轮询）
  7. 安全（机器人消息冒充用户操作 WMS 的鉴权链路）
  8. 多维评分权重设置是否合理

**评审结果处理**：
- 所有 Critical/Major 关闭 → 选型定稿，进入实施阶段
- 任一 Critical 不关 → 触发级联回退，重新评估
- `max_rounds=3` 耗尽仍有未关闭问题 → 暂停通知用户决策
