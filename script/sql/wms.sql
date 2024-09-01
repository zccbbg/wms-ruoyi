SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for gen_table
-- ----------------------------
DROP TABLE IF EXISTS `gen_table`;
CREATE TABLE `gen_table`  (
  `table_id` bigint(20) NOT NULL COMMENT '编号',
  `table_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '表名称',
  `table_comment` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '表描述',
  `sub_table_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '关联子表的表名',
  `sub_table_fk_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '子表关联的外键名',
  `class_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '实体类名称',
  `tpl_category` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'crud' COMMENT '使用的模板（crud单表操作 tree树表操作）',
  `package_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '生成包路径',
  `module_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '生成模块名',
  `business_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '生成业务名',
  `function_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '生成功能名',
  `function_author` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '生成功能作者',
  `gen_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '生成代码方式（0zip压缩包 1自定义路径）',
  `gen_path` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '/' COMMENT '生成路径（不填默认项目路径）',
  `options` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '其它生成选项',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`table_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '代码生成业务表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for gen_table_column
-- ----------------------------
DROP TABLE IF EXISTS `gen_table_column`;
CREATE TABLE `gen_table_column`  (
  `column_id` bigint(20) NOT NULL COMMENT '编号',
  `table_id` bigint(20) NULL DEFAULT NULL COMMENT '归属表编号',
  `column_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '列名称',
  `column_comment` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '列描述',
  `column_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '列类型',
  `java_type` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'JAVA类型',
  `java_field` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'JAVA字段名',
  `is_pk` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '是否主键（1是）',
  `is_increment` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '是否自增（1是）',
  `is_required` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '是否必填（1是）',
  `is_insert` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '是否为插入字段（1是）',
  `is_edit` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '是否编辑字段（1是）',
  `is_list` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '是否列表字段（1是）',
  `is_query` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '是否查询字段（1是）',
  `query_type` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'EQ' COMMENT '查询方式（等于、不等于、大于、小于、范围）',
  `html_type` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '显示类型（文本框、文本域、下拉框、复选框、单选框、日期控件）',
  `dict_type` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '字典类型',
  `sort` int(11) NULL DEFAULT NULL COMMENT '排序',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`column_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '代码生成业务表字段' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config`  (
  `config_id` bigint(20) NOT NULL COMMENT '参数主键',
  `config_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '参数名称',
  `config_key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '参数键名',
  `config_value` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '参数键值',
  `config_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'N' COMMENT '系统内置（Y是 N否）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`config_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '参数配置表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_config
-- ----------------------------
INSERT INTO `sys_config` VALUES (1, '主框架页-默认皮肤样式名称', 'sys.index.skinName', 'skin-blue', 'Y', 'admin', '2024-06-13 16:06:37', '', NULL, '蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow');
INSERT INTO `sys_config` VALUES (2, '用户管理-账号初始密码', 'sys.user.initPassword', '123456', 'Y', 'admin', '2024-06-13 16:06:37', '', NULL, '初始化密码 123456');
INSERT INTO `sys_config` VALUES (3, '主框架页-侧边栏主题', 'sys.index.sideTheme', 'theme-light', 'Y', 'admin', '2024-06-13 16:06:37', 'admin', '2024-07-16 11:25:33', '深色主题theme-dark，浅色主题theme-light');
INSERT INTO `sys_config` VALUES (4, '账号自助-验证码开关', 'sys.account.captchaEnabled', 'true', 'Y', 'admin', '2024-06-13 16:06:37', '', NULL, '是否开启验证码功能（true开启，false关闭）');
INSERT INTO `sys_config` VALUES (5, '账号自助-是否开启用户注册功能', 'sys.account.registerUser', 'false', 'Y', 'admin', '2024-06-13 16:06:37', '', NULL, '是否开启注册用户功能（true开启，false关闭）');
INSERT INTO `sys_config` VALUES (11, 'OSS预览列表资源开关', 'sys.oss.previewListResource', 'true', 'Y', 'admin', '2024-06-13 16:06:37', '', NULL, 'true:开启, false:关闭');

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept`  (
  `dept_id` bigint(20) NOT NULL COMMENT '部门id',
  `parent_id` bigint(20) NULL DEFAULT 0 COMMENT '父部门id',
  `ancestors` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '祖级列表',
  `dept_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '部门名称',
  `order_num` int(4) NULL DEFAULT 0 COMMENT '显示顺序',
  `leader` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '负责人',
  `phone` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '联系电话',
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '部门状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`dept_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '部门表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
INSERT INTO `sys_dept` VALUES (100, 0, '0', '若依科技', 0, '若依', '15888888888', 'ry@qq.com', '1', '0', 'admin', '2024-06-13 16:06:25', '', NULL);
INSERT INTO `sys_dept` VALUES (101, 100, '0,100', '深圳总公司', 1, '若依', '15888888888', 'ry@qq.com', '1', '0', 'admin', '2024-06-13 16:06:25', '', NULL);
INSERT INTO `sys_dept` VALUES (102, 100, '0,100', '长沙分公司', 2, '若依', '15888888888', 'ry@qq.com', '1', '0', 'admin', '2024-06-13 16:06:25', '', NULL);
INSERT INTO `sys_dept` VALUES (103, 101, '0,100,101', '研发部门', 1, '若依', '15888888888', 'ry@qq.com', '1', '0', 'admin', '2024-06-13 16:06:25', '', NULL);
INSERT INTO `sys_dept` VALUES (104, 101, '0,100,101', '市场部门', 2, '若依', '15888888888', 'ry@qq.com', '1', '0', 'admin', '2024-06-13 16:06:25', '', NULL);
INSERT INTO `sys_dept` VALUES (105, 101, '0,100,101', '测试部门', 3, '若依', '15888888888', 'ry@qq.com', '1', '0', 'admin', '2024-06-13 16:06:25', '', NULL);
INSERT INTO `sys_dept` VALUES (106, 101, '0,100,101', '财务部门', 4, '若依', '15888888888', 'ry@qq.com', '1', '0', 'admin', '2024-06-13 16:06:25', '', NULL);
INSERT INTO `sys_dept` VALUES (107, 101, '0,100,101', '运维部门', 5, '若依', '15888888888', 'ry@qq.com', '1', '0', 'admin', '2024-06-13 16:06:25', '', NULL);
INSERT INTO `sys_dept` VALUES (108, 102, '0,100,102', '市场部门', 1, '若依', '15888888888', 'ry@qq.com', '1', '0', 'admin', '2024-06-13 16:06:25', '', NULL);
INSERT INTO `sys_dept` VALUES (109, 102, '0,100,102', '财务部门', 2, '若依', '15888888888', 'ry@qq.com', '1', '0', 'admin', '2024-06-13 16:06:25', '', NULL);
INSERT INTO `sys_dept` VALUES (1811589666899832833, 102, '0,100,102', '测试部门2', 0, '负责人', '', '', '1', '0', 'admin', '2024-07-12 10:33:29', 'admin', '2024-07-12 10:33:29');

-- ----------------------------
-- Table structure for sys_dict_data
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_data`;
CREATE TABLE `sys_dict_data`  (
  `dict_code` bigint(20) NOT NULL COMMENT '字典编码',
  `dict_sort` int(4) NULL DEFAULT 0 COMMENT '字典排序',
  `dict_label` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '字典标签',
  `dict_value` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '字典键值',
  `dict_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '字典类型',
  `css_class` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '样式属性（其他样式扩展）',
  `list_class` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '表格回显样式',
  `is_default` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'N' COMMENT '是否默认（Y是 N否）',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '状态（0停用 1正常）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_code`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '字典数据表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dict_data
-- ----------------------------
INSERT INTO `sys_dict_data` VALUES (1, 1, '男', '0', 'sys_user_sex', '', '', 'Y', '1', 'admin', '2024-06-13 16:06:36', '', NULL, '性别男');
INSERT INTO `sys_dict_data` VALUES (2, 2, '女', '1', 'sys_user_sex', '', '', 'N', '1', 'admin', '2024-06-13 16:06:36', '', NULL, '性别女');
INSERT INTO `sys_dict_data` VALUES (3, 3, '未知', '2', 'sys_user_sex', '', '', 'N', '1', 'admin', '2024-06-13 16:06:36', '', NULL, '性别未知');
INSERT INTO `sys_dict_data` VALUES (4, 1, '显示', '1', 'sys_show_hide', '', 'primary', 'Y', '1', 'admin', '2024-06-13 16:06:36', 'admin', '2024-07-10 16:34:54', '显示菜单');
INSERT INTO `sys_dict_data` VALUES (5, 2, '隐藏', '0', 'sys_show_hide', '', 'danger', 'N', '1', 'admin', '2024-06-13 16:06:36', 'admin', '2024-07-10 16:35:07', '隐藏菜单');
INSERT INTO `sys_dict_data` VALUES (6, 1, '正常', '1', 'sys_normal_disable', '', 'primary', 'Y', '1', 'admin', '2024-06-13 16:06:36', 'admin', '2024-07-10 14:30:58', '正常状态');
INSERT INTO `sys_dict_data` VALUES (7, 2, '停用', '0', 'sys_normal_disable', '', 'danger', 'N', '1', 'admin', '2024-06-13 16:06:36', 'admin', '2024-07-10 14:31:06', '停用状态');
INSERT INTO `sys_dict_data` VALUES (12, 1, '是', 'Y', 'sys_yes_no', '', 'primary', 'Y', '1', 'admin', '2024-06-13 16:06:36', '', NULL, '系统默认是');
INSERT INTO `sys_dict_data` VALUES (13, 2, '否', 'N', 'sys_yes_no', '', 'danger', 'N', '1', 'admin', '2024-06-13 16:06:36', '', NULL, '系统默认否');
INSERT INTO `sys_dict_data` VALUES (14, 1, '通知', '1', 'sys_notice_type', '', 'warning', 'Y', '1', 'admin', '2024-06-13 16:06:36', '', NULL, '通知');
INSERT INTO `sys_dict_data` VALUES (15, 2, '公告', '2', 'sys_notice_type', '', 'success', 'N', '1', 'admin', '2024-06-13 16:06:36', '', NULL, '公告');
INSERT INTO `sys_dict_data` VALUES (16, 1, '正常', '1', 'sys_notice_status', '', 'primary', 'Y', '1', 'admin', '2024-06-13 16:06:36', 'admin', '2024-07-10 17:24:35', '正常状态');
INSERT INTO `sys_dict_data` VALUES (17, 2, '关闭', '0', 'sys_notice_status', '', 'danger', 'N', '1', 'admin', '2024-06-13 16:06:36', 'admin', '2024-07-10 17:24:44', '关闭状态');
INSERT INTO `sys_dict_data` VALUES (18, 1, '新增', '1', 'sys_oper_type', '', 'info', 'N', '1', 'admin', '2024-06-13 16:06:36', '', NULL, '新增操作');
INSERT INTO `sys_dict_data` VALUES (19, 2, '修改', '2', 'sys_oper_type', '', 'info', 'N', '1', 'admin', '2024-06-13 16:06:36', '', NULL, '修改操作');
INSERT INTO `sys_dict_data` VALUES (20, 3, '删除', '3', 'sys_oper_type', '', 'danger', 'N', '1', 'admin', '2024-06-13 16:06:37', '', NULL, '删除操作');
INSERT INTO `sys_dict_data` VALUES (21, 4, '授权', '4', 'sys_oper_type', '', 'primary', 'N', '1', 'admin', '2024-06-13 16:06:37', '', NULL, '授权操作');
INSERT INTO `sys_dict_data` VALUES (22, 5, '导出', '5', 'sys_oper_type', '', 'warning', 'N', '1', 'admin', '2024-06-13 16:06:37', '', NULL, '导出操作');
INSERT INTO `sys_dict_data` VALUES (23, 6, '导入', '6', 'sys_oper_type', '', 'warning', 'N', '1', 'admin', '2024-06-13 16:06:37', '', NULL, '导入操作');
INSERT INTO `sys_dict_data` VALUES (24, 7, '强退', '7', 'sys_oper_type', '', 'danger', 'N', '1', 'admin', '2024-06-13 16:06:37', '', NULL, '强退操作');
INSERT INTO `sys_dict_data` VALUES (25, 8, '生成代码', '8', 'sys_oper_type', '', 'warning', 'N', '1', 'admin', '2024-06-13 16:06:37', '', NULL, '生成操作');
INSERT INTO `sys_dict_data` VALUES (26, 9, '清空数据', '9', 'sys_oper_type', '', 'danger', 'N', '1', 'admin', '2024-06-13 16:06:37', '', NULL, '清空操作');
INSERT INTO `sys_dict_data` VALUES (27, 1, '失败', '0', 'sys_common_status', '', 'danger', 'N', '1', 'admin', '2024-06-13 16:06:37', 'admin', '2024-07-15 10:50:52', '正常状态');
INSERT INTO `sys_dict_data` VALUES (28, 2, '成功', '1', 'sys_common_status', '', 'success', 'N', '1', 'admin', '2024-06-13 16:06:37', 'admin', '2024-07-15 10:51:05', '停用状态');
INSERT INTO `sys_dict_data` VALUES (29, 99, '其他', '0', 'sys_oper_type', '', 'info', 'N', '1', 'admin', '2024-06-13 16:06:36', '', NULL, '其他操作');
INSERT INTO `sys_dict_data` VALUES (1812692503272718338, 0, '客户', '1', 'merchant_type', NULL, 'default', 'N', '1', 'admin', '2024-07-15 11:35:46', 'admin', '2024-07-16 11:21:11', NULL);
INSERT INTO `sys_dict_data` VALUES (1812694839395135489, 1, '供应商', '2', 'merchant_type', NULL, 'default', 'N', '1', 'admin', '2024-07-15 11:45:03', 'admin', '2024-07-16 11:21:29', '');
INSERT INTO `sys_dict_data` VALUES (1813051377282904066, 3, '客户/供应商', '3', 'merchant_type', NULL, 'default', 'N', '1', 'admin', '2024-07-16 11:21:48', 'admin', '2024-07-16 11:21:48', NULL);
INSERT INTO `sys_dict_data` VALUES (1813153852862160897, 0, '未入库', '0', 'wms_receipt_status', NULL, 'info', 'N', '1', 'admin', '2024-07-16 18:09:00', 'admin', '2024-07-22 09:38:14', NULL);
INSERT INTO `sys_dict_data` VALUES (1813153899775451137, 1, '已入库', '1', 'wms_receipt_status', NULL, 'primary', 'N', '1', 'admin', '2024-07-16 18:09:11', 'admin', '2024-07-22 09:38:22', NULL);
INSERT INTO `sys_dict_data` VALUES (1813397339171905537, 3, '作废', '-1', 'wms_receipt_status', NULL, 'danger', 'N', '1', 'admin', '2024-07-17 10:16:32', 'admin', '2024-07-22 09:38:29', NULL);
INSERT INTO `sys_dict_data` VALUES (1814219171351085057, 0, '生产入库', '1', 'wms_receipt_type', NULL, 'primary', 'N', '1', 'admin', '2024-07-19 16:42:12', 'admin', '2024-07-22 09:38:50', NULL);
INSERT INTO `sys_dict_data` VALUES (1814219220520910849, 1, '采购入库', '2', 'wms_receipt_type', NULL, 'primary', 'N', '1', 'admin', '2024-07-19 16:42:23', 'admin', '2024-07-22 09:38:56', NULL);
INSERT INTO `sys_dict_data` VALUES (1814219269975949313, 2, '退货入库', '3', 'wms_receipt_type', NULL, 'primary', 'N', '1', 'admin', '2024-07-19 16:42:35', 'admin', '2024-07-22 09:39:01', NULL);
INSERT INTO `sys_dict_data` VALUES (1814219304272773121, 3, '归还入库', '4', 'wms_receipt_type', NULL, 'primary', 'N', '1', 'admin', '2024-07-19 16:42:43', 'admin', '2024-07-22 09:39:06', NULL);
INSERT INTO `sys_dict_data` VALUES (1818850397680640002, 2, '作废', '-1', 'wms_shipment_status', NULL, 'danger', 'N', '1', 'admin', '2024-08-01 11:25:02', 'admin', '2024-08-01 14:25:24', NULL);
INSERT INTO `sys_dict_data` VALUES (1818850512650706945, 0, '未出库', '0', 'wms_shipment_status', NULL, 'info', 'N', '1', 'admin', '2024-08-01 11:25:29', 'admin', '2024-08-01 14:25:37', NULL);
INSERT INTO `sys_dict_data` VALUES (1818850565389885441, 1, '已出库', '1', 'wms_shipment_status', NULL, 'primary', 'N', '1', 'admin', '2024-08-01 11:25:42', 'admin', '2024-08-01 14:25:32', NULL);
INSERT INTO `sys_dict_data` VALUES (1818850814351187969, 0, '退货出库', '1', 'wms_shipment_type', NULL, 'default', 'N', '1', 'admin', '2024-08-01 11:26:41', 'admin', '2024-08-01 11:26:41', NULL);
INSERT INTO `sys_dict_data` VALUES (1818850852594851841, 1, '销售出库', '2', 'wms_shipment_type', NULL, 'default', 'N', '1', 'admin', '2024-08-01 11:26:51', 'admin', '2024-08-01 11:26:51', NULL);
INSERT INTO `sys_dict_data` VALUES (1818850884714831874, 2, '生产出库', '3', 'wms_shipment_type', NULL, 'default', 'N', '1', 'admin', '2024-08-01 11:26:58', 'admin', '2024-08-01 11:26:58', NULL);
INSERT INTO `sys_dict_data` VALUES (1821067084643434498, 0, '入库', '1', 'wms_inventory_history_type', NULL, 'primary', 'N', '1', 'admin', '2024-08-07 14:13:21', 'admin', '2024-08-07 14:57:41', NULL);
INSERT INTO `sys_dict_data` VALUES (1821067144441626625, 1, '出库', '2', 'wms_inventory_history_type', NULL, 'primary', 'N', '1', 'admin', '2024-08-07 14:13:36', 'admin', '2024-08-07 14:57:47', NULL);
INSERT INTO `sys_dict_data` VALUES (1821067181917732866, 2, '移库', '3', 'wms_inventory_history_type', NULL, 'primary', 'N', '1', 'admin', '2024-08-07 14:13:45', 'admin', '2024-08-07 14:57:54', NULL);
INSERT INTO `sys_dict_data` VALUES (1821067222455681026, 3, '盘库', '4', 'wms_inventory_history_type', NULL, 'primary', 'N', '1', 'admin', '2024-08-07 14:13:54', 'admin', '2024-08-07 14:58:06', NULL);
INSERT INTO `sys_dict_data` VALUES (1822820748966006786, 0, '未移库', '0', 'wms_movement_status', NULL, 'info', 'N', '1', 'admin', '2024-08-12 10:21:48', 'admin', '2024-08-12 10:21:48', NULL);
INSERT INTO `sys_dict_data` VALUES (1822820794864275457, 1, '已移库', '1', 'wms_movement_status', NULL, 'primary', 'N', '1', 'admin', '2024-08-12 10:21:59', 'admin', '2024-08-12 10:21:59', NULL);
INSERT INTO `sys_dict_data` VALUES (1822820855526494210, 2, '作废', '-1', 'wms_movement_status', NULL, 'danger', 'N', '1', 'admin', '2024-08-12 10:22:13', 'admin', '2024-08-12 10:22:13', NULL);
INSERT INTO `sys_dict_data` VALUES (1823182345731391489, 0, '待盘库', '0', 'wms_check_status', NULL, 'info', 'N', '1', 'admin', '2024-08-13 10:18:39', 'admin', '2024-08-13 10:18:39', NULL);
INSERT INTO `sys_dict_data` VALUES (1823182400756465666, 1, '已盘库', '1', 'wms_check_status', NULL, 'primary', 'N', '1', 'admin', '2024-08-13 10:18:52', 'admin', '2024-08-13 10:18:52', NULL);
INSERT INTO `sys_dict_data` VALUES (1823182471136886786, 2, '作废', '-1', 'wms_check_status', NULL, 'danger', 'N', '1', 'admin', '2024-08-13 10:19:09', 'admin', '2024-08-13 10:19:09', NULL);

-- ----------------------------
-- Table structure for sys_dict_type
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_type`;
CREATE TABLE `sys_dict_type`  (
  `dict_id` bigint(20) NOT NULL COMMENT '字典主键',
  `dict_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '字典名称',
  `dict_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '字典类型',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_id`) USING BTREE,
  UNIQUE INDEX `dict_type`(`dict_type`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '字典类型表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dict_type
-- ----------------------------
INSERT INTO `sys_dict_type` VALUES (1, '用户性别', 'sys_user_sex', '1', 'admin', '2024-06-13 16:06:35', '', NULL, '用户性别列表');
INSERT INTO `sys_dict_type` VALUES (2, '菜单状态', 'sys_show_hide', '1', 'admin', '2024-06-13 16:06:35', '', NULL, '菜单状态列表');
INSERT INTO `sys_dict_type` VALUES (3, '系统开关', 'sys_normal_disable', '1', 'admin', '2024-06-13 16:06:35', '', NULL, '系统开关列表');
INSERT INTO `sys_dict_type` VALUES (6, '系统是否', 'sys_yes_no', '1', 'admin', '2024-06-13 16:06:35', '', NULL, '系统是否列表');
INSERT INTO `sys_dict_type` VALUES (7, '通知类型', 'sys_notice_type', '1', 'admin', '2024-06-13 16:06:35', '', NULL, '通知类型列表');
INSERT INTO `sys_dict_type` VALUES (8, '通知状态', 'sys_notice_status', '1', 'admin', '2024-06-13 16:06:35', '', NULL, '通知状态列表');
INSERT INTO `sys_dict_type` VALUES (9, '操作类型', 'sys_oper_type', '1', 'admin', '2024-06-13 16:06:35', '', NULL, '操作类型列表');
INSERT INTO `sys_dict_type` VALUES (10, '系统状态', 'sys_common_status', '1', 'admin', '2024-06-13 16:06:36', '', NULL, '登录状态列表');
INSERT INTO `sys_dict_type` VALUES (1812692454547488770, '企业类型', 'merchant_type', '1', 'admin', '2024-07-15 11:35:34', 'admin', '2024-07-16 17:41:32', '企业类型');
INSERT INTO `sys_dict_type` VALUES (1813152108564373505, '入库状态', 'wms_receipt_status', '1', 'admin', '2024-07-16 18:02:04', 'admin', '2024-07-16 18:02:17', '入库状态');
INSERT INTO `sys_dict_type` VALUES (1814219082624778242, '入库类型', 'wms_receipt_type', '1', 'admin', '2024-07-19 16:41:51', 'admin', '2024-07-19 16:41:51', NULL);
INSERT INTO `sys_dict_type` VALUES (1818848671749709825, '出库状态', 'wms_shipment_status', '1', 'admin', '2024-08-01 11:18:11', 'admin', '2024-08-01 11:18:11', NULL);
INSERT INTO `sys_dict_type` VALUES (1818848738502057985, '出库类型', 'wms_shipment_type', '1', 'admin', '2024-08-01 11:18:26', 'admin', '2024-08-01 11:18:26', NULL);
INSERT INTO `sys_dict_type` VALUES (1821066855638630402, '库存记录操作类型', 'wms_inventory_history_type', '1', 'admin', '2024-08-07 14:12:27', 'admin', '2024-08-07 14:12:27', NULL);
INSERT INTO `sys_dict_type` VALUES (1822820566366982146, '移库状态', 'wms_movement_status', '1', 'admin', '2024-08-12 10:21:04', 'admin', '2024-08-12 10:21:04', NULL);
INSERT INTO `sys_dict_type` VALUES (1823182238898274306, '盘库状态', 'wms_check_status', '1', 'admin', '2024-08-13 10:18:14', 'admin', '2024-08-13 10:18:14', NULL);

-- ----------------------------
-- Table structure for sys_logininfor
-- ----------------------------
DROP TABLE IF EXISTS `sys_logininfor`;
CREATE TABLE `sys_logininfor`  (
  `info_id` bigint(20) NOT NULL COMMENT '访问ID',
  `user_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '用户账号',
  `ipaddr` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '登录IP地址',
  `login_location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '登录地点',
  `browser` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '浏览器类型',
  `os` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '操作系统',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '登录状态（0成功 1失败）',
  `msg` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '提示消息',
  `login_time` datetime(0) NULL DEFAULT NULL COMMENT '访问时间',
  PRIMARY KEY (`info_id`) USING BTREE,
  INDEX `idx_sys_logininfor_s`(`status`) USING BTREE,
  INDEX `idx_sys_logininfor_lt`(`login_time`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '系统访问记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu`  (
  `menu_id` bigint(20) NOT NULL COMMENT '菜单ID',
  `menu_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '菜单名称',
  `parent_id` bigint(20) NULL DEFAULT 0 COMMENT '父菜单ID',
  `order_num` int(4) NULL DEFAULT 0 COMMENT '显示顺序',
  `path` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '路由地址',
  `component` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '组件路径',
  `query_param` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '路由参数',
  `is_frame` int(1) NULL DEFAULT 1 COMMENT '是否为外链（0是 1否）',
  `is_cache` int(1) NULL DEFAULT 0 COMMENT '是否缓存（0缓存 1不缓存）',
  `menu_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '菜单类型（M目录 C菜单 F按钮）',
  `visible` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '显示状态（0显示 1隐藏）',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '菜单状态（0正常 1停用）',
  `perms` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '权限标识',
  `icon` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '#' COMMENT '菜单图标',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`menu_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '菜单权限表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES (1, '系统管理', 0, 110, 'system', NULL, '', 0, 0, 'M', '1', '1', '', 'system', 'admin', '2024-06-13 16:06:26', 'admin', '2024-08-20 13:45:48', '系统管理目录');
INSERT INTO `sys_menu` VALUES (2, '系统监控', 0, 120, 'monitor', NULL, '', 0, 0, 'M', '1', '1', '', 'monitor', 'admin', '2024-06-13 16:06:26', 'admin', '2024-08-20 13:45:57', '系统监控目录');
INSERT INTO `sys_menu` VALUES (100, '用户管理', 1, 1, 'user', 'system/user/index', '', 0, 0, 'C', '1', '1', 'system:user:list', 'user', 'admin', '2024-06-13 16:06:26', '', NULL, '用户管理菜单');
INSERT INTO `sys_menu` VALUES (101, '角色管理', 1, 2, 'role', 'system/role/index', '', 0, 0, 'C', '1', '1', 'system:role:list', 'peoples', 'admin', '2024-06-13 16:06:26', '', NULL, '角色管理菜单');
INSERT INTO `sys_menu` VALUES (102, '菜单管理', 1, 3, 'menu', 'system/menu/index', '', 0, 0, 'C', '1', '1', 'system:menu:list', 'tree-table', 'admin', '2024-06-13 16:06:26', '', NULL, '菜单管理菜单');
INSERT INTO `sys_menu` VALUES (103, '部门管理', 1, 4, 'dept', 'system/dept/index', '', 0, 0, 'C', '1', '1', 'system:dept:list', 'tree', 'admin', '2024-06-13 16:06:26', '', NULL, '部门管理菜单');
INSERT INTO `sys_menu` VALUES (104, '岗位管理', 1, 5, 'post', 'system/post/index', '', 0, 0, 'C', '1', '1', 'system:post:list', 'post', 'admin', '2024-06-13 16:06:26', '', NULL, '岗位管理菜单');
INSERT INTO `sys_menu` VALUES (105, '字典管理', 1, 6, 'dict', 'system/dict/index', '', 0, 0, 'C', '1', '1', 'system:dict:list', 'dict', 'admin', '2024-06-13 16:06:26', '', NULL, '字典管理菜单');
INSERT INTO `sys_menu` VALUES (106, '参数设置', 1, 7, 'config', 'system/config/index', '', 0, 0, 'C', '1', '1', 'system:config:list', 'edit', 'admin', '2024-06-13 16:06:26', '', NULL, '参数设置菜单');
INSERT INTO `sys_menu` VALUES (107, '通知公告', 1, 8, 'notice', 'system/notice/index', '', 0, 0, 'C', '1', '1', 'system:notice:list', 'message', 'admin', '2024-06-13 16:06:26', '', NULL, '通知公告菜单');
INSERT INTO `sys_menu` VALUES (108, '日志管理', 0, 140, 'log', '', '', 0, 0, 'M', '1', '1', '', 'log', 'admin', '2024-06-13 16:06:27', 'admin', '2024-08-20 13:46:16', '日志管理菜单');
INSERT INTO `sys_menu` VALUES (109, '在线用户', 2, 1, 'online', 'monitor/online/index', '', 0, 0, 'C', '1', '1', 'monitor:online:list', 'online', 'admin', '2024-06-13 16:06:27', '', NULL, '在线用户菜单');
INSERT INTO `sys_menu` VALUES (112, '缓存列表', 2, 6, 'cacheList', 'monitor/cache/list', '', 0, 0, 'C', '1', '1', 'monitor:cache:list', 'redis-list', 'admin', '2024-06-13 16:06:27', '', NULL, '缓存列表菜单');
INSERT INTO `sys_menu` VALUES (113, '缓存监控', 2, 5, 'cache', 'monitor/cache/index', '', 0, 0, 'C', '1', '1', 'monitor:cache:list', 'redis', 'admin', '2024-06-13 16:06:27', '', NULL, '缓存监控菜单');
INSERT INTO `sys_menu` VALUES (115, '代码生成', 0, 130, 'gen', 'tool/gen/index', '', 0, 0, 'C', '1', '1', 'tool:gen:list', 'code', 'admin', '2024-06-13 16:06:27', 'admin', '2024-08-20 13:46:06', '代码生成菜单');
INSERT INTO `sys_menu` VALUES (118, '文件管理', 1, 10, 'oss', 'system/oss/index', '', 0, 0, 'C', '1', '1', 'system:oss:list', 'upload', 'admin', '2024-06-13 16:06:27', '', NULL, '文件管理菜单');
INSERT INTO `sys_menu` VALUES (500, '操作日志', 108, 1, 'operlog', 'monitor/operlog/index', '', 0, 0, 'C', '1', '1', 'monitor:operlog:list', 'form', 'admin', '2024-06-13 16:06:27', '', NULL, '操作日志菜单');
INSERT INTO `sys_menu` VALUES (501, '登录日志', 108, 2, 'logininfor', 'monitor/logininfor/index', '', 0, 0, 'C', '1', '1', 'monitor:logininfor:list', 'logininfor', 'admin', '2024-06-13 16:06:27', '', NULL, '登录日志菜单');
INSERT INTO `sys_menu` VALUES (1001, '用户查询', 100, 1, '', '', '', 0, 0, 'F', '1', '1', 'system:user:query', '#', 'admin', '2024-06-13 16:06:27', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1002, '用户新增', 100, 2, '', '', '', 0, 0, 'F', '1', '1', 'system:user:add', '#', 'admin', '2024-06-13 16:06:27', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1003, '用户修改', 100, 3, '', '', '', 0, 0, 'F', '1', '1', 'system:user:edit', '#', 'admin', '2024-06-13 16:06:27', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1004, '用户删除', 100, 4, '', '', '', 0, 0, 'F', '1', '1', 'system:user:remove', '#', 'admin', '2024-06-13 16:06:27', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1005, '用户导出', 100, 5, '', '', '', 0, 0, 'F', '1', '1', 'system:user:export', '#', 'admin', '2024-06-13 16:06:27', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1006, '用户导入', 100, 6, '', '', '', 0, 0, 'F', '1', '1', 'system:user:import', '#', 'admin', '2024-06-13 16:06:27', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1007, '重置密码', 100, 7, '', '', '', 0, 0, 'F', '1', '1', 'system:user:resetPwd', '#', 'admin', '2024-06-13 16:06:27', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1008, '角色查询', 101, 1, '', '', '', 0, 0, 'F', '1', '1', 'system:role:query', '#', 'admin', '2024-06-13 16:06:27', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1009, '角色新增', 101, 2, '', '', '', 0, 0, 'F', '1', '1', 'system:role:add', '#', 'admin', '2024-06-13 16:06:27', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1010, '角色修改', 101, 3, '', '', '', 0, 0, 'F', '1', '1', 'system:role:edit', '#', 'admin', '2024-06-13 16:06:28', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1011, '角色删除', 101, 4, '', '', '', 0, 0, 'F', '1', '1', 'system:role:remove', '#', 'admin', '2024-06-13 16:06:28', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1012, '角色导出', 101, 5, '', '', '', 0, 0, 'F', '1', '1', 'system:role:export', '#', 'admin', '2024-06-13 16:06:28', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1013, '菜单查询', 102, 1, '', '', '', 0, 0, 'F', '1', '1', 'system:menu:query', '#', 'admin', '2024-06-13 16:06:28', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1014, '菜单新增', 102, 2, '', '', '', 0, 0, 'F', '1', '1', 'system:menu:add', '#', 'admin', '2024-06-13 16:06:28', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1015, '菜单修改', 102, 3, '', '', '', 0, 0, 'F', '1', '1', 'system:menu:edit', '#', 'admin', '2024-06-13 16:06:28', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1016, '菜单删除', 102, 4, '', '', '', 0, 0, 'F', '1', '1', 'system:menu:remove', '#', 'admin', '2024-06-13 16:06:28', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1017, '部门查询', 103, 1, '', '', '', 0, 0, 'F', '1', '1', 'system:dept:query', '#', 'admin', '2024-06-13 16:06:28', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1018, '部门新增', 103, 2, '', '', '', 0, 0, 'F', '1', '1', 'system:dept:add', '#', 'admin', '2024-06-13 16:06:28', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1019, '部门修改', 103, 3, '', '', '', 0, 0, 'F', '1', '1', 'system:dept:edit', '#', 'admin', '2024-06-13 16:06:28', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1020, '部门删除', 103, 4, '', '', '', 0, 0, 'F', '1', '1', 'system:dept:remove', '#', 'admin', '2024-06-13 16:06:28', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1021, '岗位查询', 104, 1, '', '', '', 0, 0, 'F', '1', '1', 'system:post:query', '#', 'admin', '2024-06-13 16:06:28', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1022, '岗位新增', 104, 2, '', '', '', 0, 0, 'F', '1', '1', 'system:post:add', '#', 'admin', '2024-06-13 16:06:28', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1023, '岗位修改', 104, 3, '', '', '', 0, 0, 'F', '1', '1', 'system:post:edit', '#', 'admin', '2024-06-13 16:06:28', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1024, '岗位删除', 104, 4, '', '', '', 0, 0, 'F', '1', '1', 'system:post:remove', '#', 'admin', '2024-06-13 16:06:28', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1025, '岗位导出', 104, 5, '', '', '', 0, 0, 'F', '1', '1', 'system:post:export', '#', 'admin', '2024-06-13 16:06:28', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1026, '字典查询', 105, 1, '#', '', '', 0, 0, 'F', '1', '1', 'system:dict:query', '#', 'admin', '2024-06-13 16:06:28', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1027, '字典新增', 105, 2, '#', '', '', 0, 0, 'F', '1', '1', 'system:dict:add', '#', 'admin', '2024-06-13 16:06:28', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1028, '字典修改', 105, 3, '#', '', '', 0, 0, 'F', '1', '1', 'system:dict:edit', '#', 'admin', '2024-06-13 16:06:28', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1029, '字典删除', 105, 4, '#', '', '', 0, 0, 'F', '1', '1', 'system:dict:remove', '#', 'admin', '2024-06-13 16:06:28', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1030, '字典导出', 105, 5, '#', '', '', 0, 0, 'F', '1', '1', 'system:dict:export', '#', 'admin', '2024-06-13 16:06:29', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1031, '参数查询', 106, 1, '#', '', '', 0, 0, 'F', '1', '1', 'system:config:query', '#', 'admin', '2024-06-13 16:06:29', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1032, '参数新增', 106, 2, '#', '', '', 0, 0, 'F', '1', '1', 'system:config:add', '#', 'admin', '2024-06-13 16:06:29', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1033, '参数修改', 106, 3, '#', '', '', 0, 0, 'F', '1', '1', 'system:config:edit', '#', 'admin', '2024-06-13 16:06:29', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1034, '参数删除', 106, 4, '#', '', '', 0, 0, 'F', '1', '1', 'system:config:remove', '#', 'admin', '2024-06-13 16:06:29', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1035, '参数导出', 106, 5, '#', '', '', 0, 0, 'F', '1', '1', 'system:config:export', '#', 'admin', '2024-06-13 16:06:29', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1036, '公告查询', 107, 1, '#', '', '', 0, 0, 'F', '1', '1', 'system:notice:query', '#', 'admin', '2024-06-13 16:06:29', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1037, '公告新增', 107, 2, '#', '', '', 0, 0, 'F', '1', '1', 'system:notice:add', '#', 'admin', '2024-06-13 16:06:29', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1038, '公告修改', 107, 3, '#', '', '', 0, 0, 'F', '1', '1', 'system:notice:edit', '#', 'admin', '2024-06-13 16:06:29', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1039, '公告删除', 107, 4, '#', '', '', 0, 0, 'F', '1', '1', 'system:notice:remove', '#', 'admin', '2024-06-13 16:06:29', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1040, '操作查询', 500, 1, '#', '', '', 0, 0, 'F', '1', '1', 'monitor:operlog:query', '#', 'admin', '2024-06-13 16:06:29', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1041, '操作删除', 500, 2, '#', '', '', 0, 0, 'F', '1', '1', 'monitor:operlog:remove', '#', 'admin', '2024-06-13 16:06:29', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1042, '日志导出', 500, 4, '#', '', '', 0, 0, 'F', '1', '1', 'monitor:operlog:export', '#', 'admin', '2024-06-13 16:06:29', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1043, '登录查询', 501, 1, '#', '', '', 0, 0, 'F', '1', '1', 'monitor:logininfor:query', '#', 'admin', '2024-06-13 16:06:29', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1044, '登录删除', 501, 2, '#', '', '', 0, 0, 'F', '1', '1', 'monitor:logininfor:remove', '#', 'admin', '2024-06-13 16:06:29', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1045, '日志导出', 501, 3, '#', '', '', 0, 0, 'F', '1', '1', 'monitor:logininfor:export', '#', 'admin', '2024-06-13 16:06:29', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1046, '在线查询', 109, 1, '#', '', '', 0, 0, 'F', '1', '1', 'monitor:online:query', '#', 'admin', '2024-06-13 16:06:29', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1047, '批量强退', 109, 2, '#', '', '', 0, 0, 'F', '1', '1', 'monitor:online:batchLogout', '#', 'admin', '2024-06-13 16:06:29', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1048, '单条强退', 109, 3, '#', '', '', 0, 0, 'F', '1', '1', 'monitor:online:forceLogout', '#', 'admin', '2024-06-13 16:06:30', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1050, '账户解锁', 501, 4, '#', '', '', 0, 0, 'F', '1', '1', 'monitor:logininfor:unlock', '#', 'admin', '2024-06-13 16:06:29', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1055, '生成查询', 115, 1, '#', '', '', 0, 0, 'F', '1', '1', 'tool:gen:query', '#', 'admin', '2024-06-13 16:06:30', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1056, '生成修改', 115, 2, '#', '', '', 0, 0, 'F', '1', '1', 'tool:gen:edit', '#', 'admin', '2024-06-13 16:06:30', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1057, '生成删除', 115, 3, '#', '', '', 0, 0, 'F', '1', '1', 'tool:gen:remove', '#', 'admin', '2024-06-13 16:06:30', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1058, '导入代码', 115, 2, '#', '', '', 0, 0, 'F', '1', '1', 'tool:gen:import', '#', 'admin', '2024-06-13 16:06:30', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1059, '预览代码', 115, 4, '#', '', '', 0, 0, 'F', '1', '1', 'tool:gen:preview', '#', 'admin', '2024-06-13 16:06:30', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1060, '生成代码', 115, 5, '#', '', '', 0, 0, 'F', '1', '1', 'tool:gen:code', '#', 'admin', '2024-06-13 16:06:30', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1600, '文件查询', 118, 1, '#', '', '', 0, 0, 'F', '1', '1', 'system:oss:query', '#', 'admin', '2024-06-13 16:06:30', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1601, '文件上传', 118, 2, '#', '', '', 0, 0, 'F', '1', '1', 'system:oss:upload', '#', 'admin', '2024-06-13 16:06:30', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1602, '文件下载', 118, 3, '#', '', '', 0, 0, 'F', '1', '1', 'system:oss:download', '#', 'admin', '2024-06-13 16:06:30', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1603, '文件删除', 118, 4, '#', '', '', 0, 0, 'F', '1', '1', 'system:oss:remove', '#', 'admin', '2024-06-13 16:06:30', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1604, '配置添加', 118, 5, '#', '', '', 0, 0, 'F', '1', '1', 'system:oss:add', '#', 'admin', '2024-06-13 16:06:30', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1605, '配置编辑', 118, 6, '#', '', '', 0, 0, 'F', '1', '1', 'system:oss:edit', '#', 'admin', '2024-06-13 16:06:30', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1808758090157985794, '基础资料', 0, 100, 'basic', NULL, NULL, 0, 0, 'M', '1', '1', NULL, 'excel', 'admin', '2024-07-04 15:01:48', 'admin', '2024-08-20 13:45:39', '');
INSERT INTO `sys_menu` VALUES (1809059968309743618, '往来单位', 1808758090157985794, 1, 'merchant', 'wms/basic/merchant/index', NULL, 0, 0, 'C', '1', '1', 'wms:merchant:list', 'documentation', 'admin', '2024-07-05 11:58:12', 'admin', '2024-08-27 16:41:53', '往来单位菜单');
INSERT INTO `sys_menu` VALUES (1809059968309743619, '往来单位查询', 1809059968309743618, 1, '#', '', NULL, 0, 0, 'F', '1', '1', 'wms:merchant:list', '#', 'admin', '2024-07-05 11:58:12', 'admin', '2024-08-30 10:43:54', '');
INSERT INTO `sys_menu` VALUES (1809059968309743621, '往来单位修改', 1809059968309743618, 3, '#', '', NULL, 0, 0, 'F', '1', '1', 'wms:merchant:edit', '#', 'admin', '2024-07-05 11:58:12', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1813458070128599041, '仓库/库区', 1808758090157985794, 2, 'warehouse', 'wms/basic/warehouse/index', NULL, 0, 0, 'C', '1', '1', 'wms:warehouse:list', 'documentation', 'admin', '2024-07-17 14:17:51', 'admin', '2024-08-27 16:42:46', '');
INSERT INTO `sys_menu` VALUES (1813820131794837506, '商品管理', 1808758090157985794, 4, 'item', 'wms/basic/item/index', NULL, 0, 0, 'C', '1', '1', 'wms:item:list', 'documentation', 'admin', '2024-07-18 14:16:33', 'admin', '2024-08-27 16:43:06', '');
INSERT INTO `sys_menu` VALUES (1815207165755183105, '编辑入库单', 0, 1000, 'receiptOrderEdit', 'wms/order/receipt/edit', NULL, 0, 0, 'C', '0', '1', 'wms:receipt:edit', '#', 'admin', '2024-07-22 10:08:08', 'admin', '2024-08-27 16:43:28', '');
INSERT INTO `sys_menu` VALUES (1818123963605549057, '品牌管理', 1808758090157985794, 3, 'itemBrand', 'wms/basic/itemBrand/index', NULL, 0, 0, 'C', '1', '1', 'wms:itemBrand:list', 'documentation', 'admin', '2024-07-30 11:18:27', 'admin', '2024-08-27 16:42:55', '');
INSERT INTO `sys_menu` VALUES (1818466281474822145, '入库', 0, 20, 'receiptOrder', 'wms/order/receipt/index', NULL, 0, 0, 'C', '1', '1', 'wms:receipt:all', 'exit-fullscreen', 'admin', '2024-07-31 09:58:42', 'admin', '2024-08-30 08:58:25', '');
INSERT INTO `sys_menu` VALUES (1818854933803638785, '出库', 0, 30, 'shipmentOrder', 'wms/order/shipment/index', NULL, 0, 0, 'C', '1', '1', 'wms:shipment:all', 'fullscreen', 'admin', '2024-08-01 11:43:04', 'admin', '2024-08-30 08:58:35', '');
INSERT INTO `sys_menu` VALUES (1818855673632727042, '编辑出库单', 0, 1000, 'shipmentOrderEdit', 'wms/order/shipment/edit', NULL, 0, 0, 'C', '0', '1', 'wms:shipment:edit', '#', 'admin', '2024-08-01 11:46:00', 'admin', '2024-08-27 16:43:37', '');
INSERT INTO `sys_menu` VALUES (1820729144067321858, '库存统计', 0, 0, 'inventory', 'wms/inventory/statistic', NULL, 0, 0, 'C', '1', '1', 'wms:inventory:all', 'chart', 'admin', '2024-08-06 15:50:30', 'admin', '2024-08-30 08:57:48', '');
INSERT INTO `sys_menu` VALUES (1821075355068559361, '库存记录', 0, 3, 'inventoryHistory', 'wms/inventory/history', NULL, 0, 0, 'C', '1', '1', 'wms:inventoryHistory:all', 'list', 'admin', '2024-08-07 14:46:13', 'admin', '2024-08-30 08:58:13', '');
INSERT INTO `sys_menu` VALUES (1822820194307051521, '移库', 0, 40, 'movementOrder', 'wms/order/movement/index', NULL, 0, 0, 'C', '1', '1', 'wms:movement:all', 'drag', 'admin', '2024-08-12 10:19:35', 'admin', '2024-08-30 08:58:44', '');
INSERT INTO `sys_menu` VALUES (1822862323595145218, '编辑移库单', 0, 1000, 'movementOrderEdit', 'wms/order/movement/edit', NULL, 0, 0, 'C', '0', '1', 'wms:movement:edit', '#', 'admin', '2024-08-12 13:07:00', 'admin', '2024-08-27 16:43:50', '');
INSERT INTO `sys_menu` VALUES (1823187248797270018, '盘库', 0, 50, 'checkOrder', 'wms/order/check/index', NULL, 0, 0, 'C', '1', '1', 'wms:check:all', 'example', 'admin', '2024-08-13 10:38:08', 'admin', '2024-08-30 08:58:57', '');
INSERT INTO `sys_menu` VALUES (1823190638784757762, '编辑盘库单', 0, 1000, 'checkOrderEdit', 'wms/order/check/edit', NULL, 0, 0, 'C', '0', '1', 'wms:check:edit', '#', 'admin', '2024-08-13 10:51:36', 'admin', '2024-08-27 16:43:44', '');
INSERT INTO `sys_menu` VALUES (1825769009480142850, '库存明细', 0, 1, 'inventoryDetail', 'wms/inventory/detail', NULL, 0, 0, 'C', '1', '1', 'wms:inventoryDetail:all', 'table', 'admin', '2024-08-20 13:37:08', 'admin', '2024-08-30 09:19:01', '');
INSERT INTO `sys_menu` VALUES (1829349433573822466, '仓库库区查询', 1813458070128599041, 1, '', NULL, NULL, 0, 0, 'F', '1', '1', 'wms:warehouse:list', '#', 'admin', '2024-08-30 10:44:27', 'admin', '2024-08-30 10:44:27', '');
INSERT INTO `sys_menu` VALUES (1829350022131142658, '仓库库区编辑', 1813458070128599041, 2, '', NULL, NULL, 0, 0, 'F', '1', '1', 'wms:warehouse:edit', '#', 'admin', '2024-08-30 10:46:48', 'admin', '2024-08-30 10:46:48', '');
INSERT INTO `sys_menu` VALUES (1829350164603260929, '品牌查询', 1818123963605549057, 1, '', NULL, NULL, 0, 0, 'F', '1', '1', 'wms:itemBrand:list', '#', 'admin', '2024-08-30 10:47:22', 'admin', '2024-08-30 10:47:22', '');
INSERT INTO `sys_menu` VALUES (1829350944311791617, '品牌编辑', 1818123963605549057, 2, '', NULL, NULL, 0, 0, 'F', '1', '1', 'wms:itemBrand:edit', '#', 'admin', '2024-08-30 10:50:27', 'admin', '2024-08-30 10:50:27', '');
INSERT INTO `sys_menu` VALUES (1829351081448755202, '商品查询', 1813820131794837506, 1, '', NULL, NULL, 0, 0, 'F', '1', '1', 'wms:item:list', '#', 'admin', '2024-08-30 10:51:00', 'admin', '2024-08-30 10:51:00', '');
INSERT INTO `sys_menu` VALUES (1829351166857367553, '商品编辑', 1813820131794837506, 2, '', NULL, NULL, 0, 0, 'F', '1', '1', 'wms:item:edit', '#', 'admin', '2024-08-30 10:51:21', 'admin', '2024-08-30 10:51:21', '');

-- ----------------------------
-- Table structure for sys_notice
-- ----------------------------
DROP TABLE IF EXISTS `sys_notice`;
CREATE TABLE `sys_notice`  (
  `notice_id` bigint(20) NOT NULL COMMENT '公告ID',
  `notice_title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '公告标题',
  `notice_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '公告类型（1通知 2公告）',
  `notice_content` longblob NULL COMMENT '公告内容',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '公告状态（0正常 1关闭）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`notice_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '通知公告表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_notice
-- ----------------------------
INSERT INTO `sys_notice` VALUES (1, '温馨提醒：2018-07-01 新版本发布啦', '2', 0xE696B0E78988E69CACE58685E5AEB9, '1', 'admin', '2024-06-13 16:06:38', '', NULL, '管理员');
INSERT INTO `sys_notice` VALUES (2, '维护通知：2018-07-01 系统凌晨维护', '1', 0xE7BBB4E68AA4E58685E5AEB9, '1', 'admin', '2024-06-13 16:06:38', '', NULL, '管理员');

-- ----------------------------
-- Table structure for sys_oper_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_oper_log`;
CREATE TABLE `sys_oper_log`  (
  `oper_id` bigint(20) NOT NULL COMMENT '日志主键',
  `title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '模块标题',
  `business_type` int(2) NULL DEFAULT 0 COMMENT '业务类型（0其它 1新增 2修改 3删除）',
  `method` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '方法名称',
  `request_method` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '请求方式',
  `operator_type` int(1) NULL DEFAULT 0 COMMENT '操作类别（0其它 1后台用户 2手机端用户）',
  `oper_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '操作人员',
  `dept_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '部门名称',
  `oper_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '请求URL',
  `oper_ip` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '主机地址',
  `oper_location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '操作地点',
  `oper_param` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '请求参数',
  `json_result` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '返回参数',
  `status` int(1) NULL DEFAULT 0 COMMENT '操作状态（0异常 1正常）',
  `error_msg` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '错误消息',
  `oper_time` datetime(0) NULL DEFAULT NULL COMMENT '操作时间',
  PRIMARY KEY (`oper_id`) USING BTREE,
  INDEX `idx_sys_oper_log_bt`(`business_type`) USING BTREE,
  INDEX `idx_sys_oper_log_s`(`status`) USING BTREE,
  INDEX `idx_sys_oper_log_ot`(`oper_time`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '操作日志记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sys_oss
-- ----------------------------
DROP TABLE IF EXISTS `sys_oss`;
CREATE TABLE `sys_oss`  (
  `oss_id` bigint(20) NOT NULL COMMENT '对象存储主键',
  `file_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '文件名',
  `original_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '原名',
  `file_suffix` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '文件后缀名',
  `url` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'URL地址',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '上传人',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新人',
  `service` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'minio' COMMENT '服务商',
  PRIMARY KEY (`oss_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'OSS对象存储表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sys_oss_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_oss_config`;
CREATE TABLE `sys_oss_config`  (
  `oss_config_id` bigint(20) NOT NULL COMMENT '主建',
  `config_key` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '配置key',
  `access_key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT 'accessKey',
  `secret_key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '秘钥',
  `bucket_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '桶名称',
  `prefix` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '前缀',
  `endpoint` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '访问站点',
  `domain` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '自定义域名',
  `is_https` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'N' COMMENT '是否https（Y=是,N=否）',
  `region` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '域',
  `access_policy` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '1' COMMENT '桶权限类型(0=private 1=public 2=custom)',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '1' COMMENT '是否默认（0=是,1=否）',
  `ext1` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '扩展字段',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`oss_config_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '对象存储配置表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_oss_config
-- ----------------------------
INSERT INTO `sys_oss_config` VALUES (1, 'minio', 'ruoyi', 'ruoyi123', 'ruoyi', '', '127.0.0.1:9000', '', 'N', '', '1', '0', '', 'admin', '2024-06-13 16:06:38', 'admin', '2024-08-16 16:48:05', NULL);
INSERT INTO `sys_oss_config` VALUES (2, 'qiniu', 'XXXXXXXXXXXXXXX', 'XXXXXXXXXXXXXXX', 'ruoyi', '', 's3-cn-north-1.qiniucs.com', '', 'N', '', '1', '0', '', 'admin', '2024-06-13 16:06:38', 'admin', '2024-06-13 16:06:38', NULL);
INSERT INTO `sys_oss_config` VALUES (3, 'aliyun', 'XXXXXXXXXXXXXXX', 'XXXXXXXXXXXXXXX', 'ruoyi', '', 'oss-cn-beijing.aliyuncs.com', '', 'N', '', '1', '0', '', 'admin', '2024-06-13 16:06:38', 'admin', '2024-07-10 17:50:41', NULL);
INSERT INTO `sys_oss_config` VALUES (4, 'qcloud', 'XXXXXXXXXXXXXXX', 'XXXXXXXXXXXXXXX', 'ruoyi-1250000000', '', 'cos.ap-beijing.myqcloud.com', '', 'N', 'ap-beijing', '1', '0', '', 'admin', '2024-06-13 16:06:38', 'admin', '2024-06-13 16:06:38', NULL);
INSERT INTO `sys_oss_config` VALUES (5, 'image', 'ruoyi', 'ruoyi123', 'ruoyi', 'image', '127.0.0.1:9000', '', 'N', '', '1', '0', '', 'admin', '2024-06-13 16:06:38', 'admin', '2024-06-13 16:06:38', NULL);

-- ----------------------------
-- Table structure for sys_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_post`;
CREATE TABLE `sys_post`  (
  `post_id` bigint(20) NOT NULL COMMENT '岗位ID',
  `post_code` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '岗位编码',
  `post_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '岗位名称',
  `post_sort` int(4) NOT NULL COMMENT '显示顺序',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`post_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '岗位信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_post
-- ----------------------------
INSERT INTO `sys_post` VALUES (1, 'ceo', '董事长', 1, '1', 'admin', '2024-06-13 16:06:25', '', NULL, '');
INSERT INTO `sys_post` VALUES (2, 'se', '项目经理', 2, '1', 'admin', '2024-06-13 16:06:25', '', NULL, '');
INSERT INTO `sys_post` VALUES (3, 'hr', '人力资源', 3, '1', 'admin', '2024-06-13 16:06:25', '', NULL, '');
INSERT INTO `sys_post` VALUES (4, 'user', '普通员工', 4, '1', 'admin', '2024-06-13 16:06:25', '', NULL, '');
INSERT INTO `sys_post` VALUES (1811656351757385729, 'caiwu8989', '财务', 5, '1', 'admin', '2024-07-12 22:58:28', 'admin', '2024-07-12 14:58:38', NULL);

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  `role_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '角色名称',
  `role_key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '角色权限字符串',
  `role_sort` int(4) NOT NULL COMMENT '显示顺序',
  `data_scope` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '1' COMMENT '数据范围（1：全部数据权限 2：自定数据权限 3：本部门数据权限 4：本部门及以下数据权限）',
  `menu_check_strictly` tinyint(1) NULL DEFAULT 1 COMMENT '菜单树选择项是否关联显示',
  `dept_check_strictly` tinyint(1) NULL DEFAULT 1 COMMENT '部门树选择项是否关联显示',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '角色状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`role_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '角色信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES (1, '超级管理员', 'admin', 1, '1', 1, 1, '1', '0', 'admin', '2024-06-13 16:06:26', '', NULL, '超级管理员');
INSERT INTO `sys_role` VALUES (2, '普通角色', 'common', 2, '2', 1, 1, '1', '1', 'admin', '2024-06-13 16:06:26', 'admin', '2024-07-10 17:13:05', '普通角色');
INSERT INTO `sys_role` VALUES (1811607750859661314, '测试角色1', 'test1', 2, '1', 1, 1, '1', '1', 'admin', '2024-07-12 11:45:21', 'admin', '2024-07-12 11:45:21', NULL);
INSERT INTO `sys_role` VALUES (1811629311809396737, '测试角色2', 'test2', 3, '1', 1, 1, '1', '1', 'admin', '2024-07-12 13:11:01', 'admin', '2024-07-12 13:11:01', NULL);
INSERT INTO `sys_role` VALUES (1829105952432427010, '试用', 'trier', 0, '1', 1, 1, '1', '0', 'admin', '2024-08-29 18:36:57', 'admin', '2024-08-30 10:51:57', NULL);

-- ----------------------------
-- Table structure for sys_role_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_dept`;
CREATE TABLE `sys_role_dept`  (
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  `dept_id` bigint(20) NOT NULL COMMENT '部门ID',
  PRIMARY KEY (`role_id`, `dept_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '角色和部门关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu`  (
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  `menu_id` bigint(20) NOT NULL COMMENT '菜单ID',
  PRIMARY KEY (`role_id`, `menu_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '角色和菜单关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES (1829105952432427010, 1808758090157985794);
INSERT INTO `sys_role_menu` VALUES (1829105952432427010, 1809059968309743618);
INSERT INTO `sys_role_menu` VALUES (1829105952432427010, 1809059968309743619);
INSERT INTO `sys_role_menu` VALUES (1829105952432427010, 1813458070128599041);
INSERT INTO `sys_role_menu` VALUES (1829105952432427010, 1813820131794837506);
INSERT INTO `sys_role_menu` VALUES (1829105952432427010, 1815207165755183105);
INSERT INTO `sys_role_menu` VALUES (1829105952432427010, 1818123963605549057);
INSERT INTO `sys_role_menu` VALUES (1829105952432427010, 1818466281474822145);
INSERT INTO `sys_role_menu` VALUES (1829105952432427010, 1818854933803638785);
INSERT INTO `sys_role_menu` VALUES (1829105952432427010, 1818855673632727042);
INSERT INTO `sys_role_menu` VALUES (1829105952432427010, 1820729144067321858);
INSERT INTO `sys_role_menu` VALUES (1829105952432427010, 1821075355068559361);
INSERT INTO `sys_role_menu` VALUES (1829105952432427010, 1822820194307051521);
INSERT INTO `sys_role_menu` VALUES (1829105952432427010, 1822862323595145218);
INSERT INTO `sys_role_menu` VALUES (1829105952432427010, 1823187248797270018);
INSERT INTO `sys_role_menu` VALUES (1829105952432427010, 1823190638784757762);
INSERT INTO `sys_role_menu` VALUES (1829105952432427010, 1825769009480142850);
INSERT INTO `sys_role_menu` VALUES (1829105952432427010, 1829349433573822466);
INSERT INTO `sys_role_menu` VALUES (1829105952432427010, 1829350164603260929);
INSERT INTO `sys_role_menu` VALUES (1829105952432427010, 1829351081448755202);

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `dept_id` bigint(20) NULL DEFAULT NULL COMMENT '部门ID',
  `user_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户账号',
  `nick_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户昵称',
  `user_type` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'sys_user' COMMENT '用户类型（sys_user系统用户）',
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '用户邮箱',
  `phonenumber` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '手机号码',
  `sex` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '用户性别（0男 1女 2未知）',
  `avatar` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '头像地址',
  `password` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '密码',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '帐号状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `login_ip` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '最后登录IP',
  `login_date` datetime(0) NULL DEFAULT NULL COMMENT '最后登录时间',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (1, 103, 'admin', '程序员诚哥', 'sys_user', 'zccbbg@qq.com', '18888888888', '0', '', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '1', '0', '127.0.0.1', '2024-08-29 18:52:36', 'admin', '2024-06-13 16:06:25', 'admin', '2024-08-29 18:52:36', '管理员');
INSERT INTO `sys_user` VALUES (1829105396288688129, 105, 'kucun', 'kucun', 'sys_user', '', '', '0', '', '$2a$10$jpbgHXxmB9nszkvhixjaQuwQtXcq7XJrqFaFpev/93WvaWa/oEpGy', '1', '0', '127.0.0.1', '2024-08-30 13:54:01', 'admin', '2024-08-29 18:34:44', 'kucun', '2024-08-30 13:54:01', NULL);

-- ----------------------------
-- Table structure for sys_user_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_post`;
CREATE TABLE `sys_user_post`  (
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `post_id` bigint(20) NOT NULL COMMENT '岗位ID',
  PRIMARY KEY (`user_id`, `post_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户与岗位关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_post
-- ----------------------------
INSERT INTO `sys_user_post` VALUES (1, 1);

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role`  (
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`user_id`, `role_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户和角色关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES (1, 1);
INSERT INTO `sys_user_role` VALUES (1829105396288688129, 1829105952432427010);

-- ----------------------------
-- Table structure for wms_area
-- ----------------------------
DROP TABLE IF EXISTS `wms_area`;
CREATE TABLE `wms_area`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `area_code` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '编号',
  `area_name` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '名称',
  `warehouse_id` bigint(20) NOT NULL COMMENT '所属仓库ID',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `del_flag` tinyint(4) NOT NULL DEFAULT 0 COMMENT '删除标识',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(3) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '修改人',
  `update_time` datetime(3) NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1829397742493560834 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '库区' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wms_area
-- ----------------------------
INSERT INTO `wms_area` VALUES (1828364518342430721, NULL, '盛泽区', 1828364459110469633, NULL, 0, 'admin', '2024-08-27 17:30:45.210', 'admin', '2024-08-27 17:30:45.210');
INSERT INTO `wms_area` VALUES (1828364560503574530, NULL, '松陵区', 1828364459110469633, NULL, 0, 'admin', '2024-08-27 17:30:55.261', 'admin', '2024-08-27 17:30:55.261');
INSERT INTO `wms_area` VALUES (1828364666585911297, NULL, '独墅湖', 1828364609002311682, NULL, 0, 'admin', '2024-08-27 17:31:20.553', 'admin', '2024-08-27 17:31:20.553');
INSERT INTO `wms_area` VALUES (1828364702635954177, NULL, '唯亭', 1828364609002311682, NULL, 0, 'admin', '2024-08-27 17:31:29.140', 'admin', '2024-08-27 17:31:29.140');
INSERT INTO `wms_area` VALUES (1829397566185992193, NULL, 'A1', 1828364740028174337, NULL, 0, 'admin', '2024-08-30 13:55:43.009', 'admin', '2024-08-30 13:55:43.009');
INSERT INTO `wms_area` VALUES (1829397621378838530, NULL, 'A2', 1828364740028174337, NULL, 0, 'admin', '2024-08-30 13:55:56.167', 'admin', '2024-08-30 13:55:56.167');
INSERT INTO `wms_area` VALUES (1829397661719654401, NULL, 'A3', 1828364740028174337, NULL, 0, 'admin', '2024-08-30 13:56:05.790', 'admin', '2024-08-30 13:56:05.790');
INSERT INTO `wms_area` VALUES (1829397707726974978, NULL, 'B1', 1828364740028174337, NULL, 0, 'admin', '2024-08-30 13:56:16.756', 'admin', '2024-08-30 13:56:16.756');
INSERT INTO `wms_area` VALUES (1829397742493560833, NULL, 'B2', 1828364740028174337, NULL, 0, 'admin', '2024-08-30 13:56:25.043', 'admin', '2024-08-30 13:56:25.043');

-- ----------------------------
-- Table structure for wms_check_order
-- ----------------------------
DROP TABLE IF EXISTS `wms_check_order`;
CREATE TABLE `wms_check_order`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `check_order_no` varchar(22) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '盘点单号',
  `check_order_status` tinyint(4) NULL DEFAULT 11 COMMENT '库存盘点单状态 -1：作废 0：未盘库 1：已盘库',
  `check_order_total` decimal(20, 2) NULL DEFAULT NULL COMMENT '盈亏数',
  `warehouse_id` bigint(20) NULL DEFAULT NULL COMMENT '所属仓库',
  `area_id` bigint(20) NULL DEFAULT NULL COMMENT '所属库区',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(3) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '修改人',
  `update_time` datetime(3) NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1828633046379339779 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '库存盘点单据' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wms_check_order
-- ----------------------------
INSERT INTO `wms_check_order` VALUES (1828631466955448321, 'PK08286054', 1, 3.00, 1828364459110469633, 1828364518342430721, NULL, 'admin', '2024-08-28 11:11:30.723', 'admin', '2024-08-28 11:11:37.825');
INSERT INTO `wms_check_order` VALUES (1828632546531549185, 'PK08288055', 1, 3.00, 1828364459110469633, NULL, NULL, 'admin', '2024-08-28 11:15:48.103', 'admin', '2024-08-28 11:16:17.508');
INSERT INTO `wms_check_order` VALUES (1828633046379339778, 'PK08283199', 1, 2.00, 1828364609002311682, NULL, NULL, 'admin', '2024-08-28 11:17:47.274', 'admin', '2024-08-28 11:17:47.274');

-- ----------------------------
-- Table structure for wms_check_order_detail
-- ----------------------------
DROP TABLE IF EXISTS `wms_check_order_detail`;
CREATE TABLE `wms_check_order_detail`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `check_order_id` bigint(20) NULL DEFAULT NULL COMMENT '盘点单id',
  `sku_id` bigint(20) NOT NULL COMMENT '规格id',
  `quantity` decimal(20, 2) NULL DEFAULT NULL COMMENT '库存数量',
  `check_quantity` decimal(20, 2) NULL DEFAULT NULL COMMENT '盘点数量',
  `warehouse_id` bigint(20) NULL DEFAULT NULL COMMENT '所属仓库',
  `area_id` bigint(20) NULL DEFAULT NULL COMMENT '所属库区',
  `batch_no` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '批号',
  `production_date` datetime(3) NULL DEFAULT NULL COMMENT '生产日期',
  `expiration_date` datetime(3) NULL DEFAULT NULL COMMENT '过期日期',
  `receipt_time` datetime(3) NULL DEFAULT NULL COMMENT '入库时间',
  `inventory_detail_id` bigint(20) NULL DEFAULT NULL COMMENT '入库记录id',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(3) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '修改人',
  `update_time` datetime(3) NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1828633046706495494 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '库存盘点单据详情' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wms_check_order_detail
-- ----------------------------
INSERT INTO `wms_check_order_detail` VALUES (1828631467345518594, 1828631466955448321, 1828408796968030211, 0.00, 1.00, 1828364459110469633, 1828364518342430721, NULL, NULL, NULL, '2024-08-28 11:11:22.000', NULL, NULL, 'admin', '2024-08-28 11:11:30.807', 'admin', '2024-08-28 11:11:37.943');
INSERT INTO `wms_check_order_detail` VALUES (1828631467345518595, 1828631466955448321, 1828408796968030212, 0.00, 1.00, 1828364459110469633, 1828364518342430721, NULL, NULL, NULL, '2024-08-28 11:11:22.000', NULL, NULL, 'admin', '2024-08-28 11:11:30.812', 'admin', '2024-08-28 11:11:38.067');
INSERT INTO `wms_check_order_detail` VALUES (1828631467345518596, 1828631466955448321, 1828408796968030210, 0.00, 1.00, 1828364459110469633, 1828364518342430721, NULL, NULL, NULL, '2024-08-28 11:11:22.000', NULL, NULL, 'admin', '2024-08-28 11:11:30.812', 'admin', '2024-08-28 11:11:38.184');
INSERT INTO `wms_check_order_detail` VALUES (1828632546862899202, 1828632546531549185, 1828408796968030210, 1.00, 2.00, 1828364459110469633, 1828364518342430721, NULL, NULL, NULL, '2024-08-28 11:11:22.000', 1828631499662630916, NULL, 'admin', '2024-08-28 11:15:48.180', 'admin', '2024-08-28 11:16:17.636');
INSERT INTO `wms_check_order_detail` VALUES (1828632546862899203, 1828632546531549185, 1828408796968030211, 1.00, 2.00, 1828364459110469633, 1828364518342430721, NULL, NULL, NULL, '2024-08-28 11:11:22.000', 1828631499662630914, NULL, 'admin', '2024-08-28 11:15:48.180', 'admin', '2024-08-28 11:16:17.758');
INSERT INTO `wms_check_order_detail` VALUES (1828632546862899204, 1828632546531549185, 1828408796968030212, 1.00, 2.00, 1828364459110469633, 1828364518342430721, NULL, NULL, NULL, '2024-08-28 11:11:22.000', 1828631499662630915, NULL, 'admin', '2024-08-28 11:15:48.181', 'admin', '2024-08-28 11:16:17.885');
INSERT INTO `wms_check_order_detail` VALUES (1828632600055062530, 1828632546531549185, 1828408321522700289, 0.00, 0.00, 1828364459110469633, 1828364518342430721, NULL, NULL, NULL, '2024-08-28 11:15:56.000', NULL, NULL, 'admin', '2024-08-28 11:16:00.866', 'admin', '2024-08-28 11:16:18.004');
INSERT INTO `wms_check_order_detail` VALUES (1828633046706495490, 1828633046379339778, 1828408796968030210, 1.00, 1.00, 1828364609002311682, 1828364666585911297, NULL, NULL, NULL, '2024-08-27 20:34:28.000', 1828410751362736129, NULL, 'admin', '2024-08-28 11:17:47.350', 'admin', '2024-08-28 11:17:47.350');
INSERT INTO `wms_check_order_detail` VALUES (1828633046706495491, 1828633046379339778, 1828408796968030211, 1.00, 1.00, 1828364609002311682, 1828364666585911297, NULL, NULL, NULL, '2024-08-27 20:34:28.000', 1828410751362736130, NULL, 'admin', '2024-08-28 11:17:47.351', 'admin', '2024-08-28 11:17:47.351');
INSERT INTO `wms_check_order_detail` VALUES (1828633046706495492, 1828633046379339778, 1828408796968030212, 1.00, 1.00, 1828364609002311682, 1828364666585911297, NULL, NULL, NULL, '2024-08-27 20:34:28.000', 1828410751362736131, NULL, 'admin', '2024-08-28 11:17:47.351', 'admin', '2024-08-28 11:17:47.351');
INSERT INTO `wms_check_order_detail` VALUES (1828633046706495493, 1828633046379339778, 1828408321522700289, 0.00, 2.00, 1828364609002311682, 1828364666585911297, NULL, NULL, NULL, '2024-08-28 11:17:34.000', NULL, NULL, 'admin', '2024-08-28 11:17:47.352', 'admin', '2024-08-28 11:17:47.352');

-- ----------------------------
-- Table structure for wms_inventory
-- ----------------------------
DROP TABLE IF EXISTS `wms_inventory`;
CREATE TABLE `wms_inventory`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `sku_id` bigint(20) NULL DEFAULT NULL COMMENT '规格ID',
  `warehouse_id` bigint(20) NULL DEFAULT NULL COMMENT '所属仓库',
  `area_id` bigint(20) NULL DEFAULT NULL COMMENT '所属库区',
  `quantity` decimal(20, 2) NULL DEFAULT NULL COMMENT '库存',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(3) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '修改人',
  `update_time` datetime(3) NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1829418900244852738 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '库存表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wms_inventory
-- ----------------------------
INSERT INTO `wms_inventory` VALUES (1828410752281288706, 1828408796968030210, 1828364609002311682, 1828364666585911297, 1.00, NULL, 'admin', '2024-08-27 20:34:28.229', 'admin', '2024-08-27 20:34:28.229');
INSERT INTO `wms_inventory` VALUES (1828410752285483010, 1828408796968030212, 1828364609002311682, 1828364666585911297, 1.00, NULL, 'admin', '2024-08-27 20:34:28.231', 'admin', '2024-08-27 20:34:28.231');
INSERT INTO `wms_inventory` VALUES (1828410752285483011, 1828408796968030211, 1828364609002311682, 1828364666585911297, 1.00, NULL, 'admin', '2024-08-27 20:34:28.231', 'admin', '2024-08-27 20:34:28.231');
INSERT INTO `wms_inventory` VALUES (1828631499272560641, 1828408796968030212, 1828364459110469633, 1828364518342430721, 2.00, NULL, 'admin', '2024-08-28 11:11:38.423', 'admin', '2024-08-28 11:16:18.237');
INSERT INTO `wms_inventory` VALUES (1828631499272560642, 1828408796968030211, 1828364459110469633, 1828364518342430721, 1.00, NULL, 'admin', '2024-08-28 11:11:38.424', 'admin', '2024-08-28 11:19:20.733');
INSERT INTO `wms_inventory` VALUES (1828631499272560643, 1828408796968030210, 1828364459110469633, 1828364518342430721, 0.00, NULL, 'admin', '2024-08-28 11:11:38.425', 'admin', '2024-08-28 11:19:20.734');
INSERT INTO `wms_inventory` VALUES (1828633047683768322, 1828408321522700289, 1828364609002311682, 1828364666585911297, 1.00, NULL, 'admin', '2024-08-28 11:17:47.585', 'admin', '2024-08-28 14:35:26.915');
INSERT INTO `wms_inventory` VALUES (1828682789792980994, 1828408321522700289, 1828364459110469633, 1828364518342430721, 1.00, NULL, 'admin', '2024-08-28 14:35:27.039', 'admin', '2024-08-28 14:35:27.039');
INSERT INTO `wms_inventory` VALUES (1829399582966738945, 1829398193024724993, 1828364740028174337, 1829397742493560833, 99.00, NULL, 'admin', '2024-08-30 14:03:43.850', 'kucun', '2024-08-30 14:30:23.390');
INSERT INTO `wms_inventory` VALUES (1829399582966738946, 1829398193024724994, 1828364740028174337, 1829397742493560833, 100.00, NULL, 'admin', '2024-08-30 14:03:43.851', 'kucun', '2024-08-30 14:30:23.391');
INSERT INTO `wms_inventory` VALUES (1829399582966738947, 1829399118304964610, 1828364740028174337, 1829397566185992193, 97.00, NULL, 'admin', '2024-08-30 14:03:43.851', 'kucun', '2024-08-30 15:20:29.232');
INSERT INTO `wms_inventory` VALUES (1829399582966738948, 1829398702011904001, 1828364740028174337, 1829397661719654401, 99.00, NULL, 'admin', '2024-08-30 14:03:43.852', 'kucun', '2024-08-30 14:30:23.391');
INSERT INTO `wms_inventory` VALUES (1829399582966738949, 1829398702011904002, 1828364740028174337, 1829397661719654401, 99.00, NULL, 'admin', '2024-08-30 14:03:43.852', 'kucun', '2024-08-30 14:30:23.392');
INSERT INTO `wms_inventory` VALUES (1829399583033847810, 1829398333903007746, 1828364740028174337, 1829397707726974978, 99.00, NULL, 'admin', '2024-08-30 14:03:43.854', 'kucun', '2024-08-30 14:30:23.392');
INSERT INTO `wms_inventory` VALUES (1829399583033847811, 1829398333903007745, 1828364740028174337, 1829397707726974978, 98.00, NULL, 'admin', '2024-08-30 14:03:43.854', 'kucun', '2024-08-30 14:30:23.393');
INSERT INTO `wms_inventory` VALUES (1829399583033847812, 1829398492779048963, 1828364740028174337, 1829397621378838530, 98.00, NULL, 'admin', '2024-08-30 14:03:43.855', 'kucun', '2024-08-30 14:30:23.393');
INSERT INTO `wms_inventory` VALUES (1829399583033847813, 1829399118304964609, 1828364740028174337, 1829397566185992193, 97.00, NULL, 'admin', '2024-08-30 14:03:43.856', 'kucun', '2024-08-30 15:20:29.232');
INSERT INTO `wms_inventory` VALUES (1829399583033847814, 1829398492779048962, 1828364740028174337, 1829397621378838530, 98.00, NULL, 'admin', '2024-08-30 14:03:43.856', 'kucun', '2024-08-30 14:30:23.394');
INSERT INTO `wms_inventory` VALUES (1829418900177743873, 1829399118304964609, 1828364740028174337, 1829397621378838530, 1.00, NULL, 'kucun', '2024-08-30 15:20:29.435', 'kucun', '2024-08-30 15:20:29.435');
INSERT INTO `wms_inventory` VALUES (1829418900244852737, 1829399118304964610, 1828364740028174337, 1829397621378838530, 1.00, NULL, 'kucun', '2024-08-30 15:20:29.436', 'kucun', '2024-08-30 15:20:29.436');

-- ----------------------------
-- Table structure for wms_inventory_detail
-- ----------------------------
DROP TABLE IF EXISTS `wms_inventory_detail`;
CREATE TABLE `wms_inventory_detail`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `receipt_order_id` bigint(20) NULL DEFAULT NULL COMMENT '入库单id',
  `receipt_order_type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '入库单类型',
  `order_no` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '单号',
  `type` int(11) NULL DEFAULT NULL COMMENT '类型 1：入库 2：移库 3：盘库',
  `sku_id` bigint(20) NULL DEFAULT NULL COMMENT 'sku的ID',
  `warehouse_id` bigint(20) NULL DEFAULT NULL COMMENT '所属仓库',
  `area_id` bigint(20) NULL DEFAULT NULL COMMENT '所属库区',
  `quantity` decimal(20, 2) NULL DEFAULT NULL COMMENT '入库数量',
  `batch_no` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_polish_ci NULL DEFAULT NULL COMMENT '批号',
  `production_date` datetime(3) NULL DEFAULT NULL COMMENT '生产日期',
  `expiration_date` datetime(3) NULL DEFAULT NULL COMMENT '过期时间',
  `amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '金额',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `remain_quantity` decimal(10, 2) NULL DEFAULT NULL COMMENT '剩余数量',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_polish_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(3) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_polish_ci NULL DEFAULT NULL COMMENT '修改人',
  `update_time` datetime(3) NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1829418900894969860 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_polish_ci COMMENT = '库存详情' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wms_inventory_detail
-- ----------------------------
INSERT INTO `wms_inventory_detail` VALUES (1828410751362736129, 1828410750511292417, NULL, NULL, 1, 1828408796968030210, 1828364609002311682, 1828364666585911297, 1.00, NULL, NULL, NULL, NULL, NULL, 1.00, 'admin', '2024-08-27 20:34:28.015', 'admin', '2024-08-27 20:34:28.015');
INSERT INTO `wms_inventory_detail` VALUES (1828410751362736130, 1828410750511292417, NULL, NULL, 1, 1828408796968030211, 1828364609002311682, 1828364666585911297, 1.00, NULL, NULL, NULL, NULL, NULL, 1.00, 'admin', '2024-08-27 20:34:28.017', 'admin', '2024-08-27 20:34:28.017');
INSERT INTO `wms_inventory_detail` VALUES (1828410751362736131, 1828410750511292417, NULL, NULL, 1, 1828408796968030212, 1828364609002311682, 1828364666585911297, 1.00, NULL, NULL, NULL, NULL, NULL, 1.00, 'admin', '2024-08-27 20:34:28.017', 'admin', '2024-08-27 20:34:28.017');
INSERT INTO `wms_inventory_detail` VALUES (1828631499662630914, 1828631466955448321, NULL, NULL, 3, 1828408796968030211, 1828364459110469633, 1828364518342430721, 1.00, NULL, NULL, NULL, NULL, NULL, 1.00, 'admin', '2024-08-28 11:11:22.000', 'admin', '2024-08-28 11:11:22.000');
INSERT INTO `wms_inventory_detail` VALUES (1828631499662630915, 1828631466955448321, NULL, NULL, 3, 1828408796968030212, 1828364459110469633, 1828364518342430721, 1.00, NULL, NULL, NULL, NULL, NULL, 1.00, 'admin', '2024-08-28 11:11:22.000', 'admin', '2024-08-28 11:11:22.000');
INSERT INTO `wms_inventory_detail` VALUES (1828632673883201539, 1828632546531549185, NULL, NULL, 3, 1828408796968030212, 1828364459110469633, 1828364518342430721, 1.00, NULL, NULL, NULL, NULL, NULL, 1.00, 'admin', '2024-08-28 11:11:22.000', 'admin', '2024-08-28 11:11:22.000');
INSERT INTO `wms_inventory_detail` VALUES (1828633048015118337, NULL, NULL, NULL, 3, 1828408321522700289, 1828364609002311682, 1828364666585911297, 2.00, NULL, NULL, NULL, NULL, NULL, 1.00, 'admin', '2024-08-28 11:17:34.000', 'admin', '2024-08-28 14:35:27.121');
INSERT INTO `wms_inventory_detail` VALUES (1828682790510206977, 1828682788358529025, NULL, NULL, 2, 1828408321522700289, 1828364459110469633, 1828364518342430721, 1.00, NULL, NULL, NULL, NULL, NULL, 1.00, 'admin', '2024-08-28 14:35:27.202', 'admin', '2024-08-28 14:35:27.202');
INSERT INTO `wms_inventory_detail` VALUES (1829399580546625538, 1829399579699376129, NULL, NULL, 1, 1829399118304964609, 1828364740028174337, 1829397566185992193, 100.00, NULL, NULL, NULL, NULL, NULL, 97.00, 'admin', '2024-08-30 14:03:43.274', 'kucun', '2024-08-30 15:20:29.514');
INSERT INTO `wms_inventory_detail` VALUES (1829399580546625539, 1829399579699376129, NULL, NULL, 1, 1829399118304964610, 1828364740028174337, 1829397566185992193, 100.00, NULL, NULL, NULL, NULL, NULL, 97.00, 'admin', '2024-08-30 14:03:43.275', 'kucun', '2024-08-30 15:20:29.514');
INSERT INTO `wms_inventory_detail` VALUES (1829399580613734402, 1829399579699376129, NULL, NULL, 1, 1829398702011904001, 1828364740028174337, 1829397661719654401, 100.00, NULL, NULL, NULL, NULL, NULL, 99.00, 'admin', '2024-08-30 14:03:43.275', 'kucun', '2024-08-30 14:30:23.602');
INSERT INTO `wms_inventory_detail` VALUES (1829399580613734403, 1829399579699376129, NULL, NULL, 1, 1829398702011904002, 1828364740028174337, 1829397661719654401, 100.00, NULL, NULL, NULL, NULL, NULL, 99.00, 'admin', '2024-08-30 14:03:43.276', 'kucun', '2024-08-30 14:30:23.602');
INSERT INTO `wms_inventory_detail` VALUES (1829399580613734404, 1829399579699376129, NULL, NULL, 1, 1829398492779048962, 1828364740028174337, 1829397621378838530, 99.00, NULL, NULL, NULL, NULL, NULL, 98.00, 'admin', '2024-08-30 14:03:43.277', 'kucun', '2024-08-30 14:30:23.602');
INSERT INTO `wms_inventory_detail` VALUES (1829399580613734405, 1829399579699376129, NULL, NULL, 1, 1829398492779048963, 1828364740028174337, 1829397621378838530, 99.00, NULL, NULL, NULL, NULL, NULL, 98.00, 'admin', '2024-08-30 14:03:43.281', 'kucun', '2024-08-30 14:30:23.602');
INSERT INTO `wms_inventory_detail` VALUES (1829399580613734406, 1829399579699376129, NULL, NULL, 1, 1829398333903007745, 1828364740028174337, 1829397707726974978, 99.00, NULL, NULL, NULL, NULL, NULL, 98.00, 'admin', '2024-08-30 14:03:43.282', 'kucun', '2024-08-30 14:30:23.602');
INSERT INTO `wms_inventory_detail` VALUES (1829399580613734407, 1829399579699376129, NULL, NULL, 1, 1829398333903007746, 1828364740028174337, 1829397707726974978, 100.00, NULL, NULL, NULL, NULL, NULL, 99.00, 'admin', '2024-08-30 14:03:43.285', 'kucun', '2024-08-30 14:30:23.602');
INSERT INTO `wms_inventory_detail` VALUES (1829399580613734408, 1829399579699376129, NULL, NULL, 1, 1829398193024724993, 1828364740028174337, 1829397742493560833, 100.00, NULL, NULL, NULL, NULL, NULL, 99.00, 'admin', '2024-08-30 14:03:43.287', 'kucun', '2024-08-30 14:30:23.602');
INSERT INTO `wms_inventory_detail` VALUES (1829399580613734409, 1829399579699376129, NULL, NULL, 1, 1829398193024724994, 1828364740028174337, 1829397742493560833, 101.00, NULL, NULL, NULL, NULL, NULL, 100.00, 'admin', '2024-08-30 14:03:43.287', 'kucun', '2024-08-30 14:30:23.602');
INSERT INTO `wms_inventory_detail` VALUES (1829418900894969858, 1829418487672139777, NULL, NULL, 2, 1829399118304964609, 1828364740028174337, 1829397621378838530, 1.00, NULL, NULL, NULL, NULL, NULL, 1.00, 'kucun', '2024-08-30 15:20:29.600', 'kucun', '2024-08-30 15:20:29.600');
INSERT INTO `wms_inventory_detail` VALUES (1829418900894969859, 1829418487672139777, NULL, NULL, 2, 1829399118304964610, 1828364740028174337, 1829397621378838530, 1.00, NULL, NULL, NULL, NULL, NULL, 1.00, 'kucun', '2024-08-30 15:20:29.601', 'kucun', '2024-08-30 15:20:29.601');

-- ----------------------------
-- Table structure for wms_inventory_history
-- ----------------------------
DROP TABLE IF EXISTS `wms_inventory_history`;
CREATE TABLE `wms_inventory_history`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `warehouse_id` bigint(20) NULL DEFAULT NULL COMMENT '所属仓库',
  `area_id` bigint(20) NULL DEFAULT NULL COMMENT '所属库区',
  `sku_id` bigint(20) NULL DEFAULT NULL COMMENT '物料ID',
  `quantity` decimal(20, 2) NULL DEFAULT NULL COMMENT '库存变化',
  `batch_no` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '批号',
  `production_date` datetime(3) NULL DEFAULT NULL COMMENT '生产日期',
  `expiration_date` datetime(3) NULL DEFAULT NULL COMMENT '过期日期',
  `amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '金额',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `order_id` bigint(20) NULL DEFAULT NULL COMMENT '操作id（出库、入库、库存移动表单id）',
  `order_no` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '操作单号（入库、出库、移库、盘库单号）',
  `order_type` int(11) NULL DEFAULT NULL COMMENT '操作类型',
  `create_time` datetime(3) NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1829418901289234437 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '库存记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wms_inventory_history
-- ----------------------------
INSERT INTO `wms_inventory_history` VALUES (1828410752604250113, 1828364609002311682, 1828364666585911297, 1828408796968030210, 1.00, NULL, NULL, NULL, NULL, NULL, 1828410750511292417, 'RK08270491', 1, '2024-08-27 20:34:28.311');
INSERT INTO `wms_inventory_history` VALUES (1828410752604250114, 1828364609002311682, 1828364666585911297, 1828408796968030211, 1.00, NULL, NULL, NULL, NULL, NULL, 1828410750511292417, 'RK08270491', 1, '2024-08-27 20:34:28.312');
INSERT INTO `wms_inventory_history` VALUES (1828410752604250115, 1828364609002311682, 1828364666585911297, 1828408796968030212, 1.00, NULL, NULL, NULL, NULL, NULL, 1828410750511292417, 'RK08270491', 1, '2024-08-27 20:34:28.313');
INSERT INTO `wms_inventory_history` VALUES (1828631500056895489, 1828364459110469633, 1828364518342430721, 1828408796968030211, 1.00, NULL, NULL, NULL, NULL, NULL, 1828631466955448321, 'PK08286054', 4, '2024-08-28 11:11:22.000');
INSERT INTO `wms_inventory_history` VALUES (1828631500056895490, 1828364459110469633, 1828364518342430721, 1828408796968030212, 1.00, NULL, NULL, NULL, NULL, NULL, 1828631466955448321, 'PK08286054', 4, '2024-08-28 11:11:22.000');
INSERT INTO `wms_inventory_history` VALUES (1828631500056895491, 1828364459110469633, 1828364518342430721, 1828408796968030210, 1.00, NULL, NULL, NULL, NULL, NULL, 1828631466955448321, 'PK08286054', 4, '2024-08-28 11:11:22.000');
INSERT INTO `wms_inventory_history` VALUES (1828632674210357249, 1828364459110469633, 1828364518342430721, 1828408796968030210, 1.00, NULL, NULL, NULL, NULL, NULL, 1828632546531549185, 'PK08288055', 4, '2024-08-28 11:11:22.000');
INSERT INTO `wms_inventory_history` VALUES (1828632674210357250, 1828364459110469633, 1828364518342430721, 1828408796968030211, 1.00, NULL, NULL, NULL, NULL, NULL, 1828632546531549185, 'PK08288055', 4, '2024-08-28 11:11:22.000');
INSERT INTO `wms_inventory_history` VALUES (1828632674210357251, 1828364459110469633, 1828364518342430721, 1828408796968030212, 1.00, NULL, NULL, NULL, NULL, NULL, 1828632546531549185, 'PK08288055', 4, '2024-08-28 11:11:22.000');
INSERT INTO `wms_inventory_history` VALUES (1828633048333885442, 1828364609002311682, 1828364666585911297, 1828408321522700289, 2.00, NULL, NULL, NULL, NULL, NULL, NULL, 'PK08283199', 4, '2024-08-28 11:17:34.000');
INSERT INTO `wms_inventory_history` VALUES (1828633439272378369, 1828364459110469633, 1828364518342430721, 1828408796968030210, -1.00, NULL, NULL, NULL, NULL, NULL, 1828633402429612034, 'CK08286097', 2, '2024-08-28 11:19:20.946');
INSERT INTO `wms_inventory_history` VALUES (1828633439272378370, 1828364459110469633, 1828364518342430721, 1828408796968030210, -1.00, NULL, NULL, NULL, NULL, NULL, 1828633402429612034, 'CK08286097', 2, '2024-08-28 11:19:20.946');
INSERT INTO `wms_inventory_history` VALUES (1828633439272378371, 1828364459110469633, 1828364518342430721, 1828408796968030211, -1.00, NULL, NULL, NULL, NULL, NULL, 1828633402429612034, 'CK08286097', 2, '2024-08-28 11:19:20.947');
INSERT INTO `wms_inventory_history` VALUES (1828682790845751297, 1828364609002311682, 1828364666585911297, 1828408321522700289, -1.00, NULL, NULL, NULL, NULL, NULL, 1828682788358529025, 'YK08281599', 3, '2024-08-28 14:35:27.279');
INSERT INTO `wms_inventory_history` VALUES (1828682790845751298, 1828364459110469633, 1828364518342430721, 1828408321522700289, 1.00, NULL, NULL, NULL, NULL, NULL, 1828682788358529025, 'YK08281599', 3, '2024-08-28 14:35:27.280');
INSERT INTO `wms_inventory_history` VALUES (1829399583423918082, 1828364740028174337, 1829397566185992193, 1829399118304964609, 100.00, NULL, NULL, NULL, NULL, NULL, 1829399579699376129, 'RK08302046', 1, '2024-08-30 14:03:43.957');
INSERT INTO `wms_inventory_history` VALUES (1829399583423918083, 1828364740028174337, 1829397566185992193, 1829399118304964610, 100.00, NULL, NULL, NULL, NULL, NULL, 1829399579699376129, 'RK08302046', 1, '2024-08-30 14:03:43.957');
INSERT INTO `wms_inventory_history` VALUES (1829399583423918084, 1828364740028174337, 1829397661719654401, 1829398702011904001, 100.00, NULL, NULL, NULL, NULL, NULL, 1829399579699376129, 'RK08302046', 1, '2024-08-30 14:03:43.957');
INSERT INTO `wms_inventory_history` VALUES (1829399583423918085, 1828364740028174337, 1829397661719654401, 1829398702011904002, 100.00, NULL, NULL, NULL, NULL, NULL, 1829399579699376129, 'RK08302046', 1, '2024-08-30 14:03:43.958');
INSERT INTO `wms_inventory_history` VALUES (1829399583423918086, 1828364740028174337, 1829397621378838530, 1829398492779048962, 99.00, NULL, NULL, NULL, NULL, NULL, 1829399579699376129, 'RK08302046', 1, '2024-08-30 14:03:43.958');
INSERT INTO `wms_inventory_history` VALUES (1829399583423918087, 1828364740028174337, 1829397621378838530, 1829398492779048963, 99.00, NULL, NULL, NULL, NULL, NULL, 1829399579699376129, 'RK08302046', 1, '2024-08-30 14:03:43.959');
INSERT INTO `wms_inventory_history` VALUES (1829399583423918088, 1828364740028174337, 1829397707726974978, 1829398333903007745, 99.00, NULL, NULL, NULL, NULL, NULL, 1829399579699376129, 'RK08302046', 1, '2024-08-30 14:03:43.960');
INSERT INTO `wms_inventory_history` VALUES (1829399583486832642, 1828364740028174337, 1829397707726974978, 1829398333903007746, 100.00, NULL, NULL, NULL, NULL, NULL, 1829399579699376129, 'RK08302046', 1, '2024-08-30 14:03:43.963');
INSERT INTO `wms_inventory_history` VALUES (1829399583486832643, 1828364740028174337, 1829397742493560833, 1829398193024724993, 100.00, NULL, NULL, NULL, NULL, NULL, 1829399579699376129, 'RK08302046', 1, '2024-08-30 14:03:43.963');
INSERT INTO `wms_inventory_history` VALUES (1829399583486832644, 1828364740028174337, 1829397742493560833, 1829398193024724994, 101.00, NULL, NULL, NULL, NULL, NULL, 1829399579699376129, 'RK08302046', 1, '2024-08-30 14:03:43.964');
INSERT INTO `wms_inventory_history` VALUES (1829406293219799042, 1828364740028174337, 1829397566185992193, 1829399118304964609, -1.00, NULL, NULL, NULL, NULL, NULL, 1829405767363129345, 'CK08305241', 2, '2024-08-30 14:30:23.691');
INSERT INTO `wms_inventory_history` VALUES (1829406293219799043, 1828364740028174337, 1829397566185992193, 1829399118304964610, -1.00, NULL, NULL, NULL, NULL, NULL, 1829405767363129345, 'CK08305241', 2, '2024-08-30 14:30:23.692');
INSERT INTO `wms_inventory_history` VALUES (1829406293219799044, 1828364740028174337, 1829397621378838530, 1829398492779048962, -1.00, NULL, NULL, NULL, NULL, NULL, 1829405767363129345, 'CK08305241', 2, '2024-08-30 14:30:23.692');
INSERT INTO `wms_inventory_history` VALUES (1829406293219799045, 1828364740028174337, 1829397621378838530, 1829398492779048963, -1.00, NULL, NULL, NULL, NULL, NULL, 1829405767363129345, 'CK08305241', 2, '2024-08-30 14:30:23.693');
INSERT INTO `wms_inventory_history` VALUES (1829406293219799046, 1828364740028174337, 1829397661719654401, 1829398702011904001, -1.00, NULL, NULL, NULL, NULL, NULL, 1829405767363129345, 'CK08305241', 2, '2024-08-30 14:30:23.693');
INSERT INTO `wms_inventory_history` VALUES (1829406293219799047, 1828364740028174337, 1829397661719654401, 1829398702011904002, -1.00, NULL, NULL, NULL, NULL, NULL, 1829405767363129345, 'CK08305241', 2, '2024-08-30 14:30:23.695');
INSERT INTO `wms_inventory_history` VALUES (1829406293219799048, 1828364740028174337, 1829397707726974978, 1829398333903007745, -1.00, NULL, NULL, NULL, NULL, NULL, 1829405767363129345, 'CK08305241', 2, '2024-08-30 14:30:23.696');
INSERT INTO `wms_inventory_history` VALUES (1829406293219799049, 1828364740028174337, 1829397707726974978, 1829398333903007746, -1.00, NULL, NULL, NULL, NULL, NULL, 1829405767363129345, 'CK08305241', 2, '2024-08-30 14:30:23.697');
INSERT INTO `wms_inventory_history` VALUES (1829406293219799050, 1828364740028174337, 1829397742493560833, 1829398193024724993, -1.00, NULL, NULL, NULL, NULL, NULL, 1829405767363129345, 'CK08305241', 2, '2024-08-30 14:30:23.697');
INSERT INTO `wms_inventory_history` VALUES (1829406293219799051, 1828364740028174337, 1829397742493560833, 1829398193024724994, -1.00, NULL, NULL, NULL, NULL, NULL, 1829405767363129345, 'CK08305241', 2, '2024-08-30 14:30:23.698');
INSERT INTO `wms_inventory_history` VALUES (1829407249542082561, 1828364740028174337, 1829397566185992193, 1829399118304964609, -1.00, NULL, NULL, NULL, NULL, NULL, 1829407217174638593, 'CK08304574', 2, '2024-08-30 14:34:11.704');
INSERT INTO `wms_inventory_history` VALUES (1829407249542082562, 1828364740028174337, 1829397566185992193, 1829399118304964610, -1.00, NULL, NULL, NULL, NULL, NULL, 1829407217174638593, 'CK08304574', 2, '2024-08-30 14:34:11.704');
INSERT INTO `wms_inventory_history` VALUES (1829418901289234433, 1828364740028174337, 1829397566185992193, 1829399118304964609, -1.00, NULL, NULL, NULL, NULL, NULL, 1829418487672139777, 'YK08301821', 3, '2024-08-30 15:20:29.686');
INSERT INTO `wms_inventory_history` VALUES (1829418901289234434, 1828364740028174337, 1829397621378838530, 1829399118304964609, 1.00, NULL, NULL, NULL, NULL, NULL, 1829418487672139777, 'YK08301821', 3, '2024-08-30 15:20:29.686');
INSERT INTO `wms_inventory_history` VALUES (1829418901289234435, 1828364740028174337, 1829397566185992193, 1829399118304964610, -1.00, NULL, NULL, NULL, NULL, NULL, 1829418487672139777, 'YK08301821', 3, '2024-08-30 15:20:29.686');
INSERT INTO `wms_inventory_history` VALUES (1829418901289234436, 1828364740028174337, 1829397621378838530, 1829399118304964610, 1.00, NULL, NULL, NULL, NULL, NULL, 1829418487672139777, 'YK08301821', 3, '2024-08-30 15:20:29.687');

-- ----------------------------
-- Table structure for wms_item
-- ----------------------------
DROP TABLE IF EXISTS `wms_item`;
CREATE TABLE `wms_item`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `item_code` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '编号',
  `item_name` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '名称',
  `item_category` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '分类',
  `unit` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '单位类别',
  `item_brand` bigint(20) NULL DEFAULT NULL COMMENT '品牌',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(3) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '修改人',
  `update_time` datetime(3) NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1829399118040723458 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '物料' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wms_item
-- ----------------------------
INSERT INTO `wms_item` VALUES (1828402622516334594, NULL, '华为 nova flip', '1828364988754595841', NULL, 1828364927610032129, NULL, 'admin', '2024-08-27 20:02:09.948', 'admin', '2024-08-27 20:09:32.989');
INSERT INTO `wms_item` VALUES (1828406450112335874, NULL, 'macbook', '1828365043024695297', NULL, 1828364873889386498, NULL, 'admin', '2024-08-27 20:17:22.521', 'admin', '2024-08-27 20:17:22.521');
INSERT INTO `wms_item` VALUES (1828407870173646849, NULL, '爱普生打印机', '1828365014901886978', NULL, NULL, NULL, 'admin', '2024-08-27 20:23:01.096', 'admin', '2024-08-27 20:23:01.096');
INSERT INTO `wms_item` VALUES (1828408320146968578, NULL, '小米米家436L十字四门风冷无霜嵌入式家用冰箱', '1828405773474631681', NULL, 1828364846953566209, NULL, 'admin', '2024-08-27 20:24:48.375', 'admin', '2024-08-27 20:24:48.375');
INSERT INTO `wms_item` VALUES (1828408795734904833, NULL, '杠铃', '1828408600515219457', NULL, NULL, NULL, 'admin', '2024-08-27 20:26:41.757', 'admin', '2024-08-27 20:33:27.034');
INSERT INTO `wms_item` VALUES (1829398192563351554, NULL, '舟山带鱼', '1829398007993004034', NULL, NULL, NULL, 'admin', '2024-08-30 13:58:12.354', 'admin', '2024-08-30 14:01:08.050');
INSERT INTO `wms_item` VALUES (1829398333580046338, NULL, '青岛大虾', '1829398007993004034', NULL, NULL, NULL, 'admin', '2024-08-30 13:58:45.971', 'admin', '2024-08-30 14:00:49.686');
INSERT INTO `wms_item` VALUES (1829398492388978689, NULL, '启东黄鱼', '1829398007993004034', NULL, NULL, NULL, 'admin', '2024-08-30 13:59:23.834', 'admin', '2024-08-30 14:00:32.373');
INSERT INTO `wms_item` VALUES (1829398701680553985, NULL, '红富士苹果', '1829397958923841538', NULL, NULL, NULL, 'admin', '2024-08-30 14:00:13.735', 'admin', '2024-08-30 14:00:13.735');
INSERT INTO `wms_item` VALUES (1829399118040723457, NULL, '树山梨', '1829397958923841538', NULL, NULL, NULL, 'admin', '2024-08-30 14:01:52.989', 'admin', '2024-08-30 14:01:52.989');

-- ----------------------------
-- Table structure for wms_item_brand
-- ----------------------------
DROP TABLE IF EXISTS `wms_item_brand`;
CREATE TABLE `wms_item_brand`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `brand_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '品牌名称',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `create_time` datetime(3) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新者',
  `update_time` datetime(3) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1828407291103842307 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '商品品牌表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wms_item_brand
-- ----------------------------
INSERT INTO `wms_item_brand` VALUES (1828364846953566209, '小米', 'admin', '2024-08-27 17:32:03.551', 'admin', '2024-08-27 17:32:03.551');
INSERT INTO `wms_item_brand` VALUES (1828364873889386498, '苹果', 'admin', '2024-08-27 17:32:09.971', 'admin', '2024-08-27 17:32:09.971');
INSERT INTO `wms_item_brand` VALUES (1828364927610032129, '华为', 'admin', '2024-08-27 17:32:22.786', 'admin', '2024-08-27 17:32:22.786');
INSERT INTO `wms_item_brand` VALUES (1828407151135723522, '爱普生', 'admin', '2024-08-27 20:20:09.656', 'admin', '2024-08-27 20:20:09.656');
INSERT INTO `wms_item_brand` VALUES (1828407291103842306, '惠普', 'admin', '2024-08-27 20:20:43.031', 'admin', '2024-08-27 20:20:43.031');

-- ----------------------------
-- Table structure for wms_item_category
-- ----------------------------
DROP TABLE IF EXISTS `wms_item_category`;
CREATE TABLE `wms_item_category`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '物料类型id',
  `parent_id` bigint(20) NULL DEFAULT 0 COMMENT '父物料类型id',
  `category_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '物料类型名称',
  `order_num` int(11) NULL DEFAULT 0 COMMENT '显示顺序',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '1' COMMENT '物料类型状态（0停用 1正常）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `create_time` datetime(3) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新者',
  `update_time` datetime(3) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1829398007993004035 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '物料类型表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wms_item_category
-- ----------------------------
INSERT INTO `wms_item_category` VALUES (1828364988754595841, 0, '手机', 0, '1', 'admin', '2024-08-27 17:32:37.357', 'admin', '2024-08-27 20:14:12.100');
INSERT INTO `wms_item_category` VALUES (1828365014901886978, 0, '打印机', 1, '1', 'admin', '2024-08-27 17:32:43.598', 'admin', '2024-08-27 20:14:12.447');
INSERT INTO `wms_item_category` VALUES (1828365043024695297, 0, '电脑', 3, '1', 'admin', '2024-08-27 17:32:50.301', 'admin', '2024-08-27 20:14:12.704');
INSERT INTO `wms_item_category` VALUES (1828405743737016322, 0, '家电', 4, '1', 'admin', '2024-08-27 20:14:34.104', 'admin', '2024-08-27 20:14:34.104');
INSERT INTO `wms_item_category` VALUES (1828405773474631681, 1828405743737016322, '冰箱', 0, '1', 'admin', '2024-08-27 20:14:41.195', 'admin', '2024-08-27 20:14:41.195');
INSERT INTO `wms_item_category` VALUES (1828405825714688001, 1828405743737016322, '电视', 1, '1', 'admin', '2024-08-27 20:14:53.651', 'admin', '2024-08-27 20:14:53.651');
INSERT INTO `wms_item_category` VALUES (1828408600515219457, 0, '健生器材', 5, '1', 'admin', '2024-08-27 20:25:55.213', 'admin', '2024-08-27 20:25:55.213');
INSERT INTO `wms_item_category` VALUES (1829397860466749441, 0, '生鲜', 6, '1', 'admin', '2024-08-30 13:56:53.174', 'admin', '2024-08-30 13:56:53.174');
INSERT INTO `wms_item_category` VALUES (1829397958923841538, 1829397860466749441, '水果', 0, '1', 'admin', '2024-08-30 13:57:16.644', 'admin', '2024-08-30 13:57:16.644');
INSERT INTO `wms_item_category` VALUES (1829398007993004034, 1829397860466749441, '海鲜', 1, '1', 'admin', '2024-08-30 13:57:28.347', 'admin', '2024-08-30 13:57:28.347');

-- ----------------------------
-- Table structure for wms_item_sku
-- ----------------------------
DROP TABLE IF EXISTS `wms_item_sku`;
CREATE TABLE `wms_item_sku`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `sku_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '规格名称',
  `item_id` bigint(20) NULL DEFAULT NULL,
  `barcode` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '条码',
  `sku_code` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '编码',
  `length` decimal(10, 1) NULL DEFAULT NULL COMMENT '长，单位cm',
  `width` decimal(10, 1) NULL DEFAULT NULL COMMENT '宽，单位cm',
  `height` decimal(10, 1) NULL DEFAULT NULL COMMENT '高，单位cm',
  `gross_weight` decimal(10, 3) NULL DEFAULT NULL COMMENT '毛重，单位kg',
  `net_weight` decimal(10, 3) NULL DEFAULT NULL COMMENT '净重，单位kg',
  `cost_price` decimal(10, 2) NULL DEFAULT NULL COMMENT '成本价（元）',
  `selling_price` decimal(10, 2) NULL DEFAULT NULL COMMENT '销售价（元）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(3) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '修改人',
  `update_time` datetime(3) NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1829399118304964611 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'sku信息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wms_item_sku
-- ----------------------------
INSERT INTO `wms_item_sku` VALUES (1828402624005312514, '黑', 1828402622516334594, '', '00001', NULL, NULL, NULL, NULL, NULL, 5000.00, 5288.00, 'admin', '2024-08-27 20:02:10.302', 'admin', '2024-08-27 20:09:33.329');
INSERT INTO `wms_item_sku` VALUES (1828402624005312515, '白', 1828402622516334594, '', '000002', NULL, NULL, NULL, NULL, NULL, 5000.00, 5288.00, 'admin', '2024-08-27 20:02:10.304', 'admin', '2024-08-27 20:09:33.439');
INSERT INTO `wms_item_sku` VALUES (1828402624005312516, '粉', 1828402622516334594, '', '00003', NULL, NULL, NULL, NULL, NULL, 5000.00, 5288.00, 'admin', '2024-08-27 20:02:10.305', 'admin', '2024-08-27 20:09:33.583');
INSERT INTO `wms_item_sku` VALUES (1828406451399987201, 'pro', 1828406450112335874, '', 'mac0001', NULL, NULL, NULL, NULL, NULL, NULL, 24999.00, 'admin', '2024-08-27 20:17:22.821', 'admin', '2024-08-27 20:17:22.821');
INSERT INTO `wms_item_sku` VALUES (1828407871469686786, 'l6468', 1828407870173646849, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3188.00, 'admin', '2024-08-27 20:23:01.393', 'admin', '2024-08-27 20:23:01.393');
INSERT INTO `wms_item_sku` VALUES (1828408321522700289, '白色', 1828408320146968578, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2699.00, 'admin', '2024-08-27 20:24:48.697', 'admin', '2024-08-27 20:24:48.697');
INSERT INTO `wms_item_sku` VALUES (1828408796968030210, '10kg', 1828408795734904833, '102025115', NULL, NULL, NULL, NULL, NULL, 10.000, NULL, NULL, 'admin', '2024-08-27 20:26:42.049', 'admin', '2024-08-27 20:33:27.395');
INSERT INTO `wms_item_sku` VALUES (1828408796968030211, '20kg', 1828408795734904833, '254523055', NULL, NULL, NULL, NULL, NULL, 20.000, NULL, NULL, 'admin', '2024-08-27 20:26:42.052', 'admin', '2024-08-27 20:33:27.515');
INSERT INTO `wms_item_sku` VALUES (1828408796968030212, '50kg', 1828408795734904833, '5204862525', NULL, NULL, NULL, NULL, NULL, 50.000, NULL, NULL, 'admin', '2024-08-27 20:26:42.052', 'admin', '2024-08-27 20:33:27.634');
INSERT INTO `wms_item_sku` VALUES (1829398193024724993, '大', 1829398192563351554, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'admin', '2024-08-30 13:58:12.457', 'admin', '2024-08-30 14:01:08.172');
INSERT INTO `wms_item_sku` VALUES (1829398193024724994, '中', 1829398192563351554, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'admin', '2024-08-30 13:58:12.458', 'admin', '2024-08-30 14:01:08.328');
INSERT INTO `wms_item_sku` VALUES (1829398333903007745, '大', 1829398333580046338, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'admin', '2024-08-30 13:58:46.047', 'admin', '2024-08-30 14:00:49.854');
INSERT INTO `wms_item_sku` VALUES (1829398333903007746, '中', 1829398333580046338, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'admin', '2024-08-30 13:58:46.048', 'admin', '2024-08-30 14:00:50.001');
INSERT INTO `wms_item_sku` VALUES (1829398492779048962, '大', 1829398492388978689, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'admin', '2024-08-30 13:59:23.925', 'admin', '2024-08-30 14:00:32.544');
INSERT INTO `wms_item_sku` VALUES (1829398492779048963, '中', 1829398492388978689, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'admin', '2024-08-30 13:59:23.925', 'admin', '2024-08-30 14:00:32.683');
INSERT INTO `wms_item_sku` VALUES (1829398702011904001, '大', 1829398701680553985, '', NULL, 10.0, 10.0, 10.0, NULL, NULL, NULL, NULL, 'admin', '2024-08-30 14:00:13.810', 'admin', '2024-08-30 14:00:13.810');
INSERT INTO `wms_item_sku` VALUES (1829398702011904002, '中', 1829398701680553985, '', NULL, 5.0, 5.0, 5.0, NULL, NULL, NULL, NULL, 'admin', '2024-08-30 14:00:13.812', 'admin', '2024-08-30 14:00:13.812');
INSERT INTO `wms_item_sku` VALUES (1829399118304964609, '大', 1829399118040723457, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'admin', '2024-08-30 14:01:53.064', 'admin', '2024-08-30 14:01:53.064');
INSERT INTO `wms_item_sku` VALUES (1829399118304964610, '中', 1829399118040723457, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'admin', '2024-08-30 14:01:53.064', 'admin', '2024-08-30 14:01:53.064');

-- ----------------------------
-- Table structure for wms_merchant
-- ----------------------------
DROP TABLE IF EXISTS `wms_merchant`;
CREATE TABLE `wms_merchant`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `merchant_code` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '编号',
  `merchant_name` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '名称',
  `merchant_type` tinyint(4) NULL DEFAULT NULL COMMENT '企业类型',
  `merchant_level` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '级别',
  `bank_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '开户行',
  `bank_account` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '银行账户',
  `address` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '地址',
  `mobile` varchar(13) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '手机号',
  `tel` varchar(13) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '座机号',
  `contact_person` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '联系人',
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'Email',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(3) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '修改人',
  `update_time` datetime(3) NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1828354284882399234 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '往来单位' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wms_merchant
-- ----------------------------
INSERT INTO `wms_merchant` VALUES (1828354016258199554, 'c_0001', '苏州XXXXXXX仓储管理有限公司', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'admin', '2024-08-27 16:49:01.319', 'admin', '2024-08-27 16:49:01.319');
INSERT INTO `wms_merchant` VALUES (1828354153193836545, 's_0001', '苏州XXXXX供应链有限公司', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'admin', '2024-08-27 16:49:33.964', 'admin', '2024-08-27 16:49:33.964');
INSERT INTO `wms_merchant` VALUES (1828354284882399233, 'c_s_0001', '苏州CS有限公司', 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'admin', '2024-08-27 16:50:05.367', 'admin', '2024-08-27 16:50:05.367');

-- ----------------------------
-- Table structure for wms_movement_order
-- ----------------------------
DROP TABLE IF EXISTS `wms_movement_order`;
CREATE TABLE `wms_movement_order`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `movement_order_no` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '编号',
  `source_warehouse_id` bigint(20) NULL DEFAULT NULL COMMENT '源仓库',
  `source_area_id` bigint(20) NULL DEFAULT NULL COMMENT '源库区',
  `target_warehouse_id` bigint(20) NULL DEFAULT NULL COMMENT '目标仓库',
  `target_area_id` bigint(20) NULL DEFAULT NULL COMMENT '目标库区',
  `movement_order_status` tinyint(4) NULL DEFAULT NULL COMMENT '状态',
  `total_quantity` decimal(10, 2) NULL DEFAULT NULL COMMENT '总数量',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(3) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '修改人',
  `update_time` datetime(3) NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1829418487672139778 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '移库单' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wms_movement_order
-- ----------------------------
INSERT INTO `wms_movement_order` VALUES (1828682788358529025, 'YK08281599', 1828364609002311682, NULL, 1828364459110469633, NULL, 1, 1.00, NULL, 'admin', '2024-08-28 14:35:26.686', 'admin', '2024-08-28 14:35:26.686');
INSERT INTO `wms_movement_order` VALUES (1829418487672139777, 'YK08301821', 1828364740028174337, 1829397566185992193, 1828364740028174337, 1829397621378838530, 1, 2.00, NULL, 'kucun', '2024-08-30 15:18:51.082', 'kucun', '2024-08-30 15:20:28.751');

-- ----------------------------
-- Table structure for wms_movement_order_detail
-- ----------------------------
DROP TABLE IF EXISTS `wms_movement_order_detail`;
CREATE TABLE `wms_movement_order_detail`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `movement_order_id` bigint(20) NULL DEFAULT NULL COMMENT '移库单Id',
  `sku_id` bigint(20) NULL DEFAULT NULL COMMENT '规格id',
  `quantity` decimal(20, 2) NULL DEFAULT NULL COMMENT '数量',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `batch_no` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '批号',
  `production_date` datetime(3) NULL DEFAULT NULL COMMENT '生产日期',
  `expiration_date` datetime(3) NULL DEFAULT NULL COMMENT '过期日期',
  `source_warehouse_id` bigint(20) NULL DEFAULT NULL COMMENT '源仓库',
  `source_area_id` bigint(20) NULL DEFAULT NULL COMMENT '源库区',
  `target_warehouse_id` bigint(20) NULL DEFAULT NULL COMMENT '目标仓库',
  `target_area_id` bigint(20) NULL DEFAULT NULL COMMENT '目标库区',
  `inventory_detail_id` bigint(20) NULL DEFAULT NULL COMMENT '入库记录id',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(3) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '修改人',
  `update_time` datetime(3) NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1829418488129318916 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '库存移动详情' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wms_movement_order_detail
-- ----------------------------
INSERT INTO `wms_movement_order_detail` VALUES (1828682788677296129, 1828682788358529025, 1828408321522700289, 1.00, NULL, NULL, NULL, NULL, 1828364609002311682, 1828364666585911297, 1828364459110469633, 1828364518342430721, 1828633048015118337, 'admin', '2024-08-28 14:35:26.771', 'admin', '2024-08-28 14:35:26.771');
INSERT INTO `wms_movement_order_detail` VALUES (1829418488129318914, 1829418487672139777, 1829399118304964609, 1.00, NULL, NULL, NULL, NULL, 1828364740028174337, 1829397566185992193, 1828364740028174337, 1829397621378838530, 1829399580546625538, 'kucun', '2024-08-30 15:18:51.187', 'kucun', '2024-08-30 15:20:28.882');
INSERT INTO `wms_movement_order_detail` VALUES (1829418488129318915, 1829418487672139777, 1829399118304964610, 1.00, NULL, NULL, NULL, NULL, 1828364740028174337, 1829397566185992193, 1828364740028174337, 1829397621378838530, 1829399580546625539, 'kucun', '2024-08-30 15:18:51.188', 'kucun', '2024-08-30 15:20:29.026');

-- ----------------------------
-- Table structure for wms_receipt_order
-- ----------------------------
DROP TABLE IF EXISTS `wms_receipt_order`;
CREATE TABLE `wms_receipt_order`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `receipt_order_no` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '入库单号',
  `receipt_order_type` int(11) NULL DEFAULT NULL COMMENT '入库类型',
  `merchant_id` bigint(20) NULL DEFAULT NULL COMMENT '供应商',
  `order_no` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '订单号',
  `total_quantity` decimal(10, 2) NULL DEFAULT NULL COMMENT '商品总数',
  `payable_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '订单金额',
  `receipt_order_status` tinyint(4) NULL DEFAULT NULL COMMENT '入库状态',
  `warehouse_id` bigint(20) NULL DEFAULT NULL COMMENT '仓库id',
  `area_id` bigint(20) NULL DEFAULT NULL COMMENT '库区id',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(3) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '修改人',
  `update_time` datetime(3) NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1829399579699376130 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '入库单' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wms_receipt_order
-- ----------------------------
INSERT INTO `wms_receipt_order` VALUES (1828410750511292417, 'RK08270491', 2, NULL, NULL, 3.00, NULL, 1, 1828364609002311682, 1828364666585911297, NULL, 'admin', '2024-08-27 20:34:27.816', 'admin', '2024-08-27 20:34:27.816');
INSERT INTO `wms_receipt_order` VALUES (1829399579699376129, 'RK08302046', 2, NULL, NULL, 998.00, NULL, 1, 1828364740028174337, NULL, NULL, 'admin', '2024-08-30 14:03:43.061', 'admin', '2024-08-30 14:03:43.061');

-- ----------------------------
-- Table structure for wms_receipt_order_detail
-- ----------------------------
DROP TABLE IF EXISTS `wms_receipt_order_detail`;
CREATE TABLE `wms_receipt_order_detail`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `receipt_order_id` bigint(20) NULL DEFAULT NULL COMMENT '入库单号',
  `sku_id` bigint(20) NULL DEFAULT NULL COMMENT '规格id',
  `quantity` decimal(20, 2) NULL DEFAULT NULL COMMENT '入库数量',
  `amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '金额',
  `batch_no` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '批号',
  `production_date` datetime(3) NULL DEFAULT NULL COMMENT '生产日期',
  `expiration_date` datetime(3) NULL DEFAULT NULL COMMENT '过期时间',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(3) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '修改人',
  `update_time` datetime(3) NULL DEFAULT NULL COMMENT '修改时间',
  `warehouse_id` bigint(20) NULL DEFAULT NULL COMMENT '所属仓库',
  `area_id` bigint(20) NULL DEFAULT NULL COMMENT '所属库区',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1829399580093640709 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '入库单详情' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wms_receipt_order_detail
-- ----------------------------
INSERT INTO `wms_receipt_order_detail` VALUES (1828410750972665857, 1828410750511292417, 1828408796968030210, 1.00, NULL, NULL, NULL, NULL, NULL, 'admin', '2024-08-27 20:34:27.928', 'admin', '2024-08-27 20:34:27.928', 1828364609002311682, 1828364666585911297);
INSERT INTO `wms_receipt_order_detail` VALUES (1828410750972665858, 1828410750511292417, 1828408796968030211, 1.00, NULL, NULL, NULL, NULL, NULL, 'admin', '2024-08-27 20:34:27.931', 'admin', '2024-08-27 20:34:27.931', 1828364609002311682, 1828364666585911297);
INSERT INTO `wms_receipt_order_detail` VALUES (1828410750972665859, 1828410750511292417, 1828408796968030212, 1.00, NULL, NULL, NULL, NULL, NULL, 'admin', '2024-08-27 20:34:27.932', 'admin', '2024-08-27 20:34:27.932', 1828364609002311682, 1828364666585911297);
INSERT INTO `wms_receipt_order_detail` VALUES (1829399580026531841, 1829399579699376129, 1829399118304964609, 100.00, NULL, NULL, NULL, NULL, NULL, 'admin', '2024-08-30 14:03:43.145', 'admin', '2024-08-30 14:03:43.145', 1828364740028174337, 1829397566185992193);
INSERT INTO `wms_receipt_order_detail` VALUES (1829399580026531842, 1829399579699376129, 1829399118304964610, 100.00, NULL, NULL, NULL, NULL, NULL, 'admin', '2024-08-30 14:03:43.146', 'admin', '2024-08-30 14:03:43.146', 1828364740028174337, 1829397566185992193);
INSERT INTO `wms_receipt_order_detail` VALUES (1829399580026531843, 1829399579699376129, 1829398702011904001, 100.00, NULL, NULL, NULL, NULL, NULL, 'admin', '2024-08-30 14:03:43.146', 'admin', '2024-08-30 14:03:43.146', 1828364740028174337, 1829397661719654401);
INSERT INTO `wms_receipt_order_detail` VALUES (1829399580026531844, 1829399579699376129, 1829398702011904002, 100.00, NULL, NULL, NULL, NULL, NULL, 'admin', '2024-08-30 14:03:43.146', 'admin', '2024-08-30 14:03:43.146', 1828364740028174337, 1829397661719654401);
INSERT INTO `wms_receipt_order_detail` VALUES (1829399580026531845, 1829399579699376129, 1829398492779048962, 99.00, NULL, NULL, NULL, NULL, NULL, 'admin', '2024-08-30 14:03:43.147', 'admin', '2024-08-30 14:03:43.147', 1828364740028174337, 1829397621378838530);
INSERT INTO `wms_receipt_order_detail` VALUES (1829399580026531846, 1829399579699376129, 1829398492779048963, 99.00, NULL, NULL, NULL, NULL, NULL, 'admin', '2024-08-30 14:03:43.150', 'admin', '2024-08-30 14:03:43.150', 1828364740028174337, 1829397621378838530);
INSERT INTO `wms_receipt_order_detail` VALUES (1829399580026531847, 1829399579699376129, 1829398333903007745, 99.00, NULL, NULL, NULL, NULL, NULL, 'admin', '2024-08-30 14:03:43.150', 'admin', '2024-08-30 14:03:43.150', 1828364740028174337, 1829397707726974978);
INSERT INTO `wms_receipt_order_detail` VALUES (1829399580093640706, 1829399579699376129, 1829398333903007746, 100.00, NULL, NULL, NULL, NULL, NULL, 'admin', '2024-08-30 14:03:43.153', 'admin', '2024-08-30 14:03:43.153', 1828364740028174337, 1829397707726974978);
INSERT INTO `wms_receipt_order_detail` VALUES (1829399580093640707, 1829399579699376129, 1829398193024724993, 100.00, NULL, NULL, NULL, NULL, NULL, 'admin', '2024-08-30 14:03:43.154', 'admin', '2024-08-30 14:03:43.154', 1828364740028174337, 1829397742493560833);
INSERT INTO `wms_receipt_order_detail` VALUES (1829399580093640708, 1829399579699376129, 1829398193024724994, 101.00, NULL, NULL, NULL, NULL, NULL, 'admin', '2024-08-30 14:03:43.154', 'admin', '2024-08-30 14:03:43.154', 1828364740028174337, 1829397742493560833);

-- ----------------------------
-- Table structure for wms_shipment_order
-- ----------------------------
DROP TABLE IF EXISTS `wms_shipment_order`;
CREATE TABLE `wms_shipment_order`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `shipment_order_no` varchar(22) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '出库单号，系统自动生成',
  `shipment_order_type` int(11) NULL DEFAULT NULL COMMENT '出库类型',
  `order_no` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '出库订单',
  `merchant_id` bigint(20) NULL DEFAULT NULL COMMENT '客户',
  `receivable_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '订单金额',
  `total_quantity` decimal(10, 2) NULL DEFAULT NULL COMMENT '出库数量',
  `shipment_order_status` tinyint(4) NULL DEFAULT NULL COMMENT '出库单状态',
  `warehouse_id` bigint(20) NULL DEFAULT NULL COMMENT '仓库id',
  `area_id` bigint(20) NULL DEFAULT NULL COMMENT '库区id',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(3) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '修改人',
  `update_time` datetime(3) NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1829407217174638594 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '出库单' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wms_shipment_order
-- ----------------------------
INSERT INTO `wms_shipment_order` VALUES (1828633402429612034, 'CK08286097', 1, NULL, NULL, NULL, 3.00, 1, 1828364459110469633, 1828364518342430721, NULL, 'admin', '2024-08-28 11:19:12.166', 'admin', '2024-08-28 11:19:20.263');
INSERT INTO `wms_shipment_order` VALUES (1829405767363129345, 'CK08305241', 2, NULL, NULL, NULL, 10.00, 1, 1828364740028174337, NULL, NULL, 'kucun', '2024-08-30 14:28:18.316', 'kucun', '2024-08-30 14:30:21.057');
INSERT INTO `wms_shipment_order` VALUES (1829407217174638593, 'CK08304574', 2, NULL, NULL, NULL, 2.00, 1, 1828364740028174337, 1829397566185992193, NULL, 'kucun', '2024-08-30 14:34:03.985', 'kucun', '2024-08-30 14:34:11.116');

-- ----------------------------
-- Table structure for wms_shipment_order_detail
-- ----------------------------
DROP TABLE IF EXISTS `wms_shipment_order_detail`;
CREATE TABLE `wms_shipment_order_detail`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `shipment_order_id` bigint(20) NULL DEFAULT NULL COMMENT '出库单',
  `sku_id` bigint(20) NULL DEFAULT NULL COMMENT '规格id',
  `quantity` decimal(10, 2) NULL DEFAULT NULL COMMENT '数量',
  `amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '金额',
  `warehouse_id` bigint(20) NULL DEFAULT NULL COMMENT '所属仓库',
  `area_id` bigint(20) NULL DEFAULT NULL COMMENT '所属库区',
  `batch_no` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '批号',
  `production_date` datetime(3) NULL DEFAULT NULL COMMENT '生产日期',
  `expiration_date` datetime(3) NULL DEFAULT NULL COMMENT '过期时间',
  `inventory_detail_id` bigint(20) NULL DEFAULT NULL COMMENT '入库记录id',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(3) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '修改人',
  `update_time` datetime(3) NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1829407217568903172 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '出库单详情' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wms_shipment_order_detail
-- ----------------------------
INSERT INTO `wms_shipment_order_detail` VALUES (1828633402760962050, 1828633402429612034, 1828408796968030210, 1.00, NULL, 1828364459110469633, 1828364518342430721, NULL, NULL, NULL, 1828631499662630916, NULL, 'admin', '2024-08-28 11:19:12.248', 'admin', '2024-08-28 11:19:20.373');
INSERT INTO `wms_shipment_order_detail` VALUES (1828633402760962051, 1828633402429612034, 1828408796968030210, 1.00, NULL, 1828364459110469633, 1828364518342430721, NULL, NULL, NULL, 1828632673883201537, NULL, 'admin', '2024-08-28 11:19:12.249', 'admin', '2024-08-28 11:19:20.481');
INSERT INTO `wms_shipment_order_detail` VALUES (1828633402760962052, 1828633402429612034, 1828408796968030211, 1.00, NULL, 1828364459110469633, 1828364518342430721, NULL, NULL, NULL, 1828632673883201538, NULL, 'admin', '2024-08-28 11:19:12.249', 'admin', '2024-08-28 11:19:20.587');
INSERT INTO `wms_shipment_order_detail` VALUES (1829405767753199617, 1829405767363129345, 1829399118304964609, 1.00, NULL, 1828364740028174337, 1829397566185992193, NULL, NULL, NULL, 1829399580546625538, NULL, 'kucun', '2024-08-30 14:28:18.415', 'kucun', '2024-08-30 14:30:21.183');
INSERT INTO `wms_shipment_order_detail` VALUES (1829405767753199618, 1829405767363129345, 1829399118304964610, 1.00, NULL, 1828364740028174337, 1829397566185992193, NULL, NULL, NULL, 1829399580546625539, NULL, 'kucun', '2024-08-30 14:28:18.416', 'kucun', '2024-08-30 14:30:21.325');
INSERT INTO `wms_shipment_order_detail` VALUES (1829405767753199619, 1829405767363129345, 1829398492779048962, 1.00, NULL, 1828364740028174337, 1829397621378838530, NULL, NULL, NULL, 1829399580613734404, NULL, 'kucun', '2024-08-30 14:28:18.416', 'kucun', '2024-08-30 14:30:21.441');
INSERT INTO `wms_shipment_order_detail` VALUES (1829405767753199620, 1829405767363129345, 1829398492779048963, 1.00, NULL, 1828364740028174337, 1829397621378838530, NULL, NULL, NULL, 1829399580613734405, NULL, 'kucun', '2024-08-30 14:28:18.417', 'kucun', '2024-08-30 14:30:21.580');
INSERT INTO `wms_shipment_order_detail` VALUES (1829405767753199621, 1829405767363129345, 1829398702011904001, 1.00, NULL, 1828364740028174337, 1829397661719654401, NULL, NULL, NULL, 1829399580613734402, NULL, 'kucun', '2024-08-30 14:28:18.417', 'kucun', '2024-08-30 14:30:21.775');
INSERT INTO `wms_shipment_order_detail` VALUES (1829405767820308481, 1829405767363129345, 1829398702011904002, 1.00, NULL, 1828364740028174337, 1829397661719654401, NULL, NULL, NULL, 1829399580613734403, NULL, 'kucun', '2024-08-30 14:28:18.427', 'kucun', '2024-08-30 14:30:22.007');
INSERT INTO `wms_shipment_order_detail` VALUES (1829405767820308482, 1829405767363129345, 1829398333903007745, 1.00, NULL, 1828364740028174337, 1829397707726974978, NULL, NULL, NULL, 1829399580613734406, NULL, 'kucun', '2024-08-30 14:28:18.428', 'kucun', '2024-08-30 14:30:22.223');
INSERT INTO `wms_shipment_order_detail` VALUES (1829405767887417345, 1829405767363129345, 1829398333903007746, 1.00, NULL, 1828364740028174337, 1829397707726974978, NULL, NULL, NULL, 1829399580613734407, NULL, 'kucun', '2024-08-30 14:28:18.437', 'kucun', '2024-08-30 14:30:22.422');
INSERT INTO `wms_shipment_order_detail` VALUES (1829405767887417346, 1829405767363129345, 1829398193024724993, 1.00, NULL, 1828364740028174337, 1829397742493560833, NULL, NULL, NULL, 1829399580613734408, NULL, 'kucun', '2024-08-30 14:28:18.438', 'kucun', '2024-08-30 14:30:22.578');
INSERT INTO `wms_shipment_order_detail` VALUES (1829405767887417347, 1829405767363129345, 1829398193024724994, 1.00, NULL, 1828364740028174337, 1829397742493560833, NULL, NULL, NULL, 1829399580613734409, NULL, 'kucun', '2024-08-30 14:28:18.438', 'kucun', '2024-08-30 14:30:22.811');
INSERT INTO `wms_shipment_order_detail` VALUES (1829407217568903170, 1829407217174638593, 1829399118304964609, 1.00, NULL, 1828364740028174337, 1829397566185992193, NULL, NULL, NULL, 1829399580546625538, NULL, 'kucun', '2024-08-30 14:34:04.068', 'kucun', '2024-08-30 14:34:11.232');
INSERT INTO `wms_shipment_order_detail` VALUES (1829407217568903171, 1829407217174638593, 1829399118304964610, 1.00, NULL, 1828364740028174337, 1829397566185992193, NULL, NULL, NULL, 1829399580546625539, NULL, 'kucun', '2024-08-30 14:34:04.069', 'kucun', '2024-08-30 14:34:11.355');

-- ----------------------------
-- Table structure for wms_warehouse
-- ----------------------------
DROP TABLE IF EXISTS `wms_warehouse`;
CREATE TABLE `wms_warehouse`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `warehouse_code` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '编号',
  `warehouse_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '名称',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `order_num` bigint(20) NULL DEFAULT 0 COMMENT '排序',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(3) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '修改人',
  `update_time` datetime(3) NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1828364740028174338 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '仓库' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wms_warehouse
-- ----------------------------
INSERT INTO `wms_warehouse` VALUES (1828364459110469633, NULL, '吴江仓', NULL, 0, 'admin', '2024-08-27 17:30:31.084', 'admin', '2024-08-27 17:30:31.084');
INSERT INTO `wms_warehouse` VALUES (1828364609002311682, NULL, '苏州园区', NULL, 1, 'admin', '2024-08-27 17:31:06.821', 'admin', '2024-08-27 17:31:06.821');
INSERT INTO `wms_warehouse` VALUES (1828364740028174337, NULL, '常熟冷链仓', NULL, 2, 'admin', '2024-08-27 17:31:38.066', 'admin', '2024-08-30 13:55:34.766');

SET FOREIGN_KEY_CHECKS = 1;
