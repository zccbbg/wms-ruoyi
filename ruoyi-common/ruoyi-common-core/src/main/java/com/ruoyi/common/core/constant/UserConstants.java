package com.ruoyi.common.core.constant;

/**
 * 用户常量信息
 *
 * @author ruoyi
 */
public interface UserConstants {

    /**
     * 未被删除用户
     */
    String NOT_DELETED = "0";

    /**
     * 角色正常状态
     */
    String ROLE_NORMAL = "1";

    /**
     * 角色封禁状态
     */
    String ROLE_DISABLE = "0";

    /**
     * 部门正常状态
     */
    String DEPT_NORMAL = "1";

    /**
     * 部门停用状态
     */
    String DEPT_DISABLE = "0";

    /**
     * 岗位正常状态
     */
    String POST_NORMAL = "1";

    /**
     * 岗位停用状态
     */
    String POST_DISABLE = "0";

    /**
     * 字典正常状态
     */
    String DICT_NORMAL = "1";

    /**
     * 是否为系统默认（是）
     */
    String YES = "Y";

    /**
     * 是否菜单外链（是）
     */
    String YES_FRAME = "1";

    /**
     * 是否菜单外链（否）
     */
    String NO_FRAME = "0";

    /**
     * 菜单正常状态
     */
    String MENU_NORMAL = "1";

    /**
     * 菜单停用状态
     */
    String MENU_DISABLE = "0";

    /**
     * 菜单类型（目录）
     */
    String TYPE_DIR = "M";

    /**
     * 菜单类型（菜单）
     */
    String TYPE_MENU = "C";

    /**
     * 菜单类型（按钮）
     */
    String TYPE_BUTTON = "F";

    /**
     * Layout组件标识
     */
    String LAYOUT = "Layout";

    /**
     * ParentView组件标识
     */
    String PARENT_VIEW = "ParentView";

    /**
     * InnerLink组件标识
     */
    String INNER_LINK = "InnerLink";

    /**
     * 用户名长度限制
     */
    int USERNAME_MIN_LENGTH = 2;
    int USERNAME_MAX_LENGTH = 20;

    /**
     * 密码长度限制
     */
    int PASSWORD_MIN_LENGTH = 6;
    int PASSWORD_MAX_LENGTH = 20;

    /**
     * 管理员ID
     */
    Long ADMIN_ID = 1L;

    /**
     * 管理员角色key
     */
    String ADMIN_ROLE_KEY = "admin";

}
