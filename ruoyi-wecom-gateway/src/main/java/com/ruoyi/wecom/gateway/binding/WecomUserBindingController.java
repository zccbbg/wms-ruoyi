package com.ruoyi.wecom.gateway.binding;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.Map;

/**
 * 企业微信用户绑定 HTTP 入口（v1）。
 *
 * <p>v1 简化流程：用户在 WMS 后台拿到自己 userId，在企业微信客户端发送
 * "绑定 {userId}" 指令，机器人解析并调用本控制器；或者管理员在后台
 * 直接 POST 绑定。</p>
 *
 * <p>v2 可升级为一次性临时令牌（用户扫码/链接进入 → 校验后绑定）。</p>
 */
@Slf4j
@RestController
@RequestMapping("/wecom/bind")
@RequiredArgsConstructor
public class WecomUserBindingController {

    private final SysUserBindingClient client;

    /**
     * 健康检查 / 入口。
     */
    @GetMapping
    public Map<String, String> index() {
        return Map.of("service", "wecom-binding", "status", "ok");
    }

    /**
     * 通过 openId + userId 绑定。
     *
     * <p>典型调用方：管理后台或机器人接收"绑定 1001"指令后调此接口。</p>
     */
    @PostMapping("/{userId}/{openId}")
    public Map<String, Object> bind(@PathVariable Long userId, @PathVariable String openId) {
        if (openId == null || openId.isBlank()) {
            return Map.of("success", false, "message", "openId 不能为空");
        }
        boolean ok = client.updateWecomOpenId(userId, openId);
        if (!ok) {
            return Map.of("success", false, "message", "用户不存在或更新失败");
        }
        log.info("wecom binding created: userId={} openId={}", userId, openId);
        return Map.of("success", true, "userId", userId, "openId", openId);
    }

    /**
     * 解除绑定。
     */
    @PostMapping("/{userId}/unbind")
    public Map<String, Object> unbind(@PathVariable Long userId) {
        boolean ok = client.updateWecomOpenId(userId, null);
        if (!ok) {
            return Map.of("success", false, "message", "用户不存在或解绑失败");
        }
        log.info("wecom binding removed: userId={}", userId);
        return Map.of("success", true, "userId", userId);
    }

    /**
     * 查询用户当前绑定。
     */
    @GetMapping("/{userId}")
    public Map<String, Object> query(@PathVariable Long userId,
                                    @RequestParam(value = "openId", required = false) String openId) {
        if (openId != null) {
            return Map.of("userId", userId, "openId", openId, "bound", true);
        }
        return Map.of("userId", userId, "bound", false);
    }
}
