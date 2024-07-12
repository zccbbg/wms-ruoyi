package com.ruoyi.system.controller.system;

import cn.dev33.satoken.annotation.SaIgnore;
import com.ruoyi.common.core.constant.Constants;
import com.ruoyi.common.core.domain.R;
import com.ruoyi.common.core.domain.bo.EmailLoginBody;
import com.ruoyi.common.core.domain.bo.LoginBody;
import com.ruoyi.common.core.domain.bo.LoginUser;
import com.ruoyi.common.core.domain.bo.SmsLoginBody;
import com.ruoyi.common.satoken.utils.LoginHelper;
import com.ruoyi.system.domain.entity.SysMenu;
import com.ruoyi.system.domain.vo.RouterVo;
import com.ruoyi.system.domain.vo.SysUserVo;
import com.ruoyi.system.service.SysLoginService;
import com.ruoyi.system.service.SysMenuService;
import com.ruoyi.system.service.SysUserService;
import jakarta.validation.constraints.NotBlank;
import lombok.RequiredArgsConstructor;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 登录验证
 *
 * @author Lion Li
 */
@Validated
@RequiredArgsConstructor
@RestController
public class SysLoginController {

    private final SysLoginService loginService;
    private final SysMenuService menuService;
    private final SysUserService userService;

    /**
     * 登录方法
     *
     * @param loginBody 登录信息
     * @return 结果
     */
    @SaIgnore
    @PostMapping("/login")
    public R<Map<String, Object>> login(@Validated @RequestBody LoginBody loginBody) {
        // 生成令牌
        String token = loginService.login(loginBody.getUsername(), loginBody.getPassword(), loginBody.getCode(),
            loginBody.getUuid());
        return R.ok(Map.of(Constants.TOKEN, token));
    }

    /**
     * 短信登录
     *
     * @param smsLoginBody 登录信息
     * @return 结果
     */
    @SaIgnore
    @PostMapping("/smsLogin")
    public R<Map<String, Object>> smsLogin(@Validated @RequestBody SmsLoginBody smsLoginBody) {
        // 生成令牌
        String token = loginService.smsLogin(smsLoginBody.getPhonenumber(), smsLoginBody.getSmsCode());
        return R.ok(Map.of(Constants.TOKEN, token));
    }

    /**
     * 邮件登录
     *
     * @param body 登录信息
     * @return 结果
     */
    @PostMapping("/emailLogin")
    public R<Map<String, Object>> emailLogin(@Validated @RequestBody EmailLoginBody body) {
        // 生成令牌
        String token = loginService.emailLogin(body.getEmail(), body.getEmailCode());
        return R.ok(Map.of(Constants.TOKEN, token));
    }

    /**
     * 小程序登录(示例)
     *
     * @param xcxCode 小程序code
     * @return 结果
     */
    @SaIgnore
    @PostMapping("/xcxLogin")
    public R<Map<String, Object>> xcxLogin(@NotBlank(message = "{xcx.code.not.blank}") String xcxCode) {
        Map<String, Object> ajax = new HashMap<>();
        // 生成令牌
        String token = loginService.xcxLogin(xcxCode);
        return R.ok(Map.of(Constants.TOKEN, token));
    }

    /**
     * 退出登录
     */
    @SaIgnore
    @PostMapping("/logout")
    public R<Void> logout() {
        loginService.logout();
        return R.ok("退出成功");
    }

    /**
     * 获取用户信息
     *
     * @return 用户信息
     */
    @GetMapping("getInfo")
    public R<Map<String, Object>> getInfo() {
        LoginUser loginUser = LoginHelper.getLoginUser();
        SysUserVo user = userService.selectUserById(loginUser.getUserId());
        return R.ok(Map.of(
                "user", user,
                "roles", loginUser.getRolePermission(),
                "permissions", loginUser.getMenuPermission()
            )
        );
    }

    /**
     * 获取路由信息
     *
     * @return 路由信息
     */
    @GetMapping("getRouters")
    public R<List<RouterVo>> getRouters() {
        List<SysMenu> menus = menuService.selectMenuTreeByUserId(LoginHelper.getUserId());
        return R.ok(menuService.buildMenus(menus));
    }
}
