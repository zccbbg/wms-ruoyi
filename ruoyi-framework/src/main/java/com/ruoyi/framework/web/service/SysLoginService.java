package com.ruoyi.framework.web.service;

import cn.hutool.core.util.RandomUtil;
import com.ruoyi.common.constant.Constants;
import com.ruoyi.common.core.domain.entity.SysRole;
import com.ruoyi.common.core.domain.entity.SysUser;
import com.ruoyi.common.core.domain.model.ExtraUserBody;
import com.ruoyi.common.core.domain.model.LoginUser;
import com.ruoyi.common.core.redis.RedisCache;
import com.ruoyi.common.exception.ServiceException;
import com.ruoyi.common.exception.user.CaptchaException;
import com.ruoyi.common.exception.user.CaptchaExpireException;
import com.ruoyi.common.exception.user.UserException;
import com.ruoyi.common.exception.user.UserPasswordNotMatchException;
import com.ruoyi.common.utils.DateUtils;
import com.ruoyi.common.utils.MessageUtils;
import com.ruoyi.common.utils.SecurityUtils;
import com.ruoyi.common.utils.ServletUtils;
import com.ruoyi.common.utils.ip.IpUtils;
import com.ruoyi.framework.manager.AsyncManager;
import com.ruoyi.framework.manager.factory.AsyncFactory;
import com.ruoyi.system.service.ISysConfigService;
import com.ruoyi.system.service.ISysRoleService;
import com.ruoyi.system.service.ISysUserService;
import com.ruoyi.system.service.PhoneCodeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Component;

import javax.annotation.Resource;
import java.util.Date;
import java.util.List;

/**
 * 登录校验方法
 *
 * @author ruoyi
 */
@Component
public class SysLoginService {
    @Autowired
    private TokenService tokenService;
    @Resource
    private AuthenticationManager authenticationManager;
    @Autowired
    private RedisCache redisCache;
    @Autowired
    private ISysUserService userService;
    @Autowired
    private ISysConfigService configService;
    @Autowired
    private PhoneCodeService phoneCodeService;
    @Autowired
    private SysPermissionService permissionService;
    @Autowired
    private ISysRoleService sysRoleService;

    /**
     * 登录验证
     *
     * @param username 用户名
     * @param password 密码
     * @param code     验证码
     * @param uuid     唯一标识
     * @return 结果
     */
    public String login(String username, String password, String code, String uuid) {
        boolean captchaOnOff = configService.selectCaptchaOnOff();
        // 验证码开关
        if (captchaOnOff) {
            validateCaptcha(username, code, uuid);
        }
        // 用户验证
        Authentication authentication = null;
        try {
            // 该方法会去调用UserDetailsServiceImpl.loadUserByUsername
            authentication = authenticationManager
                    .authenticate(new UsernamePasswordAuthenticationToken(username, password));
        }
        catch (Exception e)
        {
            if (e instanceof BadCredentialsException)
            {
                AsyncManager.me().execute(AsyncFactory.recordLogininfor(username, Constants.LOGIN_FAIL, MessageUtils.message("user.password.not.match")));
                throw new UserPasswordNotMatchException();
            }
            else
            {
                AsyncManager.me().execute(AsyncFactory.recordLogininfor(username, Constants.LOGIN_FAIL, e.getMessage()));
                throw new ServiceException(e.getMessage());
            }
        }
        AsyncManager.me().execute(AsyncFactory.recordLogininfor(username, Constants.LOGIN_SUCCESS, MessageUtils.message("user.login.success")));
        LoginUser loginUser = (LoginUser) authentication.getPrincipal();
        recordLoginInfo(loginUser.getUser());
        // 生成token
        return tokenService.createToken(loginUser);
    }


    public LoginUser loginH5(String username, String password, String uuid) {
        // 用户验证
        Authentication authentication = null;
        try {
            // 该方法会去调用UserDetailsServiceImpl.loadUserByUsername
            authentication = authenticationManager
                    .authenticate(new UsernamePasswordAuthenticationToken(username, password));
        }
        catch (Exception e)
        {
            if (e instanceof BadCredentialsException)
            {
                AsyncManager.me().execute(AsyncFactory.recordLogininfor(username, Constants.LOGIN_FAIL, MessageUtils.message("user.password.not.match")));
                throw new UserPasswordNotMatchException();
            }
            else
            {
                AsyncManager.me().execute(AsyncFactory.recordLogininfor(username, Constants.LOGIN_FAIL, e.getMessage()));
                throw new ServiceException(e.getMessage());
            }
        }
        AsyncManager.me().execute(AsyncFactory.recordLogininfor(username, Constants.LOGIN_SUCCESS, MessageUtils.message("user.login.success")));
        LoginUser loginUser = (LoginUser) authentication.getPrincipal();

        return loginUser;
    }

