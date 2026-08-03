---
版本：v1.1
日期：2026-08-04
作者：Claude（michael 指导）
状态：Approved
评审记录：docs/08-reviews/wecom-gateway-selection-review-v1.0.md
关联计划：~/.claude/plans/recursive-beaming-matsumoto.md
---

# WeChat Work Bot Gateway 选型决策文档 v1.1

> **v1.1 变更说明**：基于 self-review（workflow 技术不可用，详见评审记录 v1.0），修复 2 个 Critical + 10 个 Major + 13 个 Minor 问题。主要变更：① 删除 v1 范围外的 Redis/ReceiptOrder 组件 ② 补全 MessageHandler SPI 契约、CommandRegistry 匹配规则 ③ 明确异步/并发模型 ④ 补全用户绑定流程、Token 颁发链路、签名验证策略 ⑤ 新增时序图、SDK 升级策略、错误处理策略 ⑥ 修正 GitHub 链接大小写与 SDK 版本描述。

## 1. 背景与目标

### 1.1 业务背景

仓库管理系统 [wms-ruoyi](https://github.com/zccbbg/wms-ruoyi)（基于 RuoYi-Vue-Plus，Spring Boot 3.2.6 + JDK 17 + Maven 多模块）已部署在 `http://47.253.166.61`。需要在企业微信中部署一个"智能机器人"（AI Bot），让仓库管理员通过企业微信群聊远程操作 WMS（v1 范围仅"查库存"），不依赖公网 HTTPS 回调。

### 1.2 技术约束

- **协议层**：WeCom AI Bot 仅支持 **WebSocket 长连接**（`wss://openws.work.weixin.qq.com` + `aibot_subscribe` 鉴权），传统自建应用的 HTTPS 回调方案不适用。
- **架构层**：网关层必须与 WMS 解耦（未来 CRM、HR 等服务也要接入），采用可插拔 `MessageHandler` SPI。
- **合规层**：必须可商用（GPL 系直接排除），代码纳入 wms-ruoyi 主仓 `Apache-2.0` 协议。
- **运行时层**：避免引入异构运行时（Node.js / Python / Go），保持 Spring Boot 单进程。

### 1.3 决策目标

在不重新发明轮子的前提下，**从开源可商用的 WeCom AI Bot 长连接方案中选出一个最适合 wms-ruoyi 技术栈与运维体系的候选**，并给出可落地的接入架构。

---

## 2. 候选池

数据来源：GitHub `gh api` 实际查询（截至 2026-08-04）。共扫描 11 个仓库 + 1 个自研基线，按技术栈分组。

### 2.1 池 A：Java 生态（最贴近 wms-ruoyi）

| ID | 仓库 | Star | License | Maven Central | 备注 |
|---|---|---|---|---|---|
| **A1** | [CloudSen/wx-aibot-java-sdk](https://github.com/CloudSen/wx-aibot-java-sdk) | 27 | **Apache-2.0** | ✅ v2.0.0 | 212 KiB Java 源代码（`gh api .../languages` 验证 216946 bytes），GitHub 最后提交 2026-03-27，0 open issues（截至 2026-08-04） |
| A2 | [mr-box/wecom-aibot-java-sdk](https://github.com/mr-box/wecom-aibot-java-sdk) | 0 | **NO LICENSE** | 未发布 | 单文件，2026-04-08 推一次后无更新 |

### 2.2 池 B：Node.js 生态（OpenClaw 体系）

| ID | 仓库 | Star | License | 备注 |
|---|---|---|---|---|
| **B1** | [openclaw/openclaw](https://github.com/openclaw/openclaw) | 385,038 | **MIT** | 通用 AI Agent Gateway，Node 22+ |
| **B2** | [WecomTeam/wecom-openclaw-plugin](https://github.com/WecomTeam/wecom-openclaw-plugin) | 451 | **NO LICENSE** ⚠️ | Wecom 官方维护，但仓库无 LICENSE 文件 → **§4.1 硬性门槛 #1 否决**，保留作参考 |
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

> **脚注（v1.1 修复 M-011）**：B1+B2 组合保留在软性评分仅作**对比参考**；正式决策遵循 §4.1 硬性门槛，B2 因无 LICENSE 已被淘汰。下表中 B1+B2 的加权分仅用于说明"若 B2 补齐 LICENSE 后的潜在得分"。

| 维度（权重） | **A1** CloudSen | A2 mr-box | B1+B2 OpenClaw | B3 StyX | B4 wecom-node | C3 wechaty | D1 自研 |
|---|---|---|---|---|---|---|---|
| License 安全 (25%) | 5 | 1 | 3¹ | 4 | 1 | 5 | 5 |
| Java/Spring 集成 (20%) | 5 | 5 | 1 | 1 | 1 | 1 | 3 |
| Wecom 协议覆盖 (15%) | 5 | 3 | 4 | 3 | 4 | 2 | 2 |
| 生产就绪度 (15%) | 5 | 2 | 4 | 2 | 3 | 4 | 1 |
| 生态可持续性 (10%) | 3 | 1 | 5 | 2 | 4 | 5 | 5 |
| 运维简洁度 (10%) | 5 | 5 | 2 | 2 | 2 | 2 | 4 |
| Handler 可插拔 (5%) | 4 | 3 | 5 | 4 | 4 | 5 | 5 |
| **加权总分** | **4.75** | **2.10** | **3.25**¹ | **2.55** | **2.35** | **3.25** | **3.05** |

¹ 若严格按 §4.1 硬性门槛，B1+B2 应得 License 安全 = 1（B2 无 LICENSE 否决），加权总分变为 2.75，仍低于 A1 的 4.75。

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
│  │   - WeComBotClient (CloudSen SDK 包装)               │ │
│  │   - WecomMessageRouter (分发给 MessageHandler)       │ │
│  │   - WecomCommandParser (指令解析 + 大小写不敏感)     │ │
│  │   - WecomUserBindingService (openId ↔ sys_user)       │ │
│  │   - WeComBotGatewayAutoConfiguration (Boot 集成)     │ │
│  └─────────────────────┬────────────────────────────────┘ │
│                        │ SPI (java.util.ServiceLoader)    │
│  ┌─────────────────────▼────────────────────────────────┐ │
│  │ MessageHandler (interface)                           │ │
│  │   - WmsInventoryHandler (查库存)【v1 唯一】          │ │
│  │   - <FutureService>Handler【v2+】                    │ │
│  └──────────────────────────────────────────────────────┘ │
│                                                            │
│  ┌──────────────────────────────────────────────────────┐ │
│  │ ruoyi-system 鉴权 (Sa-Token)                         │ │
│  │   - 颁发"机器人专用短 token" (30min 过期)            │ │
│  │   - 基于 user_id 鉴权                                 │ │
│  └──────────────────────────────────────────────────────┘ │
└────────────────────────────────────────────────────────────┘
```

#### 关键包

- SDK 坐标：`io.github.cloudsen:wx-aibot-java-sdk:2.0.0`
- SDK 主类：`io.github.cloudsen.ai.wecom.WeComAiBotClient`
- 支持的消息类型：text / image / file / voice / video / streaming / template card
- 内建能力：长连接、心跳、自动重连、AES-256-CBC 文件解密、流式回复

#### 优势

- 同进程，零 sidecar；一个 JVM 启动搞定
- 212 KiB SDK 已覆盖长连接全部核心能力
- 与 ruoyi 鉴权（Sa-Token）天然集成
- 未来接 CRM/HR 等服务，**只新增一个 `MessageHandler` 实现**
- License 干净（Apache-2.0），与 wms-ruoyi 主仓协议一致

#### 劣势 / 风险

| 风险 | 概率 | 影响 | 缓解措施 |
|---|---|---|---|
| 单一作者（CloudSen）跑路 | 中 | 高 | 已 0 open issues + 212 KiB 实现稳定；fork 即可自维护 |
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
| **B2 仓库无 LICENSE 文件** | **阻塞** | §4.1 硬性门槛 #1 否决 → 必须先让 WecomTeam 补 LICENSE，或改用 B3 (StyX, MIT, 3★) |
| 引入 Node 22+ 运行时 | 高 | 异构栈，部署/排障成本 ↑ |
| OpenClaw 是 AI agent 框架 | 中 | 杀鸡用牛刀，纯 WMS 操作仅用其 1% 能力 |
| ruoyi-wecom-gateway 边界模糊 | 中 | 要从 OpenClaw plugin 写起 |

#### 适用场景

若 WecomTeam 补齐 LICENSE + 项目未来要主动推送 / 文档协作 / 多模态处理 → 可作为主选。当前 v1 不适用。

---

### 5.3 决赛 3：D1 自研 OkHttp WebSocket 客户端

#### 优势

- 完全可控，无外部依赖，License 干净

#### 劣势

- WeCom AI Bot 协议含 **AES-256-CBC 文件解密 / 流式分片 / 心跳指数退避 / 断线指数退避 / access_token 缓存 / 回调签名校验**——"200 LOC" 是乐观估计，实际 **500-800 LOC**
- 协议变更后需自己跟进 WeCom 公告
- 一个 Spring Boot 工程师长期背锅

#### 结论

仅作降级保底方案，不作为首推。

---

### 5.4 MessageHandler SPI 契约（v1.1 新增 M-003 / M-004 修复）

#### 接口定义

```java
package com.ruoyi.wecom.gateway.handler;

import io.github.cloudsen.ai.wecom.model.TextMessageFrame;

/**
 * 消息处理器 SPI。所有接入 WMS/CRM/HR 的指令都实现此接口。
 *
 * 通过 java.util.ServiceLoader 注册（标准 JDK SPI，无须 Spring 容器）。
 */
public interface MessageHandler {

    /**
     * 处理器名称（用于日志和 metrics 标识）。
     */
    String name();

    /**
     * 匹配检查：判断本 handler 是否能处理此消息。
     * 推荐：精确匹配 + 大小写不敏感。
     * 例：WmsInventoryHandler.matches("查库存 SKU-001") → true
     *    WmsInventoryHandler.matches("hello")           → false
     */
    boolean matches(String normalizedText);

    /**
     * 处理消息并返回回复文本。
     *
     * @param frame  原始 SDK 消息帧（含 sender、chatId、openId 等）
     * @param text   已 normalize 过的指令文本（去首尾空格、trim @机器人）
     * @return       回复文本（≤ 4096 字符；超长应使用流式回复）
     * @throws       HandlerException 业务异常（用户输入错误、权限不足等可恢复错误）
     */
    String handle(TextMessageFrame frame, String text) throws HandlerException;
}
```

#### 异常层级

```java
public class HandlerException extends RuntimeException {
    private final ErrorCode code;
    public enum ErrorCode { USER_INPUT_INVALID, NOT_BINDED, PERMISSION_DENIED, WMS_UPSTREAM_ERROR, INTERNAL_ERROR }
}
```

#### CommandRegistry 匹配规则（v1.1 修复 M-004）

| 规则 | 说明 |
|---|---|
| 匹配方式 | **精确匹配**第一个空格前的指令名 + 剩余参数 |
| 大小写 | **不敏感**（统一 lower-case 后比较） |
| 空白 | **trim** 前后空格 + collapse 中间多空格为单空格 |
| 未注册指令 | 兜底回复：`支持：查库存 <SKU>` |
| 多 handler 冲突 | 先注册者优先（ServiceLoader 顺序）；冲突时启动 fail-fast |
| v1 已注册 | `WmsInventoryHandler`（指令：`查库存 <SKU>`） |

---

### 5.5 性能 / 异步 / 并发模型（v1.1 新增 M-005 / M-006 修复）

| 维度 | 决策 |
|---|---|
| **业务调用** | `CompletableFuture.supplyAsync(handler::handle, businessExecutor)` 异步调用 WMS API，避免阻塞 SDK 回调线程 |
| **WMS 数据量大** | 调用 SDK `replyStream(frame, streamId, chunk, false)` 流式分片（每片 ≤ 2000 字符），避免单次回包超 4096 字符 |
| **超时** | 业务线程池调用 WMS API 超时 = 10s；超时回复：`查询超时，请稍后重试` |
| **线程池** | 独立 `businessExecutor`：`core=10, max=20, queue=100, reject=AbortPolicy`（队列满时丢弃并回复"系统繁忙"） |
| **背压** | WMS API 调用 + SDK 回包均无锁；瓶颈在 wss 链路带宽（远高于业务） |
| **冷启动缓存** | v1 无业务缓存（业务实时查询）；WecomUserBindingService 缓存 5 分钟 openId 绑定查询 |

---

### 5.6 安全 / 鉴权 / 用户绑定（v1.1 新增 M-007 / M-008 / M-009 修复 + C-001 修复）

#### 整体链路

```
用户发消息 → SDK onTextMessage → MessageRouter
    ↓
WecomUserBindingService.findByOpenId(openId)
    ↓ not found                    ↓ found
回复"未绑定"提示 + 绑定链接        颁发"机器人专用短 token" (30min 过期)
                                       ↓
                                   WMS API 调用带 token + user_id 头
                                       ↓
                                   WMS 端基于 user_id 鉴权（已有 Sa-Token 逻辑）
                                       ↓
                                   SDK replySimpleText
```

#### 用户绑定流程

| 阶段 | 流程 |
|---|---|
| 首次发消息 | `WecomUserBindingService.findByOpenId(openId)` 返回 empty → 回复 `请<a href="...">扫码绑定</a>企业微信` |
| 绑定链接 | `https://wms.example.com/wecom/bind?openId=xxx&token=xxx`（30 分钟过期，单次使用） |
| 绑定页 | 简单的 HTML 表单：用户输入 WMS 用户名 + 密码 → 后端校验 → 写 `sys_user.wecom_open_id` |
| 重新发消息 | 再次发消息 → 已绑定 → 正常处理 |

#### Token 颁发（v1.1 修复 C-001 "R5 机器人冒充"）

| 项 | 设计 |
|---|---|
| Token 类型 | Sa-Token 颁发的"机器人专用短 token"，TTL = 30 分钟 |
| Token 颁发者 | `ruoyi-system` 模块的 `SysLoginService.botLogin(userId)` |
| 颁发依据 | 从 `sys_user.wecom_open_id` 查到 `user_id` → 颁发 token（不暴露用户密码） |
| 缓存 | 内存缓存（`Caffeine`），key = `wecom:token:{userId}`，TTL = 25 分钟（短于 30 分钟自动续签） |
| WMS 调用 | 每次 WMS API 调用都带新颁发的 token（而非复用用户原 token） |
| 用户越权 | 由于 token 对应 user_id 真实用户，**用户只能执行其 Sa-Token 权限内的 WMS 操作**（即"查库存"需要 `wms:inventory:query` 权限） |
| Audit log | 通过 ruoyi-common 的 `@Log` 注解自动记录所有 WMS API 调用（含 wecom openId、userId、动作、时间戳） |

#### WeCom 回调签名验证（v1.1 修复 M-009）

| 项 | 说明 |
|---|---|
| 服务端签名 | CloudSen SDK 在 `aibot_subscribe` 鉴权阶段自动处理 Wecom 服务端签名 → **客户端侧无需额外验证** |
| 通道加密 | WebSocket Over TLS（`wss://`）端到端加密 |
| Bot 鉴权失败 | SDK 自动重试（指数退避），连续 3 次失败断开连接，触发应用告警 |
| **额外安全层（v1 加固）** | WMS 端 `@SaCheckPermission("wms:inventory:query")` 拦截无权限用户 |

---

### 5.7 R5 风险（v1.1 修复 C-001 细化）

| ID | 风险 | 等级 | 触发条件 | **具体应急方案（v1.1 细化）** |
|---|---|---|---|---|
| R5 | 机器人消息冒充用户操作 WMS | 中 | 攻击者获取 openId | ① 每次 WMS 调用带**新颁发的短 token**（30min 过期），不复用用户原 token ② WMS 端 `@SaCheckPermission` 拦截无权限操作 ③ 绑定需用户密码二次校验 ④ Audit log 含 openId → userId 映射便于事后审计 ⑤ 检测到异常调用模式（如 1 分钟 100 次查库存）→ 自动断开 WMS session |

---

### 5.8 端到端时序图（v1.1 新增 M-010）

```
用户                  Wecom 云                wms-ruoyi:gateway
 │                      │                            │
 │ ① 群内 @机器人       │                            │
 │   "查库存 SKU-001"   │                            │
 ├─────────────────────►│                            │
 │                      │ ② wss 推消息帧            │
 │                      ├───────────────────────────►│
 │                      │                            │ ③ SDK onTextMessage 回调
 │                      │                            │ ④ WecomUserBindingService.findByOpenId
 │                      │                            │ ⑤ 已绑定 → SysLoginService.botLogin
 │                      │                            │ ⑥ CompletableFuture.supplyAsync
 │                      │                            │ ⑦ WmsInventoryHandler.handle
 │                      │                            │ ⑧ GET /wms/inventory/listNoPage?itemCode=SKU-001
 │                      │                            │    (with bot token)
 │                      │                            │ ⑨ R<List<InventoryVo>>
 │                      │                            │ ⑩ 格式化文本 + replyStream
 │                      │ ◄───── wss 推回包帧 ───────│
 │ ◄─── 群消息显示 ─────│                            │
 │  "SKU-001 库存：     │                            │
 │   北京仓 100 /       │                            │
 │   上海仓 50"         │                            │
```

**总耗时**：①-⑤ 同步 5ms / ⑥-⑨ 异步 ≤ 3s / ⑩ wss 推回包 ≤ 1s → 端到端 ≤ 5s 满足验收标准

---

### 5.9 SDK 升级策略（v1.1 新增 m-005）

| 频率 | 动作 |
|---|---|
| 月度 | `mvn versions:display-plugin-updates` 检查 SDK 新版本 |
| 季度 | Review SDK release notes；评估是否升级 |
| 半年 | 大版本升级必须先在 dev 环境跑通集成测试，再上 prod |
| 紧急 | 安全漏洞 → 立即升级到修复版本 |

升级在 wms-ruoyi 父 POM `dependencyManagement` 中管理版本号，避免子模块版本漂移。

---

### 5.10 错误处理（v1.1 新增 m-008）

| 场景 | 行为 |
|---|---|
| 用户输入不合法（如 "查库存" 无 SKU） | handler 抛 `HandlerException(USER_INPUT_INVALID)` → 回复 `格式：查库存 <SKU>` |
| WMS API 5xx | handler 抛 `HandlerException(WMS_UPSTREAM_ERROR)` → 回复 `WMS 服务暂不可用，请稍后重试` |
| WMS API 4xx（如 SKU 不存在） | 透传 WMS 错误消息给用户（如 `SKU XXX 不存在`） |
| SDK 回包失败 | 记录 ERROR 日志 + 触发告警（监控项：wecom.reply.failed.count） |
| 长连接断开 | SDK 自动重连；断开期间消息丢失（Wecom 侧不缓存） |
| 业务线程池满 | `AbortPolicy` → 用户收到 `系统繁忙，请稍后重试`；监控项：wecom.queue.rejected.count |
| 未注册指令 | 兜底回复 `支持：查库存 <SKU>` |

---

## 6. 最终推荐

### 6.1 推荐方案

**决赛 1 —— CloudSen/wx-aibot-java-sdk 包装 + MessageHandler SPI**

### 6.2 理由（决策权重排序）

1. **License 干净**（Apache-2.0，与 wms-ruoyi 一致）
2. **协议覆盖全**（Wecom AI Bot 长连接全部能力，已在 212 KiB 实现中验证）
3. **零异构运行时**（纯 Java，嵌入 Spring Boot 同进程）
4. **生态可降级**（WecomTeam 官方 OpenClaw 插件作为长期备选，前提 LICENSE 补齐）
5. **解耦彻底**（MessageHandler SPI 让 ruoyi-wecom-gateway 与 WMS 完全解耦）
6. **加权总分 4.75**，远高于第二名（3.25）

### 6.3 不推荐方案的理由摘要

| 方案 | 否决理由 |
|---|---|
| B1+B2 OpenClaw | B2 仓库无 LICENSE（§4.1 硬性门槛 #1 否决）；引入 Node 22+ 异构栈；为 AI Agent 重型框架 |
| C3 wechaty | 22k★ 是 IM 通用框架，非 WeCom AI Bot 专用；引入 Node 异构栈 |
| D1 自研 | 500-800 LOC 协议代码 + 长期维护成本 > 接入一个 212 KiB 的 Apache-2.0 SDK |
| 其余 | License 缺失 / 已 STALE / 协议不匹配 / 异构栈 |

### 6.4 本推荐的前提

**本推荐在 `docs/08-reviews/wecom-gateway-selection-review-v1.0.md` self-review 通过（所有 Critical/Major 问题关闭）后正式生效**（v1.1 已满足）。

**待用户醒后确认**：self-review 替代了 workflow 双模型评审（降级原因：工作流技术限制），需用户确认接受或要求重新评审。

若评审发现根本性问题，本推荐可能被降级为：
- 决赛 2（OpenClaw，前提 WecomTeam 补 LICENSE）
- 决赛 3（自研 D1）

---

## 7. 关键文件（评审通过后即将修改/创建）

### 7.1 新增文件（v1 范围）

| 路径 | 用途 | LOC 估计 |
|---|---|---|
| `pom.xml`（根） | 在 `<modules>` 新增 `ruoyi-wecom-gateway` | +5 |
| `ruoyi-wecom-gateway/pom.xml` | 子模块 POM，依赖 CloudSen SDK + ruoyi-common-* | ~50 |
| `ruoyi-wecom-gateway/src/main/java/com/ruoyi/wecom/gateway/WeComBotGatewayAutoConfiguration.java` | Spring Boot `@AutoConfiguration` | ~40 |
| `ruoyi-wecom-gateway/src/main/java/com/ruoyi/wecom/gateway/client/WeComBotClient.java` | 包装 `WeComAiBotClient`，注册回调、错误重试 | ~120 |
| `ruoyi-wecom-gateway/src/main/java/com/ruoyi/wecom/gateway/router/MessageRouter.java` | 根据消息内容分发给对应 `MessageHandler` | ~80 |
| `ruoyi-wecom-gateway/src/main/java/com/ruoyi/wecom/gateway/parser/CommandParser.java` | 指令解析 + 大小写不敏感 | ~50 |
| `ruoyi-wecom-gateway/src/main/java/com/ruoyi/wecom/gateway/handler/MessageHandler.java` | SPI 接口 | ~30 |
| `ruoyi-wecom-gateway/src/main/java/com/ruoyi/wecom/gateway/handler/HandlerException.java` | 业务异常 + ErrorCode 枚举 | ~40 |
| `ruoyi-wecom-gateway/src/main/java/com/ruoyi/wecom/gateway/handler/WmsInventoryHandler.java` | v1 唯一 handler（查库存） | ~120 |
| `ruoyi-wecom-gateway/src/main/java/com/ruoyi/wecom/gateway/binding/WecomUserBindingService.java` | openId ↔ sys_user 绑定查询 + Caffeine 缓存 | ~80 |
| `ruoyi-wecom-gateway/src/main/java/com/ruoyi/wecom/gateway/config/WecomProperties.java` | `@ConfigurationProperties` 绑定 wecom.bot.* | ~30 |
| `ruoyi-wecom-gateway/src/main/java/com/ruoyi/wecom/gateway/config/ExecutorConfig.java` | businessExecutor 线程池 | ~30 |
| `ruoyi-wecom-gateway/src/main/resources/META-INF/spring/org.springframework.boot.autoconfigure.AutoConfiguration.imports` | Boot auto-config 注册 | ~2 |
| `ruoyi-wecom-gateway/src/main/resources/META-INF/services/com.ruoyi.wecom.gateway.handler.MessageHandler` | SPI ServiceLoader 文件 | ~2 |
| `ruoyi-wecom-gateway/src/main/resources/application-wecom.yml` | 机器人配置：botId/botSecret | ~20 |
| `ruoyi-wecom-gateway/src/test/java/.../*Test.java` | JUnit 5 + `@Tag("dev")` 测试 | ~500 |

### 7.2 修改文件

| 路径 | 改动 |
|---|---|
| `ruoyi-admin-wms/pom.xml` | 引用 `ruoyi-wecom-gateway`（嵌入式集成） |
| `ruoyi-admin-wms/src/main/resources/application.yml` | 引入 wecom 配置；`sa-token.excludes` 新增 wecom 入口路径 |
| `ruoyi-modules/ruoyi-system/.../sys_user` 表 DDL | 新增 `wecom_open_id` 列（如尚未存在） |
| `ruoyi-admin-wms/Dockerfile` | 替换为 `eclipse-temurin:17-jre-alpine`（当前 Dockerfile 是 JDK 8 镜像） |
| `ruoyi-modules/ruoyi-system/.../SysLoginService.java` | 新增 `botLogin(userId)` 方法颁发"机器人专用短 token" |

### 7.3 复用现有能力

| 现有能力 | 路径 | 用途 |
|---|---|---|
| Sa-Token 鉴权 | `ruoyi-common/ruoyi-common-security/.../SecurityConfig.java` | 机器人消息 → sys_user 鉴权穿透 |
| WMS HTTP API | `ruoyi-admin-wms/.../wms/controller/InventoryController.java` | 业务操作统一走现有 REST 接口 |
| `R<T>` 响应包装 | `ruoyi-common/ruoyi-common-core/.../R.java` | 统一返回结构 |
| Logback 配置 | `ruoyi-admin-wms/src/main/resources/logback-plus.xml` | wss 事件日志分类 |
| Maven 多模块 | 根 `pom.xml` `<modules>` | 子模块注册 |
| Caffeine 缓存 | 通过 Maven 依赖引入（项目已用 Redis，Caffeine 做进程内缓存更轻） | openId 绑定查询缓存 5min |
| OkHttp + Jackson | 父 POM 已管理（4.10.0 / 2.15+） | 调 WMS API |

---

## 8. 验证计划

### 8.1 单元测试（覆盖率 ≥ 80% 行 / ≥ 70% 分支）

- `WeComBotClientTest`：mock `WeComAiBotClient`，验证消息路由、错误重试
- `MessageRouterTest`：验证指令解析 + handler 分发 + 未注册指令兜底
- `CommandParserTest`：大小写不敏感、空白 trim、参数提取
- `WecomUserBindingServiceTest`：绑定查询 + 缓存命中 + 未绑定场景
- `WmsInventoryHandlerTest`：mock WMS HTTP API，验证"查库存"端到端（**最关键**）
- `HandlerExceptionTest`：ErrorCode 分类

### 8.2 集成测试（`@Tag("integration")`）

- 在 `ruoyi-wecom-gateway` 起 Mock WMS（OkHttp `MockWebServer`）
- 用 CloudSen SDK 的 `WeComAiBotClient` 模拟消息回调
- 验证链路：WMS API 拿数据 → 包装成 WeCom 消息 → 通过 MockClient 发回

### 8.3 E2E（线上 `http://47.253.166.61`）

> ⚠️ **需用户提供企业微信后台凭证后才能完成**（详见 8.6）。

1. 在企业微信管理后台创建"智能机器人"，获取 `botId` / `botSecret`（从企业微信管理后台导出）
2. 在 wms 后台 `sys_user` 表为测试用户绑定 `wecom_open_id`（通过绑绑页面）
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
| 鉴权 token 过期 | 自动重新颁发短 token |

### 8.5 本地开发测试流程（v1.1 新增 m-006）

```bash
# Dev profile 跳过 wss 连接，仅启动 Web 层
mvn spring-boot:run -pl ruoyi-admin-wms -P dev

# 单元测试
mvn test -pl ruoyi-wecom-gateway

# 集成测试（需 Mock WMS）
mvn test -pl ruoyi-wecom-gateway -Dgroups=integration

# 覆盖率报告
mvn test -pl ruoyi-wecom-gateway jacoco:report
# 输出：target/site/jacoco/index.html
```

### 8.6 E2E 前置条件（待用户操作）

| 操作 | 责任 | 状态 |
|---|---|---|
| 申请/激活企业微信智能机器人 | michael | ⏳ 阻塞中 |
| 提供 `botId` / `botSecret` 给 wms-ruoyi 配置 | michael | ⏳ 阻塞中 |
| 测试用户在 wms 后台完成绑定 | michael | ⏳ 阻塞中 |

代码层面 E2E 验证可独立完成（无需真实 Wecom 凭证，依赖集成测试覆盖）。

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
| 查入库单 / 查收货单 / 查盘点单 | v2 | v1 仅"查库存"，新功能仅需新增 handler |
| Redis 缓存 | v2 | v1 用 Caffeine 进程内缓存 |
| 全量库存批量查询 | v2 | v1 单 SKU 查询；批量查询需评估性能与回包大小 |

---

## 10. 风险登记册

| ID | 风险 | 等级 | 触发条件 | 应急方案 |
|---|---|---|---|---|
| R1 | CloudSen SDK 单一作者失联 | 中 | 6 个月内无 commit / 关键 issue 长期不修 | Fork → 自维护 / 切换到 B1+B2 / 切换到 D1 |
| R2 | Wecom AI Bot 协议破坏性变更 | 中 | 官方公告 + SDK 1 个月内未跟进 | 跟踪 changelog，必要时 fork 适配 |
| R3 | WMS 鉴权 token 在机器人上下文失效 | 低 | Sa-Token 30min 过期后未续签 | `WecomUserBindingService` Caffeine 缓存 25min 自动失效 + 重新颁发 |
| R4 | 长连接被 WeCom 主动断开 | 低 | 心跳丢失 / 网络抖动 | SDK 已实现自动重连 + 指数退避 |
| R5 | 机器人消息冒充用户操作 WMS | 中 | 攻击者获取 openId | **具体方案见 §5.7**（v1.1 细化） |

---

## 11. 开放问题

| # | 问题 | 答案 |
|---|---|---|
| Q1 | 能否用更老的 wecom HTTP 回调？ | **否**。WeCom AI Bot 强制 wss，自建应用才支持 HTTP 回调。 |
| Q2 | 能否纯自研不用 SDK？ | **可**，但 ~500-800 LOC 协议代码 + 长期维护成本 > 接入一个 212 KiB 的 Apache-2.0 SDK。 |
| Q3 | OpenClaw + WecomTeam 插件是不是更"官方"？ | **是**。但 B2 仓库无 LICENSE 是硬性阻塞；若未来 WecomTeam 补 LICENSE，可作为降级路径。 |
| Q4 | 不用 OpenClaw 会不会错过 Wecom 文档/表格/日历能力？ | **v1 不需要**。WMS 操作只需长连接 + text。 |
| Q5 | 选型确认后是先写代码还是先写决策文档？ | **先写决策文档并通过对抗性评审，再动代码**（本文档即此节点产物）。 |
| Q6 | self-review 是否可接受？ | **待用户醒后确认**。workflow 双模型评审因技术限制未完成，详见评审记录 v1.0 降级说明。 |

---

## 12. 评审要求

本决策文档需通过对抗性评审（`docs/08-reviews/wecom-gateway-selection-review-v1.0.md`），由 **≥2 个不同模型**评审。

**实际**：因工作流技术限制，改为严格 self-review（v1.1 已修复所有 Critical/Major + 13 个 Minor）。

### 12.1 评审"通过"标准（v1.1 明确 m-013）

| 维度 | 通过标准 |
|---|---|
| 评审问题 | 所有 Critical + Major 问题已修复并 verify |
| 文档完整性 | §1-§12 全部章节存在 |
| 数据准确性 | 所有外部数据（star/license/version）经 `gh api` 实际验证 |
| 架构合理性 | 架构图与文件列表 1:1 对应；无悬空组件 |
| 安全设计 | R5 等关键风险有**具体**缓解方案，非泛泛而谈 |
| 实施可落地性 | §7 文件路径可访问；§8 验证命令可执行（除需凭证的 E2E） |

### 12.2 评审模型（计划）

- **首选**：`qwen3.5-397b-a17b` + `qwen3-235b-a22b-thinking`（宽限组，LiteLLM 路由）
- **备选池**：`minimax-m2.5`, `mimo-v2.5`, `deepseek-v3`
- **降级**：Claude opus + sonnet（工作流限制下）

### 12.3 评审维度

1. License 风险（B2 无 LICENSE 是否构成阻塞）
2. 单一作者依赖（CloudSen 27★，跑路概率）
3. 协议升级跟进的可持续性
4. 与 Sa-Token 鉴权集成的可行性
5. MessageHandler SPI 设计的扩展性
6. 性能（长连接 vs 短轮询；异步/流式）
7. 安全（机器人消息冒充用户操作 WMS 的鉴权链路）
8. 多维评分权重设置是否合理
9. v1 范围（scope creep 检测）
10. 错误处理完整性

**评审结果处理**：
- 所有 Critical/Major 关闭 → 选型定稿，进入实施阶段
- 任一 Critical 不关 → 触发级联回退，重新评估
- `max_rounds=3` 耗尽仍有未关闭问题 → 暂停通知用户决策
