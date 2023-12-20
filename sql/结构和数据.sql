SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for gen_table
-- ----------------------------
DROP TABLE IF EXISTS `gen_table`;
CREATE TABLE `gen_table`  (
  `table_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
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
  `create_by` bigint(20) NULL DEFAULT NULL COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` bigint(20) NULL DEFAULT NULL COMMENT '更新者',
  `update_time` datetime(3) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`table_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 921 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '代码生成业务表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for gen_table_column
-- ----------------------------
DROP TABLE IF EXISTS `gen_table_column`;
CREATE TABLE `gen_table_column`  (
  `column_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '归属表编号',
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
  `create_by` bigint(20) NULL DEFAULT NULL COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` bigint(20) NULL DEFAULT NULL COMMENT '更新者',
  `update_time` datetime(3) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`column_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11642 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '代码生成业务表字段' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of gen_table_column
-- ----------------------------
INSERT INTO `gen_table_column` VALUES (10878, '865', 'id', 'ID', 'bigint(20)', 'Long', 'id', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, -1, '2022-10-10 21:08:56', NULL, NULL);
INSERT INTO `gen_table_column` VALUES (10879, '865', 'form_id', '操作id（出库、入库、库存移动表单id）', 'bigint(20)', 'Long', 'formId', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 2, -1, '2022-10-10 21:08:56', NULL, NULL);
INSERT INTO `gen_table_column` VALUES (10880, '865', 'form_type', '操作类型', 'int(11)', 'Integer', 'formType', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'select', '', 3, -1, '2022-10-10 21:08:56', NULL, NULL);
INSERT INTO `gen_table_column` VALUES (10881, '865', 'item_id', '物料ID', 'bigint(20)', 'Long', 'itemId', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 4, -1, '2022-10-10 21:08:56', NULL, NULL);
INSERT INTO `gen_table_column` VALUES (10882, '865', 'rack_id', '货架id', 'bigint(20)', 'Long', 'rackId', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 5, -1, '2022-10-10 21:08:56', NULL, NULL);
INSERT INTO `gen_table_column` VALUES (10883, '865', 'quantity', '库存变化', 'decimal(20,2)', 'BigDecimal', 'quantity', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 6, -1, '2022-10-10 21:08:56', NULL, NULL);
INSERT INTO `gen_table_column` VALUES (10884, '865', 'remark', '备注', 'varchar(255)', 'String', 'remark', '0', '0', NULL, '1', '1', '1', NULL, 'EQ', 'input', '', 7, -1, '2022-10-10 21:08:56', NULL, NULL);
INSERT INTO `gen_table_column` VALUES (10885, '865', 'del_flag', '删除标识', 'tinyint(4)', 'Integer', 'delFlag', '0', '0', '1', '1', NULL, NULL, NULL, 'EQ', 'input', '', 8, -1, '2022-10-10 21:08:56', NULL, NULL);
INSERT INTO `gen_table_column` VALUES (10886, '865', 'create_by', '创建人', 'bigint(20)', 'Long', 'createBy', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 9, -1, '2022-10-10 21:08:56', NULL, NULL);
INSERT INTO `gen_table_column` VALUES (10887, '865', 'create_time', '创建时间', 'datetime(3)', 'LocalDateTime', 'createTime', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 10, -1, '2022-10-10 21:08:56', NULL, NULL);
INSERT INTO `gen_table_column` VALUES (10888, '865', 'update_by', '修改人', 'bigint(20)', 'Long', 'updateBy', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'input', '', 11, -1, '2022-10-10 21:08:56', NULL, NULL);
INSERT INTO `gen_table_column` VALUES (10889, '865', 'update_time', '修改时间', 'datetime(3)', 'LocalDateTime', 'updateTime', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'datetime', '', 12, -1, '2022-10-10 21:08:56', NULL, NULL);
INSERT INTO `gen_table_column` VALUES (10890, '865', 'warehouseId', '所属仓库', 'bigint(20)', 'Long', 'warehouseid', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 13, -1, '2022-10-10 21:08:56', NULL, NULL);
INSERT INTO `gen_table_column` VALUES (10891, '865', 'areaId', '所属库区', 'bigint(20)', 'Long', 'areaid', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 14, -1, '2022-10-10 21:08:56', NULL, NULL);
INSERT INTO `gen_table_column` VALUES (10892, '866', 'id', 'ID', 'bigint(20)', 'Long', 'id', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, -1, '2022-10-10 22:30:47', NULL, NULL);
INSERT INTO `gen_table_column` VALUES (10893, '866', 'item_id', '物料ID', 'bigint(20)', 'Long', 'itemId', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 2, -1, '2022-10-10 22:30:47', NULL, NULL);
INSERT INTO `gen_table_column` VALUES (10894, '866', 'rack_id', '货架id', 'bigint(20)', 'Long', 'rackId', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 3, -1, '2022-10-10 22:30:47', NULL, NULL);
INSERT INTO `gen_table_column` VALUES (10895, '866', 'quantity', '库存', 'decimal(20,2)', 'BigDecimal', 'quantity', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 4, -1, '2022-10-10 22:30:47', NULL, NULL);
INSERT INTO `gen_table_column` VALUES (10896, '866', 'remark', '备注', 'varchar(255)', 'String', 'remark', '0', '0', NULL, '1', '1', '1', NULL, 'EQ', 'input', '', 5, -1, '2022-10-10 22:30:47', NULL, NULL);
INSERT INTO `gen_table_column` VALUES (10897, '866', 'del_flag', '删除标识', 'tinyint(4)', 'Integer', 'delFlag', '0', '0', '1', '1', NULL, NULL, NULL, 'EQ', 'input', '', 6, -1, '2022-10-10 22:30:48', NULL, NULL);
INSERT INTO `gen_table_column` VALUES (10898, '866', 'create_by', '创建人', 'bigint(20)', 'Long', 'createBy', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 7, -1, '2022-10-10 22:30:48', NULL, NULL);
INSERT INTO `gen_table_column` VALUES (10899, '866', 'create_time', '创建时间', 'datetime(3)', 'LocalDateTime', 'createTime', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 8, -1, '2022-10-10 22:30:48', NULL, NULL);
INSERT INTO `gen_table_column` VALUES (10900, '866', 'update_by', '修改人', 'bigint(20)', 'Long', 'updateBy', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'input', '', 9, -1, '2022-10-10 22:30:48', NULL, NULL);
INSERT INTO `gen_table_column` VALUES (10901, '866', 'update_time', '修改时间', 'datetime(3)', 'LocalDateTime', 'updateTime', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'datetime', '', 10, -1, '2022-10-10 22:30:48', NULL, NULL);
INSERT INTO `gen_table_column` VALUES (10902, '866', 'warehouse_id', '所属仓库', 'bigint(20)', 'Long', 'warehouseId', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 11, -1, '2022-10-10 22:30:48', NULL, NULL);
INSERT INTO `gen_table_column` VALUES (10903, '866', 'area_id', '所属库区', 'bigint(20)', 'Long', 'areaId', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 12, -1, '2022-10-10 22:30:48', NULL, NULL);
INSERT INTO `gen_table_column` VALUES (11462, '908', 'id', 'ID', 'int(11)', 'Integer', 'id', '1', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 1, '2022-12-01 11:28:35', NULL, '2022-12-01 11:29:24.000');
INSERT INTO `gen_table_column` VALUES (11463, '908', 'name', 'NAME', 'varchar(255)', 'String', 'name', '0', '0', NULL, '1', '1', '1', '1', 'LIKE', 'input', '', 2, 1, '2022-12-01 11:28:35', NULL, '2022-12-01 11:29:24.000');
INSERT INTO `gen_table_column` VALUES (11464, '908', 'remark', 'REMARK', 'varchar(255)', 'String', 'remark', '0', '0', NULL, '1', '1', '1', NULL, 'EQ', 'input', '', 3, 1, '2022-12-01 11:28:35', NULL, '2022-12-01 11:29:24.000');
INSERT INTO `gen_table_column` VALUES (11628, '920', 'id', 'ID', 'bigint(20)', 'Long', 'id', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 1, '2023-05-26 10:54:12', NULL, NULL);
INSERT INTO `gen_table_column` VALUES (11629, '920', 'inventory_movement_no', '编号', 'varchar(30)', 'String', 'inventoryMovementNo', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 2, 1, '2023-05-26 10:54:12', NULL, NULL);
INSERT INTO `gen_table_column` VALUES (11630, '920', 'source_rack_id', '原货架Id', 'bigint(20)', 'Long', 'sourceRackId', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 3, 1, '2023-05-26 10:54:12', NULL, NULL);
INSERT INTO `gen_table_column` VALUES (11631, '920', 'target_rack_id', '目标货架', 'bigint(20)', 'Long', 'targetRackId', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 4, 1, '2023-05-26 10:54:12', NULL, NULL);
INSERT INTO `gen_table_column` VALUES (11632, '920', 'status', '状态', 'tinyint(4)', 'Integer', 'status', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'radio', '', 5, 1, '2023-05-26 10:54:12', NULL, NULL);
INSERT INTO `gen_table_column` VALUES (11633, '920', 'check_status', '审核状态', 'tinyint(4)', 'Integer', 'checkStatus', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'radio', '', 6, 1, '2023-05-26 10:54:12', NULL, NULL);
INSERT INTO `gen_table_column` VALUES (11634, '920', 'check_user_id', '审核人', 'bigint(20)', 'Long', 'checkUserId', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 7, 1, '2023-05-26 10:54:12', NULL, NULL);
INSERT INTO `gen_table_column` VALUES (11635, '920', 'check_time', '审核时间', 'datetime(3)', 'LocalDateTime', 'checkTime', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'datetime', '', 8, 1, '2023-05-26 10:54:12', NULL, NULL);
INSERT INTO `gen_table_column` VALUES (11636, '920', 'remark', '备注', 'varchar(255)', 'String', 'remark', '0', '0', NULL, '1', '1', '1', NULL, 'EQ', 'input', '', 9, 1, '2023-05-26 10:54:12', NULL, NULL);
INSERT INTO `gen_table_column` VALUES (11637, '920', 'del_flag', '删除标识', 'tinyint(4)', 'Integer', 'delFlag', '0', '0', '1', '1', NULL, NULL, NULL, 'EQ', 'input', '', 10, 1, '2023-05-26 10:54:12', NULL, NULL);
INSERT INTO `gen_table_column` VALUES (11638, '920', 'create_by', '创建人', 'bigint(20)', 'Long', 'createBy', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 11, 1, '2023-05-26 10:54:12', NULL, NULL);
INSERT INTO `gen_table_column` VALUES (11639, '920', 'create_time', '创建时间', 'datetime(3)', 'LocalDateTime', 'createTime', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 12, 1, '2023-05-26 10:54:12', NULL, NULL);
INSERT INTO `gen_table_column` VALUES (11640, '920', 'update_by', '修改人', 'bigint(20)', 'Long', 'updateBy', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'input', '', 13, 1, '2023-05-26 10:54:12', NULL, NULL);
INSERT INTO `gen_table_column` VALUES (11641, '920', 'update_time', '修改时间', 'datetime(3)', 'LocalDateTime', 'updateTime', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'datetime', '', 14, 1, '2023-05-26 10:54:12', NULL, NULL);

-- ----------------------------
-- Table structure for qrtz_locks
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_locks`;
CREATE TABLE `qrtz_locks`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '调度名称',
  `lock_name` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '悲观锁名称',
  PRIMARY KEY (`sched_name`, `lock_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '存储的悲观锁信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_locks
-- ----------------------------
INSERT INTO `qrtz_locks` VALUES ('RuoyiScheduler', 'TRIGGER_ACCESS');

-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config`  (
  `config_id` int(5) NOT NULL AUTO_INCREMENT COMMENT '参数主键',
  `config_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '参数名称',
  `config_key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '参数键名',
  `config_value` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '参数键值',
  `config_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'N' COMMENT '系统内置（Y是 N否）',
  `create_by` bigint(20) NULL DEFAULT NULL COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` bigint(20) NULL DEFAULT NULL COMMENT '更新者',
  `update_time` datetime(3) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`config_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '参数配置表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_config
-- ----------------------------
INSERT INTO `sys_config` VALUES (1, '主框架页-默认皮肤样式名称', 'sys.index.skinName', 'skin-blue', 'Y', 1, '2022-06-17 17:20:29', 1, '2023-02-16 17:15:08.000', '蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow');
INSERT INTO `sys_config` VALUES (2, '用户管理-账号初始密码', 'sys.user.initPassword', '123456', 'Y', 1, '2022-06-17 17:20:29', NULL, NULL, '初始化密码 123456');
INSERT INTO `sys_config` VALUES (3, '主框架页-侧边栏主题', 'sys.index.sideTheme', 'theme-dark', 'Y', 1, '2022-06-17 17:20:29', NULL, NULL, '深色主题theme-dark，浅色主题theme-light');
INSERT INTO `sys_config` VALUES (4, '账号自助-验证码开关', 'sys.account.captchaOnOff', 'true', 'Y', 1, '2022-06-17 17:20:29', NULL, NULL, '是否开启验证码功能（true开启，false关闭）');
INSERT INTO `sys_config` VALUES (5, '账号自助-是否开启用户注册功能', 'sys.account.registerUser', 'false', 'Y', 1, '2022-06-17 17:20:29', NULL, NULL, '是否开启注册用户功能（true开启，false关闭）');

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept`  (
  `dept_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '部门id',
  `parent_id` bigint(20) NULL DEFAULT 0 COMMENT '父部门id',
  `ancestors` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '祖级列表',
  `dept_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '部门名称',
  `order_num` int(4) NULL DEFAULT 0 COMMENT '显示顺序',
  `leader` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '负责人',
  `phone` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '联系电话',
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '部门状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` bigint(20) NULL DEFAULT NULL COMMENT '创建者',
  `create_time` datetime(3) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` bigint(20) NULL DEFAULT NULL COMMENT '更新者',
  `update_time` datetime(3) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`dept_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 200 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '部门表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
INSERT INTO `sys_dept` VALUES (100, 0, '0', '若依科技', 0, '若依', '15888888888', 'ry@qq.com', '0', '0', 1, '2022-06-17 17:20:19.000', NULL, NULL);
INSERT INTO `sys_dept` VALUES (101, 100, '0,100', '深圳总公司', 1, '若依', '15888888888', 'ry@qq.com', '0', '0', 1, '2022-06-17 17:20:19.000', 1, '2022-12-09 20:38:19.000');
INSERT INTO `sys_dept` VALUES (102, 100, '0,100', '长沙分公司', 2, '若依', '15888888888', 'ry@qq.com', '0', '0', 1, '2022-06-17 17:20:19.000', NULL, NULL);
INSERT INTO `sys_dept` VALUES (103, 101, '0,100,101', '研发部门', 1, '若依', '15888888888', 'ry@qq.com', '0', '0', 1, '2022-06-17 17:20:19.000', NULL, NULL);
INSERT INTO `sys_dept` VALUES (104, 101, '0,100,101', '市场部门', 2, '若依', '15888888888', 'ry@qq.com', '0', '0', 1, '2022-06-17 17:20:19.000', NULL, NULL);
INSERT INTO `sys_dept` VALUES (105, 101, '0,100,101', '测试部门', 3, '若依', '15888888888', 'ry@qq.com', '0', '0', 1, '2022-06-17 17:20:19.000', NULL, NULL);
INSERT INTO `sys_dept` VALUES (106, 101, '0,100,101', '财务部门', 4, '若依', '15888888888', 'ry@qq.com', '0', '0', 1, '2022-06-17 17:20:19.000', NULL, NULL);
INSERT INTO `sys_dept` VALUES (107, 101, '0,100,101', '运维部门', 5, '若依', '15888888888', 'ry@qq.com', '0', '0', 1, '2022-06-17 17:20:19.000', NULL, NULL);
INSERT INTO `sys_dept` VALUES (108, 102, '0,100,102', '市场部门', 1, '若依', '15888888888', 'ry@qq.com', '0', '0', 1, '2022-06-17 17:20:19.000', NULL, NULL);
INSERT INTO `sys_dept` VALUES (109, 102, '0,100,102', '财务部门', 2, '若依', '15888888888', 'ry@qq.com', '0', '0', 1, '2022-06-17 17:20:19.000', NULL, NULL);

-- ----------------------------
-- Table structure for sys_dict_data
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_data`;
CREATE TABLE `sys_dict_data`  (
  `dict_code` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '字典编码',
  `dict_sort` int(4) NULL DEFAULT 0 COMMENT '字典排序',
  `dict_label` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '字典标签',
  `dict_value` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '字典键值',
  `dict_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '字典类型',
  `css_class` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '样式属性（其他样式扩展）',
  `list_class` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '表格回显样式',
  `is_default` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'N' COMMENT '是否默认（Y是 N否）',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` bigint(20) NULL DEFAULT NULL COMMENT '创建者',
  `create_time` datetime(3) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` bigint(20) NULL DEFAULT NULL COMMENT '更新者',
  `update_time` datetime(3) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_code`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 250 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '字典数据表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dict_data
-- ----------------------------
INSERT INTO `sys_dict_data` VALUES (1, 1, '男', '0', 'sys_user_sex', '', '', 'Y', '0', 1, '2022-06-17 17:20:28.000', NULL, NULL, '性别男');
INSERT INTO `sys_dict_data` VALUES (2, 2, '女', '1', 'sys_user_sex', '', '', 'N', '0', 1, '2022-06-17 17:20:28.000', NULL, NULL, '性别女');
INSERT INTO `sys_dict_data` VALUES (3, 3, '未知', '2', 'sys_user_sex', '', '', 'N', '0', 1, '2022-06-17 17:20:28.000', NULL, NULL, '性别未知');
INSERT INTO `sys_dict_data` VALUES (4, 1, '显示', '0', 'sys_show_hide', '', 'primary', 'Y', '0', 1, '2022-06-17 17:20:28.000', NULL, NULL, '显示菜单');
INSERT INTO `sys_dict_data` VALUES (5, 2, '隐藏', '1', 'sys_show_hide', '', 'danger', 'N', '0', 1, '2022-06-17 17:20:28.000', NULL, NULL, '隐藏菜单');
INSERT INTO `sys_dict_data` VALUES (6, 1, '正常', '0', 'sys_normal_disable', '', 'primary', 'Y', '0', 1, '2022-06-17 17:20:28.000', NULL, NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (7, 2, '停用', '1', 'sys_normal_disable', '', 'danger', 'N', '0', 1, '2022-06-17 17:20:28.000', NULL, NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (8, 1, '正常', '0', 'sys_job_status', '', 'primary', 'Y', '0', 1, '2022-06-17 17:20:28.000', NULL, NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (9, 2, '暂停', '1', 'sys_job_status', '', 'danger', 'N', '0', 1, '2022-06-17 17:20:28.000', NULL, NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (10, 1, '默认', 'DEFAULT', 'sys_job_group', '', '', 'Y', '0', 1, '2022-06-17 17:20:28.000', NULL, NULL, '默认分组');
INSERT INTO `sys_dict_data` VALUES (11, 2, '系统', 'SYSTEM', 'sys_job_group', '', '', 'N', '0', 1, '2022-06-17 17:20:28.000', NULL, NULL, '系统分组');
INSERT INTO `sys_dict_data` VALUES (12, 1, '是', 'Y', 'sys_yes_no', '', 'primary', 'Y', '0', 1, '2022-06-17 17:20:28.000', NULL, NULL, '系统默认是');
INSERT INTO `sys_dict_data` VALUES (13, 2, '否', 'N', 'sys_yes_no', '', 'danger', 'N', '0', 1, '2022-06-17 17:20:28.000', NULL, NULL, '系统默认否');
INSERT INTO `sys_dict_data` VALUES (14, 1, '通知', '1', 'sys_notice_type', '', 'warning', 'Y', '0', 1, '2022-06-17 17:20:28.000', NULL, NULL, '通知');
INSERT INTO `sys_dict_data` VALUES (15, 2, '公告', '2', 'sys_notice_type', '', 'success', 'N', '0', 1, '2022-06-17 17:20:28.000', NULL, NULL, '公告');
INSERT INTO `sys_dict_data` VALUES (16, 1, '正常', '0', 'sys_notice_status', '', 'primary', 'Y', '0', 1, '2022-06-17 17:20:29.000', NULL, NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (17, 2, '关闭', '1', 'sys_notice_status', '', 'danger', 'N', '0', 1, '2022-06-17 17:20:29.000', NULL, NULL, '关闭状态');
INSERT INTO `sys_dict_data` VALUES (18, 1, '新增', '1', 'sys_oper_type', '', 'info', 'N', '0', 1, '2022-06-17 17:20:29.000', NULL, NULL, '新增操作');
INSERT INTO `sys_dict_data` VALUES (19, 2, '修改', '2', 'sys_oper_type', '', 'info', 'N', '0', 1, '2022-06-17 17:20:29.000', NULL, NULL, '修改操作');
INSERT INTO `sys_dict_data` VALUES (20, 3, '删除', '3', 'sys_oper_type', '', 'danger', 'N', '0', 1, '2022-06-17 17:20:29.000', NULL, NULL, '删除操作');
INSERT INTO `sys_dict_data` VALUES (21, 4, '授权', '4', 'sys_oper_type', '', 'primary', 'N', '0', 1, '2022-06-17 17:20:29.000', NULL, NULL, '授权操作');
INSERT INTO `sys_dict_data` VALUES (22, 5, '导出', '5', 'sys_oper_type', '', 'warning', 'N', '0', 1, '2022-06-17 17:20:29.000', NULL, NULL, '导出操作');
INSERT INTO `sys_dict_data` VALUES (23, 6, '导入', '6', 'sys_oper_type', '', 'warning', 'N', '0', 1, '2022-06-17 17:20:29.000', NULL, NULL, '导入操作');
INSERT INTO `sys_dict_data` VALUES (24, 7, '强退', '7', 'sys_oper_type', '', 'danger', 'N', '0', 1, '2022-06-17 17:20:29.000', NULL, NULL, '强退操作');
INSERT INTO `sys_dict_data` VALUES (25, 8, '生成代码', '8', 'sys_oper_type', '', 'warning', 'N', '0', 1, '2022-06-17 17:20:29.000', NULL, NULL, '生成操作');
INSERT INTO `sys_dict_data` VALUES (26, 9, '清空数据', '9', 'sys_oper_type', '', 'danger', 'N', '0', 1, '2022-06-17 17:20:29.000', NULL, NULL, '清空操作');
INSERT INTO `sys_dict_data` VALUES (27, 1, '成功', '0', 'sys_common_status', '', 'primary', 'N', '0', 1, '2022-06-17 17:20:29.000', NULL, NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (28, 2, '失败', '1', 'sys_common_status', '', 'danger', 'N', '0', 1, '2022-06-17 17:20:29.000', NULL, NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (100, 0, '原物料', '原物料', 'wms_item_type', NULL, 'default', 'N', '0', 1, '2022-08-18 15:49:33.000', NULL, NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (101, 1, '半成品', '半成品', 'wms_item_type', NULL, 'default', 'N', '0', 1, '2022-08-18 15:49:58.000', NULL, NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (102, 2, '产成品', '产成品', 'wms_item_type', NULL, 'default', 'N', '0', 1, '2022-08-18 15:50:15.000', NULL, NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (103, 3, '原辅料', '原辅料', 'wms_item_type', NULL, 'default', 'N', '0', 1, '2022-08-18 15:50:35.000', NULL, NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (104, 0, '第一级', '第一级', 'wms_carrier_level', NULL, 'default', 'N', '0', 1, '2022-08-18 17:51:14.000', NULL, NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (105, 1, '第二级', '第二级', 'wms_carrier_level', NULL, 'default', 'N', '0', 1, '2022-08-18 17:51:27.000', NULL, NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (106, 0, '第一级', '第一级', 'wms_supplier_level', NULL, 'default', 'N', '0', 1, '2022-08-18 18:05:23.000', NULL, NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (107, 1, '第二级', '第二级', 'wms_supplier_level', NULL, 'default', 'N', '0', 1, '2022-08-18 18:05:35.000', NULL, NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (108, 2, '第三级', '第三级', 'wms_supplier_level', NULL, 'default', 'N', '0', 1, '2022-08-18 18:05:48.000', NULL, NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (109, 0, '采购入库', '1', 'wms_receipt_type', NULL, 'default', 'N', '0', 1, '2022-08-21 15:04:34.000', 1, '2022-08-23 17:37:07.000', NULL);
INSERT INTO `sys_dict_data` VALUES (110, 1, '外协入库', '2', 'wms_receipt_type', NULL, 'default', 'N', '0', 1, '2022-08-21 15:05:39.000', 1, '2022-08-23 17:37:16.000', NULL);
INSERT INTO `sys_dict_data` VALUES (112, 2, '退货入库', '3', 'wms_receipt_type', NULL, 'default', 'N', '0', 1, '2022-08-23 17:31:45.000', 1, '2022-08-23 17:37:21.000', NULL);
INSERT INTO `sys_dict_data` VALUES (113, 0, '未发货', '0', 'wms_receipt_status', NULL, 'default', 'N', '0', 1, '2022-08-29 17:19:12.000', NULL, NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (114, 1, '在途（已发货未入库）', '1', 'wms_receipt_status', NULL, 'default', 'N', '0', 1, '2022-08-29 17:19:24.000', 1, '2022-08-29 17:53:52.000', NULL);
INSERT INTO `sys_dict_data` VALUES (115, 2, '部分入库', '2', 'wms_receipt_status', NULL, 'default', 'N', '0', 1, '2022-08-29 17:19:35.000', 1, '2022-08-29 17:19:47.000', NULL);
INSERT INTO `sys_dict_data` VALUES (116, 4, '入库完成', '3', 'wms_receipt_status', NULL, 'default', 'N', '0', 1, '2022-08-29 17:20:35.000', 1, '2022-09-21 11:59:33.000', NULL);
INSERT INTO `sys_dict_data` VALUES (117, 3, '作废', '4', 'wms_receipt_status', NULL, 'default', 'N', '0', 1, '2022-09-21 11:59:23.000', NULL, NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (118, 0, '销售出库', '11', 'wms_shipment_type', NULL, 'default', 'N', '0', 1, '2022-10-20 13:34:06.000', NULL, NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (119, 1, '外协出库', '12', 'wms_shipment_type', NULL, 'default', 'N', '0', 1, '2022-10-20 13:34:26.000', NULL, NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (121, 0, '未发货', '11', 'wms_shipment_status', NULL, 'default', 'N', '0', 1, '2022-10-20 13:40:02.000', NULL, NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (122, 1, '部分发货', '12', 'wms_shipment_status', NULL, 'default', 'N', '0', 1, '2022-10-20 13:40:26.000', NULL, NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (123, 2, '已发货', '13', 'wms_shipment_status', NULL, 'default', 'N', '0', 1, '2022-10-20 13:40:44.000', NULL, NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (124, 3, '作废', '14', 'wms_shipment_status', NULL, 'default', 'N', '0', 1, '2022-10-20 13:41:05.000', NULL, NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (125, 0, '调拨出库', '21', 'wms_movement_type', NULL, 'default', 'N', '0', 1, '2022-10-20 14:23:13.000', 1, '2022-11-02 16:00:25.000', NULL);
INSERT INTO `sys_dict_data` VALUES (126, 0, '调拨入库', '22', 'wms_movement_type', NULL, 'default', 'N', '0', 1, '2022-10-20 14:23:24.000', 1, '2022-11-02 16:00:32.000', NULL);
INSERT INTO `sys_dict_data` VALUES (127, 0, '未操作', '21', 'wms_movement_status', NULL, 'default', 'N', '0', 1, '2022-10-20 14:25:46.000', 1, '2022-10-20 14:26:08.000', NULL);
INSERT INTO `sys_dict_data` VALUES (128, 1, '部分移动', '22', 'wms_movement_status', NULL, 'default', 'N', '0', 1, '2022-10-20 14:26:20.000', NULL, NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (129, 2, '操作完毕', '23', 'wms_movement_status', NULL, 'default', 'N', '0', 1, '2022-10-20 14:26:35.000', 1, '2022-10-20 14:26:44.000', NULL);
INSERT INTO `sys_dict_data` VALUES (130, 3, '已作废', '24', 'wms_movement_status', NULL, 'default', 'N', '0', 1, '2022-10-20 14:27:03.000', NULL, NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (131, 0, '盘库中', '11', 'wms_check_status', NULL, 'default', 'N', '0', 1, '2023-04-26 11:19:35.000', NULL, NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (132, 0, '已完成', '22', 'wms_check_status', NULL, 'default', 'N', '0', 1, '2023-04-26 11:19:43.000', NULL, NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (133, 0, '结款', '11', 'wms_supplier_transaction_type', NULL, 'default', 'N', '0', 1, '2023-05-04 12:53:39.000', NULL, NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (134, 0, '应付', '22', 'wms_supplier_transaction_type', NULL, 'default', 'N', '0', 1, '2023-05-04 12:53:48.000', NULL, NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (135, 0, '采购入库', '33', 'wms_supplier_transaction_type', NULL, 'default', 'N', '0', 1, '2023-05-04 12:54:02.000', 1, '2023-05-04 17:40:16.000', NULL);
INSERT INTO `sys_dict_data` VALUES (136, 0, '结款', '11', 'wms_customer_transaction_type', NULL, 'default', 'N', '0', 1, '2023-05-04 16:59:16.000', NULL, NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (137, 0, '应收', '22', 'wms_customer_transaction_type', NULL, 'default', 'N', '0', 1, '2023-05-04 16:59:28.000', 1, '2023-05-04 17:49:51.000', NULL);
INSERT INTO `sys_dict_data` VALUES (138, 0, '销售出库', '33', 'wms_customer_transaction_type', NULL, 'default', 'N', '0', 1, '2023-05-04 17:00:43.000', 1, '2023-05-04 17:40:09.000', NULL);
INSERT INTO `sys_dict_data` VALUES (139, 0, '采购入库', '1', 'wms_inventory_oper_type', NULL, 'default', 'N', '0', 1, '2023-05-05 10:24:01.000', NULL, NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (140, 1, '外协入库', '2', 'wms_inventory_oper_type', NULL, 'default', 'N', '0', 1, '2023-05-05 10:24:12.000', NULL, NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (141, 2, '退货入库', '3', 'wms_inventory_oper_type', NULL, 'default', 'N', '0', 1, '2023-05-05 10:24:28.000', NULL, NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (142, 3, '销售出库', '11', 'wms_inventory_oper_type', NULL, 'default', 'N', '0', 1, '2023-05-05 10:24:50.000', NULL, NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (143, 4, '外协出库', '12', 'wms_inventory_oper_type', NULL, 'default', 'N', '0', 1, '2023-05-05 10:25:02.000', NULL, NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (144, 5, '调拨出库', '13', 'wms_inventory_oper_type', NULL, 'default', 'N', '0', 1, '2023-05-05 10:25:19.000', NULL, NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (145, 6, '调拨出库', '21', 'wms_inventory_oper_type', NULL, 'default', 'N', '0', 1, '2023-05-05 10:25:37.000', NULL, NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (146, 7, '调拨入库', '22', 'wms_inventory_oper_type', NULL, 'default', 'N', '0', 1, '2023-05-05 10:25:48.000', NULL, NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (147, 1, '盘盈入库', '32', 'wms_check_type', NULL, 'default', 'N', '0', 1, '2023-07-25 05:30:29.000', NULL, NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (148, 0, '盘亏出库', '31', 'wms_check_type', NULL, 'default', 'N', '0', 1, '2023-07-25 05:30:52.000', NULL, NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (149, 0, '仓库', '5', 'wms_inventory_panel_type', NULL, 'default', 'N', '0', 1, '2023-07-28 07:15:00.000', NULL, NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (150, 1, '库区', '10', 'wms_inventory_panel_type', NULL, 'default', 'N', '0', 1, '2023-07-28 07:15:10.000', NULL, NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (152, 3, '物料', '20', 'wms_inventory_panel_type', NULL, 'default', 'N', '0', 1, '2023-07-28 07:18:05.000', NULL, NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (245, 0, '结算中', '11', 'wms_settlement_status', NULL, 'default', 'N', '0', 1, '2023-08-02 13:34:40.000', NULL, NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (246, 0, '已结算', '22', 'wms_settlement_status', NULL, 'default', 'N', '0', 1, '2023-08-02 13:34:48.000', NULL, NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (247, 0, '未开始', '1', 'wms_wave_status', NULL, 'info', 'N', '0', 1, '2023-08-28 15:00:16.000', 1, '2023-08-28 15:00:58.000', NULL);
INSERT INTO `sys_dict_data` VALUES (248, 2, '进行中', '2', 'wms_wave_status', NULL, 'primary', 'N', '0', 1, '2023-08-28 15:00:37.000', 1, '2023-08-28 15:01:08.000', NULL);
INSERT INTO `sys_dict_data` VALUES (249, 3, '已完成', '3', 'wms_wave_status', NULL, 'success', 'N', '0', 1, '2023-08-28 15:00:50.000', NULL, NULL, NULL);

-- ----------------------------
-- Table structure for sys_dict_type
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_type`;
CREATE TABLE `sys_dict_type`  (
  `dict_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '字典主键',
  `dict_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '字典名称',
  `dict_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '字典类型',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` bigint(20) NULL DEFAULT NULL COMMENT '创建者',
  `create_time` datetime(3) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` bigint(20) NULL DEFAULT NULL COMMENT '更新者',
  `update_time` datetime(3) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_id`) USING BTREE,
  UNIQUE INDEX `dict_type`(`dict_type`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 117 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '字典类型表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dict_type
-- ----------------------------
INSERT INTO `sys_dict_type` VALUES (1, '用户性别', 'sys_user_sex', '0', 1, '2022-06-17 17:20:27.000', NULL, NULL, '用户性别列表');
INSERT INTO `sys_dict_type` VALUES (2, '菜单状态', 'sys_show_hide', '0', 1, '2022-06-17 17:20:27.000', NULL, NULL, '菜单状态列表');
INSERT INTO `sys_dict_type` VALUES (3, '系统开关', 'sys_normal_disable', '0', 1, '2022-06-17 17:20:27.000', NULL, NULL, '系统开关列表');
INSERT INTO `sys_dict_type` VALUES (4, '任务状态', 'sys_job_status', '0', 1, '2022-06-17 17:20:28.000', NULL, NULL, '任务状态列表');
INSERT INTO `sys_dict_type` VALUES (5, '任务分组', 'sys_job_group', '0', 1, '2022-06-17 17:20:28.000', NULL, NULL, '任务分组列表');
INSERT INTO `sys_dict_type` VALUES (6, '系统是否', 'sys_yes_no', '0', 1, '2022-06-17 17:20:28.000', NULL, NULL, '系统是否列表');
INSERT INTO `sys_dict_type` VALUES (7, '通知类型', 'sys_notice_type', '0', 1, '2022-06-17 17:20:28.000', NULL, NULL, '通知类型列表');
INSERT INTO `sys_dict_type` VALUES (8, '通知状态', 'sys_notice_status', '0', 1, '2022-06-17 17:20:28.000', NULL, NULL, '通知状态列表');
INSERT INTO `sys_dict_type` VALUES (9, '操作类型', 'sys_oper_type', '0', 1, '2022-06-17 17:20:28.000', NULL, NULL, '操作类型列表');
INSERT INTO `sys_dict_type` VALUES (10, '系统状态', 'sys_common_status', '0', 1, '2022-06-17 17:20:28.000', NULL, NULL, '登录状态列表');
INSERT INTO `sys_dict_type` VALUES (100, '物料分类', 'wms_item_type', '0', 1, '2022-08-18 15:47:49.000', NULL, NULL, NULL);
INSERT INTO `sys_dict_type` VALUES (101, '承运商级别', 'wms_carrier_level', '0', 1, '2022-08-18 17:50:40.000', NULL, NULL, NULL);
INSERT INTO `sys_dict_type` VALUES (102, '供应商级别', 'wms_supplier_level', '0', 1, '2022-08-18 18:05:02.000', NULL, NULL, NULL);
INSERT INTO `sys_dict_type` VALUES (103, '入库类型', 'wms_receipt_type', '0', 1, '2022-08-21 15:03:58.000', NULL, NULL, NULL);
INSERT INTO `sys_dict_type` VALUES (104, '入库状态', 'wms_receipt_status', '0', 1, '2022-08-29 17:18:35.000', NULL, NULL, NULL);
INSERT INTO `sys_dict_type` VALUES (105, '出库类型', 'wms_shipment_type', '0', 1, '2022-10-20 13:33:29.000', NULL, NULL, NULL);
INSERT INTO `sys_dict_type` VALUES (106, '出库状态', 'wms_shipment_status', '0', 1, '2022-10-20 13:39:41.000', NULL, NULL, NULL);
INSERT INTO `sys_dict_type` VALUES (107, '移库类型', 'wms_movement_type', '0', 1, '2022-10-20 14:22:52.000', NULL, NULL, NULL);
INSERT INTO `sys_dict_type` VALUES (108, '移库状态', 'wms_movement_status', '0', 1, '2022-10-20 14:24:43.000', 1, '2022-10-20 14:24:55.000', NULL);
INSERT INTO `sys_dict_type` VALUES (109, '盘点单据状态', 'wms_check_status', '0', 1, '2023-04-26 11:17:35.000', NULL, NULL, NULL);
INSERT INTO `sys_dict_type` VALUES (110, '供应商账号交易类型', 'wms_supplier_transaction_type', '0', 1, '2023-05-04 12:52:59.000', NULL, NULL, '1:结款；2:应付；3:入库单');
INSERT INTO `sys_dict_type` VALUES (111, '客户账户交易类型', 'wms_customer_transaction_type', '0', 1, '2023-05-04 16:58:45.000', NULL, NULL, '1:结款；2:应付；3:出库单');
INSERT INTO `sys_dict_type` VALUES (112, '库存操作类型', 'wms_inventory_oper_type', '0', 1, '2023-05-05 10:23:28.000', NULL, NULL, NULL);
INSERT INTO `sys_dict_type` VALUES (113, '盘点类型', 'wms_check_type', '0', 1, '2023-07-25 05:29:44.000', NULL, NULL, NULL);
INSERT INTO `sys_dict_type` VALUES (114, '库存看板类型', 'wms_inventory_panel_type', '0', 1, '2023-07-28 07:12:50.000', NULL, NULL, NULL);
INSERT INTO `sys_dict_type` VALUES (115, '库存结算状态', 'wms_settlement_status', '0', 1, '2023-08-02 13:34:27.000', NULL, NULL, NULL);
INSERT INTO `sys_dict_type` VALUES (116, '波次作业状态', 'wms_wave_status', '0', 1, '2023-08-28 14:59:32.000', NULL, NULL, NULL);

-- ----------------------------
-- Table structure for sys_job
-- ----------------------------
DROP TABLE IF EXISTS `sys_job`;
CREATE TABLE `sys_job`  (
  `job_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务ID',
  `job_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '任务名称',
  `job_group` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'DEFAULT' COMMENT '任务组名',
  `invoke_target` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '调用目标字符串',
  `cron_expression` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT 'cron执行表达式',
  `misfire_policy` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '3' COMMENT '计划执行错误策略（1立即执行 2执行一次 3放弃执行）',
  `concurrent` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '1' COMMENT '是否并发执行（0允许 1禁止）',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '状态（0正常 1暂停）',
  `create_by` bigint(20) NULL DEFAULT NULL COMMENT '创建者',
  `create_time` datetime(3) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` bigint(20) NULL DEFAULT NULL COMMENT '更新者',
  `update_time` datetime(3) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '备注信息',
  PRIMARY KEY (`job_id`, `job_name`, `job_group`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '定时任务调度表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_job
-- ----------------------------
INSERT INTO `sys_job` VALUES (1, '系统默认（无参）', 'DEFAULT', 'ryTask.ryNoParams', '0/10 * * * * ?', '3', '1', '1', 1, '2022-06-17 17:20:29.000', NULL, NULL, '');
INSERT INTO `sys_job` VALUES (2, '系统默认（有参）', 'DEFAULT', 'ryTask.ryParams(\'ry\')', '0/15 * * * * ?', '3', '1', '1', 1, '2022-06-17 17:20:29.000', NULL, NULL, '');
INSERT INTO `sys_job` VALUES (3, '系统默认（多参）', 'DEFAULT', 'ryTask.ryMultipleParams(\'ry\', true, 2000L, 316.50D, 100)', '0/20 * * * * ?', '3', '1', '1', 1, '2022-06-17 17:20:29.000', NULL, NULL, '');

-- ----------------------------
-- Table structure for sys_job_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_job_log`;
CREATE TABLE `sys_job_log`  (
  `job_log_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务日志ID',
  `job_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '任务名称',
  `job_group` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '任务组名',
  `invoke_target` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '调用目标字符串',
  `job_message` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '日志信息',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '执行状态（0正常 1失败）',
  `exception_info` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '异常信息',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`job_log_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '定时任务调度日志表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sys_logininfor
-- ----------------------------
DROP TABLE IF EXISTS `sys_logininfor`;
CREATE TABLE `sys_logininfor`  (
  `info_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '访问ID',
  `user_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '用户账号',
  `ipaddr` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '登录IP地址',
  `login_location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '登录地点',
  `browser` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '浏览器类型',
  `os` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '操作系统',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '登录状态（0成功 1失败）',
  `msg` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '提示消息',
  `login_time` datetime(0) NULL DEFAULT NULL COMMENT '访问时间',
  PRIMARY KEY (`info_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 43749 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '系统访问记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu`  (
  `menu_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `menu_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '菜单名称',
  `parent_id` bigint(20) NULL DEFAULT 0 COMMENT '父菜单ID',
  `order_num` int(4) NULL DEFAULT 0 COMMENT '显示顺序',
  `path` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '路由地址',
  `component` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '组件路径',
  `query` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '路由参数',
  `is_frame` int(1) NULL DEFAULT 1 COMMENT '是否为外链（0是 1否）',
  `is_cache` int(1) NULL DEFAULT 0 COMMENT '是否缓存（0缓存 1不缓存）',
  `menu_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '菜单类型（M目录 C菜单 F按钮）',
  `visible` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '菜单状态（0显示 1隐藏）',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '菜单状态（0正常 1停用）',
  `perms` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '权限标识',
  `icon` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '#' COMMENT '菜单图标',
  `create_by` bigint(20) NULL DEFAULT NULL COMMENT '创建者',
  `create_time` datetime(3) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` bigint(20) NULL DEFAULT NULL COMMENT '更新者',
  `update_time` datetime(3) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`menu_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2252 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '菜单权限表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES (1, '系统管理', 0, 300, 'system', NULL, '', 1, 0, 'M', '0', '0', '', 'system', 1, '2022-06-17 17:20:20.000', 1, '2022-10-31 09:09:13.000', '系统管理目录');
INSERT INTO `sys_menu` VALUES (2, '系统监控', 0, 200, 'monitor', NULL, '', 1, 0, 'M', '0', '0', '', 'monitor', 1, '2022-06-17 17:20:20.000', 1, '2022-10-31 09:09:02.000', '系统监控目录');
INSERT INTO `sys_menu` VALUES (3, '系统工具', 0, 100, 'tool', NULL, '', 1, 0, 'M', '0', '0', '', 'tool', 1, '2022-06-17 17:20:20.000', 1, '2022-10-31 09:08:48.000', '系统工具目录');
INSERT INTO `sys_menu` VALUES (100, '用户管理', 1, 1, 'user', 'system/user/index', '', 1, 0, 'C', '0', '0', 'system:user:list', 'user', 1, '2022-06-17 17:20:20.000', NULL, NULL, '用户管理菜单');
INSERT INTO `sys_menu` VALUES (101, '角色管理', 1, 2, 'role', 'system/role/index', '', 1, 0, 'C', '0', '0', 'system:role:list', 'peoples', 1, '2022-06-17 17:20:20.000', NULL, NULL, '角色管理菜单');
INSERT INTO `sys_menu` VALUES (102, '菜单管理', 1, 3, 'menu', 'system/menu/index', '', 1, 0, 'C', '0', '0', 'system:menu:list', 'tree-table', 1, '2022-06-17 17:20:20.000', NULL, NULL, '菜单管理菜单');
INSERT INTO `sys_menu` VALUES (103, '部门管理', 1, 4, 'dept', 'system/dept/index', '', 1, 0, 'C', '0', '0', 'system:dept:list', 'tree', 1, '2022-06-17 17:20:20.000', NULL, NULL, '部门管理菜单');
INSERT INTO `sys_menu` VALUES (104, '岗位管理', 1, 5, 'post', 'system/post/index', '', 1, 0, 'C', '0', '0', 'system:post:list', 'post', 1, '2022-06-17 17:20:20.000', NULL, NULL, '岗位管理菜单');
INSERT INTO `sys_menu` VALUES (105, '字典管理', 1, 6, 'dict', 'system/dict/index', '', 1, 0, 'C', '0', '0', 'system:dict:list', 'dict', 1, '2022-06-17 17:20:20.000', NULL, NULL, '字典管理菜单');
INSERT INTO `sys_menu` VALUES (106, '参数设置', 1, 7, 'config', 'system/config/index', '', 1, 0, 'C', '0', '0', 'system:config:list', 'edit', 1, '2022-06-17 17:20:20.000', NULL, NULL, '参数设置菜单');
INSERT INTO `sys_menu` VALUES (107, '通知公告', 1, 8, 'notice', 'system/notice/index', '', 1, 0, 'C', '0', '0', 'system:notice:list', 'message', 1, '2022-06-17 17:20:20.000', NULL, NULL, '通知公告菜单');
INSERT INTO `sys_menu` VALUES (108, '日志管理', 1, 9, 'log', '', '', 1, 0, 'M', '0', '0', '', 'log', 1, '2022-06-17 17:20:20.000', NULL, NULL, '日志管理菜单');
INSERT INTO `sys_menu` VALUES (109, '在线用户', 2, 1, 'online', 'monitor/online/index', '', 1, 0, 'C', '0', '0', 'monitor:online:list', 'online', 1, '2022-06-17 17:20:20.000', NULL, NULL, '在线用户菜单');
INSERT INTO `sys_menu` VALUES (110, '定时任务', 2, 2, 'job', 'monitor/job/index', '', 1, 0, 'C', '0', '0', 'monitor:job:list', 'job', 1, '2022-06-17 17:20:20.000', NULL, NULL, '定时任务菜单');
INSERT INTO `sys_menu` VALUES (111, '数据监控', 2, 3, 'druid', 'monitor/druid/index', '', 1, 0, 'C', '0', '0', 'monitor:druid:list', 'druid', 1, '2022-06-17 17:20:20.000', NULL, NULL, '数据监控菜单');
INSERT INTO `sys_menu` VALUES (112, '服务监控', 2, 4, 'server', 'monitor/server/index', '', 1, 0, 'C', '0', '0', 'monitor:server:list', 'server', 1, '2022-06-17 17:20:20.000', NULL, NULL, '服务监控菜单');
INSERT INTO `sys_menu` VALUES (113, '缓存监控', 2, 5, 'cache', 'monitor/cache/index', '', 1, 0, 'C', '0', '0', 'monitor:cache:list', 'redis', 1, '2022-06-17 17:20:20.000', NULL, NULL, '缓存监控菜单');
INSERT INTO `sys_menu` VALUES (114, '表单构建', 3, 1, 'build', 'tool/build/index', '', 1, 0, 'C', '0', '0', 'tool:build:list', 'build', 1, '2022-06-17 17:20:21.000', NULL, NULL, '表单构建菜单');
INSERT INTO `sys_menu` VALUES (115, '代码生成', 3, 2, 'gen', 'tool/gen/index', '', 1, 0, 'C', '0', '0', 'tool:gen:list', 'code', 1, '2022-06-17 17:20:21.000', NULL, NULL, '代码生成菜单');
INSERT INTO `sys_menu` VALUES (116, '系统接口', 3, 3, 'swagger', 'tool/swagger/index', '', 1, 0, 'C', '0', '0', 'tool:swagger:list', 'swagger', 1, '2022-06-17 17:20:21.000', NULL, NULL, '系统接口菜单');
INSERT INTO `sys_menu` VALUES (500, '操作日志', 108, 1, 'operlog', 'monitor/operlog/index', '', 1, 0, 'C', '0', '0', 'monitor:operlog:list', 'form', 1, '2022-06-17 17:20:21.000', NULL, NULL, '操作日志菜单');
INSERT INTO `sys_menu` VALUES (501, '登录日志', 0, 11, 'logininfor', 'monitor/logininfor/index', '', 1, 0, 'C', '0', '0', 'monitor:logininfor:list', 'logininfor', 1, '2022-06-17 17:20:21.000', 1, '2023-07-27 11:28:17.000', '登录日志菜单');
INSERT INTO `sys_menu` VALUES (1001, '用户查询', 100, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:user:query', '#', 1, '2022-06-17 17:20:21.000', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (1002, '用户新增', 100, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:user:add', '#', 1, '2022-06-17 17:20:21.000', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (1003, '用户修改', 100, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:user:edit', '#', 1, '2022-06-17 17:20:21.000', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (1004, '用户删除', 100, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:user:remove', '#', 1, '2022-06-17 17:20:21.000', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (1005, '用户导出', 100, 5, '', '', '', 1, 0, 'F', '0', '0', 'system:user:export', '#', 1, '2022-06-17 17:20:21.000', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (1006, '用户导入', 100, 6, '', '', '', 1, 0, 'F', '0', '0', 'system:user:import', '#', 1, '2022-06-17 17:20:21.000', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (1007, '重置密码', 100, 7, '', '', '', 1, 0, 'F', '0', '0', 'system:user:resetPwd', '#', 1, '2022-06-17 17:20:21.000', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (1008, '角色查询', 101, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:role:query', '#', 1, '2022-06-17 17:20:21.000', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (1009, '角色新增', 101, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:role:add', '#', 1, '2022-06-17 17:20:21.000', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (1010, '角色修改', 101, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:role:edit', '#', 1, '2022-06-17 17:20:21.000', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (1011, '角色删除', 101, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:role:remove', '#', 1, '2022-06-17 17:20:21.000', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (1012, '角色导出', 101, 5, '', '', '', 1, 0, 'F', '0', '0', 'system:role:export', '#', 1, '2022-06-17 17:20:21.000', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (1013, '菜单查询', 102, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:query', '#', 1, '2022-06-17 17:20:21.000', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (1014, '菜单新增', 102, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:add', '#', 1, '2022-06-17 17:20:21.000', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (1015, '菜单修改', 102, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:edit', '#', 1, '2022-06-17 17:20:21.000', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (1016, '菜单删除', 102, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:remove', '#', 1, '2022-06-17 17:20:21.000', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (1017, '部门查询', 103, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:query', '#', 1, '2022-06-17 17:20:21.000', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (1018, '部门新增', 103, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:add', '#', 1, '2022-06-17 17:20:22.000', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (1019, '部门修改', 103, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:edit', '#', 1, '2022-06-17 17:20:22.000', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (1020, '部门删除', 103, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:remove', '#', 1, '2022-06-17 17:20:22.000', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (1021, '岗位查询', 104, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:post:query', '#', 1, '2022-06-17 17:20:22.000', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (1022, '岗位新增', 104, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:post:add', '#', 1, '2022-06-17 17:20:22.000', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (1023, '岗位修改', 104, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:post:edit', '#', 1, '2022-06-17 17:20:22.000', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (1024, '岗位删除', 104, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:post:remove', '#', 1, '2022-06-17 17:20:22.000', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (1025, '岗位导出', 104, 5, '', '', '', 1, 0, 'F', '0', '0', 'system:post:export', '#', 1, '2022-06-17 17:20:22.000', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (1026, '字典查询', 105, 1, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:query', '#', 1, '2022-06-17 17:20:22.000', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (1027, '字典新增', 105, 2, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:add', '#', 1, '2022-06-17 17:20:22.000', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (1028, '字典修改', 105, 3, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:edit', '#', 1, '2022-06-17 17:20:22.000', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (1029, '字典删除', 105, 4, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:remove', '#', 1, '2022-06-17 17:20:22.000', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (1030, '字典导出', 105, 5, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:export', '#', 1, '2022-06-17 17:20:22.000', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (1031, '参数查询', 106, 1, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:query', '#', 1, '2022-06-17 17:20:22.000', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (1032, '参数新增', 106, 2, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:add', '#', 1, '2022-06-17 17:20:22.000', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (1033, '参数修改', 106, 3, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:edit', '#', 1, '2022-06-17 17:20:22.000', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (1034, '参数删除', 106, 4, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:remove', '#', 1, '2022-06-17 17:20:22.000', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (1035, '参数导出', 106, 5, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:export', '#', 1, '2022-06-17 17:20:22.000', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (1036, '公告查询', 107, 1, '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:query', '#', 1, '2022-06-17 17:20:22.000', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (1037, '公告新增', 107, 2, '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:add', '#', 1, '2022-06-17 17:20:22.000', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (1038, '公告修改', 107, 3, '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:edit', '#', 1, '2022-06-17 17:20:22.000', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (1039, '公告删除', 107, 4, '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:remove', '#', 1, '2022-06-17 17:20:22.000', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (1040, '操作查询', 500, 1, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:operlog:query', '#', 1, '2022-06-17 17:20:22.000', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (1041, '操作删除', 500, 2, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:operlog:remove', '#', 1, '2022-06-17 17:20:23.000', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (1042, '日志导出', 500, 4, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:operlog:export', '#', 1, '2022-06-17 17:20:23.000', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (1043, '登录查询', 501, 1, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:query', '#', 1, '2022-06-17 17:20:23.000', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (1044, '登录删除', 501, 2, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:remove', '#', 1, '2022-06-17 17:20:23.000', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (1045, '日志导出', 501, 3, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:export', '#', 1, '2022-06-17 17:20:23.000', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (1046, '在线查询', 109, 1, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:online:query', '#', 1, '2022-06-17 17:20:23.000', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (1047, '批量强退', 109, 2, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:online:batchLogout', '#', 1, '2022-06-17 17:20:23.000', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (1048, '单条强退', 109, 3, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:online:forceLogout', '#', 1, '2022-06-17 17:20:23.000', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (1049, '任务查询', 110, 1, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:query', '#', 1, '2022-06-17 17:20:23.000', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (1050, '任务新增', 110, 2, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:add', '#', 1, '2022-06-17 17:20:23.000', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (1051, '任务修改', 110, 3, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:edit', '#', 1, '2022-06-17 17:20:23.000', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (1052, '任务删除', 110, 4, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:remove', '#', 1, '2022-06-17 17:20:23.000', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (1053, '状态修改', 110, 5, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:changeStatus', '#', 1, '2022-06-17 17:20:23.000', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (1054, '任务导出', 110, 7, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:export', '#', 1, '2022-06-17 17:20:23.000', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (1055, '生成查询', 115, 1, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:query', '#', 1, '2022-06-17 17:20:23.000', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (1056, '生成修改', 115, 2, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:edit', '#', 1, '2022-06-17 17:20:23.000', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (1057, '生成删除', 115, 3, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:remove', '#', 1, '2022-06-17 17:20:23.000', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (1058, '导入代码', 115, 2, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:import', '#', 1, '2022-06-17 17:20:23.000', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (1059, '预览代码', 115, 4, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:preview', '#', 1, '2022-06-17 17:20:23.000', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (1060, '生成代码', 115, 5, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:code', '#', 1, '2022-06-17 17:20:23.000', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (2096, '库区', 2193, 2, 'area', 'wms/area/index', NULL, 1, 0, 'C', '0', '0', 'wms:area:list', '#', 1, '2022-07-29 16:08:33.000', 1, '2022-10-30 22:17:57.000', '货区菜单');
INSERT INTO `sys_menu` VALUES (2097, '货区查询', 2096, 1, '', '', NULL, 1, 0, 'F', '0', '0', 'wms:area:query', '#', 1, '2022-07-29 16:08:33.000', 0, NULL, '');
INSERT INTO `sys_menu` VALUES (2098, '货区新增', 2096, 2, '', '', NULL, 1, 0, 'F', '0', '0', 'wms:area:add', '#', 1, '2022-07-29 16:08:33.000', 0, NULL, '');
INSERT INTO `sys_menu` VALUES (2099, '货区修改', 2096, 3, '', '', NULL, 1, 0, 'F', '0', '0', 'wms:area:edit', '#', 1, '2022-07-29 16:08:33.000', 0, NULL, '');
INSERT INTO `sys_menu` VALUES (2100, '货区删除', 2096, 4, '', '', NULL, 1, 0, 'F', '0', '0', 'wms:area:remove', '#', 1, '2022-07-29 16:08:33.000', 0, NULL, '');
INSERT INTO `sys_menu` VALUES (2101, '货区导出', 2096, 5, '', '', NULL, 1, 0, 'F', '0', '0', 'wms:area:export', '#', 1, '2022-07-29 16:08:33.000', 0, NULL, '');
INSERT INTO `sys_menu` VALUES (2102, '承运商', 2198, 6, 'carrier', 'wms/carrier/index', NULL, 1, 0, 'C', '0', '0', 'wms:carrier:list', '#', 1, '2022-07-29 16:08:42.000', 1, '2022-10-31 09:10:41.000', '承运商菜单');
INSERT INTO `sys_menu` VALUES (2103, '承运商查询', 2102, 1, '', '', NULL, 1, 0, 'F', '0', '0', 'wms:carrier:query', '#', 1, '2022-07-29 16:08:42.000', 0, NULL, '');
INSERT INTO `sys_menu` VALUES (2104, '承运商新增', 2102, 2, '', '', NULL, 1, 0, 'F', '0', '0', 'wms:carrier:add', '#', 1, '2022-07-29 16:08:42.000', 0, NULL, '');
INSERT INTO `sys_menu` VALUES (2105, '承运商修改', 2102, 3, '', '', NULL, 1, 0, 'F', '0', '0', 'wms:carrier:edit', '#', 1, '2022-07-29 16:08:42.000', 0, NULL, '');
INSERT INTO `sys_menu` VALUES (2106, '承运商删除', 2102, 4, '', '', NULL, 1, 0, 'F', '0', '0', 'wms:carrier:remove', '#', 1, '2022-07-29 16:08:43.000', 0, NULL, '');
INSERT INTO `sys_menu` VALUES (2107, '承运商导出', 2102, 5, '', '', NULL, 1, 0, 'F', '0', '0', 'wms:carrier:export', '#', 1, '2022-07-29 16:08:43.000', 0, NULL, '');
INSERT INTO `sys_menu` VALUES (2108, '客户', 2198, 5, 'customer', 'wms/customer/index', NULL, 1, 0, 'C', '0', '0', 'wms:customer:list', '#', 1, '2022-07-29 16:08:51.000', 1, '2022-10-31 09:10:21.000', '客户菜单');
INSERT INTO `sys_menu` VALUES (2109, '客户查询', 2108, 1, '', '', NULL, 1, 0, 'F', '0', '0', 'wms:customer:query', '#', 1, '2022-07-29 16:08:51.000', 0, NULL, '');
INSERT INTO `sys_menu` VALUES (2110, '客户新增', 2108, 2, '', '', NULL, 1, 0, 'F', '0', '0', 'wms:customer:add', '#', 1, '2022-07-29 16:08:51.000', 0, NULL, '');
INSERT INTO `sys_menu` VALUES (2111, '客户修改', 2108, 3, '', '', NULL, 1, 0, 'F', '0', '0', 'wms:customer:edit', '#', 1, '2022-07-29 16:08:51.000', 0, NULL, '');
INSERT INTO `sys_menu` VALUES (2112, '客户删除', 2108, 4, '', '', NULL, 1, 0, 'F', '0', '0', 'wms:customer:remove', '#', 1, '2022-07-29 16:08:51.000', 0, NULL, '');
INSERT INTO `sys_menu` VALUES (2113, '客户导出', 2108, 5, '', '', NULL, 1, 0, 'F', '0', '0', 'wms:customer:export', '#', 1, '2022-07-29 16:08:51.000', 0, NULL, '');
INSERT INTO `sys_menu` VALUES (2114, '发货记录', 2197, 5, 'delivery', 'wms/delivery/index', NULL, 1, 0, 'C', '0', '0', 'wms:delivery:list', '#', 1, '2022-07-29 16:31:18.000', 1, '2022-10-30 22:09:55.000', '发货记录菜单');
INSERT INTO `sys_menu` VALUES (2115, '发货记录查询', 2114, 1, '', '', NULL, 1, 0, 'F', '0', '0', 'wms:delivery:query', '#', 1, '2022-07-29 16:31:18.000', 0, NULL, '');
INSERT INTO `sys_menu` VALUES (2116, '发货记录新增', 2114, 2, '', '', NULL, 1, 0, 'F', '0', '0', 'wms:delivery:add', '#', 1, '2022-07-29 16:31:18.000', 0, NULL, '');
INSERT INTO `sys_menu` VALUES (2117, '发货记录修改', 2114, 3, '', '', NULL, 1, 0, 'F', '0', '0', 'wms:delivery:edit', '#', 1, '2022-07-29 16:31:18.000', 0, NULL, '');
INSERT INTO `sys_menu` VALUES (2118, '发货记录删除', 2114, 4, '', '', NULL, 1, 0, 'F', '0', '0', 'wms:delivery:remove', '#', 1, '2022-07-29 16:31:18.000', 0, NULL, '');
INSERT INTO `sys_menu` VALUES (2119, '发货记录导出', 2114, 5, '', '', NULL, 1, 0, 'F', '0', '0', 'wms:delivery:export', '#', 1, '2022-07-29 16:31:18.000', 0, NULL, '');
INSERT INTO `sys_menu` VALUES (2120, '库存看板', 0, 1, 'inventory', 'wms/inventory/index', NULL, 1, 0, 'C', '0', '0', 'wms:inventory:list', 'chart', 1, '2022-07-29 16:34:37.000', 1, '2023-08-02 10:36:49.000', '库存菜单');
INSERT INTO `sys_menu` VALUES (2121, '库存查询', 2120, 1, '', '', NULL, 1, 0, 'F', '0', '0', 'wms:inventory:query', '#', 1, '2022-07-29 16:34:37.000', 0, NULL, '');
INSERT INTO `sys_menu` VALUES (2122, '库存新增', 2120, 2, '', '', NULL, 1, 0, 'F', '0', '0', 'wms:inventory:add', '#', 1, '2022-07-29 16:34:37.000', 0, NULL, '');
INSERT INTO `sys_menu` VALUES (2123, '库存修改', 2120, 3, '', '', NULL, 1, 0, 'F', '0', '0', 'wms:inventory:edit', '#', 1, '2022-07-29 16:34:37.000', 0, NULL, '');
INSERT INTO `sys_menu` VALUES (2124, '库存删除', 2120, 4, '', '', NULL, 1, 0, 'F', '0', '0', 'wms:inventory:remove', '#', 1, '2022-07-29 16:34:37.000', 0, NULL, '');
INSERT INTO `sys_menu` VALUES (2125, '库存导出', 2120, 5, '', '', NULL, 1, 0, 'F', '0', '0', 'wms:inventory:export', '#', 1, '2022-07-29 16:34:37.000', 0, NULL, '');
INSERT INTO `sys_menu` VALUES (2126, '出入记录', 2197, 4, 'inventoryHistory', 'wms/inventoryHistory/index', NULL, 1, 0, 'C', '0', '0', 'wms:inventoryHistory:list', '#', 1, '2022-07-29 16:34:45.000', 1, '2023-08-02 10:47:06.000', '库存记录菜单');
INSERT INTO `sys_menu` VALUES (2127, '库存记录查询', 2126, 1, '', '', NULL, 1, 0, 'F', '0', '0', 'wms:inventoryHistory:query', '#', 1, '2022-07-29 16:34:46.000', 0, NULL, '');
INSERT INTO `sys_menu` VALUES (2128, '库存记录新增', 2126, 2, '', '', NULL, 1, 0, 'F', '0', '0', 'wms:inventoryHistory:add', '#', 1, '2022-07-29 16:34:46.000', 0, NULL, '');
INSERT INTO `sys_menu` VALUES (2129, '库存记录修改', 2126, 3, '', '', NULL, 1, 0, 'F', '0', '0', 'wms:inventoryHistory:edit', '#', 1, '2022-07-29 16:34:46.000', 0, NULL, '');
INSERT INTO `sys_menu` VALUES (2130, '库存记录删除', 2126, 4, '', '', NULL, 1, 0, 'F', '0', '0', 'wms:inventoryHistory:remove', '#', 1, '2022-07-29 16:34:46.000', 0, NULL, '');
INSERT INTO `sys_menu` VALUES (2131, '库存记录导出', 2126, 5, '', '', NULL, 1, 0, 'F', '0', '0', 'wms:inventoryHistory:export', '#', 1, '2022-07-29 16:34:46.000', 0, NULL, '');
INSERT INTO `sys_menu` VALUES (2132, '移库', 2192, 6, 'inventoryMovement', 'wms/inventoryMovement/index', NULL, 1, 0, 'C', '0', '0', 'wms:inventoryMovement:list', '#', 1, '2022-07-29 16:34:54.000', 1, '2022-10-30 22:07:05.000', '库存移动菜单');
INSERT INTO `sys_menu` VALUES (2133, '库存移动查询', 2132, 1, '', '', NULL, 1, 0, 'F', '0', '0', 'wms:inventoryMovement:query', '#', 1, '2022-07-29 16:34:54.000', 0, NULL, '');
INSERT INTO `sys_menu` VALUES (2134, '库存移动新增', 2132, 2, '', '', NULL, 1, 0, 'F', '0', '0', 'wms:inventoryMovement:add', '#', 1, '2022-07-29 16:34:54.000', 0, NULL, '');
INSERT INTO `sys_menu` VALUES (2135, '库存移动修改', 2132, 3, '', '', NULL, 1, 0, 'F', '0', '0', 'wms:inventoryMovement:edit', '#', 1, '2022-07-29 16:34:54.000', 0, NULL, '');
INSERT INTO `sys_menu` VALUES (2136, '库存移动删除', 2132, 4, '', '', NULL, 1, 0, 'F', '0', '0', 'wms:inventoryMovement:remove', '#', 1, '2022-07-29 16:34:54.000', 0, NULL, '');
INSERT INTO `sys_menu` VALUES (2137, '库存移动导出', 2132, 5, '', '', NULL, 1, 0, 'F', '0', '0', 'wms:inventoryMovement:export', '#', 1, '2022-07-29 16:34:54.000', 0, NULL, '');
INSERT INTO `sys_menu` VALUES (2138, '库存移动详情', 2192, 100, 'inventoryMovementDetail', 'wms/inventoryMovementDetail/index', NULL, 1, 0, 'C', '1', '0', 'wms:inventoryMovementDetail:list', '#', 1, '2022-07-29 16:35:04.000', 1, '2022-10-30 22:05:06.000', '库存移动详情菜单');
INSERT INTO `sys_menu` VALUES (2139, '库存移动详情查询', 2138, 1, '', '', NULL, 1, 0, 'F', '0', '0', 'wms:inventoryMovementDetail:query', '#', 1, '2022-07-29 16:35:04.000', 0, NULL, '');
INSERT INTO `sys_menu` VALUES (2140, '库存移动详情新增', 2138, 2, '', '', NULL, 1, 0, 'F', '0', '0', 'wms:inventoryMovementDetail:add', '#', 1, '2022-07-29 16:35:04.000', 0, NULL, '');
INSERT INTO `sys_menu` VALUES (2141, '库存移动详情修改', 2138, 3, '', '', NULL, 1, 0, 'F', '0', '0', 'wms:inventoryMovementDetail:edit', '#', 1, '2022-07-29 16:35:04.000', 0, NULL, '');
INSERT INTO `sys_menu` VALUES (2142, '库存移动详情删除', 2138, 4, '', '', NULL, 1, 0, 'F', '0', '0', 'wms:inventoryMovementDetail:remove', '#', 1, '2022-07-29 16:35:04.000', 0, NULL, '');
INSERT INTO `sys_menu` VALUES (2143, '库存移动详情导出', 2138, 5, '', '', NULL, 1, 0, 'F', '0', '0', 'wms:inventoryMovementDetail:export', '#', 1, '2022-07-29 16:35:04.000', 0, NULL, '');
INSERT INTO `sys_menu` VALUES (2144, '物料', 0, 4, 'item', '', NULL, 1, 0, 'M', '0', '0', '', 'shopping', 1, '2022-07-29 16:35:13.000', 1, '2023-08-02 10:44:51.000', '物料菜单');
INSERT INTO `sys_menu` VALUES (2145, '物料查询', 2216, 1, '', '', NULL, 1, 0, 'F', '0', '0', 'wms:item:query', '#', 1, '2022-07-29 16:35:13.000', 1, '2023-04-26 17:34:01.000', '');
INSERT INTO `sys_menu` VALUES (2146, '物料新增', 2216, 2, '', '', NULL, 1, 0, 'F', '0', '0', 'wms:item:add', '#', 1, '2022-07-29 16:35:13.000', 1, '2023-04-26 17:34:18.000', '');
INSERT INTO `sys_menu` VALUES (2147, '物料修改', 2216, 3, '', '', NULL, 1, 0, 'F', '0', '0', 'wms:item:edit', '#', 1, '2022-07-29 16:35:13.000', 1, '2023-04-26 17:34:25.000', '');
INSERT INTO `sys_menu` VALUES (2148, '物料删除', 2216, 4, '', '', NULL, 1, 0, 'F', '0', '0', 'wms:item:remove', '#', 1, '2022-07-29 16:35:13.000', 1, '2023-04-26 17:34:33.000', '');
INSERT INTO `sys_menu` VALUES (2149, '物料导出', 2216, 5, '', '', NULL, 1, 0, 'F', '0', '0', 'wms:item:export', '#', 1, '2022-07-29 16:35:13.000', 1, '2023-04-26 17:34:41.000', '');
INSERT INTO `sys_menu` VALUES (2150, '货架', 2193, 3, 'rack', 'wms/rack/index', NULL, 1, 0, 'C', '0', '0', 'wms:rack:list', '#', 1, '2022-07-29 16:35:22.000', 1, '2022-10-30 22:18:04.000', '货架菜单');
INSERT INTO `sys_menu` VALUES (2151, '货架查询', 2150, 1, '', '', NULL, 1, 0, 'F', '0', '0', 'wms:rack:query', '#', 1, '2022-07-29 16:35:22.000', 0, NULL, '');
INSERT INTO `sys_menu` VALUES (2152, '货架新增', 2150, 2, '', '', NULL, 1, 0, 'F', '0', '0', 'wms:rack:add', '#', 1, '2022-07-29 16:35:22.000', 0, NULL, '');
INSERT INTO `sys_menu` VALUES (2153, '货架修改', 2150, 3, '', '', NULL, 1, 0, 'F', '0', '0', 'wms:rack:edit', '#', 1, '2022-07-29 16:35:22.000', 0, NULL, '');
INSERT INTO `sys_menu` VALUES (2154, '货架删除', 2150, 4, '', '', NULL, 1, 0, 'F', '0', '0', 'wms:rack:remove', '#', 1, '2022-07-29 16:35:22.000', 0, NULL, '');
INSERT INTO `sys_menu` VALUES (2155, '货架导出', 2150, 5, '', '', NULL, 1, 0, 'F', '0', '0', 'wms:rack:export', '#', 1, '2022-07-29 16:35:22.000', 0, NULL, '');
INSERT INTO `sys_menu` VALUES (2156, '入库', 2192, 1, 'receiptOrder', 'wms/receiptOrder/index', NULL, 1, 0, 'C', '0', '0', 'wms:receiptOrder:list', '#', 1, '2022-07-29 16:35:29.000', 1, '2022-10-30 22:06:34.000', '入库单菜单');
INSERT INTO `sys_menu` VALUES (2157, '入库单查询', 2156, 1, '', '', NULL, 1, 0, 'F', '0', '0', 'wms:receiptOrder:query', '#', 1, '2022-07-29 16:35:29.000', 0, NULL, '');
INSERT INTO `sys_menu` VALUES (2158, '编辑入库单', 2192, 2, 'receiptOrder/edit', 'wms/receiptOrder/edit', NULL, 1, 0, 'C', '1', '0', 'wms:receiptOrder:add', '#', 1, '2022-07-29 16:35:29.000', 1, '2022-08-31 15:54:00.000', '');
INSERT INTO `sys_menu` VALUES (2159, '入库单修改', 2156, 3, '', '', NULL, 1, 0, 'F', '0', '0', 'wms:receiptOrder:edit', '#', 1, '2022-07-29 16:35:29.000', 0, NULL, '');
INSERT INTO `sys_menu` VALUES (2160, '入库单删除', 2156, 4, '', '', NULL, 1, 0, 'F', '0', '0', 'wms:receiptOrder:remove', '#', 1, '2022-07-29 16:35:30.000', 0, NULL, '');
INSERT INTO `sys_menu` VALUES (2161, '入库单导出', 2156, 5, '', '', NULL, 1, 0, 'F', '0', '0', 'wms:receiptOrder:export', '#', 1, '2022-07-29 16:35:30.000', 0, NULL, '');
INSERT INTO `sys_menu` VALUES (2162, '入库单详情', 2192, 100, 'receiptOrderDetail', 'wms/receiptOrderDetail/index', NULL, 1, 0, 'C', '1', '0', 'wms:receiptOrderDetail:list', '#', 1, '2022-07-29 16:35:36.000', 1, '2022-10-30 22:04:29.000', '入库单详情菜单');
INSERT INTO `sys_menu` VALUES (2163, '入库单详情查询', 2162, 1, '', '', NULL, 1, 0, 'F', '0', '0', 'wms:receiptOrderDetail:query', '#', 1, '2022-07-29 16:35:36.000', 0, NULL, '');
INSERT INTO `sys_menu` VALUES (2164, '入库单详情新增', 2162, 2, '', '', NULL, 1, 0, 'F', '0', '0', 'wms:receiptOrderDetail:add', '#', 1, '2022-07-29 16:35:36.000', 0, NULL, '');
INSERT INTO `sys_menu` VALUES (2165, '入库单详情修改', 2162, 3, '', '', NULL, 1, 0, 'F', '0', '0', 'wms:receiptOrderDetail:edit', '#', 1, '2022-07-29 16:35:36.000', 0, NULL, '');
INSERT INTO `sys_menu` VALUES (2166, '入库单详情删除', 2162, 4, '', '', NULL, 1, 0, 'F', '0', '0', 'wms:receiptOrderDetail:remove', '#', 1, '2022-07-29 16:35:36.000', 0, NULL, '');
INSERT INTO `sys_menu` VALUES (2167, '入库单详情导出', 2162, 5, '', '', NULL, 1, 0, 'F', '0', '0', 'wms:receiptOrderDetail:export', '#', 1, '2022-07-29 16:35:36.000', 0, NULL, '');
INSERT INTO `sys_menu` VALUES (2168, '出库', 2192, 2, 'shipmentOrder', 'wms/shipmentOrder/index', NULL, 1, 0, 'C', '0', '0', 'wms:shipmentOrder:list', '#', 1, '2022-07-29 16:35:44.000', 1, '2022-10-30 22:06:45.000', '出库单菜单');
INSERT INTO `sys_menu` VALUES (2169, '出库单查询', 2168, 1, '', '', NULL, 1, 0, 'F', '0', '0', 'wms:shipmentOrder:query', '#', 1, '2022-07-29 16:35:45.000', 0, NULL, '');
INSERT INTO `sys_menu` VALUES (2170, '出库单新增', 2168, 2, '', '', NULL, 1, 0, 'F', '0', '0', 'wms:shipmentOrder:add', '#', 1, '2022-07-29 16:35:45.000', 0, NULL, '');
INSERT INTO `sys_menu` VALUES (2171, '出库单修改', 2168, 3, '', '', NULL, 1, 0, 'F', '0', '0', 'wms:shipmentOrder:edit', '#', 1, '2022-07-29 16:35:45.000', 0, NULL, '');
INSERT INTO `sys_menu` VALUES (2172, '出库单删除', 2168, 4, '', '', NULL, 1, 0, 'F', '0', '0', 'wms:shipmentOrder:remove', '#', 1, '2022-07-29 16:35:45.000', 0, NULL, '');
INSERT INTO `sys_menu` VALUES (2173, '出库单导出', 2168, 5, '', '', NULL, 1, 0, 'F', '0', '0', 'wms:shipmentOrder:export', '#', 1, '2022-07-29 16:35:45.000', 0, NULL, '');
INSERT INTO `sys_menu` VALUES (2174, '出库单详情', 2192, 100, 'shipmentOrderDetail', 'wms/shipmentOrderDetail/index', NULL, 1, 0, 'C', '1', '0', 'wms:shipmentOrderDetail:list', '#', 1, '2022-07-29 16:35:52.000', 1, '2022-10-30 22:04:05.000', '出库单详情菜单');
INSERT INTO `sys_menu` VALUES (2175, '出库单详情查询', 2174, 1, '', '', NULL, 1, 0, 'F', '0', '0', 'wms:shipmentOrderDetail:query', '#', 1, '2022-07-29 16:35:52.000', 0, NULL, '');
INSERT INTO `sys_menu` VALUES (2176, '出库单详情新增', 2174, 2, '', '', NULL, 1, 0, 'F', '0', '0', 'wms:shipmentOrderDetail:add', '#', 1, '2022-07-29 16:35:52.000', 0, NULL, '');
INSERT INTO `sys_menu` VALUES (2177, '出库单详情修改', 2174, 3, '', '', NULL, 1, 0, 'F', '0', '0', 'wms:shipmentOrderDetail:edit', '#', 1, '2022-07-29 16:35:52.000', 0, NULL, '');
INSERT INTO `sys_menu` VALUES (2178, '出库单详情删除', 2174, 4, '', '', NULL, 1, 0, 'F', '0', '0', 'wms:shipmentOrderDetail:remove', '#', 1, '2022-07-29 16:35:52.000', 0, NULL, '');
INSERT INTO `sys_menu` VALUES (2179, '出库单详情导出', 2174, 5, '', '', NULL, 1, 0, 'F', '0', '0', 'wms:shipmentOrderDetail:export', '#', 1, '2022-07-29 16:35:52.000', 0, NULL, '');
INSERT INTO `sys_menu` VALUES (2180, '供应商', 2198, 5, 'supplier', 'wms/supplier/index', NULL, 1, 0, 'C', '0', '0', 'wms:supplier:list', '#', 1, '2022-07-29 16:35:59.000', 1, '2022-10-31 09:10:34.000', '供应商菜单');
INSERT INTO `sys_menu` VALUES (2181, '供应商查询', 2180, 1, '', '', NULL, 1, 0, 'F', '0', '0', 'wms:supplier:query', '#', 1, '2022-07-29 16:35:59.000', 0, NULL, '');
INSERT INTO `sys_menu` VALUES (2182, '供应商新增', 2180, 2, '', '', NULL, 1, 0, 'F', '0', '0', 'wms:supplier:add', '#', 1, '2022-07-29 16:35:59.000', 0, NULL, '');
INSERT INTO `sys_menu` VALUES (2183, '供应商修改', 2180, 3, '', '', NULL, 1, 0, 'F', '0', '0', 'wms:supplier:edit', '#', 1, '2022-07-29 16:35:59.000', 0, NULL, '');
INSERT INTO `sys_menu` VALUES (2184, '供应商删除', 2180, 4, '', '', NULL, 1, 0, 'F', '0', '0', 'wms:supplier:remove', '#', 1, '2022-07-29 16:35:59.000', 0, NULL, '');
INSERT INTO `sys_menu` VALUES (2185, '供应商导出', 2180, 5, '', '', NULL, 1, 0, 'F', '0', '0', 'wms:supplier:export', '#', 1, '2022-07-29 16:36:00.000', 0, NULL, '');
INSERT INTO `sys_menu` VALUES (2186, '仓库/库区', 0, 5, 'warehouse', 'wms/warehouse/index', NULL, 1, 0, 'C', '0', '0', 'wms:warehouse:list', 'component', 1, '2022-07-29 16:36:31.000', 1, '2023-08-02 10:45:21.000', '仓库菜单');
INSERT INTO `sys_menu` VALUES (2187, '仓库查询', 2186, 1, '', '', NULL, 1, 0, 'F', '0', '0', 'wms:warehouse:query', '#', 1, '2022-07-29 16:36:31.000', 0, NULL, '');
INSERT INTO `sys_menu` VALUES (2188, '仓库新增', 2186, 2, '', '', NULL, 1, 0, 'F', '0', '0', 'wms:warehouse:add', '#', 1, '2022-07-29 16:36:31.000', 0, NULL, '');
INSERT INTO `sys_menu` VALUES (2189, '仓库修改', 2186, 3, '', '', NULL, 1, 0, 'F', '0', '0', 'wms:warehouse:edit', '#', 1, '2022-07-29 16:36:31.000', 0, NULL, '');
INSERT INTO `sys_menu` VALUES (2190, '仓库删除', 2186, 4, '', '', NULL, 1, 0, 'F', '0', '0', 'wms:warehouse:remove', '#', 1, '2022-07-29 16:36:31.000', 0, NULL, '');
INSERT INTO `sys_menu` VALUES (2191, '仓库导出', 2186, 5, '', '', NULL, 1, 0, 'F', '0', '0', 'wms:warehouse:export', '#', 1, '2022-07-29 16:36:31.000', 0, NULL, '');
INSERT INTO `sys_menu` VALUES (2192, '出入库', 0, 2, 'wms', NULL, NULL, 1, 0, 'M', '0', '0', '', 'redis', 1, '2022-07-29 18:09:52.000', 1, '2023-08-02 10:37:28.000', '');
INSERT INTO `sys_menu` VALUES (2193, '仓库/库区/货架', 0, 4, 'basic', NULL, NULL, 1, 0, 'M', '1', '0', '', 'component', 1, '2022-08-09 08:57:46.000', 1, '2023-08-02 10:43:10.000', '');
INSERT INTO `sys_menu` VALUES (2194, '发货/入库', 2192, 2, 'receiptOrder/status', 'wms/receiptOrder/status', NULL, 1, 0, 'C', '1', '0', 'wms:receiptOrder:status', '#', 1, '2022-09-27 14:16:42.000', 1, '2022-09-27 14:17:19.000', '');
INSERT INTO `sys_menu` VALUES (2195, '编辑出库单', 2192, 2, 'shipmentOrder/edit', 'wms/shipmentOrder/edit', NULL, 1, 0, 'C', '1', '0', 'wms:shipmentOrder:add', '#', 1, '2022-10-20 16:38:26.000', 1, '2022-10-24 18:47:03.000', '');
INSERT INTO `sys_menu` VALUES (2196, '发货/出库', 2192, 2, 'shipmentOrder/status', 'wms/shipmentOrder/status', NULL, 1, 0, 'C', '1', '0', 'wms:shipmentOrder:status', '#', 1, '2022-10-20 18:25:10.000', 1, '2022-10-24 18:47:15.000', '');
INSERT INTO `sys_menu` VALUES (2197, '库存记录', 0, 7, 'report', NULL, NULL, 1, 0, 'M', '0', '0', '', 'monitor', 1, '2022-10-30 22:08:28.000', 1, '2023-08-02 10:46:37.000', '');
INSERT INTO `sys_menu` VALUES (2198, '客户/供应商/承运商', 0, 6, 'relation', NULL, NULL, 1, 0, 'M', '0', '0', '', 'peoples', 1, '2022-10-30 22:20:24.000', 1, '2023-08-02 10:46:07.000', '');
INSERT INTO `sys_menu` VALUES (2199, '编辑移库', 2192, 3, 'inventoryMovement/edit', 'wms/inventoryMovement/edit', NULL, 1, 0, 'C', '1', '0', 'wms:inventoryMovement:edit', '#', 1, '2022-11-02 15:13:46.000', 1, '2022-11-02 15:14:49.000', '');
INSERT INTO `sys_menu` VALUES (2200, '移库操作', 2192, 4, 'inventoryMovement/status', 'wms/inventoryMovement/status', NULL, 1, 0, 'C', '1', '0', 'wms:inventoryMovement:status', '#', 1, '2022-11-02 15:15:57.000', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (2201, '库存盘点', 0, 3, 'inventoryCheck', 'wms/inventoryCheck/index', NULL, 1, 0, 'C', '0', '0', 'wms:inventoryCheck:list', 'example', 1, '2023-04-20 13:24:37.000', 1, '2023-08-02 10:38:35.000', '');
INSERT INTO `sys_menu` VALUES (2202, '库存盘点单据查询', 2201, 1, '', NULL, NULL, 1, 0, 'F', '0', '0', 'wms:inventoryCheck:query', '#', 1, '2023-04-26 14:16:50.000', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (2203, '库存盘点单据新增', 2201, 2, '', NULL, NULL, 1, 0, 'F', '0', '0', 'wms:inventoryCheck:add', '#', 1, '2023-04-26 14:17:20.000', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (2204, '库存盘点单据修改', 2201, 3, '', NULL, NULL, 1, 0, 'F', '0', '0', 'wms:inventoryCheck:edit', '#', 1, '2023-04-26 14:17:49.000', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (2205, '库存盘点单据删除', 2201, 4, '', NULL, NULL, 1, 0, 'F', '0', '0', 'wms:inventoryCheck:remove', '#', 1, '2023-04-26 14:18:11.000', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (2206, '库存盘点单据导出', 2201, 5, '', NULL, NULL, 1, 0, 'F', '0', '0', 'wms:inventoryCheck:export', '#', 1, '2023-04-26 14:18:28.000', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (2207, '盘库', 0, 5, '/check', NULL, NULL, 1, 0, 'M', '1', '0', NULL, 'checkbox', 1, '2023-04-26 14:19:57.000', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (2208, '编辑盘点单', 2207, 0, 'edit', 'wms/inventoryCheck/edit', NULL, 1, 0, 'C', '1', '0', 'wms:inventoryCheck:list', 'checkbox', 1, '2023-04-26 14:20:43.000', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (2209, '查看盘点单', 2207, 1, 'status', 'wms/inventoryCheck/status', NULL, 1, 0, 'C', '1', '0', NULL, '#', 1, '2023-04-26 14:22:09.000', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (2210, '盘点单据详情', 2207, 1, 'inventoryCheckDetail', 'wms/inventoryCheckDetail/ind', NULL, 1, 0, 'C', '1', '0', 'wms:inventoryCheckDetail:list', '#', 1, '2023-04-26 14:22:47.000', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (2211, '库存盘点单据详情查询', 2210, 1, '', NULL, NULL, 1, 0, 'F', '0', '0', 'wms:inventoryCheckDetail:query', '#', 1, '2023-04-26 14:23:19.000', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (2212, '库存盘点单据详情新增', 2210, 2, '', NULL, NULL, 1, 0, 'F', '0', '0', 'wms:inventoryCheckDetail:add', '#', 1, '2023-04-26 14:23:45.000', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (2213, '库存盘点单据详情修改', 2210, 3, '', NULL, NULL, 1, 0, 'F', '0', '0', 'wms:inventoryCheckDetail:edit', '#', 1, '2023-04-26 14:24:16.000', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (2214, '库存盘点单据详情删除', 2210, 4, '', NULL, NULL, 1, 0, 'F', '0', '0', 'wms:inventoryCheckDetail:remove', '#', 1, '2023-04-26 14:24:36.000', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (2215, '库存盘点单据详情导出', 2210, 5, '', NULL, NULL, 1, 0, 'F', '0', '0', 'wms:inventoryCheckDetail:export', '#', 1, '2023-04-26 14:24:56.000', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (2216, '物料管理', 2144, 2, 'item', 'wms/item/index', NULL, 1, 0, 'C', '0', '0', 'wms:item:list', 'dict', 1, '2023-04-26 17:33:32.000', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (2217, '分类管理', 2144, 1, 'itemType', 'wms/itemType/index', NULL, 1, 0, 'C', '0', '0', 'wms:itemType:list', 'dict', 1, '2023-04-26 17:35:52.000', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (2218, '物料类型表查询', 2217, 1, '', NULL, NULL, 1, 0, 'F', '0', '0', 'wms:itemType:query', '#', 1, '2023-04-26 17:36:20.000', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (2219, '物料类型表新增', 2217, 2, '', NULL, NULL, 1, 0, 'F', '0', '0', 'wms:itemType:add', '#', 1, '2023-04-26 17:36:49.000', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (2220, '物料类型表修改', 2217, 3, '', NULL, NULL, 1, 0, 'F', '0', '0', 'wms:itemType:edit', '#', 1, '2023-04-26 17:37:06.000', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (2221, '物料类型表删除', 2217, 4, '', NULL, NULL, 1, 0, 'F', '0', '0', 'wms:itemType:remove', '#', 1, '2023-04-26 17:37:25.000', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (2222, '物料类型表导出', 2217, 5, '', NULL, NULL, 1, 0, 'F', '0', '0', 'wms:itemType:export', '#', 1, '2023-04-26 17:37:42.000', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (2223, '供应商账户流水', 2198, 1, 'supplierTransaction', 'wms/supplierTransaction/index', NULL, 1, 0, 'C', '1', '0', 'wms:supplierTransaction:list', '#', 1, '2023-05-04 13:39:35.000', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (2224, '供应商账户流水查询', 2223, 1, '', NULL, NULL, 1, 0, 'F', '0', '0', 'wms:supplierTransaction:query', '#', 1, '2023-05-04 13:39:55.000', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (2225, '供应商账户流水新增', 2223, 2, '', NULL, NULL, 1, 0, 'F', '0', '0', 'wms:supplierTransaction:add', '#', 1, '2023-05-04 13:40:18.000', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (2226, '供应商账户流水修改', 2223, 3, '', NULL, NULL, 1, 0, 'F', '0', '0', 'wms:supplierTransaction:edit', '#', 1, '2023-05-04 13:40:34.000', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (2227, '供应商账户流水删除', 2223, 4, '', NULL, NULL, 1, 0, 'F', '0', '0', 'wms:supplierTransaction:remove', '#', 1, '2023-05-04 13:40:52.000', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (2228, '供应商账户流水导出', 2223, 5, '', NULL, NULL, 1, 0, 'F', '0', '0', 'wms:supplierTransaction:export', '#', 1, '2023-05-04 13:41:14.000', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (2229, '客户账户流水', 2198, 1, 'customerTransaction', 'wms/customerTransaction/index', NULL, 1, 0, 'C', '1', '0', 'wms:customerTransaction:list', '#', 1, '2023-05-04 16:55:03.000', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (2230, '客户账户流水查询', 2229, 1, '', NULL, NULL, 1, 0, 'F', '0', '0', 'wms:customerTransaction:query', '#', 1, '2023-05-04 16:55:57.000', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (2231, '客户账户流水新增', 2229, 2, '', NULL, NULL, 1, 0, 'F', '0', '0', 'wms:customerTransaction:add', '#', 1, '2023-05-04 16:56:36.000', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (2232, '客户账户流水修改', 2229, 3, '', NULL, NULL, 1, 0, 'F', '0', '0', 'wms:customerTransaction:edit', '#', 1, '2023-05-04 16:57:02.000', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (2233, '客户账户流水删除', 2229, 4, '', NULL, NULL, 1, 0, 'F', '0', '0', 'wms:customerTransaction:remove', '#', 1, '2023-05-04 16:57:27.000', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (2234, '客户账户流水导出', 2229, 5, '', NULL, NULL, 1, 0, 'F', '0', '0', 'wms:customerTransaction:export', '#', 1, '2023-05-04 16:57:56.000', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (2235, '库存结算', 0, 11, 'settlement', NULL, NULL, 1, 0, 'M', '0', '0', NULL, 'log', 1, '2023-08-02 13:05:35.000', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (2236, '库存年结', 2235, 7, 'inventorySettlementYear', 'wms/inventorySettlement/index', '{\"settlementType\": 2}', 1, 0, 'C', '0', '0', 'wms:inventorySettlement:list', 'skill', 1, '2023-04-20 16:10:49.000', 1, '2023-04-21 12:10:29.000', '');
INSERT INTO `sys_menu` VALUES (2237, '查看结算单', 2235, 2, 'inventorySettlement/status', 'wms/inventorySettlement/status', NULL, 1, 0, 'C', '1', '0', 'wms:inventorySettlement:edit', 'chart', 1, '2023-04-21 12:32:16.000', 1, '2023-04-21 12:32:26.000', '');
INSERT INTO `sys_menu` VALUES (2238, '库存月结', 2235, 5, 'inventorySettlementMonth', 'wms/inventorySettlement/index', '{\"settlementType\": 1}', 1, 0, 'C', '0', '0', 'wms:inventorySettlement:list', 'documentation', 1, '2023-04-18 19:33:07.000', 1, '2023-04-21 12:10:23.000', '库存结算单菜单');
INSERT INTO `sys_menu` VALUES (2239, '库存结算单查询', 2235, 1, '#', '', NULL, 1, 0, 'F', '0', '0', 'wms:inventorySettlement:query', '#', 1, '2023-04-18 19:33:08.000', 0, NULL, '');
INSERT INTO `sys_menu` VALUES (2240, '库存结算单新增', 2235, 2, '#', '', NULL, 1, 0, 'F', '0', '0', 'wms:inventorySettlement:add', '#', 1, '2023-04-18 19:33:08.000', 0, NULL, '');
INSERT INTO `sys_menu` VALUES (2241, '编辑库存结算', 2235, 3, 'inventorySettlement/edit', 'wms/inventorySettlement/edit', NULL, 1, 0, 'C', '1', '0', 'wms:inventorySettlement:edit', '#', 1, '2023-04-18 19:33:08.000', 1, '2023-04-20 16:05:52.000', '');
INSERT INTO `sys_menu` VALUES (2242, '库存结算单删除', 2235, 4, '#', '', NULL, 1, 0, 'F', '0', '0', 'wms:inventorySettlement:remove', '#', 1, '2023-04-18 19:33:08.000', 0, NULL, '');
INSERT INTO `sys_menu` VALUES (2243, '库存结算单导出', 2235, 5, '#', '', NULL, 1, 0, 'F', '0', '0', 'wms:inventorySettlement:export', '#', 1, '2023-04-18 19:33:08.000', 0, NULL, '');
INSERT INTO `sys_menu` VALUES (2244, '波次', 2192, 1, 'wave', 'wms/wave/index', NULL, 1, 0, 'C', '1', '0', 'wms:wave:list', '#', 1, '2023-08-16 05:24:03.000', 1, '2023-08-16 09:09:00.000', '波次菜单');
INSERT INTO `sys_menu` VALUES (2245, '波次查询', 2244, 1, '#', '', NULL, 1, 0, 'F', '0', '0', 'wms:wave:query', '#', 1, '2023-08-16 05:24:03.000', 1, NULL, '');
INSERT INTO `sys_menu` VALUES (2246, '波次新增', 2244, 2, '#', '', NULL, 1, 0, 'F', '0', '0', 'wms:wave:add', '#', 1, '2023-08-16 05:24:03.000', 1, NULL, '');
INSERT INTO `sys_menu` VALUES (2247, '波次修改', 2244, 3, '#', '', NULL, 1, 0, 'F', '0', '0', 'wms:wave:edit', '#', 1, '2023-08-16 05:24:03.000', 1, NULL, '');
INSERT INTO `sys_menu` VALUES (2248, '波次删除', 2244, 4, '#', '', NULL, 1, 0, 'F', '0', '0', 'wms:wave:remove', '#', 1, '2023-08-16 05:24:03.000', 1, NULL, '');
INSERT INTO `sys_menu` VALUES (2249, '波次导出', 2244, 5, '#', '', NULL, 1, 0, 'F', '0', '0', 'wms:wave:export', '#', 1, '2023-08-16 05:24:03.000', 1, NULL, '');
INSERT INTO `sys_menu` VALUES (2250, '波次作业', 2192, 2, 'wave/status', 'wms/wave/status', NULL, 1, 0, 'C', '1', '0', '', 'checkbox', 1, '2023-08-16 07:44:29.000', 1, '2023-08-16 09:09:04.000', '');
INSERT INTO `sys_menu` VALUES (2251, '批量入库', 2192, 6, 'wave/receipt/status', 'wms/wave/receipt/status', NULL, 1, 0, 'C', '1', '0', '', '#', 1, '2023-09-05 10:09:55.000', 1, '2023-09-05 10:11:59.000', '');

-- ----------------------------
-- Table structure for sys_notice
-- ----------------------------
DROP TABLE IF EXISTS `sys_notice`;
CREATE TABLE `sys_notice`  (
  `notice_id` int(4) NOT NULL AUTO_INCREMENT COMMENT '公告ID',
  `notice_title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '公告标题',
  `notice_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '公告类型（1通知 2公告）',
  `notice_content` longblob NULL COMMENT '公告内容',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '公告状态（0正常 1关闭）',
  `create_by` bigint(20) NULL DEFAULT NULL COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` bigint(20) NULL DEFAULT NULL COMMENT '更新者',
  `update_time` datetime(3) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`notice_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '通知公告表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_notice
-- ----------------------------
INSERT INTO `sys_notice` VALUES (1, '温馨提醒：2018-07-01 若依新版本发布啦', '2', 0xE696B0E78988E69CACE58685E5AEB9, '0', 1, '2022-06-17 17:20:29', NULL, NULL, '管理员');
INSERT INTO `sys_notice` VALUES (2, '维护通知：2018-07-01 若依系统凌晨维护', '1', 0xE7BBB4E68AA4E58685E5AEB9, '0', 1, '2022-06-17 17:20:30', NULL, NULL, '管理员');

-- ----------------------------
-- Table structure for sys_oper_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_oper_log`;
CREATE TABLE `sys_oper_log`  (
  `oper_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '日志主键',
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
  `status` int(1) NULL DEFAULT 0 COMMENT '操作状态（0正常 1异常）',
  `error_msg` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '错误消息',
  `oper_time` datetime(0) NULL DEFAULT NULL COMMENT '操作时间',
  PRIMARY KEY (`oper_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 16684 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '操作日志记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sys_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_post`;
CREATE TABLE `sys_post`  (
  `post_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '岗位ID',
  `post_code` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '岗位编码',
  `post_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '岗位名称',
  `post_sort` int(4) NOT NULL COMMENT '显示顺序',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '状态（0正常 1停用）',
  `create_by` bigint(20) NULL DEFAULT NULL COMMENT '创建者',
  `create_time` datetime(3) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` bigint(20) NULL DEFAULT NULL COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`post_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '岗位信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_post
-- ----------------------------
INSERT INTO `sys_post` VALUES (1, 'ceo', '董事长', 1, '0', 1, '2022-06-17 17:20:20.000', NULL, NULL, '');
INSERT INTO `sys_post` VALUES (2, 'se', '项目经理', 2, '0', 1, '2022-06-17 17:20:20.000', NULL, NULL, '');
INSERT INTO `sys_post` VALUES (3, 'hr', '人力资源', 3, '0', 1, '2022-06-17 17:20:20.000', NULL, NULL, '');
INSERT INTO `sys_post` VALUES (4, 'user', '普通员工', 4, '0', 1, '2022-06-17 17:20:20.000', 1, '2023-01-06 12:45:30', '');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `role_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `role_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '角色名称',
  `role_key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '角色权限字符串',
  `role_sort` int(4) NOT NULL COMMENT '显示顺序',
  `data_scope` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '1' COMMENT '数据范围（1：全部数据权限 2：自定数据权限 3：本部门数据权限 4：本部门及以下数据权限）',
  `menu_check_strictly` tinyint(1) NULL DEFAULT 1 COMMENT '菜单树选择项是否关联显示',
  `dept_check_strictly` tinyint(1) NULL DEFAULT 1 COMMENT '部门树选择项是否关联显示',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '角色状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` bigint(20) NULL DEFAULT NULL COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` bigint(20) NULL DEFAULT NULL COMMENT '更新者',
  `update_time` datetime(3) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`role_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 102 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '角色信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES (1, '超级管理员', 'admin', 1, '1', 1, 1, '0', '0', 1, '2022-06-17 17:20:20', NULL, NULL, '超级管理员');
INSERT INTO `sys_role` VALUES (3, '管理员', 'super', 3, '1', 1, 1, '0', '0', 1, '2022-06-28 15:57:51', NULL, NULL, '管理员');
INSERT INTO `sys_role` VALUES (100, '普通用户', 'common', 2, '2', 0, 0, '0', '0', NULL, '2022-06-20 09:52:16', 1, '2023-08-22 09:30:59.000', NULL);
INSERT INTO `sys_role` VALUES (101, '浏览者', 'viewer', 4, '1', 1, 1, '0', '0', 1, '2022-11-01 17:52:33', 1, '2022-11-01 17:55:33.000', NULL);

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
-- Records of sys_role_dept
-- ----------------------------
INSERT INTO `sys_role_dept` VALUES (2, 100);
INSERT INTO `sys_role_dept` VALUES (2, 101);
INSERT INTO `sys_role_dept` VALUES (2, 105);

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
INSERT INTO `sys_role_menu` VALUES (2, 1);
INSERT INTO `sys_role_menu` VALUES (2, 2);
INSERT INTO `sys_role_menu` VALUES (2, 3);
INSERT INTO `sys_role_menu` VALUES (2, 4);
INSERT INTO `sys_role_menu` VALUES (2, 100);
INSERT INTO `sys_role_menu` VALUES (2, 101);
INSERT INTO `sys_role_menu` VALUES (2, 102);
INSERT INTO `sys_role_menu` VALUES (2, 103);
INSERT INTO `sys_role_menu` VALUES (2, 104);
INSERT INTO `sys_role_menu` VALUES (2, 105);
INSERT INTO `sys_role_menu` VALUES (2, 106);
INSERT INTO `sys_role_menu` VALUES (2, 107);
INSERT INTO `sys_role_menu` VALUES (2, 108);
INSERT INTO `sys_role_menu` VALUES (2, 109);
INSERT INTO `sys_role_menu` VALUES (2, 110);
INSERT INTO `sys_role_menu` VALUES (2, 111);
INSERT INTO `sys_role_menu` VALUES (2, 112);
INSERT INTO `sys_role_menu` VALUES (2, 113);
INSERT INTO `sys_role_menu` VALUES (2, 114);
INSERT INTO `sys_role_menu` VALUES (2, 115);
INSERT INTO `sys_role_menu` VALUES (2, 116);
INSERT INTO `sys_role_menu` VALUES (2, 500);
INSERT INTO `sys_role_menu` VALUES (2, 501);
INSERT INTO `sys_role_menu` VALUES (2, 1000);
INSERT INTO `sys_role_menu` VALUES (2, 1001);
INSERT INTO `sys_role_menu` VALUES (2, 1002);
INSERT INTO `sys_role_menu` VALUES (2, 1003);
INSERT INTO `sys_role_menu` VALUES (2, 1004);
INSERT INTO `sys_role_menu` VALUES (2, 1005);
INSERT INTO `sys_role_menu` VALUES (2, 1006);
INSERT INTO `sys_role_menu` VALUES (2, 1007);
INSERT INTO `sys_role_menu` VALUES (2, 1008);
INSERT INTO `sys_role_menu` VALUES (2, 1009);
INSERT INTO `sys_role_menu` VALUES (2, 1010);
INSERT INTO `sys_role_menu` VALUES (2, 1011);
INSERT INTO `sys_role_menu` VALUES (2, 1012);
INSERT INTO `sys_role_menu` VALUES (2, 1013);
INSERT INTO `sys_role_menu` VALUES (2, 1014);
INSERT INTO `sys_role_menu` VALUES (2, 1015);
INSERT INTO `sys_role_menu` VALUES (2, 1016);
INSERT INTO `sys_role_menu` VALUES (2, 1017);
INSERT INTO `sys_role_menu` VALUES (2, 1018);
INSERT INTO `sys_role_menu` VALUES (2, 1019);
INSERT INTO `sys_role_menu` VALUES (2, 1020);
INSERT INTO `sys_role_menu` VALUES (2, 1021);
INSERT INTO `sys_role_menu` VALUES (2, 1022);
INSERT INTO `sys_role_menu` VALUES (2, 1023);
INSERT INTO `sys_role_menu` VALUES (2, 1024);
INSERT INTO `sys_role_menu` VALUES (2, 1025);
INSERT INTO `sys_role_menu` VALUES (2, 1026);
INSERT INTO `sys_role_menu` VALUES (2, 1027);
INSERT INTO `sys_role_menu` VALUES (2, 1028);
INSERT INTO `sys_role_menu` VALUES (2, 1029);
INSERT INTO `sys_role_menu` VALUES (2, 1030);
INSERT INTO `sys_role_menu` VALUES (2, 1031);
INSERT INTO `sys_role_menu` VALUES (2, 1032);
INSERT INTO `sys_role_menu` VALUES (2, 1033);
INSERT INTO `sys_role_menu` VALUES (2, 1034);
INSERT INTO `sys_role_menu` VALUES (2, 1035);
INSERT INTO `sys_role_menu` VALUES (2, 1036);
INSERT INTO `sys_role_menu` VALUES (2, 1037);
INSERT INTO `sys_role_menu` VALUES (2, 1038);
INSERT INTO `sys_role_menu` VALUES (2, 1039);
INSERT INTO `sys_role_menu` VALUES (2, 1040);
INSERT INTO `sys_role_menu` VALUES (2, 1041);
INSERT INTO `sys_role_menu` VALUES (2, 1042);
INSERT INTO `sys_role_menu` VALUES (2, 1043);
INSERT INTO `sys_role_menu` VALUES (2, 1044);
INSERT INTO `sys_role_menu` VALUES (2, 1045);
INSERT INTO `sys_role_menu` VALUES (2, 1046);
INSERT INTO `sys_role_menu` VALUES (2, 1047);
INSERT INTO `sys_role_menu` VALUES (2, 1048);
INSERT INTO `sys_role_menu` VALUES (2, 1049);
INSERT INTO `sys_role_menu` VALUES (2, 1050);
INSERT INTO `sys_role_menu` VALUES (2, 1051);
INSERT INTO `sys_role_menu` VALUES (2, 1052);
INSERT INTO `sys_role_menu` VALUES (2, 1053);
INSERT INTO `sys_role_menu` VALUES (2, 1054);
INSERT INTO `sys_role_menu` VALUES (2, 1055);
INSERT INTO `sys_role_menu` VALUES (2, 1056);
INSERT INTO `sys_role_menu` VALUES (2, 1057);
INSERT INTO `sys_role_menu` VALUES (2, 1058);
INSERT INTO `sys_role_menu` VALUES (2, 1059);
INSERT INTO `sys_role_menu` VALUES (2, 1060);
INSERT INTO `sys_role_menu` VALUES (100, 105);
INSERT INTO `sys_role_menu` VALUES (100, 1008);
INSERT INTO `sys_role_menu` VALUES (100, 1026);
INSERT INTO `sys_role_menu` VALUES (100, 2096);
INSERT INTO `sys_role_menu` VALUES (100, 2097);
INSERT INTO `sys_role_menu` VALUES (100, 2098);
INSERT INTO `sys_role_menu` VALUES (100, 2099);
INSERT INTO `sys_role_menu` VALUES (100, 2100);
INSERT INTO `sys_role_menu` VALUES (100, 2101);
INSERT INTO `sys_role_menu` VALUES (100, 2102);
INSERT INTO `sys_role_menu` VALUES (100, 2103);
INSERT INTO `sys_role_menu` VALUES (100, 2104);
INSERT INTO `sys_role_menu` VALUES (100, 2105);
INSERT INTO `sys_role_menu` VALUES (100, 2106);
INSERT INTO `sys_role_menu` VALUES (100, 2107);
INSERT INTO `sys_role_menu` VALUES (100, 2108);
INSERT INTO `sys_role_menu` VALUES (100, 2109);
INSERT INTO `sys_role_menu` VALUES (100, 2110);
INSERT INTO `sys_role_menu` VALUES (100, 2111);
INSERT INTO `sys_role_menu` VALUES (100, 2112);
INSERT INTO `sys_role_menu` VALUES (100, 2113);
INSERT INTO `sys_role_menu` VALUES (100, 2114);
INSERT INTO `sys_role_menu` VALUES (100, 2115);
INSERT INTO `sys_role_menu` VALUES (100, 2116);
INSERT INTO `sys_role_menu` VALUES (100, 2117);
INSERT INTO `sys_role_menu` VALUES (100, 2118);
INSERT INTO `sys_role_menu` VALUES (100, 2119);
INSERT INTO `sys_role_menu` VALUES (100, 2120);
INSERT INTO `sys_role_menu` VALUES (100, 2121);
INSERT INTO `sys_role_menu` VALUES (100, 2122);
INSERT INTO `sys_role_menu` VALUES (100, 2123);
INSERT INTO `sys_role_menu` VALUES (100, 2124);
INSERT INTO `sys_role_menu` VALUES (100, 2125);
INSERT INTO `sys_role_menu` VALUES (100, 2126);
INSERT INTO `sys_role_menu` VALUES (100, 2127);
INSERT INTO `sys_role_menu` VALUES (100, 2128);
INSERT INTO `sys_role_menu` VALUES (100, 2129);
INSERT INTO `sys_role_menu` VALUES (100, 2130);
INSERT INTO `sys_role_menu` VALUES (100, 2131);
INSERT INTO `sys_role_menu` VALUES (100, 2132);
INSERT INTO `sys_role_menu` VALUES (100, 2133);
INSERT INTO `sys_role_menu` VALUES (100, 2134);
INSERT INTO `sys_role_menu` VALUES (100, 2135);
INSERT INTO `sys_role_menu` VALUES (100, 2136);
INSERT INTO `sys_role_menu` VALUES (100, 2137);
INSERT INTO `sys_role_menu` VALUES (100, 2138);
INSERT INTO `sys_role_menu` VALUES (100, 2139);
INSERT INTO `sys_role_menu` VALUES (100, 2140);
INSERT INTO `sys_role_menu` VALUES (100, 2141);
INSERT INTO `sys_role_menu` VALUES (100, 2142);
INSERT INTO `sys_role_menu` VALUES (100, 2143);
INSERT INTO `sys_role_menu` VALUES (100, 2144);
INSERT INTO `sys_role_menu` VALUES (100, 2145);
INSERT INTO `sys_role_menu` VALUES (100, 2146);
INSERT INTO `sys_role_menu` VALUES (100, 2147);
INSERT INTO `sys_role_menu` VALUES (100, 2148);
INSERT INTO `sys_role_menu` VALUES (100, 2149);
INSERT INTO `sys_role_menu` VALUES (100, 2150);
INSERT INTO `sys_role_menu` VALUES (100, 2151);
INSERT INTO `sys_role_menu` VALUES (100, 2152);
INSERT INTO `sys_role_menu` VALUES (100, 2153);
INSERT INTO `sys_role_menu` VALUES (100, 2154);
INSERT INTO `sys_role_menu` VALUES (100, 2155);
INSERT INTO `sys_role_menu` VALUES (100, 2156);
INSERT INTO `sys_role_menu` VALUES (100, 2157);
INSERT INTO `sys_role_menu` VALUES (100, 2158);
INSERT INTO `sys_role_menu` VALUES (100, 2159);
INSERT INTO `sys_role_menu` VALUES (100, 2160);
INSERT INTO `sys_role_menu` VALUES (100, 2161);
INSERT INTO `sys_role_menu` VALUES (100, 2162);
INSERT INTO `sys_role_menu` VALUES (100, 2163);
INSERT INTO `sys_role_menu` VALUES (100, 2164);
INSERT INTO `sys_role_menu` VALUES (100, 2165);
INSERT INTO `sys_role_menu` VALUES (100, 2166);
INSERT INTO `sys_role_menu` VALUES (100, 2167);
INSERT INTO `sys_role_menu` VALUES (100, 2168);
INSERT INTO `sys_role_menu` VALUES (100, 2169);
INSERT INTO `sys_role_menu` VALUES (100, 2170);
INSERT INTO `sys_role_menu` VALUES (100, 2171);
INSERT INTO `sys_role_menu` VALUES (100, 2172);
INSERT INTO `sys_role_menu` VALUES (100, 2173);
INSERT INTO `sys_role_menu` VALUES (100, 2174);
INSERT INTO `sys_role_menu` VALUES (100, 2175);
INSERT INTO `sys_role_menu` VALUES (100, 2176);
INSERT INTO `sys_role_menu` VALUES (100, 2177);
INSERT INTO `sys_role_menu` VALUES (100, 2178);
INSERT INTO `sys_role_menu` VALUES (100, 2179);
INSERT INTO `sys_role_menu` VALUES (100, 2180);
INSERT INTO `sys_role_menu` VALUES (100, 2181);
INSERT INTO `sys_role_menu` VALUES (100, 2182);
INSERT INTO `sys_role_menu` VALUES (100, 2183);
INSERT INTO `sys_role_menu` VALUES (100, 2184);
INSERT INTO `sys_role_menu` VALUES (100, 2185);
INSERT INTO `sys_role_menu` VALUES (100, 2186);
INSERT INTO `sys_role_menu` VALUES (100, 2187);
INSERT INTO `sys_role_menu` VALUES (100, 2188);
INSERT INTO `sys_role_menu` VALUES (100, 2189);
INSERT INTO `sys_role_menu` VALUES (100, 2190);
INSERT INTO `sys_role_menu` VALUES (100, 2191);
INSERT INTO `sys_role_menu` VALUES (100, 2192);
INSERT INTO `sys_role_menu` VALUES (100, 2193);
INSERT INTO `sys_role_menu` VALUES (100, 2194);
INSERT INTO `sys_role_menu` VALUES (100, 2195);
INSERT INTO `sys_role_menu` VALUES (100, 2196);
INSERT INTO `sys_role_menu` VALUES (100, 2197);
INSERT INTO `sys_role_menu` VALUES (100, 2198);
INSERT INTO `sys_role_menu` VALUES (100, 2199);
INSERT INTO `sys_role_menu` VALUES (100, 2200);
INSERT INTO `sys_role_menu` VALUES (100, 2201);
INSERT INTO `sys_role_menu` VALUES (100, 2202);
INSERT INTO `sys_role_menu` VALUES (100, 2203);
INSERT INTO `sys_role_menu` VALUES (100, 2204);
INSERT INTO `sys_role_menu` VALUES (100, 2205);
INSERT INTO `sys_role_menu` VALUES (100, 2206);
INSERT INTO `sys_role_menu` VALUES (100, 2207);
INSERT INTO `sys_role_menu` VALUES (100, 2208);
INSERT INTO `sys_role_menu` VALUES (100, 2209);
INSERT INTO `sys_role_menu` VALUES (100, 2210);
INSERT INTO `sys_role_menu` VALUES (100, 2216);
INSERT INTO `sys_role_menu` VALUES (100, 2217);
INSERT INTO `sys_role_menu` VALUES (100, 2218);
INSERT INTO `sys_role_menu` VALUES (100, 2219);
INSERT INTO `sys_role_menu` VALUES (100, 2220);
INSERT INTO `sys_role_menu` VALUES (100, 2221);
INSERT INTO `sys_role_menu` VALUES (100, 2222);
INSERT INTO `sys_role_menu` VALUES (100, 2223);
INSERT INTO `sys_role_menu` VALUES (100, 2224);
INSERT INTO `sys_role_menu` VALUES (100, 2225);
INSERT INTO `sys_role_menu` VALUES (100, 2226);
INSERT INTO `sys_role_menu` VALUES (100, 2227);
INSERT INTO `sys_role_menu` VALUES (100, 2228);
INSERT INTO `sys_role_menu` VALUES (100, 2229);
INSERT INTO `sys_role_menu` VALUES (100, 2230);
INSERT INTO `sys_role_menu` VALUES (100, 2231);
INSERT INTO `sys_role_menu` VALUES (100, 2232);
INSERT INTO `sys_role_menu` VALUES (100, 2233);
INSERT INTO `sys_role_menu` VALUES (100, 2234);
INSERT INTO `sys_role_menu` VALUES (100, 2244);
INSERT INTO `sys_role_menu` VALUES (100, 2245);
INSERT INTO `sys_role_menu` VALUES (100, 2246);
INSERT INTO `sys_role_menu` VALUES (100, 2247);
INSERT INTO `sys_role_menu` VALUES (100, 2248);
INSERT INTO `sys_role_menu` VALUES (100, 2249);
INSERT INTO `sys_role_menu` VALUES (100, 2250);
INSERT INTO `sys_role_menu` VALUES (101, 1);
INSERT INTO `sys_role_menu` VALUES (101, 105);
INSERT INTO `sys_role_menu` VALUES (101, 1026);
INSERT INTO `sys_role_menu` VALUES (101, 2096);
INSERT INTO `sys_role_menu` VALUES (101, 2097);
INSERT INTO `sys_role_menu` VALUES (101, 2098);
INSERT INTO `sys_role_menu` VALUES (101, 2099);
INSERT INTO `sys_role_menu` VALUES (101, 2100);
INSERT INTO `sys_role_menu` VALUES (101, 2101);
INSERT INTO `sys_role_menu` VALUES (101, 2102);
INSERT INTO `sys_role_menu` VALUES (101, 2103);
INSERT INTO `sys_role_menu` VALUES (101, 2104);
INSERT INTO `sys_role_menu` VALUES (101, 2105);
INSERT INTO `sys_role_menu` VALUES (101, 2106);
INSERT INTO `sys_role_menu` VALUES (101, 2107);
INSERT INTO `sys_role_menu` VALUES (101, 2108);
INSERT INTO `sys_role_menu` VALUES (101, 2109);
INSERT INTO `sys_role_menu` VALUES (101, 2110);
INSERT INTO `sys_role_menu` VALUES (101, 2111);
INSERT INTO `sys_role_menu` VALUES (101, 2112);
INSERT INTO `sys_role_menu` VALUES (101, 2113);
INSERT INTO `sys_role_menu` VALUES (101, 2114);
INSERT INTO `sys_role_menu` VALUES (101, 2115);
INSERT INTO `sys_role_menu` VALUES (101, 2116);
INSERT INTO `sys_role_menu` VALUES (101, 2117);
INSERT INTO `sys_role_menu` VALUES (101, 2118);
INSERT INTO `sys_role_menu` VALUES (101, 2119);
INSERT INTO `sys_role_menu` VALUES (101, 2120);
INSERT INTO `sys_role_menu` VALUES (101, 2121);
INSERT INTO `sys_role_menu` VALUES (101, 2122);
INSERT INTO `sys_role_menu` VALUES (101, 2123);
INSERT INTO `sys_role_menu` VALUES (101, 2124);
INSERT INTO `sys_role_menu` VALUES (101, 2125);
INSERT INTO `sys_role_menu` VALUES (101, 2126);
INSERT INTO `sys_role_menu` VALUES (101, 2127);
INSERT INTO `sys_role_menu` VALUES (101, 2128);
INSERT INTO `sys_role_menu` VALUES (101, 2129);
INSERT INTO `sys_role_menu` VALUES (101, 2130);
INSERT INTO `sys_role_menu` VALUES (101, 2131);
INSERT INTO `sys_role_menu` VALUES (101, 2132);
INSERT INTO `sys_role_menu` VALUES (101, 2133);
INSERT INTO `sys_role_menu` VALUES (101, 2134);
INSERT INTO `sys_role_menu` VALUES (101, 2135);
INSERT INTO `sys_role_menu` VALUES (101, 2136);
INSERT INTO `sys_role_menu` VALUES (101, 2137);
INSERT INTO `sys_role_menu` VALUES (101, 2138);
INSERT INTO `sys_role_menu` VALUES (101, 2139);
INSERT INTO `sys_role_menu` VALUES (101, 2140);
INSERT INTO `sys_role_menu` VALUES (101, 2141);
INSERT INTO `sys_role_menu` VALUES (101, 2142);
INSERT INTO `sys_role_menu` VALUES (101, 2143);
INSERT INTO `sys_role_menu` VALUES (101, 2144);
INSERT INTO `sys_role_menu` VALUES (101, 2145);
INSERT INTO `sys_role_menu` VALUES (101, 2146);
INSERT INTO `sys_role_menu` VALUES (101, 2147);
INSERT INTO `sys_role_menu` VALUES (101, 2148);
INSERT INTO `sys_role_menu` VALUES (101, 2149);
INSERT INTO `sys_role_menu` VALUES (101, 2150);
INSERT INTO `sys_role_menu` VALUES (101, 2151);
INSERT INTO `sys_role_menu` VALUES (101, 2152);
INSERT INTO `sys_role_menu` VALUES (101, 2153);
INSERT INTO `sys_role_menu` VALUES (101, 2154);
INSERT INTO `sys_role_menu` VALUES (101, 2155);
INSERT INTO `sys_role_menu` VALUES (101, 2156);
INSERT INTO `sys_role_menu` VALUES (101, 2157);
INSERT INTO `sys_role_menu` VALUES (101, 2158);
INSERT INTO `sys_role_menu` VALUES (101, 2159);
INSERT INTO `sys_role_menu` VALUES (101, 2160);
INSERT INTO `sys_role_menu` VALUES (101, 2161);
INSERT INTO `sys_role_menu` VALUES (101, 2162);
INSERT INTO `sys_role_menu` VALUES (101, 2163);
INSERT INTO `sys_role_menu` VALUES (101, 2164);
INSERT INTO `sys_role_menu` VALUES (101, 2165);
INSERT INTO `sys_role_menu` VALUES (101, 2166);
INSERT INTO `sys_role_menu` VALUES (101, 2167);
INSERT INTO `sys_role_menu` VALUES (101, 2168);
INSERT INTO `sys_role_menu` VALUES (101, 2169);
INSERT INTO `sys_role_menu` VALUES (101, 2170);
INSERT INTO `sys_role_menu` VALUES (101, 2171);
INSERT INTO `sys_role_menu` VALUES (101, 2172);
INSERT INTO `sys_role_menu` VALUES (101, 2173);
INSERT INTO `sys_role_menu` VALUES (101, 2174);
INSERT INTO `sys_role_menu` VALUES (101, 2175);
INSERT INTO `sys_role_menu` VALUES (101, 2176);
INSERT INTO `sys_role_menu` VALUES (101, 2177);
INSERT INTO `sys_role_menu` VALUES (101, 2178);
INSERT INTO `sys_role_menu` VALUES (101, 2179);
INSERT INTO `sys_role_menu` VALUES (101, 2180);
INSERT INTO `sys_role_menu` VALUES (101, 2181);
INSERT INTO `sys_role_menu` VALUES (101, 2182);
INSERT INTO `sys_role_menu` VALUES (101, 2183);
INSERT INTO `sys_role_menu` VALUES (101, 2184);
INSERT INTO `sys_role_menu` VALUES (101, 2185);
INSERT INTO `sys_role_menu` VALUES (101, 2186);
INSERT INTO `sys_role_menu` VALUES (101, 2187);
INSERT INTO `sys_role_menu` VALUES (101, 2188);
INSERT INTO `sys_role_menu` VALUES (101, 2189);
INSERT INTO `sys_role_menu` VALUES (101, 2190);
INSERT INTO `sys_role_menu` VALUES (101, 2191);
INSERT INTO `sys_role_menu` VALUES (101, 2192);
INSERT INTO `sys_role_menu` VALUES (101, 2193);
INSERT INTO `sys_role_menu` VALUES (101, 2194);
INSERT INTO `sys_role_menu` VALUES (101, 2195);
INSERT INTO `sys_role_menu` VALUES (101, 2196);
INSERT INTO `sys_role_menu` VALUES (101, 2197);
INSERT INTO `sys_role_menu` VALUES (101, 2198);

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `user_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `dept_id` bigint(20) NULL DEFAULT NULL COMMENT '部门ID',
  `user_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户账号',
  `nick_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户昵称',
  `user_type` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '00' COMMENT '用户类型（00系统用户）',
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '用户邮箱',
  `phonenumber` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '手机号码',
  `sex` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '用户性别（0男 1女 2未知）',
  `avatar` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '头像地址',
  `password` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '密码',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '帐号状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `login_ip` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '最后登录IP',
  `login_date` datetime(0) NULL DEFAULT NULL COMMENT '最后登录时间',
  `create_by` bigint(20) NULL DEFAULT NULL COMMENT '创建者',
  `create_time` datetime(3) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` bigint(20) NULL DEFAULT NULL COMMENT '更新者',
  `update_time` datetime(3) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 119 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user
-- admin的密码是：admin123
-- ----------------------------
INSERT INTO `sys_user` VALUES (1, 103, 'admin', '若依', '00', 'ry@163.com', '15888888888', '1', '', '$2a$10$XTBg.o5w5/cHtvjRe5yy7eqSgvjWBKgztwp67wmWSx6ITKhN40rEq', '0', '0', '127.0.0.1', '2023-09-05 10:14:09', 1, '2022-06-17 17:20:19.000', NULL, '2023-09-05 18:14:05.000', '管理员');

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
INSERT INTO `sys_user_post` VALUES (115, 1);

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
INSERT INTO `sys_user_role` VALUES (113, 100);
INSERT INTO `sys_user_role` VALUES (114, 100);
INSERT INTO `sys_user_role` VALUES (115, 100);
INSERT INTO `sys_user_role` VALUES (118, 3);

-- ----------------------------
-- Table structure for wms_area
-- ----------------------------
DROP TABLE IF EXISTS `wms_area`;
CREATE TABLE `wms_area`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `area_no` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '编号',
  `area_name` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '名称',
  `warehouse_id` bigint(20) NOT NULL COMMENT '所属仓库ID',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `del_flag` tinyint(4) NOT NULL DEFAULT 0 COMMENT '删除标识',
  `create_by` bigint(20) NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(3) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` bigint(20) NULL DEFAULT NULL COMMENT '修改人',
  `update_time` datetime(3) NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 677 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '库区' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for wms_carrier
-- ----------------------------
DROP TABLE IF EXISTS `wms_carrier`;
CREATE TABLE `wms_carrier`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `carrier_no` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '编号',
  `carrier_name` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '名称',
  `address` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '地址',
  `mobile` varchar(13) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '手机号',
  `tel` varchar(13) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '座机号',
  `contact` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '联系人',
  `level` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '级别',
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'Email',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `del_flag` tinyint(4) NOT NULL DEFAULT 0 COMMENT '删除标识',
  `create_by` bigint(20) NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(3) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` bigint(20) NULL DEFAULT NULL COMMENT '修改人',
  `update_time` datetime(3) NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 49 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '承运商' ROW_FORMAT = Dynamic;


-- ----------------------------
-- Table structure for wms_customer
-- ----------------------------
DROP TABLE IF EXISTS `wms_customer`;
CREATE TABLE `wms_customer`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `customer_no` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '编号',
  `customer_name` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '名称',
  `bank_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '开户行',
  `bank_account` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '银行账户',
  `receivable_amount` decimal(10, 2) NULL DEFAULT 0.00 COMMENT '应收款',
  `address` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '地址',
  `mobile` varchar(13) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '手机号',
  `tel` varchar(13) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '座机号',
  `customer_person` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '联系人',
  `customer_level` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '级别',
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'Email',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `del_flag` tinyint(4) NOT NULL DEFAULT 0 COMMENT '删除标识',
  `create_by` bigint(20) NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(3) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` bigint(20) NULL DEFAULT NULL COMMENT '修改人',
  `update_time` datetime(3) NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 90 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '客户' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for wms_customer_transaction
-- ----------------------------
DROP TABLE IF EXISTS `wms_customer_transaction`;
CREATE TABLE `wms_customer_transaction`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `transaction_code` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '交易编号',
  `customer_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户编号',
  `transaction_type` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '交易类型  1：结款  2：应付 ',
  `transaction_amount` decimal(18, 2) NOT NULL COMMENT '交易金额',
  `previous_balance` decimal(18, 2) NOT NULL COMMENT '上期余额',
  `current_balance` decimal(18, 2) NOT NULL COMMENT '当前余额',
  `shipment_order_id` bigint(20) NULL DEFAULT NULL COMMENT '出库单号',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `del_flag` tinyint(4) NOT NULL DEFAULT 0 COMMENT '删除标志',
  `create_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `update_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 450 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '客户账户流水' ROW_FORMAT = Dynamic;


-- ----------------------------
-- Table structure for wms_delivery
-- ----------------------------
DROP TABLE IF EXISTS `wms_delivery`;
CREATE TABLE `wms_delivery`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `shipment_order_id` bigint(20) NULL DEFAULT NULL COMMENT '出库单主表Id',
  `carrier_id` bigint(20) NULL DEFAULT NULL COMMENT '承运商Id',
  `delivery_date` datetime(3) NULL DEFAULT NULL COMMENT '发货日期',
  `tracking_no` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '快递单号',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `del_flag` tinyint(4) NOT NULL DEFAULT 0 COMMENT '删除标识',
  `create_by` bigint(20) NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(3) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` bigint(20) NULL DEFAULT NULL COMMENT '修改人',
  `update_time` datetime(3) NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 156 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '发货记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for wms_inventory
-- ----------------------------
DROP TABLE IF EXISTS `wms_inventory`;
CREATE TABLE `wms_inventory`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `item_id` bigint(20) NOT NULL COMMENT '物料ID',
  `rack_id` bigint(20) NULL DEFAULT NULL COMMENT '货架id',
  `quantity` decimal(20, 2) NULL DEFAULT NULL COMMENT '库存',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `del_flag` tinyint(4) NOT NULL DEFAULT 0 COMMENT '删除标识',
  `create_by` bigint(20) NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(3) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` bigint(20) NULL DEFAULT NULL COMMENT '修改人',
  `update_time` datetime(3) NULL DEFAULT NULL COMMENT '修改时间',
  `warehouse_id` bigint(20) NULL DEFAULT NULL COMMENT '所属仓库',
  `area_id` bigint(20) NULL DEFAULT NULL COMMENT '所属库区',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 918 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '库存' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for wms_inventory_check
-- ----------------------------
DROP TABLE IF EXISTS `wms_inventory_check`;
CREATE TABLE `wms_inventory_check`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `inventory_check_no` varchar(22) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '库存盘点单号，系统自动生成',
  `inventory_check_type` int(11) NULL DEFAULT NULL COMMENT '库存盘点类型',
  `inventory_check_status` tinyint(4) NULL DEFAULT 11 COMMENT '库存盘点单状态11：盘点中 22：已完成',
  `inventory_check_total` decimal(20, 2) NULL DEFAULT NULL COMMENT '盈亏数',
  `check_status` tinyint(4) NULL DEFAULT NULL COMMENT '审核状态',
  `check_user_id` bigint(20) NULL DEFAULT NULL COMMENT '审核人',
  `check_time` datetime(3) NULL DEFAULT NULL COMMENT '审核时间',
  `warehouse_id` bigint(20) NULL DEFAULT NULL COMMENT '所属仓库',
  `area_id` bigint(20) NULL DEFAULT NULL COMMENT '所属库区',
  `rack_id` bigint(20) NULL DEFAULT NULL COMMENT '货架',
  `attachment` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '附件文件',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `del_flag` tinyint(4) NOT NULL DEFAULT 0 COMMENT '删除标识',
  `create_by` bigint(20) NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(3) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` bigint(20) NULL DEFAULT NULL COMMENT '修改人',
  `update_time` datetime(3) NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 340 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '库存盘点单据' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for wms_inventory_check_detail
-- ----------------------------
DROP TABLE IF EXISTS `wms_inventory_check_detail`;
CREATE TABLE `wms_inventory_check_detail`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `inventory_check_id` bigint(20) NULL DEFAULT NULL COMMENT '库存盘点单',
  `item_id` bigint(20) NOT NULL COMMENT '物料',
  `quantity` decimal(20, 2) NULL DEFAULT NULL COMMENT '库存数量',
  `check_quantity` decimal(20, 2) NULL DEFAULT NULL COMMENT '盘点数量',
  `warehouse_id` bigint(20) NULL DEFAULT NULL COMMENT '所属仓库',
  `area_id` bigint(20) NULL DEFAULT NULL COMMENT '所属库区',
  `rack_id` bigint(20) NULL DEFAULT NULL COMMENT '货架',
  `del_flag` tinyint(4) NOT NULL DEFAULT 0 COMMENT '删除标识',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `create_by` bigint(20) NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(3) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` bigint(20) NULL DEFAULT NULL COMMENT '修改人',
  `update_time` datetime(3) NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1157 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '库存盘点单据详情' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for wms_inventory_history
-- ----------------------------
DROP TABLE IF EXISTS `wms_inventory_history`;
CREATE TABLE `wms_inventory_history`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `form_id` bigint(20) NULL DEFAULT NULL COMMENT '操作id（出库、入库、库存移动表单id）',
  `form_type` int(11) NULL DEFAULT NULL COMMENT '操作类型',
  `item_id` bigint(20) NULL DEFAULT NULL COMMENT '物料ID',
  `rack_id` bigint(20) NULL DEFAULT NULL COMMENT '货架id',
  `quantity` decimal(20, 2) NULL DEFAULT NULL COMMENT '库存变化',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `del_flag` tinyint(4) NOT NULL DEFAULT 0 COMMENT '删除标识',
  `create_by` bigint(20) NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(3) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` bigint(20) NULL DEFAULT NULL COMMENT '修改人',
  `update_time` datetime(3) NULL DEFAULT NULL COMMENT '修改时间',
  `warehouse_id` bigint(20) NULL DEFAULT NULL COMMENT '所属仓库',
  `area_id` bigint(20) NULL DEFAULT NULL COMMENT '所属库区',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1845 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '库存记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for wms_inventory_movement
-- ----------------------------
DROP TABLE IF EXISTS `wms_inventory_movement`;
CREATE TABLE `wms_inventory_movement`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `inventory_movement_no` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '编号',
  `source_rack_id` bigint(20) NULL DEFAULT NULL COMMENT '原货架Id',
  `target_rack_id` bigint(20) NULL DEFAULT NULL COMMENT '目标货架',
  `status` tinyint(4) NULL DEFAULT NULL COMMENT '状态',
  `check_status` tinyint(4) NULL DEFAULT NULL COMMENT '审核状态',
  `check_user_id` bigint(20) NULL DEFAULT NULL COMMENT '审核人',
  `check_time` datetime(3) NULL DEFAULT NULL COMMENT '审核时间',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `del_flag` tinyint(4) NOT NULL DEFAULT 0 COMMENT '删除标识',
  `create_by` bigint(20) NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(3) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` bigint(20) NULL DEFAULT NULL COMMENT '修改人',
  `update_time` datetime(3) NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 236 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '库存移动' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for wms_inventory_movement_detail
-- ----------------------------
DROP TABLE IF EXISTS `wms_inventory_movement_detail`;
CREATE TABLE `wms_inventory_movement_detail`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `inventory_movement_id` bigint(20) NULL DEFAULT NULL COMMENT '库存移动Id',
  `item_id` bigint(20) NULL DEFAULT NULL COMMENT '物料',
  `plan_quantity` decimal(20, 2) NULL DEFAULT NULL COMMENT '计划数量',
  `real_quantity` decimal(20, 2) NULL DEFAULT NULL COMMENT '实际数量',
  `del_flag` tinyint(4) NOT NULL DEFAULT 0 COMMENT '删除标识',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `create_by` bigint(20) NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(3) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` bigint(20) NULL DEFAULT NULL COMMENT '修改人',
  `update_time` datetime(3) NULL DEFAULT NULL COMMENT '修改时间',
  `source_rack_id` bigint(20) NULL DEFAULT NULL COMMENT '源货架',
  `source_warehouse_id` bigint(20) NULL DEFAULT NULL COMMENT '源仓库',
  `source_area_id` bigint(20) NULL DEFAULT NULL COMMENT '源库区',
  `move_status` tinyint(4) NULL DEFAULT NULL COMMENT '移库状态',
  `target_rack_id` bigint(20) NULL DEFAULT NULL COMMENT '目标货架',
  `target_warehouse_id` bigint(20) NULL DEFAULT NULL COMMENT '目标仓库',
  `target_area_id` bigint(20) NULL DEFAULT NULL COMMENT '目标库区',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 496 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '库存移动详情' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for wms_inventory_settlement
-- ----------------------------
DROP TABLE IF EXISTS `wms_inventory_settlement`;
CREATE TABLE `wms_inventory_settlement`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `inventory_settlement_no` varchar(22) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '库存结算单号',
  `inventory_settlement_status` tinyint(4) NULL DEFAULT 11 COMMENT '库存结算单状态11：结算中 22：已完成',
  `inventory_settlement_start_time` datetime(0) NULL DEFAULT NULL COMMENT '库存结算周期开始时间',
  `inventory_settlement_end_time` datetime(0) NULL DEFAULT NULL COMMENT '库存结算周期结束时间',
  `settlement_type` int(11) NOT NULL COMMENT '结算类型,1:月结，2:年结',
  `del_flag` tinyint(4) NOT NULL DEFAULT 0 COMMENT '删除标识',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `create_by` bigint(20) NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(3) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` bigint(20) NULL DEFAULT NULL COMMENT '修改人',
  `update_time` datetime(3) NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '库存结算单' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for wms_inventory_settlement_detail
-- ----------------------------
DROP TABLE IF EXISTS `wms_inventory_settlement_detail`;
CREATE TABLE `wms_inventory_settlement_detail`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `settlement_id` bigint(20) NOT NULL COMMENT '结算单id',
  `settlement_type` int(11) NULL DEFAULT NULL COMMENT '结算类型,1:月结，2:年结',
  `item_id` bigint(20) NOT NULL COMMENT '物料id',
  `item_no` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '编号',
  `item_name` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '名称',
  `warehouse_id` bigint(20) NULL DEFAULT NULL COMMENT '仓库id',
  `warehouse_no` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '仓库编号',
  `warehouse_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '仓库名称',
  `area_id` bigint(20) NULL DEFAULT NULL COMMENT '库区id',
  `area_no` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '库区编号',
  `area_name` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '库区名称',
  `previous_balance` decimal(20, 2) NULL DEFAULT NULL COMMENT '上期结存',
  `current_enter` decimal(20, 2) NULL DEFAULT NULL COMMENT '本期入库',
  `current_out` decimal(20, 2) NULL DEFAULT NULL COMMENT '本期出库',
  `current_check` decimal(20, 2) NULL DEFAULT NULL COMMENT '本期盘点',
  `current_balance` decimal(20, 2) NULL DEFAULT NULL COMMENT '本期结存',
  `del_flag` tinyint(4) NOT NULL DEFAULT 0 COMMENT '删除标识',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `create_by` bigint(20) NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(3) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` bigint(20) NULL DEFAULT NULL COMMENT '修改人',
  `update_time` datetime(3) NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3188 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '库存结算明细' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for wms_item
-- ----------------------------
DROP TABLE IF EXISTS `wms_item`;
CREATE TABLE `wms_item`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `item_no` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '编号',
  `item_name` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '名称',
  `specification` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '规格',
  `item_type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '分类',
  `unit` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '单位类别',
  `unit_price` decimal(10, 2) NULL DEFAULT NULL COMMENT '单价',
  `rack_id` bigint(20) NULL DEFAULT NULL COMMENT '所属货架',
  `area_id` bigint(20) NULL DEFAULT NULL COMMENT '所属库区',
  `warehouse_id` bigint(20) NULL DEFAULT NULL COMMENT '所属仓库',
  `quantity` decimal(20, 2) NULL DEFAULT NULL COMMENT '安全库存',
  `production_date` datetime(3) NULL DEFAULT NULL COMMENT '生产日期',
  `expiry_date` datetime(3) NULL DEFAULT NULL COMMENT '有效期',
  `batch` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '批次',
  `del_flag` tinyint(4) NOT NULL DEFAULT 0 COMMENT '删除标识',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `create_by` bigint(20) NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(3) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` bigint(20) NULL DEFAULT NULL COMMENT '修改人',
  `update_time` datetime(3) NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 417 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '物料' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for wms_item_type
-- ----------------------------
DROP TABLE IF EXISTS `wms_item_type`;
CREATE TABLE `wms_item_type`  (
  `item_type_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '物料类型id',
  `parent_id` bigint(20) NULL DEFAULT 0 COMMENT '父物料类型id',
  `ancestors` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '祖级列表',
  `type_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '物料类型名称',
  `order_num` int(11) NULL DEFAULT 0 COMMENT '显示顺序',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '物料类型状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` bigint(20) NULL DEFAULT NULL COMMENT '创建者',
  `create_time` datetime(3) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` bigint(20) NULL DEFAULT NULL COMMENT '更新者',
  `update_time` datetime(3) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`item_type_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 442 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '物料类型表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for wms_rack
-- ----------------------------
DROP TABLE IF EXISTS `wms_rack`;
CREATE TABLE `wms_rack`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `rack_no` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '编号',
  `rack_name` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '名称',
  `area_id` bigint(20) NOT NULL COMMENT '所属库区',
  `warehouse_id` bigint(20) NOT NULL COMMENT '所属仓库',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `del_flag` tinyint(4) NOT NULL DEFAULT 0 COMMENT '删除标识',
  `create_by` bigint(20) NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(3) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` bigint(20) NULL DEFAULT NULL COMMENT '修改人',
  `update_time` datetime(3) NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 128 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '货架' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for wms_receipt_order
-- ----------------------------
DROP TABLE IF EXISTS `wms_receipt_order`;
CREATE TABLE `wms_receipt_order`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `receipt_order_no` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '入库单号',
  `receipt_order_type` int(11) NULL DEFAULT NULL COMMENT '入库类型',
  `supplier_id` bigint(20) NULL DEFAULT NULL COMMENT '供应商',
  `order_no` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '订单号',
  `payable_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '订单金额',
  `receipt_order_status` tinyint(4) NULL DEFAULT NULL COMMENT '入库状态',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `del_flag` tinyint(4) NOT NULL DEFAULT 0 COMMENT '删除标识',
  `create_by` bigint(20) NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(3) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` bigint(20) NULL DEFAULT NULL COMMENT '修改人',
  `update_time` datetime(3) NULL DEFAULT NULL COMMENT '修改时间',
  `wave_no` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '波次号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1406 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '入库单' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for wms_receipt_order_detail
-- ----------------------------
DROP TABLE IF EXISTS `wms_receipt_order_detail`;
CREATE TABLE `wms_receipt_order_detail`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `receipt_order_id` bigint(20) NULL DEFAULT NULL COMMENT '入库单号',
  `item_id` bigint(20) NULL DEFAULT NULL COMMENT '物料',
  `plan_quantity` decimal(20, 2) NULL DEFAULT NULL COMMENT '计划数量',
  `real_quantity` decimal(20, 2) NULL DEFAULT NULL COMMENT '实际数量',
  `rack_id` bigint(20) NULL DEFAULT NULL COMMENT '所属货架',
  `money` decimal(10, 2) NULL DEFAULT NULL COMMENT '金额',
  `del_flag` tinyint(4) NOT NULL DEFAULT 0 COMMENT '删除标识',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `create_by` bigint(20) NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(3) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` bigint(20) NULL DEFAULT NULL COMMENT '修改人',
  `update_time` datetime(3) NULL DEFAULT NULL COMMENT '修改时间',
  `warehouse_id` bigint(20) NULL DEFAULT NULL COMMENT '所属仓库',
  `area_id` bigint(20) NULL DEFAULT NULL COMMENT '所属库区',
  `receipt_order_status` tinyint(4) NULL DEFAULT NULL COMMENT '入库状态',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6044 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '入库单详情' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for wms_shipment_order
-- ----------------------------
DROP TABLE IF EXISTS `wms_shipment_order`;
CREATE TABLE `wms_shipment_order`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `shipment_order_no` varchar(22) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '出库单号，系统自动生成',
  `shipment_order_type` int(11) NULL DEFAULT NULL COMMENT '出库类型',
  `order_no` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '出库订单',
  `customer_id` bigint(20) NULL DEFAULT NULL COMMENT '客户',
  `receivable_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '订单金额',
  `shipment_order_status` tinyint(4) NULL DEFAULT NULL COMMENT '出库单状态',
  `check_status` tinyint(4) NULL DEFAULT NULL COMMENT '审核状态',
  `check_user_id` bigint(20) NULL DEFAULT NULL COMMENT '审核人',
  `check_time` datetime(3) NULL DEFAULT NULL COMMENT '审核时间',
  `wave_no` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '波次号',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `del_flag` tinyint(4) NOT NULL DEFAULT 0 COMMENT '删除标识',
  `create_by` bigint(20) NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(3) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` bigint(20) NULL DEFAULT NULL COMMENT '修改人',
  `update_time` datetime(3) NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 580 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '出库单' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for wms_shipment_order_detail
-- ----------------------------
DROP TABLE IF EXISTS `wms_shipment_order_detail`;
CREATE TABLE `wms_shipment_order_detail`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `shipment_order_id` bigint(20) NULL DEFAULT NULL COMMENT '出库单',
  `item_id` bigint(20) NULL DEFAULT NULL COMMENT '物料',
  `plan_quantity` decimal(20, 2) NULL DEFAULT NULL COMMENT '计划数量',
  `real_quantity` decimal(20, 2) NULL DEFAULT NULL COMMENT '实际数量',
  `rack_id` bigint(20) NULL DEFAULT NULL COMMENT '货架',
  `money` decimal(10, 2) NULL DEFAULT NULL COMMENT '金额',
  `del_flag` tinyint(4) NOT NULL DEFAULT 0 COMMENT '删除标识',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `create_by` bigint(20) NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(3) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` bigint(20) NULL DEFAULT NULL COMMENT '修改人',
  `update_time` datetime(3) NULL DEFAULT NULL COMMENT '修改时间',
  `warehouse_id` bigint(20) NULL DEFAULT NULL COMMENT '所属仓库',
  `area_id` bigint(20) NULL DEFAULT NULL COMMENT '所属库区',
  `shipment_order_status` tinyint(4) NULL DEFAULT NULL COMMENT '出库状态',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2308 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '出库单详情' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for wms_supplier
-- ----------------------------
DROP TABLE IF EXISTS `wms_supplier`;
CREATE TABLE `wms_supplier`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `supplier_no` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '编号',
  `supplier_name` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '名称',
  `bank_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '开户行',
  `bank_account` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '银行账户',
  `payable_amount` decimal(10, 2) NULL DEFAULT 0.00 COMMENT '应付款',
  `address` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '地址',
  `mobile_no` varchar(13) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '手机号',
  `tel_no` varchar(13) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '座机号',
  `contact` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '联系人',
  `level` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '级别',
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'Email',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `del_flag` tinyint(4) NOT NULL DEFAULT 0 COMMENT '删除标识',
  `create_by` bigint(20) NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(3) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` bigint(20) NULL DEFAULT NULL COMMENT '修改人',
  `update_time` datetime(3) NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 118 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '供应商' ROW_FORMAT = Dynamic;


-- ----------------------------
-- Table structure for wms_supplier_transaction
-- ----------------------------
DROP TABLE IF EXISTS `wms_supplier_transaction`;
CREATE TABLE `wms_supplier_transaction`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `transaction_code` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '交易编号',
  `supplier_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '供应商编号',
  `transaction_type` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '交易类型  1：结款  2：应付 ',
  `transaction_amount` decimal(18, 2) NOT NULL COMMENT '交易金额',
  `previous_balance` decimal(18, 2) NOT NULL COMMENT '上期余额',
  `current_balance` decimal(18, 2) NOT NULL COMMENT '当前余额',
  `receipt_order_id` bigint(20) NULL DEFAULT NULL COMMENT '入库单号',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `del_flag` tinyint(4) NOT NULL DEFAULT 0 COMMENT '删除标志',
  `create_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `update_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 834 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '供应商账户流水' ROW_FORMAT = Dynamic;


-- ----------------------------
-- Table structure for wms_warehouse
-- ----------------------------
DROP TABLE IF EXISTS `wms_warehouse`;
CREATE TABLE `wms_warehouse`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `warehouse_no` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '编号',
  `warehouse_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '名称',
  `del_flag` tinyint(4) NOT NULL DEFAULT 0 COMMENT '删除标识',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `create_by` bigint(20) NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(3) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` bigint(20) NULL DEFAULT NULL COMMENT '修改人',
  `update_time` datetime(3) NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 559 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '仓库' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for wms_wave
-- ----------------------------
DROP TABLE IF EXISTS `wms_wave`;
CREATE TABLE `wms_wave`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `wave_no` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '波次号',
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '状态',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `del_flag` tinyint(4) NOT NULL DEFAULT 0 COMMENT '删除标识',
  `create_by` bigint(20) NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(3) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` bigint(20) NULL DEFAULT NULL COMMENT '修改人',
  `update_time` datetime(3) NULL DEFAULT NULL COMMENT '修改时间',
  `type` int(255) NULL DEFAULT 2 COMMENT '1：入库单  2：出库单',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 106 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '波次' ROW_FORMAT = Dynamic;


SET FOREIGN_KEY_CHECKS = 1;