    /**
     * 校验验证码
     * 
     * @param username 用户名
     * @param code 验证码
     * @param uuid 唯一标识
     * @return 结果
     */
    public void validateCaptcha(String username, String code, String uuid)
    {
        String verifyKey = Constants.CAPTCHA_CODE_KEY + uuid;
        String captcha = redisCache.getCacheObject(verifyKey);
        redisCache.deleteObject(verifyKey);
        if (captcha == null)
        {
            AsyncManager.me().execute(AsyncFactory.recordLogininfor(username, Constants.LOGIN_FAIL, MessageUtils.message("user.jcaptcha.expire")));
            throw new CaptchaExpireException();
        }
        if (!code.equalsIgnoreCase(captcha))
        {
            AsyncManager.me().execute(AsyncFactory.recordLogininfor(username, Constants.LOGIN_FAIL, MessageUtils.message("user.jcaptcha.error")));
            throw new CaptchaException();
        }
    }

    /**
     * 记录登录信息
     */
    public void recordLoginInfo(SysUser user) {
        user.setLoginIp(IpUtils.getIpAddr(ServletUtils.getRequest()));
        user.setLoginDate(DateUtils.getNowDate());
        userService.updateUserProfile(user);
    }

    public SysUser phoneLogin(String phone, String code, String uuid) {
        // 校验数据
        // if (!phoneCodeService.validCode(uuid, phone, code)) {
        //     throw new GlobalException("校验失败");
        //  }
        SysUser user = userService.selectUserByUserName(phone);
        // TODO 内测版，只要电话号码对的上就行
        if (user == null) {
            throw new UserException("user.password.not.match", null);
        }
        SysRole vipRole = sysRoleService.selectRoleByKey("vip");
        // 如果用户不存在，则创建用户，赋予权限
        if (user == null) {
            user = new SysUser();
            user.setUserName(phone);
            user.setNickName("love_" + RandomUtil.randomNumbers(6));
            user.setPhonenumber(phone);
            user.setPassword(SecurityUtils.encryptPassword(RandomUtil.randomString(32)));
            boolean regFlag = userService.registerUser(user);
            // 增加用户的权限，绑定角色
            sysRoleService.insertAuthUsers(vipRole.getRoleId(), new Long[]{user.getUserId()});
        } else {
            // 查询用户是否具有会员角色，如果没有绑定
            List<Integer> roles = sysRoleService.selectRoleListByUserId(user.getUserId());
            Integer roleId = vipRole.getRoleId().intValue();
            if (!roles.contains(roleId)) {
                sysRoleService.insertAuthUsers(vipRole.getRoleId(), new Long[]{user.getUserId()});
            }
        }
        AsyncManager.me().execute(AsyncFactory.recordLogininfor(phone, Constants.LOGIN_SUCCESS, MessageUtils.message("user.login.success")));
        recordLoginInfo(user);
        return user;
    }

    public SysUser initVipUser(ExtraUserBody body) {
        Date now = new Date();
        SysUser user = new SysUser();
        user.setNickName(body.getNickname());
        user.setUserName(body.getLogin());
        user.setAvatar(body.getAvatar());
        user.setLoginDate(now);
        user.setPassword(SecurityUtils.encryptPassword(RandomUtil.randomString(16)));

        // 注册用户
        userService.registerUser(user);

        // 赋予角色
        SysRole vipRole = sysRoleService.selectRoleByKey("vip");
        // 增加用户的权限，绑定角色
        sysRoleService.insertAuthUsers(vipRole.getRoleId(), new Long[]{user.getUserId()});

        AsyncManager.me().execute(AsyncFactory.recordLogininfor(body.getLogin(), Constants.LOGIN_SUCCESS, MessageUtils.message("user.register.success")));
        recordLoginInfo(user);

        return user;
    }

    public String createToken(SysUser user) {
        LoginUser loginUser = new LoginUser(user.getUserId(), user.getDeptId(), user, permissionService.getMenuPermission(user));
        return tokenService.createToken(loginUser);
    }
}
