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
) ENGINE = InnoDB AUTO_INCREMENT = 920 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '代码生成业务表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of gen_table
-- ----------------------------
INSERT INTO `gen_table` VALUES (865, 'wms_inventory_history', '库存记录', NULL, NULL, 'WmsInventoryHistory', 'crud', 'com.cyl.wms', 'wms', 'wmsInventoryHistory', '库存记录', 'feijinping', '0', '/', NULL, -1, '2022-10-10 21:08:55', NULL, NULL, NULL);
INSERT INTO `gen_table` VALUES (866, 'wms_inventory', '库存', NULL, NULL, 'WmsInventory', 'crud', 'com.cyl.wms', 'wms', 'wmsInventory', '库存', 'feijinping', '0', '/', NULL, -1, '2022-10-10 22:30:47', NULL, NULL, NULL);
INSERT INTO `gen_table` VALUES (908, 'test', 'test', NULL, NULL, 'Test', 'crud', 'com.cyl.demo', 'demo', 'test', 'test', 'shelly', '1', '/', '{}', 1, '2022-12-01 11:28:35', NULL, '2022-12-01 11:29:24.000', NULL);

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
) ENGINE = InnoDB AUTO_INCREMENT = 11628 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '代码生成业务表字段' ROW_FORMAT = Dynamic;

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
) ENGINE = InnoDB AUTO_INCREMENT = 144 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '字典数据表' ROW_FORMAT = Dynamic;

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
INSERT INTO `sys_dict_data` VALUES (139, 1, '盘盈入库', '32', 'wms_check_type', NULL, 'default', 'N', '0', 1, '2023-07-25 05:30:29.000', NULL, NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (140, 0, '盘亏出库', '31', 'wms_check_type', NULL, 'default', 'N', '0', 1, '2023-07-25 05:30:52.000', NULL, NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (141, 0, '仓库', '5', 'wms_inventory_panel_type', NULL, 'default', 'N', '0', 1, '2023-07-28 07:15:00.000', NULL, NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (142, 1, '库区', '10', 'wms_inventory_panel_type', NULL, 'default', 'N', '0', 1, '2023-07-28 07:15:10.000', NULL, NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (143, 2, '物料类型', '15', 'wms_inventory_panel_type', NULL, 'default', 'N', '0', 1, '2023-07-28 07:17:54.000', NULL, NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (144, 3, '物料', '20', 'wms_inventory_panel_type', NULL, 'default', 'N', '0', 1, '2023-07-28 07:18:05.000', NULL, NULL, NULL);
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
) ENGINE = InnoDB AUTO_INCREMENT = 113 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '字典类型表' ROW_FORMAT = Dynamic;

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
INSERT INTO `sys_dict_type` VALUES (112, '盘点类型', 'wms_check_type', '0', 1, '2023-07-25 05:29:44.000', NULL, NULL, NULL);
INSERT INTO `sys_dict_type` VALUES (113, '库存看板类型', 'wms_inventory_panel_type', '0', 1, '2023-07-28 07:12:50.000', NULL, NULL, NULL);

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
) ENGINE = InnoDB AUTO_INCREMENT = 920 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '系统访问记录' ROW_FORMAT = Dynamic;

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
) ENGINE = InnoDB AUTO_INCREMENT = 2235 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '菜单权限表' ROW_FORMAT = Dynamic;

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
INSERT INTO `sys_menu` VALUES (501, '登录日志', 108, 2, 'logininfor', 'monitor/logininfor/index', '', 1, 0, 'C', '0', '0', 'monitor:logininfor:list', 'logininfor', 1, '2022-06-17 17:20:21.000', NULL, NULL, '登录日志菜单');
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
INSERT INTO `sys_menu` VALUES (2120, '库存看板', 2197, 3, 'inventory', 'wms/inventory/index', NULL, 1, 0, 'C', '0', '0', 'wms:inventory:list', '#', 1, '2022-07-29 16:34:37.000', 1, '2022-10-30 22:09:10.000', '库存菜单');
INSERT INTO `sys_menu` VALUES (2121, '库存查询', 2120, 1, '', '', NULL, 1, 0, 'F', '0', '0', 'wms:inventory:query', '#', 1, '2022-07-29 16:34:37.000', 0, NULL, '');
INSERT INTO `sys_menu` VALUES (2122, '库存新增', 2120, 2, '', '', NULL, 1, 0, 'F', '0', '0', 'wms:inventory:add', '#', 1, '2022-07-29 16:34:37.000', 0, NULL, '');
INSERT INTO `sys_menu` VALUES (2123, '库存修改', 2120, 3, '', '', NULL, 1, 0, 'F', '0', '0', 'wms:inventory:edit', '#', 1, '2022-07-29 16:34:37.000', 0, NULL, '');
INSERT INTO `sys_menu` VALUES (2124, '库存删除', 2120, 4, '', '', NULL, 1, 0, 'F', '0', '0', 'wms:inventory:remove', '#', 1, '2022-07-29 16:34:37.000', 0, NULL, '');
INSERT INTO `sys_menu` VALUES (2125, '库存导出', 2120, 5, '', '', NULL, 1, 0, 'F', '0', '0', 'wms:inventory:export', '#', 1, '2022-07-29 16:34:37.000', 0, NULL, '');
INSERT INTO `sys_menu` VALUES (2126, '库存记录', 2197, 4, 'inventoryHistory', 'wms/inventoryHistory/index', NULL, 1, 0, 'C', '0', '0', 'wms:inventoryHistory:list', '#', 1, '2022-07-29 16:34:45.000', 1, '2022-10-30 22:09:40.000', '库存记录菜单');
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
INSERT INTO `sys_menu` VALUES (2144, '物料', 0, 2, 'item', '', NULL, 1, 0, 'M', '0', '0', '', 'shopping', 1, '2022-07-29 16:35:13.000', 1, '2023-04-26 17:39:30.000', '物料菜单');
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
INSERT INTO `sys_menu` VALUES (2186, '仓库/库区', 0, 1, 'warehouse', 'wms/warehouse/index', NULL, 1, 0, 'C', '0', '0', 'wms:warehouse:list', 'component', 1, '2022-07-29 16:36:31.000', 1, '2023-04-26 10:45:58.000', '仓库菜单');
INSERT INTO `sys_menu` VALUES (2187, '仓库查询', 2186, 1, '', '', NULL, 1, 0, 'F', '0', '0', 'wms:warehouse:query', '#', 1, '2022-07-29 16:36:31.000', 0, NULL, '');
INSERT INTO `sys_menu` VALUES (2188, '仓库新增', 2186, 2, '', '', NULL, 1, 0, 'F', '0', '0', 'wms:warehouse:add', '#', 1, '2022-07-29 16:36:31.000', 0, NULL, '');
INSERT INTO `sys_menu` VALUES (2189, '仓库修改', 2186, 3, '', '', NULL, 1, 0, 'F', '0', '0', 'wms:warehouse:edit', '#', 1, '2022-07-29 16:36:31.000', 0, NULL, '');
INSERT INTO `sys_menu` VALUES (2190, '仓库删除', 2186, 4, '', '', NULL, 1, 0, 'F', '0', '0', 'wms:warehouse:remove', '#', 1, '2022-07-29 16:36:31.000', 0, NULL, '');
INSERT INTO `sys_menu` VALUES (2191, '仓库导出', 2186, 5, '', '', NULL, 1, 0, 'F', '0', '0', 'wms:warehouse:export', '#', 1, '2022-07-29 16:36:31.000', 0, NULL, '');
INSERT INTO `sys_menu` VALUES (2192, '出入库', 0, 4, 'wms', NULL, NULL, 1, 0, 'M', '0', '0', '', 'redis', 1, '2022-07-29 18:09:52.000', 1, '2022-10-31 09:11:33.000', '');
INSERT INTO `sys_menu` VALUES (2193, '仓库/库区/货架', 0, 1, 'basic', NULL, NULL, 1, 0, 'M', '1', '0', '', 'component', 1, '2022-08-09 08:57:46.000', 1, '2023-04-26 10:46:05.000', '');
INSERT INTO `sys_menu` VALUES (2194, '发货/入库', 2192, 2, 'receiptOrder/status', 'wms/receiptOrder/status', NULL, 1, 0, 'C', '1', '0', 'wms:receiptOrder:status', '#', 1, '2022-09-27 14:16:42.000', 1, '2022-09-27 14:17:19.000', '');
INSERT INTO `sys_menu` VALUES (2195, '编辑出库单', 2192, 2, 'shipmentOrder/edit', 'wms/shipmentOrder/edit', NULL, 1, 0, 'C', '1', '0', 'wms:shipmentOrder:add', '#', 1, '2022-10-20 16:38:26.000', 1, '2022-10-24 18:47:03.000', '');
INSERT INTO `sys_menu` VALUES (2196, '发货/出库', 2192, 2, 'shipmentOrder/status', 'wms/shipmentOrder/status', NULL, 1, 0, 'C', '1', '0', 'wms:shipmentOrder:status', '#', 1, '2022-10-20 18:25:10.000', 1, '2022-10-24 18:47:15.000', '');
INSERT INTO `sys_menu` VALUES (2197, '报表', 0, 6, 'report', NULL, NULL, 1, 0, 'M', '0', '0', '', 'chart', 1, '2022-10-30 22:08:28.000', 1, '2023-04-26 14:19:18.000', '');
INSERT INTO `sys_menu` VALUES (2198, '客户/供应商/承运商', 0, 3, 'relation', NULL, NULL, 1, 0, 'M', '0', '0', NULL, 'peoples', 1, '2022-10-30 22:20:24.000', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (2199, '编辑移库', 2192, 3, 'inventoryMovement/edit', 'wms/inventoryMovement/edit', NULL, 1, 0, 'C', '1', '0', 'wms:inventoryMovement:edit', '#', 1, '2022-11-02 15:13:46.000', 1, '2022-11-02 15:14:49.000', '');
INSERT INTO `sys_menu` VALUES (2200, '移库操作', 2192, 4, 'inventoryMovement/status', 'wms/inventoryMovement/status', NULL, 1, 0, 'C', '1', '0', 'wms:inventoryMovement:status', '#', 1, '2022-11-02 15:15:57.000', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (2201, '库存盘点', 0, 10, 'inventoryCheck', 'wms/inventoryCheck/index', NULL, 1, 0, 'C', '0', '0', 'wms:inventoryCheck:list', 'example', 1, '2023-04-20 13:24:37.000', NULL, NULL, '');
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
) ENGINE = InnoDB AUTO_INCREMENT = 876 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '操作日志记录' ROW_FORMAT = Dynamic;

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
INSERT INTO `sys_role` VALUES (100, '普通用户', 'common', 2, '2', 0, 0, '0', '0', NULL, '2022-06-20 09:52:16', 1, '2023-05-04 22:37:22.000', NULL);
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
INSERT INTO `sys_role_menu` VALUES (100, 1);
INSERT INTO `sys_role_menu` VALUES (100, 100);
INSERT INTO `sys_role_menu` VALUES (100, 101);
INSERT INTO `sys_role_menu` VALUES (100, 103);
INSERT INTO `sys_role_menu` VALUES (100, 104);
INSERT INTO `sys_role_menu` VALUES (100, 105);
INSERT INTO `sys_role_menu` VALUES (100, 107);
INSERT INTO `sys_role_menu` VALUES (100, 108);
INSERT INTO `sys_role_menu` VALUES (100, 500);
INSERT INTO `sys_role_menu` VALUES (100, 501);
INSERT INTO `sys_role_menu` VALUES (100, 1001);
INSERT INTO `sys_role_menu` VALUES (100, 1008);
INSERT INTO `sys_role_menu` VALUES (100, 1017);
INSERT INTO `sys_role_menu` VALUES (100, 1021);
INSERT INTO `sys_role_menu` VALUES (100, 1026);
INSERT INTO `sys_role_menu` VALUES (100, 1036);
INSERT INTO `sys_role_menu` VALUES (100, 1040);
INSERT INTO `sys_role_menu` VALUES (100, 1043);
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
) ENGINE = InnoDB AUTO_INCREMENT = 117 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user admin 密码和cyl一样
-- ----------------------------
BEGIN;
INSERT INTO `sys_user` (`user_id`, `dept_id`, `user_name`, `nick_name`, `user_type`, `email`, `phonenumber`, `sex`, `avatar`, `password`, `status`, `del_flag`, `login_ip`, `login_date`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1, 103, 'admin', '若依', '00', 'ry@163.com', '15888888888', '1', '', '$2a$10$f/LxZ5IyZTuArQyKDhSzbOB17dDiGzV.BSmbPcVVU62I2ryPhP82m', '0', '0', '127.0.0.1', '2023-03-30 12:43:20', 1, '2022-06-17 17:20:19.000', NULL, '2023-03-30 12:43:20.000', '管理员');
INSERT INTO `sys_user` (`user_id`, `dept_id`, `user_name`, `nick_name`, `user_type`, `email`, `phonenumber`, `sex`, `avatar`, `password`, `status`, `del_flag`, `login_ip`, `login_date`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (115, 100, 'cyl', 'cyl', '00', '', '', '0', '', '$2a$10$f/LxZ5IyZTuArQyKDhSzbOB17dDiGzV.BSmbPcVVU62I2ryPhP82m', '0', '0', '127.0.0.1', '2023-03-30 12:43:59', 1, '2022-11-04 17:06:20.000', 1, '2023-03-30 12:43:58.000', NULL);
COMMIT;

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
) ENGINE = InnoDB AUTO_INCREMENT = 222 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '库区' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wms_area
-- ----------------------------
INSERT INTO `wms_area` VALUES (2, '1', '1', 1, NULL, 1, 1, '2022-08-04 11:31:25.475', NULL, NULL);
INSERT INTO `wms_area` VALUES (3, '2', '1', 2, NULL, 1, 1, '2022-08-04 11:31:40.840', NULL, NULL);
INSERT INTO `wms_area` VALUES (4, '22', '222', 22, '2222', 1, 1, '2022-08-04 11:33:31.133', NULL, NULL);
INSERT INTO `wms_area` VALUES (5, '1', '1', 1, NULL, 1, 1, '2022-08-04 15:18:04.047', NULL, NULL);
INSERT INTO `wms_area` VALUES (6, '2', '2', 2, NULL, 1, 1, '2022-08-04 15:18:10.829', NULL, NULL);
INSERT INTO `wms_area` VALUES (7, '1', '2', 2, NULL, 1, 1, '2022-08-04 16:01:26.000', NULL, NULL);
INSERT INTO `wms_area` VALUES (8, '11', '11', 11, NULL, 1, 1, '2022-08-04 18:24:36.594', NULL, NULL);
INSERT INTO `wms_area` VALUES (9, '1', '1', 1, NULL, 1, 1, '2022-08-05 16:24:00.949', NULL, NULL);
INSERT INTO `wms_area` VALUES (10, '2', '2', 2, NULL, 1, 1, '2022-08-05 16:24:06.854', NULL, NULL);
INSERT INTO `wms_area` VALUES (11, '1', '1', 1, NULL, 1, 1, '2022-08-05 16:52:10.332', NULL, NULL);
INSERT INTO `wms_area` VALUES (12, '2', '2', 2, NULL, 1, 1, '2022-08-05 16:52:17.457', NULL, NULL);
INSERT INTO `wms_area` VALUES (13, 'suzhouxi', '苏州西', 4, 'suzhouxi', 1, 1, '2022-08-05 17:00:56.000', 115, '2022-11-10 13:53:18.044');
INSERT INTO `wms_area` VALUES (14, 'shanghainan', '上海南', 4, NULL, 1, 1, '2022-08-09 11:05:53.000', 115, '2022-11-10 13:53:26.127');
INSERT INTO `wms_area` VALUES (15, '877', '苏州东', 14, NULL, 1, 1, '2022-08-09 11:07:10.000', 115, '2022-11-10 13:53:32.045');
INSERT INTO `wms_area` VALUES (16, 'shx', '上海西', 14, NULL, 1, 1, '2022-08-09 16:49:57.000', 115, '2022-11-10 13:53:36.751');
INSERT INTO `wms_area` VALUES (17, '23', '南京北', 2, NULL, 1, 1, '2022-08-09 16:50:07.892', NULL, NULL);
INSERT INTO `wms_area` VALUES (18, '45', '南京西', 2, NULL, 1, 1, '2022-08-09 16:50:19.181', NULL, NULL);
INSERT INTO `wms_area` VALUES (19, '111', '111', 5, '111', 1, 1, '2022-08-29 12:09:38.000', 1, '2022-08-29 12:09:45.421');
INSERT INTO `wms_area` VALUES (20, 'sz11', '苏州中', 14, NULL, 1, 1, '2022-11-01 14:15:05.000', 115, '2022-11-10 13:53:46.718');
INSERT INTO `wms_area` VALUES (22, 'test1102', 'test', 1, NULL, 1, NULL, '2022-11-02 11:28:08.857', NULL, NULL);
INSERT INTO `wms_area` VALUES (23, 'test1102', 'test2', 1, NULL, 1, NULL, '2022-11-02 13:52:34.796', NULL, NULL);
INSERT INTO `wms_area` VALUES (24, 'test1102', 'test2', 1, NULL, 1, NULL, '2022-11-02 13:55:24.365', NULL, NULL);
INSERT INTO `wms_area` VALUES (25, 'test1102', 'test2', 1, NULL, 1, NULL, '2022-11-02 13:59:14.964', NULL, NULL);
INSERT INTO `wms_area` VALUES (26, 'test1102', 'test2', 1, NULL, 1, NULL, '2022-11-02 14:10:05.488', NULL, NULL);
INSERT INTO `wms_area` VALUES (35, 'test1102', 'test2', 1, NULL, 1, NULL, '2022-11-02 14:31:49.176', NULL, NULL);
INSERT INTO `wms_area` VALUES (36, 'test1102', 'test2', 1, NULL, 1, NULL, '2022-11-02 14:31:49.176', NULL, NULL);
INSERT INTO `wms_area` VALUES (39, 'test1102', 'test2', 1, NULL, 1, NULL, '2022-11-02 14:58:27.596', NULL, NULL);
INSERT INTO `wms_area` VALUES (40, 'test1102', 'test2', 1, NULL, 1, NULL, '2022-11-02 14:58:27.596', NULL, NULL);
INSERT INTO `wms_area` VALUES (41, '001', '贵阳区', 20, NULL, 1, 115, '2022-11-07 21:38:14.243', NULL, NULL);
INSERT INTO `wms_area` VALUES (42, '002', '贵安区', 20, NULL, 1, 115, '2022-11-07 21:38:28.434', NULL, NULL);
INSERT INTO `wms_area` VALUES (43, '1-001', '库区1-A', 21, NULL, 1, 115, '2022-11-11 17:03:21.000', 115, '2022-11-11 17:04:29.842');
INSERT INTO `wms_area` VALUES (44, '1-002', '库区1-B', 2, NULL, 1, 115, '2022-11-11 17:03:33.000', 115, '2022-11-15 09:54:54.155');
INSERT INTO `wms_area` VALUES (45, '1-003', '库区1-C', 4, NULL, 1, 115, '2022-11-11 17:03:45.000', 115, '2022-12-04 15:36:49.766');
INSERT INTO `wms_area` VALUES (46, '1-003', '库区2-A', 14, NULL, 1, 115, '2022-11-11 17:04:56.000', 115, '2022-11-29 17:05:54.445');
INSERT INTO `wms_area` VALUES (47, '3-001', '库区3-A', 23, NULL, 1, 115, '2022-11-11 17:05:06.344', NULL, NULL);
INSERT INTO `wms_area` VALUES (48, '4-001', '库区4-A', 24, NULL, 1, 115, '2022-11-11 17:05:19.477', NULL, NULL);
INSERT INTO `wms_area` VALUES (49, '4-002', '库区4-B', 24, NULL, 1, 115, '2022-11-11 17:05:31.630', NULL, NULL);
INSERT INTO `wms_area` VALUES (50, '萝卜1库区444', '萝卜1库区444', 25, NULL, 1, 115, '2022-11-13 17:09:18.000', 115, '2022-11-13 17:12:29.396');
INSERT INTO `wms_area` VALUES (51, 'a101', '1212', 26, '121', 1, 115, '2022-11-14 16:37:44.110', NULL, NULL);
INSERT INTO `wms_area` VALUES (52, 'test-1', 'test-1', 27, NULL, 1, 115, '2022-11-20 15:08:16.939', NULL, NULL);
INSERT INTO `wms_area` VALUES (53, '212', '12', 14, '21', 1, 115, '2022-11-20 21:19:10.209', NULL, NULL);
INSERT INTO `wms_area` VALUES (54, '1', '1', 4, '1', 1, 115, '2022-11-21 04:41:52.000', 115, '2022-11-30 11:49:01.613');
INSERT INTO `wms_area` VALUES (55, '001', '水果', 14, NULL, 1, 115, '2022-12-04 15:37:56.930', NULL, NULL);
INSERT INTO `wms_area` VALUES (56, 'A-01', '金融仓库中间', 31, '金融仓库中间', 1, 115, '2022-12-05 15:47:58.000', 115, '2022-12-08 10:28:41.348');
INSERT INTO `wms_area` VALUES (57, 'xmld_b1', '北仓1-1', 33, NULL, 1, 115, '2022-12-07 09:12:15.000', 115, '2022-12-08 10:28:49.174');
INSERT INTO `wms_area` VALUES (58, 'KQ0001', '库区A', 34, NULL, 1, 115, '2022-12-09 16:23:15.037', NULL, NULL);
INSERT INTO `wms_area` VALUES (59, 'KQ0002', '库区B', 34, NULL, 1, 115, '2022-12-09 16:23:31.176', NULL, NULL);
INSERT INTO `wms_area` VALUES (60, '01', '拣货区', 39, NULL, 1, 115, '2022-12-12 13:14:39.514', NULL, NULL);
INSERT INTO `wms_area` VALUES (61, '2243', 'sfsd', 38, 'sdf', 1, 115, '2022-12-14 23:13:02.000', 115, '2022-12-23 19:26:20.318');
INSERT INTO `wms_area` VALUES (62, 'A001-01', '成品仓01库区', 43, '成品仓01库区', 1, 115, '2022-12-18 17:33:34.100', NULL, NULL);
INSERT INTO `wms_area` VALUES (63, '11', '11', 42, NULL, 1, 115, '2022-12-22 08:53:14.906', NULL, NULL);
INSERT INTO `wms_area` VALUES (64, '22', '22', 41, '22', 1, 115, '2022-12-22 08:53:29.376', NULL, NULL);
INSERT INTO `wms_area` VALUES (65, 'B0023', '测试库区', 45, '无备注', 1, 115, '2022-12-27 14:12:23.832', NULL, NULL);
INSERT INTO `wms_area` VALUES (66, '11', '1', 47, '111', 1, 115, '2022-12-28 14:04:56.620', NULL, NULL);
INSERT INTO `wms_area` VALUES (67, '002', '车衣', 50, '111', 1, 115, '2023-01-04 14:13:26.543', NULL, NULL);
INSERT INTO `wms_area` VALUES (68, '001', 'sd', 51, NULL, 1, 115, '2023-01-05 14:48:26.568', NULL, NULL);
INSERT INTO `wms_area` VALUES (69, '003', '1库', 50, '111', 1, 115, '2023-01-05 16:38:44.660', NULL, NULL);
INSERT INTO `wms_area` VALUES (70, 'KQ001', '库区01', 50, NULL, 1, 115, '2023-01-06 07:57:48.055', NULL, NULL);
INSERT INTO `wms_area` VALUES (71, 'KQ001', '库区01', 50, NULL, 1, 115, '2023-01-06 07:57:48.474', NULL, NULL);
INSERT INTO `wms_area` VALUES (72, '123', '123', 52, NULL, 1, 115, '2023-01-06 14:22:23.805', NULL, NULL);
INSERT INTO `wms_area` VALUES (73, '01', '仓库1-库区1', 53, NULL, 1, 115, '2023-01-06 16:55:43.509', NULL, NULL);
INSERT INTO `wms_area` VALUES (74, '02', '仓库1-库区2', 53, NULL, 1, 115, '2023-01-06 16:55:59.192', NULL, NULL);
INSERT INTO `wms_area` VALUES (75, '03', '03', 55, NULL, 1, 115, '2023-01-07 10:23:55.504', NULL, NULL);
INSERT INTO `wms_area` VALUES (76, 'kuqu33333', '库区3333', 55, '测试', 1, 115, '2023-01-07 15:50:17.525', NULL, NULL);
INSERT INTO `wms_area` VALUES (77, '1', '博爱东库区', 61, NULL, 1, 115, '2023-01-07 23:55:12.779', NULL, NULL);
INSERT INTO `wms_area` VALUES (78, '2', '博爱西库区', 61, '', 1, 115, '2023-01-07 23:55:39.000', 115, '2023-01-08 23:10:33.081');
INSERT INTO `wms_area` VALUES (79, '3', '博爱南库区', 61, NULL, 1, 115, '2023-01-08 23:10:10.391', NULL, NULL);
INSERT INTO `wms_area` VALUES (80, '4', '博爱北库区', 61, '备用库区', 1, 115, '2023-01-08 23:10:25.000', 115, '2023-01-08 23:10:43.522');
INSERT INTO `wms_area` VALUES (81, '5', '博爱中库区', 61, '修改，添加了条备注', 1, 115, '2023-01-08 23:21:16.000', 115, '2023-01-08 23:29:47.922');
INSERT INTO `wms_area` VALUES (82, '1', '测试库区', 64, NULL, 1, 115, '2023-01-11 20:47:17.635', NULL, NULL);
INSERT INTO `wms_area` VALUES (83, '01', '冰柜', 65, NULL, 1, 115, '2023-01-13 12:40:58.752', NULL, NULL);
INSERT INTO `wms_area` VALUES (84, '01', 'B1仓库', 74, NULL, 1, 115, '2023-01-13 12:49:38.000', 115, '2023-01-31 14:07:44.035');
INSERT INTO `wms_area` VALUES (85, '02', '冰柜1号', 68, NULL, 1, 115, '2023-01-13 12:50:36.845', NULL, NULL);
INSERT INTO `wms_area` VALUES (86, '9', '冷冻', 66, NULL, 1, 115, '2023-01-14 12:40:44.000', 115, '2023-01-29 16:13:57.622');
INSERT INTO `wms_area` VALUES (87, '211', '111', 66, NULL, 1, 115, '2023-01-14 16:55:27.528', NULL, NULL);
INSERT INTO `wms_area` VALUES (88, '999-1', '999-1', 72, NULL, 1, 115, '2023-01-29 21:28:27.847', NULL, NULL);
INSERT INTO `wms_area` VALUES (89, '02', 'BB', 76, NULL, 1, 115, '2023-02-01 13:39:09.000', 115, '2023-02-01 22:02:01.126');
INSERT INTO `wms_area` VALUES (90, '01', 'AA', 84, NULL, 1, 115, '2023-02-01 22:01:47.000', 115, '2023-02-14 09:15:22.596');
INSERT INTO `wms_area` VALUES (91, '03', '00', 77, NULL, 1, 115, '2023-02-01 22:02:11.032', NULL, NULL);
INSERT INTO `wms_area` VALUES (92, '04', '不良品', 78, NULL, 1, 115, '2023-02-01 22:02:19.305', NULL, NULL);
INSERT INTO `wms_area` VALUES (93, '11', '11', 82, NULL, 1, 115, '2023-02-03 16:46:10.932', NULL, NULL);
INSERT INTO `wms_area` VALUES (94, '0206测试', '0206测试', 83, '0206测试', 1, 115, '2023-02-06 14:11:37.841', NULL, NULL);
INSERT INTO `wms_area` VALUES (95, '001901', '种花库区1号', 85, NULL, 1, 115, '2023-02-06 16:28:14.695', NULL, NULL);
INSERT INTO `wms_area` VALUES (96, '11111111', '222', 84, NULL, 1, 115, '2023-02-07 16:33:02.460', NULL, NULL);
INSERT INTO `wms_area` VALUES (97, '44', '就是看书', 83, NULL, 1, 115, '2023-02-07 21:12:39.872', NULL, NULL);
INSERT INTO `wms_area` VALUES (98, '3001', 'A区', 86, NULL, 1, 115, '2023-02-08 09:08:21.000', 115, '2023-02-08 09:10:27.989');
INSERT INTO `wms_area` VALUES (99, '3002', 'B区', 86, NULL, 1, 115, '2023-02-08 09:08:36.000', 115, '2023-02-08 09:10:33.453');
INSERT INTO `wms_area` VALUES (100, '2601', '东A区', 87, NULL, 1, 115, '2023-02-08 16:31:54.986', NULL, NULL);
INSERT INTO `wms_area` VALUES (101, '002', 'a仓库', 88, NULL, 1, 115, '2023-02-10 10:42:38.219', NULL, NULL);
INSERT INTO `wms_area` VALUES (102, 'SCZX001', '打印机', 89, NULL, 1, 115, '2023-02-10 15:23:22.341', NULL, NULL);
INSERT INTO `wms_area` VALUES (103, '数创中心库房', '库房1', 89, NULL, 1, 115, '2023-02-10 15:53:22.090', NULL, NULL);
INSERT INTO `wms_area` VALUES (104, '510510', 'A区', 90, '测试用', 1, 115, '2023-02-11 10:54:30.295', NULL, NULL);
INSERT INTO `wms_area` VALUES (105, 'A001001', '轴承', 91, NULL, 1, 115, '2023-02-11 14:04:57.910', NULL, NULL);
INSERT INTO `wms_area` VALUES (106, 'A001002', '皮带', 91, NULL, 1, 115, '2023-02-11 14:05:37.433', NULL, NULL);
INSERT INTO `wms_area` VALUES (107, 'A001003', '传感器', 91, NULL, 1, 115, '2023-02-11 14:06:20.471', NULL, NULL);
INSERT INTO `wms_area` VALUES (108, 'A001004', '线缆', 91, NULL, 1, 115, '2023-02-11 14:06:38.770', NULL, NULL);
INSERT INTO `wms_area` VALUES (109, 'A001-00111', '配件A区', 92, '111111', 1, 115, '2023-02-13 13:48:35.061', NULL, NULL);
INSERT INTO `wms_area` VALUES (110, '010', '库区A1', 94, NULL, 1, 115, '2023-02-15 14:07:50.950', NULL, NULL);
INSERT INTO `wms_area` VALUES (111, '03', 'A区', 95, NULL, 1, 115, '2023-02-15 15:02:35.921', NULL, NULL);
INSERT INTO `wms_area` VALUES (112, 't001', '轮胎1', 98, NULL, 1, 115, '2023-02-16 15:07:10.456', NULL, NULL);
INSERT INTO `wms_area` VALUES (113, '11', '11', 84, '11', 1, 115, '2023-02-16 16:30:34.904', NULL, NULL);
INSERT INTO `wms_area` VALUES (114, '11', '11', 84, '11', 1, 115, '2023-02-16 16:30:48.264', NULL, NULL);
INSERT INTO `wms_area` VALUES (115, 'WB001A01', 'A库区', 101, NULL, 1, 115, '2023-02-17 10:48:15.227', NULL, NULL);
INSERT INTO `wms_area` VALUES (116, 'd01', 'dddd', 102, 'd', 1, 115, '2023-02-17 13:07:20.390', NULL, NULL);
INSERT INTO `wms_area` VALUES (117, '111111', '半成品', 104, '半成品', 1, 115, '2023-02-17 13:50:27.233', NULL, NULL);
INSERT INTO `wms_area` VALUES (118, '1', '河南', 106, NULL, 1, 115, '2023-02-21 12:00:38.421', NULL, NULL);
INSERT INTO `wms_area` VALUES (119, '001', 'Gcc', 109, 'XXX', 1, 115, '2023-02-23 19:51:29.469', NULL, NULL);
INSERT INTO `wms_area` VALUES (120, '123', '456', 109, '123456', 1, 115, '2023-02-24 15:00:19.034', NULL, NULL);
INSERT INTO `wms_area` VALUES (121, '0321', '0321库区', 111, '123456789645', 1, 115, '2023-02-24 15:01:38.033', NULL, NULL);
INSERT INTO `wms_area` VALUES (122, '001', '办公用品', 112, NULL, 1, 115, '2023-02-25 08:19:17.149', NULL, NULL);
INSERT INTO `wms_area` VALUES (123, '002', '临时堆放', 112, NULL, 1, 115, '2023-02-25 08:20:06.243', NULL, NULL);
INSERT INTO `wms_area` VALUES (124, 'test', 'test22-2-25-19:51', 112, 'test', 1, 115, '2023-02-25 19:51:53.315', NULL, NULL);
INSERT INTO `wms_area` VALUES (125, '100_01', 'm_test_01', 115, NULL, 1, 115, '2023-02-27 10:29:43.393', NULL, NULL);
INSERT INTO `wms_area` VALUES (126, '343', '1', 116, '2', 1, 115, '2023-03-01 01:09:14.767', NULL, NULL);
INSERT INTO `wms_area` VALUES (127, '002', '231', 117, '123123', 1, 115, '2023-03-01 15:29:37.220', NULL, NULL);
INSERT INTO `wms_area` VALUES (128, 'A', '疫苗库', 120, 'A', 1, 115, '2023-03-01 17:28:47.000', 115, '2023-03-02 10:16:44.047');
INSERT INTO `wms_area` VALUES (129, 'B', 'B', 118, 'B', 1, 115, '2023-03-01 17:29:01.000', 115, '2023-03-01 17:31:19.705');
INSERT INTO `wms_area` VALUES (130, 'A', '3A', 119, '3A', 1, 115, '2023-03-01 17:30:49.000', 115, '2023-03-01 17:32:22.777');
INSERT INTO `wms_area` VALUES (131, 'B', '3B', 119, NULL, 1, 115, '2023-03-01 17:32:31.902', NULL, NULL);
INSERT INTO `wms_area` VALUES (132, 'C', '3C', 119, NULL, 1, 115, '2023-03-01 17:32:46.799', NULL, NULL);
INSERT INTO `wms_area` VALUES (133, 'D', '3D', 119, NULL, 1, 115, '2023-03-01 17:32:58.666', NULL, NULL);
INSERT INTO `wms_area` VALUES (134, 'A', 'A区', 121, NULL, 1, 115, '2023-03-03 20:07:24.000', 115, '2023-03-03 20:10:56.511');
INSERT INTO `wms_area` VALUES (135, 'B', ' B区', 122, NULL, 1, 115, '2023-03-03 21:25:34.564', NULL, NULL);
INSERT INTO `wms_area` VALUES (136, '0307', '0307', 117, '0307', 1, 115, '2023-03-07 16:31:51.341', NULL, NULL);
INSERT INTO `wms_area` VALUES (137, '0089', '领用区', 122, NULL, 1, 115, '2023-03-08 13:21:47.681', NULL, NULL);
INSERT INTO `wms_area` VALUES (138, '02854', '发2', 126, NULL, 1, 115, '2023-03-09 13:11:27.625', NULL, NULL);
INSERT INTO `wms_area` VALUES (139, '123', 'A1', 128, '156', 1, 115, '2023-03-11 13:56:55.501', NULL, NULL);
INSERT INTO `wms_area` VALUES (140, '123', 'A2', 128, '2341', 1, 115, '2023-03-11 13:57:06.850', NULL, NULL);
INSERT INTO `wms_area` VALUES (141, '123', 'a3', 129, NULL, 1, 115, '2023-03-11 21:35:38.489', NULL, NULL);
INSERT INTO `wms_area` VALUES (142, '测试库区', '测试库区', 131, '测试仓库', 1, 115, '2023-03-12 15:51:17.675', NULL, NULL);
INSERT INTO `wms_area` VALUES (143, '1', '啊', 131, NULL, 1, 115, '2023-03-12 19:11:57.000', 115, '2023-03-12 19:12:17.362');
INSERT INTO `wms_area` VALUES (144, 'a', '1', 134, NULL, 1, 115, '2023-03-13 14:40:01.458', NULL, NULL);
INSERT INTO `wms_area` VALUES (145, 'hhh', 'hhh', 140, NULL, 1, 115, '2023-03-13 15:52:51.000', 115, '2023-03-30 17:33:38.041');
INSERT INTO `wms_area` VALUES (146, 'hhh', 'hhh', 136, NULL, 1, 115, '2023-03-13 15:52:51.998', NULL, NULL);
INSERT INTO `wms_area` VALUES (147, '111', '111', 135, NULL, 1, 115, '2023-03-13 16:11:35.778', NULL, NULL);
INSERT INTO `wms_area` VALUES (148, '123', '111', 137, NULL, 1, 115, '2023-03-14 14:12:08.312', NULL, NULL);
INSERT INTO `wms_area` VALUES (149, '555', '555', 135, NULL, 1, 115, '2023-03-14 23:57:20.887', NULL, NULL);
INSERT INTO `wms_area` VALUES (150, '222', '222', 138, NULL, 1, 115, '2023-03-20 13:45:55.556', NULL, NULL);
INSERT INTO `wms_area` VALUES (151, '123111', 'igc', 149, NULL, 1, 115, '2023-03-21 17:30:15.608', NULL, NULL);
INSERT INTO `wms_area` VALUES (152, '0322', '服装1-库区-甲', 154, '20230322', 1, 115, '2023-03-22 15:46:37.000', 115, '2023-03-22 15:48:00.840');
INSERT INTO `wms_area` VALUES (153, 'HD-PC-01', '华东电脑库区', 155, NULL, 1, 115, '2023-03-22 22:48:02.211', NULL, NULL);
INSERT INTO `wms_area` VALUES (154, '1234', '喝的', 160, NULL, 1, 115, '2023-03-24 14:21:03.000', 115, '2023-03-28 08:50:18.712');
INSERT INTO `wms_area` VALUES (155, '1351', '器材库', 139, 'fcl/T1', 1, 115, '2023-03-24 23:58:00.000', 115, '2023-03-29 20:34:58.978');
INSERT INTO `wms_area` VALUES (156, '777', '777', 163, '66', 1, 115, '2023-03-25 15:19:10.224', NULL, NULL);
INSERT INTO `wms_area` VALUES (157, '00101', '00101', 165, NULL, 1, 115, '2023-03-25 15:22:21.090', NULL, NULL);
INSERT INTO `wms_area` VALUES (158, '123', '123', 167, NULL, 1, 115, '2023-03-27 13:44:07.435', NULL, NULL);
INSERT INTO `wms_area` VALUES (159, 'kq-01', '测试库区1', 171, NULL, 1, 115, '2023-03-29 13:32:45.275', NULL, NULL);
INSERT INTO `wms_area` VALUES (160, '本子', '本子', 138, NULL, 1, 115, '2023-03-30 18:21:07.566', NULL, NULL);
INSERT INTO `wms_area` VALUES (161, 'cq001-1', '一库区', 173, NULL, 1, 115, '2023-03-31 12:06:47.095', NULL, NULL);
INSERT INTO `wms_area` VALUES (162, 'gongsi', '公司', 174, NULL, 1, 115, '2023-04-01 06:31:40.749', NULL, NULL);
INSERT INTO `wms_area` VALUES (163, 'HZ1', '华中1号库', 178, '童鞋', 1, 115, '2023-04-04 11:46:03.000', 115, '2023-04-04 14:52:04.029');
INSERT INTO `wms_area` VALUES (164, 'HZ2', '华中2号库', 178, '男鞋', 1, 115, '2023-04-04 11:48:49.000', 115, '2023-04-04 14:52:10.059');
INSERT INTO `wms_area` VALUES (165, 'HZ3', '华中3号库', 178, '女鞋', 1, 115, '2023-04-04 11:49:10.000', 115, '2023-04-04 14:52:20.434');
INSERT INTO `wms_area` VALUES (166, 'HZ4', '华中4号库', 178, '备品库', 1, 115, '2023-04-04 14:53:32.409', NULL, NULL);
INSERT INTO `wms_area` VALUES (167, '141431', '45225', 180, NULL, 1, 115, '2023-04-05 12:27:14.466', NULL, NULL);
INSERT INTO `wms_area` VALUES (168, '大内密探002', '我是库区', 181, '大内密探002', 1, 115, '2023-04-06 14:06:09.000', 115, '2023-04-06 14:07:53.499');
INSERT INTO `wms_area` VALUES (169, 'one-1', 'yyf的仓库的库区', 184, 'yyf', 1, 115, '2023-04-06 14:58:18.174', NULL, NULL);
INSERT INTO `wms_area` VALUES (170, '800', '冷藏', 185, NULL, 1, 115, '2023-04-06 22:42:00.151', NULL, NULL);
INSERT INTO `wms_area` VALUES (171, '111', '一库区', 155, NULL, 1, 115, '2023-04-10 09:11:57.879', NULL, NULL);
INSERT INTO `wms_area` VALUES (172, '2222', '二库区', 155, NULL, 1, 115, '2023-04-10 09:12:10.843', NULL, NULL);
INSERT INTO `wms_area` VALUES (173, '333', '三库区', 155, NULL, 1, 115, '2023-04-10 09:12:22.867', NULL, NULL);
INSERT INTO `wms_area` VALUES (174, 'test01', 'test1234', 178, NULL, 1, 115, '2023-04-10 13:35:14.501', NULL, NULL);
INSERT INTO `wms_area` VALUES (175, 'test02', 'test02', 178, NULL, 1, 115, '2023-04-10 13:35:30.937', NULL, NULL);
INSERT INTO `wms_area` VALUES (176, 'test02', 'test02', 178, '', 1, 115, '2023-04-10 13:42:26.000', 115, '2023-04-11 16:46:22.708');
INSERT INTO `wms_area` VALUES (177, '123', 'sf', 154, '123', 1, 115, '2023-04-11 08:09:55.948', NULL, NULL);
INSERT INTO `wms_area` VALUES (178, '10001', '常温库区', 193, '规划局', 0, 115, '2023-04-13 10:08:19.000', 115, '2023-04-18 19:04:09.427');
INSERT INTO `wms_area` VALUES (179, '10002', '低温库区', 192, NULL, 0, 115, '2023-04-13 10:08:56.000', 115, '2023-04-13 10:11:23.383');
INSERT INTO `wms_area` VALUES (180, '10003', '低温库区', 193, NULL, 0, 115, '2023-04-13 10:09:22.000', 115, '2023-04-13 10:11:49.267');
INSERT INTO `wms_area` VALUES (181, '10004', '常温库区', 194, '111', 0, 115, '2023-04-13 10:09:43.000', 1, '2023-04-26 09:01:45.846');
INSERT INTO `wms_area` VALUES (182, '10005', '低温库区', 195, NULL, 0, 115, '2023-04-13 10:10:04.000', 115, '2023-04-13 10:11:41.306');
INSERT INTO `wms_area` VALUES (183, '10006', '常温库区', 196, NULL, 0, 115, '2023-04-13 10:10:18.000', 115, '2023-04-13 10:12:01.775');
INSERT INTO `wms_area` VALUES (184, '10007', '低温库区', 197, NULL, 0, 115, '2023-04-13 10:10:30.000', 115, '2023-04-13 10:11:37.194');
INSERT INTO `wms_area` VALUES (185, '10008', '常温库区', 198, NULL, 0, 115, '2023-04-13 10:10:39.000', 115, '2023-04-13 10:12:05.256');
INSERT INTO `wms_area` VALUES (186, '10009', '低温库区', 199, NULL, 0, 115, '2023-04-13 10:10:49.000', 115, '2023-04-13 10:11:32.915');
INSERT INTO `wms_area` VALUES (187, '10010', '常温库区', 204, NULL, 1, 115, '2023-04-18 11:28:40.083', NULL, NULL);
INSERT INTO `wms_area` VALUES (188, '22', '22', 210, NULL, 0, 115, '2023-04-20 11:30:17.471', NULL, NULL);
INSERT INTO `wms_area` VALUES (189, '1001', '南1区', 215, NULL, 0, 115, '2023-04-24 15:33:03.797', NULL, NULL);
INSERT INTO `wms_area` VALUES (190, '1002', '南2区', 215, NULL, 0, 115, '2023-04-24 15:33:17.553', NULL, NULL);
INSERT INTO `wms_area` VALUES (191, 'test194', 'test194', 194, '194浙江1仓的修改了', 1, 1, '2023-04-25 22:37:53.000', 1, '2023-04-25 22:38:03.888');
INSERT INTO `wms_area` VALUES (192, '1', '1', 194, '1', 1, 1, '2023-04-25 22:55:26.660', NULL, NULL);
INSERT INTO `wms_area` VALUES (193, '2', '2', 194, '2', 1, 1, '2023-04-25 22:55:31.071', NULL, NULL);
INSERT INTO `wms_area` VALUES (194, '123213', '321321', 194, '312312', 1, 1, '2023-04-26 08:50:15.078', NULL, NULL);
INSERT INTO `wms_area` VALUES (195, 'kq1', 'kq1', 224, '111', 0, 1, '2023-04-26 09:57:59.000', 1, '2023-04-26 10:20:17.709');
INSERT INTO `wms_area` VALUES (196, 'kq2', 'kq2', 224, NULL, 0, 1, '2023-04-26 09:58:07.159', NULL, NULL);
INSERT INTO `wms_area` VALUES (197, 'kq3', 'kq3', 224, NULL, 0, 1, '2023-04-26 09:58:18.238', NULL, NULL);
INSERT INTO `wms_area` VALUES (198, 'kq4', 'kq4', 224, NULL, 0, 1, '2023-04-26 09:58:25.437', NULL, NULL);
INSERT INTO `wms_area` VALUES (199, 'kq5', 'kq5', 224, NULL, 0, 1, '2023-04-26 09:58:34.960', NULL, NULL);
INSERT INTO `wms_area` VALUES (200, 'kq6', 'kq6', 224, NULL, 0, 1, '2023-04-26 09:58:41.499', NULL, NULL);
INSERT INTO `wms_area` VALUES (201, 'kq7', 'kq7', 224, NULL, 0, 1, '2023-04-26 09:58:47.518', NULL, NULL);
INSERT INTO `wms_area` VALUES (202, 'kq8', 'kq8', 224, NULL, 1, 1, '2023-04-26 09:58:54.161', NULL, NULL);
INSERT INTO `wms_area` VALUES (203, 'kq9', 'kq9', 224, NULL, 1, 1, '2023-04-26 09:59:01.554', NULL, NULL);
INSERT INTO `wms_area` VALUES (204, 'kq8', 'kq8', 224, NULL, 0, 1, '2023-04-26 10:16:20.641', NULL, NULL);
INSERT INTO `wms_area` VALUES (205, 'kq10', 'kq10', 224, NULL, 0, 1, '2023-04-26 10:48:46.016', NULL, NULL);
INSERT INTO `wms_area` VALUES (206, 'kq11', 'kq11', 224, NULL, 0, 1, '2023-04-26 10:48:53.575', NULL, NULL);
INSERT INTO `wms_area` VALUES (207, 'kq12', 'kq12', 224, NULL, 0, 1, '2023-04-26 10:50:09.014', NULL, NULL);
INSERT INTO `wms_area` VALUES (208, 'kq12', 'kq12', 224, NULL, 0, 1, '2023-04-26 10:50:11.038', NULL, NULL);
INSERT INTO `wms_area` VALUES (209, '一giao窝里giaogiao', '一giao窝里giaogiao', 196, '一giao窝里giaogiao', 0, 115, '2023-04-27 16:10:56.328', NULL, NULL);
INSERT INTO `wms_area` VALUES (210, '货架层及更细库位管理', '货架层及更细库位管理', 225, '货架层及更细库位管理', 0, 115, '2023-04-27 16:50:16.202', NULL, NULL);
INSERT INTO `wms_area` VALUES (211, '213', '21', 198, '21', 0, 115, '2023-04-29 08:41:14.695', NULL, NULL);
INSERT INTO `wms_area` VALUES (212, '123', '11', 227, '11', 0, 115, '2023-04-29 08:43:33.377', NULL, NULL);
INSERT INTO `wms_area` VALUES (213, '3333', '333', 227, '33', 0, 115, '2023-04-29 08:43:37.250', NULL, NULL);
INSERT INTO `wms_area` VALUES (214, '222', '22', 227, '22', 0, 115, '2023-04-29 08:43:40.872', NULL, NULL);
INSERT INTO `wms_area` VALUES (215, 'k1', '北京库', 228, NULL, 0, 115, '2023-04-30 16:43:32.000', 115, '2023-04-30 16:44:58.989');
INSERT INTO `wms_area` VALUES (216, 'xinqu', '001', 229, '222', 0, 115, '2023-05-01 12:16:59.000', 115, '2023-05-03 11:11:08.616');
INSERT INTO `wms_area` VALUES (217, '1001', '收3232', 231, NULL, 0, 115, '2023-05-02 13:40:58.644', NULL, NULL);
INSERT INTO `wms_area` VALUES (218, '22', '22', 229, '22', 0, 115, '2023-05-02 16:01:09.988', NULL, NULL);
INSERT INTO `wms_area` VALUES (219, '33', '大理', 229, '零食', 0, 115, '2023-05-03 19:21:00.961', NULL, NULL);
INSERT INTO `wms_area` VALUES (220, '2', '3ref', 235, 'fsd', 0, 115, '2023-05-04 16:43:02.651', NULL, NULL);
INSERT INTO `wms_area` VALUES (221, 'gdf', 'sdgf', 234, 'erf', 0, 115, '2023-05-04 16:43:11.246', NULL, NULL);

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
) ENGINE = InnoDB AUTO_INCREMENT = 24 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '承运商' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wms_carrier
-- ----------------------------
INSERT INTO `wms_carrier` VALUES (1, 'sf', '顺丰快运', '上海', '18010008888', '0512-52251234', '李', '第一级', '1111', '1111', 1, 1, '2022-07-29 18:04:11.000', 115, '2022-11-16 15:44:03.292');
INSERT INTO `wms_carrier` VALUES (2, '1', '11', '1', '1', '1', '1', '第一级', '1', '1111111111111', 1, 115, '2022-12-28 14:06:27.136', NULL, NULL);
INSERT INTO `wms_carrier` VALUES (3, '123456', '承运商1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 115, '2022-12-29 15:30:57.899', NULL, NULL);
INSERT INTO `wms_carrier` VALUES (4, '01', '京东', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 115, '2023-01-08 23:52:04.864', NULL, NULL);
INSERT INTO `wms_carrier` VALUES (5, '02', '顺丰', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 115, '2023-01-08 23:52:13.119', NULL, NULL);
INSERT INTO `wms_carrier` VALUES (6, '03', '圆通', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 115, '2023-01-08 23:52:22.153', NULL, NULL);
INSERT INTO `wms_carrier` VALUES (7, '04', '邮政', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 115, '2023-01-09 01:24:19.710', NULL, NULL);
INSERT INTO `wms_carrier` VALUES (8, '05', '中通', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 115, '2023-01-09 01:29:02.614', NULL, NULL);
INSERT INTO `wms_carrier` VALUES (9, '123', '123', '123', '123', '123', '123', '第一级', '123', '123', 1, 115, '2023-01-14 13:26:47.000', 115, '2023-01-28 17:47:25.969');
INSERT INTO `wms_carrier` VALUES (10, '01', '承运', '承运地址', '1545631296', '21562163', '接电话', '第一级', NULL, NULL, 1, 115, '2023-02-01 22:06:10.000', 115, '2023-02-04 17:16:47.000');
INSERT INTO `wms_carrier` VALUES (11, '02', '承运商2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 115, '2023-02-06 10:14:15.079', NULL, NULL);
INSERT INTO `wms_carrier` VALUES (12, '03', '承运商3', '天朝', '13188888888', '123456', '宋霸天', '第一级', 'za.r.a.e.l.l.i.s.33@gmail.com', NULL, 1, 115, '2023-02-15 15:01:11.454', NULL, NULL);
INSERT INTO `wms_carrier` VALUES (13, '+21321', '12131', '杭州滨江长河街道', NULL, NULL, NULL, NULL, '11756@qq.com', NULL, 1, 115, '2023-02-27 12:26:50.190', NULL, NULL);
INSERT INTO `wms_carrier` VALUES (14, '乐途', '上海乐途物流有限公司', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 115, '2023-03-01 17:59:32.889', NULL, NULL);
INSERT INTO `wms_carrier` VALUES (15, '上海智胜', '上海智胜', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 115, '2023-03-01 18:00:02.219', NULL, NULL);
INSERT INTO `wms_carrier` VALUES (16, 'cys1', '承运商1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 115, '2023-03-14 10:03:07.825', NULL, NULL);
INSERT INTO `wms_carrier` VALUES (17, 'sy1', '承运1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 115, '2023-03-22 15:53:48.924', NULL, NULL);
INSERT INTO `wms_carrier` VALUES (18, 'sy0323', '快的', '上海市浦东新区', '15546310885', '15546310885', '孙垚', '第一级', 'sunyao@sinosoft.com.cn', 'yiyiyiy', 1, 115, '2023-03-23 13:58:31.803', NULL, NULL);
INSERT INTO `wms_carrier` VALUES (19, '001', '汽车运输', '1', '1', '1', '1', '第一级', '1', '1', 0, 115, '2023-04-06 14:09:54.000', 115, '2023-04-26 10:57:14.385');
INSERT INTO `wms_carrier` VALUES (20, '002', '火车运输', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 115, '2023-04-26 10:57:27.883', NULL, NULL);
INSERT INTO `wms_carrier` VALUES (21, '003', '水路运输', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 115, '2023-04-26 10:57:46.418', NULL, NULL);
INSERT INTO `wms_carrier` VALUES (22, '004', '飞机运输', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 115, '2023-04-26 10:57:58.532', NULL, NULL);
INSERT INTO `wms_carrier` VALUES (23, '005', '2', '22', '4333', '22', '2222', '第一级', '222', '22', 0, 115, '2023-04-29 18:11:44.425', NULL, NULL);

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
) ENGINE = InnoDB AUTO_INCREMENT = 40 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '客户' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wms_customer
-- ----------------------------
INSERT INTO `wms_customer` VALUES (1, '1', '1', NULL, NULL, NULL, '1', '1', '1', '1', NULL, NULL, NULL, 1, 1, '2022-07-29 18:16:17.761', NULL, NULL);
INSERT INTO `wms_customer` VALUES (2, '1', '1', NULL, NULL, NULL, '1', '1', '1', '1', '1', '1', '1', 1, 1, '2022-08-04 15:28:11.436', NULL, NULL);
INSERT INTO `wms_customer` VALUES (3, '1', '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', 1, 1, '2022-08-04 18:24:50.963', NULL, NULL);
INSERT INTO `wms_customer` VALUES (4, '1', '苏州霍地', NULL, NULL, NULL, '星湖街328号', '17156568888', '0512-12345678', '李先生', '1', NULL, NULL, 1, 1, '2022-08-11 21:14:54.000', 115, '2022-11-07 11:27:37.635');
INSERT INTO `wms_customer` VALUES (5, '111', '1111', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, '2022-08-11 21:32:58.323', NULL, NULL);
INSERT INTO `wms_customer` VALUES (6, '1111', '1111', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, '2022-08-13 13:52:47.891', NULL, NULL);
INSERT INTO `wms_customer` VALUES (7, '1111', '1111', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, '2022-08-13 13:52:48.793', NULL, NULL);
INSERT INTO `wms_customer` VALUES (8, 'sss', 'sss', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, '2022-08-13 13:54:10.586', NULL, NULL);
INSERT INTO `wms_customer` VALUES (9, '11', '111', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, '2022-08-13 13:57:05.004', NULL, NULL);
INSERT INTO `wms_customer` VALUES (10, '2', '山东A企业', NULL, NULL, NULL, 'ABC', '1852354427', '86060606', '刘女士', '2', '12345@qq.com', 'aaaaaa', 1, 115, '2022-11-10 16:55:07.344', NULL, NULL);
INSERT INTO `wms_customer` VALUES (11, '111', '111', NULL, NULL, NULL, '111', '12312341234', '12345678901', 'dewqrew', '4', 'fds', 'test3', 1, 115, '2022-12-07 19:17:56.000', 115, '2022-12-08 15:13:07.998');
INSERT INTO `wms_customer` VALUES (12, '001', '渣土', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 115, '2022-12-28 11:39:45.000', 115, '2023-01-05 08:54:22.131');
INSERT INTO `wms_customer` VALUES (13, '002', '客户2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 115, '2023-01-05 16:41:13.190', NULL, NULL);
INSERT INTO `wms_customer` VALUES (14, '01', '张三', NULL, NULL, NULL, '东城', NULL, NULL, NULL, NULL, NULL, NULL, 1, 115, '2023-01-06 16:56:59.000', 115, '2023-01-08 23:50:52.836');
INSERT INTO `wms_customer` VALUES (15, '02', '李四', NULL, NULL, NULL, '西城', NULL, NULL, NULL, NULL, NULL, NULL, 1, 115, '2023-01-08 23:51:09.538', NULL, NULL);
INSERT INTO `wms_customer` VALUES (16, '03', '王五', NULL, NULL, NULL, '南城', NULL, NULL, NULL, NULL, NULL, NULL, 1, 115, '2023-01-08 23:51:23.617', NULL, NULL);
INSERT INTO `wms_customer` VALUES (17, '04', '赵六', NULL, NULL, NULL, '北城', NULL, NULL, NULL, NULL, NULL, NULL, 1, 115, '2023-01-09 01:21:58.222', NULL, NULL);
INSERT INTO `wms_customer` VALUES (18, '01', '客户', NULL, NULL, NULL, '1', '1563163', '26521563', '抠脚大', 'VIP', NULL, NULL, 1, 115, '2023-02-01 22:05:48.000', 115, '2023-02-04 17:14:46.125');
INSERT INTO `wms_customer` VALUES (19, '02', '客户2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 115, '2023-02-06 10:13:59.968', NULL, NULL);
INSERT INTO `wms_customer` VALUES (20, '2302060001', '废料收购商', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 115, '2023-02-06 15:19:42.828', NULL, NULL);
INSERT INTO `wms_customer` VALUES (21, '03', '动霸', NULL, NULL, NULL, '天朝', '13288888888', '123456', '王霸天', 'VIP', 'za.r.a.e.l.l.i.s.33@gmail.com', NULL, 1, 115, '2023-02-15 14:59:01.000', 115, '2023-02-15 14:59:12.618');
INSERT INTO `wms_customer` VALUES (22, 'AA01', '测试客户1', NULL, NULL, NULL, 'd', '18909090909', NULL, NULL, NULL, NULL, NULL, 1, 115, '2023-02-17 13:09:52.314', NULL, NULL);
INSERT INTO `wms_customer` VALUES (23, '213212', '421', NULL, NULL, NULL, '杭州滨江长河街道', NULL, NULL, NULL, NULL, '11756@qq.com', NULL, 1, 115, '2023-02-27 12:26:37.815', NULL, NULL);
INSERT INTO `wms_customer` VALUES (24, '怡康', '怡康', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 115, '2023-03-01 17:55:59.963', NULL, NULL);
INSERT INTO `wms_customer` VALUES (25, '高航', '高航', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 115, '2023-03-01 17:56:11.280', NULL, NULL);
INSERT INTO `wms_customer` VALUES (26, 'ewrwer', 'qweqwe', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 115, '2023-03-11 12:27:50.796', NULL, NULL);
INSERT INTO `wms_customer` VALUES (27, 'kh1', '客户1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 115, '2023-03-14 10:03:26.829', NULL, NULL);
INSERT INTO `wms_customer` VALUES (28, 'sy001', '哈哈', NULL, NULL, NULL, '上海市浦东新区五星路', '15546310885', NULL, '孙垚', '一级', 'sunyao@sinosoft.com.cn', NULL, 1, 115, '2023-03-22 15:52:04.671', NULL, NULL);
INSERT INTO `wms_customer` VALUES (29, '1', '123', NULL, NULL, NULL, '河北邯郸', '15110032656', NULL, '五', NULL, '2813846259@qq.com', NULL, 1, 115, '2023-03-25 16:38:09.333', NULL, NULL);
INSERT INTO `wms_customer` VALUES (30, '1', '威威', NULL, NULL, NULL, '河北邯郸肥乡区', '15110043888', NULL, '嗡嗡嗡', NULL, '2813846259@qq.com', NULL, 1, 115, '2023-03-28 15:29:00.487', NULL, NULL);
INSERT INTO `wms_customer` VALUES (31, '123', '嗡嗡嗡企鹅', NULL, NULL, NULL, '北京', '12345678912', NULL, '锵锵锵', '库长', 'hang18732057137@163.com', '韩寒', 1, 115, '2023-03-28 15:34:16.581', NULL, NULL);
INSERT INTO `wms_customer` VALUES (32, '123', '嗡嗡嗡企鹅', NULL, NULL, NULL, '北京', '12345678912', NULL, '锵锵锵', '库长', 'hang18732057137@163.com', '韩寒', 1, 115, '2023-03-28 15:34:26.095', NULL, NULL);
INSERT INTO `wms_customer` VALUES (33, '1', '南京大学', NULL, NULL, NULL, '南京', '13456789045', '002731283', '体育协会', '3', NULL, NULL, 1, 115, '2023-03-29 20:44:05.656', NULL, NULL);
INSERT INTO `wms_customer` VALUES (34, '111', '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 115, '2023-03-30 16:50:56.417', NULL, NULL);
INSERT INTO `wms_customer` VALUES (35, '1', '京东', NULL, NULL, NULL, '1', '1', '1', '1', '1', '1', '1', 1, 115, '2023-04-06 14:09:27.000', 115, '2023-04-15 20:42:41.326');
INSERT INTO `wms_customer` VALUES (36, '2', '国美电器', NULL, NULL, NULL, '四川成都', '13288888888', '028-666666', '成*', '2', '123@163.com', 'test', 1, 115, '2023-04-06 15:15:01.000', 115, '2023-04-19 12:07:52.815');
INSERT INTO `wms_customer` VALUES (37, '3', '苏宁', NULL, NULL, 1850.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 115, '2023-04-06 22:43:51.000', 1, '2023-05-04 18:17:16.013');
INSERT INTO `wms_customer` VALUES (38, '4', '老师好', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 115, '2023-04-12 21:20:34.000', 115, '2023-04-12 21:21:10.464');
INSERT INTO `wms_customer` VALUES (39, '2', '兴盛果蔬', NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 115, '2023-04-26 10:54:25.522', NULL, NULL);

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
) ENGINE = InnoDB AUTO_INCREMENT = 47 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '客户账户流水' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wms_customer_transaction
-- ----------------------------
INSERT INTO `wms_customer_transaction` VALUES (44, 'TS-2023-05-04-180642', '37', '22', 100.00, 0.00, 100.00, 0, NULL, 0, '2023-05-04 18:07:52', '2023-05-04 18:06:07');
INSERT INTO `wms_customer_transaction` VALUES (45, 'TS-2023-05-04-180859', '37', '11', 50.00, 100.00, 50.00, 0, NULL, 0, '2023-05-04 18:09:04', '2023-05-04 18:07:19');
INSERT INTO `wms_customer_transaction` VALUES (46, 'TS-2023-05-124-181715', '37', '33', 1800.00, 50.00, 1850.00, 271, NULL, 0, '2023-05-04 18:17:16', '2023-05-04 18:15:31');

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
) ENGINE = InnoDB AUTO_INCREMENT = 25 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '发货记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wms_delivery
-- ----------------------------
INSERT INTO `wms_delivery` VALUES (1, 209, 16, '2023-03-30 00:00:00.000', '78671332383267', NULL, 0, 1, '2023-03-30 21:13:39.769', NULL, NULL);
INSERT INTO `wms_delivery` VALUES (2, 203, 16, '2023-03-30 00:00:00.000', '78671332383267', NULL, 0, 1, '2023-03-30 21:15:24.551', NULL, NULL);
INSERT INTO `wms_delivery` VALUES (3, 210, 16, NULL, NULL, NULL, 0, 115, '2023-04-02 05:20:22.998', NULL, NULL);
INSERT INTO `wms_delivery` VALUES (4, 209, 16, '2023-04-07 00:00:00.000', '123123', '123213', 0, 115, '2023-04-03 17:25:38.181', NULL, NULL);
INSERT INTO `wms_delivery` VALUES (5, 221, 17, '2023-04-03 00:00:00.000', '213', '123', 0, 115, '2023-04-03 17:34:05.452', NULL, NULL);
INSERT INTO `wms_delivery` VALUES (6, 224, NULL, NULL, '111', NULL, 0, 115, '2023-04-06 10:38:40.627', NULL, NULL);
INSERT INTO `wms_delivery` VALUES (7, 217, NULL, '2023-04-05 00:00:00.000', '111', '111', 0, 115, '2023-04-06 14:23:51.455', NULL, NULL);
INSERT INTO `wms_delivery` VALUES (8, 227, 19, NULL, NULL, NULL, 0, 115, '2023-04-06 22:46:21.738', NULL, NULL);
INSERT INTO `wms_delivery` VALUES (9, 229, 19, '2023-02-01 00:00:00.000', 'SF20223236', NULL, 0, 115, '2023-04-08 10:50:45.866', NULL, NULL);
INSERT INTO `wms_delivery` VALUES (10, 235, 19, '2023-04-11 00:00:00.000', '56151565', NULL, 0, 115, '2023-04-11 12:59:00.283', NULL, NULL);
INSERT INTO `wms_delivery` VALUES (11, 237, 19, '2023-04-11 16:01:31.000', NULL, NULL, 0, 115, '2023-04-11 16:01:33.591', NULL, NULL);
INSERT INTO `wms_delivery` VALUES (12, 239, 19, '2023-04-12 00:00:00.000', '2222', '2222', 0, 115, '2023-04-12 19:01:06.938', NULL, NULL);
INSERT INTO `wms_delivery` VALUES (13, 241, 19, '2023-04-13 00:00:00.000', '1', '1', 0, 115, '2023-04-13 21:51:29.734', NULL, NULL);
INSERT INTO `wms_delivery` VALUES (14, 246, 19, '2023-04-13 00:00:00.000', '11', '11', 0, 115, '2023-04-15 22:23:30.600', NULL, NULL);
INSERT INTO `wms_delivery` VALUES (15, 209, 19, '2023-04-11 00:00:00.000', '2222', NULL, 0, 115, '2023-04-19 23:29:05.678', NULL, NULL);
INSERT INTO `wms_delivery` VALUES (16, 245, 19, '2023-04-21 00:00:00.000', '1234', NULL, 0, 115, '2023-04-21 09:52:19.925', NULL, NULL);
INSERT INTO `wms_delivery` VALUES (17, 253, 19, '2023-04-22 00:00:00.000', '1', '1', 0, 115, '2023-04-22 19:11:25.666', NULL, NULL);
INSERT INTO `wms_delivery` VALUES (18, 252, 19, '2023-04-22 00:00:00.000', '22', NULL, 0, 115, '2023-04-22 19:12:09.435', NULL, NULL);
INSERT INTO `wms_delivery` VALUES (19, 250, 19, '2023-04-22 00:00:00.000', '222', '1', 0, 115, '2023-04-22 19:17:45.132', NULL, NULL);
INSERT INTO `wms_delivery` VALUES (20, 260, 19, '2023-04-28 00:00:00.000', NULL, NULL, 0, 115, '2023-04-25 15:00:11.168', NULL, NULL);
INSERT INTO `wms_delivery` VALUES (21, 260, 19, '2023-04-28 00:00:00.000', NULL, NULL, 0, 115, '2023-04-25 15:00:19.713', NULL, NULL);
INSERT INTO `wms_delivery` VALUES (22, 261, 19, '2023-04-25 00:00:00.000', NULL, '4444444444', 0, 115, '2023-04-25 15:56:32.913', NULL, NULL);
INSERT INTO `wms_delivery` VALUES (23, 258, 19, '2023-04-20 00:00:00.000', '123141', '234', 0, 115, '2023-04-25 17:55:33.745', NULL, NULL);
INSERT INTO `wms_delivery` VALUES (24, 254, 19, '2023-04-25 18:39:07.000', '2333', NULL, 0, 115, '2023-04-25 18:39:14.128', NULL, NULL);

-- ----------------------------
-- Table structure for wms_inventory
-- ----------------------------
DROP TABLE IF EXISTS `wms_inventory`;
CREATE TABLE `wms_inventory`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `item_id` bigint(20) NULL DEFAULT NULL COMMENT '物料ID',
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
) ENGINE = InnoDB AUTO_INCREMENT = 373 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '库存' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wms_inventory
-- ----------------------------
INSERT INTO `wms_inventory` VALUES (1, 1, 1, 19.00, '1', 0, NULL, NULL, 1, '2022-10-10 23:15:28.499', 1, 1);
INSERT INTO `wms_inventory` VALUES (2, 2, NULL, 3.00, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `wms_inventory` VALUES (3, 2, NULL, 1.00, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `wms_inventory` VALUES (4, 1, 5, 50.00, NULL, 0, 1, '2022-10-10 23:05:13.969', NULL, NULL, 1, 13);
INSERT INTO `wms_inventory` VALUES (5, 2, 1, 25.00, NULL, 0, 1, '2022-10-10 23:05:13.969', 115, '2022-11-12 16:58:55.449', 1, 13);
INSERT INTO `wms_inventory` VALUES (7, 1, 1, 9.00, NULL, 0, 1, '2022-10-24 18:05:17.538', 115, '2022-11-08 17:14:51.745', 1, 13);
INSERT INTO `wms_inventory` VALUES (8, 2, 6, 26.00, NULL, 0, 1, '2022-11-02 17:25:32.344', 115, '2022-11-12 16:58:55.604', 2, 18);
INSERT INTO `wms_inventory` VALUES (9, 1, NULL, 2.00, NULL, 0, 1, '2022-11-02 17:25:32.344', NULL, NULL, 4, NULL);
INSERT INTO `wms_inventory` VALUES (14, 2, NULL, 3.00, NULL, 0, 1, '2022-11-03 17:40:30.566', 115, '2022-11-13 17:33:14.788', 2, 18);
INSERT INTO `wms_inventory` VALUES (15, 2, NULL, 2.00, NULL, 0, 1, '2022-11-03 17:43:44.004', 1, '2022-11-03 17:48:28.148', 3, 16);
INSERT INTO `wms_inventory` VALUES (16, 1, 7, 1.00, NULL, 0, 115, '2022-11-07 08:25:36.418', NULL, NULL, 3, 16);
INSERT INTO `wms_inventory` VALUES (17, 2, NULL, 8.00, NULL, 0, 115, '2022-11-07 21:46:30.673', NULL, NULL, 20, 41);
INSERT INTO `wms_inventory` VALUES (18, 1, 8, 5.00, NULL, 0, 115, '2022-11-07 21:46:30.673', NULL, NULL, 20, 42);
INSERT INTO `wms_inventory` VALUES (19, 1, NULL, 6.00, NULL, 0, 115, '2022-11-09 14:58:41.835', 115, '2022-11-09 14:59:20.883', 1, 13);
INSERT INTO `wms_inventory` VALUES (20, 1, NULL, 1.00, NULL, 0, 115, '2022-11-09 18:32:26.133', NULL, NULL, 3, 14);
INSERT INTO `wms_inventory` VALUES (21, 5, 6, 1.00, NULL, 0, 115, '2022-11-11 16:24:13.425', 115, '2022-11-13 17:33:14.788', 2, 18);
INSERT INTO `wms_inventory` VALUES (22, 7, 9, 591.00, NULL, 0, 115, '2022-11-11 17:19:21.005', 115, '2022-11-13 17:33:14.788', 21, 43);
INSERT INTO `wms_inventory` VALUES (23, 8, 11, 151.00, NULL, 0, 115, '2022-11-11 17:19:21.005', 115, '2022-11-13 17:33:14.788', 21, 44);
INSERT INTO `wms_inventory` VALUES (24, 8, NULL, 40.00, NULL, 0, 115, '2022-11-11 17:30:50.040', NULL, NULL, 22, NULL);
INSERT INTO `wms_inventory` VALUES (25, 3, NULL, 1.00, NULL, 0, 115, '2022-11-13 17:33:14.788', NULL, NULL, 3, 14);
INSERT INTO `wms_inventory` VALUES (26, 1, 17, 1.00, NULL, 0, 115, '2022-11-13 17:33:14.788', NULL, NULL, 25, 50);
INSERT INTO `wms_inventory` VALUES (27, 4, 1, 1.00, NULL, 0, 115, '2022-11-13 17:33:14.788', NULL, NULL, 2, 17);
INSERT INTO `wms_inventory` VALUES (28, 6, 1, 1.00, NULL, 0, 115, '2022-11-13 17:33:14.788', NULL, NULL, 2, 17);
INSERT INTO `wms_inventory` VALUES (29, 9, 12, 1.00, NULL, 0, 115, '2022-11-13 17:33:14.788', NULL, NULL, 22, 46);
INSERT INTO `wms_inventory` VALUES (30, 10, 14, 1.00, NULL, 0, 115, '2022-11-13 17:33:14.788', NULL, NULL, 23, 47);
INSERT INTO `wms_inventory` VALUES (31, 12, 17, 1.00, NULL, 0, 115, '2022-11-13 17:41:54.669', NULL, NULL, 25, 50);
INSERT INTO `wms_inventory` VALUES (32, 13, 4, 2.00, NULL, 0, 115, '2022-11-13 17:44:49.159', 115, '2022-12-05 14:08:46.134', 4, 14);
INSERT INTO `wms_inventory` VALUES (33, 12, NULL, 1.00, NULL, 0, 115, '2022-11-15 16:42:56.213', NULL, NULL, 2, 44);
INSERT INTO `wms_inventory` VALUES (34, 13, NULL, 1.00, NULL, 0, 115, '2022-11-15 16:42:56.213', NULL, NULL, 2, 44);
INSERT INTO `wms_inventory` VALUES (35, 14, NULL, 0.00, NULL, 0, 115, '2022-11-15 16:42:56.213', 115, '2022-11-15 16:48:25.656', 2, 44);
INSERT INTO `wms_inventory` VALUES (36, 17, 13, 1.00, NULL, 0, 115, '2022-11-17 16:21:05.926', NULL, NULL, 2, 44);
INSERT INTO `wms_inventory` VALUES (37, 13, NULL, 1.00, NULL, 0, 115, '2022-11-18 09:11:32.704', NULL, NULL, 14, NULL);
INSERT INTO `wms_inventory` VALUES (38, 14, 13, 2.00, NULL, 0, 115, '2022-11-18 09:11:32.704', 115, '2022-11-23 13:50:47.958', 2, 44);
INSERT INTO `wms_inventory` VALUES (39, 12, NULL, 1.00, NULL, 0, 115, '2022-11-18 09:11:43.818', NULL, NULL, 4, NULL);
INSERT INTO `wms_inventory` VALUES (40, 13, 13, 2.00, NULL, 0, 115, '2022-11-18 10:56:31.989', 115, '2022-11-23 13:51:53.331', 2, 44);
INSERT INTO `wms_inventory` VALUES (41, 12, 13, 6.00, NULL, 0, 115, '2022-11-18 11:02:07.120', 115, '2022-11-20 14:33:49.484', 2, 44);
INSERT INTO `wms_inventory` VALUES (42, 20, 13, 20.00, NULL, 0, 115, '2022-11-20 08:53:41.836', 115, '2022-11-20 08:54:13.793', 2, 44);
INSERT INTO `wms_inventory` VALUES (43, 20, 19, 30.00, NULL, 0, 115, '2022-11-20 08:53:56.037', 115, '2022-11-20 08:54:07.301', 14, 46);
INSERT INTO `wms_inventory` VALUES (44, 20, NULL, 4.00, NULL, 0, 115, '2022-11-20 09:26:06.100', 115, '2022-11-20 15:01:21.749', 4, NULL);
INSERT INTO `wms_inventory` VALUES (45, 21, 20, 2000.00, NULL, 0, 115, '2022-11-20 15:11:18.656', NULL, NULL, 27, 52);
INSERT INTO `wms_inventory` VALUES (46, 14, NULL, 10.00, NULL, 0, 115, '2022-11-23 08:24:32.968', 115, '2022-11-23 08:29:54.374', 4, NULL);
INSERT INTO `wms_inventory` VALUES (47, 15, NULL, 8.00, NULL, 0, 115, '2022-11-23 08:29:54.374', NULL, NULL, NULL, NULL);
INSERT INTO `wms_inventory` VALUES (48, 16, NULL, 1.00, NULL, 0, 115, '2022-11-23 08:31:43.578', NULL, NULL, NULL, NULL);
INSERT INTO `wms_inventory` VALUES (49, 20, NULL, 1.00, NULL, 0, 115, '2022-11-23 08:32:46.369', NULL, NULL, NULL, NULL);
INSERT INTO `wms_inventory` VALUES (50, 21, NULL, 1.00, NULL, 0, 115, '2022-11-23 15:28:22.096', NULL, NULL, 14, 53);
INSERT INTO `wms_inventory` VALUES (51, 18, 13, 1.00, NULL, 0, 115, '2022-11-23 15:28:22.096', NULL, NULL, 2, 44);
INSERT INTO `wms_inventory` VALUES (52, 22, 20, 1.00, NULL, 0, 115, '2022-11-23 15:28:22.096', NULL, NULL, 27, 52);
INSERT INTO `wms_inventory` VALUES (53, 20, NULL, 1.00, NULL, 0, 115, '2022-11-25 10:39:13.638', NULL, NULL, NULL, NULL);
INSERT INTO `wms_inventory` VALUES (54, 14, 18, 2.00, NULL, 0, 115, '2022-11-25 10:39:13.638', 115, '2022-12-02 14:34:53.417', 26, 51);
INSERT INTO `wms_inventory` VALUES (55, 13, 13, 1.00, NULL, 0, 115, '2022-11-28 21:19:12.583', NULL, NULL, 2, 45);
INSERT INTO `wms_inventory` VALUES (56, 28, 13, 5.00, NULL, 0, 115, '2022-11-30 14:25:42.820', NULL, NULL, 2, 45);
INSERT INTO `wms_inventory` VALUES (57, 13, NULL, 134.00, NULL, 0, 115, '2022-12-01 09:56:47.430', 115, '2022-12-05 14:06:20.903', 4, 54);
INSERT INTO `wms_inventory` VALUES (58, 27, 14, 19.00, NULL, 0, 1, '2022-12-01 11:05:02.490', 1, '2022-12-01 11:16:14.334', 14, 46);
INSERT INTO `wms_inventory` VALUES (59, 28, NULL, 98.00, NULL, 0, 1, '2022-12-01 11:05:38.603', 1, '2022-12-01 11:23:05.974', 4, 54);
INSERT INTO `wms_inventory` VALUES (60, 13, NULL, 1.00, NULL, 0, 1, '2022-12-01 11:08:39.626', NULL, NULL, 14, 46);
INSERT INTO `wms_inventory` VALUES (61, 17, 14, 1.00, NULL, 0, 1, '2022-12-01 11:08:39.626', NULL, NULL, 14, 46);
INSERT INTO `wms_inventory` VALUES (62, 28, NULL, 1.00, NULL, 0, 1, '2022-12-01 11:23:06.136', NULL, NULL, 14, 53);
INSERT INTO `wms_inventory` VALUES (63, 17, NULL, 1.00, NULL, 0, 115, '2022-12-02 14:34:45.559', NULL, NULL, NULL, NULL);
INSERT INTO `wms_inventory` VALUES (64, 19, 13, 1.00, NULL, 0, 115, '2022-12-03 08:46:58.315', NULL, NULL, 2, 44);
INSERT INTO `wms_inventory` VALUES (65, 25, 20, 2.00, NULL, 0, 115, '2022-12-05 14:06:42.893', NULL, NULL, 27, 52);
INSERT INTO `wms_inventory` VALUES (66, 29, 24, 44.00, NULL, 0, 115, '2022-12-06 00:00:54.199', 115, '2022-12-08 15:14:08.529', 30, 56);
INSERT INTO `wms_inventory` VALUES (67, 29, 25, 5.00, NULL, 0, 115, '2022-12-07 09:16:38.204', 115, '2022-12-07 09:18:25.583', 31, 57);
INSERT INTO `wms_inventory` VALUES (68, 29, NULL, -1.00, NULL, 0, 115, '2022-12-09 19:41:34.349', NULL, NULL, 30, NULL);
INSERT INTO `wms_inventory` VALUES (69, 29, 24, 1.00, NULL, 0, 115, '2022-12-09 19:41:34.371', NULL, NULL, 31, 56);
INSERT INTO `wms_inventory` VALUES (70, 55, NULL, 99.00, NULL, 0, 115, '2022-12-10 15:31:02.883', 115, '2022-12-12 13:19:41.583', 39, NULL);
INSERT INTO `wms_inventory` VALUES (71, 53, NULL, 100.00, NULL, 0, 115, '2022-12-10 15:31:02.883', NULL, NULL, 39, NULL);
INSERT INTO `wms_inventory` VALUES (72, 55, NULL, 0.00, NULL, 0, 115, '2022-12-10 17:01:54.532', 115, '2022-12-10 17:04:23.470', 38, NULL);
INSERT INTO `wms_inventory` VALUES (73, 55, NULL, 1.00, NULL, 0, 115, '2022-12-12 13:16:36.867', NULL, NULL, 39, 60);
INSERT INTO `wms_inventory` VALUES (74, 60, NULL, 13.00, NULL, 0, 115, '2022-12-20 17:27:22.290', 115, '2022-12-22 09:43:54.747', 42, NULL);
INSERT INTO `wms_inventory` VALUES (75, 60, NULL, 12.00, NULL, 0, 115, '2022-12-20 17:40:03.707', 115, '2022-12-20 17:40:38.931', 40, NULL);
INSERT INTO `wms_inventory` VALUES (76, 60, NULL, 10.00, NULL, 0, 115, '2022-12-20 17:42:29.385', 115, '2022-12-20 17:42:42.488', 38, 61);
INSERT INTO `wms_inventory` VALUES (77, 58, NULL, 8.00, NULL, 0, 115, '2022-12-20 17:42:29.385', NULL, NULL, 43, 62);
INSERT INTO `wms_inventory` VALUES (78, 58, 28, 1.00, NULL, 0, 115, '2022-12-20 17:45:45.221', NULL, NULL, 38, 61);
INSERT INTO `wms_inventory` VALUES (79, 60, 29, 1.00, NULL, 0, 115, '2022-12-21 16:11:48.918', 115, '2022-12-28 11:39:15.139', 38, 61);
INSERT INTO `wms_inventory` VALUES (80, 60, NULL, 1.00, NULL, 0, 115, '2022-12-22 12:35:50.450', NULL, NULL, 38, NULL);
INSERT INTO `wms_inventory` VALUES (81, 60, NULL, 1002.00, NULL, 0, 115, '2022-12-27 15:33:46.653', 115, '2023-01-03 12:09:21.717', 45, 65);
INSERT INTO `wms_inventory` VALUES (82, 61, 29, 1.00, NULL, 0, 115, '2022-12-28 11:39:15.139', 115, '2022-12-30 13:47:44.764', 38, 61);
INSERT INTO `wms_inventory` VALUES (83, 58, NULL, -1.00, NULL, 0, 115, '2022-12-28 13:42:51.766', NULL, NULL, 38, 61);
INSERT INTO `wms_inventory` VALUES (84, 58, NULL, 1.00, NULL, 0, 115, '2022-12-28 13:42:51.782', NULL, NULL, 42, 63);
INSERT INTO `wms_inventory` VALUES (85, 60, 30, 1.00, NULL, 0, 115, '2022-12-28 16:41:46.909', NULL, NULL, 43, 62);
INSERT INTO `wms_inventory` VALUES (86, 61, NULL, 14.00, NULL, 0, 115, '2022-12-28 17:11:04.420', 115, '2022-12-28 19:27:56.303', 42, 63);
INSERT INTO `wms_inventory` VALUES (87, 58, NULL, 11.00, NULL, 0, 115, '2022-12-28 17:11:04.420', NULL, NULL, 45, 65);
INSERT INTO `wms_inventory` VALUES (88, 61, NULL, -1.00, NULL, 0, 115, '2023-01-03 10:38:07.710', NULL, NULL, 38, 61);
INSERT INTO `wms_inventory` VALUES (89, 63, 31, 3.00, NULL, 0, 115, '2023-01-05 10:09:08.257', 115, '2023-01-05 16:08:25.963', 50, 67);
INSERT INTO `wms_inventory` VALUES (90, 65, NULL, 0.00, NULL, 0, 115, '2023-01-05 18:30:12.570', 115, '2023-01-06 14:19:56.094', 50, 69);
INSERT INTO `wms_inventory` VALUES (91, 63, 31, 2.00, NULL, 0, 115, '2023-01-06 08:02:26.984', 115, '2023-01-06 14:18:47.063', 50, 70);
INSERT INTO `wms_inventory` VALUES (92, 62, 31, 1.00, NULL, 0, 115, '2023-01-06 08:02:26.984', NULL, NULL, 50, 70);
INSERT INTO `wms_inventory` VALUES (93, 68, 34, 2.00, NULL, 0, 115, '2023-01-06 16:58:27.096', 115, '2023-01-07 14:14:37.234', 53, 73);
INSERT INTO `wms_inventory` VALUES (94, 67, 34, 1.00, NULL, 0, 115, '2023-01-06 16:58:27.096', NULL, NULL, 53, 73);
INSERT INTO `wms_inventory` VALUES (95, 67, NULL, 1.00, NULL, 0, 115, '2023-01-07 14:14:48.192', NULL, NULL, 54, NULL);
INSERT INTO `wms_inventory` VALUES (96, 75, 38, 202.00, NULL, 0, 115, '2023-01-08 00:19:53.237', 115, '2023-01-11 16:49:13.016', 61, 77);
INSERT INTO `wms_inventory` VALUES (97, 76, 43, 10100.00, NULL, 0, 115, '2023-01-09 00:17:19.189', 115, '2023-01-09 00:18:51.723', 61, 80);
INSERT INTO `wms_inventory` VALUES (98, 74, 38, 201.00, NULL, 0, 115, '2023-01-09 00:17:19.189', 115, '2023-01-11 16:49:13.016', 61, 77);
INSERT INTO `wms_inventory` VALUES (99, 73, 37, 10101.00, NULL, 0, 115, '2023-01-09 00:17:19.189', 115, '2023-01-11 16:49:13.016', 61, 77);
INSERT INTO `wms_inventory` VALUES (100, 72, 37, 100101.00, NULL, 0, 115, '2023-01-09 00:17:19.189', 115, '2023-01-11 16:49:13.016', 61, 77);
INSERT INTO `wms_inventory` VALUES (101, 71, 37, 1102.00, NULL, 0, 115, '2023-01-09 00:17:19.189', 115, '2023-01-11 20:49:04.489', 61, 77);
INSERT INTO `wms_inventory` VALUES (102, 74, 37, 10.00, NULL, 0, 115, '2023-01-09 02:17:11.315', NULL, NULL, 61, 77);
INSERT INTO `wms_inventory` VALUES (103, 71, 38, 1000.00, NULL, 0, 115, '2023-01-09 02:17:11.315', NULL, NULL, 61, 77);
INSERT INTO `wms_inventory` VALUES (104, 77, 47, 1.00, NULL, 0, 115, '2023-01-11 20:49:04.489', NULL, NULL, 64, 82);
INSERT INTO `wms_inventory` VALUES (105, 74, 47, 1.00, NULL, 0, 115, '2023-01-11 20:49:04.489', NULL, NULL, 64, 82);
INSERT INTO `wms_inventory` VALUES (106, 78, 49, 1.00, NULL, 0, 115, '2023-01-13 14:59:32.697', NULL, NULL, 67, 84);
INSERT INTO `wms_inventory` VALUES (107, 78, NULL, 19.00, NULL, 0, 115, '2023-01-13 19:26:39.264', 115, '2023-01-21 12:20:07.322', 69, NULL);
INSERT INTO `wms_inventory` VALUES (108, 80, NULL, 2.00, NULL, 0, 115, '2023-01-16 11:15:08.487', 115, '2023-01-21 12:20:07.322', 65, 86);
INSERT INTO `wms_inventory` VALUES (109, 80, 51, 127.00, NULL, 0, 115, '2023-01-16 11:17:07.421', 115, '2023-01-18 15:19:43.576', 65, 86);
INSERT INTO `wms_inventory` VALUES (110, 79, 50, 11.00, NULL, 0, 115, '2023-01-18 15:19:43.576', 115, '2023-01-23 20:23:34.171', 65, 86);
INSERT INTO `wms_inventory` VALUES (111, 80, 49, 1.00, NULL, 0, 115, '2023-01-23 16:33:55.410', NULL, NULL, 68, 85);
INSERT INTO `wms_inventory` VALUES (112, 80, NULL, 1.00, NULL, 0, 115, '2023-01-25 15:12:03.877', NULL, NULL, 66, 87);
INSERT INTO `wms_inventory` VALUES (113, 80, NULL, 2.00, NULL, 0, 115, '2023-01-25 17:24:35.635', NULL, NULL, 67, 84);
INSERT INTO `wms_inventory` VALUES (114, 87, NULL, 1.00, NULL, 0, 115, '2023-01-28 12:40:38.293', NULL, NULL, 66, 87);
INSERT INTO `wms_inventory` VALUES (115, 88, 50, 1.00, NULL, 0, 115, '2023-01-31 11:53:58.503', NULL, NULL, 66, 86);
INSERT INTO `wms_inventory` VALUES (116, 88, NULL, -1.00, NULL, 0, 115, '2023-01-31 11:57:19.259', NULL, NULL, 66, 86);
INSERT INTO `wms_inventory` VALUES (117, 88, NULL, 1.00, NULL, 0, 115, '2023-01-31 11:57:19.272', NULL, NULL, 67, NULL);
INSERT INTO `wms_inventory` VALUES (118, 88, 49, 1.00, NULL, 0, 115, '2023-01-31 14:09:17.803', NULL, NULL, 74, 84);
INSERT INTO `wms_inventory` VALUES (119, 88, NULL, 2.00, NULL, 0, 115, '2023-01-31 16:23:22.423', 115, '2023-01-31 16:38:29.464', 74, NULL);
INSERT INTO `wms_inventory` VALUES (120, 88, 49, 0.00, NULL, 0, 115, '2023-01-31 16:37:03.769', 115, '2023-01-31 16:39:58.324', 68, 85);
INSERT INTO `wms_inventory` VALUES (121, 89, 50, 490.00, NULL, 0, 115, '2023-02-01 22:08:22.038', 115, '2023-02-01 22:09:50.850', 76, 89);
INSERT INTO `wms_inventory` VALUES (122, 90, 49, 1.00, NULL, 0, 115, '2023-02-02 15:07:16.278', 115, '2023-02-04 20:50:32.322', 75, 90);
INSERT INTO `wms_inventory` VALUES (123, 90, NULL, -1.00, NULL, 0, 115, '2023-02-02 15:08:54.702', NULL, NULL, 75, 90);
INSERT INTO `wms_inventory` VALUES (124, 89, NULL, 0.00, NULL, 0, 115, '2023-02-02 15:11:59.389', 115, '2023-02-02 15:12:45.118', 75, NULL);
INSERT INTO `wms_inventory` VALUES (125, 91, 50, 4.00, NULL, 0, 115, '2023-02-02 22:07:16.216', 115, '2023-02-04 20:50:32.322', 76, 89);
INSERT INTO `wms_inventory` VALUES (126, 91, 49, 2.00, NULL, 0, 115, '2023-02-04 00:31:27.945', 115, '2023-02-06 14:13:47.132', 75, 90);
INSERT INTO `wms_inventory` VALUES (127, 91, NULL, 1.00, NULL, 0, 115, '2023-02-04 03:00:15.403', NULL, NULL, 75, 90);
INSERT INTO `wms_inventory` VALUES (128, 90, 52, 1.00, NULL, 0, 115, '2023-02-04 08:54:14.673', NULL, NULL, 78, 92);
INSERT INTO `wms_inventory` VALUES (129, 91, 52, 1.00, NULL, 0, 115, '2023-02-04 16:09:45.169', NULL, NULL, 78, 92);
INSERT INTO `wms_inventory` VALUES (130, 92, 52, 5.00, NULL, 0, 115, '2023-02-04 16:11:45.689', 115, '2023-02-04 16:38:06.194', 78, 92);
INSERT INTO `wms_inventory` VALUES (131, 93, 52, 5.00, NULL, 0, 115, '2023-02-04 16:36:29.671', 115, '2023-02-04 20:50:32.322', 78, 92);
INSERT INTO `wms_inventory` VALUES (132, 90, 51, 1.00, NULL, 0, 115, '2023-02-04 18:00:58.935', NULL, NULL, 77, 91);
INSERT INTO `wms_inventory` VALUES (133, 91, 51, 4.00, NULL, 0, 115, '2023-02-04 20:29:37.614', 115, '2023-02-06 13:54:18.212', 77, 91);
INSERT INTO `wms_inventory` VALUES (134, 94, 49, 0.00, NULL, 0, 115, '2023-02-06 11:51:05.721', 115, '2023-02-06 11:51:14.586', 75, 90);
INSERT INTO `wms_inventory` VALUES (135, 93, 50, 1.00, NULL, 0, 115, '2023-02-06 13:54:18.212', NULL, NULL, 76, 89);
INSERT INTO `wms_inventory` VALUES (136, 94, 53, 0.00, NULL, 0, 115, '2023-02-06 14:13:36.580', 115, '2023-02-06 15:15:14.142', 83, 94);
INSERT INTO `wms_inventory` VALUES (137, 93, 53, 0.00, NULL, 0, 115, '2023-02-06 14:13:36.580', 115, '2023-02-06 15:15:14.142', 83, 94);
INSERT INTO `wms_inventory` VALUES (138, 92, 53, 1.00, NULL, 0, 115, '2023-02-06 15:13:22.523', NULL, NULL, 83, 94);
INSERT INTO `wms_inventory` VALUES (139, 95, NULL, 0.00, NULL, 0, 115, '2023-02-06 15:21:15.363', 115, '2023-02-07 18:50:16.075', 84, NULL);
INSERT INTO `wms_inventory` VALUES (140, 94, NULL, 2.00, NULL, 0, 115, '2023-02-07 09:21:35.190', 115, '2023-02-08 09:36:43.833', 85, 95);
INSERT INTO `wms_inventory` VALUES (141, 96, 56, 1.00, NULL, 0, 115, '2023-02-08 09:16:11.419', NULL, NULL, 86, 98);
INSERT INTO `wms_inventory` VALUES (142, 97, 55, 1.00, NULL, 0, 115, '2023-02-08 09:16:11.419', NULL, NULL, 86, 98);
INSERT INTO `wms_inventory` VALUES (143, 94, 55, 1.00, NULL, 0, 115, '2023-02-08 09:35:44.281', NULL, NULL, 86, 98);
INSERT INTO `wms_inventory` VALUES (144, 97, 49, 2.00, NULL, 0, 115, '2023-02-08 10:40:33.292', NULL, NULL, 84, 96);
INSERT INTO `wms_inventory` VALUES (145, 97, NULL, 1.00, NULL, 0, 115, '2023-02-08 11:38:59.147', NULL, NULL, 85, 95);
INSERT INTO `wms_inventory` VALUES (146, 96, 55, 1.00, NULL, 0, 115, '2023-02-08 11:38:59.147', NULL, NULL, 86, 98);
INSERT INTO `wms_inventory` VALUES (147, 99, 57, 99.00, NULL, 0, 115, '2023-02-08 16:40:11.375', 115, '2023-02-08 16:43:52.724', 87, 100);
INSERT INTO `wms_inventory` VALUES (148, 99, 55, 1.00, NULL, 0, 115, '2023-02-08 16:43:52.739', NULL, NULL, 86, 98);
INSERT INTO `wms_inventory` VALUES (149, 99, 53, 0.00, NULL, 0, 115, '2023-02-09 14:27:51.818', 115, '2023-02-09 14:49:06.379', 83, 94);
INSERT INTO `wms_inventory` VALUES (150, 99, NULL, 1.00, NULL, 0, 115, '2023-02-09 14:49:06.392', NULL, NULL, 84, NULL);
INSERT INTO `wms_inventory` VALUES (151, 100, 49, 2.00, NULL, 0, 115, '2023-02-10 15:50:01.969', 115, '2023-02-12 11:11:02.998', 84, 96);
INSERT INTO `wms_inventory` VALUES (152, 101, NULL, 0.00, NULL, 0, 115, '2023-02-10 15:56:53.563', 115, '2023-02-10 15:57:49.152', 89, 103);
INSERT INTO `wms_inventory` VALUES (153, 94, NULL, 2.00, NULL, 0, 115, '2023-02-11 11:10:58.900', NULL, NULL, 86, 99);
INSERT INTO `wms_inventory` VALUES (154, 93, 49, 2.00, NULL, 0, 115, '2023-02-11 11:10:58.900', NULL, NULL, 84, 96);
INSERT INTO `wms_inventory` VALUES (155, 99, NULL, 150.00, NULL, 0, 115, '2023-02-11 19:02:04.522', NULL, NULL, 91, 108);
INSERT INTO `wms_inventory` VALUES (156, 101, 61, 15.00, NULL, 0, 115, '2023-02-11 19:04:58.599', 115, '2023-02-12 11:12:08.970', 91, 105);
INSERT INTO `wms_inventory` VALUES (157, 99, 61, 5.00, NULL, 0, 115, '2023-02-11 19:04:58.599', 115, '2023-02-12 11:12:08.970', 91, 105);
INSERT INTO `wms_inventory` VALUES (158, 99, NULL, 10.00, NULL, 0, 115, '2023-02-11 20:17:33.114', NULL, NULL, 91, 106);
INSERT INTO `wms_inventory` VALUES (159, 103, NULL, 1.00, NULL, 0, 115, '2023-02-13 11:35:41.681', NULL, NULL, 86, 99);
INSERT INTO `wms_inventory` VALUES (160, 102, 57, 1.00, NULL, 0, 115, '2023-02-13 11:36:15.370', NULL, NULL, 87, 100);
INSERT INTO `wms_inventory` VALUES (161, 103, 55, 2.00, NULL, 0, 115, '2023-02-13 11:38:39.754', 115, '2023-02-15 12:10:33.985', 86, 98);
INSERT INTO `wms_inventory` VALUES (162, 102, 56, 1.00, NULL, 0, 115, '2023-02-13 11:38:39.754', NULL, NULL, 86, 98);
INSERT INTO `wms_inventory` VALUES (163, 103, 57, 5.00, NULL, 0, 115, '2023-02-13 11:40:48.868', NULL, NULL, 87, 100);
INSERT INTO `wms_inventory` VALUES (164, 102, 61, 9.00, NULL, 0, 115, '2023-02-13 11:40:48.868', NULL, NULL, 91, 105);
INSERT INTO `wms_inventory` VALUES (165, 104, NULL, 1003.00, NULL, 0, 115, '2023-02-14 09:32:14.458', 115, '2023-02-14 17:24:04.141', 88, NULL);
INSERT INTO `wms_inventory` VALUES (166, 105, NULL, 4.00, NULL, 0, 115, '2023-02-15 11:30:11.909', NULL, NULL, 93, NULL);
INSERT INTO `wms_inventory` VALUES (167, 107, 64, 8888.00, NULL, 0, 115, '2023-02-15 15:09:57.330', NULL, NULL, 95, 111);
INSERT INTO `wms_inventory` VALUES (168, 108, 65, 15.00, NULL, 0, 115, '2023-02-16 15:19:19.833', NULL, NULL, 98, 112);
INSERT INTO `wms_inventory` VALUES (169, 110, 66, 16.00, NULL, 0, 115, '2023-02-17 10:56:03.265', 115, '2023-02-22 20:05:14.153', 101, 115);
INSERT INTO `wms_inventory` VALUES (170, 111, 67, 9.00, NULL, 0, 115, '2023-02-17 13:21:49.743', 115, '2023-02-17 13:22:13.036', 102, 116);
INSERT INTO `wms_inventory` VALUES (171, 113, 67, 2.00, NULL, 0, 115, '2023-02-17 15:52:07.266', 115, '2023-02-24 15:24:09.538', 102, 116);
INSERT INTO `wms_inventory` VALUES (172, 112, 67, 1.00, NULL, 0, 115, '2023-02-17 15:52:30.923', NULL, NULL, 102, 116);
INSERT INTO `wms_inventory` VALUES (173, 115, 67, 1.00, NULL, 0, 115, '2023-02-18 00:32:00.462', NULL, NULL, 101, 115);
INSERT INTO `wms_inventory` VALUES (174, 114, 67, 1.00, NULL, 0, 115, '2023-02-18 00:32:00.462', NULL, NULL, 101, 115);
INSERT INTO `wms_inventory` VALUES (175, 111, 67, 1.00, NULL, 0, 115, '2023-02-19 23:33:13.569', NULL, NULL, 104, 117);
INSERT INTO `wms_inventory` VALUES (176, 114, 67, 2.00, NULL, 0, 115, '2023-02-20 10:41:13.526', 115, '2023-02-24 15:24:09.538', 102, 116);
INSERT INTO `wms_inventory` VALUES (177, 115, NULL, 11.00, NULL, 0, 115, '2023-02-21 10:32:34.983', 115, '2023-02-21 10:41:20.284', 105, NULL);
INSERT INTO `wms_inventory` VALUES (178, 117, 68, 897.00, NULL, 0, 115, '2023-02-21 14:19:02.943', 115, '2023-02-24 15:24:09.538', 106, 118);
INSERT INTO `wms_inventory` VALUES (179, 117, NULL, 1.00, NULL, 0, 115, '2023-02-21 14:21:05.790', NULL, NULL, 105, NULL);
INSERT INTO `wms_inventory` VALUES (180, 117, NULL, -1.00, NULL, 0, 115, '2023-02-22 14:00:20.327', NULL, NULL, 106, NULL);
INSERT INTO `wms_inventory` VALUES (181, 112, 66, 1.00, NULL, 0, 115, '2023-02-22 20:05:14.153', 115, '2023-02-24 16:38:24.378', 101, 115);
INSERT INTO `wms_inventory` VALUES (182, 114, NULL, 1.00, NULL, 0, 115, '2023-02-23 22:16:22.929', NULL, NULL, 107, NULL);
INSERT INTO `wms_inventory` VALUES (183, 112, NULL, 1.00, NULL, 0, 115, '2023-02-23 22:16:22.929', NULL, NULL, 107, NULL);
INSERT INTO `wms_inventory` VALUES (184, 115, 67, 1.00, NULL, 0, 115, '2023-02-24 15:24:09.538', NULL, NULL, 104, 117);
INSERT INTO `wms_inventory` VALUES (185, 117, 71, 1.00, NULL, 0, 115, '2023-02-24 15:28:30.433', 115, '2023-02-24 16:38:24.378', 109, 120);
INSERT INTO `wms_inventory` VALUES (186, 117, NULL, 2.00, NULL, 0, 115, '2023-02-25 00:41:10.269', NULL, NULL, 111, 121);
INSERT INTO `wms_inventory` VALUES (187, 112, NULL, 1.00, NULL, 0, 115, '2023-02-25 00:41:10.269', NULL, NULL, 111, 121);
INSERT INTO `wms_inventory` VALUES (188, 119, NULL, 9.00, NULL, 0, 115, '2023-02-26 15:13:26.028', 115, '2023-02-27 12:33:01.014', 111, NULL);
INSERT INTO `wms_inventory` VALUES (189, 118, NULL, 8.00, NULL, 0, 115, '2023-02-26 15:17:09.372', 115, '2023-02-27 12:33:01.014', 111, NULL);
INSERT INTO `wms_inventory` VALUES (190, 121, NULL, 6.00, NULL, 0, 115, '2023-02-27 10:20:16.149', 115, '2023-02-28 11:08:42.073', 111, NULL);
INSERT INTO `wms_inventory` VALUES (191, 122, NULL, 0.00, NULL, 0, 115, '2023-02-27 10:36:12.838', 115, '2023-02-27 10:36:27.673', 115, 125);
INSERT INTO `wms_inventory` VALUES (192, 120, NULL, 4.00, NULL, 0, 115, '2023-02-27 12:33:01.014', 115, '2023-02-27 12:34:17.346', 111, NULL);
INSERT INTO `wms_inventory` VALUES (193, 121, NULL, 1.00, NULL, 0, 115, '2023-02-27 22:45:36.778', NULL, NULL, 114, NULL);
INSERT INTO `wms_inventory` VALUES (194, 120, NULL, 1.00, NULL, 0, 115, '2023-02-27 22:45:36.778', NULL, NULL, 114, NULL);
INSERT INTO `wms_inventory` VALUES (195, 119, NULL, 1.00, NULL, 0, 115, '2023-02-27 22:45:36.778', NULL, NULL, 114, NULL);
INSERT INTO `wms_inventory` VALUES (196, 118, NULL, 1.00, NULL, 0, 115, '2023-02-27 22:45:36.778', NULL, NULL, 114, NULL);
INSERT INTO `wms_inventory` VALUES (197, 121, NULL, 3.00, NULL, 0, 115, '2023-02-28 00:16:22.646', 115, '2023-02-28 11:07:08.792', 113, NULL);
INSERT INTO `wms_inventory` VALUES (198, 121, 74, 322424.00, NULL, 0, 115, '2023-03-01 03:09:32.715', NULL, NULL, 116, 126);
INSERT INTO `wms_inventory` VALUES (199, 120, 74, 234324224.00, NULL, 0, 115, '2023-03-01 03:09:32.715', NULL, NULL, 116, 126);
INSERT INTO `wms_inventory` VALUES (200, 121, NULL, 100.00, NULL, 0, 115, '2023-03-01 10:26:33.722', NULL, NULL, 116, NULL);
INSERT INTO `wms_inventory` VALUES (201, 123, 74, 2147484147.00, NULL, 0, 115, '2023-03-01 16:06:21.737', 115, '2023-03-01 17:29:30.106', 116, 126);
INSERT INTO `wms_inventory` VALUES (202, 125, 77, 600.00, NULL, 0, 115, '2023-03-01 18:04:56.697', 115, '2023-03-02 09:46:27.576', 118, 128);
INSERT INTO `wms_inventory` VALUES (203, 124, 76, 1.00, NULL, 0, 115, '2023-03-01 18:04:56.697', NULL, NULL, 119, 131);
INSERT INTO `wms_inventory` VALUES (204, 124, 79, 173.00, NULL, 0, 115, '2023-03-02 09:21:54.236', 115, '2023-03-02 09:26:39.313', 119, 131);
INSERT INTO `wms_inventory` VALUES (205, 125, 78, 100.00, NULL, 0, 115, '2023-03-02 09:36:22.806', 115, '2023-03-03 08:51:42.551', 118, 129);
INSERT INTO `wms_inventory` VALUES (206, 125, NULL, 1.00, NULL, 0, 115, '2023-03-03 08:30:31.419', NULL, NULL, 117, 127);
INSERT INTO `wms_inventory` VALUES (207, 124, 78, 1.00, NULL, 0, 115, '2023-03-03 08:30:31.419', NULL, NULL, 118, 129);
INSERT INTO `wms_inventory` VALUES (208, 125, NULL, 2.00, NULL, 0, 115, '2023-03-03 08:44:50.870', 115, '2023-03-03 08:45:43.804', 118, 129);
INSERT INTO `wms_inventory` VALUES (209, 125, NULL, -1.00, NULL, 0, 115, '2023-03-03 08:46:33.889', NULL, NULL, 118, NULL);
INSERT INTO `wms_inventory` VALUES (210, 125, NULL, -1.00, NULL, 0, 115, '2023-03-03 08:50:25.513', NULL, NULL, 117, NULL);
INSERT INTO `wms_inventory` VALUES (211, 125, NULL, 1.00, NULL, 0, 115, '2023-03-03 12:57:29.349', NULL, NULL, 116, NULL);
INSERT INTO `wms_inventory` VALUES (212, 128, 90, 2.00, NULL, 0, 115, '2023-03-03 21:42:50.036', NULL, NULL, 122, 135);
INSERT INTO `wms_inventory` VALUES (213, 127, 91, 12.00, NULL, 0, 115, '2023-03-03 21:42:50.036', NULL, NULL, 122, 135);
INSERT INTO `wms_inventory` VALUES (214, 127, 90, 291.00, NULL, 0, 115, '2023-03-03 22:00:24.609', 115, '2023-03-05 16:13:36.820', 122, 135);
INSERT INTO `wms_inventory` VALUES (215, 130, NULL, 9.00, NULL, 0, 115, '2023-03-03 22:37:09.320', 115, '2023-03-06 16:55:41.104', 117, 127);
INSERT INTO `wms_inventory` VALUES (216, 130, 89, 2.00, NULL, 0, 115, '2023-03-06 08:28:08.819', 115, '2023-03-07 14:17:46.380', 121, 134);
INSERT INTO `wms_inventory` VALUES (217, 129, 89, 2.00, NULL, 0, 115, '2023-03-06 08:28:08.819', 115, '2023-03-07 09:41:10.157', 121, 134);
INSERT INTO `wms_inventory` VALUES (218, 128, 91, 0.00, NULL, 0, 115, '2023-03-06 08:28:08.819', 115, '2023-03-10 15:24:24.792', 122, 135);
INSERT INTO `wms_inventory` VALUES (219, 130, 78, 10.00, NULL, 0, 115, '2023-03-06 16:53:49.700', 115, '2023-03-06 16:55:41.118', 118, 129);
INSERT INTO `wms_inventory` VALUES (220, 131, 92, 1.00, NULL, 0, 115, '2023-03-08 09:37:18.541', NULL, NULL, 117, 136);
INSERT INTO `wms_inventory` VALUES (221, 131, NULL, 200.00, NULL, 0, 115, '2023-03-08 09:39:15.806', NULL, NULL, 117, 127);
INSERT INTO `wms_inventory` VALUES (222, 133, 92, 16.00, NULL, 0, 115, '2023-03-09 13:02:37.798', 115, '2023-03-10 15:24:18.514', 117, 136);
INSERT INTO `wms_inventory` VALUES (223, 131, NULL, 1.00, NULL, 0, 115, '2023-03-09 15:10:54.188', NULL, NULL, 117, 136);
INSERT INTO `wms_inventory` VALUES (224, 132, NULL, 1.00, NULL, 0, 115, '2023-03-10 15:29:42.886', NULL, NULL, NULL, NULL);
INSERT INTO `wms_inventory` VALUES (225, 134, NULL, 1.00, NULL, 0, 115, '2023-03-12 13:39:25.770', NULL, NULL, 130, NULL);
INSERT INTO `wms_inventory` VALUES (226, 134, 94, 0.00, NULL, 0, 115, '2023-03-12 16:02:14.188', 115, '2023-03-12 16:10:28.545', 131, 142);
INSERT INTO `wms_inventory` VALUES (227, 134, NULL, 6.00, NULL, 0, 115, '2023-03-13 00:24:13.168', NULL, NULL, 132, NULL);
INSERT INTO `wms_inventory` VALUES (228, 135, NULL, 1.00, NULL, 0, 115, '2023-03-13 04:17:07.848', NULL, NULL, 133, NULL);
INSERT INTO `wms_inventory` VALUES (229, 136, NULL, 1.00, NULL, 0, 115, '2023-03-13 10:30:16.750', NULL, NULL, NULL, NULL);
INSERT INTO `wms_inventory` VALUES (230, 137, NULL, 50.00, NULL, 0, 115, '2023-03-13 10:32:39.616', NULL, NULL, NULL, NULL);
INSERT INTO `wms_inventory` VALUES (231, 136, NULL, 100.00, NULL, 0, 115, '2023-03-13 10:32:39.616', NULL, NULL, NULL, NULL);
INSERT INTO `wms_inventory` VALUES (232, 138, 96, 1.00, NULL, 0, 115, '2023-03-13 15:23:51.408', NULL, NULL, 134, 144);
INSERT INTO `wms_inventory` VALUES (233, 137, 96, 1.00, NULL, 0, 115, '2023-03-13 15:23:51.408', NULL, NULL, 134, 144);
INSERT INTO `wms_inventory` VALUES (234, 138, NULL, -1.00, NULL, 0, 115, '2023-03-13 15:25:21.387', NULL, NULL, 134, 144);
INSERT INTO `wms_inventory` VALUES (235, 137, NULL, 4.00, NULL, 0, 115, '2023-03-13 15:39:42.613', 115, '2023-03-22 15:29:18.441', 135, NULL);
INSERT INTO `wms_inventory` VALUES (236, 138, NULL, 3.00, NULL, 0, 115, '2023-03-13 15:52:23.875', 115, '2023-03-22 15:29:18.441', 135, NULL);
INSERT INTO `wms_inventory` VALUES (237, 139, NULL, 102.00, NULL, 0, 115, '2023-03-13 15:56:25.101', 115, '2023-03-14 13:49:07.851', 136, 145);
INSERT INTO `wms_inventory` VALUES (238, 140, NULL, 0.00, NULL, 0, 115, '2023-03-13 16:30:47.757', 115, '2023-03-13 16:33:18.100', 135, 147);
INSERT INTO `wms_inventory` VALUES (239, 136, 96, 1.00, NULL, 0, 115, '2023-03-14 09:53:57.700', NULL, NULL, 135, 147);
INSERT INTO `wms_inventory` VALUES (240, 140, 96, 3.00, NULL, 0, 115, '2023-03-14 13:49:07.851', 115, '2023-03-22 15:29:18.441', 135, 147);
INSERT INTO `wms_inventory` VALUES (241, 142, 97, 9852.00, NULL, 0, 115, '2023-03-14 16:17:08.572', 115, '2023-03-16 11:30:34.615', 135, 147);
INSERT INTO `wms_inventory` VALUES (242, 141, NULL, 0.00, NULL, 0, 115, '2023-03-15 18:46:37.832', 115, '2023-03-16 18:32:12.617', 137, NULL);
INSERT INTO `wms_inventory` VALUES (243, 142, NULL, 1.00, NULL, 0, 115, '2023-03-15 18:46:37.832', NULL, NULL, 137, 148);
INSERT INTO `wms_inventory` VALUES (244, 140, NULL, 1.00, NULL, 0, 115, '2023-03-15 21:50:15.570', NULL, NULL, 135, 149);
INSERT INTO `wms_inventory` VALUES (245, 142, NULL, 1.00, NULL, 0, 115, '2023-03-16 09:21:46.760', NULL, NULL, 138, NULL);
INSERT INTO `wms_inventory` VALUES (246, 139, NULL, 3.00, NULL, 0, 115, '2023-03-16 11:30:34.615', 115, '2023-03-22 15:29:18.441', 136, NULL);
INSERT INTO `wms_inventory` VALUES (247, 136, NULL, 1.00, NULL, 0, 115, '2023-03-16 11:30:34.615', NULL, NULL, NULL, NULL);
INSERT INTO `wms_inventory` VALUES (248, 141, 96, 2.00, NULL, 0, 115, '2023-03-16 11:30:34.615', 115, '2023-03-16 18:07:01.878', 135, 147);
INSERT INTO `wms_inventory` VALUES (249, 141, NULL, 1.00, NULL, 0, 115, '2023-03-16 18:32:12.633', NULL, NULL, 135, 149);
INSERT INTO `wms_inventory` VALUES (250, 142, NULL, 3.00, NULL, 0, 115, '2023-03-17 15:32:11.118', 115, '2023-03-22 15:29:18.441', 136, 145);
INSERT INTO `wms_inventory` VALUES (251, 142, 98, 1.00, NULL, 0, 115, '2023-03-17 18:06:04.191', NULL, NULL, 137, 148);
INSERT INTO `wms_inventory` VALUES (252, 141, 97, 1.00, NULL, 0, 115, '2023-03-17 18:06:04.191', NULL, NULL, 135, 147);
INSERT INTO `wms_inventory` VALUES (253, 142, NULL, 1.00, NULL, 0, 115, '2023-03-20 08:40:39.425', NULL, NULL, 137, NULL);
INSERT INTO `wms_inventory` VALUES (254, 141, NULL, 1.00, NULL, 0, 115, '2023-03-20 08:40:39.425', NULL, NULL, 138, NULL);
INSERT INTO `wms_inventory` VALUES (255, 142, NULL, 188.00, NULL, 0, 115, '2023-03-20 11:36:07.211', NULL, NULL, 139, NULL);
INSERT INTO `wms_inventory` VALUES (256, 141, NULL, 6000.00, NULL, 0, 115, '2023-03-20 11:36:07.211', NULL, NULL, 135, NULL);
INSERT INTO `wms_inventory` VALUES (257, 143, 97, 1.00, NULL, 0, 115, '2023-03-20 13:48:34.926', 115, '2023-03-20 14:08:46.476', 135, 147);
INSERT INTO `wms_inventory` VALUES (258, 142, NULL, 1.00, NULL, 0, 115, '2023-03-20 16:49:02.100', NULL, NULL, 135, 149);
INSERT INTO `wms_inventory` VALUES (259, 144, 98, 1.00, NULL, 0, 115, '2023-03-21 17:24:15.426', NULL, NULL, 137, 148);
INSERT INTO `wms_inventory` VALUES (260, 143, 96, 2.00, NULL, 0, 115, '2023-03-21 17:24:15.426', 115, '2023-03-22 15:29:18.441', 136, 145);
INSERT INTO `wms_inventory` VALUES (261, 144, NULL, 1.00, NULL, 0, 115, '2023-03-21 17:25:21.779', NULL, NULL, 139, NULL);
INSERT INTO `wms_inventory` VALUES (262, 145, 99, 4.00, NULL, 0, 115, '2023-03-21 19:33:36.157', 115, '2023-03-23 11:07:53.379', 149, 151);
INSERT INTO `wms_inventory` VALUES (263, 146, NULL, 1.00, NULL, 0, 115, '2023-03-22 00:18:02.107', NULL, NULL, 150, NULL);
INSERT INTO `wms_inventory` VALUES (264, 144, NULL, 1.00, NULL, 0, 115, '2023-03-22 09:44:10.142', NULL, NULL, NULL, NULL);
INSERT INTO `wms_inventory` VALUES (265, 146, NULL, 1.00, NULL, 0, 115, '2023-03-22 12:58:50.520', NULL, NULL, NULL, NULL);
INSERT INTO `wms_inventory` VALUES (266, 146, NULL, 1.00, NULL, 0, 115, '2023-03-22 15:29:18.441', NULL, NULL, 143, NULL);
INSERT INTO `wms_inventory` VALUES (267, 144, NULL, 1.00, NULL, 0, 115, '2023-03-22 15:29:18.441', NULL, NULL, NULL, NULL);
INSERT INTO `wms_inventory` VALUES (268, 141, 98, 1.00, NULL, 0, 115, '2023-03-22 15:29:18.441', NULL, NULL, 137, 148);
INSERT INTO `wms_inventory` VALUES (269, 146, NULL, 1.00, NULL, 0, 115, '2023-03-22 15:31:47.070', NULL, NULL, 136, NULL);
INSERT INTO `wms_inventory` VALUES (270, 145, NULL, 1.00, NULL, 0, 115, '2023-03-22 15:31:47.070', NULL, NULL, 136, NULL);
INSERT INTO `wms_inventory` VALUES (271, 147, 100, 122.00, NULL, 0, 115, '2023-03-22 15:56:16.813', 115, '2023-03-23 11:07:53.379', 154, 152);
INSERT INTO `wms_inventory` VALUES (272, 147, 101, 2.00, NULL, 0, 115, '2023-03-22 16:15:01.729', 115, '2023-03-23 13:39:37.480', 154, 152);
INSERT INTO `wms_inventory` VALUES (273, 148, 102, 0.00, NULL, 0, 115, '2023-03-22 22:51:19.722', 115, '2023-03-22 22:53:08.555', 155, 153);
INSERT INTO `wms_inventory` VALUES (274, 148, NULL, 1.00, NULL, 0, 115, '2023-03-23 09:46:58.327', NULL, NULL, NULL, NULL);
INSERT INTO `wms_inventory` VALUES (275, 148, NULL, 1.00, NULL, 0, 115, '2023-03-23 10:37:47.940', NULL, NULL, NULL, NULL);
INSERT INTO `wms_inventory` VALUES (276, 140, NULL, 1.00, NULL, 0, 115, '2023-03-23 10:40:39.851', NULL, NULL, 136, 145);
INSERT INTO `wms_inventory` VALUES (277, 148, NULL, 1.00, NULL, 0, 115, '2023-03-23 11:05:57.971', NULL, NULL, NULL, NULL);
INSERT INTO `wms_inventory` VALUES (278, 146, NULL, 1.00, NULL, 0, 115, '2023-03-23 11:05:57.971', NULL, NULL, NULL, NULL);
INSERT INTO `wms_inventory` VALUES (279, 144, NULL, 1.00, NULL, 0, 115, '2023-03-23 11:05:57.971', NULL, NULL, NULL, NULL);
INSERT INTO `wms_inventory` VALUES (280, 146, NULL, 1.00, NULL, 0, 115, '2023-03-23 11:07:53.379', NULL, NULL, NULL, NULL);
INSERT INTO `wms_inventory` VALUES (281, 148, 98, 2.00, NULL, 0, 115, '2023-03-23 11:07:53.379', 115, '2023-04-01 23:51:54.865', 137, 148);
INSERT INTO `wms_inventory` VALUES (282, 152, NULL, 1.00, NULL, 0, 115, '2023-03-24 14:24:55.539', NULL, NULL, 137, NULL);
INSERT INTO `wms_inventory` VALUES (283, 150, NULL, 10.00, NULL, 0, 115, '2023-03-24 15:50:14.267', NULL, NULL, 138, 150);
INSERT INTO `wms_inventory` VALUES (284, 146, NULL, 1.00, NULL, 0, 115, '2023-03-25 15:27:42.038', NULL, NULL, 164, NULL);
INSERT INTO `wms_inventory` VALUES (285, 156, NULL, 1.00, NULL, 0, 115, '2023-03-25 15:27:42.038', NULL, NULL, 165, 157);
INSERT INTO `wms_inventory` VALUES (286, 157, NULL, 1.00, NULL, 0, 115, '2023-03-26 19:52:24.467', NULL, NULL, 166, NULL);
INSERT INTO `wms_inventory` VALUES (287, 158, NULL, 100.00, NULL, 0, 115, '2023-03-27 11:17:46.282', NULL, NULL, NULL, NULL);
INSERT INTO `wms_inventory` VALUES (288, 158, NULL, 200.00, NULL, 0, 115, '2023-03-27 11:18:43.718', NULL, NULL, 143, NULL);
INSERT INTO `wms_inventory` VALUES (289, 159, NULL, 100.00, NULL, 0, 115, '2023-03-27 11:20:41.528', 115, '2023-03-27 11:22:04.530', 143, NULL);
INSERT INTO `wms_inventory` VALUES (290, 160, NULL, 1.00, NULL, 0, 115, '2023-03-29 13:59:56.940', NULL, NULL, 140, NULL);
INSERT INTO `wms_inventory` VALUES (291, 161, NULL, 1.00, NULL, 0, 115, '2023-03-29 13:59:56.940', NULL, NULL, 138, 150);
INSERT INTO `wms_inventory` VALUES (292, 156, 98, 1.00, NULL, 0, 115, '2023-03-29 14:36:11.984', NULL, NULL, 137, 148);
INSERT INTO `wms_inventory` VALUES (293, 161, NULL, 16.00, NULL, 0, 115, '2023-03-29 14:40:03.030', 115, '2023-03-29 15:04:23.597', 140, NULL);
INSERT INTO `wms_inventory` VALUES (294, 158, NULL, 5.00, NULL, 0, 115, '2023-03-29 15:13:42.511', NULL, NULL, NULL, NULL);
INSERT INTO `wms_inventory` VALUES (295, 160, NULL, 9.00, NULL, 0, 115, '2023-03-29 15:13:42.511', 115, '2023-03-29 15:21:50.786', 138, 150);
INSERT INTO `wms_inventory` VALUES (296, 158, NULL, 1.00, NULL, 0, 115, '2023-03-29 15:16:21.476', NULL, NULL, NULL, NULL);
INSERT INTO `wms_inventory` VALUES (297, 162, NULL, 149.00, NULL, 0, 115, '2023-03-30 18:29:22.343', 115, '2023-04-03 13:48:21.561', 138, 160);
INSERT INTO `wms_inventory` VALUES (298, 158, NULL, 1.00, NULL, 0, 115, '2023-03-31 14:31:38.872', NULL, NULL, 138, 150);
INSERT INTO `wms_inventory` VALUES (299, 152, NULL, 1.00, NULL, 0, 115, '2023-04-01 23:51:54.865', NULL, NULL, 138, 150);
INSERT INTO `wms_inventory` VALUES (300, 157, NULL, 1.00, NULL, 0, 115, '2023-04-03 09:21:08.866', NULL, NULL, 138, 150);
INSERT INTO `wms_inventory` VALUES (301, 162, 110, 2.00, NULL, 0, 115, '2023-04-03 13:17:38.341', 115, '2023-04-06 17:42:32.407', 138, 160);
INSERT INTO `wms_inventory` VALUES (302, 162, NULL, 1.00, NULL, 0, 115, '2023-04-03 13:40:59.690', NULL, NULL, 138, 150);
INSERT INTO `wms_inventory` VALUES (303, 157, NULL, 1.00, NULL, 0, 115, '2023-04-03 13:40:59.690', NULL, NULL, 140, 145);
INSERT INTO `wms_inventory` VALUES (304, 158, 107, 1.00, NULL, 0, 115, '2023-04-03 13:40:59.690', NULL, NULL, 139, 155);
INSERT INTO `wms_inventory` VALUES (305, 157, NULL, 1.00, NULL, 0, 115, '2023-04-03 14:00:07.341', NULL, NULL, NULL, NULL);
INSERT INTO `wms_inventory` VALUES (306, 157, NULL, 499.00, NULL, 0, 115, '2023-04-03 14:00:48.544', NULL, NULL, NULL, NULL);
INSERT INTO `wms_inventory` VALUES (307, 157, NULL, 500.00, NULL, 0, 115, '2023-04-03 14:01:22.059', NULL, NULL, NULL, NULL);
INSERT INTO `wms_inventory` VALUES (308, 157, NULL, 300.00, NULL, 0, 115, '2023-04-03 14:10:43.967', NULL, NULL, NULL, NULL);
INSERT INTO `wms_inventory` VALUES (309, 157, 104, 300.00, NULL, 0, 115, '2023-04-03 14:16:27.977', NULL, NULL, 139, 155);
INSERT INTO `wms_inventory` VALUES (310, 157, NULL, -1.00, NULL, 0, 115, '2023-04-03 14:17:44.014', NULL, NULL, 139, NULL);
INSERT INTO `wms_inventory` VALUES (311, 157, NULL, 3700.00, NULL, 0, 115, '2023-04-03 14:23:52.108', 115, '2023-04-03 14:25:19.501', 144, NULL);
INSERT INTO `wms_inventory` VALUES (312, 163, 110, 80.00, NULL, 0, 115, '2023-04-03 16:25:21.859', 115, '2023-04-03 16:27:17.515', 138, 160);
INSERT INTO `wms_inventory` VALUES (313, 162, 104, 1.00, NULL, 0, 115, '2023-04-04 13:40:37.680', NULL, NULL, 139, 155);
INSERT INTO `wms_inventory` VALUES (314, 162, 107, 2.00, NULL, 0, 115, '2023-04-04 15:53:10.982', 115, '2023-04-06 22:34:08.212', 139, 155);
INSERT INTO `wms_inventory` VALUES (315, 162, NULL, 4.00, NULL, 0, 115, '2023-04-04 15:55:45.063', 115, '2023-04-07 11:10:06.408', 147, NULL);
INSERT INTO `wms_inventory` VALUES (316, 168, NULL, 21.00, NULL, 0, 115, '2023-04-06 14:13:57.963', 115, '2023-04-06 14:14:19.352', 181, NULL);
INSERT INTO `wms_inventory` VALUES (317, 169, 113, 12.00, NULL, 0, 115, '2023-04-06 15:12:31.959', 115, '2023-04-06 18:02:20.479', 184, 169);
INSERT INTO `wms_inventory` VALUES (318, 169, 107, 1.00, NULL, 0, 115, '2023-04-06 17:56:51.673', NULL, NULL, 139, 155);
INSERT INTO `wms_inventory` VALUES (319, 165, 109, 1.00, NULL, 0, 115, '2023-04-06 18:02:05.717', NULL, NULL, 139, 155);
INSERT INTO `wms_inventory` VALUES (320, 170, 114, 0.00, NULL, 0, 115, '2023-04-06 22:45:01.075', 115, '2023-04-06 22:46:28.694', 185, 170);
INSERT INTO `wms_inventory` VALUES (321, 170, 107, 101.00, NULL, 0, 115, '2023-04-07 11:07:27.883', 115, '2023-04-07 11:11:55.447', 139, 155);
INSERT INTO `wms_inventory` VALUES (322, 170, 113, 1.00, NULL, 0, 115, '2023-04-08 21:37:28.900', NULL, NULL, 184, 169);
INSERT INTO `wms_inventory` VALUES (323, 171, NULL, 2.00, NULL, 0, 115, '2023-04-10 10:49:53.343', NULL, NULL, 155, 172);
INSERT INTO `wms_inventory` VALUES (324, 171, 102, 2.00, NULL, 0, 115, '2023-04-10 16:07:17.853', 115, '2023-04-12 09:14:43.050', 155, 171);
INSERT INTO `wms_inventory` VALUES (325, 172, NULL, 8.00, NULL, 0, 115, '2023-04-10 16:50:33.609', 115, '2023-04-12 14:12:40.744', 154, NULL);
INSERT INTO `wms_inventory` VALUES (326, 171, NULL, 1.00, NULL, 0, 115, '2023-04-10 19:53:21.497', NULL, NULL, 154, NULL);
INSERT INTO `wms_inventory` VALUES (327, 172, NULL, 1.00, NULL, 0, 115, '2023-04-11 12:03:34.277', NULL, NULL, 190, NULL);
INSERT INTO `wms_inventory` VALUES (328, 172, NULL, 1.00, NULL, 0, 115, '2023-04-11 12:04:55.554', NULL, NULL, 189, NULL);
INSERT INTO `wms_inventory` VALUES (329, 173, NULL, 3.00, NULL, 0, 115, '2023-04-11 15:25:07.184', NULL, NULL, 157, NULL);
INSERT INTO `wms_inventory` VALUES (330, 173, 115, 0.00, NULL, 0, 115, '2023-04-11 15:58:50.262', 115, '2023-04-11 16:01:14.384', 178, 176);
INSERT INTO `wms_inventory` VALUES (331, 172, NULL, 3.00, NULL, 0, 115, '2023-04-11 15:59:25.789', 115, '2023-04-11 17:33:10.519', 157, NULL);
INSERT INTO `wms_inventory` VALUES (332, 174, NULL, 6.00, NULL, 0, 115, '2023-04-12 16:54:37.727', NULL, NULL, 157, NULL);
INSERT INTO `wms_inventory` VALUES (333, 173, NULL, 5.00, NULL, 0, 115, '2023-04-12 16:54:51.002', NULL, NULL, 158, NULL);
INSERT INTO `wms_inventory` VALUES (334, 178, 116, 0.00, NULL, 0, 115, '2023-04-13 12:23:32.711', 115, '2023-04-25 15:46:56.392', 192, 178);
INSERT INTO `wms_inventory` VALUES (335, 180, 122, 194.00, NULL, 0, 115, '2023-04-13 13:52:02.635', 115, '2023-04-25 15:46:56.392', 198, 185);
INSERT INTO `wms_inventory` VALUES (336, 178, 120, 1.00, NULL, 0, 115, '2023-04-13 13:54:23.411', NULL, NULL, 196, 183);
INSERT INTO `wms_inventory` VALUES (337, 180, NULL, 1.00, NULL, 0, 115, '2023-04-13 13:55:12.863', NULL, NULL, 199, 186);
INSERT INTO `wms_inventory` VALUES (338, 180, 119, 2.00, NULL, 0, 115, '2023-04-14 11:18:22.794', 115, '2023-04-14 15:52:38.690', 195, 182);
INSERT INTO `wms_inventory` VALUES (339, 180, 118, 0.00, NULL, 0, 115, '2023-04-15 09:09:42.331', 115, '2023-04-22 19:18:53.015', 194, 181);
INSERT INTO `wms_inventory` VALUES (340, 176, 118, 1.00, NULL, 0, 115, '2023-04-15 09:09:42.331', NULL, NULL, 194, 181);
INSERT INTO `wms_inventory` VALUES (341, 178, 117, 5.00, NULL, 0, 115, '2023-04-15 16:23:32.420', NULL, NULL, 193, 180);
INSERT INTO `wms_inventory` VALUES (342, 180, NULL, 1.00, NULL, 0, 115, '2023-04-15 16:27:27.847', NULL, NULL, 193, NULL);
INSERT INTO `wms_inventory` VALUES (343, 178, 118, 5.00, NULL, 0, 115, '2023-04-15 16:48:15.398', NULL, NULL, 194, 181);
INSERT INTO `wms_inventory` VALUES (344, 180, 116, 10.00, NULL, 0, 115, '2023-04-17 13:33:54.127', NULL, NULL, 193, 178);
INSERT INTO `wms_inventory` VALUES (345, 180, NULL, -3.00, NULL, 0, 115, '2023-04-17 13:50:04.379', NULL, NULL, 198, 185);
INSERT INTO `wms_inventory` VALUES (346, 180, 123, 3.00, NULL, 0, 115, '2023-04-17 13:50:04.395', NULL, NULL, 199, 186);
INSERT INTO `wms_inventory` VALUES (347, 182, 116, 50.00, NULL, 0, 115, '2023-04-17 15:43:40.394', NULL, NULL, 193, 178);
INSERT INTO `wms_inventory` VALUES (348, 181, 124, 51.00, NULL, 0, 115, '2023-04-17 15:43:40.394', 115, '2023-04-19 09:24:19.759', 193, 178);
INSERT INTO `wms_inventory` VALUES (349, 182, 118, 0.00, NULL, 0, 115, '2023-04-18 13:28:06.084', 115, '2023-04-27 15:18:00.357', 194, 181);
INSERT INTO `wms_inventory` VALUES (350, 182, 124, 2.00, NULL, 0, 115, '2023-04-19 09:24:19.759', 115, '2023-04-19 23:03:23.574', 193, 178);
INSERT INTO `wms_inventory` VALUES (351, 182, NULL, 1.00, NULL, 0, 115, '2023-04-19 21:07:55.569', NULL, NULL, 194, 181);
INSERT INTO `wms_inventory` VALUES (352, 181, 116, 0.00, NULL, 0, 115, '2023-04-19 21:07:55.569', 115, '2023-04-25 15:46:56.392', 193, 178);
INSERT INTO `wms_inventory` VALUES (353, 181, 118, 8.00, NULL, 0, 115, '2023-04-22 19:15:25.129', 115, '2023-04-29 13:56:40.350', 194, 181);
INSERT INTO `wms_inventory` VALUES (354, 182, NULL, 1.00, NULL, 0, 115, '2023-04-23 14:01:12.828', NULL, NULL, 196, 183);
INSERT INTO `wms_inventory` VALUES (355, 184, 118, 1.00, NULL, 0, 115, '2023-04-24 10:35:48.434', NULL, NULL, 194, 181);
INSERT INTO `wms_inventory` VALUES (356, 182, 121, 1.00, NULL, 0, 115, '2023-04-24 10:35:48.434', NULL, NULL, 195, 182);
INSERT INTO `wms_inventory` VALUES (357, 181, 124, 1.00, NULL, 0, 115, '2023-04-24 10:35:48.434', NULL, NULL, 198, 185);
INSERT INTO `wms_inventory` VALUES (358, 185, 127, 0.00, NULL, 0, 115, '2023-04-24 15:36:26.664', 115, '2023-04-24 15:37:10.984', 215, 189);
INSERT INTO `wms_inventory` VALUES (359, 183, NULL, 1.00, NULL, 0, 115, '2023-04-25 14:56:10.790', NULL, NULL, 196, 183);
INSERT INTO `wms_inventory` VALUES (360, 185, 118, 0.00, NULL, 0, 115, '2023-04-25 14:56:10.790', 115, '2023-04-25 15:01:00.126', 194, 181);
INSERT INTO `wms_inventory` VALUES (361, 186, NULL, 6.00, NULL, 0, 115, '2023-04-25 15:54:34.259', 115, '2023-04-28 23:45:44.067', 196, 183);
INSERT INTO `wms_inventory` VALUES (362, 186, 118, 5.00, NULL, 0, 115, '2023-04-25 16:53:40.790', NULL, NULL, 194, 181);
INSERT INTO `wms_inventory` VALUES (363, 183, 119, 4.00, NULL, 0, 115, '2023-04-25 16:53:40.790', NULL, NULL, 195, 182);
INSERT INTO `wms_inventory` VALUES (364, 183, NULL, 1.00, NULL, 0, 115, '2023-04-25 18:31:31.133', NULL, NULL, NULL, NULL);
INSERT INTO `wms_inventory` VALUES (365, 187, 117, 2.00, NULL, 0, 115, '2023-04-26 17:17:59.199', 115, '2023-04-28 16:44:42.069', 194, 181);
INSERT INTO `wms_inventory` VALUES (366, 186, NULL, -1.00, NULL, 0, 115, '2023-04-28 23:45:44.067', 115, '2023-04-28 23:45:44.062', 194, 181);
INSERT INTO `wms_inventory` VALUES (367, 188, 117, 1.00, NULL, 0, 115, '2023-04-30 16:33:48.741', NULL, NULL, 194, 181);
INSERT INTO `wms_inventory` VALUES (368, 193, NULL, 1.00, NULL, 0, 115, '2023-05-04 10:35:32.621', NULL, NULL, 230, NULL);
INSERT INTO `wms_inventory` VALUES (369, 191, NULL, 1.00, NULL, 0, 115, '2023-05-04 10:35:32.621', NULL, NULL, 229, NULL);
INSERT INTO `wms_inventory` VALUES (370, 190, NULL, 1.00, NULL, 0, 115, '2023-05-04 10:35:32.621', NULL, NULL, 229, NULL);
INSERT INTO `wms_inventory` VALUES (371, 189, NULL, 1.00, NULL, 0, 115, '2023-05-04 10:35:32.621', NULL, NULL, 231, NULL);
INSERT INTO `wms_inventory` VALUES (372, 193, NULL, 1.00, NULL, 0, 115, '2023-05-04 16:41:41.994', NULL, NULL, 229, 216);

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
) ENGINE = InnoDB AUTO_INCREMENT = 52 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '库存盘点单据' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wms_inventory_check
-- ----------------------------
INSERT INTO `wms_inventory_check` VALUES (42, 'IV-2023-04-26-152650', NULL, 22, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, '2023-04-26 15:26:56.000', 1, '2023-04-26 17:01:05.241');
INSERT INTO `wms_inventory_check` VALUES (43, 'IV-2023-04-26-163020', NULL, 22, 1.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, '2023-04-26 16:30:43.000', 115, '2023-04-28 16:44:42.030');
INSERT INTO `wms_inventory_check` VALUES (44, 'IV-2023-04-26-163845', NULL, 11, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, '2023-04-26 16:38:59.447', NULL, NULL);
INSERT INTO `wms_inventory_check` VALUES (45, 'IV-2023-04-28-223832', NULL, 22, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 115, '2023-04-28 22:38:52.764', NULL, NULL);
INSERT INTO `wms_inventory_check` VALUES (46, 'IV-2023-04-28-223902', NULL, 22, 1.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 115, '2023-04-28 22:39:41.000', 115, '2023-04-28 23:45:44.047');
INSERT INTO `wms_inventory_check` VALUES (47, 'IV-2023-05-01-011346', NULL, 11, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 115, '2023-05-01 01:13:51.726', NULL, NULL);
INSERT INTO `wms_inventory_check` VALUES (48, 'IV-2023-05-02-090600', NULL, 11, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 115, '2023-05-02 09:06:05.860', NULL, NULL);
INSERT INTO `wms_inventory_check` VALUES (49, 'IV-2023-05-03-030804', NULL, 11, 3.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 115, '2023-05-03 03:08:49.260', NULL, NULL);
INSERT INTO `wms_inventory_check` VALUES (50, 'IV-2023-05-03-030904', NULL, 11, 6.00, NULL, NULL, NULL, 231, 217, NULL, NULL, NULL, 0, 115, '2023-05-03 03:10:01.700', NULL, NULL);
INSERT INTO `wms_inventory_check` VALUES (51, 'IV-2023-05-04-104902', NULL, 11, 0.00, NULL, NULL, NULL, 229, 216, NULL, NULL, NULL, 0, 115, '2023-05-04 10:50:08.621', NULL, NULL);

-- ----------------------------
-- Table structure for wms_inventory_check_detail
-- ----------------------------
DROP TABLE IF EXISTS `wms_inventory_check_detail`;
CREATE TABLE `wms_inventory_check_detail`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `inventory_check_id` bigint(20) NULL DEFAULT NULL COMMENT '库存盘点单',
  `item_id` bigint(20) NULL DEFAULT NULL COMMENT '物料',
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
) ENGINE = InnoDB AUTO_INCREMENT = 241 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '库存盘点单据详情' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wms_inventory_check_detail
-- ----------------------------
INSERT INTO `wms_inventory_check_detail` VALUES (195, 44, 186, 5.00, 5.00, 194, 181, NULL, 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `wms_inventory_check_detail` VALUES (196, 44, 186, 6.00, 6.00, 196, 183, NULL, 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `wms_inventory_check_detail` VALUES (197, 42, 187, 0.00, 0.00, NULL, NULL, NULL, 0, '物料是箱子', NULL, NULL, NULL, NULL);
INSERT INTO `wms_inventory_check_detail` VALUES (198, 43, 187, 0.00, 1.00, 194, 181, 117, 0, '测试一下说明', NULL, NULL, NULL, NULL);
INSERT INTO `wms_inventory_check_detail` VALUES (199, 45, 188, 0.00, 0.00, 197, 184, NULL, 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `wms_inventory_check_detail` VALUES (200, 45, 178, 0.00, 0.00, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `wms_inventory_check_detail` VALUES (201, 45, 176, 0.00, 0.00, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `wms_inventory_check_detail` VALUES (202, 45, 187, 2.00, 2.00, 194, 181, NULL, 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `wms_inventory_check_detail` VALUES (203, 45, 183, 1.00, 1.00, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `wms_inventory_check_detail` VALUES (204, 45, 183, 4.00, 4.00, 195, 182, NULL, 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `wms_inventory_check_detail` VALUES (205, 45, 186, 5.00, 5.00, 194, 181, NULL, 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `wms_inventory_check_detail` VALUES (206, 45, 186, 4.00, 4.00, 196, 183, NULL, 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `wms_inventory_check_detail` VALUES (207, 45, 183, 1.00, 1.00, 196, 183, NULL, 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `wms_inventory_check_detail` VALUES (208, 45, 181, 1.00, 1.00, 198, 185, NULL, 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `wms_inventory_check_detail` VALUES (209, 45, 182, 1.00, 1.00, 195, 182, NULL, 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `wms_inventory_check_detail` VALUES (210, 45, 182, 1.00, 1.00, 196, 183, NULL, 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `wms_inventory_check_detail` VALUES (211, 45, 181, 2.00, 2.00, 194, 181, NULL, 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `wms_inventory_check_detail` VALUES (212, 45, 181, 0.00, 0.00, 193, 178, NULL, 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `wms_inventory_check_detail` VALUES (213, 45, 182, 1.00, 1.00, 194, 181, NULL, 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `wms_inventory_check_detail` VALUES (214, 45, 182, 2.00, 2.00, 193, 178, NULL, 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `wms_inventory_check_detail` VALUES (215, 45, 182, 0.00, 0.00, 194, 181, NULL, 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `wms_inventory_check_detail` VALUES (216, 45, 181, 51.00, 51.00, 193, 178, NULL, 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `wms_inventory_check_detail` VALUES (217, 45, 182, 50.00, 50.00, 193, 178, NULL, 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `wms_inventory_check_detail` VALUES (218, 45, 180, 3.00, 3.00, 199, 186, NULL, 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `wms_inventory_check_detail` VALUES (227, 46, 186, 5.00, 4.00, 194, 181, NULL, 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `wms_inventory_check_detail` VALUES (228, 46, 186, 4.00, 6.00, 196, 183, NULL, 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `wms_inventory_check_detail` VALUES (229, 46, 182, 1.00, 1.00, 195, 182, NULL, 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `wms_inventory_check_detail` VALUES (230, 46, 182, 1.00, 1.00, 196, 183, NULL, 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `wms_inventory_check_detail` VALUES (231, 46, 182, 1.00, 1.00, 194, 181, NULL, 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `wms_inventory_check_detail` VALUES (232, 46, 182, 2.00, 2.00, 193, 178, NULL, 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `wms_inventory_check_detail` VALUES (233, 46, 182, 0.00, 0.00, 194, 181, NULL, 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `wms_inventory_check_detail` VALUES (234, 46, 182, 50.00, 50.00, 193, 178, NULL, 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `wms_inventory_check_detail` VALUES (235, 49, 176, 0.00, 3.00, 229, 216, NULL, 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `wms_inventory_check_detail` VALUES (236, 50, 149, 0.00, 6.00, 231, 217, NULL, 0, '88888888', NULL, NULL, NULL, NULL);
INSERT INTO `wms_inventory_check_detail` VALUES (237, 51, 193, 0.00, 0.00, 229, 216, NULL, 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `wms_inventory_check_detail` VALUES (238, 51, 191, 0.00, 0.00, 229, 216, NULL, 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `wms_inventory_check_detail` VALUES (239, 51, 190, 0.00, 0.00, 229, 216, NULL, 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `wms_inventory_check_detail` VALUES (240, 51, 189, 0.00, 0.00, 229, 216, NULL, 0, NULL, NULL, NULL, NULL, NULL);

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
) ENGINE = InnoDB AUTO_INCREMENT = 706 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '库存记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wms_inventory_history
-- ----------------------------
INSERT INTO `wms_inventory_history` VALUES (18, 9, 13, 1, 1, 9.00, NULL, 0, 1, '2022-10-24 18:48:00.020', NULL, NULL, 1, 13);
INSERT INTO `wms_inventory_history` VALUES (19, 9, 13, 1, 1, 18.00, NULL, 0, 1, '2022-10-24 18:49:30.030', NULL, NULL, 1, 13);
INSERT INTO `wms_inventory_history` VALUES (20, 10, 12, 1, 1, 1.00, NULL, 0, 1, '2022-10-24 18:54:54.774', NULL, NULL, 1, 13);
INSERT INTO `wms_inventory_history` VALUES (21, 13, 1, 1, 1, 7.00, NULL, 0, 1, '2022-10-31 22:08:12.343', NULL, NULL, 1, 13);
INSERT INTO `wms_inventory_history` VALUES (22, 13, 1, 2, 5, 1.00, NULL, 0, 1, '2022-10-31 22:10:22.774', NULL, NULL, 1, 13);
INSERT INTO `wms_inventory_history` VALUES (23, 14, 1, 1, 1, 1.00, NULL, 0, 1, '2022-11-01 15:44:15.883', NULL, NULL, 1, 13);
INSERT INTO `wms_inventory_history` VALUES (24, 4, 22, 2, 6, 2.00, NULL, 0, 1, '2022-11-02 17:25:28.225', NULL, NULL, 2, 18);
INSERT INTO `wms_inventory_history` VALUES (25, 4, 22, 1, NULL, 2.00, NULL, 0, 1, '2022-11-02 17:25:28.225', NULL, NULL, 4, NULL);
INSERT INTO `wms_inventory_history` VALUES (26, 4, 21, 2, 1, 2.00, NULL, 0, 1, '2022-11-02 17:25:28.225', NULL, NULL, 1, 13);
INSERT INTO `wms_inventory_history` VALUES (27, 4, 21, 1, 1, 2.00, NULL, 0, 1, '2022-11-02 17:25:28.225', NULL, NULL, 1, 13);
INSERT INTO `wms_inventory_history` VALUES (28, 4, 21, 2, 1, 3.00, NULL, 0, 1, '2022-11-02 17:28:45.483', NULL, NULL, 1, 13);
INSERT INTO `wms_inventory_history` VALUES (29, 4, 21, 1, 1, 3.00, NULL, 0, 1, '2022-11-02 17:28:45.483', NULL, NULL, 1, 13);
INSERT INTO `wms_inventory_history` VALUES (30, 4, 22, 2, 6, 3.00, NULL, 0, 1, '2022-11-02 17:28:45.483', NULL, NULL, 2, 18);
INSERT INTO `wms_inventory_history` VALUES (31, 4, 22, 1, NULL, 3.00, NULL, 0, 1, '2022-11-02 17:28:45.483', NULL, NULL, 4, NULL);
INSERT INTO `wms_inventory_history` VALUES (32, 4, 21, 2, 1, 5.00, NULL, 0, 1, '2022-11-02 17:30:35.124', NULL, NULL, 1, 13);
INSERT INTO `wms_inventory_history` VALUES (33, 4, 21, 1, 1, 5.00, NULL, 0, 1, '2022-11-02 17:30:35.124', NULL, NULL, 1, 13);
INSERT INTO `wms_inventory_history` VALUES (34, 4, 22, 2, 6, 5.00, NULL, 0, 1, '2022-11-02 17:30:35.124', NULL, NULL, 2, 18);
INSERT INTO `wms_inventory_history` VALUES (35, 4, 22, 1, NULL, 5.00, NULL, 0, 1, '2022-11-02 17:30:35.124', NULL, NULL, 4, NULL);
INSERT INTO `wms_inventory_history` VALUES (36, 4, 21, 2, 1, 1.00, NULL, 0, 1, '2022-11-02 17:34:50.453', NULL, NULL, 1, 13);
INSERT INTO `wms_inventory_history` VALUES (37, 4, 21, 1, 1, 1.00, NULL, 0, 1, '2022-11-02 17:34:50.453', NULL, NULL, 1, 13);
INSERT INTO `wms_inventory_history` VALUES (38, 4, 22, 2, 6, 1.00, NULL, 0, 1, '2022-11-02 17:34:50.453', NULL, NULL, 2, 18);
INSERT INTO `wms_inventory_history` VALUES (39, 4, 22, 1, NULL, 1.00, NULL, 0, 1, '2022-11-02 17:34:50.453', NULL, NULL, 4, NULL);
INSERT INTO `wms_inventory_history` VALUES (40, 4, 21, 2, 1, 1.00, NULL, 0, 1, '2022-11-02 17:39:48.448', NULL, NULL, 1, 13);
INSERT INTO `wms_inventory_history` VALUES (41, 4, 21, 1, 1, 1.00, NULL, 0, 1, '2022-11-02 17:39:48.448', NULL, NULL, 1, 13);
INSERT INTO `wms_inventory_history` VALUES (42, 4, 22, 2, 6, 1.00, NULL, 0, 1, '2022-11-02 17:39:48.448', NULL, NULL, 2, 18);
INSERT INTO `wms_inventory_history` VALUES (43, 4, 22, 1, NULL, 1.00, NULL, 0, 1, '2022-11-02 17:39:48.448', NULL, NULL, 4, NULL);
INSERT INTO `wms_inventory_history` VALUES (44, 4, 21, 2, 1, 9.00, NULL, 0, 1, '2022-11-02 17:50:02.308', NULL, NULL, 1, 13);
INSERT INTO `wms_inventory_history` VALUES (45, 4, 22, 2, 6, 9.00, NULL, 0, 1, '2022-11-02 17:50:02.308', NULL, NULL, 2, 18);
INSERT INTO `wms_inventory_history` VALUES (46, 14, 1, 2, NULL, 1.00, NULL, 0, 1, '2022-11-03 17:40:30.449', NULL, NULL, 2, 18);
INSERT INTO `wms_inventory_history` VALUES (47, 13, 1, 2, NULL, 1.00, NULL, 0, 1, '2022-11-03 17:43:43.910', NULL, NULL, 3, 16);
INSERT INTO `wms_inventory_history` VALUES (48, 13, 1, 2, NULL, 1.00, NULL, 0, 1, '2022-11-03 17:48:24.811', NULL, NULL, 3, 16);
INSERT INTO `wms_inventory_history` VALUES (49, 16, 1, 1, 7, 1.00, NULL, 0, 115, '2022-11-07 08:25:36.358', NULL, NULL, 3, 16);
INSERT INTO `wms_inventory_history` VALUES (50, 19, 1, 1, 8, 5.00, NULL, 0, 115, '2022-11-07 21:46:30.614', NULL, NULL, 20, 42);
INSERT INTO `wms_inventory_history` VALUES (51, 19, 1, 2, NULL, 8.00, NULL, 0, 115, '2022-11-07 21:46:30.614', NULL, NULL, 20, 41);
INSERT INTO `wms_inventory_history` VALUES (52, 14, 1, 1, 1, 4.00, NULL, 0, 115, '2022-11-08 17:14:51.687', NULL, NULL, 1, 13);
INSERT INTO `wms_inventory_history` VALUES (53, 22, 1, 1, NULL, 1.00, NULL, 0, 115, '2022-11-09 14:58:41.776', NULL, NULL, 1, 13);
INSERT INTO `wms_inventory_history` VALUES (54, 22, 1, 2, NULL, 1.00, NULL, 0, 115, '2022-11-09 14:58:41.776', NULL, NULL, 2, 18);
INSERT INTO `wms_inventory_history` VALUES (55, 22, 1, 1, NULL, 2.00, NULL, 0, 115, '2022-11-09 14:59:13.862', NULL, NULL, 1, 13);
INSERT INTO `wms_inventory_history` VALUES (56, 22, 1, 1, NULL, 3.00, NULL, 0, 115, '2022-11-09 14:59:20.823', NULL, NULL, 1, 13);
INSERT INTO `wms_inventory_history` VALUES (57, 23, 1, 1, NULL, 1.00, NULL, 0, 115, '2022-11-09 18:32:26.071', NULL, NULL, 3, 14);
INSERT INTO `wms_inventory_history` VALUES (58, 29, 1, 5, 6, 1.00, NULL, 0, 115, '2022-11-11 16:24:13.363', NULL, NULL, 2, 18);
INSERT INTO `wms_inventory_history` VALUES (59, 17, 11, 5, 6, 1.00, NULL, 0, 115, '2022-11-11 16:47:16.638', NULL, NULL, 2, 18);
INSERT INTO `wms_inventory_history` VALUES (60, 31, 1, 7, 9, 400.00, NULL, 0, 115, '2022-11-11 17:19:20.946', NULL, NULL, 21, 43);
INSERT INTO `wms_inventory_history` VALUES (61, 31, 1, 8, 11, 100.00, NULL, 0, 115, '2022-11-11 17:19:20.946', NULL, NULL, 21, 44);
INSERT INTO `wms_inventory_history` VALUES (62, 31, 1, 7, 9, 200.00, NULL, 0, 115, '2022-11-11 17:20:58.097', NULL, NULL, 21, 43);
INSERT INTO `wms_inventory_history` VALUES (63, 18, 11, 7, 9, 10.00, NULL, 0, 115, '2022-11-11 17:23:27.352', NULL, NULL, 21, 43);
INSERT INTO `wms_inventory_history` VALUES (64, 18, 11, 8, 11, 10.00, NULL, 0, 115, '2022-11-11 17:23:27.352', NULL, NULL, 21, 44);
INSERT INTO `wms_inventory_history` VALUES (65, 31, 1, 8, 11, 100.00, NULL, 0, 115, '2022-11-11 17:26:04.650', NULL, NULL, 21, 44);
INSERT INTO `wms_inventory_history` VALUES (66, 8, 21, 8, 11, 40.00, NULL, 0, 115, '2022-11-11 17:30:49.794', NULL, NULL, 21, 44);
INSERT INTO `wms_inventory_history` VALUES (67, 8, 22, 8, NULL, 40.00, NULL, 0, 115, '2022-11-11 17:30:49.794', NULL, NULL, 22, NULL);
INSERT INTO `wms_inventory_history` VALUES (68, 4, 21, 2, 1, 8.00, NULL, 0, 115, '2022-11-12 16:58:55.355', NULL, NULL, 1, 13);
INSERT INTO `wms_inventory_history` VALUES (69, 4, 22, 2, 6, 8.00, NULL, 0, 115, '2022-11-12 16:58:55.355', NULL, NULL, 2, 18);
INSERT INTO `wms_inventory_history` VALUES (70, 33, 2, 1, 17, 1.00, NULL, 0, 115, '2022-11-13 17:33:14.726', NULL, NULL, 25, 50);
INSERT INTO `wms_inventory_history` VALUES (71, 33, 2, 2, NULL, 1.00, NULL, 0, 115, '2022-11-13 17:33:14.726', NULL, NULL, 2, 18);
INSERT INTO `wms_inventory_history` VALUES (72, 33, 2, 3, NULL, 1.00, NULL, 0, 115, '2022-11-13 17:33:14.726', NULL, NULL, 3, 14);
INSERT INTO `wms_inventory_history` VALUES (73, 33, 2, 4, 1, 1.00, NULL, 0, 115, '2022-11-13 17:33:14.726', NULL, NULL, 2, 17);
INSERT INTO `wms_inventory_history` VALUES (74, 33, 2, 5, 6, 1.00, NULL, 0, 115, '2022-11-13 17:33:14.726', NULL, NULL, 2, 18);
INSERT INTO `wms_inventory_history` VALUES (75, 33, 2, 6, 1, 1.00, NULL, 0, 115, '2022-11-13 17:33:14.726', NULL, NULL, 2, 17);
INSERT INTO `wms_inventory_history` VALUES (76, 33, 2, 7, 9, 1.00, NULL, 0, 115, '2022-11-13 17:33:14.726', NULL, NULL, 21, 43);
INSERT INTO `wms_inventory_history` VALUES (77, 33, 2, 8, 11, 1.00, NULL, 0, 115, '2022-11-13 17:33:14.726', NULL, NULL, 21, 44);
INSERT INTO `wms_inventory_history` VALUES (78, 33, 2, 9, 12, 1.00, NULL, 0, 115, '2022-11-13 17:33:14.726', NULL, NULL, 22, 46);
INSERT INTO `wms_inventory_history` VALUES (79, 33, 2, 10, 14, 1.00, NULL, 0, 115, '2022-11-13 17:33:14.726', NULL, NULL, 23, 47);
INSERT INTO `wms_inventory_history` VALUES (80, 35, 1, 12, 17, 1.00, NULL, 0, 115, '2022-11-13 17:41:54.608', NULL, NULL, 25, 50);
INSERT INTO `wms_inventory_history` VALUES (81, 36, 1, 13, 4, 1.00, NULL, 0, 115, '2022-11-13 17:44:49.102', NULL, NULL, 4, 14);
INSERT INTO `wms_inventory_history` VALUES (82, 42, 1, 12, NULL, 1.00, NULL, 0, 115, '2022-11-15 16:42:56.206', NULL, NULL, 2, 44);
INSERT INTO `wms_inventory_history` VALUES (83, 42, 1, 13, NULL, 1.00, NULL, 0, 115, '2022-11-15 16:42:56.206', NULL, NULL, 2, 44);
INSERT INTO `wms_inventory_history` VALUES (84, 42, 1, 14, NULL, 1.00, NULL, 0, 115, '2022-11-15 16:42:56.206', NULL, NULL, 2, 44);
INSERT INTO `wms_inventory_history` VALUES (85, 21, 1, 14, NULL, 1.00, NULL, 0, 115, '2022-11-15 16:48:25.641', NULL, NULL, 2, 44);
INSERT INTO `wms_inventory_history` VALUES (86, 48, 1, 17, 13, 1.00, NULL, 0, 115, '2022-11-17 16:21:05.918', NULL, NULL, 2, 44);
INSERT INTO `wms_inventory_history` VALUES (87, 44, 1, 13, NULL, 1.00, NULL, 0, 115, '2022-11-18 09:11:32.694', NULL, NULL, 14, NULL);
INSERT INTO `wms_inventory_history` VALUES (88, 44, 1, 14, 13, 1.00, NULL, 0, 115, '2022-11-18 09:11:32.694', NULL, NULL, 2, 44);
INSERT INTO `wms_inventory_history` VALUES (89, 44, 1, 12, NULL, 1.00, NULL, 0, 115, '2022-11-18 09:11:43.812', NULL, NULL, 4, NULL);
INSERT INTO `wms_inventory_history` VALUES (90, 50, 3, 13, 13, 1.00, NULL, 0, 115, '2022-11-18 10:56:31.983', NULL, NULL, 2, 44);
INSERT INTO `wms_inventory_history` VALUES (91, 50, 3, 12, 13, 1.00, NULL, 0, 115, '2022-11-18 11:02:07.113', NULL, NULL, 2, 44);
INSERT INTO `wms_inventory_history` VALUES (92, 50, 3, 12, 13, 2.00, NULL, 0, 115, '2022-11-18 11:09:13.201', NULL, NULL, 2, 44);
INSERT INTO `wms_inventory_history` VALUES (93, 54, 1, 20, 13, 1.00, NULL, 0, 115, '2022-11-20 08:53:41.829', NULL, NULL, 2, 44);
INSERT INTO `wms_inventory_history` VALUES (94, 55, 1, 20, 19, 1.00, NULL, 0, 115, '2022-11-20 08:53:56.029', NULL, NULL, 14, 46);
INSERT INTO `wms_inventory_history` VALUES (95, 55, 1, 20, 19, 29.00, NULL, 0, 115, '2022-11-20 08:54:07.292', NULL, NULL, 14, 46);
INSERT INTO `wms_inventory_history` VALUES (96, 54, 1, 20, 13, 19.00, NULL, 0, 115, '2022-11-20 08:54:13.786', NULL, NULL, 2, 44);
INSERT INTO `wms_inventory_history` VALUES (97, 53, 1, 20, NULL, 1.00, NULL, 0, 115, '2022-11-20 09:26:06.094', NULL, NULL, 4, NULL);
INSERT INTO `wms_inventory_history` VALUES (98, 56, 1, 12, 13, 3.00, NULL, 0, 115, '2022-11-20 14:33:49.477', NULL, NULL, 2, 44);
INSERT INTO `wms_inventory_history` VALUES (99, 53, 1, 20, NULL, 3.00, NULL, 0, 115, '2022-11-20 15:01:21.744', NULL, NULL, 4, NULL);
INSERT INTO `wms_inventory_history` VALUES (100, 57, 1, 21, 20, 2000.00, NULL, 0, 115, '2022-11-20 15:11:18.651', NULL, NULL, 27, 52);
INSERT INTO `wms_inventory_history` VALUES (101, 67, 1, 13, 4, 1.00, NULL, 0, 115, '2022-11-23 08:23:21.447', NULL, NULL, 4, 14);
INSERT INTO `wms_inventory_history` VALUES (102, 66, 1, 14, NULL, 1.00, NULL, 0, 115, '2022-11-23 08:24:32.961', NULL, NULL, 4, NULL);
INSERT INTO `wms_inventory_history` VALUES (103, 68, 2, 14, NULL, 9.00, NULL, 0, 115, '2022-11-23 08:29:54.367', NULL, NULL, 4, NULL);
INSERT INTO `wms_inventory_history` VALUES (104, 68, 2, 15, NULL, 8.00, NULL, 0, 115, '2022-11-23 08:29:54.367', NULL, NULL, NULL, NULL);
INSERT INTO `wms_inventory_history` VALUES (105, 64, 1, 16, NULL, 1.00, NULL, 0, 115, '2022-11-23 08:31:43.572', NULL, NULL, NULL, NULL);
INSERT INTO `wms_inventory_history` VALUES (106, 69, 1, 20, NULL, 1.00, NULL, 0, 115, '2022-11-23 08:32:46.363', NULL, NULL, NULL, NULL);
INSERT INTO `wms_inventory_history` VALUES (107, 70, 3, 13, 13, 1.00, NULL, 0, 115, '2022-11-23 10:56:54.477', NULL, NULL, 2, 44);
INSERT INTO `wms_inventory_history` VALUES (108, 72, 1, 13, 13, 1.00, NULL, 0, 115, '2022-11-23 13:50:47.951', NULL, NULL, 2, 44);
INSERT INTO `wms_inventory_history` VALUES (109, 72, 1, 14, 13, 1.00, NULL, 0, 115, '2022-11-23 13:50:47.951', NULL, NULL, 2, 44);
INSERT INTO `wms_inventory_history` VALUES (110, 35, 11, 13, 13, 1.00, NULL, 0, 115, '2022-11-23 13:51:53.320', NULL, NULL, 2, 44);
INSERT INTO `wms_inventory_history` VALUES (111, 75, 1, 18, 13, 1.00, NULL, 0, 115, '2022-11-23 15:28:22.091', NULL, NULL, 2, 44);
INSERT INTO `wms_inventory_history` VALUES (112, 75, 1, 21, NULL, 1.00, NULL, 0, 115, '2022-11-23 15:28:22.091', NULL, NULL, 14, 53);
INSERT INTO `wms_inventory_history` VALUES (113, 75, 1, 22, 20, 1.00, NULL, 0, 115, '2022-11-23 15:28:22.091', NULL, NULL, 27, 52);
INSERT INTO `wms_inventory_history` VALUES (114, 78, 1, 13, 4, 1.00, NULL, 0, 115, '2022-11-25 10:39:13.631', NULL, NULL, 4, 14);
INSERT INTO `wms_inventory_history` VALUES (115, 78, 1, 14, 18, 1.00, NULL, 0, 115, '2022-11-25 10:39:13.631', NULL, NULL, 26, 51);
INSERT INTO `wms_inventory_history` VALUES (116, 78, 1, 20, NULL, 1.00, NULL, 0, 115, '2022-11-25 10:39:13.631', NULL, NULL, NULL, NULL);
INSERT INTO `wms_inventory_history` VALUES (117, 89, 1, 13, 13, 1.00, NULL, 0, 115, '2022-11-28 21:19:12.578', NULL, NULL, 2, 45);
INSERT INTO `wms_inventory_history` VALUES (118, 91, 2, 13, 4, 1.00, NULL, 0, 115, '2022-11-29 19:22:14.320', NULL, NULL, 4, 14);
INSERT INTO `wms_inventory_history` VALUES (119, 93, 1, 28, 13, 5.00, NULL, 0, 115, '2022-11-30 14:25:42.810', NULL, NULL, 2, 45);
INSERT INTO `wms_inventory_history` VALUES (120, 96, 1, 13, NULL, 1.00, NULL, 0, 115, '2022-12-01 09:56:47.423', NULL, NULL, 4, 54);
INSERT INTO `wms_inventory_history` VALUES (121, 96, 1, 13, NULL, 131.00, NULL, 0, 1, '2022-12-01 10:53:10.535', NULL, NULL, 4, 54);
INSERT INTO `wms_inventory_history` VALUES (122, 97, 1, 27, 14, 11.00, NULL, 0, 1, '2022-12-01 11:05:02.411', NULL, NULL, 14, 46);
INSERT INTO `wms_inventory_history` VALUES (123, 97, 1, 27, 14, 9.00, NULL, 0, 1, '2022-12-01 11:05:14.525', NULL, NULL, 14, 46);
INSERT INTO `wms_inventory_history` VALUES (124, 97, 1, 28, NULL, 100.00, NULL, 0, 1, '2022-12-01 11:05:38.528', NULL, NULL, 4, 54);
INSERT INTO `wms_inventory_history` VALUES (125, 94, 1, 13, NULL, 1.00, NULL, 0, 1, '2022-12-01 11:08:39.562', NULL, NULL, 14, 46);
INSERT INTO `wms_inventory_history` VALUES (126, 94, 1, 17, 14, 1.00, NULL, 0, 1, '2022-12-01 11:08:39.562', NULL, NULL, 14, 46);
INSERT INTO `wms_inventory_history` VALUES (127, 44, 11, 28, NULL, 1.00, NULL, 0, 1, '2022-12-01 11:14:59.956', NULL, NULL, 4, 54);
INSERT INTO `wms_inventory_history` VALUES (128, 44, 11, 27, 14, 1.00, NULL, 0, 1, '2022-12-01 11:16:14.223', NULL, NULL, 14, 46);
INSERT INTO `wms_inventory_history` VALUES (129, 79, 3, 13, NULL, 1.00, NULL, 0, 1, '2022-12-01 11:16:52.573', NULL, NULL, 4, 54);
INSERT INTO `wms_inventory_history` VALUES (130, 5, 21, 28, NULL, 1.00, NULL, 0, 1, '2022-12-01 11:23:05.858', NULL, NULL, 4, 54);
INSERT INTO `wms_inventory_history` VALUES (131, 5, 22, 28, NULL, 1.00, NULL, 0, 1, '2022-12-01 11:23:05.858', NULL, NULL, 14, 53);
INSERT INTO `wms_inventory_history` VALUES (132, 99, 1, 17, NULL, 1.00, NULL, 0, 115, '2022-12-02 14:34:45.554', NULL, NULL, NULL, NULL);
INSERT INTO `wms_inventory_history` VALUES (133, 99, 1, 14, 18, 1.00, NULL, 0, 115, '2022-12-02 14:34:53.411', NULL, NULL, 26, 51);
INSERT INTO `wms_inventory_history` VALUES (134, 101, 1, 13, NULL, 1.00, NULL, 0, 115, '2022-12-03 08:28:10.409', NULL, NULL, 4, 54);
INSERT INTO `wms_inventory_history` VALUES (135, 102, 1, 19, 13, 1.00, NULL, 0, 115, '2022-12-03 08:46:58.309', NULL, NULL, 2, 44);
INSERT INTO `wms_inventory_history` VALUES (136, 45, 11, 13, NULL, 1.00, NULL, 0, 115, '2022-12-03 08:47:53.576', NULL, NULL, 4, 54);
INSERT INTO `wms_inventory_history` VALUES (137, 98, 1, 13, NULL, 1.00, NULL, 0, 115, '2022-12-05 14:06:20.894', NULL, NULL, 4, 54);
INSERT INTO `wms_inventory_history` VALUES (138, 86, 1, 25, 20, 2.00, NULL, 0, 115, '2022-12-05 14:06:42.886', NULL, NULL, 27, 52);
INSERT INTO `wms_inventory_history` VALUES (139, 46, 1, 13, 4, 2.00, NULL, 0, 115, '2022-12-05 14:08:46.120', NULL, NULL, 4, 14);
INSERT INTO `wms_inventory_history` VALUES (140, 105, 1, 29, 24, 1.00, NULL, 0, 115, '2022-12-06 00:00:54.192', NULL, NULL, 30, 56);
INSERT INTO `wms_inventory_history` VALUES (141, 105, 1, 29, 24, 26.00, NULL, 0, 115, '2022-12-06 00:01:25.536', NULL, NULL, 30, 56);
INSERT INTO `wms_inventory_history` VALUES (142, 106, 1, 29, 24, 15.00, NULL, 0, 115, '2022-12-06 00:05:20.512', NULL, NULL, 30, 56);
INSERT INTO `wms_inventory_history` VALUES (143, 107, 1, 29, 24, 1.00, NULL, 0, 115, '2022-12-06 13:52:32.546', NULL, NULL, 30, 56);
INSERT INTO `wms_inventory_history` VALUES (144, 110, 1, 29, 25, 8.00, NULL, 0, 115, '2022-12-07 09:16:38.197', NULL, NULL, 31, 57);
INSERT INTO `wms_inventory_history` VALUES (145, 49, 11, 29, 25, 3.00, NULL, 0, 115, '2022-12-07 09:18:25.572', NULL, NULL, 31, 57);
INSERT INTO `wms_inventory_history` VALUES (146, 110, 1, 29, 24, 1.00, NULL, 0, 115, '2022-12-07 15:24:48.419', NULL, NULL, 30, 56);
INSERT INTO `wms_inventory_history` VALUES (147, 111, 1, 29, 24, 1.00, NULL, 0, 115, '2022-12-08 15:13:32.651', NULL, NULL, 30, 56);
INSERT INTO `wms_inventory_history` VALUES (148, 48, 11, 29, 24, 1.00, NULL, 0, 115, '2022-12-08 15:14:08.517', NULL, NULL, 30, 56);
INSERT INTO `wms_inventory_history` VALUES (149, 15, 21, 29, NULL, 1.00, NULL, 0, 115, '2022-12-09 19:41:34.306', NULL, NULL, 30, NULL);
INSERT INTO `wms_inventory_history` VALUES (150, 15, 22, 29, 24, 1.00, NULL, 0, 115, '2022-12-09 19:41:34.306', NULL, NULL, 31, 56);
INSERT INTO `wms_inventory_history` VALUES (151, 115, 1, 55, NULL, 100.00, NULL, 0, 115, '2022-12-10 15:31:02.873', NULL, NULL, 39, NULL);
INSERT INTO `wms_inventory_history` VALUES (152, 115, 1, 53, NULL, 100.00, NULL, 0, 115, '2022-12-10 15:31:02.873', NULL, NULL, 39, NULL);
INSERT INTO `wms_inventory_history` VALUES (153, 116, 1, 55, NULL, 1.00, NULL, 0, 115, '2022-12-10 17:01:54.526', NULL, NULL, 38, NULL);
INSERT INTO `wms_inventory_history` VALUES (154, 52, 11, 55, NULL, 1.00, NULL, 0, 115, '2022-12-10 17:04:23.458', NULL, NULL, 38, NULL);
INSERT INTO `wms_inventory_history` VALUES (155, 119, 1, 55, NULL, 1.00, NULL, 0, 115, '2022-12-12 13:16:36.860', NULL, NULL, 39, 60);
INSERT INTO `wms_inventory_history` VALUES (156, 53, 11, 55, NULL, 1.00, NULL, 0, 115, '2022-12-12 13:19:41.574', NULL, NULL, 39, NULL);
INSERT INTO `wms_inventory_history` VALUES (157, 130, 1, 60, NULL, 1.00, NULL, 0, 115, '2022-12-20 17:27:22.283', NULL, NULL, 42, NULL);
INSERT INTO `wms_inventory_history` VALUES (158, 133, 1, 60, NULL, 6.00, NULL, 0, 115, '2022-12-20 17:40:03.701', NULL, NULL, 40, NULL);
INSERT INTO `wms_inventory_history` VALUES (159, 133, 1, 60, NULL, 6.00, NULL, 0, 115, '2022-12-20 17:40:38.925', NULL, NULL, 40, NULL);
INSERT INTO `wms_inventory_history` VALUES (160, 135, 1, 60, NULL, 6.00, NULL, 0, 115, '2022-12-20 17:42:29.379', NULL, NULL, 38, 61);
INSERT INTO `wms_inventory_history` VALUES (161, 135, 1, 58, NULL, 8.00, NULL, 0, 115, '2022-12-20 17:42:29.379', NULL, NULL, 43, 62);
INSERT INTO `wms_inventory_history` VALUES (162, 135, 1, 60, NULL, 4.00, NULL, 0, 115, '2022-12-20 17:42:42.482', NULL, NULL, 38, 61);
INSERT INTO `wms_inventory_history` VALUES (163, 136, 1, 58, 28, 1.00, NULL, 0, 115, '2022-12-20 17:45:45.216', NULL, NULL, 38, 61);
INSERT INTO `wms_inventory_history` VALUES (164, 137, 1, 60, NULL, 8.00, NULL, 0, 115, '2022-12-20 17:58:02.786', NULL, NULL, 42, NULL);
INSERT INTO `wms_inventory_history` VALUES (165, 138, 1, 60, NULL, 1.00, NULL, 0, 115, '2022-12-20 17:59:47.967', NULL, NULL, 42, NULL);
INSERT INTO `wms_inventory_history` VALUES (166, 138, 1, 60, NULL, 4.00, NULL, 0, 115, '2022-12-20 18:00:01.168', NULL, NULL, 42, NULL);
INSERT INTO `wms_inventory_history` VALUES (167, 139, 1, 60, 29, 1.00, NULL, 0, 115, '2022-12-21 16:11:48.910', NULL, NULL, 38, 61);
INSERT INTO `wms_inventory_history` VALUES (168, 55, 11, 60, 29, 1.00, NULL, 0, 115, '2022-12-22 09:15:28.713', NULL, NULL, 38, 61);
INSERT INTO `wms_inventory_history` VALUES (169, 57, 11, 60, NULL, 1.00, NULL, 0, 115, '2022-12-22 09:43:54.738', NULL, NULL, 42, NULL);
INSERT INTO `wms_inventory_history` VALUES (170, 143, 1, 60, NULL, 1.00, NULL, 0, 115, '2022-12-22 12:35:50.445', NULL, NULL, 38, NULL);
INSERT INTO `wms_inventory_history` VALUES (171, 145, 1, 60, NULL, 1000.00, NULL, 0, 115, '2022-12-27 15:33:46.645', NULL, NULL, 45, 65);
INSERT INTO `wms_inventory_history` VALUES (172, 147, 1, 61, 29, 1.00, NULL, 0, 115, '2022-12-28 11:39:15.134', NULL, NULL, 38, 61);
INSERT INTO `wms_inventory_history` VALUES (173, 147, 1, 60, 29, 1.00, NULL, 0, 115, '2022-12-28 11:39:15.134', NULL, NULL, 38, 61);
INSERT INTO `wms_inventory_history` VALUES (174, 59, 11, 61, 29, 1.00, NULL, 0, 115, '2022-12-28 11:41:57.684', NULL, NULL, 38, 61);
INSERT INTO `wms_inventory_history` VALUES (175, 17, 21, 58, NULL, 1.00, NULL, 0, 115, '2022-12-28 13:42:51.754', NULL, NULL, 38, 61);
INSERT INTO `wms_inventory_history` VALUES (176, 17, 22, 58, NULL, 1.00, NULL, 0, 115, '2022-12-28 13:42:51.754', NULL, NULL, 42, 63);
INSERT INTO `wms_inventory_history` VALUES (177, 144, 1, 60, 30, 1.00, NULL, 0, 115, '2022-12-28 16:41:46.903', NULL, NULL, 43, 62);
INSERT INTO `wms_inventory_history` VALUES (178, 148, 1, 61, NULL, 13.00, NULL, 0, 115, '2022-12-28 17:11:04.415', NULL, NULL, 42, 63);
INSERT INTO `wms_inventory_history` VALUES (179, 148, 1, 58, NULL, 11.00, NULL, 0, 115, '2022-12-28 17:11:04.415', NULL, NULL, 45, 65);
INSERT INTO `wms_inventory_history` VALUES (180, 148, 1, 60, NULL, 1.00, NULL, 0, 115, '2022-12-28 17:11:26.578', NULL, NULL, 45, 65);
INSERT INTO `wms_inventory_history` VALUES (181, 149, 1, 61, NULL, 1.00, NULL, 0, 115, '2022-12-28 19:27:56.298', NULL, NULL, 42, 63);
INSERT INTO `wms_inventory_history` VALUES (182, 150, 1, 61, 29, 1.00, NULL, 0, 115, '2022-12-30 13:47:44.757', NULL, NULL, 38, 61);
INSERT INTO `wms_inventory_history` VALUES (183, 60, 11, 61, NULL, 1.00, NULL, 0, 115, '2023-01-03 10:38:07.700', NULL, NULL, 38, 61);
INSERT INTO `wms_inventory_history` VALUES (184, 152, 1, 60, NULL, 1.00, NULL, 0, 115, '2023-01-03 12:09:21.712', NULL, NULL, 45, 65);
INSERT INTO `wms_inventory_history` VALUES (185, 157, 1, 63, 31, 1.00, NULL, 0, 115, '2023-01-05 10:09:08.251', NULL, NULL, 50, 67);
INSERT INTO `wms_inventory_history` VALUES (186, 156, 1, 63, 31, 3.00, NULL, 0, 115, '2023-01-05 14:51:25.953', NULL, NULL, 50, 67);
INSERT INTO `wms_inventory_history` VALUES (187, 61, 11, 63, 31, 1.00, NULL, 0, 115, '2023-01-05 16:08:25.953', NULL, NULL, 50, 67);
INSERT INTO `wms_inventory_history` VALUES (188, 160, 1, 65, NULL, 1.00, NULL, 0, 115, '2023-01-05 18:30:12.564', NULL, NULL, 50, 69);
INSERT INTO `wms_inventory_history` VALUES (189, 160, 1, 63, 31, 1.00, NULL, 0, 115, '2023-01-06 08:02:26.975', NULL, NULL, 50, 70);
INSERT INTO `wms_inventory_history` VALUES (190, 160, 1, 62, 31, 1.00, NULL, 0, 115, '2023-01-06 08:02:26.975', NULL, NULL, 50, 70);
INSERT INTO `wms_inventory_history` VALUES (191, 161, 1, 63, 31, 1.00, NULL, 0, 115, '2023-01-06 14:18:47.047', NULL, NULL, 50, 70);
INSERT INTO `wms_inventory_history` VALUES (192, 63, 11, 65, NULL, 1.00, NULL, 0, 115, '2023-01-06 14:19:56.077', NULL, NULL, 50, 69);
INSERT INTO `wms_inventory_history` VALUES (193, 162, 1, 68, 34, 1.00, NULL, 0, 115, '2023-01-06 16:58:27.090', NULL, NULL, 53, 73);
INSERT INTO `wms_inventory_history` VALUES (194, 162, 1, 67, 34, 1.00, NULL, 0, 115, '2023-01-06 16:58:27.090', NULL, NULL, 53, 73);
INSERT INTO `wms_inventory_history` VALUES (195, 164, 1, 68, 34, 1.00, NULL, 0, 115, '2023-01-07 14:14:37.227', NULL, NULL, 53, 73);
INSERT INTO `wms_inventory_history` VALUES (196, 164, 1, 67, NULL, 1.00, NULL, 0, 115, '2023-01-07 14:14:48.184', NULL, NULL, 54, NULL);
INSERT INTO `wms_inventory_history` VALUES (197, 166, 1, 75, 38, 1.00, NULL, 0, 115, '2023-01-08 00:19:53.231', NULL, NULL, 61, 77);
INSERT INTO `wms_inventory_history` VALUES (198, 169, 1, 76, 43, 100.00, NULL, 0, 115, '2023-01-09 00:17:19.181', NULL, NULL, 61, 80);
INSERT INTO `wms_inventory_history` VALUES (199, 169, 1, 75, 38, 100.00, NULL, 0, 115, '2023-01-09 00:17:19.181', NULL, NULL, 61, 77);
INSERT INTO `wms_inventory_history` VALUES (200, 169, 1, 74, 38, 100.00, NULL, 0, 115, '2023-01-09 00:17:19.181', NULL, NULL, 61, 77);
INSERT INTO `wms_inventory_history` VALUES (201, 169, 1, 73, 37, 100.00, NULL, 0, 115, '2023-01-09 00:17:19.181', NULL, NULL, 61, 77);
INSERT INTO `wms_inventory_history` VALUES (202, 169, 1, 72, 37, 100.00, NULL, 0, 115, '2023-01-09 00:17:19.181', NULL, NULL, 61, 77);
INSERT INTO `wms_inventory_history` VALUES (203, 169, 1, 71, 37, 100.00, NULL, 0, 115, '2023-01-09 00:17:19.181', NULL, NULL, 61, 77);
INSERT INTO `wms_inventory_history` VALUES (204, 170, 2, 76, 43, 10000.00, NULL, 0, 115, '2023-01-09 00:18:51.714', NULL, NULL, 61, 80);
INSERT INTO `wms_inventory_history` VALUES (205, 170, 2, 75, 38, 100.00, NULL, 0, 115, '2023-01-09 00:18:51.714', NULL, NULL, 61, 77);
INSERT INTO `wms_inventory_history` VALUES (206, 170, 2, 74, 38, 100.00, NULL, 0, 115, '2023-01-09 00:18:51.714', NULL, NULL, 61, 77);
INSERT INTO `wms_inventory_history` VALUES (207, 170, 2, 73, 37, 10000.00, NULL, 0, 115, '2023-01-09 00:18:51.714', NULL, NULL, 61, 77);
INSERT INTO `wms_inventory_history` VALUES (208, 170, 2, 72, 37, 100000.00, NULL, 0, 115, '2023-01-09 00:18:51.714', NULL, NULL, 61, 77);
INSERT INTO `wms_inventory_history` VALUES (209, 170, 2, 71, 37, 1000.00, NULL, 0, 115, '2023-01-09 00:18:51.714', NULL, NULL, 61, 77);
INSERT INTO `wms_inventory_history` VALUES (210, 171, 2, 75, 38, 1.00, NULL, 0, 115, '2023-01-09 01:35:41.331', NULL, NULL, 61, 77);
INSERT INTO `wms_inventory_history` VALUES (211, 172, 1, 74, 37, 10.00, NULL, 0, 115, '2023-01-09 02:17:11.309', NULL, NULL, 61, 77);
INSERT INTO `wms_inventory_history` VALUES (212, 172, 1, 71, 38, 1000.00, NULL, 0, 115, '2023-01-09 02:17:11.309', NULL, NULL, 61, 77);
INSERT INTO `wms_inventory_history` VALUES (213, 68, 11, 75, 38, 1.00, NULL, 0, 115, '2023-01-09 02:49:33.186', NULL, NULL, 61, 77);
INSERT INTO `wms_inventory_history` VALUES (214, 173, 1, 75, 38, 1.00, NULL, 0, 115, '2023-01-11 16:49:13.009', NULL, NULL, 61, 77);
INSERT INTO `wms_inventory_history` VALUES (215, 173, 1, 74, 38, 1.00, NULL, 0, 115, '2023-01-11 16:49:13.009', NULL, NULL, 61, 77);
INSERT INTO `wms_inventory_history` VALUES (216, 173, 1, 73, 37, 1.00, NULL, 0, 115, '2023-01-11 16:49:13.009', NULL, NULL, 61, 77);
INSERT INTO `wms_inventory_history` VALUES (217, 173, 1, 72, 37, 1.00, NULL, 0, 115, '2023-01-11 16:49:13.009', NULL, NULL, 61, 77);
INSERT INTO `wms_inventory_history` VALUES (218, 173, 1, 71, 37, 1.00, NULL, 0, 115, '2023-01-11 16:49:13.009', NULL, NULL, 61, 77);
INSERT INTO `wms_inventory_history` VALUES (219, 174, 1, 77, 47, 1.00, NULL, 0, 115, '2023-01-11 20:49:04.483', NULL, NULL, 64, 82);
INSERT INTO `wms_inventory_history` VALUES (220, 174, 1, 74, 47, 1.00, NULL, 0, 115, '2023-01-11 20:49:04.483', NULL, NULL, 64, 82);
INSERT INTO `wms_inventory_history` VALUES (221, 174, 1, 71, 37, 1.00, NULL, 0, 115, '2023-01-11 20:49:04.483', NULL, NULL, 61, 77);
INSERT INTO `wms_inventory_history` VALUES (222, 180, 3, 78, 49, 1.00, NULL, 0, 115, '2023-01-13 14:59:32.692', NULL, NULL, 67, 84);
INSERT INTO `wms_inventory_history` VALUES (223, 181, 1, 78, NULL, 12.00, NULL, 0, 115, '2023-01-13 19:26:39.259', NULL, NULL, 69, NULL);
INSERT INTO `wms_inventory_history` VALUES (224, 75, 11, 78, NULL, 4.00, NULL, 0, 115, '2023-01-13 19:27:25.747', NULL, NULL, 69, NULL);
INSERT INTO `wms_inventory_history` VALUES (225, 179, 1, 78, NULL, 1.00, NULL, 0, 115, '2023-01-15 10:08:00.562', NULL, NULL, 69, NULL);
INSERT INTO `wms_inventory_history` VALUES (226, 182, 1, 80, NULL, 1.00, NULL, 0, 115, '2023-01-16 11:15:08.481', NULL, NULL, 65, 86);
INSERT INTO `wms_inventory_history` VALUES (227, 183, 1, 80, 51, 122.00, NULL, 0, 115, '2023-01-16 11:17:07.415', NULL, NULL, 65, 86);
INSERT INTO `wms_inventory_history` VALUES (228, 76, 11, 80, 51, 4.00, NULL, 0, 115, '2023-01-16 11:17:34.786', NULL, NULL, 65, 86);
INSERT INTO `wms_inventory_history` VALUES (229, 186, 1, 80, 51, 1.00, NULL, 0, 115, '2023-01-17 10:31:15.871', NULL, NULL, 65, 86);
INSERT INTO `wms_inventory_history` VALUES (230, 77, 11, 80, 51, 1.00, NULL, 0, 115, '2023-01-18 15:17:39.825', NULL, NULL, 65, 86);
INSERT INTO `wms_inventory_history` VALUES (231, 189, 1, 80, 51, 9.00, NULL, 0, 115, '2023-01-18 15:19:43.569', NULL, NULL, 65, 86);
INSERT INTO `wms_inventory_history` VALUES (232, 189, 1, 79, 50, 9.00, NULL, 0, 115, '2023-01-18 15:19:43.569', NULL, NULL, 65, 86);
INSERT INTO `wms_inventory_history` VALUES (233, 189, 1, 78, NULL, 9.00, NULL, 0, 115, '2023-01-18 15:19:43.569', NULL, NULL, 69, NULL);
INSERT INTO `wms_inventory_history` VALUES (234, 191, 3, 80, NULL, 1.00, NULL, 0, 115, '2023-01-21 12:20:07.315', NULL, NULL, 65, 86);
INSERT INTO `wms_inventory_history` VALUES (235, 191, 3, 79, 50, 1.00, NULL, 0, 115, '2023-01-21 12:20:07.315', NULL, NULL, 65, 86);
INSERT INTO `wms_inventory_history` VALUES (236, 191, 3, 78, NULL, 1.00, NULL, 0, 115, '2023-01-21 12:20:07.315', NULL, NULL, 69, NULL);
INSERT INTO `wms_inventory_history` VALUES (237, 192, 1, 80, 49, 1.00, NULL, 0, 115, '2023-01-23 16:33:55.404', NULL, NULL, 68, 85);
INSERT INTO `wms_inventory_history` VALUES (238, 193, 1, 79, 50, 1.00, NULL, 0, 115, '2023-01-23 20:23:34.164', NULL, NULL, 65, 86);
INSERT INTO `wms_inventory_history` VALUES (239, 194, 1, 80, NULL, 1.00, NULL, 0, 115, '2023-01-25 15:12:03.871', NULL, NULL, 66, 87);
INSERT INTO `wms_inventory_history` VALUES (240, 196, 1, 80, NULL, 2.00, NULL, 0, 115, '2023-01-25 17:24:35.629', NULL, NULL, 67, 84);
INSERT INTO `wms_inventory_history` VALUES (241, 199, 1, 87, NULL, 1.00, NULL, 0, 115, '2023-01-28 12:40:38.288', NULL, NULL, 66, 87);
INSERT INTO `wms_inventory_history` VALUES (242, 207, 1, 88, 50, 1.00, NULL, 0, 115, '2023-01-31 11:53:58.497', NULL, NULL, 66, 86);
INSERT INTO `wms_inventory_history` VALUES (243, 26, 21, 88, NULL, 1.00, NULL, 0, 115, '2023-01-31 11:57:19.243', NULL, NULL, 66, 86);
INSERT INTO `wms_inventory_history` VALUES (244, 26, 22, 88, NULL, 1.00, NULL, 0, 115, '2023-01-31 11:57:19.243', NULL, NULL, 67, NULL);
INSERT INTO `wms_inventory_history` VALUES (245, 208, 1, 88, 49, 1.00, NULL, 0, 115, '2023-01-31 14:09:17.798', NULL, NULL, 74, 84);
INSERT INTO `wms_inventory_history` VALUES (246, 210, 1, 88, NULL, 1.00, NULL, 0, 115, '2023-01-31 16:23:22.418', NULL, NULL, 74, NULL);
INSERT INTO `wms_inventory_history` VALUES (247, 211, 1, 88, 49, 1.00, NULL, 0, 115, '2023-01-31 16:37:03.764', NULL, NULL, 68, 85);
INSERT INTO `wms_inventory_history` VALUES (248, 212, 1, 88, NULL, 1.00, NULL, 0, 115, '2023-01-31 16:38:29.458', NULL, NULL, 74, NULL);
INSERT INTO `wms_inventory_history` VALUES (249, 86, 11, 88, 49, 1.00, NULL, 0, 115, '2023-01-31 16:39:58.316', NULL, NULL, 68, 85);
INSERT INTO `wms_inventory_history` VALUES (250, 217, 1, 89, 50, 500.00, NULL, 0, 115, '2023-02-01 22:08:22.032', NULL, NULL, 76, 89);
INSERT INTO `wms_inventory_history` VALUES (251, 88, 11, 89, 50, 10.00, NULL, 0, 115, '2023-02-01 22:09:50.841', NULL, NULL, 76, 89);
INSERT INTO `wms_inventory_history` VALUES (252, 218, 1, 90, 49, 1.00, NULL, 0, 115, '2023-02-02 15:07:16.272', NULL, NULL, 75, 90);
INSERT INTO `wms_inventory_history` VALUES (253, 90, 11, 90, NULL, 1.00, NULL, 0, 115, '2023-02-02 15:08:54.691', NULL, NULL, 75, 90);
INSERT INTO `wms_inventory_history` VALUES (254, 220, 1, 89, NULL, 1.00, NULL, 0, 115, '2023-02-02 15:11:59.384', NULL, NULL, 75, NULL);
INSERT INTO `wms_inventory_history` VALUES (255, 91, 11, 89, NULL, 1.00, NULL, 0, 115, '2023-02-02 15:12:45.107', NULL, NULL, 75, NULL);
INSERT INTO `wms_inventory_history` VALUES (256, 223, 1, 91, 50, 1.00, NULL, 0, 115, '2023-02-02 22:07:16.210', NULL, NULL, 76, 89);
INSERT INTO `wms_inventory_history` VALUES (257, 222, 1, 91, 50, 1.00, NULL, 0, 115, '2023-02-02 22:08:31.981', NULL, NULL, 76, 89);
INSERT INTO `wms_inventory_history` VALUES (258, 226, 1, 91, 50, 1.00, NULL, 0, 115, '2023-02-03 15:29:26.719', NULL, NULL, 76, 89);
INSERT INTO `wms_inventory_history` VALUES (259, 228, 1, 91, 49, 1.00, NULL, 0, 115, '2023-02-04 00:31:27.938', NULL, NULL, 75, 90);
INSERT INTO `wms_inventory_history` VALUES (260, 229, 1, 91, NULL, 1.00, NULL, 0, 115, '2023-02-04 03:00:15.398', NULL, NULL, 75, 90);
INSERT INTO `wms_inventory_history` VALUES (261, 230, 2, 90, 52, 1.00, NULL, 0, 115, '2023-02-04 08:54:14.668', NULL, NULL, 78, 92);
INSERT INTO `wms_inventory_history` VALUES (262, 231, 1, 91, 52, 1.00, NULL, 0, 115, '2023-02-04 16:09:45.164', NULL, NULL, 78, 92);
INSERT INTO `wms_inventory_history` VALUES (263, 233, 1, 92, 52, 6.00, NULL, 0, 115, '2023-02-04 16:11:45.684', NULL, NULL, 78, 92);
INSERT INTO `wms_inventory_history` VALUES (264, 234, 1, 93, 52, 1.00, NULL, 0, 115, '2023-02-04 16:36:29.666', NULL, NULL, 78, 92);
INSERT INTO `wms_inventory_history` VALUES (265, 97, 11, 92, 52, 1.00, NULL, 0, 115, '2023-02-04 16:38:06.184', NULL, NULL, 78, 92);
INSERT INTO `wms_inventory_history` VALUES (266, 29, 21, 90, 49, 1.00, NULL, 0, 115, '2023-02-04 18:00:58.909', NULL, NULL, 75, 90);
INSERT INTO `wms_inventory_history` VALUES (267, 29, 22, 90, 51, 1.00, NULL, 0, 115, '2023-02-04 18:00:58.909', NULL, NULL, 77, 91);
INSERT INTO `wms_inventory_history` VALUES (268, 236, 1, 91, 51, 3.00, NULL, 0, 115, '2023-02-04 20:29:37.608', NULL, NULL, 77, 91);
INSERT INTO `wms_inventory_history` VALUES (269, 237, 1, 93, 52, 4.00, NULL, 0, 115, '2023-02-04 20:50:32.317', NULL, NULL, 78, 92);
INSERT INTO `wms_inventory_history` VALUES (270, 237, 1, 91, 50, 1.00, NULL, 0, 115, '2023-02-04 20:50:32.317', NULL, NULL, 76, 89);
INSERT INTO `wms_inventory_history` VALUES (271, 237, 1, 90, 49, 1.00, NULL, 0, 115, '2023-02-04 20:50:32.317', NULL, NULL, 75, 90);
INSERT INTO `wms_inventory_history` VALUES (272, 238, 1, 94, 49, 1.00, NULL, 0, 115, '2023-02-06 11:51:05.714', NULL, NULL, 75, 90);
INSERT INTO `wms_inventory_history` VALUES (273, 99, 11, 94, 49, 1.00, NULL, 0, 115, '2023-02-06 11:51:14.576', NULL, NULL, 75, 90);
INSERT INTO `wms_inventory_history` VALUES (274, 239, 1, 93, 50, 1.00, NULL, 0, 115, '2023-02-06 13:54:18.205', NULL, NULL, 76, 89);
INSERT INTO `wms_inventory_history` VALUES (275, 239, 1, 91, 51, 1.00, NULL, 0, 115, '2023-02-06 13:54:18.205', NULL, NULL, 77, 91);
INSERT INTO `wms_inventory_history` VALUES (276, 240, 1, 94, 53, 1.00, NULL, 0, 115, '2023-02-06 14:13:36.576', NULL, NULL, 83, 94);
INSERT INTO `wms_inventory_history` VALUES (277, 240, 1, 93, 53, 1.00, NULL, 0, 115, '2023-02-06 14:13:36.576', NULL, NULL, 83, 94);
INSERT INTO `wms_inventory_history` VALUES (278, 232, 1, 91, 49, 1.00, NULL, 0, 115, '2023-02-06 14:13:47.127', NULL, NULL, 75, 90);
INSERT INTO `wms_inventory_history` VALUES (279, 240, 1, 92, 53, 1.00, NULL, 0, 115, '2023-02-06 15:13:22.518', NULL, NULL, 83, 94);
INSERT INTO `wms_inventory_history` VALUES (280, 100, 11, 94, 53, 1.00, NULL, 0, 115, '2023-02-06 15:15:14.130', NULL, NULL, 83, 94);
INSERT INTO `wms_inventory_history` VALUES (281, 100, 11, 93, 53, 1.00, NULL, 0, 115, '2023-02-06 15:15:14.130', NULL, NULL, 83, 94);
INSERT INTO `wms_inventory_history` VALUES (282, 241, 1, 95, NULL, 1.00, NULL, 0, 115, '2023-02-06 15:21:15.356', NULL, NULL, 84, NULL);
INSERT INTO `wms_inventory_history` VALUES (283, 101, 11, 95, NULL, 1.00, NULL, 0, 115, '2023-02-06 15:22:34.727', NULL, NULL, 84, NULL);
INSERT INTO `wms_inventory_history` VALUES (284, 243, 1, 95, NULL, 1.00, NULL, 0, 115, '2023-02-07 09:21:35.184', NULL, NULL, 84, NULL);
INSERT INTO `wms_inventory_history` VALUES (285, 243, 1, 94, NULL, 1.00, NULL, 0, 115, '2023-02-07 09:21:35.184', NULL, NULL, 85, 95);
INSERT INTO `wms_inventory_history` VALUES (286, 104, 11, 95, NULL, 1.00, NULL, 0, 115, '2023-02-07 18:50:16.067', NULL, NULL, 84, NULL);
INSERT INTO `wms_inventory_history` VALUES (287, 249, 1, 96, 56, 1.00, NULL, 0, 115, '2023-02-08 09:16:11.414', NULL, NULL, 86, 98);
INSERT INTO `wms_inventory_history` VALUES (288, 249, 1, 97, 55, 1.00, NULL, 0, 115, '2023-02-08 09:16:11.414', NULL, NULL, 86, 98);
INSERT INTO `wms_inventory_history` VALUES (289, 250, 1, 94, 55, 1.00, NULL, 0, 115, '2023-02-08 09:35:44.276', NULL, NULL, 86, 98);
INSERT INTO `wms_inventory_history` VALUES (290, 251, 1, 94, NULL, 1.00, NULL, 0, 115, '2023-02-08 09:36:43.829', NULL, NULL, 85, 95);
INSERT INTO `wms_inventory_history` VALUES (291, 252, 1, 97, 49, 2.00, NULL, 0, 115, '2023-02-08 10:40:33.286', NULL, NULL, 84, 96);
INSERT INTO `wms_inventory_history` VALUES (292, 253, 1, 97, NULL, 1.00, NULL, 0, 115, '2023-02-08 11:38:59.140', NULL, NULL, 85, 95);
INSERT INTO `wms_inventory_history` VALUES (293, 253, 1, 96, 55, 1.00, NULL, 0, 115, '2023-02-08 11:38:59.140', NULL, NULL, 86, 98);
INSERT INTO `wms_inventory_history` VALUES (294, 254, 1, 99, 57, 100.00, NULL, 0, 115, '2023-02-08 16:40:11.370', NULL, NULL, 87, 100);
INSERT INTO `wms_inventory_history` VALUES (295, 34, 21, 99, 57, 1.00, NULL, 0, 115, '2023-02-08 16:43:52.713', NULL, NULL, 87, 100);
INSERT INTO `wms_inventory_history` VALUES (296, 34, 22, 99, 55, 1.00, NULL, 0, 115, '2023-02-08 16:43:52.713', NULL, NULL, 86, 98);
INSERT INTO `wms_inventory_history` VALUES (297, 257, 1, 99, 53, 1.00, NULL, 0, 115, '2023-02-09 14:27:51.811', NULL, NULL, 83, 94);
INSERT INTO `wms_inventory_history` VALUES (298, 35, 21, 99, 53, 1.00, NULL, 0, 115, '2023-02-09 14:49:06.371', NULL, NULL, 83, 94);
INSERT INTO `wms_inventory_history` VALUES (299, 35, 22, 99, NULL, 1.00, NULL, 0, 115, '2023-02-09 14:49:06.371', NULL, NULL, 84, NULL);
INSERT INTO `wms_inventory_history` VALUES (300, 261, 3, 100, 49, 1.00, NULL, 0, 115, '2023-02-10 15:50:01.962', NULL, NULL, 84, 96);
INSERT INTO `wms_inventory_history` VALUES (301, 262, 3, 101, NULL, 1.00, NULL, 0, 115, '2023-02-10 15:56:53.558', NULL, NULL, 89, 103);
INSERT INTO `wms_inventory_history` VALUES (302, 114, 13, 101, NULL, 1.00, NULL, 0, 115, '2023-02-10 15:57:49.144', NULL, NULL, 89, 103);
INSERT INTO `wms_inventory_history` VALUES (303, 260, 2, 93, 49, 2.00, NULL, 0, 115, '2023-02-11 11:10:58.894', NULL, NULL, 84, 96);
INSERT INTO `wms_inventory_history` VALUES (304, 260, 2, 94, NULL, 2.00, NULL, 0, 115, '2023-02-11 11:10:58.894', NULL, NULL, 86, 99);
INSERT INTO `wms_inventory_history` VALUES (305, 263, 1, 99, NULL, 150.00, NULL, 0, 115, '2023-02-11 19:02:04.517', NULL, NULL, 91, 108);
INSERT INTO `wms_inventory_history` VALUES (306, 264, 1, 101, 61, 2.00, NULL, 0, 115, '2023-02-11 19:04:58.594', NULL, NULL, 91, 105);
INSERT INTO `wms_inventory_history` VALUES (307, 264, 1, 99, 61, 3.00, NULL, 0, 115, '2023-02-11 19:04:58.594', NULL, NULL, 91, 105);
INSERT INTO `wms_inventory_history` VALUES (308, 265, 1, 101, 61, 10.00, NULL, 0, 115, '2023-02-11 20:17:33.109', NULL, NULL, 91, 105);
INSERT INTO `wms_inventory_history` VALUES (309, 265, 1, 99, NULL, 10.00, NULL, 0, 115, '2023-02-11 20:17:33.109', NULL, NULL, 91, 106);
INSERT INTO `wms_inventory_history` VALUES (310, 258, 1, 100, 49, 1.00, NULL, 0, 115, '2023-02-12 11:11:02.993', NULL, NULL, 84, 96);
INSERT INTO `wms_inventory_history` VALUES (311, 264, 1, 101, 61, 3.00, NULL, 0, 115, '2023-02-12 11:12:08.963', NULL, NULL, 91, 105);
INSERT INTO `wms_inventory_history` VALUES (312, 264, 1, 99, 61, 2.00, NULL, 0, 115, '2023-02-12 11:12:08.963', NULL, NULL, 91, 105);
INSERT INTO `wms_inventory_history` VALUES (313, 271, 1, 103, NULL, 1.00, NULL, 0, 115, '2023-02-13 11:35:41.675', NULL, NULL, 86, 99);
INSERT INTO `wms_inventory_history` VALUES (314, 271, 1, 102, 57, 1.00, NULL, 0, 115, '2023-02-13 11:36:15.364', NULL, NULL, 87, 100);
INSERT INTO `wms_inventory_history` VALUES (315, 273, 1, 103, 55, 1.00, NULL, 0, 115, '2023-02-13 11:38:39.748', NULL, NULL, 86, 98);
INSERT INTO `wms_inventory_history` VALUES (316, 273, 1, 102, 56, 1.00, NULL, 0, 115, '2023-02-13 11:38:39.748', NULL, NULL, 86, 98);
INSERT INTO `wms_inventory_history` VALUES (317, 274, 1, 103, 57, 5.00, NULL, 0, 115, '2023-02-13 11:40:48.863', NULL, NULL, 87, 100);
INSERT INTO `wms_inventory_history` VALUES (318, 274, 1, 102, 61, 9.00, NULL, 0, 115, '2023-02-13 11:40:48.863', NULL, NULL, 91, 105);
INSERT INTO `wms_inventory_history` VALUES (319, 275, 1, 103, 55, 1.00, NULL, 0, 115, '2023-02-13 16:26:38.792', NULL, NULL, 86, 98);
INSERT INTO `wms_inventory_history` VALUES (320, 119, 11, 103, 55, 1.00, NULL, 0, 115, '2023-02-13 17:21:47.932', NULL, NULL, 86, 98);
INSERT INTO `wms_inventory_history` VALUES (321, 277, 1, 104, NULL, 1000.00, NULL, 0, 115, '2023-02-14 09:32:14.452', NULL, NULL, 88, NULL);
INSERT INTO `wms_inventory_history` VALUES (322, 278, 1, 104, NULL, 1.00, NULL, 0, 115, '2023-02-14 09:48:07.474', NULL, NULL, 88, NULL);
INSERT INTO `wms_inventory_history` VALUES (323, 279, 1, 104, NULL, 2.00, NULL, 0, 115, '2023-02-14 17:24:04.134', NULL, NULL, 88, NULL);
INSERT INTO `wms_inventory_history` VALUES (324, 279, 1, 103, 55, 2.00, NULL, 0, 115, '2023-02-14 17:24:04.134', NULL, NULL, 86, 98);
INSERT INTO `wms_inventory_history` VALUES (325, 284, 1, 105, NULL, 4.00, NULL, 0, 115, '2023-02-15 11:30:11.903', NULL, NULL, 93, NULL);
INSERT INTO `wms_inventory_history` VALUES (326, 117, 11, 103, 55, 1.00, NULL, 0, 115, '2023-02-15 12:10:33.974', NULL, NULL, 86, 98);
INSERT INTO `wms_inventory_history` VALUES (327, 286, 1, 107, 64, 8888.00, NULL, 0, 115, '2023-02-15 15:09:57.324', NULL, NULL, 95, 111);
INSERT INTO `wms_inventory_history` VALUES (328, 292, 1, 108, 65, 15.00, NULL, 0, 115, '2023-02-16 15:19:19.829', NULL, NULL, 98, 112);
INSERT INTO `wms_inventory_history` VALUES (329, 293, 3, 110, 66, 1.00, NULL, 0, 115, '2023-02-17 10:56:03.259', NULL, NULL, 101, 115);
INSERT INTO `wms_inventory_history` VALUES (330, 294, 1, 110, 66, 14.00, NULL, 0, 115, '2023-02-17 11:13:17.734', NULL, NULL, 101, 115);
INSERT INTO `wms_inventory_history` VALUES (331, 295, 1, 111, 67, 10.00, NULL, 0, 115, '2023-02-17 13:21:49.739', NULL, NULL, 102, 116);
INSERT INTO `wms_inventory_history` VALUES (332, 120, 11, 111, 67, 1.00, NULL, 0, 115, '2023-02-17 13:22:13.027', NULL, NULL, 102, 116);
INSERT INTO `wms_inventory_history` VALUES (333, 297, 1, 113, 67, 1.00, NULL, 0, 115, '2023-02-17 15:52:07.260', NULL, NULL, 102, 116);
INSERT INTO `wms_inventory_history` VALUES (334, 296, 1, 112, 67, 1.00, NULL, 0, 115, '2023-02-17 15:52:30.917', NULL, NULL, 102, 116);
INSERT INTO `wms_inventory_history` VALUES (335, 301, 1, 115, 67, 1.00, NULL, 0, 115, '2023-02-18 00:32:00.457', NULL, NULL, 101, 115);
INSERT INTO `wms_inventory_history` VALUES (336, 301, 1, 114, 67, 1.00, NULL, 0, 115, '2023-02-18 00:32:00.457', NULL, NULL, 101, 115);
INSERT INTO `wms_inventory_history` VALUES (337, 303, 1, 111, 67, 1.00, NULL, 0, 115, '2023-02-19 23:33:13.563', NULL, NULL, 104, 117);
INSERT INTO `wms_inventory_history` VALUES (338, 300, 2, 114, 67, 1.00, NULL, 0, 115, '2023-02-20 10:41:13.520', NULL, NULL, 102, 116);
INSERT INTO `wms_inventory_history` VALUES (339, 306, 1, 115, NULL, 10.00, NULL, 0, 115, '2023-02-21 10:32:34.977', NULL, NULL, 105, NULL);
INSERT INTO `wms_inventory_history` VALUES (340, 304, 1, 115, NULL, 1.00, NULL, 0, 115, '2023-02-21 10:41:20.278', NULL, NULL, 105, NULL);
INSERT INTO `wms_inventory_history` VALUES (341, 307, 1, 117, 68, 999.00, NULL, 0, 115, '2023-02-21 14:19:02.938', NULL, NULL, 106, 118);
INSERT INTO `wms_inventory_history` VALUES (342, 125, 11, 117, 68, 100.00, NULL, 0, 115, '2023-02-21 14:19:36.490', NULL, NULL, 106, 118);
INSERT INTO `wms_inventory_history` VALUES (343, 48, 21, 117, 68, 1.00, NULL, 0, 115, '2023-02-21 14:21:05.766', NULL, NULL, 106, 118);
INSERT INTO `wms_inventory_history` VALUES (344, 48, 22, 117, NULL, 1.00, NULL, 0, 115, '2023-02-21 14:21:05.766', NULL, NULL, 105, NULL);
INSERT INTO `wms_inventory_history` VALUES (345, 312, 1, 117, 68, 1.00, NULL, 0, 115, '2023-02-22 07:22:49.661', NULL, NULL, 106, 118);
INSERT INTO `wms_inventory_history` VALUES (346, 127, 11, 117, NULL, 1.00, NULL, 0, 115, '2023-02-22 14:00:20.315', NULL, NULL, 106, NULL);
INSERT INTO `wms_inventory_history` VALUES (347, 130, 11, 117, 68, 1.00, NULL, 0, 115, '2023-02-22 17:22:06.413', NULL, NULL, 106, 118);
INSERT INTO `wms_inventory_history` VALUES (348, 317, 1, 112, 66, 1.00, NULL, 0, 115, '2023-02-22 20:05:14.148', NULL, NULL, 101, 115);
INSERT INTO `wms_inventory_history` VALUES (349, 317, 1, 110, 66, 1.00, NULL, 0, 115, '2023-02-22 20:05:14.148', NULL, NULL, 101, 115);
INSERT INTO `wms_inventory_history` VALUES (350, 133, 13, 117, 68, 1.00, NULL, 0, 115, '2023-02-23 14:59:15.442', NULL, NULL, 106, 118);
INSERT INTO `wms_inventory_history` VALUES (351, 316, 1, 117, 68, 1.00, NULL, 0, 115, '2023-02-23 15:33:07.261', NULL, NULL, 106, 118);
INSERT INTO `wms_inventory_history` VALUES (352, 132, 11, 117, 68, 1.00, NULL, 0, 115, '2023-02-23 15:33:25.230', NULL, NULL, 106, 118);
INSERT INTO `wms_inventory_history` VALUES (353, 129, 11, 117, 68, 1.00, NULL, 0, 115, '2023-02-23 15:33:40.852', NULL, NULL, 106, 118);
INSERT INTO `wms_inventory_history` VALUES (354, 320, 1, 114, NULL, 1.00, NULL, 0, 115, '2023-02-23 22:16:22.924', NULL, NULL, 107, NULL);
INSERT INTO `wms_inventory_history` VALUES (355, 320, 1, 112, NULL, 1.00, NULL, 0, 115, '2023-02-23 22:16:22.924', NULL, NULL, 107, NULL);
INSERT INTO `wms_inventory_history` VALUES (356, 323, 1, 117, 68, 1.00, NULL, 0, 115, '2023-02-24 15:24:09.533', NULL, NULL, 106, 118);
INSERT INTO `wms_inventory_history` VALUES (357, 323, 1, 115, 67, 1.00, NULL, 0, 115, '2023-02-24 15:24:09.533', NULL, NULL, 104, 117);
INSERT INTO `wms_inventory_history` VALUES (358, 323, 1, 114, 67, 1.00, NULL, 0, 115, '2023-02-24 15:24:09.533', NULL, NULL, 102, 116);
INSERT INTO `wms_inventory_history` VALUES (359, 323, 1, 113, 67, 1.00, NULL, 0, 115, '2023-02-24 15:24:09.533', NULL, NULL, 102, 116);
INSERT INTO `wms_inventory_history` VALUES (360, 324, 1, 117, 71, 1.00, NULL, 0, 115, '2023-02-24 15:28:30.427', NULL, NULL, 109, 120);
INSERT INTO `wms_inventory_history` VALUES (361, 325, 1, 117, 71, 1.00, NULL, 0, 115, '2023-02-24 16:36:51.134', NULL, NULL, 109, 120);
INSERT INTO `wms_inventory_history` VALUES (362, 325, 1, 112, 66, 1.00, NULL, 0, 115, '2023-02-24 16:36:51.134', NULL, NULL, 101, 115);
INSERT INTO `wms_inventory_history` VALUES (363, 138, 11, 117, 71, 1.00, NULL, 0, 115, '2023-02-24 16:38:24.366', NULL, NULL, 109, 120);
INSERT INTO `wms_inventory_history` VALUES (364, 138, 11, 112, 66, 1.00, NULL, 0, 115, '2023-02-24 16:38:24.366', NULL, NULL, 101, 115);
INSERT INTO `wms_inventory_history` VALUES (365, 326, 1, 117, NULL, 2.00, NULL, 0, 115, '2023-02-25 00:41:10.262', NULL, NULL, 111, 121);
INSERT INTO `wms_inventory_history` VALUES (366, 326, 1, 112, NULL, 1.00, NULL, 0, 115, '2023-02-25 00:41:10.262', NULL, NULL, 111, 121);
INSERT INTO `wms_inventory_history` VALUES (367, 333, 3, 119, NULL, 1.00, NULL, 0, 115, '2023-02-26 15:13:26.023', NULL, NULL, 111, NULL);
INSERT INTO `wms_inventory_history` VALUES (368, 334, 1, 119, NULL, 1.00, NULL, 0, 115, '2023-02-26 15:17:09.367', NULL, NULL, 111, NULL);
INSERT INTO `wms_inventory_history` VALUES (369, 334, 1, 118, NULL, 1.00, NULL, 0, 115, '2023-02-26 15:17:09.367', NULL, NULL, 111, NULL);
INSERT INTO `wms_inventory_history` VALUES (370, 334, 1, 118, NULL, 1.00, NULL, 0, 115, '2023-02-26 17:55:39.094', NULL, NULL, 111, NULL);
INSERT INTO `wms_inventory_history` VALUES (371, 336, 1, 121, NULL, 1.00, NULL, 0, 115, '2023-02-27 10:20:16.142', NULL, NULL, 111, NULL);
INSERT INTO `wms_inventory_history` VALUES (372, 336, 1, 119, NULL, 1.00, NULL, 0, 115, '2023-02-27 10:20:16.142', NULL, NULL, 111, NULL);
INSERT INTO `wms_inventory_history` VALUES (373, 337, 1, 122, NULL, 1.00, NULL, 0, 115, '2023-02-27 10:36:12.832', NULL, NULL, 115, 125);
INSERT INTO `wms_inventory_history` VALUES (374, 142, 11, 122, NULL, 1.00, NULL, 0, 115, '2023-02-27 10:36:27.664', NULL, NULL, 115, 125);
INSERT INTO `wms_inventory_history` VALUES (375, 339, 1, 121, NULL, 6.00, NULL, 0, 115, '2023-02-27 12:33:01.009', NULL, NULL, 111, NULL);
INSERT INTO `wms_inventory_history` VALUES (376, 339, 1, 120, NULL, 5.00, NULL, 0, 115, '2023-02-27 12:33:01.009', NULL, NULL, 111, NULL);
INSERT INTO `wms_inventory_history` VALUES (377, 339, 1, 119, NULL, 6.00, NULL, 0, 115, '2023-02-27 12:33:01.009', NULL, NULL, 111, NULL);
INSERT INTO `wms_inventory_history` VALUES (378, 339, 1, 118, NULL, 6.00, NULL, 0, 115, '2023-02-27 12:33:01.009', NULL, NULL, 111, NULL);
INSERT INTO `wms_inventory_history` VALUES (379, 143, 11, 121, NULL, 1.00, NULL, 0, 115, '2023-02-27 12:34:17.334', NULL, NULL, 111, NULL);
INSERT INTO `wms_inventory_history` VALUES (380, 143, 11, 120, NULL, 1.00, NULL, 0, 115, '2023-02-27 12:34:17.334', NULL, NULL, 111, NULL);
INSERT INTO `wms_inventory_history` VALUES (381, 341, 1, 121, NULL, 1.00, NULL, 0, 115, '2023-02-27 22:45:36.773', NULL, NULL, 114, NULL);
INSERT INTO `wms_inventory_history` VALUES (382, 341, 1, 120, NULL, 1.00, NULL, 0, 115, '2023-02-27 22:45:36.773', NULL, NULL, 114, NULL);
INSERT INTO `wms_inventory_history` VALUES (383, 341, 1, 119, NULL, 1.00, NULL, 0, 115, '2023-02-27 22:45:36.773', NULL, NULL, 114, NULL);
INSERT INTO `wms_inventory_history` VALUES (384, 341, 1, 118, NULL, 1.00, NULL, 0, 115, '2023-02-27 22:45:36.773', NULL, NULL, 114, NULL);
INSERT INTO `wms_inventory_history` VALUES (385, 343, 1, 121, NULL, 1.00, NULL, 0, 115, '2023-02-28 00:16:22.640', NULL, NULL, 113, NULL);
INSERT INTO `wms_inventory_history` VALUES (386, 342, 1, 121, NULL, 1.00, NULL, 0, 115, '2023-02-28 00:16:38.741', NULL, NULL, 113, NULL);
INSERT INTO `wms_inventory_history` VALUES (387, 55, 21, 121, NULL, 1.00, NULL, 0, 115, '2023-02-28 11:07:08.767', NULL, NULL, 111, NULL);
INSERT INTO `wms_inventory_history` VALUES (388, 55, 22, 121, NULL, 1.00, NULL, 0, 115, '2023-02-28 11:07:08.767', NULL, NULL, 113, NULL);
INSERT INTO `wms_inventory_history` VALUES (389, 344, 1, 121, NULL, 1.00, NULL, 0, 115, '2023-02-28 11:08:42.068', NULL, NULL, 111, NULL);
INSERT INTO `wms_inventory_history` VALUES (390, 348, 2, 121, 74, 322424.00, NULL, 0, 115, '2023-03-01 03:09:32.710', NULL, NULL, 116, 126);
INSERT INTO `wms_inventory_history` VALUES (391, 348, 2, 120, 74, 234324224.00, NULL, 0, 115, '2023-03-01 03:09:32.710', NULL, NULL, 116, 126);
INSERT INTO `wms_inventory_history` VALUES (392, 349, 1, 121, NULL, 100.00, NULL, 0, 115, '2023-03-01 10:26:33.717', NULL, NULL, 116, NULL);
INSERT INTO `wms_inventory_history` VALUES (393, 352, 1, 123, 74, 500.00, NULL, 0, 115, '2023-03-01 16:06:21.730', NULL, NULL, 116, 126);
INSERT INTO `wms_inventory_history` VALUES (394, 355, 1, 123, 74, 2147483647.00, NULL, 0, 115, '2023-03-01 17:29:30.101', NULL, NULL, 116, 126);
INSERT INTO `wms_inventory_history` VALUES (395, 356, 1, 125, 77, 1.00, NULL, 0, 115, '2023-03-01 18:04:56.693', NULL, NULL, 118, 128);
INSERT INTO `wms_inventory_history` VALUES (396, 356, 1, 124, 76, 1.00, NULL, 0, 115, '2023-03-01 18:04:56.693', NULL, NULL, 119, 131);
INSERT INTO `wms_inventory_history` VALUES (397, 357, 1, 125, 77, 1000.00, NULL, 0, 115, '2023-03-02 09:21:54.230', NULL, NULL, 118, 128);
INSERT INTO `wms_inventory_history` VALUES (398, 357, 1, 124, 79, 190.00, NULL, 0, 115, '2023-03-02 09:21:54.230', NULL, NULL, 119, 131);
INSERT INTO `wms_inventory_history` VALUES (399, 150, 11, 125, 77, 300.00, NULL, 0, 115, '2023-03-02 09:25:17.571', NULL, NULL, 118, 128);
INSERT INTO `wms_inventory_history` VALUES (400, 150, 11, 124, 79, 17.00, NULL, 0, 115, '2023-03-02 09:26:39.301', NULL, NULL, 119, 131);
INSERT INTO `wms_inventory_history` VALUES (401, 56, 21, 125, 77, 1.00, NULL, 0, 115, '2023-03-02 09:36:22.784', NULL, NULL, 118, 128);
INSERT INTO `wms_inventory_history` VALUES (402, 56, 22, 125, 78, 1.00, NULL, 0, 115, '2023-03-02 09:36:22.784', NULL, NULL, 118, 129);
INSERT INTO `wms_inventory_history` VALUES (403, 57, 21, 125, 77, 100.00, NULL, 0, 115, '2023-03-02 09:46:27.567', NULL, NULL, 118, 128);
INSERT INTO `wms_inventory_history` VALUES (404, 57, 22, 125, 78, 100.00, NULL, 0, 115, '2023-03-02 09:46:27.567', NULL, NULL, 118, 129);
INSERT INTO `wms_inventory_history` VALUES (405, 362, 1, 125, NULL, 1.00, NULL, 0, 115, '2023-03-03 08:30:31.413', NULL, NULL, 117, 127);
INSERT INTO `wms_inventory_history` VALUES (406, 362, 1, 124, 78, 1.00, NULL, 0, 115, '2023-03-03 08:30:31.413', NULL, NULL, 118, 129);
INSERT INTO `wms_inventory_history` VALUES (407, 364, 1, 125, NULL, 1.00, NULL, 0, 115, '2023-03-03 08:44:50.864', NULL, NULL, 118, 129);
INSERT INTO `wms_inventory_history` VALUES (408, 363, 1, 125, NULL, 1.00, NULL, 0, 115, '2023-03-03 08:45:43.799', NULL, NULL, 118, 129);
INSERT INTO `wms_inventory_history` VALUES (409, 154, 11, 125, NULL, 1.00, NULL, 0, 115, '2023-03-03 08:46:33.879', NULL, NULL, 118, NULL);
INSERT INTO `wms_inventory_history` VALUES (410, 155, 11, 125, NULL, 1.00, NULL, 0, 115, '2023-03-03 08:50:25.503', NULL, NULL, 117, NULL);
INSERT INTO `wms_inventory_history` VALUES (411, 156, 11, 125, 78, 1.00, NULL, 0, 115, '2023-03-03 08:51:42.543', NULL, NULL, 118, 129);
INSERT INTO `wms_inventory_history` VALUES (412, 365, 1, 125, NULL, 1.00, NULL, 0, 115, '2023-03-03 12:57:29.344', NULL, NULL, 116, NULL);
INSERT INTO `wms_inventory_history` VALUES (413, 367, 1, 128, 90, 2.00, NULL, 0, 115, '2023-03-03 21:42:50.029', NULL, NULL, 122, 135);
INSERT INTO `wms_inventory_history` VALUES (414, 367, 1, 127, 91, 12.00, NULL, 0, 115, '2023-03-03 21:42:50.029', NULL, NULL, 122, 135);
INSERT INTO `wms_inventory_history` VALUES (415, 368, 1, 127, 90, 100.00, NULL, 0, 115, '2023-03-03 22:00:24.594', NULL, NULL, 122, 135);
INSERT INTO `wms_inventory_history` VALUES (416, 369, 1, 127, 90, 200.00, NULL, 0, 115, '2023-03-03 22:03:10.273', NULL, NULL, 122, 135);
INSERT INTO `wms_inventory_history` VALUES (417, 157, 11, 127, 90, 8.00, NULL, 0, 115, '2023-03-03 22:12:16.462', NULL, NULL, 122, 135);
INSERT INTO `wms_inventory_history` VALUES (418, 370, 1, 130, NULL, 13.00, NULL, 0, 115, '2023-03-03 22:37:09.315', NULL, NULL, 117, 127);
INSERT INTO `wms_inventory_history` VALUES (419, 371, 1, 130, NULL, 6.00, NULL, 0, 115, '2023-03-03 22:39:13.283', NULL, NULL, 117, 127);
INSERT INTO `wms_inventory_history` VALUES (420, 158, 11, 127, 90, 1.00, NULL, 0, 115, '2023-03-05 16:13:36.811', NULL, NULL, 122, 135);
INSERT INTO `wms_inventory_history` VALUES (421, 373, 1, 130, 89, 1.00, NULL, 0, 115, '2023-03-06 08:28:08.813', NULL, NULL, 121, 134);
INSERT INTO `wms_inventory_history` VALUES (422, 373, 1, 129, 89, 1.00, NULL, 0, 115, '2023-03-06 08:28:08.813', NULL, NULL, 121, 134);
INSERT INTO `wms_inventory_history` VALUES (423, 373, 1, 128, 91, 1.00, NULL, 0, 115, '2023-03-06 08:28:08.813', NULL, NULL, 122, 135);
INSERT INTO `wms_inventory_history` VALUES (424, 366, 1, 130, 89, 1.00, NULL, 0, 115, '2023-03-06 13:37:34.158', NULL, NULL, 121, 134);
INSERT INTO `wms_inventory_history` VALUES (425, 59, 21, 130, NULL, 1.00, NULL, 0, 115, '2023-03-06 16:53:49.677', NULL, NULL, 117, 127);
INSERT INTO `wms_inventory_history` VALUES (426, 59, 22, 130, 78, 1.00, NULL, 0, 115, '2023-03-06 16:53:49.677', NULL, NULL, 118, 129);
INSERT INTO `wms_inventory_history` VALUES (427, 59, 21, 130, NULL, 9.00, NULL, 0, 115, '2023-03-06 16:55:41.094', NULL, NULL, 117, 127);
INSERT INTO `wms_inventory_history` VALUES (428, 59, 22, 130, 78, 9.00, NULL, 0, 115, '2023-03-06 16:55:41.094', NULL, NULL, 118, 129);
INSERT INTO `wms_inventory_history` VALUES (429, 374, 1, 130, 89, 1.00, NULL, 0, 115, '2023-03-07 09:15:59.618', NULL, NULL, 121, 134);
INSERT INTO `wms_inventory_history` VALUES (430, 374, 1, 129, 89, 1.00, NULL, 0, 115, '2023-03-07 09:41:10.152', NULL, NULL, 121, 134);
INSERT INTO `wms_inventory_history` VALUES (431, 162, 11, 130, 89, 1.00, NULL, 0, 115, '2023-03-07 14:17:46.370', NULL, NULL, 121, 134);
INSERT INTO `wms_inventory_history` VALUES (432, 379, 1, 131, 92, 1.00, NULL, 0, 115, '2023-03-08 09:37:18.535', NULL, NULL, 117, 136);
INSERT INTO `wms_inventory_history` VALUES (433, 380, 1, 131, NULL, 200.00, NULL, 0, 115, '2023-03-08 09:39:15.801', NULL, NULL, 117, 127);
INSERT INTO `wms_inventory_history` VALUES (434, 385, 1, 133, 92, 1.00, NULL, 0, 115, '2023-03-09 13:02:37.792', NULL, NULL, 117, 136);
INSERT INTO `wms_inventory_history` VALUES (435, 385, 1, 133, 92, 9.00, NULL, 0, 115, '2023-03-09 13:04:20.196', NULL, NULL, 117, 136);
INSERT INTO `wms_inventory_history` VALUES (436, 164, 11, 133, 92, 1.00, NULL, 0, 115, '2023-03-09 13:05:28.478', NULL, NULL, 117, 136);
INSERT INTO `wms_inventory_history` VALUES (437, 165, 11, 133, 92, 1.00, NULL, 0, 115, '2023-03-09 13:07:54.025', NULL, NULL, 117, 136);
INSERT INTO `wms_inventory_history` VALUES (438, 386, 1, 133, 92, 1.00, NULL, 0, 115, '2023-03-09 13:09:36.818', NULL, NULL, 117, 136);
INSERT INTO `wms_inventory_history` VALUES (439, 166, 11, 133, 92, 1.00, NULL, 0, 115, '2023-03-09 13:10:25.839', NULL, NULL, 117, 136);
INSERT INTO `wms_inventory_history` VALUES (440, 387, 1, 131, NULL, 1.00, NULL, 0, 115, '2023-03-09 15:10:54.182', NULL, NULL, 117, 136);
INSERT INTO `wms_inventory_history` VALUES (441, 388, 1, 133, 92, 10.00, NULL, 0, 115, '2023-03-09 15:11:49.674', NULL, NULL, 117, 136);
INSERT INTO `wms_inventory_history` VALUES (442, 167, 11, 133, 92, 1.00, NULL, 0, 115, '2023-03-09 17:32:08.514', NULL, NULL, 117, 136);
INSERT INTO `wms_inventory_history` VALUES (443, 168, 11, 133, 92, 1.00, NULL, 0, 115, '2023-03-10 15:24:18.504', NULL, NULL, 117, 136);
INSERT INTO `wms_inventory_history` VALUES (444, 168, 11, 128, 91, 1.00, NULL, 0, 115, '2023-03-10 15:24:24.782', NULL, NULL, 122, 135);
INSERT INTO `wms_inventory_history` VALUES (445, 382, 1, 132, NULL, 1.00, NULL, 0, 115, '2023-03-10 15:29:42.881', NULL, NULL, NULL, NULL);
INSERT INTO `wms_inventory_history` VALUES (446, 391, 1, 134, NULL, 1.00, NULL, 0, 115, '2023-03-12 13:39:25.765', NULL, NULL, 130, NULL);
INSERT INTO `wms_inventory_history` VALUES (447, 392, 1, 134, 94, 10.00, NULL, 0, 115, '2023-03-12 16:02:14.183', NULL, NULL, 131, 142);
INSERT INTO `wms_inventory_history` VALUES (448, 170, 11, 134, 94, 7.00, NULL, 0, 115, '2023-03-12 16:05:24.352', NULL, NULL, 131, 142);
INSERT INTO `wms_inventory_history` VALUES (449, 171, 11, 134, 94, 3.00, NULL, 0, 115, '2023-03-12 16:10:28.534', NULL, NULL, 131, 142);
INSERT INTO `wms_inventory_history` VALUES (450, 394, 1, 134, NULL, 6.00, NULL, 0, 115, '2023-03-13 00:24:13.163', NULL, NULL, 132, NULL);
INSERT INTO `wms_inventory_history` VALUES (451, 395, 1, 135, NULL, 1.00, NULL, 0, 115, '2023-03-13 04:17:07.843', NULL, NULL, 133, NULL);
INSERT INTO `wms_inventory_history` VALUES (452, 396, 1, 136, NULL, 1.00, NULL, 0, 115, '2023-03-13 10:30:16.745', NULL, NULL, NULL, NULL);
INSERT INTO `wms_inventory_history` VALUES (453, 396, 2, 137, NULL, 50.00, NULL, 0, 115, '2023-03-13 10:32:39.611', NULL, NULL, NULL, NULL);
INSERT INTO `wms_inventory_history` VALUES (454, 396, 2, 136, NULL, 100.00, NULL, 0, 115, '2023-03-13 10:32:39.611', NULL, NULL, NULL, NULL);
INSERT INTO `wms_inventory_history` VALUES (455, 397, 1, 138, 96, 1.00, NULL, 0, 115, '2023-03-13 15:23:51.403', NULL, NULL, 134, 144);
INSERT INTO `wms_inventory_history` VALUES (456, 397, 1, 137, 96, 1.00, NULL, 0, 115, '2023-03-13 15:23:51.403', NULL, NULL, 134, 144);
INSERT INTO `wms_inventory_history` VALUES (457, 175, 11, 138, NULL, 1.00, NULL, 0, 115, '2023-03-13 15:25:21.378', NULL, NULL, 134, 144);
INSERT INTO `wms_inventory_history` VALUES (458, 398, 1, 137, NULL, 1.00, NULL, 0, 115, '2023-03-13 15:39:42.608', NULL, NULL, 135, NULL);
INSERT INTO `wms_inventory_history` VALUES (459, 399, 1, 138, NULL, 1.00, NULL, 0, 115, '2023-03-13 15:52:23.869', NULL, NULL, 135, NULL);
INSERT INTO `wms_inventory_history` VALUES (460, 400, 1, 139, NULL, 1.00, NULL, 0, 115, '2023-03-13 15:56:25.095', NULL, NULL, 136, 145);
INSERT INTO `wms_inventory_history` VALUES (461, 401, 1, 139, NULL, 100.00, NULL, 0, 115, '2023-03-13 15:58:56.646', NULL, NULL, 136, 145);
INSERT INTO `wms_inventory_history` VALUES (462, 402, 1, 140, NULL, 1.00, NULL, 0, 115, '2023-03-13 16:30:47.752', NULL, NULL, 135, 147);
INSERT INTO `wms_inventory_history` VALUES (463, 177, 11, 140, NULL, 1.00, NULL, 0, 115, '2023-03-13 16:31:08.269', NULL, NULL, 135, 147);
INSERT INTO `wms_inventory_history` VALUES (464, 403, 1, 140, NULL, 4.00, NULL, 0, 115, '2023-03-13 16:32:56.763', NULL, NULL, 135, 147);
INSERT INTO `wms_inventory_history` VALUES (465, 178, 11, 140, NULL, 4.00, NULL, 0, 115, '2023-03-13 16:33:18.093', NULL, NULL, 135, 147);
INSERT INTO `wms_inventory_history` VALUES (466, 404, 1, 136, 96, 1.00, NULL, 0, 115, '2023-03-14 09:53:57.694', NULL, NULL, 135, 147);
INSERT INTO `wms_inventory_history` VALUES (467, 407, 1, 140, 96, 1.00, NULL, 0, 115, '2023-03-14 13:49:07.845', NULL, NULL, 135, 147);
INSERT INTO `wms_inventory_history` VALUES (468, 407, 1, 139, NULL, 1.00, NULL, 0, 115, '2023-03-14 13:49:07.845', NULL, NULL, 136, 145);
INSERT INTO `wms_inventory_history` VALUES (469, 408, 1, 142, 97, 1.00, NULL, 0, 115, '2023-03-14 16:17:08.567', NULL, NULL, 135, 147);
INSERT INTO `wms_inventory_history` VALUES (470, 409, 1, 142, 97, 10000.00, NULL, 0, 115, '2023-03-14 16:18:41.549', NULL, NULL, 135, 147);
INSERT INTO `wms_inventory_history` VALUES (471, 182, 11, 142, 97, 100.00, NULL, 0, 115, '2023-03-14 16:20:11.497', NULL, NULL, 135, 147);
INSERT INTO `wms_inventory_history` VALUES (472, 184, 11, 142, 97, 50.00, NULL, 0, 115, '2023-03-15 13:30:11.450', NULL, NULL, 135, 147);
INSERT INTO `wms_inventory_history` VALUES (473, 413, 1, 142, NULL, 1.00, NULL, 0, 115, '2023-03-15 18:46:37.826', NULL, NULL, 137, 148);
INSERT INTO `wms_inventory_history` VALUES (474, 413, 1, 141, NULL, 1.00, NULL, 0, 115, '2023-03-15 18:46:37.826', NULL, NULL, 137, NULL);
INSERT INTO `wms_inventory_history` VALUES (475, 414, 1, 140, NULL, 1.00, NULL, 0, 115, '2023-03-15 21:50:15.566', NULL, NULL, 135, 149);
INSERT INTO `wms_inventory_history` VALUES (476, 415, 1, 142, NULL, 1.00, NULL, 0, 115, '2023-03-16 09:21:46.755', NULL, NULL, 138, NULL);
INSERT INTO `wms_inventory_history` VALUES (477, 416, 1, 142, 97, 1.00, NULL, 0, 115, '2023-03-16 11:30:34.608', NULL, NULL, 135, 147);
INSERT INTO `wms_inventory_history` VALUES (478, 416, 1, 141, 96, 1.00, NULL, 0, 115, '2023-03-16 11:30:34.608', NULL, NULL, 135, 147);
INSERT INTO `wms_inventory_history` VALUES (479, 416, 1, 140, 96, 1.00, NULL, 0, 115, '2023-03-16 11:30:34.608', NULL, NULL, 135, 147);
INSERT INTO `wms_inventory_history` VALUES (480, 416, 1, 139, NULL, 1.00, NULL, 0, 115, '2023-03-16 11:30:34.608', NULL, NULL, 136, NULL);
INSERT INTO `wms_inventory_history` VALUES (481, 416, 1, 138, NULL, 1.00, NULL, 0, 115, '2023-03-16 11:30:34.608', NULL, NULL, 135, NULL);
INSERT INTO `wms_inventory_history` VALUES (482, 416, 1, 137, NULL, 1.00, NULL, 0, 115, '2023-03-16 11:30:34.608', NULL, NULL, 135, NULL);
INSERT INTO `wms_inventory_history` VALUES (483, 416, 1, 136, NULL, 1.00, NULL, 0, 115, '2023-03-16 11:30:34.608', NULL, NULL, NULL, NULL);
INSERT INTO `wms_inventory_history` VALUES (484, 418, 1, 141, 96, 1.00, NULL, 0, 115, '2023-03-16 18:07:01.872', NULL, NULL, 135, 147);
INSERT INTO `wms_inventory_history` VALUES (485, 66, 21, 141, NULL, 1.00, NULL, 0, 115, '2023-03-16 18:32:12.598', NULL, NULL, 137, NULL);
INSERT INTO `wms_inventory_history` VALUES (486, 66, 22, 141, NULL, 1.00, NULL, 0, 115, '2023-03-16 18:32:12.598', NULL, NULL, 135, 149);
INSERT INTO `wms_inventory_history` VALUES (487, 421, 1, 142, NULL, 1.00, NULL, 0, 115, '2023-03-17 15:32:11.113', NULL, NULL, 136, 145);
INSERT INTO `wms_inventory_history` VALUES (488, 421, 1, 137, NULL, 1.00, NULL, 0, 115, '2023-03-17 15:32:11.113', NULL, NULL, 135, NULL);
INSERT INTO `wms_inventory_history` VALUES (489, 423, 2, 142, 98, 1.00, NULL, 0, 115, '2023-03-17 18:06:04.186', NULL, NULL, 137, 148);
INSERT INTO `wms_inventory_history` VALUES (490, 423, 2, 141, 97, 1.00, NULL, 0, 115, '2023-03-17 18:06:04.186', NULL, NULL, 135, 147);
INSERT INTO `wms_inventory_history` VALUES (491, 422, 1, 142, NULL, 1.00, NULL, 0, 115, '2023-03-20 08:40:39.405', NULL, NULL, 137, NULL);
INSERT INTO `wms_inventory_history` VALUES (492, 422, 1, 141, NULL, 1.00, NULL, 0, 115, '2023-03-20 08:40:39.405', NULL, NULL, 138, NULL);
INSERT INTO `wms_inventory_history` VALUES (493, 425, 1, 142, NULL, 188.00, NULL, 0, 115, '2023-03-20 11:36:07.205', NULL, NULL, 139, NULL);
INSERT INTO `wms_inventory_history` VALUES (494, 425, 1, 141, NULL, 6000.00, NULL, 0, 115, '2023-03-20 11:36:07.205', NULL, NULL, 135, NULL);
INSERT INTO `wms_inventory_history` VALUES (495, 428, 1, 143, 97, 1.00, NULL, 0, 115, '2023-03-20 13:48:34.919', NULL, NULL, 135, 147);
INSERT INTO `wms_inventory_history` VALUES (496, 194, 11, 143, 97, 1.00, NULL, 0, 115, '2023-03-20 13:50:47.091', NULL, NULL, 135, 147);
INSERT INTO `wms_inventory_history` VALUES (497, 429, 1, 143, 97, 1.00, NULL, 0, 115, '2023-03-20 14:08:46.470', NULL, NULL, 135, 147);
INSERT INTO `wms_inventory_history` VALUES (498, 429, 1, 142, NULL, 1.00, NULL, 0, 115, '2023-03-20 14:08:46.470', NULL, NULL, 136, 145);
INSERT INTO `wms_inventory_history` VALUES (499, 429, 1, 139, NULL, 1.00, NULL, 0, 115, '2023-03-20 14:08:46.470', NULL, NULL, 136, NULL);
INSERT INTO `wms_inventory_history` VALUES (500, 430, 1, 142, NULL, 1.00, NULL, 0, 115, '2023-03-20 16:49:02.094', NULL, NULL, 135, 149);
INSERT INTO `wms_inventory_history` VALUES (501, 440, 1, 144, 98, 1.00, NULL, 0, 115, '2023-03-21 17:24:15.420', NULL, NULL, 137, 148);
INSERT INTO `wms_inventory_history` VALUES (502, 440, 1, 143, 96, 1.00, NULL, 0, 115, '2023-03-21 17:24:15.420', NULL, NULL, 136, 145);
INSERT INTO `wms_inventory_history` VALUES (503, 439, 1, 144, NULL, 1.00, NULL, 0, 115, '2023-03-21 17:25:21.773', NULL, NULL, 139, NULL);
INSERT INTO `wms_inventory_history` VALUES (504, 439, 1, 143, 96, 1.00, NULL, 0, 115, '2023-03-21 17:25:21.773', NULL, NULL, 136, 145);
INSERT INTO `wms_inventory_history` VALUES (505, 195, 11, 143, 96, 1.00, NULL, 0, 115, '2023-03-21 19:27:13.303', NULL, NULL, 136, 145);
INSERT INTO `wms_inventory_history` VALUES (506, 441, 1, 145, 99, 1.00, NULL, 0, 115, '2023-03-21 19:33:36.152', NULL, NULL, 149, 151);
INSERT INTO `wms_inventory_history` VALUES (507, 442, 1, 145, 99, 2.00, NULL, 0, 115, '2023-03-21 19:35:15.556', NULL, NULL, 149, 151);
INSERT INTO `wms_inventory_history` VALUES (508, 199, 11, 145, 99, 3.00, NULL, 0, 115, '2023-03-21 19:36:49.594', NULL, NULL, 149, 151);
INSERT INTO `wms_inventory_history` VALUES (509, 443, 1, 146, NULL, 1.00, NULL, 0, 115, '2023-03-22 00:18:02.100', NULL, NULL, 150, NULL);
INSERT INTO `wms_inventory_history` VALUES (510, 437, 1, 144, NULL, 1.00, NULL, 0, 115, '2023-03-22 09:44:10.136', NULL, NULL, NULL, NULL);
INSERT INTO `wms_inventory_history` VALUES (511, 444, 1, 146, NULL, 1.00, NULL, 0, 115, '2023-03-22 12:58:50.515', NULL, NULL, NULL, NULL);
INSERT INTO `wms_inventory_history` VALUES (512, 444, 1, 145, 99, 1.00, NULL, 0, 115, '2023-03-22 12:58:50.515', NULL, NULL, 149, 151);
INSERT INTO `wms_inventory_history` VALUES (513, 445, 1, 146, NULL, 1.00, NULL, 0, 115, '2023-03-22 15:29:18.433', NULL, NULL, 143, NULL);
INSERT INTO `wms_inventory_history` VALUES (514, 445, 1, 145, 99, 1.00, NULL, 0, 115, '2023-03-22 15:29:18.433', NULL, NULL, 149, 151);
INSERT INTO `wms_inventory_history` VALUES (515, 445, 1, 144, NULL, 1.00, NULL, 0, 115, '2023-03-22 15:29:18.433', NULL, NULL, NULL, NULL);
INSERT INTO `wms_inventory_history` VALUES (516, 445, 1, 143, 96, 1.00, NULL, 0, 115, '2023-03-22 15:29:18.433', NULL, NULL, 136, 145);
INSERT INTO `wms_inventory_history` VALUES (517, 445, 1, 142, NULL, 1.00, NULL, 0, 115, '2023-03-22 15:29:18.433', NULL, NULL, 136, 145);
INSERT INTO `wms_inventory_history` VALUES (518, 445, 1, 141, 98, 1.00, NULL, 0, 115, '2023-03-22 15:29:18.433', NULL, NULL, 137, 148);
INSERT INTO `wms_inventory_history` VALUES (519, 445, 1, 140, 96, 1.00, NULL, 0, 115, '2023-03-22 15:29:18.433', NULL, NULL, 135, 147);
INSERT INTO `wms_inventory_history` VALUES (520, 445, 1, 139, NULL, 1.00, NULL, 0, 115, '2023-03-22 15:29:18.433', NULL, NULL, 136, NULL);
INSERT INTO `wms_inventory_history` VALUES (521, 445, 1, 138, NULL, 1.00, NULL, 0, 115, '2023-03-22 15:29:18.433', NULL, NULL, 135, NULL);
INSERT INTO `wms_inventory_history` VALUES (522, 445, 1, 137, NULL, 1.00, NULL, 0, 115, '2023-03-22 15:29:18.433', NULL, NULL, 135, NULL);
INSERT INTO `wms_inventory_history` VALUES (523, 446, 1, 146, NULL, 1.00, NULL, 0, 115, '2023-03-22 15:31:47.064', NULL, NULL, 136, NULL);
INSERT INTO `wms_inventory_history` VALUES (524, 446, 1, 145, NULL, 1.00, NULL, 0, 115, '2023-03-22 15:31:47.064', NULL, NULL, 136, NULL);
INSERT INTO `wms_inventory_history` VALUES (525, 448, 1, 147, 100, 1.00, NULL, 0, 115, '2023-03-22 15:56:16.808', NULL, NULL, 154, 152);
INSERT INTO `wms_inventory_history` VALUES (526, 448, 1, 147, 100, 99.00, NULL, 0, 115, '2023-03-22 15:59:03.799', NULL, NULL, 154, 152);
INSERT INTO `wms_inventory_history` VALUES (527, 450, 1, 147, 100, 50.00, NULL, 0, 115, '2023-03-22 16:10:18.453', NULL, NULL, 154, 152);
INSERT INTO `wms_inventory_history` VALUES (528, 200, 11, 147, 100, 30.00, NULL, 0, 115, '2023-03-22 16:11:49.972', NULL, NULL, 154, 152);
INSERT INTO `wms_inventory_history` VALUES (529, 68, 21, 147, 100, 1.00, NULL, 0, 115, '2023-03-22 16:15:01.704', NULL, NULL, 154, 152);
INSERT INTO `wms_inventory_history` VALUES (530, 68, 22, 147, 101, 1.00, NULL, 0, 115, '2023-03-22 16:15:01.704', NULL, NULL, 154, 152);
INSERT INTO `wms_inventory_history` VALUES (531, 451, 1, 148, 102, 1.00, NULL, 0, 115, '2023-03-22 22:51:19.716', NULL, NULL, 155, 153);
INSERT INTO `wms_inventory_history` VALUES (532, 201, 11, 148, 102, 1.00, NULL, 0, 115, '2023-03-22 22:53:08.546', NULL, NULL, 155, 153);
INSERT INTO `wms_inventory_history` VALUES (533, 452, 1, 148, NULL, 1.00, NULL, 0, 115, '2023-03-23 09:46:58.320', NULL, NULL, NULL, NULL);
INSERT INTO `wms_inventory_history` VALUES (534, 452, 1, 147, 100, 1.00, NULL, 0, 115, '2023-03-23 09:47:06.066', NULL, NULL, 154, 152);
INSERT INTO `wms_inventory_history` VALUES (535, 452, 1, 148, NULL, 1.00, NULL, 0, 115, '2023-03-23 10:37:47.935', NULL, NULL, NULL, NULL);
INSERT INTO `wms_inventory_history` VALUES (536, 406, 3, 140, NULL, 1.00, NULL, 0, 115, '2023-03-23 10:40:39.845', NULL, NULL, 136, 145);
INSERT INTO `wms_inventory_history` VALUES (537, 454, 1, 148, NULL, 1.00, NULL, 0, 115, '2023-03-23 11:05:57.966', NULL, NULL, NULL, NULL);
INSERT INTO `wms_inventory_history` VALUES (538, 454, 1, 147, 100, 1.00, NULL, 0, 115, '2023-03-23 11:05:57.966', NULL, NULL, 154, 152);
INSERT INTO `wms_inventory_history` VALUES (539, 454, 1, 146, NULL, 1.00, NULL, 0, 115, '2023-03-23 11:05:57.966', NULL, NULL, NULL, NULL);
INSERT INTO `wms_inventory_history` VALUES (540, 454, 1, 145, 99, 1.00, NULL, 0, 115, '2023-03-23 11:05:57.966', NULL, NULL, 149, 151);
INSERT INTO `wms_inventory_history` VALUES (541, 454, 1, 144, NULL, 1.00, NULL, 0, 115, '2023-03-23 11:05:57.966', NULL, NULL, NULL, NULL);
INSERT INTO `wms_inventory_history` VALUES (542, 455, 1, 148, 98, 1.00, NULL, 0, 115, '2023-03-23 11:07:53.373', NULL, NULL, 137, 148);
INSERT INTO `wms_inventory_history` VALUES (543, 455, 1, 147, 100, 1.00, NULL, 0, 115, '2023-03-23 11:07:53.373', NULL, NULL, 154, 152);
INSERT INTO `wms_inventory_history` VALUES (544, 455, 1, 146, NULL, 1.00, NULL, 0, 115, '2023-03-23 11:07:53.373', NULL, NULL, NULL, NULL);
INSERT INTO `wms_inventory_history` VALUES (545, 455, 1, 145, 99, 1.00, NULL, 0, 115, '2023-03-23 11:07:53.373', NULL, NULL, 149, 151);
INSERT INTO `wms_inventory_history` VALUES (546, 457, 1, 147, 101, 1.00, NULL, 0, 115, '2023-03-23 13:39:37.474', NULL, NULL, 154, 152);
INSERT INTO `wms_inventory_history` VALUES (547, 470, 1, 152, NULL, 1.00, NULL, 0, 115, '2023-03-24 14:24:55.532', NULL, NULL, 137, NULL);
INSERT INTO `wms_inventory_history` VALUES (548, 472, 1, 150, NULL, 10.00, NULL, 0, 115, '2023-03-24 15:50:14.262', NULL, NULL, 138, 150);
INSERT INTO `wms_inventory_history` VALUES (549, 474, 1, 156, NULL, 1.00, NULL, 0, 115, '2023-03-25 15:27:42.033', NULL, NULL, 165, 157);
INSERT INTO `wms_inventory_history` VALUES (550, 474, 1, 146, NULL, 1.00, NULL, 0, 115, '2023-03-25 15:27:42.033', NULL, NULL, 164, NULL);
INSERT INTO `wms_inventory_history` VALUES (551, 476, 1, 157, NULL, 1.00, NULL, 0, 115, '2023-03-26 19:52:24.461', NULL, NULL, 166, NULL);
INSERT INTO `wms_inventory_history` VALUES (552, 477, 1, 158, NULL, 100.00, NULL, 0, 115, '2023-03-27 11:17:46.276', NULL, NULL, NULL, NULL);
INSERT INTO `wms_inventory_history` VALUES (553, 477, 1, 158, NULL, 200.00, NULL, 0, 115, '2023-03-27 11:18:43.712', NULL, NULL, 143, NULL);
INSERT INTO `wms_inventory_history` VALUES (554, 478, 1, 159, NULL, 20.00, NULL, 0, 115, '2023-03-27 11:20:41.522', NULL, NULL, 143, NULL);
INSERT INTO `wms_inventory_history` VALUES (555, 478, 1, 159, NULL, 10.00, NULL, 0, 115, '2023-03-27 11:21:09.147', NULL, NULL, 143, NULL);
INSERT INTO `wms_inventory_history` VALUES (556, 478, 1, 159, NULL, 70.00, NULL, 0, 115, '2023-03-27 11:22:04.525', NULL, NULL, 143, NULL);
INSERT INTO `wms_inventory_history` VALUES (557, 484, 1, 161, NULL, 1.00, NULL, 0, 115, '2023-03-29 13:59:56.934', NULL, NULL, 138, 150);
INSERT INTO `wms_inventory_history` VALUES (558, 484, 1, 160, NULL, 1.00, NULL, 0, 115, '2023-03-29 13:59:56.934', NULL, NULL, 140, NULL);
INSERT INTO `wms_inventory_history` VALUES (559, 475, 1, 156, 98, 1.00, NULL, 0, 115, '2023-03-29 14:36:11.979', NULL, NULL, 137, 148);
INSERT INTO `wms_inventory_history` VALUES (560, 486, 1, 161, NULL, 1.00, NULL, 0, 115, '2023-03-29 14:40:03.024', NULL, NULL, 140, NULL);
INSERT INTO `wms_inventory_history` VALUES (561, 485, 1, 161, NULL, 10.00, NULL, 0, 115, '2023-03-29 15:04:11.374', NULL, NULL, 140, NULL);
INSERT INTO `wms_inventory_history` VALUES (562, 485, 1, 161, NULL, 5.00, NULL, 0, 115, '2023-03-29 15:04:23.592', NULL, NULL, 140, NULL);
INSERT INTO `wms_inventory_history` VALUES (563, 487, 1, 160, NULL, 5.00, NULL, 0, 115, '2023-03-29 15:13:42.505', NULL, NULL, 138, 150);
INSERT INTO `wms_inventory_history` VALUES (564, 487, 1, 158, NULL, 5.00, NULL, 0, 115, '2023-03-29 15:13:42.505', NULL, NULL, NULL, NULL);
INSERT INTO `wms_inventory_history` VALUES (565, 487, 1, 160, NULL, 1.00, NULL, 0, 115, '2023-03-29 15:16:21.470', NULL, NULL, 138, 150);
INSERT INTO `wms_inventory_history` VALUES (566, 487, 1, 158, NULL, 1.00, NULL, 0, 115, '2023-03-29 15:16:21.470', NULL, NULL, NULL, NULL);
INSERT INTO `wms_inventory_history` VALUES (567, 487, 1, 160, NULL, 3.00, NULL, 0, 115, '2023-03-29 15:21:50.780', NULL, NULL, 138, 150);
INSERT INTO `wms_inventory_history` VALUES (568, 491, 1, 162, NULL, 1.00, NULL, 0, 115, '2023-03-30 18:29:22.337', NULL, NULL, 138, 160);
INSERT INTO `wms_inventory_history` VALUES (569, 492, 1, 162, NULL, 99.00, NULL, 0, 115, '2023-03-30 18:32:33.512', NULL, NULL, 138, 160);
INSERT INTO `wms_inventory_history` VALUES (570, 489, 1, 158, NULL, 1.00, NULL, 0, 115, '2023-03-31 14:31:38.865', NULL, NULL, 138, 150);
INSERT INTO `wms_inventory_history` VALUES (571, 469, 2, 148, 98, 1.00, NULL, 0, 115, '2023-04-01 23:51:54.859', NULL, NULL, 137, 148);
INSERT INTO `wms_inventory_history` VALUES (572, 469, 2, 152, NULL, 1.00, NULL, 0, 115, '2023-04-01 23:51:54.859', NULL, NULL, 138, 150);
INSERT INTO `wms_inventory_history` VALUES (573, 215, 13, 162, NULL, 1.00, NULL, 0, 115, '2023-04-03 09:18:34.911', NULL, NULL, 138, 160);
INSERT INTO `wms_inventory_history` VALUES (574, 497, 2, 157, NULL, 1.00, NULL, 0, 115, '2023-04-03 09:21:08.860', NULL, NULL, 138, 150);
INSERT INTO `wms_inventory_history` VALUES (575, 498, 1, 162, NULL, 1.00, NULL, 0, 115, '2023-04-03 09:31:56.801', NULL, NULL, 138, 160);
INSERT INTO `wms_inventory_history` VALUES (576, 216, 11, 162, NULL, 1.00, NULL, 0, 115, '2023-04-03 09:32:39.280', NULL, NULL, 138, 160);
INSERT INTO `wms_inventory_history` VALUES (577, 499, 1, 162, NULL, 1.00, NULL, 0, 115, '2023-04-03 13:16:25.330', NULL, NULL, 138, 160);
INSERT INTO `wms_inventory_history` VALUES (578, 495, 1, 162, 110, 1.00, NULL, 0, 115, '2023-04-03 13:17:38.333', NULL, NULL, 138, 160);
INSERT INTO `wms_inventory_history` VALUES (579, 217, 11, 162, NULL, 1.00, NULL, 0, 115, '2023-04-03 13:19:29.513', NULL, NULL, 138, 160);
INSERT INTO `wms_inventory_history` VALUES (580, 500, 1, 162, NULL, 1.00, NULL, 0, 115, '2023-04-03 13:40:59.682', NULL, NULL, 138, 150);
INSERT INTO `wms_inventory_history` VALUES (581, 500, 1, 158, 107, 1.00, NULL, 0, 115, '2023-04-03 13:40:59.682', NULL, NULL, 139, 155);
INSERT INTO `wms_inventory_history` VALUES (582, 500, 1, 157, NULL, 1.00, NULL, 0, 115, '2023-04-03 13:40:59.682', NULL, NULL, 140, 145);
INSERT INTO `wms_inventory_history` VALUES (583, 500, 1, 162, NULL, 50.00, NULL, 0, 115, '2023-04-03 13:48:21.554', NULL, NULL, 138, 160);
INSERT INTO `wms_inventory_history` VALUES (584, 501, 1, 157, NULL, 1.00, NULL, 0, 115, '2023-04-03 14:00:07.325', NULL, NULL, NULL, NULL);
INSERT INTO `wms_inventory_history` VALUES (585, 501, 1, 157, NULL, 499.00, NULL, 0, 115, '2023-04-03 14:00:48.534', NULL, NULL, NULL, NULL);
INSERT INTO `wms_inventory_history` VALUES (586, 501, 1, 157, NULL, 500.00, NULL, 0, 115, '2023-04-03 14:01:22.052', NULL, NULL, NULL, NULL);
INSERT INTO `wms_inventory_history` VALUES (587, 502, 1, 157, NULL, 300.00, NULL, 0, 115, '2023-04-03 14:10:43.960', NULL, NULL, NULL, NULL);
INSERT INTO `wms_inventory_history` VALUES (588, 502, 1, 157, 104, 300.00, NULL, 0, 115, '2023-04-03 14:16:27.969', NULL, NULL, 139, 155);
INSERT INTO `wms_inventory_history` VALUES (589, 218, 11, 157, NULL, 1.00, NULL, 0, 115, '2023-04-03 14:17:44.003', NULL, NULL, 139, NULL);
INSERT INTO `wms_inventory_history` VALUES (590, 504, 1, 157, NULL, 1999.00, NULL, 0, 115, '2023-04-03 14:23:52.101', NULL, NULL, 144, NULL);
INSERT INTO `wms_inventory_history` VALUES (591, 505, 1, 157, NULL, 1001.00, NULL, 0, 115, '2023-04-03 14:24:29.598', NULL, NULL, 144, NULL);
INSERT INTO `wms_inventory_history` VALUES (592, 506, 1, 157, NULL, 700.00, NULL, 0, 115, '2023-04-03 14:25:19.494', NULL, NULL, 144, NULL);
INSERT INTO `wms_inventory_history` VALUES (593, 509, 1, 163, 110, 100.00, NULL, 0, 115, '2023-04-03 16:25:21.853', NULL, NULL, 138, 160);
INSERT INTO `wms_inventory_history` VALUES (594, 219, 11, 163, 110, 20.00, NULL, 0, 115, '2023-04-03 16:27:17.503', NULL, NULL, 138, 160);
INSERT INTO `wms_inventory_history` VALUES (595, 510, 1, 162, 104, 1.00, NULL, 0, 115, '2023-04-04 13:40:37.674', NULL, NULL, 139, 155);
INSERT INTO `wms_inventory_history` VALUES (596, 511, 1, 162, 107, 1.00, NULL, 0, 115, '2023-04-04 15:53:10.976', NULL, NULL, 139, 155);
INSERT INTO `wms_inventory_history` VALUES (597, 512, 1, 162, NULL, 5.00, NULL, 0, 115, '2023-04-04 15:55:45.057', NULL, NULL, 147, NULL);
INSERT INTO `wms_inventory_history` VALUES (598, 224, 11, 162, 107, 1.00, NULL, 0, 115, '2023-04-06 10:38:58.205', NULL, NULL, 139, 155);
INSERT INTO `wms_inventory_history` VALUES (599, 514, 1, 168, NULL, 22.00, NULL, 0, 115, '2023-04-06 14:13:57.957', NULL, NULL, 181, NULL);
INSERT INTO `wms_inventory_history` VALUES (600, 225, 11, 168, NULL, 1.00, NULL, 0, 115, '2023-04-06 14:14:19.341', NULL, NULL, 181, NULL);
INSERT INTO `wms_inventory_history` VALUES (601, 515, 1, 169, 113, 1.00, NULL, 0, 115, '2023-04-06 15:12:31.955', NULL, NULL, 184, 169);
INSERT INTO `wms_inventory_history` VALUES (602, 226, 11, 169, 113, 1.00, NULL, 0, 115, '2023-04-06 15:16:12.791', NULL, NULL, 184, 169);
INSERT INTO `wms_inventory_history` VALUES (603, 516, 1, 169, 113, 10.00, NULL, 0, 115, '2023-04-06 15:20:01.996', NULL, NULL, 184, 169);
INSERT INTO `wms_inventory_history` VALUES (604, 503, 1, 162, 110, 1.00, NULL, 0, 115, '2023-04-06 17:42:32.402', NULL, NULL, 138, 160);
INSERT INTO `wms_inventory_history` VALUES (605, 517, 1, 169, 107, 1.00, NULL, 0, 115, '2023-04-06 17:56:51.667', NULL, NULL, 139, 155);
INSERT INTO `wms_inventory_history` VALUES (606, 517, 1, 162, 107, 1.00, NULL, 0, 115, '2023-04-06 17:56:51.667', NULL, NULL, 139, 155);
INSERT INTO `wms_inventory_history` VALUES (607, 519, 1, 169, 113, 1.00, NULL, 0, 115, '2023-04-06 17:59:48.037', NULL, NULL, 184, 169);
INSERT INTO `wms_inventory_history` VALUES (608, 519, 1, 165, 109, 1.00, NULL, 0, 115, '2023-04-06 18:02:05.710', NULL, NULL, 139, 155);
INSERT INTO `wms_inventory_history` VALUES (609, 518, 1, 169, 113, 1.00, NULL, 0, 115, '2023-04-06 18:02:20.473', NULL, NULL, 184, 169);
INSERT INTO `wms_inventory_history` VALUES (610, 522, 1, 162, 107, 1.00, NULL, 0, 115, '2023-04-06 22:34:08.206', NULL, NULL, 139, 155);
INSERT INTO `wms_inventory_history` VALUES (611, 523, 1, 170, 114, 1.00, NULL, 0, 115, '2023-04-06 22:45:01.069', NULL, NULL, 185, 170);
INSERT INTO `wms_inventory_history` VALUES (612, 227, 11, 170, 114, 1.00, NULL, 0, 115, '2023-04-06 22:46:28.685', NULL, NULL, 185, 170);
INSERT INTO `wms_inventory_history` VALUES (613, 524, 1, 170, 107, 1.00, NULL, 0, 115, '2023-04-07 11:07:27.876', NULL, NULL, 139, 155);
INSERT INTO `wms_inventory_history` VALUES (614, 228, 11, 162, NULL, 1.00, NULL, 0, 115, '2023-04-07 11:10:06.398', NULL, NULL, 147, NULL);
INSERT INTO `wms_inventory_history` VALUES (615, 525, 1, 170, 107, 100.00, NULL, 0, 115, '2023-04-07 11:11:55.441', NULL, NULL, 139, 155);
INSERT INTO `wms_inventory_history` VALUES (616, 526, 1, 170, 113, 1.00, NULL, 0, 115, '2023-04-08 21:37:28.894', NULL, NULL, 184, 169);
INSERT INTO `wms_inventory_history` VALUES (617, 528, 3, 171, NULL, 2.00, NULL, 0, 115, '2023-04-10 10:49:53.337', NULL, NULL, 155, 172);
INSERT INTO `wms_inventory_history` VALUES (618, 530, 2, 171, 102, 1.00, NULL, 0, 115, '2023-04-10 16:07:17.829', NULL, NULL, 155, 171);
INSERT INTO `wms_inventory_history` VALUES (619, 531, 1, 172, NULL, 1.00, NULL, 0, 115, '2023-04-10 16:50:33.603', NULL, NULL, 154, NULL);
INSERT INTO `wms_inventory_history` VALUES (620, 236, 11, 172, NULL, 1.00, NULL, 0, 115, '2023-04-10 16:51:24.543', NULL, NULL, 154, NULL);
INSERT INTO `wms_inventory_history` VALUES (621, 532, 1, 172, NULL, 1.00, NULL, 0, 115, '2023-04-10 19:53:21.490', NULL, NULL, 154, NULL);
INSERT INTO `wms_inventory_history` VALUES (622, 532, 1, 171, NULL, 1.00, NULL, 0, 115, '2023-04-10 19:53:21.490', NULL, NULL, 154, NULL);
INSERT INTO `wms_inventory_history` VALUES (623, 533, 1, 172, NULL, 1.00, NULL, 0, 115, '2023-04-11 12:03:34.269', NULL, NULL, 190, NULL);
INSERT INTO `wms_inventory_history` VALUES (624, 534, 1, 172, NULL, 1.00, NULL, 0, 115, '2023-04-11 12:04:55.547', NULL, NULL, 189, NULL);
INSERT INTO `wms_inventory_history` VALUES (625, 536, 1, 173, NULL, 3.00, NULL, 0, 115, '2023-04-11 15:25:07.179', NULL, NULL, 157, NULL);
INSERT INTO `wms_inventory_history` VALUES (626, 535, 1, 173, 115, 1.00, NULL, 0, 115, '2023-04-11 15:58:50.257', NULL, NULL, 178, 176);
INSERT INTO `wms_inventory_history` VALUES (627, 535, 1, 172, NULL, 1.00, NULL, 0, 115, '2023-04-11 15:59:25.784', NULL, NULL, 157, NULL);
INSERT INTO `wms_inventory_history` VALUES (628, 237, 11, 173, 115, 1.00, NULL, 0, 115, '2023-04-11 16:01:14.375', NULL, NULL, 178, 176);
INSERT INTO `wms_inventory_history` VALUES (629, 537, 1, 172, NULL, 3.00, NULL, 0, 115, '2023-04-11 16:55:36.736', NULL, NULL, 157, NULL);
INSERT INTO `wms_inventory_history` VALUES (630, 235, 11, 172, NULL, 1.00, NULL, 0, 115, '2023-04-11 17:33:10.510', NULL, NULL, 157, NULL);
INSERT INTO `wms_inventory_history` VALUES (631, 539, 1, 171, 102, 1.00, NULL, 0, 115, '2023-04-12 09:14:43.045', NULL, NULL, 155, 171);
INSERT INTO `wms_inventory_history` VALUES (632, 539, 1, 172, NULL, 7.00, NULL, 0, 115, '2023-04-12 14:12:40.738', NULL, NULL, 154, NULL);
INSERT INTO `wms_inventory_history` VALUES (633, 541, 1, 174, NULL, 6.00, NULL, 0, 115, '2023-04-12 16:54:37.722', NULL, NULL, 157, NULL);
INSERT INTO `wms_inventory_history` VALUES (634, 541, 1, 173, NULL, 5.00, NULL, 0, 115, '2023-04-12 16:54:50.997', NULL, NULL, 158, NULL);
INSERT INTO `wms_inventory_history` VALUES (635, 544, 1, 178, 116, 1.00, NULL, 0, 115, '2023-04-13 12:23:32.705', NULL, NULL, 192, 178);
INSERT INTO `wms_inventory_history` VALUES (636, 546, 1, 180, 122, 1.00, NULL, 0, 115, '2023-04-13 13:52:02.629', NULL, NULL, 198, 185);
INSERT INTO `wms_inventory_history` VALUES (637, 545, 1, 178, 120, 1.00, NULL, 0, 115, '2023-04-13 13:54:23.406', NULL, NULL, 196, 183);
INSERT INTO `wms_inventory_history` VALUES (638, 85, 21, 180, 122, 1.00, NULL, 0, 115, '2023-04-13 13:55:12.832', NULL, NULL, 198, 185);
INSERT INTO `wms_inventory_history` VALUES (639, 85, 22, 180, NULL, 1.00, NULL, 0, 115, '2023-04-13 13:55:12.832', NULL, NULL, 199, 186);
INSERT INTO `wms_inventory_history` VALUES (640, 549, 1, 180, 119, 1.00, NULL, 0, 115, '2023-04-14 11:18:22.788', NULL, NULL, 195, 182);
INSERT INTO `wms_inventory_history` VALUES (641, 551, 1, 180, 119, 1.00, NULL, 0, 115, '2023-04-14 15:52:38.685', NULL, NULL, 195, 182);
INSERT INTO `wms_inventory_history` VALUES (642, 555, 1, 180, 118, 1.00, NULL, 0, 115, '2023-04-15 09:09:42.324', NULL, NULL, 194, 181);
INSERT INTO `wms_inventory_history` VALUES (643, 555, 1, 176, 118, 1.00, NULL, 0, 115, '2023-04-15 09:09:42.324', NULL, NULL, 194, 181);
INSERT INTO `wms_inventory_history` VALUES (644, 560, 1, 178, 117, 5.00, NULL, 0, 115, '2023-04-15 16:23:32.414', NULL, NULL, 193, 180);
INSERT INTO `wms_inventory_history` VALUES (645, 561, 1, 180, NULL, 1.00, NULL, 0, 115, '2023-04-15 16:27:27.841', NULL, NULL, 193, NULL);
INSERT INTO `wms_inventory_history` VALUES (646, 560, 1, 178, 118, 5.00, NULL, 0, 115, '2023-04-15 16:48:15.391', NULL, NULL, 194, 181);
INSERT INTO `wms_inventory_history` VALUES (647, 562, 1, 180, 122, 203.00, NULL, 0, 115, '2023-04-15 20:45:45.152', NULL, NULL, 198, 185);
INSERT INTO `wms_inventory_history` VALUES (648, 246, 11, 180, 122, 10.00, NULL, 0, 115, '2023-04-15 20:49:04.304', NULL, NULL, 198, 185);
INSERT INTO `wms_inventory_history` VALUES (649, 565, 1, 180, 116, 10.00, NULL, 0, 115, '2023-04-17 13:33:54.121', NULL, NULL, 193, 178);
INSERT INTO `wms_inventory_history` VALUES (650, 91, 21, 180, NULL, 3.00, NULL, 0, 115, '2023-04-17 13:50:04.367', NULL, NULL, 198, 185);
INSERT INTO `wms_inventory_history` VALUES (651, 91, 22, 180, 123, 3.00, NULL, 0, 115, '2023-04-17 13:50:04.367', NULL, NULL, 199, 186);
INSERT INTO `wms_inventory_history` VALUES (652, 566, 1, 182, 116, 50.00, NULL, 0, 115, '2023-04-17 15:43:40.388', NULL, NULL, 193, 178);
INSERT INTO `wms_inventory_history` VALUES (653, 566, 1, 181, 124, 50.00, NULL, 0, 115, '2023-04-17 15:43:40.388', NULL, NULL, 193, 178);
INSERT INTO `wms_inventory_history` VALUES (654, 568, 1, 182, 118, 1.00, NULL, 0, 115, '2023-04-18 13:28:06.078', NULL, NULL, 194, 181);
INSERT INTO `wms_inventory_history` VALUES (655, 247, 11, 182, 118, 1.00, NULL, 0, 115, '2023-04-18 13:30:05.413', NULL, NULL, 194, 181);
INSERT INTO `wms_inventory_history` VALUES (656, 571, 1, 182, 124, 1.00, NULL, 0, 115, '2023-04-19 09:24:19.752', NULL, NULL, 193, 178);
INSERT INTO `wms_inventory_history` VALUES (657, 571, 1, 181, 124, 1.00, NULL, 0, 115, '2023-04-19 09:24:19.752', NULL, NULL, 193, 178);
INSERT INTO `wms_inventory_history` VALUES (658, 572, 1, 182, NULL, 1.00, NULL, 0, 115, '2023-04-19 21:07:55.564', NULL, NULL, 194, 181);
INSERT INTO `wms_inventory_history` VALUES (659, 572, 1, 181, 116, 1.00, NULL, 0, 115, '2023-04-19 21:07:55.564', NULL, NULL, 193, 178);
INSERT INTO `wms_inventory_history` VALUES (660, 572, 1, 180, 122, 1.00, NULL, 0, 115, '2023-04-19 21:07:55.564', NULL, NULL, 198, 185);
INSERT INTO `wms_inventory_history` VALUES (661, 569, 1, 182, 124, 1.00, NULL, 0, 115, '2023-04-19 23:03:23.570', NULL, NULL, 193, 178);
INSERT INTO `wms_inventory_history` VALUES (662, 569, 1, 181, 116, 1.00, NULL, 0, 115, '2023-04-19 23:03:23.570', NULL, NULL, 193, 178);
INSERT INTO `wms_inventory_history` VALUES (663, 569, 1, 180, 122, 1.00, NULL, 0, 115, '2023-04-19 23:03:23.570', NULL, NULL, 198, 185);
INSERT INTO `wms_inventory_history` VALUES (664, 567, 1, 182, 118, 1.00, NULL, 0, 115, '2023-04-19 23:04:23.153', NULL, NULL, 194, 181);
INSERT INTO `wms_inventory_history` VALUES (665, 253, 11, 182, 118, 1.00, NULL, 0, 115, '2023-04-22 19:11:49.673', NULL, NULL, 194, 181);
INSERT INTO `wms_inventory_history` VALUES (666, 253, 11, 181, 116, 1.00, NULL, 0, 115, '2023-04-22 19:11:49.673', NULL, NULL, 193, 178);
INSERT INTO `wms_inventory_history` VALUES (667, 584, 1, 182, 118, 1.00, NULL, 0, 115, '2023-04-22 19:15:25.123', NULL, NULL, 194, 181);
INSERT INTO `wms_inventory_history` VALUES (668, 584, 1, 181, 118, 1.00, NULL, 0, 115, '2023-04-22 19:15:25.123', NULL, NULL, 194, 181);
INSERT INTO `wms_inventory_history` VALUES (669, 585, 1, 182, 118, 1.00, NULL, 0, 115, '2023-04-22 19:17:01.731', NULL, NULL, 194, 181);
INSERT INTO `wms_inventory_history` VALUES (670, 585, 1, 181, 118, 1.00, NULL, 0, 115, '2023-04-22 19:17:01.731', NULL, NULL, 194, 181);
INSERT INTO `wms_inventory_history` VALUES (671, 250, 11, 182, 118, 1.00, NULL, 0, 115, '2023-04-22 19:18:23.765', NULL, NULL, 194, 181);
INSERT INTO `wms_inventory_history` VALUES (672, 250, 11, 180, 118, 1.00, NULL, 0, 115, '2023-04-22 19:18:53.007', NULL, NULL, 194, 181);
INSERT INTO `wms_inventory_history` VALUES (673, 586, 3, 182, NULL, 1.00, NULL, 0, 115, '2023-04-23 14:01:12.823', NULL, NULL, 196, 183);
INSERT INTO `wms_inventory_history` VALUES (674, 591, 1, 184, 118, 1.00, NULL, 0, 115, '2023-04-24 10:35:48.429', NULL, NULL, 194, 181);
INSERT INTO `wms_inventory_history` VALUES (675, 591, 1, 182, 121, 1.00, NULL, 0, 115, '2023-04-24 10:35:48.429', NULL, NULL, 195, 182);
INSERT INTO `wms_inventory_history` VALUES (676, 591, 1, 181, 124, 1.00, NULL, 0, 115, '2023-04-24 10:35:48.429', NULL, NULL, 198, 185);
INSERT INTO `wms_inventory_history` VALUES (677, 592, 1, 185, 127, 1.00, NULL, 0, 115, '2023-04-24 15:36:26.659', NULL, NULL, 215, 189);
INSERT INTO `wms_inventory_history` VALUES (678, 259, 11, 185, 127, 1.00, NULL, 0, 115, '2023-04-24 15:37:10.975', NULL, NULL, 215, 189);
INSERT INTO `wms_inventory_history` VALUES (679, 595, 1, 185, 118, 1.00, NULL, 0, 115, '2023-04-25 14:56:10.784', NULL, NULL, 194, 181);
INSERT INTO `wms_inventory_history` VALUES (680, 595, 1, 183, NULL, 1.00, NULL, 0, 115, '2023-04-25 14:56:10.784', NULL, NULL, 196, 183);
INSERT INTO `wms_inventory_history` VALUES (681, 260, 11, 185, 118, 1.00, NULL, 0, 115, '2023-04-25 15:01:00.119', NULL, NULL, 194, 181);
INSERT INTO `wms_inventory_history` VALUES (682, 251, 11, 182, 118, 1.00, NULL, 0, 115, '2023-04-25 15:46:56.376', NULL, NULL, 194, 181);
INSERT INTO `wms_inventory_history` VALUES (683, 251, 11, 181, 116, 1.00, NULL, 0, 115, '2023-04-25 15:46:56.376', NULL, NULL, 193, 178);
INSERT INTO `wms_inventory_history` VALUES (684, 251, 11, 180, 122, 1.00, NULL, 0, 115, '2023-04-25 15:46:56.376', NULL, NULL, 198, 185);
INSERT INTO `wms_inventory_history` VALUES (685, 251, 11, 178, 116, 1.00, NULL, 0, 115, '2023-04-25 15:46:56.376', NULL, NULL, 192, 178);
INSERT INTO `wms_inventory_history` VALUES (686, 597, 1, 186, NULL, 14.00, NULL, 0, 115, '2023-04-25 15:54:34.255', NULL, NULL, 196, 183);
INSERT INTO `wms_inventory_history` VALUES (687, 261, 11, 186, NULL, 8.00, NULL, 0, 115, '2023-04-25 15:54:56.883', NULL, NULL, 196, 183);
INSERT INTO `wms_inventory_history` VALUES (688, 598, 1, 186, 118, 5.00, NULL, 0, 115, '2023-04-25 16:53:40.784', NULL, NULL, 194, 181);
INSERT INTO `wms_inventory_history` VALUES (689, 598, 1, 183, 119, 4.00, NULL, 0, 115, '2023-04-25 16:53:40.784', NULL, NULL, 195, 182);
INSERT INTO `wms_inventory_history` VALUES (690, 599, 1, 183, NULL, 1.00, NULL, 0, 115, '2023-04-25 18:31:31.129', NULL, NULL, NULL, NULL);
INSERT INTO `wms_inventory_history` VALUES (691, 599, 1, 182, 118, 1.00, NULL, 0, 115, '2023-04-25 18:32:26.377', NULL, NULL, 194, 181);
INSERT INTO `wms_inventory_history` VALUES (692, 601, 1, 187, 117, 1.00, NULL, 0, 115, '2023-04-26 17:17:59.193', NULL, NULL, 194, 181);
INSERT INTO `wms_inventory_history` VALUES (693, 258, 12, 186, NULL, 1.00, NULL, 0, 115, '2023-04-27 15:06:07.919', NULL, NULL, 196, 183);
INSERT INTO `wms_inventory_history` VALUES (694, 258, 12, 186, NULL, 1.00, NULL, 0, 115, '2023-04-27 15:06:23.200', NULL, NULL, 196, 183);
INSERT INTO `wms_inventory_history` VALUES (695, 258, 12, 182, 118, 1.00, NULL, 0, 115, '2023-04-27 15:18:00.351', NULL, NULL, 194, 181);
INSERT INTO `wms_inventory_history` VALUES (696, 43, 4, 187, 117, 1.00, '测试一下说明', 0, 115, '2023-04-28 16:44:42.064', 115, '2023-04-28 16:44:42.064', 194, 181);
INSERT INTO `wms_inventory_history` VALUES (697, 46, 15, 186, NULL, -1.00, NULL, 0, 115, '2023-04-28 23:45:44.062', 115, '2023-04-28 23:45:44.062', 194, 181);
INSERT INTO `wms_inventory_history` VALUES (698, 46, 4, 186, NULL, 2.00, NULL, 0, 115, '2023-04-28 23:45:44.062', 115, '2023-04-28 23:45:44.062', 196, 183);
INSERT INTO `wms_inventory_history` VALUES (699, 594, 1, 181, 118, 6.00, NULL, 0, 115, '2023-04-29 13:56:40.346', NULL, NULL, 194, 181);
INSERT INTO `wms_inventory_history` VALUES (700, 611, 1, 188, 117, 1.00, NULL, 0, 115, '2023-04-30 16:33:48.736', NULL, NULL, 194, 181);
INSERT INTO `wms_inventory_history` VALUES (701, 621, 1, 193, NULL, 1.00, NULL, 0, 115, '2023-05-04 10:35:32.609', NULL, NULL, 230, NULL);
INSERT INTO `wms_inventory_history` VALUES (702, 621, 1, 191, NULL, 1.00, NULL, 0, 115, '2023-05-04 10:35:32.609', NULL, NULL, 229, NULL);
INSERT INTO `wms_inventory_history` VALUES (703, 621, 1, 190, NULL, 1.00, NULL, 0, 115, '2023-05-04 10:35:32.609', NULL, NULL, 229, NULL);
INSERT INTO `wms_inventory_history` VALUES (704, 621, 1, 189, NULL, 1.00, NULL, 0, 115, '2023-05-04 10:35:32.609', NULL, NULL, 231, NULL);
INSERT INTO `wms_inventory_history` VALUES (705, 625, 1, 193, NULL, 1.00, NULL, 0, 115, '2023-05-04 16:41:41.989', NULL, NULL, 229, 216);

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
) ENGINE = InnoDB AUTO_INCREMENT = 99 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '库存移动' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wms_inventory_movement
-- ----------------------------
INSERT INTO `wms_inventory_movement` VALUES (4, 'M-2022-11-02-162844', NULL, NULL, 24, NULL, NULL, NULL, '测试', 0, 1, '2022-11-02 16:38:04.000', 115, '2022-11-12 16:59:24.508');
INSERT INTO `wms_inventory_movement` VALUES (5, 'M-2022-11-07-214759', NULL, NULL, 23, NULL, NULL, NULL, NULL, 0, 115, '2022-11-07 21:48:25.000', 1, '2022-12-01 11:23:06.364');
INSERT INTO `wms_inventory_movement` VALUES (6, 'M-2022-11-10-135556', NULL, NULL, 21, NULL, NULL, NULL, NULL, 1, 115, '2022-11-10 13:56:18.866', NULL, NULL);
INSERT INTO `wms_inventory_movement` VALUES (7, 'M-2022-11-11-161911', NULL, NULL, 21, NULL, NULL, NULL, '这是移库的备注，要求100字之内。', 1, 115, '2022-11-11 16:19:58.000', 115, '2022-11-11 16:25:36.948');
INSERT INTO `wms_inventory_movement` VALUES (8, 'M-2022-11-11-172656', NULL, NULL, 22, NULL, NULL, NULL, 'THIS IS YIKU!', 0, 115, '2022-11-11 17:30:31.000', 115, '2022-11-11 17:30:50.247');
INSERT INTO `wms_inventory_movement` VALUES (9, 'M-2022-11-11-205127', NULL, NULL, 21, NULL, NULL, NULL, NULL, 1, 115, '2022-11-11 20:52:22.417', NULL, NULL);
INSERT INTO `wms_inventory_movement` VALUES (10, 'M-2022-11-13-231102', NULL, NULL, 21, NULL, NULL, NULL, NULL, 1, 115, '2022-11-13 23:11:40.712', NULL, NULL);
INSERT INTO `wms_inventory_movement` VALUES (11, 'M-2022-11-16-145020', NULL, NULL, 21, NULL, NULL, NULL, NULL, 1, 115, '2022-11-16 14:50:23.275', NULL, NULL);
INSERT INTO `wms_inventory_movement` VALUES (12, 'M-2022-11-25-224827', NULL, NULL, 21, NULL, NULL, NULL, NULL, 1, 115, '2022-11-25 22:49:12.661', NULL, NULL);
INSERT INTO `wms_inventory_movement` VALUES (13, 'M-2022-11-26-230159', NULL, NULL, 21, NULL, NULL, NULL, NULL, 1, 115, '2022-11-26 23:02:20.597', NULL, NULL);
INSERT INTO `wms_inventory_movement` VALUES (14, 'M-2022-11-26-230222', NULL, NULL, 21, NULL, NULL, NULL, NULL, 1, 115, '2022-11-26 23:03:15.271', NULL, NULL);
INSERT INTO `wms_inventory_movement` VALUES (15, 'M-2022-12-07-105253', NULL, NULL, 22, NULL, NULL, NULL, NULL, 0, 115, '2022-12-07 10:53:16.000', 115, '2022-12-09 19:41:34.397');
INSERT INTO `wms_inventory_movement` VALUES (16, 'M-2022-12-07-152629', NULL, NULL, 21, NULL, NULL, NULL, NULL, 1, 115, '2022-12-07 15:26:58.790', NULL, NULL);
INSERT INTO `wms_inventory_movement` VALUES (17, 'M-2022-12-07-152724', NULL, NULL, 22, NULL, NULL, NULL, NULL, 0, 115, '2022-12-07 15:27:44.000', 115, '2022-12-28 13:42:51.800');
INSERT INTO `wms_inventory_movement` VALUES (18, 'M-2022-12-09-191503', NULL, NULL, 21, NULL, NULL, NULL, NULL, 1, 115, '2022-12-09 19:15:32.778', NULL, NULL);
INSERT INTO `wms_inventory_movement` VALUES (19, 'M-2022-12-16-160301', NULL, NULL, 21, NULL, NULL, NULL, NULL, 1, 115, '2022-12-16 16:03:28.013', NULL, NULL);
INSERT INTO `wms_inventory_movement` VALUES (20, 'M-2023-01-09-014651', NULL, NULL, 21, NULL, NULL, NULL, NULL, 1, 115, '2023-01-09 01:47:22.541', NULL, NULL);
INSERT INTO `wms_inventory_movement` VALUES (21, 'M-2023-01-11-160556', NULL, NULL, 21, NULL, NULL, NULL, NULL, 0, 115, '2023-01-11 16:06:49.048', NULL, NULL);
INSERT INTO `wms_inventory_movement` VALUES (22, 'M-2023-01-12-134240', NULL, NULL, 21, NULL, NULL, NULL, '测试', 1, 115, '2023-01-12 13:44:00.482', NULL, NULL);
INSERT INTO `wms_inventory_movement` VALUES (23, 'M-2023-01-14-095257', NULL, NULL, 21, NULL, NULL, NULL, '111111', 1, 115, '2023-01-14 09:53:38.000', 115, '2023-01-14 09:56:14.662');
INSERT INTO `wms_inventory_movement` VALUES (24, 'M-2023-01-20-234708', NULL, NULL, 21, NULL, NULL, NULL, NULL, 0, 115, '2023-01-20 23:47:45.584', NULL, NULL);
INSERT INTO `wms_inventory_movement` VALUES (25, 'M-2023-01-26-224430', NULL, NULL, 21, NULL, NULL, NULL, NULL, 0, 115, '2023-01-26 22:45:39.435', NULL, NULL);
INSERT INTO `wms_inventory_movement` VALUES (26, 'M-2023-01-31-115610', NULL, NULL, 23, NULL, NULL, NULL, NULL, 0, 115, '2023-01-31 11:56:31.000', 115, '2023-01-31 11:57:19.289');
INSERT INTO `wms_inventory_movement` VALUES (27, 'M-2023-02-02-151424', NULL, NULL, 21, NULL, NULL, NULL, '11', 0, 115, '2023-02-02 15:14:47.032', NULL, NULL);
INSERT INTO `wms_inventory_movement` VALUES (28, 'M-2023-02-03-163557', NULL, NULL, 21, NULL, NULL, NULL, NULL, 0, 115, '2023-02-03 16:36:50.000', 115, '2023-02-04 15:59:42.382');
INSERT INTO `wms_inventory_movement` VALUES (29, 'M-2023-02-04-155912', NULL, NULL, 23, NULL, NULL, NULL, NULL, 0, 115, '2023-02-04 15:59:26.000', 115, '2023-02-04 18:00:58.954');
INSERT INTO `wms_inventory_movement` VALUES (30, 'M-2023-02-04-175734', NULL, NULL, 21, NULL, NULL, NULL, NULL, 0, 115, '2023-02-04 17:59:22.074', NULL, NULL);
INSERT INTO `wms_inventory_movement` VALUES (31, 'M-2023-02-06-113659', NULL, NULL, 21, NULL, NULL, NULL, NULL, 0, 115, '2023-02-06 11:37:26.075', NULL, NULL);
INSERT INTO `wms_inventory_movement` VALUES (32, 'M-2023-02-06-163009', NULL, NULL, 21, NULL, NULL, NULL, NULL, 0, 115, '2023-02-06 16:30:14.643', NULL, NULL);
INSERT INTO `wms_inventory_movement` VALUES (33, 'M-2023-02-08-122535', NULL, NULL, 24, NULL, NULL, NULL, NULL, 0, 115, '2023-02-08 12:25:53.000', 115, '2023-02-08 12:26:33.810');
INSERT INTO `wms_inventory_movement` VALUES (34, 'M-2023-02-08-164113', NULL, NULL, 23, NULL, NULL, NULL, NULL, 0, 115, '2023-02-08 16:41:42.000', 115, '2023-02-08 16:43:52.760');
INSERT INTO `wms_inventory_movement` VALUES (35, 'M-2023-02-09-144340', NULL, NULL, 23, NULL, NULL, NULL, NULL, 0, 115, '2023-02-09 14:44:06.000', 115, '2023-02-09 14:49:06.409');
INSERT INTO `wms_inventory_movement` VALUES (36, 'M-2023-02-11-141000', NULL, NULL, 21, NULL, NULL, NULL, NULL, 0, 115, '2023-02-11 14:11:04.394', NULL, NULL);
INSERT INTO `wms_inventory_movement` VALUES (37, 'M-2023-02-11-200859', NULL, NULL, 21, NULL, NULL, NULL, '库区和货架有所调整，需将相关物品移库到新货架。', 0, 115, '2023-02-11 20:12:21.423', NULL, NULL);
INSERT INTO `wms_inventory_movement` VALUES (38, 'M-2023-02-11-201448', NULL, NULL, 21, NULL, NULL, NULL, '货架存货规则调整，物品移库到新货架上', 0, 115, '2023-02-11 20:15:50.508', NULL, NULL);
INSERT INTO `wms_inventory_movement` VALUES (39, 'M-2023-02-12-093617', NULL, NULL, 21, NULL, NULL, NULL, NULL, 0, 115, '2023-02-12 09:36:58.000', 115, '2023-02-12 09:37:24.795');
INSERT INTO `wms_inventory_movement` VALUES (40, 'M-2023-02-12-103520', NULL, NULL, 21, NULL, NULL, NULL, NULL, 0, 115, '2023-02-12 10:35:54.699', NULL, NULL);
INSERT INTO `wms_inventory_movement` VALUES (41, 'M-2023-02-13-090937', NULL, NULL, 21, NULL, NULL, NULL, NULL, 0, 115, '2023-02-13 09:09:39.000', 115, '2023-02-13 09:10:16.161');
INSERT INTO `wms_inventory_movement` VALUES (42, 'M-2023-02-13-091623', NULL, NULL, 21, NULL, NULL, NULL, NULL, 0, 115, '2023-02-13 09:16:56.328', NULL, NULL);
INSERT INTO `wms_inventory_movement` VALUES (43, 'M-2023-02-15-150619', NULL, NULL, 21, NULL, NULL, NULL, NULL, 0, 115, '2023-02-15 15:07:27.718', NULL, NULL);
INSERT INTO `wms_inventory_movement` VALUES (44, 'M-2023-02-15-164103', NULL, NULL, 21, NULL, NULL, NULL, NULL, 0, 115, '2023-02-15 16:37:47.370', NULL, NULL);
INSERT INTO `wms_inventory_movement` VALUES (45, 'M-2023-02-15-210429', NULL, NULL, 21, NULL, NULL, NULL, NULL, 0, 115, '2023-02-15 21:05:27.000', 115, '2023-02-15 21:05:49.345');
INSERT INTO `wms_inventory_movement` VALUES (46, 'M-2023-02-16-135615', NULL, NULL, 24, NULL, NULL, NULL, NULL, 0, 115, '2023-02-16 13:57:25.000', 115, '2023-02-16 13:58:09.224');
INSERT INTO `wms_inventory_movement` VALUES (47, 'M-2023-02-17-163727', NULL, NULL, 21, NULL, NULL, NULL, NULL, 0, 115, '2023-02-17 16:37:51.556', NULL, NULL);
INSERT INTO `wms_inventory_movement` VALUES (48, 'M-2023-02-21-142009', NULL, NULL, 23, NULL, NULL, NULL, NULL, 0, 115, '2023-02-21 14:20:31.000', 115, '2023-02-21 14:21:05.810');
INSERT INTO `wms_inventory_movement` VALUES (49, 'M-2023-02-21-153848', NULL, NULL, 21, NULL, NULL, NULL, NULL, 0, 115, '2023-02-21 15:39:19.412', NULL, NULL);
INSERT INTO `wms_inventory_movement` VALUES (50, 'M-2023-02-22-164043', NULL, NULL, 21, NULL, NULL, NULL, NULL, 0, 115, '2023-02-22 16:41:23.549', NULL, NULL);
INSERT INTO `wms_inventory_movement` VALUES (51, 'M-2023-02-23-120125', NULL, NULL, 21, NULL, NULL, NULL, NULL, 0, 115, '2023-02-23 12:02:15.950', NULL, NULL);
INSERT INTO `wms_inventory_movement` VALUES (52, 'M-2023-02-23-145952', NULL, NULL, 21, NULL, NULL, NULL, NULL, 0, 115, '2023-02-23 15:00:16.987', NULL, NULL);
INSERT INTO `wms_inventory_movement` VALUES (53, 'M-2023-02-23-150049', NULL, NULL, 21, NULL, NULL, NULL, NULL, 0, 115, '2023-02-23 15:01:47.119', NULL, NULL);
INSERT INTO `wms_inventory_movement` VALUES (54, 'M-2023-02-28-103343', NULL, NULL, 21, NULL, NULL, NULL, NULL, 0, 115, '2023-02-28 10:35:38.976', NULL, NULL);
INSERT INTO `wms_inventory_movement` VALUES (55, 'M-2023-02-28-110521', NULL, NULL, 23, NULL, NULL, NULL, NULL, 0, 115, '2023-02-28 11:06:27.000', 115, '2023-02-28 11:07:08.810');
INSERT INTO `wms_inventory_movement` VALUES (56, 'M-2023-03-02-093406', NULL, NULL, 23, NULL, NULL, NULL, '12', 0, 115, '2023-03-02 09:34:13.000', 115, '2023-03-02 09:36:22.823');
INSERT INTO `wms_inventory_movement` VALUES (57, 'M-2023-03-02-094422', NULL, NULL, 23, NULL, NULL, NULL, '12', 0, 115, '2023-03-02 09:45:05.000', 115, '2023-03-02 09:46:27.606');
INSERT INTO `wms_inventory_movement` VALUES (58, 'M-2023-03-03-083239', NULL, NULL, 21, NULL, NULL, NULL, NULL, 0, 115, '2023-03-03 08:32:51.992', NULL, NULL);
INSERT INTO `wms_inventory_movement` VALUES (59, 'M-2023-03-06-165212', NULL, NULL, 22, NULL, NULL, NULL, 'test', 0, 115, '2023-03-06 16:52:41.000', 115, '2023-03-06 16:55:41.138');
INSERT INTO `wms_inventory_movement` VALUES (60, 'M-2023-03-09-014236', NULL, NULL, 21, NULL, NULL, NULL, NULL, 0, 115, '2023-03-09 01:42:59.198', NULL, NULL);
INSERT INTO `wms_inventory_movement` VALUES (61, 'M-2023-03-09-171017', NULL, NULL, 21, NULL, NULL, NULL, NULL, 0, 115, '2023-03-09 17:10:49.236', NULL, NULL);
INSERT INTO `wms_inventory_movement` VALUES (62, 'M-2023-03-13-211038', NULL, NULL, 21, NULL, NULL, NULL, NULL, 0, 115, '2023-03-13 21:12:26.000', 115, '2023-03-13 21:14:33.607');
INSERT INTO `wms_inventory_movement` VALUES (63, 'M-2023-03-15-104621', NULL, NULL, 21, NULL, NULL, NULL, NULL, 0, 115, '2023-03-15 10:47:02.735', NULL, NULL);
INSERT INTO `wms_inventory_movement` VALUES (64, 'M-2023-03-16-165142', NULL, NULL, 21, NULL, NULL, NULL, NULL, 0, 115, '2023-03-16 16:52:10.384', NULL, NULL);
INSERT INTO `wms_inventory_movement` VALUES (65, 'M-2023-03-16-182424', NULL, NULL, 21, NULL, NULL, NULL, NULL, 0, 115, '2023-03-16 18:25:52.025', NULL, NULL);
INSERT INTO `wms_inventory_movement` VALUES (66, 'M-2023-03-16-182908', NULL, NULL, 23, NULL, NULL, NULL, NULL, 0, 115, '2023-03-16 18:29:56.000', 115, '2023-03-16 18:32:12.656');
INSERT INTO `wms_inventory_movement` VALUES (67, 'M-2023-03-20-135242', NULL, NULL, 21, NULL, NULL, NULL, NULL, 0, 115, '2023-03-20 13:52:59.049', NULL, NULL);
INSERT INTO `wms_inventory_movement` VALUES (68, 'M-2023-03-22-161342', NULL, NULL, 23, NULL, NULL, NULL, NULL, 0, 115, '2023-03-22 16:14:04.000', 115, '2023-03-22 16:15:01.759');
INSERT INTO `wms_inventory_movement` VALUES (69, 'M-2023-03-22-225330', NULL, NULL, 21, NULL, NULL, NULL, NULL, 0, 115, '2023-03-22 22:53:55.738', NULL, NULL);
INSERT INTO `wms_inventory_movement` VALUES (70, 'M-2023-03-23-094905', NULL, NULL, 21, NULL, NULL, NULL, NULL, 0, 115, '2023-03-23 09:49:37.620', NULL, NULL);
INSERT INTO `wms_inventory_movement` VALUES (71, 'M-2023-03-23-143802', NULL, NULL, 21, NULL, NULL, NULL, NULL, 0, 115, '2023-03-23 14:38:49.646', NULL, NULL);
INSERT INTO `wms_inventory_movement` VALUES (72, 'M-2023-03-29-114618', NULL, NULL, 21, NULL, NULL, NULL, '21', 0, 115, '2023-03-29 11:46:50.529', NULL, NULL);
INSERT INTO `wms_inventory_movement` VALUES (73, 'M-2023-03-30-113433', NULL, NULL, 21, NULL, NULL, NULL, NULL, 0, 115, '2023-03-30 11:34:48.701', NULL, NULL);
INSERT INTO `wms_inventory_movement` VALUES (74, 'M-2023-03-30-183501', NULL, NULL, 21, NULL, NULL, NULL, NULL, 0, 115, '2023-03-30 18:36:35.826', NULL, NULL);
INSERT INTO `wms_inventory_movement` VALUES (75, 'M-2023-04-03-090308', NULL, NULL, 21, NULL, NULL, NULL, NULL, 0, 115, '2023-04-03 09:03:41.287', NULL, NULL);
INSERT INTO `wms_inventory_movement` VALUES (76, 'M-2023-04-03-144422', NULL, NULL, 21, NULL, NULL, NULL, NULL, 0, 115, '2023-04-03 14:44:51.096', NULL, NULL);
INSERT INTO `wms_inventory_movement` VALUES (77, 'M-2023-04-06-145744', NULL, NULL, 21, NULL, NULL, NULL, NULL, 0, 115, '2023-04-06 14:58:16.812', NULL, NULL);
INSERT INTO `wms_inventory_movement` VALUES (78, 'M-2023-04-08-141029', NULL, NULL, 21, NULL, NULL, NULL, NULL, 0, 115, '2023-04-08 14:11:22.011', NULL, NULL);
INSERT INTO `wms_inventory_movement` VALUES (79, 'M-2023-04-10-214934', NULL, NULL, 21, NULL, NULL, NULL, NULL, 0, 115, '2023-04-10 21:49:52.884', NULL, NULL);
INSERT INTO `wms_inventory_movement` VALUES (80, 'M-2023-04-10-215917', NULL, NULL, 21, NULL, NULL, NULL, NULL, 0, 115, '2023-04-10 22:00:56.847', NULL, NULL);
INSERT INTO `wms_inventory_movement` VALUES (81, 'M-2023-04-10-220105', NULL, NULL, 21, NULL, NULL, NULL, NULL, 0, 115, '2023-04-10 22:01:14.910', NULL, NULL);
INSERT INTO `wms_inventory_movement` VALUES (82, 'M-2023-04-11-135737', NULL, NULL, 21, NULL, NULL, NULL, NULL, 0, 115, '2023-04-11 13:57:57.000', 115, '2023-04-11 14:06:06.789');
INSERT INTO `wms_inventory_movement` VALUES (83, 'M-2023-04-12-172822', NULL, NULL, 21, NULL, NULL, NULL, NULL, 0, 115, '2023-04-12 17:28:39.630', NULL, NULL);
INSERT INTO `wms_inventory_movement` VALUES (84, 'M-2023-04-12-210150', NULL, NULL, 21, NULL, NULL, NULL, '临时测试', 0, 115, '2023-04-12 21:02:27.453', NULL, NULL);
INSERT INTO `wms_inventory_movement` VALUES (85, 'M-2023-04-13-135345', NULL, NULL, 23, NULL, NULL, NULL, NULL, 0, 115, '2023-04-13 13:54:28.000', 115, '2023-04-13 13:55:12.898');
INSERT INTO `wms_inventory_movement` VALUES (86, 'M-2023-04-13-151416', NULL, NULL, 21, NULL, NULL, NULL, NULL, 0, 115, '2023-04-13 15:14:58.019', NULL, NULL);
INSERT INTO `wms_inventory_movement` VALUES (87, 'M-2023-04-13-214805', NULL, NULL, 21, NULL, NULL, NULL, 'cs', 0, 115, '2023-04-13 21:49:19.630', NULL, NULL);
INSERT INTO `wms_inventory_movement` VALUES (88, 'M-2023-04-14-180220', NULL, NULL, 21, NULL, NULL, NULL, NULL, 0, 115, '2023-04-14 18:03:00.499', NULL, NULL);
INSERT INTO `wms_inventory_movement` VALUES (89, 'M-2023-04-15-162900', NULL, NULL, 21, NULL, NULL, NULL, 'sfsdf', 0, 115, '2023-04-15 16:29:18.208', NULL, NULL);
INSERT INTO `wms_inventory_movement` VALUES (90, 'M-2023-04-17-134138', NULL, NULL, 21, NULL, NULL, NULL, '我是新建的移库单', 1, 115, '2023-04-17 13:43:09.000', 115, '2023-04-17 13:45:46.125');
INSERT INTO `wms_inventory_movement` VALUES (91, 'M-2023-04-17-134821', NULL, NULL, 23, NULL, NULL, NULL, 'a000000', 0, 115, '2023-04-17 13:49:09.000', 115, '2023-04-17 13:50:44.369');
INSERT INTO `wms_inventory_movement` VALUES (92, 'M-2023-04-17-150809', NULL, NULL, 21, NULL, NULL, NULL, '12313213213521352132', 0, 115, '2023-04-17 15:09:30.000', NULL, NULL);
INSERT INTO `wms_inventory_movement` VALUES (93, 'M-2023-04-19-100559', NULL, NULL, 21, NULL, NULL, NULL, NULL, 0, 115, '2023-04-19 10:06:25.847', NULL, NULL);
INSERT INTO `wms_inventory_movement` VALUES (94, 'M-2023-04-19-205405', NULL, NULL, 21, NULL, NULL, NULL, NULL, 0, 115, '2023-04-19 20:55:23.771', NULL, NULL);
INSERT INTO `wms_inventory_movement` VALUES (95, 'M-2023-04-21-150041', NULL, NULL, 21, NULL, NULL, NULL, NULL, 0, 115, '2023-04-21 15:01:06.609', NULL, NULL);
INSERT INTO `wms_inventory_movement` VALUES (96, 'M-2023-04-24-153715', NULL, NULL, 21, NULL, NULL, NULL, NULL, 0, 115, '2023-04-24 15:37:31.000', 115, '2023-04-24 15:38:27.688');
INSERT INTO `wms_inventory_movement` VALUES (97, 'M-2023-04-26-115348', NULL, NULL, 21, NULL, NULL, NULL, 'fdef', 0, 115, '2023-04-26 11:54:39.178', NULL, NULL);
INSERT INTO `wms_inventory_movement` VALUES (98, 'M-2023-04-29-170422', NULL, NULL, 21, NULL, NULL, NULL, NULL, 0, 115, '2023-04-29 17:04:49.929', NULL, NULL);

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
) ENGINE = InnoDB AUTO_INCREMENT = 198 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '库存移动详情' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wms_inventory_movement_detail
-- ----------------------------
INSERT INTO `wms_inventory_movement_detail` VALUES (27, 6, 1, 1.00, NULL, 0, NULL, NULL, NULL, NULL, NULL, 1, 2, 17, 21, 5, 4, 13);
INSERT INTO `wms_inventory_movement_detail` VALUES (30, 7, 5, 10.00, 1.00, 0, NULL, NULL, NULL, NULL, NULL, NULL, 20, 41, 21, NULL, 20, 42);
INSERT INTO `wms_inventory_movement_detail` VALUES (33, 8, 8, 40.00, 40.00, 0, NULL, NULL, NULL, NULL, NULL, 11, 21, 44, 22, NULL, 22, NULL);
INSERT INTO `wms_inventory_movement_detail` VALUES (34, 9, 6, 1.00, NULL, 0, NULL, NULL, NULL, NULL, NULL, 7, 14, 16, 21, NULL, 2, 17);
INSERT INTO `wms_inventory_movement_detail` VALUES (37, 4, 2, 20.00, 29.00, 0, NULL, NULL, NULL, NULL, NULL, 1, 1, 13, 24, 6, 2, 18);
INSERT INTO `wms_inventory_movement_detail` VALUES (38, 4, 1, 10.00, 1.00, 0, NULL, NULL, NULL, NULL, NULL, 1, 1, 13, 24, NULL, 4, NULL);
INSERT INTO `wms_inventory_movement_detail` VALUES (39, 10, 12, 1.00, NULL, 0, NULL, NULL, NULL, NULL, NULL, 1, 2, 17, 21, NULL, 4, 13);
INSERT INTO `wms_inventory_movement_detail` VALUES (40, 12, 13, 1.00, NULL, 0, NULL, NULL, NULL, NULL, NULL, 21, 2, 45, 21, 19, 14, 46);
INSERT INTO `wms_inventory_movement_detail` VALUES (41, 13, 13, 1.00, NULL, 0, NULL, NULL, NULL, NULL, NULL, 19, 14, 46, 21, NULL, 4, NULL);
INSERT INTO `wms_inventory_movement_detail` VALUES (42, 14, 13, 1.00, NULL, 0, NULL, NULL, NULL, NULL, NULL, 21, 2, 45, 21, NULL, 4, NULL);
INSERT INTO `wms_inventory_movement_detail` VALUES (43, 14, 22, 1.00, NULL, 0, NULL, NULL, NULL, NULL, NULL, 19, 14, 46, 21, NULL, 4, NULL);
INSERT INTO `wms_inventory_movement_detail` VALUES (45, 5, 28, 1.00, 1.00, 0, NULL, NULL, NULL, NULL, NULL, NULL, 4, 54, 23, NULL, 14, 53);
INSERT INTO `wms_inventory_movement_detail` VALUES (47, 16, 29, 1.00, NULL, 0, NULL, NULL, NULL, NULL, NULL, 24, 30, 56, 21, 25, 31, 57);
INSERT INTO `wms_inventory_movement_detail` VALUES (49, 18, 32, 1.00, NULL, 0, NULL, NULL, NULL, NULL, NULL, 24, 31, 56, 21, NULL, 32, NULL);
INSERT INTO `wms_inventory_movement_detail` VALUES (50, 15, 29, 1.00, 1.00, 0, NULL, NULL, NULL, NULL, NULL, NULL, 30, NULL, 22, 24, 31, 56);
INSERT INTO `wms_inventory_movement_detail` VALUES (52, 19, 58, 1.00, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 40, NULL, 21, NULL, 42, NULL);
INSERT INTO `wms_inventory_movement_detail` VALUES (53, 17, 58, 3.00, 1.00, 0, NULL, NULL, NULL, NULL, NULL, NULL, 38, 61, 22, NULL, 42, 63);
INSERT INTO `wms_inventory_movement_detail` VALUES (54, 20, 75, 1.00, NULL, 0, NULL, NULL, NULL, NULL, NULL, 37, 61, 77, 21, 38, 61, 77);
INSERT INTO `wms_inventory_movement_detail` VALUES (55, 21, 75, 1.00, NULL, 0, NULL, NULL, NULL, NULL, NULL, 40, 61, 78, 21, 42, 61, 79);
INSERT INTO `wms_inventory_movement_detail` VALUES (56, 22, 75, 1.00, NULL, 0, NULL, NULL, NULL, NULL, NULL, 37, 61, 77, 21, 47, 64, 82);
INSERT INTO `wms_inventory_movement_detail` VALUES (58, 23, 78, 2.00, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 69, NULL, 21, NULL, 66, NULL);
INSERT INTO `wms_inventory_movement_detail` VALUES (59, 24, 80, 1.00, NULL, 0, NULL, NULL, NULL, NULL, NULL, 50, 65, 86, 21, 51, 65, 86);
INSERT INTO `wms_inventory_movement_detail` VALUES (60, 25, 87, 1.00, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 67, 84, 21, NULL, 68, 85);
INSERT INTO `wms_inventory_movement_detail` VALUES (63, 26, 88, 1.00, 1.00, 0, NULL, NULL, NULL, NULL, NULL, NULL, 66, 86, 23, NULL, 67, NULL);
INSERT INTO `wms_inventory_movement_detail` VALUES (64, 27, 89, 1.00, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 75, NULL, 21, NULL, 75, 90);
INSERT INTO `wms_inventory_movement_detail` VALUES (68, 28, 91, 1000.00, NULL, 0, NULL, NULL, NULL, NULL, NULL, 49, 75, 90, 21, 50, 76, 89);
INSERT INTO `wms_inventory_movement_detail` VALUES (69, 28, 90, 1200.00, NULL, 0, NULL, NULL, NULL, NULL, NULL, 50, 76, 89, 21, 49, 75, 90);
INSERT INTO `wms_inventory_movement_detail` VALUES (70, 30, 90, 1.00, NULL, 0, NULL, NULL, NULL, NULL, NULL, 49, 75, 90, 21, 52, 78, 92);
INSERT INTO `wms_inventory_movement_detail` VALUES (71, 30, 89, 1.00, NULL, 0, NULL, NULL, NULL, NULL, NULL, 50, 76, 89, 21, 51, 77, 91);
INSERT INTO `wms_inventory_movement_detail` VALUES (73, 29, 90, 1.00, 1.00, 0, NULL, NULL, NULL, NULL, NULL, 49, 75, 90, 23, 51, 77, 91);
INSERT INTO `wms_inventory_movement_detail` VALUES (74, 31, 92, 1.00, NULL, 0, NULL, NULL, NULL, NULL, NULL, 50, 76, 89, 21, 51, 77, 91);
INSERT INTO `wms_inventory_movement_detail` VALUES (76, 33, 97, 1.00, 1.00, 0, NULL, NULL, NULL, NULL, NULL, NULL, 83, NULL, 24, NULL, 85, NULL);
INSERT INTO `wms_inventory_movement_detail` VALUES (78, 34, 99, 2.00, 1.00, 0, NULL, NULL, NULL, NULL, NULL, 57, 87, 100, 23, 55, 86, 98);
INSERT INTO `wms_inventory_movement_detail` VALUES (83, 35, 99, 1.00, 1.00, 0, NULL, NULL, NULL, NULL, NULL, 53, 83, 94, 23, NULL, 84, NULL);
INSERT INTO `wms_inventory_movement_detail` VALUES (84, 36, 99, 6.00, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 88, NULL, 21, NULL, 91, 108);
INSERT INTO `wms_inventory_movement_detail` VALUES (85, 37, 99, 20.00, NULL, 0, NULL, NULL, NULL, NULL, NULL, 61, 91, 105, 21, NULL, 88, NULL);
INSERT INTO `wms_inventory_movement_detail` VALUES (86, 38, 99, 10.00, NULL, 0, NULL, NULL, NULL, NULL, NULL, 61, 91, 105, 21, 55, 86, 98);
INSERT INTO `wms_inventory_movement_detail` VALUES (88, 39, 101, 2.00, 1.00, 0, NULL, NULL, NULL, NULL, NULL, 55, 86, 98, 21, 49, 84, 96);
INSERT INTO `wms_inventory_movement_detail` VALUES (89, 40, 101, 3.00, NULL, 0, NULL, NULL, NULL, NULL, NULL, 55, 86, 98, 21, NULL, 86, 99);
INSERT INTO `wms_inventory_movement_detail` VALUES (90, 41, 102, 1.00, NULL, 0, NULL, NULL, NULL, NULL, NULL, 49, 84, 96, 21, NULL, 86, 99);
INSERT INTO `wms_inventory_movement_detail` VALUES (91, 42, 102, 1.00, NULL, 0, NULL, NULL, NULL, NULL, NULL, 49, 84, 96, 21, NULL, 86, 99);
INSERT INTO `wms_inventory_movement_detail` VALUES (92, 43, 107, 2.00, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 84, 90, 21, 55, 86, 98);
INSERT INTO `wms_inventory_movement_detail` VALUES (93, 43, 106, 2.00, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 84, 90, 21, NULL, 88, NULL);
INSERT INTO `wms_inventory_movement_detail` VALUES (94, 43, 105, 2.00, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 89, 103, 21, NULL, 84, 90);
INSERT INTO `wms_inventory_movement_detail` VALUES (95, 44, 107, 1.00, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 84, 90, 21, 49, 84, 96);
INSERT INTO `wms_inventory_movement_detail` VALUES (99, 45, 107, 2.00, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 86, 99, 21, NULL, 88, NULL);
INSERT INTO `wms_inventory_movement_detail` VALUES (100, 45, 106, 2.00, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 86, 99, 21, NULL, 89, 103);
INSERT INTO `wms_inventory_movement_detail` VALUES (101, 45, 105, 2.00, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 91, 108, 21, NULL, 91, 107);
INSERT INTO `wms_inventory_movement_detail` VALUES (104, 46, 107, 1.00, 1.00, 0, NULL, NULL, NULL, NULL, NULL, NULL, 93, NULL, 24, NULL, 86, 99);
INSERT INTO `wms_inventory_movement_detail` VALUES (105, 46, 102, 1.00, 1.00, 0, NULL, NULL, NULL, NULL, NULL, NULL, 88, NULL, 24, NULL, 84, 96);
INSERT INTO `wms_inventory_movement_detail` VALUES (106, 47, 114, 90.00, NULL, 0, NULL, NULL, NULL, NULL, NULL, 67, 102, 116, 21, NULL, 101, 115);
INSERT INTO `wms_inventory_movement_detail` VALUES (109, 48, 117, 11.00, 1.00, 0, NULL, NULL, NULL, NULL, NULL, 68, 106, 118, 23, NULL, 105, NULL);
INSERT INTO `wms_inventory_movement_detail` VALUES (110, 49, 117, 1.00, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 105, NULL, 21, 68, 106, 118);
INSERT INTO `wms_inventory_movement_detail` VALUES (111, 50, 117, 1.00, NULL, 0, NULL, NULL, NULL, NULL, NULL, 68, 106, 118, 21, NULL, 107, NULL);
INSERT INTO `wms_inventory_movement_detail` VALUES (112, 51, 117, 4.00, NULL, 0, NULL, NULL, NULL, NULL, NULL, 68, 106, 118, 21, NULL, 107, NULL);
INSERT INTO `wms_inventory_movement_detail` VALUES (113, 51, 115, 1.00, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 105, NULL, 21, 68, 106, 118);
INSERT INTO `wms_inventory_movement_detail` VALUES (114, 52, 117, 1.00, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 105, NULL, 21, NULL, 107, NULL);
INSERT INTO `wms_inventory_movement_detail` VALUES (115, 53, 117, 2.00, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 105, NULL, 21, NULL, 108, NULL);
INSERT INTO `wms_inventory_movement_detail` VALUES (116, 53, 115, 2.00, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 105, NULL, 21, NULL, 107, NULL);
INSERT INTO `wms_inventory_movement_detail` VALUES (117, 53, 113, 2.00, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 105, NULL, 21, NULL, 107, NULL);
INSERT INTO `wms_inventory_movement_detail` VALUES (118, 54, 121, 13.00, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 114, NULL, 21, NULL, 111, NULL);
INSERT INTO `wms_inventory_movement_detail` VALUES (119, 54, 120, 1.00, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 113, NULL, 21, NULL, 111, NULL);
INSERT INTO `wms_inventory_movement_detail` VALUES (120, 54, 119, 2.00, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 113, NULL, 21, NULL, 111, NULL);
INSERT INTO `wms_inventory_movement_detail` VALUES (121, 54, 118, 1.00, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 114, NULL, 21, NULL, 111, NULL);
INSERT INTO `wms_inventory_movement_detail` VALUES (124, 55, 121, 4.00, 1.00, 0, NULL, NULL, NULL, NULL, NULL, NULL, 111, NULL, 23, NULL, 113, NULL);
INSERT INTO `wms_inventory_movement_detail` VALUES (126, 56, 125, 100.00, 1.00, 0, NULL, NULL, NULL, NULL, NULL, 77, 118, 128, 23, 78, 118, 129);
INSERT INTO `wms_inventory_movement_detail` VALUES (128, 57, 125, 100.00, 100.00, 0, NULL, NULL, NULL, NULL, NULL, 77, 118, 128, 23, 78, 118, 129);
INSERT INTO `wms_inventory_movement_detail` VALUES (129, 58, 125, 1.00, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 116, NULL, 21, NULL, 117, 127);
INSERT INTO `wms_inventory_movement_detail` VALUES (133, 59, 130, 100.00, 10.00, 0, NULL, NULL, NULL, NULL, NULL, NULL, 117, 127, 22, 78, 118, 129);
INSERT INTO `wms_inventory_movement_detail` VALUES (134, 61, 133, 1.00, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 117, 127, 21, 83, 119, 130);
INSERT INTO `wms_inventory_movement_detail` VALUES (139, 62, 140, 1.00, 1.00, 0, NULL, NULL, NULL, NULL, NULL, 96, 135, 147, 21, 97, 135, 147);
INSERT INTO `wms_inventory_movement_detail` VALUES (140, 62, 139, 1.00, 1.00, 0, NULL, NULL, NULL, NULL, NULL, 97, 135, 147, 21, NULL, 136, 145);
INSERT INTO `wms_inventory_movement_detail` VALUES (141, 63, 142, 1.00, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 137, NULL, 21, NULL, 136, 145);
INSERT INTO `wms_inventory_movement_detail` VALUES (142, 63, 141, 1.00, NULL, 0, NULL, NULL, NULL, NULL, NULL, 96, 135, 147, 21, NULL, 135, 149);
INSERT INTO `wms_inventory_movement_detail` VALUES (143, 64, 142, 1.00, NULL, 0, NULL, NULL, NULL, NULL, NULL, 96, 135, 147, 21, 97, 135, 147);
INSERT INTO `wms_inventory_movement_detail` VALUES (144, 65, 141, 2.00, NULL, 0, NULL, NULL, NULL, NULL, NULL, 96, 135, 147, 21, NULL, 135, 149);
INSERT INTO `wms_inventory_movement_detail` VALUES (146, 66, 141, 1.00, 1.00, 0, NULL, NULL, NULL, NULL, NULL, NULL, 137, NULL, 23, NULL, 135, 149);
INSERT INTO `wms_inventory_movement_detail` VALUES (147, 67, 143, 1.00, NULL, 0, NULL, NULL, NULL, NULL, NULL, 97, 135, 147, 21, NULL, 135, 149);
INSERT INTO `wms_inventory_movement_detail` VALUES (150, 68, 147, 1.00, 1.00, 0, NULL, NULL, NULL, NULL, NULL, 100, 154, 152, 23, 101, 154, 152);
INSERT INTO `wms_inventory_movement_detail` VALUES (151, 69, 148, 1.00, NULL, 0, NULL, NULL, NULL, NULL, NULL, 98, 137, 148, 21, 102, 155, 153);
INSERT INTO `wms_inventory_movement_detail` VALUES (152, 70, 141, 1.00, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 138, 150, 21, 98, 137, 148);
INSERT INTO `wms_inventory_movement_detail` VALUES (153, 71, 150, 1.00, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 139, NULL, 21, NULL, 140, NULL);
INSERT INTO `wms_inventory_movement_detail` VALUES (154, 72, 161, 1.00, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 138, 150, 21, NULL, 140, NULL);
INSERT INTO `wms_inventory_movement_detail` VALUES (155, 73, 161, 1.00, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 138, 150, 21, NULL, 139, 155);
INSERT INTO `wms_inventory_movement_detail` VALUES (156, 74, 162, 1.00, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 138, 160, 21, NULL, 138, 150);
INSERT INTO `wms_inventory_movement_detail` VALUES (157, 75, 158, 6.00, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 140, 145, 21, 107, 139, 155);
INSERT INTO `wms_inventory_movement_detail` VALUES (158, 76, 162, 1.00, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 138, 150, 21, 104, 139, 155);
INSERT INTO `wms_inventory_movement_detail` VALUES (159, 77, 168, 1.00, NULL, 0, NULL, NULL, NULL, NULL, NULL, 107, 139, 155, 21, NULL, 140, 145);
INSERT INTO `wms_inventory_movement_detail` VALUES (160, 78, 170, 20.00, NULL, 0, NULL, NULL, NULL, NULL, NULL, 107, 139, 155, 21, 104, 139, 155);
INSERT INTO `wms_inventory_movement_detail` VALUES (161, 78, 169, 1.00, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 151, NULL, 21, NULL, 147, NULL);
INSERT INTO `wms_inventory_movement_detail` VALUES (162, 78, 168, 1.00, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 151, NULL, 21, NULL, 147, NULL);
INSERT INTO `wms_inventory_movement_detail` VALUES (163, 79, 172, 9.00, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 154, NULL, 21, NULL, 157, NULL);
INSERT INTO `wms_inventory_movement_detail` VALUES (164, 80, 172, 999999.00, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 154, NULL, 21, NULL, 157, NULL);
INSERT INTO `wms_inventory_movement_detail` VALUES (165, 81, 171, 2147483647.00, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 154, NULL, 21, NULL, 157, NULL);
INSERT INTO `wms_inventory_movement_detail` VALUES (167, 82, 173, 1.00, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 190, NULL, 21, NULL, 189, NULL);
INSERT INTO `wms_inventory_movement_detail` VALUES (168, 83, 173, 1.00, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 157, NULL, 21, NULL, 158, NULL);
INSERT INTO `wms_inventory_movement_detail` VALUES (169, 84, 173, 20.00, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 164, NULL, 21, NULL, 165, NULL);
INSERT INTO `wms_inventory_movement_detail` VALUES (171, 85, 180, 5000.00, 1.00, 0, NULL, NULL, NULL, NULL, NULL, 122, 198, 185, 23, NULL, 199, 186);
INSERT INTO `wms_inventory_movement_detail` VALUES (172, 86, 180, 3.00, NULL, 0, NULL, NULL, NULL, NULL, NULL, 116, 192, 178, 21, 118, 194, 181);
INSERT INTO `wms_inventory_movement_detail` VALUES (173, 87, 180, 5.00, NULL, 0, NULL, NULL, NULL, NULL, NULL, 116, 192, 178, 21, 118, 194, 181);
INSERT INTO `wms_inventory_movement_detail` VALUES (174, 87, 178, 5.00, NULL, 0, NULL, NULL, NULL, NULL, NULL, 118, 194, 181, 21, NULL, 196, 183);
INSERT INTO `wms_inventory_movement_detail` VALUES (175, 87, 173, 1.00, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 198, NULL, 21, NULL, 192, NULL);
INSERT INTO `wms_inventory_movement_detail` VALUES (176, 87, 172, 1.00, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 196, NULL, 21, NULL, 198, NULL);
INSERT INTO `wms_inventory_movement_detail` VALUES (177, 88, 180, 1.00, NULL, 0, NULL, NULL, NULL, NULL, NULL, 116, 192, 178, 21, 117, 193, 180);
INSERT INTO `wms_inventory_movement_detail` VALUES (178, 88, 178, 1.00, NULL, 0, NULL, NULL, NULL, NULL, NULL, 117, 193, 180, 21, 118, 194, 181);
INSERT INTO `wms_inventory_movement_detail` VALUES (179, 89, 180, 1.00, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 193, NULL, 21, NULL, 194, NULL);
INSERT INTO `wms_inventory_movement_detail` VALUES (182, 90, 178, 100.00, 1.00, 0, NULL, NULL, NULL, NULL, NULL, NULL, 194, 181, 21, 124, 193, 178);
INSERT INTO `wms_inventory_movement_detail` VALUES (183, 90, 176, 20.00, 1.00, 0, NULL, NULL, NULL, NULL, NULL, 117, 193, 180, 21, NULL, 193, NULL);
INSERT INTO `wms_inventory_movement_detail` VALUES (188, 91, 180, 5.00, 3.00, 0, NULL, NULL, NULL, NULL, NULL, NULL, 198, 185, 23, 123, 199, 186);
INSERT INTO `wms_inventory_movement_detail` VALUES (189, 92, 180, 5.00, NULL, 0, NULL, NULL, NULL, NULL, NULL, 122, 198, 185, 21, 123, 199, 186);
INSERT INTO `wms_inventory_movement_detail` VALUES (190, 93, 182, 1.00, NULL, 0, NULL, NULL, NULL, NULL, NULL, 124, 193, 178, 21, 118, 194, 181);
INSERT INTO `wms_inventory_movement_detail` VALUES (191, 94, 182, 1.00, NULL, 0, NULL, NULL, NULL, NULL, NULL, 118, 194, 181, 21, NULL, 196, 183);
INSERT INTO `wms_inventory_movement_detail` VALUES (192, 94, 181, 1.00, NULL, 0, NULL, NULL, NULL, NULL, NULL, 118, 194, 181, 21, 119, 195, 182);
INSERT INTO `wms_inventory_movement_detail` VALUES (193, 95, 182, 1.00, NULL, 0, NULL, NULL, NULL, NULL, NULL, 118, 194, 181, 21, NULL, 196, 183);
INSERT INTO `wms_inventory_movement_detail` VALUES (195, 96, 185, 10.00, NULL, 0, NULL, NULL, NULL, NULL, NULL, 127, 215, 189, 21, 118, 194, 181);
INSERT INTO `wms_inventory_movement_detail` VALUES (196, 97, 182, 1.00, NULL, 0, NULL, NULL, NULL, NULL, NULL, 117, 194, 181, 21, 118, 194, 181);
INSERT INTO `wms_inventory_movement_detail` VALUES (197, 98, 188, 1.00, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 198, 185, 21, NULL, 198, 211);

-- ----------------------------
-- Table structure for wms_item
-- ----------------------------
DROP TABLE IF EXISTS `wms_item`;
CREATE TABLE `wms_item`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `item_no` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '编号',
  `item_name` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '名称',
  `item_type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '分类',
  `unit` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '单位类别',
  `rack_id` bigint(20) NULL DEFAULT NULL COMMENT '所属货架',
  `area_id` bigint(20) NULL DEFAULT NULL COMMENT '所属库区',
  `warehouse_id` bigint(20) NULL DEFAULT NULL COMMENT '所属仓库',
  `quantity` decimal(20, 2) NULL DEFAULT NULL COMMENT '安全库存',
  `expiry_date` datetime(3) NULL DEFAULT NULL COMMENT '有效期',
  `del_flag` tinyint(4) NOT NULL DEFAULT 0 COMMENT '删除标识',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `create_by` bigint(20) NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(3) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` bigint(20) NULL DEFAULT NULL COMMENT '修改人',
  `update_time` datetime(3) NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 194 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '物料' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wms_item
-- ----------------------------
INSERT INTO `wms_item` VALUES (1, 'yejingpin', '液晶屏', '200', '个', NULL, 13, 1, 100000.00, NULL, 1, NULL, 1, '2022-08-10 11:31:24.000', 1, '2022-10-11 18:12:43.959');
INSERT INTO `wms_item` VALUES (2, 'shoujike', '手机壳', '200', NULL, NULL, 18, 2, NULL, NULL, 1, NULL, 1, '2022-08-10 11:32:50.000', 1, '2022-10-10 15:46:59.106');
INSERT INTO `wms_item` VALUES (3, '12', '21', '200', '21', NULL, 14, 3, 21.00, '2022-11-09 00:00:00.000', 1, '21', 115, '2022-11-09 11:58:59.837', NULL, NULL);
INSERT INTO `wms_item` VALUES (4, '00000', '000', '200', NULL, 1, 17, 2, NULL, NULL, 1, NULL, 115, '2022-11-09 16:24:56.849', NULL, NULL);
INSERT INTO `wms_item` VALUES (5, 'test', '123', '200', '单位类别111', 6, 18, 2, 130.00, '2022-11-30 00:00:01.000', 1, 'qqqqqqqqqq', 115, '2022-11-10 15:38:41.000', 115, '2022-11-11 16:46:07.059');
INSERT INTO `wms_item` VALUES (6, '3213', '321313', '200', '321', 1, 17, 2, 11.00, '2022-11-19 00:00:00.000', 1, NULL, 115, '2022-11-11 16:28:35.752', NULL, NULL);
INSERT INTO `wms_item` VALUES (7, 'Apple', 'Apple', '200', '个', 9, 43, 21, 300.00, '2022-11-18 00:00:01.000', 1, NULL, 115, '2022-11-11 17:11:37.000', 115, '2022-11-11 17:14:36.531');
INSERT INTO `wms_item` VALUES (8, 'PuTao', 'PuTao', '200', '提', 11, 44, 21, 210.00, '2022-11-17 00:00:01.000', 1, NULL, 115, '2022-11-11 17:12:44.000', 115, '2022-11-11 17:14:21.840');
INSERT INTO `wms_item` VALUES (9, 'ShuPian', 'ShuPian', '200', '包', 12, 46, 22, 900.00, '2022-11-30 00:00:00.000', 1, NULL, 115, '2022-11-11 17:14:07.635', NULL, NULL);
INSERT INTO `wms_item` VALUES (10, 'CoolKeLe', 'CoolKeLe', '200', '听', 14, 47, 23, 3000.00, '2023-11-30 00:00:00.000', 1, NULL, 115, '2022-11-11 17:15:41.506', NULL, NULL);
INSERT INTO `wms_item` VALUES (11, '435tgfdg4', 'tretwe', '200', 'tew534', 1, 17, 2, NULL, NULL, 1, NULL, 115, '2022-11-12 15:55:18.819', NULL, NULL);
INSERT INTO `wms_item` VALUES (12, 'wuliao1', '物料1', '200', '吨', 17, 50, 25, 12.00, '2022-11-13 17:38:18.000', 1, '萝卜测试物料', 115, '2022-11-13 17:13:24.000', 115, '2022-11-13 17:38:19.880');
INSERT INTO `wms_item` VALUES (13, 'wuliao2', '物料2', '200', 'KG', 4, 14, 4, 158.00, '2022-12-03 02:02:00.000', 1, NULL, 115, '2022-11-13 17:42:55.367', NULL, NULL);
INSERT INTO `wms_item` VALUES (14, 'iu一头热', '空间和广泛的', '200', NULL, 18, 51, 26, NULL, '2022-11-11 00:00:00.000', 1, NULL, 115, '2022-11-14 16:40:54.029', NULL, NULL);
INSERT INTO `wms_item` VALUES (15, '1', '1', '200', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 115, '2022-11-15 13:16:03.368', NULL, NULL);
INSERT INTO `wms_item` VALUES (16, '1', '1', '200', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 115, '2022-11-15 13:16:06.231', NULL, NULL);
INSERT INTO `wms_item` VALUES (17, '213', '看见了', '200', '1', NULL, NULL, NULL, 100.00, '2022-11-15 00:00:02.000', 1, '1', 115, '2022-11-15 16:37:56.000', 115, '2022-11-17 16:19:22.759');
INSERT INTO `wms_item` VALUES (18, '11', '11', '200', '11', 13, 44, 2, 1.00, '2022-11-08 00:00:00.000', 1, '1', 115, '2022-11-17 11:37:48.009', NULL, NULL);
INSERT INTO `wms_item` VALUES (19, '9323', '3232', '200', NULL, 13, 44, 2, NULL, '2022-11-17 00:00:00.000', 1, NULL, 115, '2022-11-17 19:58:16.177', NULL, NULL);
INSERT INTO `wms_item` VALUES (20, 'TEST', 'TEST', '200', '只', NULL, NULL, NULL, 100.00, '2022-11-30 00:00:00.000', 1, '测试', 115, '2022-11-20 08:50:25.503', NULL, NULL);
INSERT INTO `wms_item` VALUES (21, 'test', 'test', '200', NULL, 20, 52, 27, 1000.00, '2022-11-20 15:09:23.000', 1, NULL, 115, '2022-11-20 15:09:22.124', NULL, NULL);
INSERT INTO `wms_item` VALUES (22, '123', '百威', '200', '瓶', 13, 44, 2, 100.00, '2023-11-08 00:00:00.000', 1, NULL, 1, '2022-11-22 13:08:17.000', 1, '2022-11-22 13:15:00.750');
INSERT INTO `wms_item` VALUES (23, '02315178', '02315178', '200', '1', 21, 45, 2, 11.00, '2022-11-22 00:00:00.000', 1, '11', 115, '2022-11-22 19:14:00.004', NULL, NULL);
INSERT INTO `wms_item` VALUES (24, '13333', '333', '200', NULL, 13, 44, 2, 500.00, '2022-11-01 00:00:00.000', 1, NULL, 115, '2022-11-23 09:55:36.814', NULL, NULL);
INSERT INTO `wms_item` VALUES (25, '33', '3', '200', NULL, 21, 45, 2, 1000000.00, '2022-11-03 00:00:00.000', 1, NULL, 115, '2022-11-25 10:36:24.759', NULL, NULL);
INSERT INTO `wms_item` VALUES (26, '12313123', '123123', '200', 'pcs', 20, 52, 27, 1231.00, NULL, 1, NULL, 115, '2022-11-26 22:21:43.669', NULL, NULL);
INSERT INTO `wms_item` VALUES (27, 'abc1234', '测试物料', '200', NULL, NULL, 45, 2, NULL, '2022-12-10 00:00:00.000', 1, NULL, 115, '2022-11-29 10:56:13.441', NULL, NULL);
INSERT INTO `wms_item` VALUES (28, '编号123', '名称111', '200', '个', 13, 45, 2, 12.00, '2022-12-22 00:00:00.000', 1, NULL, 115, '2022-11-30 14:24:57.834', NULL, NULL);
INSERT INTO `wms_item` VALUES (29, '6902957196994', '玉米油', '200', '箱', 24, 56, 30, 1.00, NULL, 1, NULL, 115, '2022-12-05 15:59:05.000', 115, '2022-12-05 16:55:50.345');
INSERT INTO `wms_item` VALUES (30, '123', '辣椒', '200', NULL, NULL, NULL, 30, NULL, NULL, 1, NULL, 115, '2022-12-08 09:55:50.000', 115, '2022-12-08 09:56:01.611');
INSERT INTO `wms_item` VALUES (31, 'WL0001', '螺丝配件', '200', '1', 26, 58, 34, 100.00, '2022-12-31 00:00:00.000', 1, NULL, 115, '2022-12-09 16:24:41.565', NULL, NULL);
INSERT INTO `wms_item` VALUES (32, 'WL0002', '螺丝', '200', '1', NULL, 59, 34, 100.00, '2022-12-09 16:25:13.000', 1, NULL, 115, '2022-12-09 16:25:02.000', 115, '2022-12-09 16:25:14.520');
INSERT INTO `wms_item` VALUES (33, 'F5*15', '韩国货', '200', '个', NULL, NULL, 39, 17300.00, NULL, 1, '有管空底', 115, '2022-12-10 15:00:06.818', NULL, NULL);
INSERT INTO `wms_item` VALUES (34, 'F5*17', '韩国货', '200', '个', NULL, NULL, 39, 700.00, NULL, 1, '有管空底', 115, '2022-12-10 15:01:20.759', NULL, NULL);
INSERT INTO `wms_item` VALUES (35, 'F5*19', '韩国货', '200', '个', NULL, NULL, 39, 600.00, NULL, 1, '有管空底', 115, '2022-12-10 15:02:06.571', NULL, NULL);
INSERT INTO `wms_item` VALUES (36, 'F5*19', '韩国货', '200', '个', NULL, NULL, 39, 600.00, NULL, 1, '有管空底', 115, '2022-12-10 15:02:11.759', NULL, NULL);
INSERT INTO `wms_item` VALUES (37, 'F5*19', '韩国货', '200', '个', NULL, NULL, 39, 600.00, NULL, 1, '有管空底', 115, '2022-12-10 15:02:11.871', NULL, NULL);
INSERT INTO `wms_item` VALUES (38, 'F5*19', '韩国货', '200', '个', NULL, NULL, 39, 600.00, NULL, 1, '有管空底', 115, '2022-12-10 15:02:14.842', NULL, NULL);
INSERT INTO `wms_item` VALUES (39, 'F6*19', '韩国货', '200', '个', NULL, NULL, 39, 400.00, NULL, 1, '有管空底', 115, '2022-12-10 15:03:36.376', NULL, NULL);
INSERT INTO `wms_item` VALUES (40, 'F6*21', '韩国货', '200', '个', NULL, NULL, 39, 100.00, NULL, 1, '有管空底', 115, '2022-12-10 15:04:28.136', NULL, NULL);
INSERT INTO `wms_item` VALUES (41, 'F6*23', '韩国货', '200', '个', NULL, NULL, 39, 0.00, NULL, 1, '有管空底', 115, '2022-12-10 15:05:15.275', NULL, NULL);
INSERT INTO `wms_item` VALUES (42, 'F6*25', '韩国货', '200', '个', NULL, NULL, 39, 0.00, NULL, 1, '有管空底', 115, '2022-12-10 15:06:02.456', NULL, NULL);
INSERT INTO `wms_item` VALUES (43, 'F6*27', '韩国货', '200', '个', NULL, NULL, 39, 0.00, NULL, 1, '有管空底', 115, '2022-12-10 15:06:49.503', NULL, NULL);
INSERT INTO `wms_item` VALUES (44, 'H5*15', '韩国货', '200', '个', NULL, NULL, 39, 27500.00, NULL, 1, '有管密底', 115, '2022-12-10 15:10:35.692', NULL, NULL);
INSERT INTO `wms_item` VALUES (45, 'H5*17', '韩国货', '200', '个', NULL, NULL, 39, 5200.00, NULL, 1, '有管密底', 115, '2022-12-10 15:11:31.293', NULL, NULL);
INSERT INTO `wms_item` VALUES (46, 'H5*19', '韩国货', '200', '个', NULL, NULL, 39, 10400.00, NULL, 1, '有管密底', 115, '2022-12-10 15:13:10.361', NULL, NULL);
INSERT INTO `wms_item` VALUES (47, 'H6*19', '韩国货', '200', '个', NULL, NULL, 39, 0.00, NULL, 1, '有管密底', 115, '2022-12-10 15:14:06.737', NULL, NULL);
INSERT INTO `wms_item` VALUES (48, 'H6*21', '韩国货', '200', '个', NULL, NULL, 39, 0.00, NULL, 1, '有管密底', 115, '2022-12-10 15:15:03.616', NULL, NULL);
INSERT INTO `wms_item` VALUES (49, 'H6*23', '韩国货', '200', '个', NULL, NULL, 39, 200.00, NULL, 1, '有管密底', 115, '2022-12-10 15:15:56.228', NULL, NULL);
INSERT INTO `wms_item` VALUES (50, 'H6*25', '韩国货', '200', '个', NULL, NULL, 39, 28350.00, NULL, 1, '有管密底', 115, '2022-12-10 15:16:45.695', NULL, NULL);
INSERT INTO `wms_item` VALUES (51, 'H6*27', '韩国货', '200', '个', NULL, NULL, 39, 18500.00, NULL, 1, '有管密底', 115, '2022-12-10 15:19:55.734', NULL, NULL);
INSERT INTO `wms_item` VALUES (52, 'F5*15', '最新', '200', '个', NULL, NULL, 39, 118900.00, NULL, 1, '有管空底', 115, '2022-12-10 15:21:02.700', NULL, NULL);
INSERT INTO `wms_item` VALUES (53, 'F5*15', '无管', '200', '个', NULL, NULL, 39, 34000.00, NULL, 1, '无管空底', 115, '2022-12-10 15:22:08.000', 115, '2022-12-10 15:22:26.518');
INSERT INTO `wms_item` VALUES (54, 'F*15', '新', '200', '个', NULL, NULL, 39, 31280.00, NULL, 1, '有管空底', 115, '2022-12-10 15:23:18.173', NULL, NULL);
INSERT INTO `wms_item` VALUES (55, '20#', '皮带扣', '200', '个', NULL, NULL, 39, 450.00, NULL, 1, '密底', 115, '2022-12-10 15:24:56.000', 115, '2022-12-12 11:00:33.933');
INSERT INTO `wms_item` VALUES (56, '2132', 'c3', '200', NULL, NULL, NULL, 38, NULL, NULL, 1, NULL, 115, '2022-12-12 16:34:03.840', NULL, NULL);
INSERT INTO `wms_item` VALUES (57, '1', '一次性口罩', '200', NULL, NULL, NULL, 38, NULL, NULL, 1, NULL, 115, '2022-12-13 15:31:04.000', 115, '2022-12-13 15:32:35.765');
INSERT INTO `wms_item` VALUES (58, '11', '2222', '200', NULL, 28, 61, 38, 3.00, NULL, 1, NULL, 115, '2022-12-13 15:58:07.000', 115, '2022-12-21 16:56:35.060');
INSERT INTO `wms_item` VALUES (59, '22222', '222222', '200', '2222', NULL, NULL, 40, 22.00, '2022-12-15 00:00:00.000', 1, 'sss', 115, '2022-12-15 14:43:42.361', NULL, NULL);
INSERT INTO `wms_item` VALUES (60, '0001地方', '测试物料', '200', '测试1', 30, 62, 43, 1.00, NULL, 1, NULL, 115, '2022-12-20 17:14:06.000', 115, '2022-12-22 12:36:20.479');
INSERT INTO `wms_item` VALUES (61, '0001', '主动安全设备', '200', NULL, NULL, NULL, NULL, 10.00, NULL, 1, NULL, 115, '2022-12-28 11:35:45.000', 115, '2022-12-28 11:36:30.350');
INSERT INTO `wms_item` VALUES (62, '011', '5555', '200', NULL, 31, 67, 50, 35.00, '2023-01-04 00:00:00.000', 1, '11', 115, '2023-01-04 14:14:29.368', NULL, NULL);
INSERT INTO `wms_item` VALUES (63, '320', 'pp管', '200', '米', 31, 67, 50, NULL, '2023-01-19 00:00:00.000', 1, '1', 115, '2023-01-04 14:46:17.000', 115, '2023-01-04 19:07:05.219');
INSERT INTO `wms_item` VALUES (64, '12', '23', '200', NULL, NULL, NULL, 50, NULL, NULL, 1, NULL, 115, '2023-01-05 12:04:39.968', NULL, NULL);
INSERT INTO `wms_item` VALUES (65, '002', '物料002', '200', '箱', NULL, 69, 50, NULL, '2023-01-28 00:00:00.000', 1, NULL, 115, '2023-01-05 16:40:04.470', NULL, NULL);
INSERT INTO `wms_item` VALUES (66, '123', '123', '200', NULL, NULL, NULL, 50, NULL, NULL, 1, NULL, 115, '2023-01-06 14:23:24.094', NULL, NULL);
INSERT INTO `wms_item` VALUES (67, '001', '苹果', '200', '个', 31, 70, 50, 100.00, '2023-01-27 00:00:00.000', 1, NULL, 115, '2023-01-06 16:50:50.731', NULL, NULL);
INSERT INTO `wms_item` VALUES (68, '002', '橘子', '200', '个', 34, 73, 53, 200.00, '2023-01-28 00:00:00.000', 1, NULL, 115, '2023-01-06 16:51:15.000', 115, '2023-01-07 13:43:30.134');
INSERT INTO `wms_item` VALUES (69, '003', '百事可乐330*24罐装', '200', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 115, '2023-01-07 18:08:44.874', NULL, NULL);
INSERT INTO `wms_item` VALUES (70, '222', 'jj', '200', 'j', NULL, NULL, 60, 90.00, '2023-01-04 00:00:00.000', 1, NULL, 115, '2023-01-07 23:45:33.532', NULL, NULL);
INSERT INTO `wms_item` VALUES (71, '1', '皮线光缆', '200', '米', 37, 77, 61, NULL, '2023-01-01 00:00:00.000', 1, NULL, 115, '2023-01-08 00:06:48.931', NULL, NULL);
INSERT INTO `wms_item` VALUES (72, '2', '双绞线', '200', '米', 37, 77, 61, NULL, '2023-01-01 16:08:03.000', 1, NULL, 115, '2023-01-08 00:08:24.000', 115, '2023-01-08 00:08:36.432');
INSERT INTO `wms_item` VALUES (73, '3', '同轴电缆', '200', '米', 37, 77, 61, NULL, '2022-12-01 00:00:00.000', 1, NULL, 115, '2023-01-08 00:09:19.524', NULL, NULL);
INSERT INTO `wms_item` VALUES (74, '4', '一级分纤箱', '200', '个', 38, 77, 61, NULL, '2022-12-31 00:00:00.000', 1, NULL, 115, '2023-01-08 00:10:13.512', NULL, NULL);
INSERT INTO `wms_item` VALUES (75, '5', '二级分纤箱', '200', '个', 38, 77, 61, NULL, '2021-08-01 00:00:00.000', 1, NULL, 115, '2023-01-08 00:10:51.254', NULL, NULL);
INSERT INTO `wms_item` VALUES (76, '6', '热熔管', '200', '个', 43, 80, 61, NULL, '2023-01-09 00:00:37.000', 1, '修改一下', 115, '2023-01-09 00:12:03.000', 115, '2023-01-09 00:23:43.512');
INSERT INTO `wms_item` VALUES (77, '1', '1', '200', NULL, 46, 77, 61, NULL, '2023-01-11 20:45:02.000', 1, NULL, 115, '2023-01-11 20:45:03.000', 115, '2023-01-13 11:09:29.266');
INSERT INTO `wms_item` VALUES (78, '001', '酱油', '200', '1', NULL, NULL, 69, NULL, NULL, 1, NULL, 115, '2023-01-13 12:51:24.488', NULL, NULL);
INSERT INTO `wms_item` VALUES (79, '002', '平遥牛肉', '200', NULL, 50, 86, 65, NULL, NULL, 1, NULL, 115, '2023-01-14 13:01:08.302', NULL, NULL);
INSERT INTO `wms_item` VALUES (80, 'A-03', '物料ABC', '200', NULL, NULL, 86, 65, 22.00, NULL, 1, NULL, 115, '2023-01-16 10:59:03.000', 115, '2023-01-25 15:14:23.276');
INSERT INTO `wms_item` VALUES (81, '004', '电视机', '200', '件', NULL, NULL, NULL, NULL, NULL, 1, NULL, 115, '2023-01-26 20:51:25.254', NULL, NULL);
INSERT INTO `wms_item` VALUES (82, '005', '电脑', '200', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 115, '2023-01-26 20:51:41.547', NULL, NULL);
INSERT INTO `wms_item` VALUES (83, '006', '啦啦啦', '200', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 115, '2023-01-26 20:51:52.217', NULL, NULL);
INSERT INTO `wms_item` VALUES (84, '007', 'ok酱', '200', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 115, '2023-01-26 20:52:09.897', NULL, NULL);
INSERT INTO `wms_item` VALUES (85, '008', '木材', '200', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 115, '2023-01-26 20:52:23.169', NULL, NULL);
INSERT INTO `wms_item` VALUES (86, '009', '松木', '200', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 115, '2023-01-26 20:52:35.426', NULL, NULL);
INSERT INTO `wms_item` VALUES (87, '010', '平底锅', '200', NULL, NULL, 87, 66, NULL, NULL, 1, NULL, 115, '2023-01-26 20:52:54.000', 115, '2023-01-27 19:52:49.843');
INSERT INTO `wms_item` VALUES (88, '11', '11', '200', NULL, 49, 85, 68, NULL, '2023-01-07 00:00:00.000', 1, NULL, 115, '2023-01-28 17:07:57.000', 115, '2023-01-28 17:09:22.894');
INSERT INTO `wms_item` VALUES (89, '01', '热水器', '200', 'TAI', 50, 89, 76, NULL, NULL, 1, NULL, 115, '2023-02-01 22:00:25.000', 115, '2023-02-02 14:08:16.256');
INSERT INTO `wms_item` VALUES (90, '1321', '测试商品', '200', '1', 49, 90, 75, 1.00, '2023-02-02 00:00:00.000', 1, '1', 115, '2023-02-02 15:03:45.000', 115, '2023-02-03 14:11:20.747');
INSERT INTO `wms_item` VALUES (91, '1', '1', '200', NULL, 50, 89, 76, NULL, '2023-02-02 00:00:00.000', 1, NULL, 115, '2023-02-02 15:09:59.564', NULL, NULL);
INSERT INTO `wms_item` VALUES (92, '6668', '666', '200', NULL, 52, 92, 78, NULL, '2023-02-25 00:00:00.000', 1, NULL, 115, '2023-02-04 16:10:51.000', 115, '2023-02-04 16:35:27.153');
INSERT INTO `wms_item` VALUES (93, '776', '777', '200', NULL, 52, 92, 78, NULL, NULL, 1, NULL, 115, '2023-02-04 16:35:58.962', NULL, NULL);
INSERT INTO `wms_item` VALUES (94, '99', '笔记本电脑', '200', NULL, 54, 95, 85, 15.00, '2023-02-16 00:00:00.000', 1, '备注', 115, '2023-02-06 11:46:51.000', 115, '2023-02-10 15:16:52.567');
INSERT INTO `wms_item` VALUES (95, 'AAAAAA', '生产废料', '200', 'KG', NULL, NULL, 84, NULL, NULL, 1, NULL, 115, '2023-02-06 15:18:38.000', 115, '2023-02-06 15:19:10.461');
INSERT INTO `wms_item` VALUES (96, '123654789', '六类网线', '200', NULL, 56, 98, 86, NULL, NULL, 1, NULL, 115, '2023-02-08 09:11:36.874', NULL, NULL);
INSERT INTO `wms_item` VALUES (97, '145789451', '联想蓝牙鼠标', '200', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 115, '2023-02-08 09:12:15.000', 115, '2023-02-08 10:38:21.121');
INSERT INTO `wms_item` VALUES (98, '145789451', '1111', '200', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 115, '2023-02-08 14:15:22.652', NULL, NULL);
INSERT INTO `wms_item` VALUES (99, '12345678', '贴片电阻', '200', '电子料', 53, 94, 83, 66.00, '2023-02-01 00:00:00.000', 1, NULL, 115, '2023-02-08 16:35:15.000', 115, '2023-02-09 14:34:23.332');
INSERT INTO `wms_item` VALUES (100, '11', '11', '200', NULL, 49, 96, 84, NULL, NULL, 1, NULL, 115, '2023-02-09 14:40:11.000', 115, '2023-02-10 13:03:39.498');
INSERT INTO `wms_item` VALUES (101, '0210', '电子桌牌', '200', '台', NULL, 103, 89, NULL, NULL, 1, NULL, 115, '2023-02-10 15:55:13.137', NULL, NULL);
INSERT INTO `wms_item` VALUES (102, '0001', '测试', '200', '个', NULL, 103, 89, 2.00, '2023-02-23 00:00:00.000', 1, '222', 115, '2023-02-12 13:27:03.748', NULL, NULL);
INSERT INTO `wms_item` VALUES (103, '0002', '测试2', '200', '21', 55, 98, 86, 1000.00, '2023-02-24 00:00:00.000', 1, NULL, 115, '2023-02-13 11:34:33.000', 115, '2023-02-14 10:02:44.271');
INSERT INTO `wms_item` VALUES (104, '0001', 'iPhone12', '200', '个', NULL, NULL, 88, 100.00, '2025-03-06 00:00:00.000', 1, NULL, 115, '2023-02-14 09:28:50.162', NULL, NULL);
INSERT INTO `wms_item` VALUES (105, '111', '111', '200', NULL, NULL, NULL, 93, NULL, NULL, 1, NULL, 115, '2023-02-15 11:28:16.866', NULL, NULL);
INSERT INTO `wms_item` VALUES (106, 'aa', 'AA', '200', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 115, '2023-02-15 14:06:01.263', NULL, NULL);
INSERT INTO `wms_item` VALUES (107, '0004', '肉夹馍', '200', NULL, 64, 111, 95, 10000.00, '2023-02-15 00:00:00.000', 1, NULL, 115, '2023-02-15 15:04:25.000', 115, '2023-02-15 15:07:02.311');
INSERT INTO `wms_item` VALUES (108, '001', '废胎1', '200', NULL, 65, 112, 98, NULL, NULL, 1, NULL, 115, '2023-02-16 15:15:04.766', NULL, NULL);
INSERT INTO `wms_item` VALUES (109, '000001', '馍馍', '200', '食品', 55, 98, 86, 1000.00, '2023-02-17 00:00:00.000', 1, '', 115, '2023-02-16 16:04:56.000', 115, '2023-02-16 16:05:15.936');
INSERT INTO `wms_item` VALUES (110, '1', '折叠框', '200', '600*400', 66, 115, 101, 10.00, '2023-02-28 00:00:00.000', 1, NULL, 115, '2023-02-17 10:50:10.533', NULL, NULL);
INSERT INTO `wms_item` VALUES (111, 'A001', 'test', '200', 'ddd', 67, 116, 102, 10.00, '2023-02-24 00:00:00.000', 1, 'd', 115, '2023-02-17 13:08:53.450', NULL, NULL);
INSERT INTO `wms_item` VALUES (112, '000', '9999', '200', NULL, 66, 115, 101, NULL, NULL, 1, NULL, 115, '2023-02-17 13:38:11.385', NULL, NULL);
INSERT INTO `wms_item` VALUES (113, '90990', '090909', '200', NULL, 67, 116, 102, NULL, '2023-02-17 00:00:00.000', 1, NULL, 115, '2023-02-17 13:38:36.865', NULL, NULL);
INSERT INTO `wms_item` VALUES (114, 'ddd', 'ddd', '200', 'dddd', 67, 116, 102, NULL, NULL, 1, NULL, 115, '2023-02-17 16:36:09.307', NULL, NULL);
INSERT INTO `wms_item` VALUES (115, 'ddd', 'ddd', '200', NULL, 67, 117, 104, 12.00, '2023-02-17 17:32:23.000', 1, NULL, 115, '2023-02-17 17:32:24.000', 115, '2023-02-19 20:17:27.461');
INSERT INTO `wms_item` VALUES (116, '2137237', '肉夹馍', '200', '食品', NULL, 117, 104, NULL, '2023-05-23 00:00:00.000', 1, '尽快出库 ', 115, '2023-02-18 16:24:02.035', NULL, NULL);
INSERT INTO `wms_item` VALUES (117, '1', '敌敌畏', '200', 'kg', 71, 120, 109, 100.00, '2023-02-21 00:00:00.000', 1, NULL, 115, '2023-02-21 12:01:30.000', 115, '2023-02-24 15:26:16.804');
INSERT INTO `wms_item` VALUES (118, '001', '桃花酿', '200', '测试', 72, 122, 112, NULL, NULL, 1, NULL, 115, '2023-02-26 13:23:48.000', 115, '2023-02-26 14:41:39.839');
INSERT INTO `wms_item` VALUES (119, '111', '11', '200', '11', NULL, NULL, 111, 11.00, '2023-02-26 14:41:04.000', 1, '11', 115, '2023-02-26 14:41:09.540', NULL, NULL);
INSERT INTO `wms_item` VALUES (120, '1231', '成品', '200', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 115, '2023-02-27 09:33:46.396', NULL, NULL);
INSERT INTO `wms_item` VALUES (121, '111', '成品', '200', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 115, '2023-02-27 09:34:20.801', NULL, NULL);
INSERT INTO `wms_item` VALUES (122, 'm_001', 'm_test', '200', 'kg', NULL, 125, 115, NULL, NULL, 1, NULL, 115, '2023-02-27 10:31:17.000', 115, '2023-02-27 10:35:27.678');
INSERT INTO `wms_item` VALUES (123, '8914651', '疫苗', '200', '111', NULL, NULL, NULL, 111.00, NULL, 1, NULL, 115, '2023-03-01 13:25:31.000', 115, '2023-03-01 16:38:59.501');
INSERT INTO `wms_item` VALUES (124, 'HPEAUH650-D', '其他初级形状比重≥0.94的聚乙烯', '200', '', NULL, NULL, NULL, NULL, NULL, 1, NULL, 115, '2023-03-01 17:52:02.829', NULL, NULL);
INSERT INTO `wms_item` VALUES (125, 'HPEASH800-M', '其他初级形状比重≥0.94的聚乙烯', '200', NULL, 74, 126, 116, NULL, '2023-03-05 00:00:00.000', 1, NULL, 115, '2023-03-01 17:52:39.000', 115, '2023-03-02 21:49:20.231');
INSERT INTO `wms_item` VALUES (126, '111', '111', '200', '11', NULL, NULL, NULL, NULL, NULL, 1, NULL, 115, '2023-03-03 13:46:50.186', NULL, NULL);
INSERT INTO `wms_item` VALUES (127, '11218010', '压缩弹簧', '200', '件', 90, 135, 122, 10.00, '2023-03-06 00:00:00.000', 1, NULL, 115, '2023-03-03 21:28:25.000', 115, '2023-03-03 21:28:37.446');
INSERT INTO `wms_item` VALUES (128, '18121032', '短圆柱滚子', '200', '件', 91, 135, 122, 10.00, '2023-03-07 00:00:00.000', 1, NULL, 115, '2023-03-03 21:29:05.000', 115, '2023-03-03 21:29:13.680');
INSERT INTO `wms_item` VALUES (129, '79914884', '输入花键轴', '200', '件', 89, 134, 121, NULL, NULL, 1, NULL, 115, '2023-03-03 21:29:52.232', NULL, NULL);
INSERT INTO `wms_item` VALUES (130, '79913766', '油封座', '200', '件', 89, 134, 121, NULL, NULL, 1, NULL, 115, '2023-03-03 21:30:24.000', 115, '2023-03-06 13:39:52.670');
INSERT INTO `wms_item` VALUES (131, '20230307123131', 'mac笔记本', '200', '台', NULL, 136, 117, 100.00, '2024-03-08 00:00:00.000', 1, '测试', 115, '2023-03-08 09:30:13.000', 115, '2023-03-08 09:40:21.207');
INSERT INTO `wms_item` VALUES (132, '79913766', '高低压柜', '200', '哥', NULL, NULL, NULL, NULL, NULL, 1, NULL, 115, '2023-03-08 13:43:14.188', NULL, NULL);
INSERT INTO `wms_item` VALUES (133, 'aaa', '瓶子', '200', '个', 92, 136, 117, 10.00, NULL, 1, '答复', 115, '2023-03-09 13:00:29.000', 115, '2023-03-10 10:52:35.472');
INSERT INTO `wms_item` VALUES (134, '333', '333', '200', '33', NULL, NULL, NULL, 1000.00, NULL, 1, NULL, 115, '2023-03-12 13:35:14.000', 115, '2023-03-13 00:23:23.991');
INSERT INTO `wms_item` VALUES (135, '123', '123', '200', '1', NULL, NULL, 133, 123.00, NULL, 1, NULL, 115, '2023-03-13 04:16:40.657', NULL, NULL);
INSERT INTO `wms_item` VALUES (136, 'JD7', 'JD7', '200', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 115, '2023-03-13 10:25:54.000', 115, '2023-03-13 10:29:33.129');
INSERT INTO `wms_item` VALUES (137, 'CESHI', '测试设备', '200', NULL, NULL, NULL, 135, NULL, NULL, 1, NULL, 115, '2023-03-13 10:31:53.000', 115, '2023-03-13 15:42:45.348');
INSERT INTO `wms_item` VALUES (138, '1232', '产出', '200', '斤', NULL, NULL, 135, 2.00, '2023-03-15 00:00:00.000', 1, NULL, 115, '2023-03-13 14:04:37.000', 115, '2023-03-13 15:44:55.797');
INSERT INTO `wms_item` VALUES (139, '666', '标枪', '200', '支', 107, 155, 139, NULL, NULL, 1, NULL, 115, '2023-03-13 15:54:53.000', 115, '2023-03-29 20:42:39.149');
INSERT INTO `wms_item` VALUES (140, '333', 'xxx', '200', '11', 96, 147, 135, 0.00, '2023-03-14 00:00:00.000', 1, '12345', 115, '2023-03-13 15:58:38.000', 115, '2023-03-28 08:51:39.192');
INSERT INTO `wms_item` VALUES (141, '111', '111', '200', '123', 98, 148, 137, 10.00, '2023-03-09 00:00:00.000', 1, NULL, 115, '2023-03-14 14:13:17.845', NULL, NULL);
INSERT INTO `wms_item` VALUES (142, '789', '发铜球', '200', '个', NULL, 145, 136, 9.00, NULL, 1, NULL, 115, '2023-03-14 16:15:38.000', 115, '2023-03-20 12:21:38.786');
INSERT INTO `wms_item` VALUES (143, '111', '1111', '200', NULL, 96, 145, 136, NULL, NULL, 1, NULL, 115, '2023-03-18 14:50:13.000', 115, '2023-03-20 17:01:27.406');
INSERT INTO `wms_item` VALUES (144, '801', '双面弹', '200', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 115, '2023-03-20 22:12:16.166', NULL, NULL);
INSERT INTO `wms_item` VALUES (145, '3213123', '茅台1', '200', NULL, 99, 151, 149, 5.00, '2023-03-01 00:00:00.000', 1, NULL, 115, '2023-03-21 17:31:54.425', NULL, NULL);
INSERT INTO `wms_item` VALUES (146, 'GZMT', '贵州茅台', '200', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 115, '2023-03-22 00:15:44.229', NULL, NULL);
INSERT INTO `wms_item` VALUES (147, '2023.3.22', '外套1', '200', NULL, 100, 152, 154, 100.00, NULL, 1, NULL, 115, '2023-03-22 15:50:03.000', 115, '2023-03-22 16:05:52.151');
INSERT INTO `wms_item` VALUES (148, 'PC', '电脑设备', '200', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 115, '2023-03-22 22:49:34.658', NULL, NULL);
INSERT INTO `wms_item` VALUES (149, '0001', '阿达', '200', NULL, NULL, NULL, 139, NULL, NULL, 1, NULL, 115, '2023-03-23 14:07:33.839', NULL, NULL);
INSERT INTO `wms_item` VALUES (150, 'sy0323', '流程验证', '200', '1', NULL, NULL, 139, NULL, NULL, 1, NULL, 115, '2023-03-23 14:11:07.990', NULL, NULL);
INSERT INTO `wms_item` VALUES (151, 'sy0323', 'iPhone14', '200', '1', 98, 148, 137, 100.00, '2023-03-31 10:44:39.000', 1, NULL, 115, '2023-03-23 14:11:38.000', 115, '2023-03-28 10:44:57.903');
INSERT INTO `wms_item` VALUES (152, '15', '可劲', '200', NULL, NULL, 150, 138, NULL, NULL, 1, NULL, 115, '2023-03-23 14:41:25.000', 115, '2023-03-24 13:32:17.971');
INSERT INTO `wms_item` VALUES (153, '123456', '测试sy', '200', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 115, '2023-03-23 15:08:14.716', NULL, NULL);
INSERT INTO `wms_item` VALUES (154, '135111', 'WMS管理', '200', '十大', 104, 155, 161, 1212.00, NULL, 1, '地方', 115, '2023-03-25 00:06:02.000', 115, '2023-03-25 00:48:13.937');
INSERT INTO `wms_item` VALUES (155, '777', '777', '200', '777', NULL, 156, 163, NULL, '2023-03-31 00:00:00.000', 1, NULL, 115, '2023-03-25 15:19:47.861', NULL, NULL);
INSERT INTO `wms_item` VALUES (156, '01', '大米', '200', NULL, NULL, 157, 165, 10.00, '2023-03-31 00:00:00.000', 1, NULL, 115, '2023-03-25 15:24:19.000', 115, '2023-03-28 08:51:25.433');
INSERT INTO `wms_item` VALUES (157, '001', '垃圾袋', '200', NULL, 104, 155, 139, NULL, NULL, 1, NULL, 115, '2023-03-26 19:51:08.000', 115, '2023-04-06 15:06:47.437');
INSERT INTO `wms_item` VALUES (158, 'tzlj001', '铁质料箱', '200', NULL, NULL, NULL, NULL, NULL, '2023-04-07 15:39:49.000', 1, NULL, 115, '2023-03-27 11:16:42.000', 115, '2023-04-07 15:41:33.509');
INSERT INTO `wms_item` VALUES (159, 'kbx001', '卡板箱', '200', '个', NULL, NULL, NULL, NULL, NULL, 1, NULL, 115, '2023-03-27 11:19:48.836', NULL, NULL);
INSERT INTO `wms_item` VALUES (160, '453534', '测试打印', '200', '的撒', NULL, 150, 138, 1.00, '2023-03-09 09:19:34.000', 1, '的说法', 115, '2023-03-28 09:20:28.000', 115, '2023-03-28 14:15:03.331');
INSERT INTO `wms_item` VALUES (161, '1313123', '名称', '200', '9999', NULL, NULL, 140, 12321.00, '2023-03-01 00:00:00.000', 1, '123213', 115, '2023-03-28 22:31:32.000', 115, '2023-03-28 22:31:48.651');
INSERT INTO `wms_item` VALUES (162, '笔记本-红色', '笔记本-红色', '200', NULL, NULL, 160, 138, 10.00, NULL, 1, NULL, 115, '2023-03-30 18:27:42.000', 115, '2023-03-30 21:38:59.520');
INSERT INTO `wms_item` VALUES (163, 'AAA', 'AA', '200', 'A', NULL, NULL, NULL, 2000.00, '2023-04-03 16:22:20.000', 1, 'AA', 115, '2023-04-03 16:22:28.474', NULL, NULL);
INSERT INTO `wms_item` VALUES (164, '66', '22', '200', '2', NULL, NULL, 147, NULL, NULL, 1, NULL, 115, '2023-04-04 17:05:39.683', NULL, NULL);
INSERT INTO `wms_item` VALUES (165, '00001', '册数', '200', '2233', 109, 155, 139, 22.00, '2023-04-06 11:00:49.000', 1, '899', 115, '2023-04-06 11:00:54.107', NULL, NULL);
INSERT INTO `wms_item` VALUES (166, '2', '2', '200', '2', NULL, NULL, 151, 2.00, '2023-04-06 14:00:35.000', 1, '2', 115, '2023-04-06 14:00:36.812', NULL, NULL);
INSERT INTO `wms_item` VALUES (167, '0406', '嘿咻', '200', '1', 107, 155, 139, 1.00, '2023-04-15 00:00:00.000', 1, '1', 115, '2023-04-06 14:01:28.603', NULL, NULL);
INSERT INTO `wms_item` VALUES (168, '001', '我是商品', '200', '1', NULL, NULL, 181, 11.00, '2023-04-08 00:00:00.000', 1, '1', 115, '2023-04-06 14:08:54.000', 115, '2023-04-06 14:13:30.027');
INSERT INTO `wms_item` VALUES (169, '1', 'yyf的物料', '200', NULL, 113, 169, 184, 100.00, '2023-04-06 00:00:00.000', 1, 'yyf', 115, '2023-04-06 15:09:14.317', NULL, NULL);
INSERT INTO `wms_item` VALUES (170, '800', '猪肉', '200', NULL, 114, 170, 185, NULL, NULL, 1, NULL, 115, '2023-04-06 22:43:30.200', NULL, NULL);
INSERT INTO `wms_item` VALUES (171, '001', '1111', '200', '1', 102, 171, 155, NULL, '2023-04-10 00:00:00.000', 1, NULL, 115, '2023-04-09 23:27:41.000', 115, '2023-04-10 14:40:51.972');
INSERT INTO `wms_item` VALUES (172, '0001', '元器件', '200', '个', NULL, NULL, 154, 100.00, '2023-04-12 00:00:00.000', 1, NULL, 115, '2023-04-10 16:00:47.000', 115, '2023-04-10 16:52:38.443');
INSERT INTO `wms_item` VALUES (173, '0001', '手机膜', '200', '张', 115, 176, 178, 500.00, '2023-04-30 00:00:00.000', 1, 'test', 115, '2023-04-11 13:35:58.000', 115, '2023-04-12 09:30:18.107');
INSERT INTO `wms_item` VALUES (174, '111', '111', '200', NULL, NULL, NULL, 158, NULL, '2023-04-12 00:00:00.000', 1, NULL, 115, '2023-04-11 15:23:12.475', NULL, NULL);
INSERT INTO `wms_item` VALUES (175, '123', 'sdafssfas fasts. afsfas', '200', '吨', NULL, NULL, 164, 4.32, NULL, 1, NULL, 115, '2023-04-12 23:23:52.713', NULL, NULL);
INSERT INTO `wms_item` VALUES (176, 'test0001', '卫龙', '200', '包', 116, 178, 192, 500.00, '2023-07-31 00:00:00.000', 1, '测试', 115, '2023-04-13 10:29:45.000', 115, '2023-04-13 10:42:46.658');
INSERT INTO `wms_item` VALUES (177, 'test0002', '薯条', '200', '包', 116, 178, 192, 50.00, '2024-04-30 00:00:00.000', 1, '测试', 115, '2023-04-13 10:31:31.638', NULL, NULL);
INSERT INTO `wms_item` VALUES (178, 'test0002', '薯条', '200', '包', 116, 178, 192, 500.00, '2024-04-30 00:00:00.000', 1, '测试', 115, '2023-04-13 10:31:31.000', 115, '2023-04-13 10:42:39.985');
INSERT INTO `wms_item` VALUES (179, 'test0002', '薯条', '200', '包', 116, 178, 192, 50.00, '2024-04-30 00:00:00.000', 1, '测试', 115, '2023-04-13 10:31:31.833', NULL, NULL);
INSERT INTO `wms_item` VALUES (180, '56765513131313', '泰国榴莲', '200', 'g', 122, 185, 198, 200.00, '2024-04-25 00:00:02.000', 1, NULL, 115, '2023-04-13 13:49:39.000', 115, '2023-04-15 20:47:51.460');
INSERT INTO `wms_item` VALUES (181, 'iphone15', '苹果15', '200', '个', 116, 178, 193, 100.00, '2023-04-29 00:00:00.000', 1, NULL, 115, '2023-04-17 15:40:31.084', NULL, NULL);
INSERT INTO `wms_item` VALUES (182, 'iPhone16', '苹果16', '200', '个', 118, 181, 194, 100.00, '2023-04-29 00:00:00.000', 1, NULL, 115, '2023-04-17 15:41:21.504', NULL, NULL);
INSERT INTO `wms_item` VALUES (183, '1', '泰国榴莲', '200', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 115, '2023-04-22 23:55:58.037', NULL, NULL);
INSERT INTO `wms_item` VALUES (184, 'xcsfasdsa', 'dsdsds', '200', 'ds', 118, 181, 194, NULL, NULL, 1, NULL, 115, '2023-04-23 14:31:22.651', NULL, NULL);
INSERT INTO `wms_item` VALUES (185, '100121', '8号螺丝', '200', '颗', 127, 189, 215, 1000.00, '2023-04-29 00:00:00.000', 1, NULL, 115, '2023-04-24 15:34:38.000', 115, '2023-04-25 15:47:55.731');
INSERT INTO `wms_item` VALUES (186, '57610634', '象牙芒', '200', '111', NULL, 183, 196, 5000.00, '2024-04-12 00:00:00.000', 1, NULL, 115, '2023-04-25 14:31:08.000', 115, '2023-04-26 10:50:52.413');
INSERT INTO `wms_item` VALUES (187, '5744-0426', '箱子', '200', NULL, 117, 181, 194, 20.00, '2023-03-31 00:00:00.000', 1, NULL, 115, '2023-04-26 10:51:28.924', NULL, NULL);
INSERT INTO `wms_item` VALUES (188, '2', '2', '200', '2', 117, 181, 194, 2.00, NULL, 1, NULL, 115, '2023-04-26 17:01:50.000', 115, '2023-04-26 17:32:17.925');
INSERT INTO `wms_item` VALUES (189, '12345', 'test', '200', '个', NULL, 216, 229, 111.00, NULL, 0, '111', 1, '2023-05-04 09:24:00.444', NULL, NULL);
INSERT INTO `wms_item` VALUES (190, 'test2', 'test2', '211', '个', NULL, 216, 229, 111.00, '2023-05-01 00:00:00.000', 0, '111', 1, '2023-05-04 10:12:44.000', 115, '2023-05-04 10:33:21.831');
INSERT INTO `wms_item` VALUES (191, 'test3', 'test3', '213', '个', NULL, NULL, 230, 222.00, '2023-05-01 00:00:00.000', 0, '222', 1, '2023-05-04 10:13:14.000', 115, '2023-05-04 10:33:11.249');
INSERT INTO `wms_item` VALUES (192, '123', '123', '200', '个', NULL, NULL, 230, 333.00, '2023-05-31 00:00:00.000', 1, '333', 1, '2023-05-04 10:14:12.000', 1, '2023-05-04 10:14:20.238');
INSERT INTO `wms_item` VALUES (193, 'iphone14', 'iphone14', '212', NULL, NULL, 216, 229, 1000.00, NULL, 0, NULL, 115, '2023-05-04 10:34:10.038', NULL, NULL);

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
) ENGINE = InnoDB AUTO_INCREMENT = 215 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '物料类型表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wms_item_type
-- ----------------------------
INSERT INTO `wms_item_type` VALUES (100, 0, '0', '信息化耗材', 2, '0', '0', 0, '2023-04-03 14:31:16.000', 115, '2023-04-30 16:41:51.963');
INSERT INTO `wms_item_type` VALUES (200, 100, '0,100', '电脑配件', 1, '0', '0', NULL, '2023-04-03 14:31:16.000', 1, '2023-04-03 20:06:16.989');
INSERT INTO `wms_item_type` VALUES (201, 100, '0,100', '办公室', 2, '0', '1', NULL, '2023-04-03 14:31:16.700', 0, '2023-04-03 14:31:16.700');
INSERT INTO `wms_item_type` VALUES (202, 100, '0,100', '技术处', 4, '0', '1', NULL, '2023-04-03 14:31:16.700', 0, '2023-04-03 14:31:16.700');
INSERT INTO `wms_item_type` VALUES (203, 100, '0,100', '刑事法庭', 5, '0', '1', NULL, '2023-04-03 14:31:16.700', 0, '2023-04-03 14:31:16.700');
INSERT INTO `wms_item_type` VALUES (204, 100, '0,100', '民事法庭', 6, '0', '1', NULL, '2023-04-03 14:31:16.700', 0, '2023-04-03 14:31:16.700');
INSERT INTO `wms_item_type` VALUES (205, 100, '0,100', '政治部', 3, '0', '1', NULL, '2023-04-03 14:31:16.700', 0, '2023-04-03 14:31:16.700');
INSERT INTO `wms_item_type` VALUES (206, 100, '', '测试', 0, '0', '1', 1, '2023-04-03 18:02:22.015', NULL, NULL);
INSERT INTO `wms_item_type` VALUES (207, 200, '', '111', 0, '0', '1', 1, '2023-04-03 18:02:30.320', NULL, NULL);
INSERT INTO `wms_item_type` VALUES (208, 200, '0,100,200', '内存', 0, '0', '0', 1, '2023-04-03 20:07:10.178', NULL, NULL);
INSERT INTO `wms_item_type` VALUES (209, 200, '0,100,200', '硬盘', 0, '0', '0', 1, '2023-04-03 20:07:23.678', NULL, NULL);
INSERT INTO `wms_item_type` VALUES (211, 0, '', 'test', 0, '0', '0', 1, '2023-04-27 08:54:01.869', NULL, NULL);
INSERT INTO `wms_item_type` VALUES (212, 100, '', '555', 0, '0', '0', 115, '2023-04-29 17:07:51.000', 115, '2023-04-29 17:08:59.853');
INSERT INTO `wms_item_type` VALUES (213, 100, '', '2222', 3, '0', '0', 115, '2023-04-29 17:08:15.710', NULL, NULL);
INSERT INTO `wms_item_type` VALUES (214, 0, '', '干果', 0, '0', '0', 115, '2023-05-02 13:38:41.000', 115, '2023-05-03 15:16:25.322');

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
-- Records of wms_rack
-- ----------------------------
INSERT INTO `wms_rack` VALUES (1, '1', '苏州东1', 17, 2, NULL, 1, 1, '2022-08-09 11:50:30.000', 1, '2022-11-04 22:55:31.231');
INSERT INTO `wms_rack` VALUES (2, '23', 'sd', 14, 2, NULL, 1, 1, '2022-08-09 13:54:03.000', NULL, NULL);
INSERT INTO `wms_rack` VALUES (3, '23', '45', 13, 1, NULL, 1, 1, '2022-08-09 15:33:18.000', NULL, NULL);
INSERT INTO `wms_rack` VALUES (4, '23', '南京北1', 14, 3, NULL, 1, 1, '2022-08-09 15:37:15.000', 115, '2022-11-09 16:48:11.177');
INSERT INTO `wms_rack` VALUES (5, '22', '苏州东2', 17, 2, NULL, 1, 1, '2022-08-10 10:13:02.000', 115, '2022-11-12 10:50:56.824');
INSERT INTO `wms_rack` VALUES (6, '12', '上海南3', 18, 2, NULL, 1, 1, '2022-08-10 10:13:14.000', 1, '2022-10-09 23:02:31.322');
INSERT INTO `wms_rack` VALUES (7, '111', NULL, 16, 3, NULL, 1, 1, '2022-10-09 23:44:11.544', NULL, NULL);
INSERT INTO `wms_rack` VALUES (8, '01-01-998', NULL, 42, 20, NULL, 1, 115, '2022-11-07 21:39:03.288', NULL, NULL);
INSERT INTO `wms_rack` VALUES (9, '1-A-1', '苹果', 43, 21, NULL, 1, 115, '2022-11-11 17:07:13.652', NULL, NULL);
INSERT INTO `wms_rack` VALUES (10, '1-A-2', '梨', 43, 21, NULL, 1, 115, '2022-11-11 17:07:29.700', NULL, NULL);
INSERT INTO `wms_rack` VALUES (11, '1-B-1', '葡萄', 44, 21, NULL, 1, 115, '2022-11-11 17:07:44.089', NULL, NULL);
INSERT INTO `wms_rack` VALUES (12, '2-A-1', '薯片', 46, 22, NULL, 1, 115, '2022-11-11 17:08:06.115', NULL, NULL);
INSERT INTO `wms_rack` VALUES (13, '2-A-2', '虾片', 53, 14, NULL, 1, 115, '2022-11-11 17:08:34.000', 115, '2022-12-02 18:43:14.915');
INSERT INTO `wms_rack` VALUES (14, '3-A-1', '可口可乐', 46, 14, NULL, 1, 115, '2022-11-11 17:08:53.000', 115, '2022-11-27 20:52:04.405');
INSERT INTO `wms_rack` VALUES (15, '4-A-1', '非你莫属', 48, 24, NULL, 1, 115, '2022-11-11 17:09:08.703', NULL, NULL);
INSERT INTO `wms_rack` VALUES (16, '4-B-1', 'ABC', 49, 24, NULL, 1, 115, '2022-11-11 17:09:34.038', NULL, NULL);
INSERT INTO `wms_rack` VALUES (17, 'luobohuojia', '萝卜货架', 50, 25, '无', 1, 115, '2022-11-13 17:12:01.932', NULL, NULL);
INSERT INTO `wms_rack` VALUES (18, '3444', '巨化股份', 51, 26, '雷', 1, 115, '2022-11-14 16:40:10.222', NULL, NULL);
INSERT INTO `wms_rack` VALUES (19, '123123', '123123123', 46, 14, NULL, 1, 115, '2022-11-20 08:53:13.880', NULL, NULL);
INSERT INTO `wms_rack` VALUES (20, 'test-1-A', 'test-1-A', 45, 2, NULL, 1, 115, '2022-11-20 15:08:52.000', 115, '2022-11-30 14:41:21.313');
INSERT INTO `wms_rack` VALUES (21, '12', '21', 45, 2, NULL, 1, 115, '2022-11-20 21:19:28.402', NULL, NULL);
INSERT INTO `wms_rack` VALUES (22, '111', '11', 45, 2, '1', 1, 115, '2022-11-29 15:10:43.618', NULL, NULL);
INSERT INTO `wms_rack` VALUES (23, '002', NULL, 55, 14, NULL, 1, 115, '2022-12-04 15:38:15.553', NULL, NULL);
INSERT INTO `wms_rack` VALUES (24, 'A-01-01', '金融仓库中间南排', 56, 30, '金融仓库中间南排', 1, 115, '2022-12-05 15:48:40.022', NULL, NULL);
INSERT INTO `wms_rack` VALUES (25, 'xmld_b1_1_1', '北仓1-1-1', 57, 33, NULL, 1, 115, '2022-12-07 09:13:00.000', 115, '2022-12-08 10:28:57.591');
INSERT INTO `wms_rack` VALUES (26, 'HJ0001', '货架A1', 58, 34, NULL, 1, 115, '2022-12-09 16:23:48.279', NULL, NULL);
INSERT INTO `wms_rack` VALUES (27, '0101', '1号货架', 60, 39, NULL, 1, 115, '2022-12-12 13:15:06.451', NULL, NULL);
INSERT INTO `wms_rack` VALUES (28, '123', 'sdfsd', 61, 38, NULL, 1, 115, '2022-12-14 23:13:14.234', NULL, NULL);
INSERT INTO `wms_rack` VALUES (29, '23', '345', 61, 38, NULL, 1, 115, '2022-12-15 13:26:31.419', NULL, NULL);
INSERT INTO `wms_rack` VALUES (30, 'A001-01-H01-01', '成品仓01区1号货架1层', 63, 42, '成品仓01区1号货架1层', 1, 115, '2022-12-18 17:35:11.000', 115, '2023-01-03 16:23:19.430');
INSERT INTO `wms_rack` VALUES (31, '222', '1111', 70, 50, '111', 1, 115, '2023-01-04 14:13:49.000', 115, '2023-01-06 07:58:13.480');
INSERT INTO `wms_rack` VALUES (32, '001', NULL, 68, 51, NULL, 1, 115, '2023-01-05 14:48:42.575', NULL, NULL);
INSERT INTO `wms_rack` VALUES (33, '123', NULL, 72, 52, NULL, 1, 115, '2023-01-06 14:22:48.571', NULL, NULL);
INSERT INTO `wms_rack` VALUES (34, '01', '货架1', 73, 53, NULL, 1, 115, '2023-01-06 16:56:13.529', NULL, NULL);
INSERT INTO `wms_rack` VALUES (35, '02', '货架2', 73, 53, NULL, 1, 115, '2023-01-06 16:56:31.948', NULL, NULL);
INSERT INTO `wms_rack` VALUES (36, '03', '工序站点1', 73, 53, NULL, 1, 115, '2023-01-07 10:21:32.019', NULL, NULL);
INSERT INTO `wms_rack` VALUES (37, '1', '博爱东库区-1号架', 77, 61, NULL, 1, 115, '2023-01-07 23:57:52.000', 115, '2023-01-11 16:41:36.960');
INSERT INTO `wms_rack` VALUES (38, '2', '博爱东库区-2号架', 77, 61, NULL, 1, 115, '2023-01-07 23:58:45.840', NULL, NULL);
INSERT INTO `wms_rack` VALUES (39, '3', '博爱西库区-1号架', 78, 61, NULL, 1, 115, '2023-01-08 00:01:09.139', NULL, NULL);
INSERT INTO `wms_rack` VALUES (40, '4', '博爱西库区-2号架', 78, 61, NULL, 1, 115, '2023-01-08 00:01:38.450', NULL, NULL);
INSERT INTO `wms_rack` VALUES (41, '5', '博爱南库区-1号架', 79, 61, NULL, 1, 115, '2023-01-08 23:15:13.674', NULL, NULL);
INSERT INTO `wms_rack` VALUES (42, '6', '博爱南库区-2号架', 79, 61, NULL, 1, 115, '2023-01-08 23:15:37.591', NULL, NULL);
INSERT INTO `wms_rack` VALUES (43, '7', '博爱北库区-1号架', 80, 61, NULL, 1, 115, '2023-01-08 23:16:14.785', NULL, NULL);
INSERT INTO `wms_rack` VALUES (44, '8', '博爱北库区-2号架', 80, 61, NULL, 1, 115, '2023-01-08 23:53:46.462', NULL, NULL);
INSERT INTO `wms_rack` VALUES (45, '8', '博爱北库区-2号架', 80, 61, '我要修改啦', 1, 115, '2023-01-08 23:57:49.000', 115, '2023-01-09 00:02:24.414');
INSERT INTO `wms_rack` VALUES (46, 'A', ' AS', 77, 61, '1111', 1, 115, '2023-01-10 16:29:49.004', NULL, NULL);
INSERT INTO `wms_rack` VALUES (47, '1', '测试货架', 82, 64, NULL, 1, 115, '2023-01-11 20:47:34.761', NULL, NULL);
INSERT INTO `wms_rack` VALUES (48, '01', NULL, 83, 65, NULL, 1, 115, '2023-01-13 12:41:14.566', NULL, NULL);
INSERT INTO `wms_rack` VALUES (49, '01', '不良品', 96, 84, '1', 1, 115, '2023-01-13 12:50:55.000', 115, '2023-02-08 10:37:46.199');
INSERT INTO `wms_rack` VALUES (50, '2', '成品库', 89, 76, NULL, 1, 115, '2023-01-14 12:59:42.000', 115, '2023-02-01 22:02:52.420');
INSERT INTO `wms_rack` VALUES (51, '3', '外库', 91, 77, NULL, 1, 115, '2023-01-14 16:55:53.000', 115, '2023-02-01 22:03:13.824');
INSERT INTO `wms_rack` VALUES (52, '04', '不良品', 92, 78, NULL, 1, 115, '2023-01-29 21:29:10.000', 115, '2023-02-01 22:03:33.273');
INSERT INTO `wms_rack` VALUES (53, '0206测试', '0206测试', 94, 83, '0206测试', 1, 115, '2023-02-06 14:11:55.627', NULL, NULL);
INSERT INTO `wms_rack` VALUES (54, '123', NULL, 95, 85, NULL, 1, 115, '2023-02-07 10:22:08.616', NULL, NULL);
INSERT INTO `wms_rack` VALUES (55, '30011', '一层', 98, 86, NULL, 1, 115, '2023-02-08 09:09:27.000', 115, '2023-02-08 09:10:43.042');
INSERT INTO `wms_rack` VALUES (56, '30012', '二层', 98, 86, NULL, 1, 115, '2023-02-08 09:09:48.000', 115, '2023-02-08 09:10:52.195');
INSERT INTO `wms_rack` VALUES (57, '260102', '东区二层架', 100, 87, NULL, 1, 115, '2023-02-08 16:32:37.968', NULL, NULL);
INSERT INTO `wms_rack` VALUES (58, '003', 'aa货架', 101, 88, '1', 1, 115, '2023-02-10 10:43:17.300', NULL, NULL);
INSERT INTO `wms_rack` VALUES (59, 'SCZX001', NULL, 102, 89, NULL, 1, 115, '2023-02-10 15:23:54.628', NULL, NULL);
INSERT INTO `wms_rack` VALUES (60, '001', 'm78星能量石', 104, 90, '测试', 1, 115, '2023-02-11 10:56:36.449', NULL, NULL);
INSERT INTO `wms_rack` VALUES (61, 'A001001001', '50mm', 105, 91, NULL, 1, 115, '2023-02-11 14:07:29.296', NULL, NULL);
INSERT INTO `wms_rack` VALUES (62, '003', '轴承架子', 109, 92, '轴承', 1, 115, '2023-02-13 13:49:44.185', NULL, NULL);
INSERT INTO `wms_rack` VALUES (63, 'A1001', '货架A1001', 110, 94, NULL, 1, 115, '2023-02-15 14:08:32.590', NULL, NULL);
INSERT INTO `wms_rack` VALUES (64, '01', '货架1', 111, 95, NULL, 1, 115, '2023-02-15 15:03:03.757', NULL, NULL);
INSERT INTO `wms_rack` VALUES (65, '2001', '废胎', 112, 98, NULL, 1, 115, '2023-02-16 15:09:06.723', NULL, NULL);
INSERT INTO `wms_rack` VALUES (66, '001', '货架一', 115, 101, NULL, 1, 115, '2023-02-17 10:49:06.139', NULL, NULL);
INSERT INTO `wms_rack` VALUES (67, 'd0001', 'dddd', 117, 104, 'd', 1, 115, '2023-02-17 13:07:56.000', 115, '2023-02-19 01:01:03.293');
INSERT INTO `wms_rack` VALUES (68, '1', '郑州', 118, 106, NULL, 1, 115, '2023-02-21 12:00:56.455', NULL, NULL);
INSERT INTO `wms_rack` VALUES (69, '007', 'ii', 118, 106, NULL, 1, 115, '2023-02-23 15:04:56.000', 115, '2023-02-23 15:05:04.435');
INSERT INTO `wms_rack` VALUES (70, '001', '', 119, 109, NULL, 1, 115, '2023-02-23 20:09:04.593', NULL, NULL);
INSERT INTO `wms_rack` VALUES (71, '0111', '0111货架', 120, 109, '123456', 1, 115, '2023-02-24 15:02:49.734', NULL, NULL);
INSERT INTO `wms_rack` VALUES (72, '001', '键盘', 122, 112, NULL, 1, 115, '2023-02-25 08:21:48.064', NULL, NULL);
INSERT INTO `wms_rack` VALUES (73, '100_01_01', NULL, 125, 115, NULL, 1, 115, '2023-02-27 10:30:20.533', NULL, NULL);
INSERT INTO `wms_rack` VALUES (74, '3243', '43', 126, 116, '4343', 1, 115, '2023-03-01 01:09:46.141', NULL, NULL);
INSERT INTO `wms_rack` VALUES (75, 'B02', 'B02', 131, 119, NULL, 1, 115, '2023-03-01 17:34:12.313', NULL, NULL);
INSERT INTO `wms_rack` VALUES (76, 'B03', 'B03', 131, 119, NULL, 1, 115, '2023-03-01 17:36:35.675', NULL, NULL);
INSERT INTO `wms_rack` VALUES (77, 'A', 'A', 128, 118, NULL, 1, 115, '2023-03-01 17:38:29.034', NULL, NULL);
INSERT INTO `wms_rack` VALUES (78, 'B', 'B', 129, 118, NULL, 1, 115, '2023-03-01 17:39:37.316', NULL, NULL);
INSERT INTO `wms_rack` VALUES (79, 'B11-A07', 'B11-A07', 131, 119, NULL, 1, 115, '2023-03-01 17:40:20.000', 115, '2023-03-01 17:44:26.278');
INSERT INTO `wms_rack` VALUES (80, '3A02', 'A02', 130, 119, NULL, 1, 115, '2023-03-01 17:40:57.000', 115, '2023-03-01 17:45:09.486');
INSERT INTO `wms_rack` VALUES (81, 'B11-A04', 'B11-A04', 131, 119, NULL, 1, 115, '2023-03-01 17:45:39.111', NULL, NULL);
INSERT INTO `wms_rack` VALUES (82, '3A11', 'A11', 130, 119, NULL, 1, 115, '2023-03-01 17:46:08.392', NULL, NULL);
INSERT INTO `wms_rack` VALUES (83, '3A10', 'A10', 130, 119, NULL, 1, 115, '2023-03-01 17:46:43.687', NULL, NULL);
INSERT INTO `wms_rack` VALUES (84, '3A01G01-4', 'A01G01-4', 130, 119, NULL, 1, 115, '2023-03-01 17:47:08.789', NULL, NULL);
INSERT INTO `wms_rack` VALUES (85, '3A01G03-3', 'A01G03-3', 130, 119, NULL, 1, 115, '2023-03-01 17:47:40.145', NULL, NULL);
INSERT INTO `wms_rack` VALUES (86, '3A01G08-2', 'A01G08-2', 130, 119, NULL, 1, 115, '2023-03-01 17:48:23.495', NULL, NULL);
INSERT INTO `wms_rack` VALUES (87, '3B01G01-1', 'B01G01-1', 131, 119, NULL, 1, 115, '2023-03-01 17:48:51.961', NULL, NULL);
INSERT INTO `wms_rack` VALUES (88, '2-3', '2-3', 134, 121, NULL, 1, 115, '2023-03-03 20:09:55.036', NULL, NULL);
INSERT INTO `wms_rack` VALUES (89, '1-2-3', '1-2-3', 134, 121, NULL, 1, 115, '2023-03-03 20:11:16.246', NULL, NULL);
INSERT INTO `wms_rack` VALUES (90, '2-1-1', '2-1-1', 135, 122, NULL, 1, 115, '2023-03-03 21:26:29.339', NULL, NULL);
INSERT INTO `wms_rack` VALUES (91, '2-1-2', '2-1-2', 135, 122, NULL, 1, 115, '2023-03-03 21:26:50.592', NULL, NULL);
INSERT INTO `wms_rack` VALUES (92, 'HJ030701', '货架001', 136, 117, '货架001', 1, 115, '2023-03-07 16:33:23.890', NULL, NULL);
INSERT INTO `wms_rack` VALUES (93, '123', 'as', 141, 129, 'asd', 1, 115, '2023-03-11 21:35:57.694', NULL, NULL);
INSERT INTO `wms_rack` VALUES (94, '测试货架', '测试货架', 142, 131, '测试货架', 1, 115, '2023-03-12 15:51:59.835', NULL, NULL);
INSERT INTO `wms_rack` VALUES (95, '1', '货架', 142, 131, '1', 1, 115, '2023-03-12 19:12:32.372', NULL, NULL);
INSERT INTO `wms_rack` VALUES (96, '123', '货架12', 156, 163, '电脑', 1, 115, '2023-03-13 15:20:40.000', 115, '2023-03-29 14:50:13.343');
INSERT INTO `wms_rack` VALUES (97, '2', '22', 159, 171, '2', 1, 115, '2023-03-13 16:37:38.000', 115, '2023-04-03 17:31:52.624');
INSERT INTO `wms_rack` VALUES (98, '011', '1111', 148, 137, NULL, 1, 115, '2023-03-14 14:12:30.467', NULL, NULL);
INSERT INTO `wms_rack` VALUES (99, '12321312', '1111', 151, 149, NULL, 1, 115, '2023-03-21 17:30:41.550', NULL, NULL);
INSERT INTO `wms_rack` VALUES (100, '3.22', '服装1-甲-架A', 152, 154, '20230322', 1, 115, '2023-03-22 15:48:55.511', NULL, NULL);
INSERT INTO `wms_rack` VALUES (101, '3.22-1', '服装1-甲-B', 152, 154, NULL, 1, 115, '2023-03-22 16:13:34.000', 115, '2023-04-10 11:18:50.543');
INSERT INTO `wms_rack` VALUES (102, 'HD-PC-01', '华东1库区1货架', 171, 155, NULL, 1, 115, '2023-03-22 22:48:59.000', 115, '2023-04-10 14:40:25.501');
INSERT INTO `wms_rack` VALUES (103, '001', NULL, 148, 137, NULL, 1, 115, '2023-03-23 14:06:51.654', NULL, NULL);
INSERT INTO `wms_rack` VALUES (104, '13511', 'fcl/T1/T2', 155, 161, 'fcl/T1/T2', 1, 115, '2023-03-25 00:02:16.842', NULL, NULL);
INSERT INTO `wms_rack` VALUES (105, '01', NULL, 157, 165, NULL, 1, 115, '2023-03-25 15:22:53.199', NULL, NULL);
INSERT INTO `wms_rack` VALUES (106, '033123', '033123', 158, 167, NULL, 1, 115, '2023-03-27 13:44:41.522', NULL, NULL);
INSERT INTO `wms_rack` VALUES (107, '11', '器材库', 155, 139, '体育器材', 1, 115, '2023-03-28 08:49:32.000', 115, '2023-04-08 10:06:15.357');
INSERT INTO `wms_rack` VALUES (108, 'hj-01', '货架1', 159, 171, NULL, 1, 115, '2023-03-29 13:33:25.000', 115, '2023-03-29 13:33:50.306');
INSERT INTO `wms_rack` VALUES (109, '444', 'test', 155, 139, NULL, 1, 115, '2023-03-30 18:20:26.751', NULL, NULL);
INSERT INTO `wms_rack` VALUES (110, '笔', '笔', 160, 138, NULL, 1, 115, '2023-03-30 18:22:04.840', NULL, NULL);
INSERT INTO `wms_rack` VALUES (111, '301', '301', 162, 174, NULL, 1, 115, '2023-04-01 06:32:08.122', NULL, NULL);
INSERT INTO `wms_rack` VALUES (112, '大内密探003', '我是货架', 168, 181, '大内密探003', 1, 115, '2023-04-06 14:06:40.000', 115, '2023-04-06 14:08:08.795');
INSERT INTO `wms_rack` VALUES (113, 'one-1-1', 'yyf的仓库的库区的货架', 169, 184, 'yyf', 1, 115, '2023-04-06 14:59:11.708', NULL, NULL);
INSERT INTO `wms_rack` VALUES (114, '800', '肉类', 170, 185, NULL, 1, 115, '2023-04-06 22:42:40.678', NULL, NULL);
INSERT INTO `wms_rack` VALUES (115, 'T02-01', 'test02库区1号货架', 176, 178, 'hentai', 1, 115, '2023-04-11 09:10:05.000', 115, '2023-04-11 09:22:56.680');
INSERT INTO `wms_rack` VALUES (116, '1000011', '1号货架', 178, 192, NULL, 1, 115, '2023-04-13 10:13:32.000', 115, '2023-04-13 14:06:05.035');
INSERT INTO `wms_rack` VALUES (117, '1000032', '1232114货架', 181, 194, NULL, 0, 115, '2023-04-13 10:13:49.000', 115, '2023-04-25 17:31:17.857');
INSERT INTO `wms_rack` VALUES (118, '1231231', '111233货架', 181, 194, NULL, 0, 115, '2023-04-13 10:14:17.000', 115, '2023-04-13 10:14:46.451');
INSERT INTO `wms_rack` VALUES (119, '1234567', '232323货架', 182, 195, NULL, 0, 115, '2023-04-13 10:15:01.923', NULL, NULL);
INSERT INTO `wms_rack` VALUES (120, '1388799', '1231231货架', 183, 196, NULL, 1, 115, '2023-04-13 10:15:18.452', NULL, NULL);
INSERT INTO `wms_rack` VALUES (121, '1231456', '758748货架', 182, 195, NULL, 0, 115, '2023-04-13 10:16:32.000', 115, '2023-04-22 21:07:41.581');
INSERT INTO `wms_rack` VALUES (122, '7657364', '163636货架', 185, 198, NULL, 0, 115, '2023-04-13 10:16:46.660', NULL, NULL);
INSERT INTO `wms_rack` VALUES (123, '1765654', '1728371货架', 186, 199, NULL, 0, 115, '2023-04-13 10:17:04.083', NULL, NULL);
INSERT INTO `wms_rack` VALUES (124, '1000012', '2号货架', 185, 198, NULL, 0, 115, '2023-04-13 14:06:46.000', 115, '2023-04-20 08:46:09.744');
INSERT INTO `wms_rack` VALUES (125, '3500549', '小件架', 187, 204, '25m*3m*3m三层架', 0, 115, '2023-04-18 16:05:23.509', NULL, NULL);
INSERT INTO `wms_rack` VALUES (126, '11', NULL, 188, 210, NULL, 0, 115, '2023-04-20 11:30:30.846', NULL, NULL);
INSERT INTO `wms_rack` VALUES (127, '001', '货架1', 189, 215, NULL, 0, 115, '2023-04-24 15:33:36.867', NULL, NULL);

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
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 626 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '入库单' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wms_receipt_order
-- ----------------------------
INSERT INTO `wms_receipt_order` VALUES (1, '1', 3, 1, '112', NULL, 0, '222', 1, NULL, '2022-08-13 13:51:29.000', 1, '2022-09-07 16:33:49.108');
INSERT INTO `wms_receipt_order` VALUES (2, NULL, 1, 11, '11', NULL, 0, NULL, 1, 1, '2022-08-23 17:37:34.232', NULL, NULL);
INSERT INTO `wms_receipt_order` VALUES (3, NULL, 1, 1, 'q', NULL, 0, NULL, 1, 1, '2022-08-30 19:36:47.983', NULL, NULL);
INSERT INTO `wms_receipt_order` VALUES (4, NULL, 3, NULL, '1111', NULL, 0, NULL, 1, 1, '2022-08-30 19:37:30.517', NULL, NULL);
INSERT INTO `wms_receipt_order` VALUES (5, 'R-20220901194301-2303', 1, 1, '20220901-1234234123423', NULL, 0, '采购入库', 1, 1, '2022-09-01 19:43:56.000', 115, '2022-11-06 00:16:48.482');
INSERT INTO `wms_receipt_order` VALUES (6, 'R-20220901194936-0377', 1, 1, '20220901-15645132132', NULL, 0, '采购', 1, 1, '2022-09-01 19:50:04.000', 115, '2022-11-06 00:16:52.436');
INSERT INTO `wms_receipt_order` VALUES (7, 'R-20220901200200-7813', 1, 1, '20220901-12346598321354', NULL, 0, '测试', 1, 1, '2022-09-01 20:03:35.000', 1, '2022-10-11 14:52:27.764');
INSERT INTO `wms_receipt_order` VALUES (8, 'R-20220901200359-3039', 1, 1, '20220901-123456789', NULL, 2, 'test', 1, 1, '2022-09-01 20:04:22.000', 1, '2022-10-10 10:55:28.806');
INSERT INTO `wms_receipt_order` VALUES (9, 'R-2022-09-14-112215', 2, 1, '111222', NULL, 2, '11dfasdfdasfsdf中文', 1, 1, '2022-09-14 11:23:14.000', 1, '2022-10-09 15:13:27.901');
INSERT INTO `wms_receipt_order` VALUES (10, 'R-2022-10-10-162014', 1, 1, '1', NULL, 0, '2', 1, 1, '2022-10-10 16:20:22.282', NULL, NULL);
INSERT INTO `wms_receipt_order` VALUES (11, 'R-2022-10-10-220001', 1, 1, '20221010-1', NULL, 2, '测试没有物料', 1, 1, '2022-10-10 22:00:24.000', 1, '2022-10-10 22:52:53.910');
INSERT INTO `wms_receipt_order` VALUES (12, 'R-2022-10-10-225306', 1, 1, '20221010-2', NULL, 2, '测试入库', 1, 1, '2022-10-10 22:53:34.000', 1, '2022-10-10 23:05:14.209');
INSERT INTO `wms_receipt_order` VALUES (13, 'R-2022-10-10-231339', 1, 2, '20221010-3', NULL, 2, NULL, 1, 1, '2022-10-10 23:14:04.000', 1, '2022-11-03 17:48:36.779');
INSERT INTO `wms_receipt_order` VALUES (14, 'R-2022-10-20-143634', 1, NULL, NULL, NULL, 3, NULL, 1, 1, '2022-10-20 14:37:18.000', 115, '2022-11-08 17:14:51.948');
INSERT INTO `wms_receipt_order` VALUES (15, 'R-2022-11-06-155158', 1, 2, '1', NULL, 1, NULL, 1, 115, '2022-11-06 15:52:22.000', 115, '2022-11-09 11:36:54.441');
INSERT INTO `wms_receipt_order` VALUES (16, 'R-2022-11-06-210843', 1, 2, '1111', NULL, 2, '1111', 1, 115, '2022-11-06 21:09:18.000', 115, '2022-11-07 08:25:36.632');
INSERT INTO `wms_receipt_order` VALUES (17, 'R-2022-11-07-082418', 1, 2, NULL, NULL, 0, NULL, 1, 115, '2022-11-07 08:24:52.146', NULL, NULL);
INSERT INTO `wms_receipt_order` VALUES (18, 'R-2022-11-07-172648', 1, 1, NULL, NULL, 0, NULL, 1, 115, '2022-11-07 17:27:04.000', 115, '2022-11-08 09:10:00.495');
INSERT INTO `wms_receipt_order` VALUES (19, 'R-2022-11-07-214023', 1, 1, '0009', NULL, 3, NULL, 1, 115, '2022-11-07 21:41:19.000', 115, '2022-11-07 21:46:38.799');
INSERT INTO `wms_receipt_order` VALUES (20, 'R-2022-11-08-102247', 1, NULL, NULL, NULL, 0, NULL, 1, 115, '2022-11-08 10:22:59.884', NULL, NULL);
INSERT INTO `wms_receipt_order` VALUES (21, 'R-2022-11-09-115801', 3, 3, NULL, NULL, 0, NULL, 1, 115, '2022-11-09 11:58:22.094', NULL, NULL);
INSERT INTO `wms_receipt_order` VALUES (22, 'R-2022-11-09-145407', 1, 2, NULL, NULL, 3, NULL, 1, 115, '2022-11-09 14:55:02.000', 115, '2022-11-09 14:59:21.091');
INSERT INTO `wms_receipt_order` VALUES (23, 'R-2022-11-09-162100', 1, 1, '333', NULL, 3, 'ww', 1, 115, '2022-11-09 16:21:29.000', 115, '2022-11-09 18:32:26.350');
INSERT INTO `wms_receipt_order` VALUES (24, 'R-2022-11-09-162513', 1, 1, NULL, NULL, 0, NULL, 1, 115, '2022-11-09 16:25:23.063', NULL, NULL);
INSERT INTO `wms_receipt_order` VALUES (25, 'R-2022-11-09-183606', 3, NULL, NULL, NULL, 0, NULL, 1, 115, '2022-11-09 18:37:04.348', NULL, NULL);
INSERT INTO `wms_receipt_order` VALUES (26, 'R-2022-11-09-184059', 1, NULL, NULL, NULL, 0, NULL, 1, 115, '2022-11-09 18:41:17.246', NULL, NULL);
INSERT INTO `wms_receipt_order` VALUES (27, 'R-2022-11-10-094219', 1, 1, 'ioi08900909', NULL, 0, 'test', 1, 115, '2022-11-10 09:42:35.452', NULL, NULL);
INSERT INTO `wms_receipt_order` VALUES (28, 'R-2022-11-10-135511', 1, NULL, NULL, NULL, 0, NULL, 1, 115, '2022-11-10 13:55:37.000', 115, '2022-11-10 21:17:03.608');
INSERT INTO `wms_receipt_order` VALUES (29, 'R-2022-11-11-160624', 1, 2, '这是手动输入的订单号', NULL, 3, '这是备注，要求100字之内', 1, 115, '2022-11-11 16:07:37.000', 115, '2022-11-11 16:24:29.164');
INSERT INTO `wms_receipt_order` VALUES (30, 'R-2022-11-11-163005', 1, 3, '1321213213123', NULL, 0, NULL, 1, 115, '2022-11-11 16:30:45.663', NULL, NULL);
INSERT INTO `wms_receipt_order` VALUES (31, 'R-2022-11-11-171713', 1, 4, 'ShuiGuo', NULL, 3, 'This is ShuiGuo', 1, 115, '2022-11-11 17:18:19.000', 115, '2022-11-13 17:14:45.564');
INSERT INTO `wms_receipt_order` VALUES (32, 'R-2022-11-13-171809', 1, 1, 'DD001', NULL, 0, NULL, 1, 115, '2022-11-13 17:30:42.793', NULL, NULL);
INSERT INTO `wms_receipt_order` VALUES (33, 'R-2022-11-13-173203', 2, 1, '173203', NULL, 3, '173203', 1, 115, '2022-11-13 17:32:35.000', 115, '2022-11-13 17:33:50.693');
INSERT INTO `wms_receipt_order` VALUES (34, 'R-2022-11-13-173926', 1, NULL, NULL, NULL, 0, NULL, 1, 115, '2022-11-13 17:39:37.243', NULL, NULL);
INSERT INTO `wms_receipt_order` VALUES (35, 'R-2022-11-13-174117', 1, 1, '11', NULL, 2, '11', 1, 115, '2022-11-13 17:41:27.000', 115, '2022-11-13 17:41:54.881');
INSERT INTO `wms_receipt_order` VALUES (36, 'R-2022-11-13-174258', 1, 2, NULL, NULL, 2, NULL, 1, 115, '2022-11-13 17:43:06.000', 115, '2022-11-13 21:02:33.763');
INSERT INTO `wms_receipt_order` VALUES (37, 'R-2022-11-14-044038', 1, 1, NULL, NULL, 1, NULL, 1, 115, '2022-11-14 04:41:23.000', 115, '2022-11-14 16:45:52.290');
INSERT INTO `wms_receipt_order` VALUES (38, 'R-2022-11-14-133808', 1, NULL, NULL, NULL, 1, NULL, 1, 115, '2022-11-14 13:38:25.000', 115, '2022-11-14 16:46:51.725');
INSERT INTO `wms_receipt_order` VALUES (39, 'R-2022-11-14-164413', 3, 1, NULL, NULL, 0, NULL, 1, 115, '2022-11-14 16:44:47.703', NULL, NULL);
INSERT INTO `wms_receipt_order` VALUES (40, 'R-2022-11-14-173247', 1, 1, 'hhj', NULL, 1, NULL, 1, 115, '2022-11-14 17:33:06.000', 115, '2022-11-14 17:33:30.838');
INSERT INTO `wms_receipt_order` VALUES (41, 'R-2022-11-14-231535', 1, 1, NULL, NULL, 0, NULL, 1, 115, '2022-11-14 23:16:05.420', NULL, NULL);
INSERT INTO `wms_receipt_order` VALUES (42, 'R-2022-11-15-163458', 1, 1, '123213132', NULL, 3, '123213', 1, 115, '2022-11-15 16:35:23.000', 115, '2022-11-15 16:42:56.246');
INSERT INTO `wms_receipt_order` VALUES (43, 'R-2022-11-15-214714', 1, NULL, NULL, NULL, 0, NULL, 1, 115, '2022-11-15 21:47:54.000', 115, '2022-11-15 21:48:08.429');
INSERT INTO `wms_receipt_order` VALUES (44, 'R-2022-11-16-142759', 1, 1, '124568623', NULL, 2, NULL, 1, 115, '2022-11-16 14:28:56.000', 115, '2022-11-18 09:11:43.841');
INSERT INTO `wms_receipt_order` VALUES (45, 'R-2022-11-16-150215', 1, 2, '123227', NULL, 0, NULL, 1, 115, '2022-11-16 15:03:17.052', NULL, NULL);
INSERT INTO `wms_receipt_order` VALUES (46, 'R-2022-11-17-044529', 1, 1, NULL, NULL, 0, NULL, 1, 115, '2022-11-17 04:45:44.513', NULL, NULL);
INSERT INTO `wms_receipt_order` VALUES (47, 'R-2022-11-17-095500', 1, NULL, '1', NULL, 1, '1', 1, 115, '2022-11-17 10:19:27.000', 115, '2022-11-17 11:05:36.735');
INSERT INTO `wms_receipt_order` VALUES (48, 'R-2022-11-17-161938', 1, 1, 'AAAAAAAAAAAA', NULL, 3, NULL, 1, 115, '2022-11-17 16:20:00.000', 115, '2022-11-17 16:21:05.955');
INSERT INTO `wms_receipt_order` VALUES (49, 'R-2022-11-17-214945', 1, 1, '2344444444444', NULL, 0, '23444444', 1, 115, '2022-11-17 21:49:59.713', NULL, NULL);
INSERT INTO `wms_receipt_order` VALUES (50, 'R-2022-11-18-105642', 3, NULL, NULL, NULL, 3, NULL, 1, 115, '2022-11-18 10:55:30.000', 115, '2022-11-18 11:09:13.229');
INSERT INTO `wms_receipt_order` VALUES (51, 'R-2022-11-18-160100', 1, 1, 'kkk', NULL, 0, 'kkk', 1, 115, '2022-11-18 16:01:28.842', NULL, NULL);
INSERT INTO `wms_receipt_order` VALUES (52, 'R-2022-11-19-003105', 3, 1, NULL, NULL, 0, NULL, 1, 115, '2022-11-19 00:31:41.000', 115, '2022-11-21 09:23:36.650');
INSERT INTO `wms_receipt_order` VALUES (53, 'R-2022-11-19-181712', 1, NULL, '111', NULL, 3, '11', 1, 115, '2022-11-19 18:17:31.000', 115, '2022-11-20 15:01:21.765');
INSERT INTO `wms_receipt_order` VALUES (54, 'R-2022-11-20-085034', 1, 1, 'AOE2022112001', NULL, 3, 'TEST', 1, 115, '2022-11-20 08:51:03.000', 115, '2022-11-20 08:54:13.817');
INSERT INTO `wms_receipt_order` VALUES (55, 'R-2022-11-20-085105', 1, 2, 'AOE2022112002', NULL, 3, 'TEST', 1, 115, '2022-11-20 08:51:28.000', 115, '2022-11-21 09:22:23.261');
INSERT INTO `wms_receipt_order` VALUES (56, 'R-2022-11-20-143243', 1, 1, 'test', NULL, 3, NULL, 1, 115, '2022-11-20 14:33:09.000', 115, '2022-11-20 14:33:49.506');
INSERT INTO `wms_receipt_order` VALUES (57, 'R-2022-11-20-151009', 1, 2, 'r001', NULL, 3, NULL, 1, 115, '2022-11-20 15:10:38.000', 115, '2022-11-20 15:11:18.674');
INSERT INTO `wms_receipt_order` VALUES (58, 'R-2022-11-20-161037', 1, 3, NULL, NULL, 0, NULL, 1, 115, '2022-11-20 16:17:02.089', NULL, NULL);
INSERT INTO `wms_receipt_order` VALUES (59, 'R-2022-11-21-100130', 1, 1, '11', NULL, 0, NULL, 1, 115, '2022-11-21 10:02:28.000', 115, '2022-11-21 11:12:53.287');
INSERT INTO `wms_receipt_order` VALUES (60, 'R-2022-11-21-130247', 1, 1, '5555', NULL, 0, NULL, 1, 115, '2022-11-21 13:03:40.530', NULL, NULL);
INSERT INTO `wms_receipt_order` VALUES (61, 'R-2022-11-21-165653', 1, 2, NULL, NULL, 0, NULL, 1, 115, '2022-11-21 16:57:51.000', 115, '2022-11-22 08:26:58.481');
INSERT INTO `wms_receipt_order` VALUES (62, 'R-2022-11-22-085427', 1, 1, NULL, NULL, NULL, NULL, 1, 115, '2022-11-22 08:55:01.000', 115, '2022-11-22 15:54:09.965');
INSERT INTO `wms_receipt_order` VALUES (63, 'R-2022-11-22-095059', 3, 2, NULL, NULL, NULL, NULL, 1, 115, '2022-11-22 09:53:21.000', 115, '2022-11-23 08:27:33.480');
INSERT INTO `wms_receipt_order` VALUES (64, 'R-2022-11-22-160335', 1, NULL, NULL, NULL, 2, NULL, 1, 115, '2022-11-22 16:04:10.000', 115, '2022-11-23 08:32:03.133');
INSERT INTO `wms_receipt_order` VALUES (65, 'R-2022-11-22-185924', 1, 1, NULL, NULL, 1, NULL, 1, 115, '2022-11-22 18:59:50.000', 115, '2022-11-23 08:24:54.495');
INSERT INTO `wms_receipt_order` VALUES (66, 'R-2022-11-22-193351', 1, 1, NULL, NULL, 2, NULL, 1, 115, '2022-11-22 19:34:27.000', 115, '2022-11-23 08:24:32.988');
INSERT INTO `wms_receipt_order` VALUES (67, 'R-2022-11-22-210900', 1, 3, '1', NULL, 3, '1', 1, 115, '2022-11-22 21:09:29.000', 115, '2022-11-23 08:23:21.479');
INSERT INTO `wms_receipt_order` VALUES (68, 'R-2022-11-23-082836', 2, 4, '6666', NULL, 2, NULL, 1, 115, '2022-11-23 08:28:54.000', 115, '2022-11-23 08:29:54.400');
INSERT INTO `wms_receipt_order` VALUES (69, 'R-2022-11-23-083205', 1, 3, '212131221', NULL, 3, NULL, 1, 115, '2022-11-23 08:32:37.000', 115, '2022-11-23 08:35:25.058');
INSERT INTO `wms_receipt_order` VALUES (70, 'R-2022-11-23-095554', 3, NULL, NULL, NULL, 3, NULL, 1, 115, '2022-11-23 09:56:13.000', 115, '2022-11-23 14:26:06.024');
INSERT INTO `wms_receipt_order` VALUES (71, 'R-2022-11-23-105344', 2, 1, '111', NULL, 0, NULL, 1, 115, '2022-11-23 10:53:57.000', 115, '2022-11-25 20:30:19.746');
INSERT INTO `wms_receipt_order` VALUES (72, 'R-2022-11-23-135005', 1, NULL, NULL, NULL, 3, NULL, 1, 115, '2022-11-23 13:50:31.000', 115, '2022-11-23 13:50:47.983');
INSERT INTO `wms_receipt_order` VALUES (73, 'R-2022-11-23-135109', 1, NULL, NULL, NULL, 0, NULL, 1, 115, '2022-11-23 13:51:52.843', NULL, NULL);
INSERT INTO `wms_receipt_order` VALUES (74, 'R-2022-11-23-151739', 1, NULL, NULL, NULL, 0, NULL, 1, 115, '2022-11-23 15:18:01.534', NULL, NULL);
INSERT INTO `wms_receipt_order` VALUES (75, 'R-2022-11-23-152548', 1, 1, NULL, NULL, 3, NULL, 1, 115, '2022-11-23 15:27:33.000', 115, '2022-11-23 15:28:22.126');
INSERT INTO `wms_receipt_order` VALUES (76, 'R-2022-11-24-110018', 1, NULL, NULL, NULL, 0, NULL, 1, 115, '2022-11-24 11:00:39.000', 115, '2022-11-24 11:00:48.965');
INSERT INTO `wms_receipt_order` VALUES (77, 'R-2022-11-24-114225', 2, 1, 'fafasfasfa', NULL, 0, 'afasfa', 1, 115, '2022-11-24 11:42:54.000', 115, '2022-11-25 20:27:31.251');
INSERT INTO `wms_receipt_order` VALUES (78, 'R-2022-11-25-103742', 1, 1, NULL, NULL, 3, NULL, 1, 115, '2022-11-25 10:38:14.000', 115, '2022-11-25 10:39:13.688');
INSERT INTO `wms_receipt_order` VALUES (79, 'R-2022-11-25-161122', 3, 1, '1234', NULL, 2, NULL, 1, 115, '2022-11-25 16:12:59.000', 1, '2022-12-01 11:16:52.910');
INSERT INTO `wms_receipt_order` VALUES (80, 'R-2022-11-25-213433', 1, 1, '1321353535', NULL, 0, '434', 1, 115, '2022-11-25 21:35:06.550', NULL, NULL);
INSERT INTO `wms_receipt_order` VALUES (81, 'R-2022-11-25-215548', 1, NULL, NULL, NULL, 0, NULL, 1, 115, '2022-11-25 21:57:22.649', NULL, NULL);
INSERT INTO `wms_receipt_order` VALUES (82, 'R-2022-11-25-223717', 1, 1, NULL, NULL, 0, NULL, 1, 115, '2022-11-25 22:41:33.796', NULL, NULL);
INSERT INTO `wms_receipt_order` VALUES (83, 'R-2022-11-27-183631', 1, 2, NULL, NULL, 0, NULL, 1, 115, '2022-11-27 18:36:52.347', NULL, NULL);
INSERT INTO `wms_receipt_order` VALUES (84, 'R-2022-11-27-205257', 2, 3, NULL, NULL, 0, NULL, 1, 115, '2022-11-27 20:53:45.118', NULL, NULL);
INSERT INTO `wms_receipt_order` VALUES (85, 'R-2022-11-27-212921', 1, NULL, NULL, NULL, 0, NULL, 1, 115, '2022-11-27 21:29:25.297', NULL, NULL);
INSERT INTO `wms_receipt_order` VALUES (86, 'R-2022-11-27-232649', 1, 3, '100022444', NULL, 3, '加急', 1, 115, '2022-11-27 23:29:47.000', 115, '2022-12-05 14:06:42.921');
INSERT INTO `wms_receipt_order` VALUES (87, 'R-2022-11-28-091735', 1, NULL, NULL, NULL, 0, NULL, 1, 115, '2022-11-28 09:19:02.000', 115, '2022-11-28 12:58:29.773');
INSERT INTO `wms_receipt_order` VALUES (88, 'R-2022-11-28-163455', 1, 1, '1121', NULL, 0, NULL, 1, 115, '2022-11-28 16:35:20.911', NULL, NULL);
INSERT INTO `wms_receipt_order` VALUES (89, 'R-2022-11-28-211705', 1, 1, '321312321', NULL, 3, NULL, 1, 115, '2022-11-28 21:18:54.000', 115, '2022-11-28 21:19:12.601');
INSERT INTO `wms_receipt_order` VALUES (90, 'R-2022-11-29-115854', 1, NULL, NULL, NULL, 0, NULL, 1, 115, '2022-11-29 11:59:42.437', NULL, NULL);
INSERT INTO `wms_receipt_order` VALUES (91, 'R-2022-11-29-192052', 2, 2, NULL, NULL, 3, NULL, 1, 115, '2022-11-29 19:21:12.000', 115, '2022-11-29 19:22:38.349');
INSERT INTO `wms_receipt_order` VALUES (92, 'R-2022-11-30-112042', 3, 3, NULL, NULL, 0, NULL, 1, 115, '2022-11-30 11:22:07.440', NULL, NULL);
INSERT INTO `wms_receipt_order` VALUES (93, 'R-2022-11-30-142507', 1, NULL, NULL, NULL, 3, NULL, 1, 115, '2022-11-30 14:25:31.000', 115, '2022-11-30 14:25:42.856');
INSERT INTO `wms_receipt_order` VALUES (94, 'R-2022-11-30-143847', 1, 3, NULL, NULL, 3, NULL, 1, 115, '2022-11-30 14:39:14.000', 1, '2022-12-01 11:08:39.941');
INSERT INTO `wms_receipt_order` VALUES (95, 'R-2022-12-01-095315', 1, 1, '23', NULL, 0, '123', 1, 115, '2022-12-01 09:53:55.268', NULL, NULL);
INSERT INTO `wms_receipt_order` VALUES (96, 'R-2022-12-01-095454', 1, 1, '123', NULL, 3, '1231', 1, 115, '2022-12-01 09:55:33.000', 1, '2022-12-01 10:53:10.851');
INSERT INTO `wms_receipt_order` VALUES (97, 'R-2022-12-01-110349', 1, 1, '47328472934-23123', NULL, 3, '德的', 1, 1, '2022-12-01 11:04:18.000', 115, '2022-12-01 14:02:53.412');
INSERT INTO `wms_receipt_order` VALUES (98, 'R-2022-12-02-143311', 1, 3, '111111111', NULL, 3, NULL, 1, 115, '2022-12-02 14:33:30.000', 115, '2022-12-05 14:06:20.949');
INSERT INTO `wms_receipt_order` VALUES (99, 'R-2022-12-02-143356', 1, 4, NULL, NULL, 3, NULL, 1, 115, '2022-12-02 14:34:08.000', 115, '2022-12-02 14:34:58.512');
INSERT INTO `wms_receipt_order` VALUES (100, 'R-2022-12-02-184125', 1, 4, '1234567', NULL, 0, NULL, 1, 115, '2022-12-02 18:41:58.750', NULL, NULL);
INSERT INTO `wms_receipt_order` VALUES (101, 'R-2022-12-03-082459', 1, 1, '111', NULL, 3, NULL, 1, 115, '2022-12-03 08:25:18.000', 115, '2022-12-03 08:28:10.442');
INSERT INTO `wms_receipt_order` VALUES (102, 'R-2022-12-03-084615', 1, 1, '123', NULL, 3, NULL, 1, 115, '2022-12-03 08:46:36.000', 115, '2022-12-03 08:46:58.339');
INSERT INTO `wms_receipt_order` VALUES (103, 'R-2022-12-03-142143', 1, 5, '1', NULL, 0, '123', 1, 115, '2022-12-03 14:22:42.689', NULL, NULL);
INSERT INTO `wms_receipt_order` VALUES (104, 'R-2022-12-05-112849', 1, NULL, NULL, NULL, 0, NULL, 1, 115, '2022-12-05 11:29:47.030', NULL, NULL);
INSERT INTO `wms_receipt_order` VALUES (105, 'R-2022-12-05-160213', 1, 6, NULL, NULL, 3, NULL, 1, 115, '2022-12-05 16:03:28.000', 115, '2022-12-06 00:01:25.575');
INSERT INTO `wms_receipt_order` VALUES (106, 'R-2022-12-06-000217', 1, 6, NULL, NULL, 3, NULL, 1, 115, '2022-12-06 00:03:16.000', 115, '2022-12-08 10:31:09.697');
INSERT INTO `wms_receipt_order` VALUES (107, 'R-2022-12-06-095539', 1, 6, NULL, NULL, 3, NULL, 1, 115, '2022-12-06 09:57:23.000', 115, '2022-12-06 13:52:32.581');
INSERT INTO `wms_receipt_order` VALUES (108, 'R-2022-12-06-135307', 1, 6, NULL, NULL, 0, NULL, 1, 115, '2022-12-06 13:53:38.115', NULL, NULL);
INSERT INTO `wms_receipt_order` VALUES (109, 'R-2022-12-06-151007', 1, 6, NULL, NULL, 0, NULL, 1, 115, '2022-12-06 15:10:14.000', 115, '2022-12-07 12:32:06.047');
INSERT INTO `wms_receipt_order` VALUES (110, 'R-2022-12-07-091540', 1, NULL, NULL, NULL, 3, NULL, 1, 115, '2022-12-07 09:16:12.000', 115, '2022-12-07 15:24:48.445');
INSERT INTO `wms_receipt_order` VALUES (111, 'R-2022-12-07-152237', 1, NULL, NULL, NULL, 3, NULL, 1, 115, '2022-12-07 15:22:47.000', 115, '2022-12-08 15:13:32.683');
INSERT INTO `wms_receipt_order` VALUES (112, 'R-2022-12-07-222610', 3, 6, NULL, NULL, 0, NULL, 1, 115, '2022-12-07 22:26:54.000', 115, '2022-12-07 22:27:14.461');
INSERT INTO `wms_receipt_order` VALUES (113, 'R-2022-12-08-201519', 1, 6, NULL, NULL, 0, NULL, 1, 115, '2022-12-08 20:15:46.403', NULL, NULL);
INSERT INTO `wms_receipt_order` VALUES (114, 'R-2022-12-09-162525', 1, 6, '141', NULL, 0, '11', 1, 115, '2022-12-09 16:26:03.000', 115, '2022-12-09 16:26:36.063');
INSERT INTO `wms_receipt_order` VALUES (115, 'R-2022-12-10-153102', 1, NULL, NULL, NULL, 3, NULL, 1, 115, '2022-12-10 15:30:12.000', 115, '2022-12-10 15:31:02.911');
INSERT INTO `wms_receipt_order` VALUES (116, 'R-2022-12-10-170006', 1, 7, '111', NULL, 3, '22222', 1, 115, '2022-12-10 17:00:26.000', 115, '2022-12-10 17:01:54.566');
INSERT INTO `wms_receipt_order` VALUES (117, 'R-2022-12-10-170553', 1, 7, '123123123', NULL, 0, '123123123123123', 1, 115, '2022-12-10 17:06:40.453', NULL, NULL);
INSERT INTO `wms_receipt_order` VALUES (118, 'R-2022-12-12-131028', 1, 7, NULL, NULL, 0, NULL, 1, 115, '2022-12-12 13:11:10.893', NULL, NULL);
INSERT INTO `wms_receipt_order` VALUES (119, 'R-2022-12-12-131511', 1, NULL, NULL, NULL, 3, NULL, 1, 115, '2022-12-12 13:15:23.000', 115, '2022-12-12 13:16:36.893');
INSERT INTO `wms_receipt_order` VALUES (120, 'R-2022-12-12-162038', 1, 7, NULL, NULL, 0, '1', 1, 115, '2022-12-12 16:24:44.008', NULL, NULL);
INSERT INTO `wms_receipt_order` VALUES (121, 'R-2022-12-13-110343', 1, 7, NULL, NULL, 0, NULL, 1, 115, '2022-12-13 11:04:04.351', NULL, NULL);
INSERT INTO `wms_receipt_order` VALUES (122, 'R-2022-12-13-130618', 1, 7, NULL, NULL, 0, NULL, 1, 115, '2022-12-13 13:06:57.675', NULL, NULL);
INSERT INTO `wms_receipt_order` VALUES (123, 'R-2022-12-13-153253', 2, 7, NULL, NULL, 0, NULL, 1, 115, '2022-12-13 15:33:35.952', NULL, NULL);
INSERT INTO `wms_receipt_order` VALUES (124, 'R-2022-12-13-163358', 1, 8, '12', NULL, 0, '12', 1, 115, '2022-12-13 16:34:03.127', NULL, NULL);
INSERT INTO `wms_receipt_order` VALUES (125, 'R-2022-12-13-223220', 1, NULL, NULL, NULL, 0, NULL, 1, 115, '2022-12-13 22:33:37.891', NULL, NULL);
INSERT INTO `wms_receipt_order` VALUES (126, 'R-2022-12-14-011434', 1, 7, '想啊的说法', NULL, 1, '啊说的啊', 1, 115, '2022-12-14 01:15:22.000', 115, '2022-12-15 14:48:18.266');
INSERT INTO `wms_receipt_order` VALUES (127, 'R-2022-12-15-105247', 1, 8, NULL, NULL, 0, NULL, 1, 115, '2022-12-15 10:54:49.677', NULL, NULL);
INSERT INTO `wms_receipt_order` VALUES (128, 'R-2022-12-15-153715', 1, NULL, NULL, NULL, 0, NULL, 1, 115, '2022-12-15 15:37:18.383', NULL, NULL);
INSERT INTO `wms_receipt_order` VALUES (129, 'R-2022-12-17-173642', 1, NULL, NULL, NULL, 0, NULL, 1, 115, '2022-12-17 17:36:48.522', NULL, NULL);
INSERT INTO `wms_receipt_order` VALUES (130, 'R-2022-12-18-173632', 1, 7, 'CP-00001', NULL, 3, '成品', 1, 115, '2022-12-18 17:37:42.000', 115, '2022-12-20 17:27:22.313');
INSERT INTO `wms_receipt_order` VALUES (131, 'R-2022-12-19-134621', 1, 7, '1111122222222', NULL, 0, 'test', 1, 115, '2022-12-19 13:47:16.000', 115, '2022-12-20 10:37:58.279');
INSERT INTO `wms_receipt_order` VALUES (132, 'R-2022-12-19-173728', 1, 7, '12345', NULL, 0, '123123', 1, 115, '2022-12-19 17:37:35.785', NULL, NULL);
INSERT INTO `wms_receipt_order` VALUES (133, 'R-2022-12-20-173920', 1, NULL, NULL, NULL, 2, NULL, 1, 115, '2022-12-20 17:39:26.000', 115, '2022-12-20 17:40:38.952');
INSERT INTO `wms_receipt_order` VALUES (134, 'R-2022-12-20-174152', 1, NULL, NULL, NULL, 0, NULL, 1, 115, '2022-12-20 17:41:48.685', NULL, NULL);
INSERT INTO `wms_receipt_order` VALUES (135, 'R-2022-12-20-174202', 1, NULL, NULL, NULL, 3, NULL, 1, 115, '2022-12-20 17:42:15.000', 115, '2022-12-20 17:42:42.506');
INSERT INTO `wms_receipt_order` VALUES (136, 'R-2022-12-20-174514', 1, NULL, NULL, NULL, 3, NULL, 1, 115, '2022-12-20 17:45:24.000', 115, '2022-12-20 17:45:45.242');
INSERT INTO `wms_receipt_order` VALUES (137, 'R-2022-12-20-175601', 1, NULL, NULL, NULL, 3, NULL, 1, 115, '2022-12-20 17:56:04.000', 115, '2022-12-20 17:58:54.541');
INSERT INTO `wms_receipt_order` VALUES (138, 'R-2022-12-20-175924', 1, NULL, NULL, NULL, 3, NULL, 1, 115, '2022-12-20 17:59:26.000', 115, '2022-12-20 18:00:33.724');
INSERT INTO `wms_receipt_order` VALUES (139, 'R-2022-12-21-161118', 1, 7, NULL, NULL, 3, NULL, 1, 115, '2022-12-21 16:11:01.000', 115, '2022-12-21 16:11:48.941');
INSERT INTO `wms_receipt_order` VALUES (140, 'R-2022-12-21-163853', 1, 7, 'sd ', NULL, 0, 'sdf ', 1, 115, '2022-12-21 16:39:09.000', 115, '2022-12-21 16:39:16.583');
INSERT INTO `wms_receipt_order` VALUES (141, 'R-2022-12-22-091343', 1, 8, NULL, NULL, 0, NULL, 1, 115, '2022-12-22 09:14:27.906', NULL, NULL);
INSERT INTO `wms_receipt_order` VALUES (142, 'R-2022-12-22-093747', 1, 7, NULL, NULL, 0, NULL, 1, 115, '2022-12-22 09:38:58.368', NULL, NULL);
INSERT INTO `wms_receipt_order` VALUES (143, 'R-2022-12-22-123510', 1, NULL, NULL, NULL, 3, NULL, 1, 115, '2022-12-22 12:35:41.000', 115, '2022-12-22 12:35:50.471');
INSERT INTO `wms_receipt_order` VALUES (144, 'R-2022-12-24-104201', 1, NULL, NULL, NULL, 2, NULL, 1, 115, '2022-12-24 10:43:08.000', 115, '2022-12-28 16:41:46.928');
INSERT INTO `wms_receipt_order` VALUES (145, 'R-2022-12-27-153240', 1, 7, NULL, NULL, 3, NULL, 1, 115, '2022-12-27 15:33:13.000', 115, '2022-12-27 15:33:46.679');
INSERT INTO `wms_receipt_order` VALUES (146, 'R-2022-12-27-181817', 1, 7, NULL, NULL, 1, NULL, 1, 115, '2022-12-27 18:18:40.000', 115, '2022-12-28 17:09:35.986');
INSERT INTO `wms_receipt_order` VALUES (147, 'R-2022-12-28-113634', 1, 7, '0001', NULL, 3, NULL, 1, 115, '2022-12-28 11:37:20.000', 115, '2022-12-28 11:39:15.161');
INSERT INTO `wms_receipt_order` VALUES (148, 'R-2022-12-28-170614', 1, 7, NULL, NULL, 3, NULL, 1, 115, '2022-12-28 17:07:18.000', 115, '2022-12-28 17:11:26.602');
INSERT INTO `wms_receipt_order` VALUES (149, 'R-2022-12-28-192529', 1, 7, NULL, NULL, 3, NULL, 1, 115, '2022-12-28 19:25:47.000', 115, '2022-12-28 19:27:56.330');
INSERT INTO `wms_receipt_order` VALUES (150, 'R-2022-12-30-084812', 1, 7, NULL, NULL, 3, NULL, 1, 115, '2022-12-30 08:50:14.000', 115, '2022-12-30 13:47:44.794');
INSERT INTO `wms_receipt_order` VALUES (151, 'R-2023-01-01-183427', 1, 7, '111', NULL, 0, NULL, 1, 115, '2023-01-01 18:34:37.783', NULL, NULL);
INSERT INTO `wms_receipt_order` VALUES (152, 'R-2023-01-03-120801', 1, 7, '1', NULL, 3, NULL, 1, 115, '2023-01-03 12:08:59.000', 115, '2023-01-03 12:09:21.734');
INSERT INTO `wms_receipt_order` VALUES (153, 'R-2023-01-03-142236', 1, NULL, NULL, NULL, 0, NULL, 1, 115, '2023-01-03 14:33:56.000', 115, '2023-01-03 16:00:46.317');
INSERT INTO `wms_receipt_order` VALUES (154, 'R-2023-01-03-143406', 1, NULL, NULL, NULL, 0, NULL, 1, 115, '2023-01-03 14:47:47.436', NULL, NULL);
INSERT INTO `wms_receipt_order` VALUES (155, 'R-2023-01-04-102301', 1, 8, NULL, NULL, 0, NULL, 1, 115, '2023-01-04 10:23:39.853', NULL, NULL);
INSERT INTO `wms_receipt_order` VALUES (156, 'R-2023-01-04-193802', 1, 8, '202220', NULL, 3, NULL, 1, 115, '2023-01-04 19:43:00.000', 115, '2023-01-05 14:51:25.977');
INSERT INTO `wms_receipt_order` VALUES (157, 'R-2023-01-05-094605', 1, NULL, NULL, NULL, 3, NULL, 1, 115, '2023-01-05 10:05:07.000', 115, '2023-01-05 10:09:08.279');
INSERT INTO `wms_receipt_order` VALUES (158, 'R-2023-01-05-144925', 1, NULL, NULL, NULL, 0, NULL, 1, 115, '2023-01-05 14:49:44.000', 115, '2023-01-05 18:44:11.940');
INSERT INTO `wms_receipt_order` VALUES (159, 'R-2023-01-05-145200', 1, 10, NULL, NULL, 0, NULL, 1, 115, '2023-01-05 14:54:41.000', 115, '2023-01-05 16:43:42.802');
INSERT INTO `wms_receipt_order` VALUES (160, 'R-2023-01-05-182955', 1, 8, '222', NULL, 3, '222', 1, 115, '2023-01-05 18:30:05.000', 115, '2023-01-06 08:02:27.033');
INSERT INTO `wms_receipt_order` VALUES (161, 'R-2023-01-06-141746', 1, 8, '12312', NULL, 3, '4234', 1, 115, '2023-01-06 14:18:24.000', 115, '2023-01-06 14:18:47.113');
INSERT INTO `wms_receipt_order` VALUES (162, 'R-2023-01-06-165731', 1, 11, '01', NULL, 3, NULL, 1, 115, '2023-01-06 16:58:10.000', 115, '2023-01-06 16:58:27.119');
INSERT INTO `wms_receipt_order` VALUES (163, 'R-2023-01-07-101921', 3, 11, NULL, NULL, 0, NULL, 1, 115, '2023-01-07 10:19:58.393', NULL, NULL);
INSERT INTO `wms_receipt_order` VALUES (164, 'R-2023-01-07-140132', 1, 13, '1111', NULL, 3, '11111', 1, 115, '2023-01-07 14:13:36.000', 115, '2023-01-07 14:14:48.221');
INSERT INTO `wms_receipt_order` VALUES (165, 'R-2023-01-07-180904', 2, 11, NULL, NULL, 0, NULL, 1, 115, '2023-01-07 18:09:26.841', NULL, NULL);
INSERT INTO `wms_receipt_order` VALUES (166, 'R-2023-01-08-001506', 1, 11, NULL, NULL, 2, NULL, 1, 115, '2023-01-08 00:18:00.000', 115, '2023-01-08 00:19:53.261');
INSERT INTO `wms_receipt_order` VALUES (167, 'R-2023-01-08-091707', 1, 11, '1111111', NULL, 1, '测试', 1, 115, '2023-01-08 09:18:16.000', 115, '2023-01-08 09:18:45.452');
INSERT INTO `wms_receipt_order` VALUES (168, 'R-2023-01-08-095133', 3, 11, NULL, NULL, 0, NULL, 1, 115, '2023-01-08 09:52:29.732', NULL, NULL);
INSERT INTO `wms_receipt_order` VALUES (169, 'R-2023-01-09-001525', 1, 13, '1', NULL, 3, NULL, 1, 115, '2023-01-09 00:16:16.000', 115, '2023-01-09 00:17:19.218');
INSERT INTO `wms_receipt_order` VALUES (170, 'R-2023-01-09-001734', 2, 11, NULL, NULL, 3, NULL, 1, 115, '2023-01-09 00:18:10.000', 115, '2023-01-09 00:18:51.747');
INSERT INTO `wms_receipt_order` VALUES (171, 'R-2023-01-09-013310', 2, 11, NULL, NULL, 3, NULL, 1, 115, '2023-01-09 01:33:12.000', 115, '2023-01-09 01:35:41.360');
INSERT INTO `wms_receipt_order` VALUES (172, 'R-2023-01-09-015730', 1, 13, NULL, NULL, 3, NULL, 1, 115, '2023-01-09 02:09:05.000', 115, '2023-01-09 02:17:11.337');
INSERT INTO `wms_receipt_order` VALUES (173, 'R-2023-01-05-184724', 1, 11, '4123142343', NULL, 3, NULL, 1, 115, '2023-01-11 16:48:29.000', 115, '2023-01-11 16:49:13.038');
INSERT INTO `wms_receipt_order` VALUES (174, 'R-2023-01-11-204743', 1, 13, '1', NULL, 3, NULL, 1, 115, '2023-01-11 20:48:17.000', 115, '2023-01-11 20:49:04.515');
INSERT INTO `wms_receipt_order` VALUES (175, 'R-2023-01-12-093419', 1, 11, NULL, NULL, 0, NULL, 1, 115, '2023-01-12 09:37:31.998', NULL, NULL);
INSERT INTO `wms_receipt_order` VALUES (176, 'R-2023-01-12-101630', 1, NULL, NULL, NULL, 0, NULL, 1, 115, '2023-01-12 10:18:09.013', NULL, NULL);
INSERT INTO `wms_receipt_order` VALUES (177, 'R-2023-01-12-161713', 1, 11, '11112', NULL, 1, '222', 1, 115, '2023-01-12 16:17:26.000', 115, '2023-01-12 16:18:27.369');
INSERT INTO `wms_receipt_order` VALUES (178, 'R-2023-01-12-163907', 1, 11, '99999', NULL, 0, '9999', 1, 115, '2023-01-12 16:39:41.808', NULL, NULL);
INSERT INTO `wms_receipt_order` VALUES (179, 'R-2023-01-13-125142', 1, 11, '001', NULL, 3, NULL, 1, 115, '2023-01-13 12:52:14.000', 115, '2023-01-15 10:08:00.587');
INSERT INTO `wms_receipt_order` VALUES (180, 'R-2023-01-13-145817', 3, 11, '2023011301', NULL, 3, 'LD测试', 1, 115, '2023-01-13 14:58:46.000', 115, '2023-01-13 14:59:32.717');
INSERT INTO `wms_receipt_order` VALUES (181, 'R-2023-01-13-192556', 1, 11, '54325432', NULL, 3, NULL, 1, 115, '2023-01-13 19:26:19.000', 115, '2023-01-13 19:26:39.286');
INSERT INTO `wms_receipt_order` VALUES (182, 'R-2023-01-16-111325', 1, 11, '1111', NULL, 3, NULL, 1, 115, '2023-01-16 11:13:48.000', 115, '2023-01-16 11:15:08.508');
INSERT INTO `wms_receipt_order` VALUES (183, 'R-2023-01-16-111631', 1, 11, '1112222', NULL, 3, NULL, 1, 115, '2023-01-16 11:16:46.000', 115, '2023-01-16 11:17:07.440');
INSERT INTO `wms_receipt_order` VALUES (184, 'R-2023-01-16-112225', 3, 11, '222', NULL, 0, NULL, 1, 115, '2023-01-16 11:22:41.558', NULL, NULL);
INSERT INTO `wms_receipt_order` VALUES (185, 'R-2023-01-16-154102', 1, NULL, NULL, NULL, 0, NULL, 1, 115, '2023-01-16 15:41:29.948', NULL, NULL);
INSERT INTO `wms_receipt_order` VALUES (186, 'R-2023-01-17-103035', 1, 11, NULL, NULL, 3, NULL, 1, 115, '2023-01-17 10:30:49.000', 115, '2023-01-17 10:31:15.896');
INSERT INTO `wms_receipt_order` VALUES (187, 'R-2023-01-17-173949', 1, 13, '2222676767676767', NULL, 0, '2222', 1, 115, '2023-01-17 17:40:03.000', 115, '2023-01-17 20:22:47.298');
INSERT INTO `wms_receipt_order` VALUES (188, 'R-2023-01-18-135305', 1, NULL, NULL, NULL, 0, NULL, 1, 115, '2023-01-18 13:53:22.948', NULL, NULL);
INSERT INTO `wms_receipt_order` VALUES (189, 'R-2023-01-18-151227', 1, NULL, NULL, NULL, 3, NULL, 1, 115, '2023-01-18 15:12:54.000', 115, '2023-01-18 15:19:43.617');
INSERT INTO `wms_receipt_order` VALUES (190, 'R-2023-01-18-202856', 1, NULL, NULL, NULL, 0, NULL, 1, 115, '2023-01-18 20:28:59.902', NULL, NULL);
INSERT INTO `wms_receipt_order` VALUES (191, 'R-2023-01-21-121859', 3, 13, NULL, NULL, 3, NULL, 1, 115, '2023-01-21 12:19:25.000', 115, '2023-01-21 12:20:07.358');
INSERT INTO `wms_receipt_order` VALUES (192, 'R-2023-01-23-163252', 1, 11, '111111', NULL, 3, NULL, 1, 115, '2023-01-23 16:33:27.000', 115, '2023-01-23 16:33:55.430');
INSERT INTO `wms_receipt_order` VALUES (193, 'R-2023-01-23-200927', 1, 11, '234', NULL, 2, NULL, 1, 115, '2023-01-23 20:09:46.000', 115, '2023-01-24 17:01:09.692');
INSERT INTO `wms_receipt_order` VALUES (194, 'R-2023-01-25-151054', 1, 11, NULL, NULL, 2, NULL, 1, 115, '2023-01-25 15:11:41.000', 115, '2023-01-25 15:12:03.902');
INSERT INTO `wms_receipt_order` VALUES (195, 'R-2023-01-25-171956', 1, 11, NULL, NULL, 0, NULL, 1, 115, '2023-01-25 17:19:59.000', 115, '2023-01-25 17:20:31.562');
INSERT INTO `wms_receipt_order` VALUES (196, 'R-2023-01-25-172049', 1, 11, NULL, NULL, 3, NULL, 1, 115, '2023-01-25 17:21:27.000', 115, '2023-01-25 17:24:35.658');
INSERT INTO `wms_receipt_order` VALUES (197, 'R-2023-01-26-135630', 1, 13, NULL, NULL, 0, NULL, 1, 115, '2023-01-26 13:57:45.564', NULL, NULL);
INSERT INTO `wms_receipt_order` VALUES (198, 'R-2023-01-27-164443', 1, 11, '4645', NULL, 0, NULL, 1, 115, '2023-01-27 16:45:00.782', NULL, NULL);
INSERT INTO `wms_receipt_order` VALUES (199, 'R-2023-01-28-123935', 1, 11, NULL, NULL, 3, NULL, 1, 115, '2023-01-28 12:39:55.000', 115, '2023-01-28 12:40:38.313');
INSERT INTO `wms_receipt_order` VALUES (200, 'R-2023-01-28-162751', 1, NULL, NULL, NULL, 1, NULL, 1, 115, '2023-01-28 16:28:10.000', 115, '2023-01-29 16:21:53.642');
INSERT INTO `wms_receipt_order` VALUES (201, 'R-2023-01-29-103136', 1, 11, '3467189194948', NULL, 1, NULL, 1, 115, '2023-01-29 10:32:55.000', 115, '2023-01-30 09:50:41.209');
INSERT INTO `wms_receipt_order` VALUES (202, 'R-2023-01-29-154910', 3, NULL, 'aaa', NULL, 0, 'aaa', 1, 115, '2023-01-29 15:49:46.000', 115, '2023-01-29 15:51:35.735');
INSERT INTO `wms_receipt_order` VALUES (203, 'R-2023-01-29-202256', 3, NULL, NULL, NULL, 0, NULL, 1, 115, '2023-01-29 20:24:46.000', 115, '2023-01-30 11:33:31.235');
INSERT INTO `wms_receipt_order` VALUES (204, 'R-2023-01-30-135728', 1, NULL, NULL, NULL, 0, NULL, 1, 115, '2023-01-30 13:58:32.506', NULL, NULL);
INSERT INTO `wms_receipt_order` VALUES (205, 'R-2023-01-30-205256', 3, 11, NULL, NULL, 0, NULL, 1, 115, '2023-01-30 20:53:25.915', NULL, NULL);
INSERT INTO `wms_receipt_order` VALUES (206, 'R-2023-01-31-100621', 1, 11, NULL, NULL, 0, NULL, 1, 115, '2023-01-31 10:07:28.911', NULL, NULL);
INSERT INTO `wms_receipt_order` VALUES (207, 'R-2023-01-31-115302', 1, 11, NULL, NULL, 3, NULL, 1, 115, '2023-01-31 11:53:34.000', 115, '2023-01-31 11:54:08.145');
INSERT INTO `wms_receipt_order` VALUES (208, 'R-2023-01-31-140814', 1, 11, 'ssag', NULL, 3, 'sadgsdg', 1, 115, '2023-01-31 14:08:48.000', 115, '2023-01-31 14:09:17.822');
INSERT INTO `wms_receipt_order` VALUES (209, 'R-2023-01-31-154755', 1, NULL, NULL, NULL, 0, NULL, 1, 115, '2023-01-31 15:48:29.027', NULL, NULL);
INSERT INTO `wms_receipt_order` VALUES (210, 'R-2023-01-31-162116', 1, NULL, NULL, NULL, 3, NULL, 1, 115, '2023-01-31 16:21:35.000', 115, '2023-01-31 16:23:22.441');
INSERT INTO `wms_receipt_order` VALUES (211, 'R-2023-01-31-163546', 1, NULL, '001', NULL, 3, NULL, 1, 115, '2023-01-31 16:35:56.000', 115, '2023-01-31 16:37:03.789');
INSERT INTO `wms_receipt_order` VALUES (212, 'R-2023-01-31-163741', 1, NULL, NULL, NULL, 3, NULL, 1, 115, '2023-01-31 16:38:14.000', 115, '2023-01-31 16:38:29.481');
INSERT INTO `wms_receipt_order` VALUES (213, 'R-2023-01-31-204004', 1, NULL, '1111', NULL, 0, '1111', 1, 115, '2023-01-31 20:40:45.392', NULL, NULL);
INSERT INTO `wms_receipt_order` VALUES (214, 'R-2023-02-01-092904', 1, NULL, NULL, NULL, 0, NULL, 1, 115, '2023-02-01 09:29:26.356', NULL, NULL);
INSERT INTO `wms_receipt_order` VALUES (215, 'R-2023-02-01-134319', 1, 16, NULL, NULL, 0, NULL, 1, 115, '2023-02-01 13:43:38.900', NULL, NULL);
INSERT INTO `wms_receipt_order` VALUES (216, 'R-2023-02-01-190750', 1, 16, NULL, NULL, 0, NULL, 1, 115, '2023-02-01 19:08:08.133', NULL, NULL);
INSERT INTO `wms_receipt_order` VALUES (217, 'R-2023-02-01-220619', 1, 16, '29668974', NULL, 3, '', 1, 115, '2023-02-01 22:07:15.000', 115, '2023-02-01 22:08:22.057');
INSERT INTO `wms_receipt_order` VALUES (218, 'R-2023-02-02-150545', 1, 16, '1', NULL, 3, '1', 1, 115, '2023-02-02 15:06:31.000', 115, '2023-02-02 15:07:16.301');
INSERT INTO `wms_receipt_order` VALUES (219, 'R-2023-02-02-151022', 1, 16, '21', NULL, 0, '1', 1, 115, '2023-02-02 15:10:36.000', 115, '2023-02-03 16:35:30.749');
INSERT INTO `wms_receipt_order` VALUES (220, 'R-2023-02-02-151126', 1, 16, 'aaa', NULL, 3, NULL, 1, 115, '2023-02-02 15:11:41.000', 115, '2023-02-02 15:11:59.410');
INSERT INTO `wms_receipt_order` VALUES (221, 'R-2023-02-02-151136', 1, 16, NULL, NULL, 1, NULL, 1, 115, '2023-02-02 15:12:29.000', 115, '2023-02-02 15:13:05.519');
INSERT INTO `wms_receipt_order` VALUES (222, 'R-2023-02-02-151955', 1, 16, '1111', NULL, 3, NULL, 1, 115, '2023-02-02 15:20:19.000', 115, '2023-02-02 22:09:47.502');
INSERT INTO `wms_receipt_order` VALUES (223, 'R-2023-02-02-215530', 1, 16, '23365222', NULL, 2, '00', 1, 115, '2023-02-02 21:59:03.000', 115, '2023-02-02 22:07:16.237');
INSERT INTO `wms_receipt_order` VALUES (224, 'R-2023-02-02-221218', 1, 16, 'jjnkjnkjnk', NULL, 0, NULL, 1, 115, '2023-02-02 22:12:35.393', NULL, NULL);
INSERT INTO `wms_receipt_order` VALUES (225, 'R-2023-02-03-141134', 1, NULL, NULL, NULL, 0, NULL, 1, 115, '2023-02-03 14:11:58.000', 115, '2023-02-03 15:45:42.783');
INSERT INTO `wms_receipt_order` VALUES (226, 'R-2023-02-03-152638', 1, 16, '10086', NULL, 3, '测试数据10086', 1, 115, '2023-02-03 15:27:16.000', 115, '2023-02-03 15:29:26.748');
INSERT INTO `wms_receipt_order` VALUES (227, 'R-2023-02-03-163430', 1, NULL, NULL, NULL, 0, NULL, 1, 115, '2023-02-03 16:35:20.902', NULL, NULL);
INSERT INTO `wms_receipt_order` VALUES (228, 'R-2023-02-04-002956', 1, 16, NULL, NULL, 3, NULL, 1, 115, '2023-02-04 00:30:21.000', 115, '2023-02-04 00:31:27.970');
INSERT INTO `wms_receipt_order` VALUES (229, 'R-2023-02-04-025804', 1, 16, '123132', NULL, 3, '1231321', 1, 115, '2023-02-04 02:58:24.000', 115, '2023-02-04 03:00:15.425');
INSERT INTO `wms_receipt_order` VALUES (230, 'R-2023-02-04-085335', 2, 16, 'rgertertret', NULL, 3, NULL, 1, 115, '2023-02-04 08:53:50.000', 115, '2023-02-04 08:54:14.693');
INSERT INTO `wms_receipt_order` VALUES (231, 'R-2023-02-04-090418', 1, 16, NULL, NULL, 2, NULL, 1, 115, '2023-02-04 09:05:37.000', 115, '2023-02-04 16:09:45.187');
INSERT INTO `wms_receipt_order` VALUES (232, 'R-2023-02-04-154742', 1, NULL, NULL, NULL, 3, NULL, 1, 115, '2023-02-04 15:47:53.000', 115, '2023-02-06 14:13:47.149');
INSERT INTO `wms_receipt_order` VALUES (233, 'R-2023-02-04-161056', 1, 16, '123465', NULL, 3, NULL, 1, 115, '2023-02-04 16:11:14.000', 115, '2023-02-04 16:12:09.807');
INSERT INTO `wms_receipt_order` VALUES (234, 'R-2023-02-04-163604', 1, 16, '7777', NULL, 3, NULL, 1, 115, '2023-02-04 16:36:20.000', 115, '2023-02-04 16:36:29.689');
INSERT INTO `wms_receipt_order` VALUES (235, 'R-2023-02-04-182112', 1, NULL, NULL, NULL, 0, NULL, 1, 115, '2023-02-04 18:21:27.000', 115, '2023-02-04 20:53:43.573');
INSERT INTO `wms_receipt_order` VALUES (236, 'R-2023-02-04-200947', 1, NULL, NULL, NULL, 3, NULL, 1, 115, '2023-02-04 20:27:32.000', 115, '2023-02-04 20:29:37.637');
INSERT INTO `wms_receipt_order` VALUES (237, 'R-2023-02-04-204928', 1, NULL, NULL, NULL, 3, NULL, 1, 115, '2023-02-04 20:49:43.000', 115, '2023-02-04 20:50:32.342');
INSERT INTO `wms_receipt_order` VALUES (238, 'R-2023-02-06-114700', 1, 16, '2023092', NULL, 3, NULL, 1, 115, '2023-02-06 11:49:52.000', 115, '2023-02-06 11:51:05.744');
INSERT INTO `wms_receipt_order` VALUES (239, 'R-2023-02-06-135246', 1, 16, NULL, NULL, 3, NULL, 1, 115, '2023-02-06 13:53:44.000', 115, '2023-02-06 13:54:18.254');
INSERT INTO `wms_receipt_order` VALUES (240, 'R-2023-02-06-141205', 1, 18, '121212', NULL, 2, '0206测试', 1, 115, '2023-02-06 14:13:03.000', 115, '2023-02-06 15:13:45.013');
INSERT INTO `wms_receipt_order` VALUES (241, 'R-2023-02-06-152033', 1, 19, NULL, NULL, 3, NULL, 1, 115, '2023-02-06 15:21:02.000', 115, '2023-02-06 15:21:15.389');
INSERT INTO `wms_receipt_order` VALUES (242, 'R-2023-02-06-160328', 1, NULL, NULL, NULL, 0, NULL, 1, 115, '2023-02-06 16:03:43.263', NULL, NULL);
INSERT INTO `wms_receipt_order` VALUES (243, 'R-2023-02-06-171115', 1, 18, '12342134', NULL, 3, NULL, 1, 115, '2023-02-06 17:14:53.000', 115, '2023-02-07 09:21:35.221');
INSERT INTO `wms_receipt_order` VALUES (244, 'R-2023-02-06-185143', 1, 18, NULL, NULL, 0, NULL, 1, 115, '2023-02-06 18:53:19.000', 115, '2023-02-07 09:20:49.308');
INSERT INTO `wms_receipt_order` VALUES (245, 'R-2023-02-06-191711', 1, 18, NULL, NULL, 0, NULL, 1, 115, '2023-02-06 19:17:14.000', 115, '2023-02-07 14:30:07.508');
INSERT INTO `wms_receipt_order` VALUES (246, 'R-2023-02-07-160404', 2, NULL, NULL, NULL, 0, NULL, 1, 115, '2023-02-07 16:04:39.375', NULL, NULL);
INSERT INTO `wms_receipt_order` VALUES (247, 'R-2023-02-07-184609', 3, NULL, NULL, NULL, 0, NULL, 1, 115, '2023-02-07 18:46:59.295', NULL, NULL);
INSERT INTO `wms_receipt_order` VALUES (248, 'R-2023-02-07-213740', 2, 18, '123456', NULL, 0, NULL, 1, 115, '2023-02-07 21:37:55.789', NULL, NULL);
INSERT INTO `wms_receipt_order` VALUES (249, 'R-2023-02-08-091328', 1, 20, '461231635465464', NULL, 3, '配件定期采购', 1, 115, '2023-02-08 09:14:21.000', 115, '2023-02-08 09:16:11.439');
INSERT INTO `wms_receipt_order` VALUES (250, 'R-2023-02-08-093459', 1, 18, NULL, NULL, 3, NULL, 1, 115, '2023-02-08 09:35:25.000', 115, '2023-02-08 09:35:44.302');
INSERT INTO `wms_receipt_order` VALUES (251, 'R-2023-02-08-093610', 1, 18, NULL, NULL, 3, NULL, 1, 115, '2023-02-08 09:36:38.000', 115, '2023-02-08 09:36:43.850');
INSERT INTO `wms_receipt_order` VALUES (252, 'R-2023-02-08-103928', 1, NULL, NULL, NULL, 3, NULL, 1, 115, '2023-02-08 10:40:02.000', 115, '2023-02-08 10:40:33.316');
INSERT INTO `wms_receipt_order` VALUES (253, 'R-2023-02-08-142734', 1, 20, NULL, NULL, 3, NULL, 1, 115, '2023-02-08 11:29:00.000', 115, '2023-02-08 11:38:59.181');
INSERT INTO `wms_receipt_order` VALUES (254, 'R-2023-02-08-163630', 1, 18, '87654', NULL, 3, NULL, 1, 115, '2023-02-08 16:37:35.000', 115, '2023-02-08 16:40:11.395');
INSERT INTO `wms_receipt_order` VALUES (255, 'R-2023-02-09-095333', 1, 18, '11111111111111', NULL, 0, NULL, 1, 115, '2023-02-09 09:53:42.803', NULL, NULL);
INSERT INTO `wms_receipt_order` VALUES (256, 'R-2023-02-09-100609', 3, NULL, NULL, NULL, 0, NULL, 1, 115, '2023-02-09 10:06:41.000', 115, '2023-02-09 16:15:27.572');
INSERT INTO `wms_receipt_order` VALUES (257, 'R-2023-02-09-142652', 1, 19, NULL, NULL, 3, NULL, 1, 115, '2023-02-09 14:27:17.000', 115, '2023-02-09 14:27:51.839');
INSERT INTO `wms_receipt_order` VALUES (258, 'R-2023-02-10-090155', 1, 19, '21', NULL, 2, '21', 1, 115, '2023-02-10 09:02:17.000', 115, '2023-02-12 11:11:03.018');
INSERT INTO `wms_receipt_order` VALUES (259, 'R-2023-02-10-102435', 2, 18, NULL, NULL, 1, NULL, 1, 115, '2023-02-10 10:25:01.000', 115, '2023-02-10 10:25:22.410');
INSERT INTO `wms_receipt_order` VALUES (260, 'R-2023-02-10-151714', 2, 18, NULL, NULL, 3, NULL, 1, 115, '2023-02-10 15:17:53.000', 115, '2023-02-11 11:10:58.929');
INSERT INTO `wms_receipt_order` VALUES (261, 'R-2023-02-10-154642', 3, 29, '原本项目名称', NULL, 3, NULL, 1, 115, '2023-02-10 15:48:01.000', 115, '2023-02-10 15:50:01.992');
INSERT INTO `wms_receipt_order` VALUES (262, 'R-2023-02-10-155613', 3, 29, '2023年2月9日', NULL, 3, '原本项目为****', 1, 115, '2023-02-10 15:56:43.000', 115, '2023-02-10 15:56:53.589');
INSERT INTO `wms_receipt_order` VALUES (263, 'R-2023-02-11-184426', 1, 29, 'SK20230228201', NULL, 3, NULL, 1, 115, '2023-02-11 18:58:02.000', 115, '2023-02-11 19:02:04.543');
INSERT INTO `wms_receipt_order` VALUES (264, 'R-2023-02-11-190306', 1, 19, 'DK20230223443', NULL, 3, NULL, 1, 115, '2023-02-11 19:03:52.000', 115, '2023-02-12 11:12:23.861');
INSERT INTO `wms_receipt_order` VALUES (265, 'R-2023-02-11-201648', 1, 19, 'SK12340U820489', NULL, 3, NULL, 1, 115, '2023-02-11 20:17:18.000', 115, '2023-02-11 20:17:33.142');
INSERT INTO `wms_receipt_order` VALUES (266, 'R-2023-02-12-103134', 1, NULL, NULL, NULL, 0, NULL, 1, 115, '2023-02-12 10:31:48.000', 115, '2023-02-12 16:57:03.000');
INSERT INTO `wms_receipt_order` VALUES (267, 'R-2023-02-12-163609', 2, 18, NULL, NULL, 0, NULL, 1, 115, '2023-02-12 16:36:55.000', 115, '2023-02-12 16:55:55.242');
INSERT INTO `wms_receipt_order` VALUES (268, 'R-2023-02-13-100202', 1, NULL, NULL, NULL, 0, NULL, 1, 115, '2023-02-13 10:02:36.821', NULL, NULL);
INSERT INTO `wms_receipt_order` VALUES (269, 'R-2023-02-13-104454', 1, NULL, NULL, NULL, 0, NULL, 1, 115, '2023-02-13 10:45:00.601', NULL, NULL);
INSERT INTO `wms_receipt_order` VALUES (270, 'R-2023-02-13-104536', 1, 18, NULL, NULL, 0, NULL, 1, 115, '2023-02-13 10:46:44.506', NULL, NULL);
INSERT INTO `wms_receipt_order` VALUES (271, 'R-2023-02-13-110004', 1, 18, '21', NULL, 3, '321', 1, 115, '2023-02-13 11:23:58.000', 115, '2023-02-13 11:36:24.760');
INSERT INTO `wms_receipt_order` VALUES (272, 'R-2023-02-13-113226', 1, NULL, NULL, NULL, 0, NULL, 1, 115, '2023-02-13 11:32:30.000', 115, '2023-02-13 11:32:55.350');
INSERT INTO `wms_receipt_order` VALUES (273, 'R-2023-02-13-113759', 1, 18, '21', NULL, 3, '21', 1, 115, '2023-02-13 11:38:24.000', 115, '2023-02-13 11:38:39.777');
INSERT INTO `wms_receipt_order` VALUES (274, 'R-2023-02-13-113942', 1, 18, '21', NULL, 3, '32', 1, 115, '2023-02-13 11:40:21.000', 115, '2023-02-13 11:40:48.887');
INSERT INTO `wms_receipt_order` VALUES (275, 'R-2023-02-13-151051', 1, 19, '32', NULL, 3, '332', 1, 115, '2023-02-13 15:11:13.000', 115, '2023-02-13 16:26:38.816');
INSERT INTO `wms_receipt_order` VALUES (276, 'R-2023-02-13-160741', 1, NULL, NULL, NULL, 0, NULL, 1, 115, '2023-02-13 16:07:59.000', 115, '2023-02-13 17:48:25.145');
INSERT INTO `wms_receipt_order` VALUES (277, 'R-2023-02-14-093028', 1, 18, NULL, NULL, 3, NULL, 1, 115, '2023-02-14 09:30:55.000', 115, '2023-02-14 09:32:21.050');
INSERT INTO `wms_receipt_order` VALUES (278, 'R-2023-02-14-094447', 1, 18, '123', NULL, 3, '123', 1, 115, '2023-02-14 09:45:00.000', 115, '2023-02-14 09:48:07.505');
INSERT INTO `wms_receipt_order` VALUES (279, 'R-2023-02-14-172319', 1, 18, '000001', NULL, 3, NULL, 1, 115, '2023-02-14 17:23:36.000', 115, '2023-02-15 09:01:44.072');
INSERT INTO `wms_receipt_order` VALUES (280, 'R-2023-02-14-182241', 1, 18, 'fsd', NULL, 0, 'sdf', 1, 115, '2023-02-14 18:22:56.653', NULL, NULL);
INSERT INTO `wms_receipt_order` VALUES (281, 'R-2023-02-15-103135', 2, 18, '234e', NULL, 0, 'sdf ', 1, 115, '2023-02-15 10:31:49.247', NULL, NULL);
INSERT INTO `wms_receipt_order` VALUES (282, 'R-2023-02-15-110504', 1, 19, '21', NULL, 0, '21', 1, 115, '2023-02-15 11:05:39.990', NULL, NULL);
INSERT INTO `wms_receipt_order` VALUES (283, 'R-2023-02-15-112632', 1, NULL, NULL, NULL, 0, NULL, 1, 115, '2023-02-15 11:26:59.938', NULL, NULL);
INSERT INTO `wms_receipt_order` VALUES (284, 'R-2023-02-15-112853', 1, 18, NULL, NULL, 3, NULL, 1, 115, '2023-02-15 11:29:05.000', 115, '2023-02-15 11:30:11.930');
INSERT INTO `wms_receipt_order` VALUES (285, 'R-2023-02-15-115751', 1, 19, '123123', NULL, 0, '测试入库号码', 1, 115, '2023-02-15 11:58:24.000', 115, '2023-02-15 11:58:39.189');
INSERT INTO `wms_receipt_order` VALUES (286, 'R-2023-02-15-150722', 1, 30, '963258', NULL, 3, '这一个测试', 1, 115, '2023-02-15 15:08:21.000', 115, '2023-02-15 15:11:13.492');
INSERT INTO `wms_receipt_order` VALUES (287, 'R-2023-02-15-151734', 3, NULL, NULL, NULL, 0, NULL, 1, 115, '2023-02-15 15:18:55.050', NULL, NULL);
INSERT INTO `wms_receipt_order` VALUES (288, 'R-2023-02-15-155446', 1, 18, NULL, NULL, 0, NULL, 1, 115, '2023-02-15 15:51:35.000', 115, '2023-02-15 15:51:45.603');
INSERT INTO `wms_receipt_order` VALUES (289, 'R-2023-02-15-162106', 1, 19, '21', NULL, 0, '333333', 1, 115, '2023-02-15 16:21:53.771', NULL, NULL);
INSERT INTO `wms_receipt_order` VALUES (290, 'R-2023-02-16-132214', 1, 18, 'AAA', NULL, 0, NULL, 1, 115, '2023-02-16 13:22:38.426', NULL, NULL);
INSERT INTO `wms_receipt_order` VALUES (291, 'R-2023-02-16-135005', 1, NULL, NULL, NULL, 0, NULL, 1, 115, '2023-02-16 13:50:31.000', 115, '2023-02-16 16:41:18.266');
INSERT INTO `wms_receipt_order` VALUES (292, 'R-2023-02-16-151616', 1, 30, NULL, NULL, 3, NULL, 1, 115, '2023-02-16 15:17:26.000', 115, '2023-02-16 15:19:19.850');
INSERT INTO `wms_receipt_order` VALUES (293, 'R-2023-02-17-105146', 3, 29, '001', NULL, 3, NULL, 1, 115, '2023-02-17 10:55:46.000', 115, '2023-02-17 10:56:03.285');
INSERT INTO `wms_receipt_order` VALUES (294, 'R-2023-02-17-111149', 1, 29, '2', NULL, 3, NULL, 1, 115, '2023-02-17 11:12:37.000', 115, '2023-02-17 11:13:17.763');
INSERT INTO `wms_receipt_order` VALUES (295, 'R-2023-02-17-131936', 1, 19, NULL, NULL, 3, NULL, 1, 115, '2023-02-17 13:19:52.000', 115, '2023-02-17 13:21:49.759');
INSERT INTO `wms_receipt_order` VALUES (296, 'R-2023-02-17-134011', 1, 18, NULL, NULL, 2, NULL, 1, 115, '2023-02-17 13:40:24.000', 115, '2023-02-17 15:52:30.944');
INSERT INTO `wms_receipt_order` VALUES (297, 'R-2023-02-17-154837', 1, 19, '1231234123', NULL, 3, '123412341', 1, 115, '2023-02-17 15:48:53.000', 115, '2023-02-17 15:52:07.287');
INSERT INTO `wms_receipt_order` VALUES (298, 'R-2023-02-17-163629', 1, 18, '1', NULL, NULL, NULL, 1, 115, '2023-02-17 16:36:52.000', 115, '2023-02-21 10:41:08.010');
INSERT INTO `wms_receipt_order` VALUES (299, 'R-2023-02-17-165104', 1, NULL, '20200305', NULL, 0, NULL, 1, 115, '2023-02-17 16:51:29.378', NULL, NULL);
INSERT INTO `wms_receipt_order` VALUES (300, 'R-2023-02-18-000524', 2, 18, '6544', NULL, 3, NULL, 1, 115, '2023-02-18 00:05:50.000', 115, '2023-02-20 10:41:13.552');
INSERT INTO `wms_receipt_order` VALUES (301, 'R-2023-02-18-003112', 1, 19, NULL, NULL, 3, NULL, 1, 115, '2023-02-18 00:31:39.000', 115, '2023-02-18 00:32:00.485');
INSERT INTO `wms_receipt_order` VALUES (302, 'R-2023-02-18-142159', 1, NULL, NULL, NULL, 0, NULL, 1, 115, '2023-02-18 14:22:44.000', 115, '2023-02-20 19:49:27.529');
INSERT INTO `wms_receipt_order` VALUES (303, 'R-2023-02-19-015850', 1, NULL, NULL, NULL, 2, NULL, 1, 115, '2023-02-19 01:59:50.000', 115, '2023-02-20 17:40:29.932');
INSERT INTO `wms_receipt_order` VALUES (304, 'R-2023-02-20-111056', 1, 18, '1', NULL, 3, '11', 1, 115, '2023-02-20 11:11:35.000', 115, '2023-02-22 15:45:29.599');
INSERT INTO `wms_receipt_order` VALUES (305, 'R-2023-02-20-210704', 1, 18, NULL, NULL, 0, NULL, 1, 115, '2023-02-20 21:07:38.347', NULL, NULL);
INSERT INTO `wms_receipt_order` VALUES (306, 'R-2023-02-21-103132', 1, 18, NULL, NULL, 3, NULL, 1, 115, '2023-02-21 10:32:01.000', 115, '2023-02-21 10:40:53.849');
INSERT INTO `wms_receipt_order` VALUES (307, 'R-2023-02-21-114102', 1, 18, NULL, NULL, 3, NULL, 1, 115, '2023-02-21 11:41:13.000', 115, '2023-02-21 14:19:02.966');
INSERT INTO `wms_receipt_order` VALUES (308, 'R-2023-02-21-162310', 1, 19, '123213123123123', NULL, 1, '123123', 1, 115, '2023-02-21 16:23:29.000', 115, '2023-02-22 15:45:19.096');
INSERT INTO `wms_receipt_order` VALUES (309, 'R-2023-02-21-165831', 1, 18, '1', NULL, 0, '1', 1, 115, '2023-02-21 16:58:56.730', NULL, NULL);
INSERT INTO `wms_receipt_order` VALUES (310, 'R-2023-02-22-070714', 1, NULL, NULL, NULL, 0, NULL, 1, 115, '2023-02-22 07:07:20.200', NULL, NULL);
INSERT INTO `wms_receipt_order` VALUES (311, 'R-2023-02-22-070724', 1, NULL, NULL, NULL, 0, NULL, 1, 115, '2023-02-22 07:10:20.042', NULL, NULL);
INSERT INTO `wms_receipt_order` VALUES (312, 'R-2023-02-22-071148', 1, NULL, NULL, NULL, 3, NULL, 1, 115, '2023-02-22 07:12:13.000', 115, '2023-02-22 07:22:49.685');
INSERT INTO `wms_receipt_order` VALUES (313, 'R-2023-02-22-095848', 1, NULL, NULL, NULL, 0, NULL, 1, 115, '2023-02-22 09:58:51.541', NULL, NULL);
INSERT INTO `wms_receipt_order` VALUES (314, 'R-2023-02-22-134156', 1, 18, '2242343242', NULL, 0, '423432', 1, 115, '2023-02-22 13:42:48.000', 115, '2023-02-22 14:47:36.084');
INSERT INTO `wms_receipt_order` VALUES (315, 'R-2023-02-22-162514', 1, 23, NULL, NULL, 0, NULL, 1, 115, '2023-02-22 16:25:32.268', NULL, NULL);
INSERT INTO `wms_receipt_order` VALUES (316, 'R-2023-02-22-171944', 1, 18, 'cx0000', NULL, 2, NULL, 1, 115, '2023-02-22 17:20:19.000', 115, '2023-02-23 15:33:07.285');
INSERT INTO `wms_receipt_order` VALUES (317, 'R-2023-02-22-200437', 1, 20, NULL, NULL, 3, NULL, 1, 115, '2023-02-22 20:04:56.000', 115, '2023-02-22 20:05:14.175');
INSERT INTO `wms_receipt_order` VALUES (318, 'R-2023-02-23-154501', 3, 30, 'fdsfdsfsdf', NULL, 0, '123123', 1, 115, '2023-02-23 15:43:55.000', 115, '2023-02-24 10:02:02.875');
INSERT INTO `wms_receipt_order` VALUES (319, 'R-2023-02-23-213337', 1, 18, '11123', NULL, 1, NULL, 1, 115, '2023-02-23 21:34:09.000', 115, '2023-02-24 10:00:56.251');
INSERT INTO `wms_receipt_order` VALUES (320, 'R-2023-02-23-221505', 1, 18, NULL, NULL, 3, NULL, 1, 115, '2023-02-23 22:15:51.000', 115, '2023-02-23 22:16:22.948');
INSERT INTO `wms_receipt_order` VALUES (321, 'R-2023-02-24-124441', 1, 19, NULL, NULL, 0, NULL, 1, 115, '2023-02-24 12:45:00.524', NULL, NULL);
INSERT INTO `wms_receipt_order` VALUES (322, 'R-2023-02-24-145630', 3, 19, NULL, NULL, 0, NULL, 1, 115, '2023-02-24 14:57:16.000', 115, '2023-02-24 16:43:22.696');
INSERT INTO `wms_receipt_order` VALUES (323, 'R-2023-02-24-152308', 1, 18, 'dsdd', NULL, 3, 'dsdsdsd', 1, 115, '2023-02-24 15:23:26.000', 115, '2023-02-24 15:24:09.566');
INSERT INTO `wms_receipt_order` VALUES (324, 'R-2023-02-24-152748', 1, 19, 'fd', NULL, 3, 'fdf', 1, 115, '2023-02-24 15:28:20.000', 115, '2023-02-24 15:28:30.453');
INSERT INTO `wms_receipt_order` VALUES (325, 'R-2023-02-24-163535', 1, 18, '000001', NULL, 3, NULL, 1, 115, '2023-02-24 16:36:07.000', 115, '2023-02-24 16:36:51.160');
INSERT INTO `wms_receipt_order` VALUES (326, 'R-2023-02-24-164055', 1, 18, NULL, NULL, 3, NULL, 1, 115, '2023-02-24 16:41:45.000', 115, '2023-02-25 00:41:10.295');
INSERT INTO `wms_receipt_order` VALUES (327, 'R-2023-02-25-003746', 1, 20, '0test', NULL, 0, 'test', 1, 115, '2023-02-25 00:38:24.000', 115, '2023-02-25 00:39:48.009');
INSERT INTO `wms_receipt_order` VALUES (328, 'R-2023-02-25-102931', 1, 18, '123456456451231', NULL, 0, '入库入库', 1, 115, '2023-02-25 10:30:41.000', 115, '2023-02-25 10:31:11.812');
INSERT INTO `wms_receipt_order` VALUES (329, 'R-2023-02-25-104058', 1, 19, '111', NULL, 0, NULL, 1, 115, '2023-02-25 10:41:13.000', 115, '2023-02-25 10:42:54.643');
INSERT INTO `wms_receipt_order` VALUES (330, 'R-2023-02-25-212437', 1, 18, NULL, NULL, 0, NULL, 1, 115, '2023-02-25 21:25:00.345', NULL, NULL);
INSERT INTO `wms_receipt_order` VALUES (331, 'R-2023-02-26-133820', 1, 31, NULL, NULL, NULL, NULL, 1, 115, '2023-02-26 13:41:11.000', 115, '2023-02-26 14:10:09.994');
INSERT INTO `wms_receipt_order` VALUES (332, 'R-2023-02-26-140939', 1, 31, NULL, NULL, 0, NULL, 1, 115, '2023-02-26 14:09:48.721', NULL, NULL);
INSERT INTO `wms_receipt_order` VALUES (333, 'R-2023-02-26-151158', 3, 31, '123', NULL, 3, '123', 1, 115, '2023-02-26 15:12:19.000', 115, '2023-02-26 15:13:26.049');
INSERT INTO `wms_receipt_order` VALUES (334, 'R-2023-02-26-151630', 1, 31, '1111', NULL, 2, NULL, 1, 115, '2023-02-26 15:16:52.000', 115, '2023-02-26 17:55:48.144');
INSERT INTO `wms_receipt_order` VALUES (335, 'R-2023-02-26-174654', 1, 32, 'YT123456', NULL, 0, NULL, 1, 115, '2023-02-26 17:47:20.000', 115, '2023-02-27 10:45:34.084');
INSERT INTO `wms_receipt_order` VALUES (336, 'R-2023-02-27-021853', 1, 31, NULL, NULL, 3, NULL, 1, 115, '2023-02-27 10:19:21.000', 115, '2023-02-27 10:20:24.573');
INSERT INTO `wms_receipt_order` VALUES (337, 'R-2023-02-27-103359', 1, 32, NULL, NULL, 3, NULL, 1, 115, '2023-02-27 10:33:52.000', 115, '2023-02-27 10:36:12.856');
INSERT INTO `wms_receipt_order` VALUES (338, 'R-2023-02-27-104833', 1, 31, '11', NULL, 0, '111', 1, 115, '2023-02-27 10:48:48.000', 115, '2023-02-27 16:25:19.901');
INSERT INTO `wms_receipt_order` VALUES (339, 'R-2023-02-27-123140', 1, 31, '13212312', NULL, 3, NULL, 1, 115, '2023-02-27 12:32:06.000', 115, '2023-02-27 12:33:01.040');
INSERT INTO `wms_receipt_order` VALUES (340, 'R-2023-02-27-143544', 1, 31, NULL, NULL, 0, '12456', 1, 115, '2023-02-27 14:36:14.000', 115, '2023-02-28 10:02:29.717');
INSERT INTO `wms_receipt_order` VALUES (341, 'R-2023-02-27-224430', 1, NULL, NULL, NULL, 3, NULL, 1, 115, '2023-02-27 22:45:10.000', 115, '2023-02-27 22:45:36.799');
INSERT INTO `wms_receipt_order` VALUES (342, 'R-2023-02-27-233836', 1, NULL, NULL, NULL, 2, NULL, 1, 115, '2023-02-27 23:39:19.000', 115, '2023-02-28 00:16:38.766');
INSERT INTO `wms_receipt_order` VALUES (343, 'R-2023-02-28-001311', 1, NULL, NULL, NULL, 3, NULL, 1, 115, '2023-02-28 00:15:57.000', 115, '2023-02-28 00:16:22.664');
INSERT INTO `wms_receipt_order` VALUES (344, 'R-2023-02-28-110759', 1, 31, 'dsfdsfdsfdsfds', NULL, 3, NULL, 1, 115, '2023-02-28 11:08:09.000', 115, '2023-02-28 11:08:42.093');
INSERT INTO `wms_receipt_order` VALUES (345, 'R-2023-02-28-111745', 1, 31, '123123123', NULL, 0, '123', 1, 115, '2023-02-28 11:17:59.000', 115, '2023-02-28 11:49:29.589');
INSERT INTO `wms_receipt_order` VALUES (346, 'R-2023-02-28-142036', 1, 32, '1561665659', NULL, 0, NULL, 1, 115, '2023-02-28 14:21:03.439', NULL, NULL);
INSERT INTO `wms_receipt_order` VALUES (347, 'R-2023-03-01-025917', 1, 31, '123123', NULL, 0, NULL, 1, 115, '2023-03-01 02:59:40.550', NULL, NULL);
INSERT INTO `wms_receipt_order` VALUES (348, 'R-2023-03-01-030053', 2, 32, '111', NULL, 3, NULL, 1, 115, '2023-03-01 03:00:58.000', 115, '2023-03-01 03:09:32.734');
INSERT INTO `wms_receipt_order` VALUES (349, 'R-2023-03-01-102526', 1, 32, '123123', NULL, 3, NULL, 1, 115, '2023-03-01 10:25:41.000', 115, '2023-03-01 10:26:33.740');
INSERT INTO `wms_receipt_order` VALUES (350, 'R-2023-03-01-103238', 3, 31, NULL, NULL, 0, NULL, 1, 115, '2023-03-01 10:33:57.951', NULL, NULL);
INSERT INTO `wms_receipt_order` VALUES (351, 'R-2023-03-01-122704', 1, 31, '12313231', NULL, NULL, NULL, 1, 115, '2023-03-01 12:27:26.000', 115, '2023-03-01 17:34:06.692');
INSERT INTO `wms_receipt_order` VALUES (352, 'R-2023-03-01-160512', 1, 31, 'TEST001', NULL, 2, NULL, 1, 115, '2023-03-01 16:05:47.000', 115, '2023-03-01 19:14:12.004');
INSERT INTO `wms_receipt_order` VALUES (353, 'R-2023-03-01-161448', 1, NULL, NULL, NULL, 0, NULL, 1, 115, '2023-03-01 16:16:03.424', NULL, NULL);
INSERT INTO `wms_receipt_order` VALUES (354, 'R-2023-03-01-170434', 1, 31, '12313', NULL, 0, NULL, 1, 115, '2023-03-01 17:04:59.000', 115, '2023-03-01 20:51:47.968');
INSERT INTO `wms_receipt_order` VALUES (355, 'R-2023-03-01-170730', 1, NULL, NULL, NULL, 3, NULL, 1, 115, '2023-03-01 17:07:51.000', 115, '2023-03-01 17:29:30.125');
INSERT INTO `wms_receipt_order` VALUES (356, 'R-2023-03-01-180013', 1, 33, 'QD221823I000081771', NULL, 3, 'IP23020069', 1, 115, '2023-03-01 18:00:56.000', 115, '2023-03-01 18:06:30.377');
INSERT INTO `wms_receipt_order` VALUES (357, 'R-2023-03-02-092011', 1, 33, '2333', NULL, 3, '', 1, 115, '2023-03-02 09:20:22.000', 115, '2023-03-02 09:21:54.260');
INSERT INTO `wms_receipt_order` VALUES (358, 'R-2023-03-02-095154', 1, 34, '1222', NULL, 0, NULL, 1, 115, '2023-03-02 09:52:02.000', 115, '2023-03-02 09:53:14.198');
INSERT INTO `wms_receipt_order` VALUES (359, 'R-2023-03-02-152801', 1, 31, '11121', NULL, 0, NULL, 1, 115, '2023-03-02 15:28:39.851', NULL, NULL);
INSERT INTO `wms_receipt_order` VALUES (360, 'R-2023-03-02-154753', 1, 33, NULL, NULL, 0, NULL, 1, 115, '2023-03-02 15:48:52.000', 115, '2023-03-03 07:31:28.540');
INSERT INTO `wms_receipt_order` VALUES (361, 'R-2023-03-02-165007', 1, 31, NULL, NULL, 0, NULL, 1, 115, '2023-03-02 16:50:18.321', NULL, NULL);
INSERT INTO `wms_receipt_order` VALUES (362, 'R-2023-03-03-082828', 1, 33, '1212121', NULL, 3, NULL, 1, 115, '2023-03-03 08:28:58.000', 115, '2023-03-03 08:30:31.444');
INSERT INTO `wms_receipt_order` VALUES (363, 'R-2023-03-03-084147', 1, 33, '123', NULL, 3, NULL, 1, 115, '2023-03-03 08:42:06.000', 115, '2023-03-03 08:45:43.819');
INSERT INTO `wms_receipt_order` VALUES (364, 'R-2023-03-03-084413', 1, 32, 'sasasas', NULL, 3, 'asasasasa', 1, 115, '2023-03-03 08:44:27.000', 115, '2023-03-03 08:44:50.890');
INSERT INTO `wms_receipt_order` VALUES (365, 'R-2023-03-03-125340', 1, 33, '131313', NULL, 3, '1111', 1, 115, '2023-03-03 12:54:24.000', 115, '2023-03-03 12:57:29.371');
INSERT INTO `wms_receipt_order` VALUES (366, 'R-2023-03-03-213231', 1, 33, NULL, NULL, 2, NULL, 1, 115, '2023-03-03 21:33:04.000', 115, '2023-03-06 13:37:34.183');
INSERT INTO `wms_receipt_order` VALUES (367, 'R-2023-03-03-213252', 1, 35, NULL, NULL, 3, NULL, 1, 115, '2023-03-03 21:39:41.000', 115, '2023-03-03 21:42:50.054');
INSERT INTO `wms_receipt_order` VALUES (368, 'R-2023-03-03-214947', 1, 35, NULL, NULL, 3, NULL, 1, 115, '2023-03-03 21:50:46.000', 115, '2023-03-03 22:00:24.630');
INSERT INTO `wms_receipt_order` VALUES (369, 'R-2023-03-03-220105', 1, 35, NULL, NULL, 3, NULL, 1, 115, '2023-03-03 22:01:45.000', 115, '2023-03-03 22:03:10.296');
INSERT INTO `wms_receipt_order` VALUES (370, 'R-2023-03-03-223627', 1, 35, '111111111', NULL, 3, NULL, 1, 115, '2023-03-03 22:36:55.000', 115, '2023-03-03 22:37:09.338');
INSERT INTO `wms_receipt_order` VALUES (371, 'R-2023-03-03-223812', 1, 35, '12', NULL, 3, '121', 1, 115, '2023-03-03 22:38:30.000', 115, '2023-03-03 22:39:13.306');
INSERT INTO `wms_receipt_order` VALUES (372, 'R-2023-03-05-163838', 1, 35, '11111111111111', NULL, 0, NULL, 1, 115, '2023-03-05 16:39:06.940', NULL, NULL);
INSERT INTO `wms_receipt_order` VALUES (373, 'R-2023-03-06-082707', 1, 33, '22222', NULL, 3, '2222', 1, 115, '2023-03-06 08:27:32.000', 115, '2023-03-06 08:28:08.839');
INSERT INTO `wms_receipt_order` VALUES (374, 'R-2023-03-06-173242', 1, 35, '123445', NULL, 3, NULL, 1, 115, '2023-03-06 17:33:32.000', 115, '2023-03-07 09:41:16.639');
INSERT INTO `wms_receipt_order` VALUES (375, 'R-2023-03-07-093736', 1, 33, '112', NULL, 1, '121', 1, 115, '2023-03-07 09:38:21.000', 115, '2023-03-07 09:40:01.281');
INSERT INTO `wms_receipt_order` VALUES (376, 'R-2023-03-07-103917', 1, 32, NULL, NULL, 0, NULL, 1, 115, '2023-03-07 10:39:38.753', NULL, NULL);
INSERT INTO `wms_receipt_order` VALUES (377, 'R-2023-03-07-143417', 1, NULL, NULL, NULL, 0, NULL, 1, 115, '2023-03-07 14:34:26.478', NULL, NULL);
INSERT INTO `wms_receipt_order` VALUES (378, 'R-2023-03-07-152418', 1, 32, NULL, NULL, 0, NULL, 1, 115, '2023-03-07 15:25:05.000', 115, '2023-03-08 18:55:40.232');
INSERT INTO `wms_receipt_order` VALUES (379, 'R-2023-03-08-093047', 1, 33, 'RK202303070000001', NULL, 3, 'RK202303070000001测试', 1, 115, '2023-03-08 09:37:03.000', 115, '2023-03-08 09:37:18.561');
INSERT INTO `wms_receipt_order` VALUES (380, 'R-2023-03-08-093738', 1, 35, 'RK20230307000002', NULL, 3, 'RK20230307000002测试', 1, 115, '2023-03-08 09:38:18.000', 115, '2023-03-08 09:39:15.826');
INSERT INTO `wms_receipt_order` VALUES (381, 'R-2023-03-08-143918', 1, 33, NULL, NULL, 0, NULL, 1, 115, '2023-03-08 14:39:26.761', NULL, NULL);
INSERT INTO `wms_receipt_order` VALUES (382, 'R-2023-03-08-174305', 1, 32, NULL, NULL, 3, NULL, 1, 115, '2023-03-08 17:43:22.000', 115, '2023-03-10 15:29:42.908');
INSERT INTO `wms_receipt_order` VALUES (383, 'R-2023-03-08-235915', 1, 33, '454564456', NULL, 0, '44', 1, 115, '2023-03-08 23:58:45.461', NULL, NULL);
INSERT INTO `wms_receipt_order` VALUES (384, 'R-2023-03-09-100314', 1, 33, NULL, NULL, 0, NULL, 1, 115, '2023-03-09 10:03:55.166', NULL, NULL);
INSERT INTO `wms_receipt_order` VALUES (385, 'R-2023-03-09-130054', 1, 34, '11', NULL, 3, '11', 1, 115, '2023-03-09 13:01:24.000', 115, '2023-03-09 13:04:31.031');
INSERT INTO `wms_receipt_order` VALUES (386, 'R-2023-03-09-130903', 1, 32, '11', NULL, 3, '11', 1, 115, '2023-03-09 13:09:19.000', 115, '2023-03-09 13:09:36.842');
INSERT INTO `wms_receipt_order` VALUES (387, 'R-2023-03-09-150957', 1, 33, '24', NULL, 3, NULL, 1, 115, '2023-03-09 15:10:30.000', 115, '2023-03-10 10:17:42.529');
INSERT INTO `wms_receipt_order` VALUES (388, 'R-2023-03-09-151125', 1, 34, '434', NULL, 3, NULL, 1, 115, '2023-03-09 15:11:38.000', 115, '2023-03-09 15:11:59.084');
INSERT INTO `wms_receipt_order` VALUES (389, 'R-2023-03-10-175854', 1, 33, '11111', NULL, 0, NULL, 1, 115, '2023-03-10 17:59:17.862', NULL, NULL);
INSERT INTO `wms_receipt_order` VALUES (390, 'R-2023-03-11-135708', 1, 33, NULL, NULL, 0, NULL, 1, 115, '2023-03-11 13:58:07.002', NULL, NULL);
INSERT INTO `wms_receipt_order` VALUES (391, 'R-2023-03-12-133547', 1, 33, '3333', NULL, 3, NULL, 1, 115, '2023-03-12 13:36:57.000', 115, '2023-03-12 13:39:25.788');
INSERT INTO `wms_receipt_order` VALUES (392, 'R-2023-03-12-155449', 1, 32, '11', NULL, 3, '11', 1, 115, '2023-03-12 16:01:28.000', 115, '2023-03-12 16:02:14.208');
INSERT INTO `wms_receipt_order` VALUES (393, 'R-2023-03-12-172806', 1, 32, '111000', NULL, 0, NULL, 1, 115, '2023-03-12 17:28:54.034', NULL, NULL);
INSERT INTO `wms_receipt_order` VALUES (394, 'R-2023-03-13-002327', 1, 34, '123', NULL, 3, NULL, 1, 115, '2023-03-13 00:23:45.000', 115, '2023-03-13 00:24:13.185');
INSERT INTO `wms_receipt_order` VALUES (395, 'R-2023-03-13-041649', 1, 36, '5456', NULL, 3, NULL, 1, 115, '2023-03-13 04:17:02.000', 115, '2023-03-13 04:17:07.867');
INSERT INTO `wms_receipt_order` VALUES (396, 'R-2023-03-13-102918', 2, 34, '11111111111111', NULL, 3, '质检借出归还', 1, 115, '2023-03-13 10:30:09.000', 115, '2023-03-13 10:32:39.637');
INSERT INTO `wms_receipt_order` VALUES (397, 'R-2023-03-13-152157', 1, NULL, NULL, NULL, 3, NULL, 1, 115, '2023-03-13 15:23:21.000', 115, '2023-03-13 15:23:51.429');
INSERT INTO `wms_receipt_order` VALUES (398, 'R-2023-03-13-153843', 1, 32, '111', NULL, 3, NULL, 1, 115, '2023-03-13 15:39:27.000', 115, '2023-03-13 15:39:42.631');
INSERT INTO `wms_receipt_order` VALUES (399, 'R-2023-03-13-155141', 1, 33, '123', NULL, 3, NULL, 1, 115, '2023-03-13 15:52:10.000', 115, '2023-03-13 15:52:23.897');
INSERT INTO `wms_receipt_order` VALUES (400, 'R-2023-03-13-155503', 1, 32, '66666', NULL, 3, NULL, 1, 115, '2023-03-13 15:55:33.000', 115, '2023-03-13 15:56:25.123');
INSERT INTO `wms_receipt_order` VALUES (401, 'R-2023-03-13-155805', 1, 33, '66767', NULL, 3, NULL, 1, 115, '2023-03-13 15:58:32.000', 115, '2023-03-13 15:58:56.672');
INSERT INTO `wms_receipt_order` VALUES (402, 'R-2023-03-13-163012', 1, 33, '333', NULL, 3, NULL, 1, 115, '2023-03-13 16:30:39.000', 115, '2023-03-13 16:30:47.777');
INSERT INTO `wms_receipt_order` VALUES (403, 'R-2023-03-13-163117', 1, 32, NULL, NULL, 3, NULL, 1, 115, '2023-03-13 16:31:49.000', 115, '2023-03-13 16:32:56.785');
INSERT INTO `wms_receipt_order` VALUES (404, 'R-2023-03-14-095219', 1, NULL, NULL, NULL, 3, NULL, 1, 115, '2023-03-14 09:53:00.000', 115, '2023-03-14 09:53:57.723');
INSERT INTO `wms_receipt_order` VALUES (405, 'R-2023-03-14-112014', 1, 34, NULL, NULL, 1, NULL, 1, 115, '2023-03-14 11:20:28.000', 115, '2023-03-14 11:20:54.920');
INSERT INTO `wms_receipt_order` VALUES (406, 'R-2023-03-14-130541', 3, 33, NULL, NULL, 2, NULL, 1, 115, '2023-03-14 13:06:23.000', 115, '2023-03-23 10:40:39.872');
INSERT INTO `wms_receipt_order` VALUES (407, 'R-2023-03-14-134738', 1, 33, '1235566', NULL, 3, '备注达到的', 1, 115, '2023-03-14 13:48:35.000', 115, '2023-03-14 13:49:07.881');
INSERT INTO `wms_receipt_order` VALUES (408, 'R-2023-03-14-161602', 1, 33, NULL, NULL, 3, NULL, 1, 115, '2023-03-14 16:16:27.000', 115, '2023-03-14 16:17:08.589');
INSERT INTO `wms_receipt_order` VALUES (409, 'R-2023-03-14-161751', 1, NULL, NULL, NULL, 3, NULL, 1, 115, '2023-03-14 16:18:08.000', 115, '2023-03-14 16:18:41.570');
INSERT INTO `wms_receipt_order` VALUES (410, 'R-2023-03-14-200938', 1, 33, '123', NULL, 0, '123', 1, 115, '2023-03-14 20:10:52.000', 115, '2023-03-14 23:57:41.427');
INSERT INTO `wms_receipt_order` VALUES (411, 'R-2023-03-14-235746', 1, 33, NULL, NULL, 0, NULL, 1, 115, '2023-03-14 23:58:14.783', NULL, NULL);
INSERT INTO `wms_receipt_order` VALUES (412, 'R-2023-03-15-094959', 1, 33, NULL, NULL, 1, NULL, 1, 115, '2023-03-15 09:50:34.000', 115, '2023-03-23 10:40:26.872');
INSERT INTO `wms_receipt_order` VALUES (413, 'R-2023-03-15-184530', 1, 34, '12333333331233', NULL, 3, '23', 1, 115, '2023-03-15 18:46:04.000', 115, '2023-03-15 18:46:37.861');
INSERT INTO `wms_receipt_order` VALUES (414, 'R-2023-03-15-214955', 1, 36, '789', NULL, 3, '?', 1, 115, '2023-03-15 21:50:07.000', 115, '2023-03-15 21:50:15.587');
INSERT INTO `wms_receipt_order` VALUES (415, 'R-2023-03-16-092020', 1, 34, NULL, NULL, 3, NULL, 1, 115, '2023-03-16 09:21:11.000', 115, '2023-03-16 09:21:46.780');
INSERT INTO `wms_receipt_order` VALUES (416, 'R-2023-03-16-112921', 1, NULL, NULL, NULL, 3, NULL, 1, 115, '2023-03-16 11:30:08.000', 115, '2023-03-16 11:30:49.772');
INSERT INTO `wms_receipt_order` VALUES (417, 'R-2023-03-16-155045', 1, NULL, NULL, NULL, 0, NULL, 1, 115, '2023-03-16 15:51:13.000', 115, '2023-03-19 10:37:19.726');
INSERT INTO `wms_receipt_order` VALUES (418, 'R-2023-03-16-180049', 1, 33, 'ODR0316', NULL, 3, NULL, 1, 115, '2023-03-16 18:01:58.000', 115, '2023-03-21 14:40:37.680');
INSERT INTO `wms_receipt_order` VALUES (419, 'R-2023-03-17-112828', 1, NULL, NULL, NULL, 0, NULL, 1, 115, '2023-03-17 11:29:00.096', NULL, NULL);
INSERT INTO `wms_receipt_order` VALUES (420, 'R-2023-03-17-115516', 2, 33, 'fwefwefwefwe', NULL, 0, NULL, 1, 115, '2023-03-17 11:55:47.000', 115, '2023-03-17 14:54:47.483');
INSERT INTO `wms_receipt_order` VALUES (421, 'R-2023-03-17-152847', 1, 33, 'GMS1100231', NULL, 3, NULL, 1, 115, '2023-03-17 15:29:18.000', 115, '2023-03-17 15:32:11.147');
INSERT INTO `wms_receipt_order` VALUES (422, 'R-2023-03-17-161935', 1, 33, NULL, NULL, 3, NULL, 1, 115, '2023-03-17 16:20:13.000', 115, '2023-03-20 08:40:39.446');
INSERT INTO `wms_receipt_order` VALUES (423, 'R-2023-03-17-180515', 2, 33, '123', NULL, 3, '1231321', 1, 115, '2023-03-17 18:05:46.000', 115, '2023-03-17 18:06:04.210');
INSERT INTO `wms_receipt_order` VALUES (424, 'R-2023-03-20-110410', 1, 32, '打撒所', NULL, 0, NULL, 1, 115, '2023-03-20 11:04:27.341', NULL, NULL);
INSERT INTO `wms_receipt_order` VALUES (425, 'R-2023-03-20-113352', 1, 33, NULL, NULL, 2, NULL, 1, 115, '2023-03-20 11:34:32.000', 115, '2023-03-20 11:36:07.231');
INSERT INTO `wms_receipt_order` VALUES (426, 'R-2023-03-20-131852', 3, 34, NULL, NULL, 0, '1', 1, 115, '2023-03-20 13:19:35.000', 115, '2023-03-20 13:20:05.250');
INSERT INTO `wms_receipt_order` VALUES (427, 'R-2023-03-20-133130', 1, 32, '123123', NULL, 0, '123', 1, 115, '2023-03-20 13:31:38.658', NULL, NULL);
INSERT INTO `wms_receipt_order` VALUES (428, 'R-2023-03-20-134726', 1, 32, NULL, NULL, 3, NULL, 1, 115, '2023-03-20 13:47:47.000', 115, '2023-03-20 13:48:40.624');
INSERT INTO `wms_receipt_order` VALUES (429, 'R-2023-03-20-140513', 1, 33, NULL, NULL, 3, NULL, 1, 115, '2023-03-20 14:07:02.000', 115, '2023-03-20 14:08:46.518');
INSERT INTO `wms_receipt_order` VALUES (430, 'R-2023-03-20-164817', 1, 33, NULL, NULL, 3, NULL, 1, 115, '2023-03-20 16:48:40.000', 115, '2023-03-20 16:49:02.122');
INSERT INTO `wms_receipt_order` VALUES (431, 'R-2023-03-20-170442', 1, 32, '1', NULL, 0, '1', 1, 115, '2023-03-20 17:04:58.339', NULL, NULL);
INSERT INTO `wms_receipt_order` VALUES (432, 'R-2023-03-20-170502', 1, 33, '1', NULL, 0, '1', 1, 115, '2023-03-20 17:05:14.141', NULL, NULL);
INSERT INTO `wms_receipt_order` VALUES (433, 'R-2023-03-20-170714', 1, 32, NULL, NULL, 0, NULL, 1, 115, '2023-03-20 17:07:40.000', 115, '2023-03-20 17:07:46.200');
INSERT INTO `wms_receipt_order` VALUES (434, 'R-2023-03-20-170223', 1, 34, NULL, NULL, 0, NULL, 1, 115, '2023-03-20 17:12:06.850', NULL, NULL);
INSERT INTO `wms_receipt_order` VALUES (435, 'R-2023-03-20-172750', 1, NULL, NULL, NULL, 0, NULL, 1, 115, '2023-03-20 17:28:54.059', NULL, NULL);
INSERT INTO `wms_receipt_order` VALUES (436, 'R-2023-03-20-173014', 1, 33, 'fsdfsfds', NULL, 1, 'fdsfsdf', 1, 115, '2023-03-20 17:30:59.000', 115, '2023-03-20 20:59:06.463');
INSERT INTO `wms_receipt_order` VALUES (437, 'R-2023-03-20-221222', 1, 38, '8801', NULL, 3, NULL, 1, 115, '2023-03-20 22:13:42.000', 115, '2023-03-22 09:44:10.166');
INSERT INTO `wms_receipt_order` VALUES (438, 'R-2023-03-21-141407', 1, 38, 'regrer4', NULL, 0, '34fgd', 1, 115, '2023-03-21 14:14:12.087', NULL, NULL);
INSERT INTO `wms_receipt_order` VALUES (439, 'R-2023-03-21-164843', 1, 37, '1', NULL, 3, '1', 1, 115, '2023-03-21 16:48:54.000', 115, '2023-03-21 17:25:21.809');
INSERT INTO `wms_receipt_order` VALUES (440, 'R-2023-03-21-165904', 1, 37, '1', NULL, 3, '1', 1, 115, '2023-03-21 16:59:18.000', 115, '2023-03-21 17:24:15.447');
INSERT INTO `wms_receipt_order` VALUES (441, 'R-2023-03-21-193225', 1, 37, '1932', NULL, 3, NULL, 1, 115, '2023-03-21 19:32:52.000', 115, '2023-03-21 19:33:36.177');
INSERT INTO `wms_receipt_order` VALUES (442, 'R-2023-03-21-193443', 1, 37, '1934', NULL, 3, NULL, 1, 115, '2023-03-21 19:35:02.000', 115, '2023-03-21 19:35:15.580');
INSERT INTO `wms_receipt_order` VALUES (443, 'R-2023-03-22-001707', 1, NULL, NULL, NULL, 3, NULL, 1, 115, '2023-03-22 00:17:31.000', 115, '2023-03-22 00:18:02.130');
INSERT INTO `wms_receipt_order` VALUES (444, 'R-2023-03-22-125811', 1, NULL, NULL, NULL, 2, NULL, 1, 115, '2023-03-22 12:58:19.000', 115, '2023-03-22 12:58:50.545');
INSERT INTO `wms_receipt_order` VALUES (445, 'R-2023-03-22-152645', 1, 37, '15237', NULL, 3, NULL, 1, 115, '2023-03-22 15:27:54.000', 115, '2023-03-22 15:29:18.493');
INSERT INTO `wms_receipt_order` VALUES (446, 'R-2023-03-22-152954', 1, 37, '3.22', NULL, 3, NULL, 1, 115, '2023-03-22 15:30:18.000', 115, '2023-03-22 15:31:47.094');
INSERT INTO `wms_receipt_order` VALUES (447, 'R-2023-03-22-154443', 1, 37, '123', NULL, 0, NULL, 1, 115, '2023-03-22 15:44:50.327', NULL, NULL);
INSERT INTO `wms_receipt_order` VALUES (448, 'R-2023-03-22-155530', 1, 37, '123132', NULL, 3, NULL, 1, 115, '2023-03-22 15:55:43.000', 115, '2023-03-22 16:08:24.828');
INSERT INTO `wms_receipt_order` VALUES (449, 'R-2023-03-22-155913', 1, 40, '20230322', NULL, 0, NULL, 1, 115, '2023-03-22 15:59:32.000', 115, '2023-03-22 16:00:00.177');
INSERT INTO `wms_receipt_order` VALUES (450, 'R-2023-03-22-160828', 1, 40, '021212', NULL, 3, NULL, 1, 115, '2023-03-22 16:09:14.000', 115, '2023-03-22 16:10:18.479');
INSERT INTO `wms_receipt_order` VALUES (451, 'R-2023-03-22-224953', 1, 40, 'G2023033300001', NULL, 3, '电脑采购入库', 1, 115, '2023-03-22 22:50:52.000', 115, '2023-03-22 22:51:19.743');
INSERT INTO `wms_receipt_order` VALUES (452, 'R-2023-03-23-094543', 1, NULL, NULL, NULL, 2, NULL, 1, 115, '2023-03-23 09:46:12.000', 115, '2023-03-23 10:37:47.961');
INSERT INTO `wms_receipt_order` VALUES (453, 'R-2023-03-23-104053', 2, 40, NULL, NULL, 0, NULL, 1, 115, '2023-03-23 10:41:13.702', NULL, NULL);
INSERT INTO `wms_receipt_order` VALUES (454, 'R-2023-03-23-110454', 1, 39, NULL, NULL, 3, NULL, 1, 115, '2023-03-23 11:05:10.000', 115, '2023-03-23 11:05:57.998');
INSERT INTO `wms_receipt_order` VALUES (455, 'R-2023-03-23-110700', 1, NULL, NULL, NULL, 3, NULL, 1, 115, '2023-03-23 11:07:31.000', 115, '2023-03-23 11:07:53.421');
INSERT INTO `wms_receipt_order` VALUES (456, 'R-2023-03-23-111439', 3, 39, '1', NULL, 0, '1', 1, 115, '2023-03-23 11:14:56.490', NULL, NULL);
INSERT INTO `wms_receipt_order` VALUES (457, 'R-2023-03-23-133348', 1, NULL, NULL, NULL, 3, NULL, 1, 115, '2023-03-23 13:36:21.000', 115, '2023-03-23 13:39:53.484');
INSERT INTO `wms_receipt_order` VALUES (458, 'R-2023-03-23-134151', 1, NULL, NULL, NULL, 0, NULL, 1, 115, '2023-03-23 13:43:28.000', 115, '2023-03-23 13:47:17.603');
INSERT INTO `wms_receipt_order` VALUES (459, 'R-2023-03-23-140915', 1, NULL, NULL, NULL, 0, NULL, 1, 115, '2023-03-23 14:09:51.421', NULL, NULL);
INSERT INTO `wms_receipt_order` VALUES (460, 'R-2023-03-23-143353', 1, NULL, NULL, NULL, 0, NULL, 1, 115, '2023-03-23 14:34:13.456', NULL, NULL);
INSERT INTO `wms_receipt_order` VALUES (461, 'R-2023-03-23-143432', 1, NULL, NULL, NULL, 1, NULL, 1, 115, '2023-03-23 14:34:50.000', 115, '2023-03-23 14:35:36.741');
INSERT INTO `wms_receipt_order` VALUES (462, 'R-2023-03-23-143712', 3, NULL, NULL, NULL, 0, NULL, 1, 115, '2023-03-23 14:37:44.800', NULL, NULL);
INSERT INTO `wms_receipt_order` VALUES (463, 'R-2023-03-23-144433', 2, NULL, NULL, NULL, 1, NULL, 1, 115, '2023-03-23 14:45:09.000', 115, '2023-03-23 14:45:21.449');
INSERT INTO `wms_receipt_order` VALUES (464, 'R-2023-03-23-144954', 1, NULL, NULL, NULL, 0, NULL, 1, 115, '2023-03-23 14:51:05.291', NULL, NULL);
INSERT INTO `wms_receipt_order` VALUES (465, 'R-2023-03-23-145152', 1, 39, NULL, NULL, 0, NULL, 1, 115, '2023-03-23 14:52:00.897', NULL, NULL);
INSERT INTO `wms_receipt_order` VALUES (466, 'R-2023-03-23-145233', 1, 40, '刘老师', NULL, 0, '梅花四尺', 0, 115, '2023-03-23 14:53:06.000', 115, '2023-03-30 14:16:12.958');
INSERT INTO `wms_receipt_order` VALUES (467, 'R-2023-03-23-145745', 1, NULL, NULL, NULL, 0, NULL, 1, 115, '2023-03-23 14:57:49.248', NULL, NULL);
INSERT INTO `wms_receipt_order` VALUES (468, 'R-2023-03-23-150820', 1, NULL, NULL, NULL, 0, NULL, 1, 115, '2023-03-23 15:08:31.422', NULL, NULL);
INSERT INTO `wms_receipt_order` VALUES (469, 'R-2023-03-23-235114', 2, 40, '哎哎哎', NULL, 3, '点对点', 0, 115, '2023-03-23 23:51:53.000', 115, '2023-04-01 23:51:54.904');
INSERT INTO `wms_receipt_order` VALUES (470, 'R-2023-03-24-142429', 1, 37, '1111111', NULL, 3, '111111111111', 0, 115, '2023-03-24 14:24:44.000', 115, '2023-03-24 14:25:05.570');
INSERT INTO `wms_receipt_order` VALUES (471, 'R-2023-03-24-145728', 1, NULL, NULL, NULL, 0, NULL, 0, 115, '2023-03-24 14:57:30.000', 115, '2023-03-25 09:39:38.232');
INSERT INTO `wms_receipt_order` VALUES (472, 'R-2023-03-24-154701', 1, 39, NULL, NULL, 3, NULL, 0, 115, '2023-03-24 15:47:47.000', 115, '2023-03-24 15:51:08.114');
INSERT INTO `wms_receipt_order` VALUES (473, 'R-2023-03-25-151955', 1, 37, '666', NULL, 0, '666', 0, 115, '2023-03-25 15:20:24.283', NULL, NULL);
INSERT INTO `wms_receipt_order` VALUES (474, 'R-2023-03-25-152604', 1, 42, '001', NULL, 3, NULL, 0, 115, '2023-03-25 15:27:07.000', 115, '2023-03-25 15:27:42.067');
INSERT INTO `wms_receipt_order` VALUES (475, 'R-2023-03-25-164207', 1, NULL, NULL, NULL, 2, NULL, 0, 115, '2023-03-25 16:42:35.000', 115, '2023-03-29 14:36:12.005');
INSERT INTO `wms_receipt_order` VALUES (476, 'R-2023-03-26-195119', 1, NULL, NULL, NULL, 3, NULL, 0, 115, '2023-03-26 19:52:04.000', 115, '2023-03-26 19:52:24.491');
INSERT INTO `wms_receipt_order` VALUES (477, 'R-2023-03-27-111704', 1, 40, 'test001', NULL, 3, NULL, 0, 115, '2023-03-27 11:17:29.000', 115, '2023-03-27 11:18:43.739');
INSERT INTO `wms_receipt_order` VALUES (478, 'R-2023-03-27-111954', 1, 39, 'test010111111', NULL, 3, NULL, 0, 115, '2023-03-27 11:20:26.000', 115, '2023-03-27 11:22:04.546');
INSERT INTO `wms_receipt_order` VALUES (479, 'R-2023-03-27-142534', 1, 39, '11', NULL, 0, '111', 0, 115, '2023-03-27 14:25:46.896', NULL, NULL);
INSERT INTO `wms_receipt_order` VALUES (480, 'R-2023-03-27-170255', 1, 41, '123213213123123', NULL, 0, '123123123123213123', 0, 115, '2023-03-27 17:03:22.190', NULL, NULL);
INSERT INTO `wms_receipt_order` VALUES (481, 'R-2023-03-27-175706', 1, 39, NULL, NULL, 0, NULL, 0, 115, '2023-03-27 17:58:17.480', NULL, NULL);
INSERT INTO `wms_receipt_order` VALUES (482, 'R-2023-03-27-213057', 3, 41, NULL, NULL, 0, NULL, 0, 115, '2023-03-27 21:31:38.513', NULL, NULL);
INSERT INTO `wms_receipt_order` VALUES (483, 'R-2023-03-28-223034', 1, 37, NULL, NULL, 0, '22222222222', 0, 115, '2023-03-28 22:30:49.567', NULL, NULL);
INSERT INTO `wms_receipt_order` VALUES (484, 'R-2023-03-28-231554', 1, 41, NULL, NULL, 3, NULL, 0, 115, '2023-03-28 23:16:21.000', 115, '2023-03-29 14:00:17.570');
INSERT INTO `wms_receipt_order` VALUES (485, 'R-2023-03-29-114447', 1, NULL, '2121', NULL, 2, '2121', 0, 115, '2023-03-29 11:45:26.000', 115, '2023-03-29 15:04:23.615');
INSERT INTO `wms_receipt_order` VALUES (486, 'R-2023-03-29-132010', 1, NULL, NULL, NULL, 2, NULL, 0, 115, '2023-03-29 13:21:40.000', 115, '2023-03-29 14:40:09.644');
INSERT INTO `wms_receipt_order` VALUES (487, 'R-2023-03-29-151302', 1, NULL, '1231', NULL, 2, '1231', 0, 115, '2023-03-29 15:13:23.000', 115, '2023-03-30 12:00:59.822');
INSERT INTO `wms_receipt_order` VALUES (488, 'R-2023-03-30-152558', 1, 45, NULL, NULL, 0, NULL, 0, 115, '2023-03-30 15:26:23.712', NULL, NULL);
INSERT INTO `wms_receipt_order` VALUES (489, 'R-2023-03-30-173542', 1, NULL, NULL, NULL, 3, NULL, 0, 115, '2023-03-30 17:37:22.000', 115, '2023-03-31 14:31:38.905');
INSERT INTO `wms_receipt_order` VALUES (490, 'R-2023-03-30-182659', 1, NULL, NULL, NULL, 0, NULL, 0, 115, '2023-03-30 18:28:25.340', NULL, NULL);
INSERT INTO `wms_receipt_order` VALUES (491, 'R-2023-03-30-182722', 1, NULL, '123', NULL, 3, '买了100个本子', 0, 115, '2023-03-30 18:29:06.000', 115, '2023-03-30 18:29:22.366');
INSERT INTO `wms_receipt_order` VALUES (492, 'R-2023-03-30-183020', 1, NULL, NULL, NULL, 3, '买99个本子', 0, 115, '2023-03-30 18:32:09.000', 115, '2023-03-30 18:32:38.888');
INSERT INTO `wms_receipt_order` VALUES (493, 'R-2023-03-30-203551', 1, NULL, NULL, NULL, 0, NULL, 1, 115, '2023-03-30 20:36:42.000', 115, '2023-03-31 09:19:16.688');
INSERT INTO `wms_receipt_order` VALUES (494, 'R-2023-03-31-092819', 1, NULL, NULL, NULL, 0, NULL, 1, 115, '2023-03-31 09:28:54.163', NULL, NULL);
INSERT INTO `wms_receipt_order` VALUES (495, 'R-2023-04-01-143449', 1, 46, '12', NULL, 3, NULL, 0, 115, '2023-04-01 14:34:57.000', 115, '2023-04-03 13:17:47.522');
INSERT INTO `wms_receipt_order` VALUES (496, 'R-2023-04-03-090716', 1, 46, '123', NULL, 0, NULL, 1, 115, '2023-04-03 09:07:35.432', NULL, NULL);
INSERT INTO `wms_receipt_order` VALUES (497, 'R-2023-04-03-091935', 2, 46, '123434', NULL, 3, NULL, 0, 115, '2023-04-03 09:20:56.000', 115, '2023-04-03 09:21:08.892');
INSERT INTO `wms_receipt_order` VALUES (498, 'R-2023-04-03-093118', 1, 46, '2324324', NULL, 3, '对方是否', 0, 115, '2023-04-03 09:31:39.000', 115, '2023-04-03 09:31:56.827');
INSERT INTO `wms_receipt_order` VALUES (499, 'R-2023-04-03-131419', 1, NULL, NULL, NULL, 3, NULL, 0, 115, '2023-04-03 13:14:37.000', 115, '2023-04-03 13:16:25.362');
INSERT INTO `wms_receipt_order` VALUES (500, 'R-2023-04-03-133836', 1, NULL, NULL, NULL, 3, NULL, 0, 115, '2023-04-03 13:40:20.000', 115, '2023-04-03 13:48:21.584');
INSERT INTO `wms_receipt_order` VALUES (501, 'R-2023-04-03-135832', 1, NULL, NULL, NULL, 3, NULL, 0, 115, '2023-04-03 13:58:51.000', 115, '2023-04-03 14:01:22.081');
INSERT INTO `wms_receipt_order` VALUES (502, 'R-2023-04-03-140424', 1, NULL, NULL, NULL, 3, 'test', 0, 115, '2023-04-03 14:04:51.000', 115, '2023-04-03 14:22:41.999');
INSERT INTO `wms_receipt_order` VALUES (503, 'R-2023-04-03-141314', 1, 46, NULL, NULL, 2, NULL, 0, 115, '2023-04-03 14:14:49.000', 115, '2023-04-06 17:42:32.425');
INSERT INTO `wms_receipt_order` VALUES (504, 'R-2023-04-03-142320', 1, NULL, NULL, NULL, 3, NULL, 0, 115, '2023-04-03 14:23:35.000', 115, '2023-04-03 14:23:52.131');
INSERT INTO `wms_receipt_order` VALUES (505, 'R-2023-04-03-142404', 1, NULL, NULL, NULL, 3, NULL, 0, 115, '2023-04-03 14:24:16.000', 115, '2023-04-03 14:24:29.628');
INSERT INTO `wms_receipt_order` VALUES (506, 'R-2023-04-03-142453', 1, NULL, NULL, NULL, 3, NULL, 0, 115, '2023-04-03 14:25:05.000', 115, '2023-04-04 13:45:42.326');
INSERT INTO `wms_receipt_order` VALUES (507, 'R-2023-04-03-143725', 1, NULL, NULL, NULL, 0, NULL, 1, 115, '2023-04-03 14:37:30.517', NULL, NULL);
INSERT INTO `wms_receipt_order` VALUES (508, 'R-2023-04-03-152627', 1, 46, '123123', NULL, 0, '123', 1, 115, '2023-04-03 15:26:21.996', NULL, NULL);
INSERT INTO `wms_receipt_order` VALUES (509, 'R-2023-04-03-162242', 1, 46, NULL, NULL, 3, NULL, 0, 115, '2023-04-03 16:23:05.000', 115, '2023-04-03 16:25:21.881');
INSERT INTO `wms_receipt_order` VALUES (510, 'R-2023-04-04-134012', 1, NULL, 'asdasd', NULL, 3, 'asasdasd', 0, 115, '2023-04-04 13:40:27.000', 115, '2023-04-04 13:40:37.707');
INSERT INTO `wms_receipt_order` VALUES (511, 'R-2023-04-04-155230', 1, NULL, NULL, NULL, 3, NULL, 0, 115, '2023-04-04 15:52:46.000', 115, '2023-04-04 15:53:11.006');
INSERT INTO `wms_receipt_order` VALUES (512, 'R-2023-04-04-155451', 1, NULL, NULL, NULL, 3, NULL, 0, 115, '2023-04-04 15:55:12.000', 115, '2023-04-04 15:55:45.084');
INSERT INTO `wms_receipt_order` VALUES (513, 'R-2023-04-04-160304', 1, 47, 'dddddd', NULL, 0, 'ddd ', 0, 115, '2023-04-04 16:03:32.674', NULL, NULL);
INSERT INTO `wms_receipt_order` VALUES (514, 'R-2023-04-06-141005', 1, 48, '001', NULL, 3, '001', 0, 115, '2023-04-06 14:10:45.000', 115, '2023-04-06 14:13:57.984');
INSERT INTO `wms_receipt_order` VALUES (515, 'R-2023-04-06-151014', 1, 49, '000001', NULL, 3, NULL, 0, 115, '2023-04-06 15:11:32.000', 115, '2023-04-06 15:12:31.977');
INSERT INTO `wms_receipt_order` VALUES (516, 'R-2023-04-06-151916', 1, 49, '000001', NULL, 3, NULL, 0, 115, '2023-04-06 15:19:48.000', 115, '2023-04-06 15:20:02.022');
INSERT INTO `wms_receipt_order` VALUES (517, 'R-2023-04-06-175515', 1, 47, '885578785', NULL, 3, NULL, 0, 115, '2023-04-06 17:55:59.000', 115, '2023-04-06 17:57:00.874');
INSERT INTO `wms_receipt_order` VALUES (518, 'R-2023-04-06-175716', 1, NULL, NULL, NULL, 3, NULL, 0, 115, '2023-04-06 17:57:28.000', 115, '2023-04-06 18:02:20.500');
INSERT INTO `wms_receipt_order` VALUES (519, 'R-2023-04-06-175804', 1, NULL, NULL, NULL, 2, NULL, 0, 115, '2023-04-06 17:58:43.000', 115, '2023-04-06 18:02:05.741');
INSERT INTO `wms_receipt_order` VALUES (520, 'R-2023-04-06-180452', 1, NULL, NULL, NULL, 1, NULL, 0, 115, '2023-04-06 18:05:09.000', 115, '2023-04-07 17:56:53.387');
INSERT INTO `wms_receipt_order` VALUES (521, 'R-2023-04-06-214457', 1, 48, NULL, NULL, 0, NULL, 0, 115, '2023-04-06 21:45:19.000', 115, '2023-04-07 10:06:51.142');
INSERT INTO `wms_receipt_order` VALUES (522, 'R-2023-04-06-223251', 1, 47, NULL, NULL, 3, NULL, 0, 115, '2023-04-06 22:33:43.000', 115, '2023-04-06 22:34:08.233');
INSERT INTO `wms_receipt_order` VALUES (523, 'R-2023-04-06-224415', 1, 50, '800', NULL, 3, NULL, 0, 115, '2023-04-06 22:44:48.000', 115, '2023-04-06 22:45:01.095');
INSERT INTO `wms_receipt_order` VALUES (524, 'R-2023-04-07-093503', 1, 47, '777788899/*/*7*/', NULL, 2, NULL, 0, 115, '2023-04-07 09:36:00.000', 115, '2023-04-07 11:07:27.916');
INSERT INTO `wms_receipt_order` VALUES (525, 'R-2023-04-07-110707', 1, 47, NULL, NULL, 3, NULL, 0, 115, '2023-04-07 11:07:32.000', 115, '2023-04-07 11:11:55.470');
INSERT INTO `wms_receipt_order` VALUES (526, 'R-2023-04-08-175620', 1, NULL, NULL, NULL, 3, NULL, 0, 115, '2023-04-08 17:56:44.000', 115, '2023-04-08 21:37:28.923');
INSERT INTO `wms_receipt_order` VALUES (527, 'R-2023-04-09-171825', 1, 47, NULL, NULL, 0, NULL, 0, 115, '2023-04-09 17:19:49.953', NULL, NULL);
INSERT INTO `wms_receipt_order` VALUES (528, 'R-2023-04-10-091256', 3, 48, NULL, NULL, 3, NULL, 0, 115, '2023-04-10 09:13:14.000', 115, '2023-04-10 10:49:53.365');
INSERT INTO `wms_receipt_order` VALUES (529, 'R-2023-04-10-114135', 1, 49, 'HR0001', NULL, 0, 'lei', 0, 115, '2023-04-10 11:42:38.000', 115, '2023-04-10 11:44:02.127');
INSERT INTO `wms_receipt_order` VALUES (530, 'R-2023-04-10-144101', 2, 47, NULL, NULL, 3, NULL, 0, 115, '2023-04-10 14:41:31.000', 115, '2023-04-10 16:07:17.879');
INSERT INTO `wms_receipt_order` VALUES (531, 'R-2023-04-10-165002', 1, NULL, NULL, NULL, 3, NULL, 0, 115, '2023-04-10 16:50:16.000', 115, '2023-04-10 16:50:33.633');
INSERT INTO `wms_receipt_order` VALUES (532, 'R-2023-04-10-195143', 1, 48, NULL, NULL, 3, NULL, 0, 115, '2023-04-10 19:53:06.000', 115, '2023-04-10 19:53:21.525');
INSERT INTO `wms_receipt_order` VALUES (533, 'R-2023-04-11-120049', 1, 49, '2023041101201001', NULL, 3, NULL, 0, 115, '2023-04-11 12:02:06.000', 115, '2023-04-11 12:03:34.304');
INSERT INTO `wms_receipt_order` VALUES (534, 'R-2023-04-11-120359', 1, 50, '20230411022330', NULL, 2, NULL, 0, 115, '2023-04-11 12:04:47.000', 115, '2023-04-11 12:04:55.577');
INSERT INTO `wms_receipt_order` VALUES (535, 'R-2023-04-11-143906', 1, 47, '1210001', NULL, 3, '测试入库', 0, 115, '2023-04-11 14:41:29.000', 115, '2023-04-11 15:59:25.817');
INSERT INTO `wms_receipt_order` VALUES (536, 'R-2023-04-11-152420', 1, 47, '1212313', NULL, 2, NULL, 0, 115, '2023-04-11 15:24:44.000', 115, '2023-04-11 15:25:07.204');
INSERT INTO `wms_receipt_order` VALUES (537, 'R-2023-04-11-164808', 1, 47, '0411', NULL, 2, NULL, 0, 115, '2023-04-11 16:49:28.000', 115, '2023-04-11 16:56:03.323');
INSERT INTO `wms_receipt_order` VALUES (538, 'R-2023-04-11-174149', 1, 48, NULL, NULL, 0, NULL, 0, 115, '2023-04-11 17:42:25.000', 115, '2023-04-12 09:12:46.112');
INSERT INTO `wms_receipt_order` VALUES (539, 'R-2023-04-12-091342', 1, 47, '1111111', NULL, 3, 'test', 0, 115, '2023-04-12 09:14:27.000', 115, '2023-04-12 14:13:07.730');
INSERT INTO `wms_receipt_order` VALUES (540, 'R-2023-04-12-141326', 1, 51, '12t6y78', NULL, 0, '56789\n', 0, 115, '2023-04-12 14:14:22.052', NULL, NULL);
INSERT INTO `wms_receipt_order` VALUES (541, 'R-2023-04-12-165234', 1, 47, NULL, NULL, 3, NULL, 0, 115, '2023-04-12 16:53:03.000', 115, '2023-04-12 16:54:51.021');
INSERT INTO `wms_receipt_order` VALUES (542, 'R-2023-04-13-103200', 1, 47, '0001', NULL, 0, NULL, 0, 115, '2023-04-13 10:32:42.814', NULL, NULL);
INSERT INTO `wms_receipt_order` VALUES (543, 'R-2023-04-13-105455', 1, 47, '121212', NULL, 0, NULL, 0, 115, '2023-04-13 10:55:46.911', NULL, NULL);
INSERT INTO `wms_receipt_order` VALUES (544, 'R-2023-04-13-122249', 1, 47, '001', NULL, 3, NULL, 0, 115, '2023-04-13 12:23:19.000', 115, '2023-04-13 12:23:32.732');
INSERT INTO `wms_receipt_order` VALUES (545, 'R-2023-04-13-134609', 1, 48, '1111', NULL, 3, NULL, 0, 115, '2023-04-13 13:46:44.000', 115, '2023-04-13 13:54:23.429');
INSERT INTO `wms_receipt_order` VALUES (546, 'R-2023-04-13-135052', 1, 48, '1231231231313', NULL, 3, NULL, 0, 115, '2023-04-13 13:51:17.000', 115, '2023-04-13 13:52:02.653');
INSERT INTO `wms_receipt_order` VALUES (547, 'R-2023-04-13-135847', 1, 50, NULL, NULL, 0, NULL, 1, 115, '2023-04-13 13:58:59.402', NULL, NULL);
INSERT INTO `wms_receipt_order` VALUES (548, 'R-2023-04-13-140732', 1, 48, 'T202304131407', NULL, 1, NULL, 0, 115, '2023-04-13 14:08:11.000', 115, '2023-04-13 17:43:04.129');
INSERT INTO `wms_receipt_order` VALUES (549, 'R-2023-04-14-092034', 1, 52, '000054', NULL, 3, NULL, 0, 115, '2023-04-14 09:21:42.000', 115, '2023-04-14 11:23:28.657');
INSERT INTO `wms_receipt_order` VALUES (550, 'R-2023-04-14-131307', 1, 52, '0008', NULL, NULL, NULL, 0, 115, '2023-04-14 13:13:41.000', 115, '2023-04-14 13:13:58.030');
INSERT INTO `wms_receipt_order` VALUES (551, 'R-2023-04-14-155105', 1, 52, NULL, NULL, 3, NULL, 0, 115, '2023-04-14 15:52:04.000', 115, '2023-04-14 15:52:52.053');
INSERT INTO `wms_receipt_order` VALUES (552, 'R-2023-04-14-161943', 1, NULL, NULL, NULL, 0, NULL, 0, 115, '2023-04-14 16:23:49.000', 115, '2023-04-14 17:04:52.313');
INSERT INTO `wms_receipt_order` VALUES (553, 'R-2023-04-14-175419', 1, 52, NULL, NULL, 0, NULL, 0, 115, '2023-04-14 17:54:54.375', NULL, NULL);
INSERT INTO `wms_receipt_order` VALUES (554, 'R-2023-04-14-175950', 3, 52, '111', NULL, 0, '1111', 1, 115, '2023-04-14 18:00:12.000', 115, '2023-04-14 18:01:22.102');
INSERT INTO `wms_receipt_order` VALUES (555, 'R-2023-04-15-090831', 1, 52, '001', NULL, 2, '阿萨', 0, 115, '2023-04-15 09:09:26.000', 115, '2023-04-15 09:09:42.357');
INSERT INTO `wms_receipt_order` VALUES (556, 'R-2023-04-15-094424', 1, 52, '110', NULL, 1, NULL, 0, 115, '2023-04-15 09:44:37.000', 115, '2023-04-15 09:57:02.348');
INSERT INTO `wms_receipt_order` VALUES (557, 'R-2023-04-15-102637', 1, NULL, '999', NULL, 0, NULL, 0, 115, '2023-04-15 10:27:02.000', 115, '2023-04-15 21:37:15.383');
INSERT INTO `wms_receipt_order` VALUES (558, 'R-2023-04-15-140641', 1, 52, NULL, NULL, 0, NULL, 0, 115, '2023-04-15 14:06:59.000', 115, '2023-04-15 21:37:09.824');
INSERT INTO `wms_receipt_order` VALUES (559, 'R-2023-04-15-160043', 1, NULL, NULL, NULL, 0, NULL, 0, 115, '2023-04-15 16:01:10.742', NULL, NULL);
INSERT INTO `wms_receipt_order` VALUES (560, 'R-2023-04-15-162252', 1, NULL, 'xx-111000', NULL, 2, NULL, 0, 115, '2023-04-15 16:23:15.000', 115, '2023-04-15 16:48:15.422');
INSERT INTO `wms_receipt_order` VALUES (561, 'R-2023-04-15-162643', 1, 52, 'sfsd', NULL, 3, 'dfs', 0, 115, '2023-04-15 16:27:09.000', 115, '2023-04-15 16:27:27.869');
INSERT INTO `wms_receipt_order` VALUES (562, 'R-2023-04-15-204444', 1, 52, '1212', NULL, 3, '121', 0, 115, '2023-04-15 20:45:17.000', 115, '2023-04-15 20:45:45.175');
INSERT INTO `wms_receipt_order` VALUES (563, 'R-2023-04-15-230524', 1, 52, NULL, NULL, 0, NULL, 0, 115, '2023-04-15 23:06:47.000', 115, '2023-04-15 23:06:55.173');
INSERT INTO `wms_receipt_order` VALUES (564, 'R-2023-04-17-094958', 1, 52, 'ds122234452211', NULL, 0, NULL, 0, 115, '2023-04-17 09:51:41.388', NULL, NULL);
INSERT INTO `wms_receipt_order` VALUES (565, 'R-2023-04-17-133037', 1, 52, '2000', NULL, 2, NULL, 0, 115, '2023-04-17 13:31:23.000', 115, '2023-04-17 13:33:54.151');
INSERT INTO `wms_receipt_order` VALUES (566, 'R-2023-04-17-154127', 1, 52, 'iphone', NULL, 2, NULL, 0, 115, '2023-04-17 15:42:19.000', 115, '2023-04-17 15:43:40.419');
INSERT INTO `wms_receipt_order` VALUES (567, 'R-2023-04-17-173254', 1, NULL, NULL, NULL, 3, NULL, 0, 115, '2023-04-17 17:33:04.000', 115, '2023-04-19 23:04:23.170');
INSERT INTO `wms_receipt_order` VALUES (568, 'R-2023-04-18-132602', 1, 52, '556666', NULL, 3, NULL, 0, 115, '2023-04-18 13:26:49.000', 115, '2023-04-18 13:28:06.108');
INSERT INTO `wms_receipt_order` VALUES (569, 'R-2023-04-18-210337', 1, 52, NULL, NULL, 3, NULL, 0, 115, '2023-04-18 21:04:07.000', 115, '2023-04-19 23:03:23.587');
INSERT INTO `wms_receipt_order` VALUES (570, 'R-2023-04-18-211542', 1, 52, '莪术胡索', NULL, 0, NULL, 0, 115, '2023-04-18 21:16:17.385', NULL, NULL);
INSERT INTO `wms_receipt_order` VALUES (571, 'R-2023-04-19-092256', 1, 52, NULL, NULL, 3, NULL, 0, 115, '2023-04-19 09:23:48.000', 115, '2023-04-19 09:24:19.790');
INSERT INTO `wms_receipt_order` VALUES (572, 'R-2023-04-19-144008', 1, NULL, NULL, NULL, 3, NULL, 0, 115, '2023-04-19 14:40:46.000', 115, '2023-04-19 21:07:55.595');
INSERT INTO `wms_receipt_order` VALUES (573, 'R-2023-04-19-110139', 1, 52, NULL, NULL, 0, NULL, 0, 115, '2023-04-19 23:02:10.908', NULL, NULL);
INSERT INTO `wms_receipt_order` VALUES (574, 'R-2023-04-20-093754', 1, NULL, NULL, NULL, 0, NULL, 0, 115, '2023-04-20 09:38:25.000', 115, '2023-04-20 09:40:28.437');
INSERT INTO `wms_receipt_order` VALUES (575, 'R-2023-04-20-113035', 1, 52, NULL, NULL, 0, NULL, 0, 115, '2023-04-20 11:31:03.166', NULL, NULL);
INSERT INTO `wms_receipt_order` VALUES (576, 'R-2023-04-20-164905', 3, 52, '', NULL, 0, NULL, 0, 115, '2023-04-20 16:49:30.114', NULL, NULL);
INSERT INTO `wms_receipt_order` VALUES (577, 'R-2023-04-20-201813', 1, 52, '43334', NULL, 0, '3434344343', 0, 115, '2023-04-20 20:18:41.000', 115, '2023-04-21 15:23:39.720');
INSERT INTO `wms_receipt_order` VALUES (578, 'R-2023-04-20-222713', 1, 52, NULL, NULL, 0, NULL, 0, 115, '2023-04-20 22:27:31.952', NULL, NULL);
INSERT INTO `wms_receipt_order` VALUES (579, 'R-2023-04-21-091131', 1, 52, 'PO123456', NULL, 1, NULL, 0, 115, '2023-04-21 09:12:11.000', 115, '2023-04-22 12:08:39.599');
INSERT INTO `wms_receipt_order` VALUES (580, 'R-2023-04-21-145553', 2, 52, NULL, NULL, 0, NULL, 0, 115, '2023-04-21 14:56:15.000', 115, '2023-04-21 15:31:49.246');
INSERT INTO `wms_receipt_order` VALUES (581, 'R-2023-04-21-164531', 1, 52, '1111', NULL, 0, '11', 0, 115, '2023-04-21 16:44:35.555', NULL, NULL);
INSERT INTO `wms_receipt_order` VALUES (582, 'R-2023-04-21-164545', 1, 52, '500', NULL, 0, NULL, 0, 115, '2023-04-21 16:44:55.853', NULL, NULL);
INSERT INTO `wms_receipt_order` VALUES (583, 'R-2023-04-22-145410', 1, 52, 'afaf', NULL, 0, 'adad', 0, 115, '2023-04-22 14:54:41.000', 115, '2023-04-22 21:20:50.514');
INSERT INTO `wms_receipt_order` VALUES (584, 'R-2023-04-22-191440', 1, NULL, NULL, NULL, 3, NULL, 0, 115, '2023-04-22 19:15:10.000', 115, '2023-04-22 19:15:25.152');
INSERT INTO `wms_receipt_order` VALUES (585, 'R-2023-04-22-191619', 1, 52, NULL, NULL, 3, NULL, 0, 115, '2023-04-22 19:16:52.000', 115, '2023-04-22 19:17:01.755');
INSERT INTO `wms_receipt_order` VALUES (586, 'R-2023-04-22-211946', 3, 52, NULL, NULL, 2, NULL, 0, 115, '2023-04-22 21:20:23.000', 115, '2023-04-23 14:01:12.846');
INSERT INTO `wms_receipt_order` VALUES (587, 'R-2023-04-23-135017', 1, 52, '202304231450', NULL, 0, NULL, 0, 115, '2023-04-23 13:50:51.000', 115, '2023-04-23 13:52:04.235');
INSERT INTO `wms_receipt_order` VALUES (588, 'R-2023-04-23-143509', 1, 52, '20230423', NULL, 0, NULL, 0, 115, '2023-04-23 14:35:47.000', 115, '2023-04-23 16:58:36.362');
INSERT INTO `wms_receipt_order` VALUES (589, 'R-2023-04-24-093736', 1, 52, '111', NULL, 0, NULL, 0, 115, '2023-04-24 09:38:32.561', NULL, NULL);
INSERT INTO `wms_receipt_order` VALUES (590, 'R-2023-04-24-102509', 1, 52, '2342yte343458', NULL, 0, '4566', 0, 115, '2023-04-24 10:27:16.000', 115, '2023-04-24 14:24:33.274');
INSERT INTO `wms_receipt_order` VALUES (591, 'R-2023-04-24-103436', 1, 52, NULL, NULL, 3, NULL, 0, 115, '2023-04-24 10:35:21.000', 115, '2023-04-24 10:35:48.451');
INSERT INTO `wms_receipt_order` VALUES (592, 'R-2023-04-24-153509', 1, 52, '12123132', NULL, 3, '123123', 0, 115, '2023-04-24 15:35:31.000', 115, '2023-04-24 15:36:26.683');
INSERT INTO `wms_receipt_order` VALUES (593, 'R-2023-04-24-154707', 1, 52, '212132', NULL, 0, '76trytrr756', 0, 115, '2023-04-24 16:03:04.131', NULL, NULL);
INSERT INTO `wms_receipt_order` VALUES (594, 'R-2023-04-25-110948', 1, 52, NULL, NULL, 3, NULL, 0, 115, '2023-04-25 11:10:43.000', 115, '2023-04-29 13:56:40.366');
INSERT INTO `wms_receipt_order` VALUES (595, 'R-2023-04-25-144508', 1, 52, NULL, NULL, 3, NULL, 0, 115, '2023-04-25 14:46:57.000', 115, '2023-04-25 14:56:10.813');
INSERT INTO `wms_receipt_order` VALUES (596, 'R-2023-04-25-153614', 1, 52, NULL, NULL, 0, NULL, 1, 115, '2023-04-25 15:36:50.398', NULL, NULL);
INSERT INTO `wms_receipt_order` VALUES (597, 'R-2023-04-25-155353', 1, 52, '12312', NULL, 3, 'aaaaaaaaaaaaaaaaafffffffffffffffff', 0, 115, '2023-04-25 15:54:16.000', 115, '2023-04-25 15:54:34.276');
INSERT INTO `wms_receipt_order` VALUES (598, 'R-2023-04-25-164843', 1, NULL, '222222222，', NULL, 3, NULL, 0, 115, '2023-04-25 16:52:53.000', 115, '2023-04-26 11:05:08.748');
INSERT INTO `wms_receipt_order` VALUES (599, 'R-2023-04-25-183027', 1, 52, '1212', NULL, 3, NULL, 0, 115, '2023-04-25 18:30:46.000', 115, '2023-04-25 18:32:41.346');
INSERT INTO `wms_receipt_order` VALUES (600, 'R-2023-04-26-170434', 1, 52, '123', NULL, 0, '123', 0, 115, '2023-04-26 17:09:11.000', 115, '2023-04-27 18:36:04.748');
INSERT INTO `wms_receipt_order` VALUES (601, 'R-2023-04-26-171740', 1, NULL, NULL, NULL, 3, NULL, 1, 115, '2023-04-26 17:17:27.000', 115, '2023-04-26 17:17:59.220');
INSERT INTO `wms_receipt_order` VALUES (602, 'R-2023-04-26-171718', 1, 52, '手打订单号', 0.00, 0, 'textarea测试', 0, 115, '2023-04-26 17:17:36.000', 115, '2023-04-30 22:24:55.498');
INSERT INTO `wms_receipt_order` VALUES (603, 'R-2023-04-28-151535', 1, NULL, NULL, NULL, 0, NULL, 0, 1, '2023-04-28 15:20:58.779', NULL, NULL);
INSERT INTO `wms_receipt_order` VALUES (609, 'R-2023-04-28-174905', 1, 52, '1111111111', 111.00, 0, '11111111111111111111111111111111111111111111111111111111111111', 0, 1, '2023-04-28 17:50:28.000', 115, '2023-04-29 13:56:10.481');
INSERT INTO `wms_receipt_order` VALUES (610, 'R-2023-04-29-171402', 1, NULL, NULL, 222.00, 0, NULL, 0, 115, '2023-04-29 17:14:23.153', NULL, NULL);
INSERT INTO `wms_receipt_order` VALUES (611, 'R-2023-04-30-152334', 1, 52, '1', 5.00, 3, NULL, 0, 115, '2023-04-30 15:24:48.000', 115, '2023-04-30 16:33:48.759');
INSERT INTO `wms_receipt_order` VALUES (612, 'R-2023-04-30-164132', 1, NULL, NULL, NULL, 0, NULL, 0, 115, '2023-04-30 16:43:13.849', NULL, NULL);
INSERT INTO `wms_receipt_order` VALUES (613, 'R-2023-05-01-041559', 1, 52, '6666', 6.66, 0, '66666', 0, 115, '2023-05-01 04:16:23.532', NULL, NULL);
INSERT INTO `wms_receipt_order` VALUES (614, 'R-2023-05-01-045400', 2, 52, '555555', 2.00, 0, '5555555588', 0, 115, '2023-05-01 04:54:53.000', 115, '2023-05-01 23:17:49.494');
INSERT INTO `wms_receipt_order` VALUES (615, 'R-2023-05-02-000747', 1, 52, '手殴打', 1.00, 0, NULL, 0, 115, '2023-05-02 00:07:58.078', NULL, NULL);
INSERT INTO `wms_receipt_order` VALUES (616, 'R-2023-05-02-155915', 1, 52, NULL, 11.00, 0, NULL, 0, 115, '2023-05-02 15:59:42.959', NULL, NULL);
INSERT INTO `wms_receipt_order` VALUES (617, 'R-2023-05-03-033206', 1, 52, NULL, 3.00, 0, NULL, 1, 115, '2023-05-03 03:32:40.703', NULL, NULL);
INSERT INTO `wms_receipt_order` VALUES (618, 'R-2023-05-03-033259', 1, 52, '666666666', 2.00, 0, NULL, 0, 115, '2023-05-03 03:33:36.397', NULL, NULL);
INSERT INTO `wms_receipt_order` VALUES (619, 'R-2023-05-03-033345', 1, 52, '88888888888', 1.00, 0, '888888888888888888', 0, 115, '2023-05-03 03:34:15.921', NULL, NULL);
INSERT INTO `wms_receipt_order` VALUES (620, 'R-2023-05-03-110802', 1, 52, NULL, 1.00, 0, NULL, 0, 115, '2023-05-03 11:08:37.000', 115, '2023-05-04 13:35:26.405');
INSERT INTO `wms_receipt_order` VALUES (621, 'R-2023-05-04-103434', 1, 52, NULL, 11.00, 3, NULL, 0, 115, '2023-05-04 10:35:16.000', 115, '2023-05-04 10:35:32.651');
INSERT INTO `wms_receipt_order` VALUES (622, 'R-2023-05-04-105751', 1, NULL, NULL, NULL, 0, NULL, 0, 115, '2023-05-04 10:57:52.438', NULL, NULL);
INSERT INTO `wms_receipt_order` VALUES (624, 'R-2023-05-04-135306', 1, 52, '123456', 10.00, 0, '113231231', 0, 1, '2023-05-04 13:53:24.617', NULL, NULL);
INSERT INTO `wms_receipt_order` VALUES (625, 'R-2023-05-04-164043', 1, 52, '234233', 700000.00, 3, 'ruku', 0, 115, '2023-05-04 16:41:24.000', 115, '2023-05-04 16:41:42.011');

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
) ENGINE = InnoDB AUTO_INCREMENT = 2642 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '入库单详情' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wms_receipt_order_detail
-- ----------------------------
INSERT INTO `wms_receipt_order_detail` VALUES (184, 9, 1, 1000.00, 10.00, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 1, 13, 3);
INSERT INTO `wms_receipt_order_detail` VALUES (185, 9, 2, 1000.00, 1.00, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 1, 13, 2);
INSERT INTO `wms_receipt_order_detail` VALUES (190, 8, 1, 200.00, 20.00, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2);
INSERT INTO `wms_receipt_order_detail` VALUES (191, 8, 2, 200.00, 1.00, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `wms_receipt_order_detail` VALUES (204, 11, 1, 15.00, 14.00, 1, NULL, 0, NULL, NULL, NULL, NULL, NULL, 1, 13, 2);
INSERT INTO `wms_receipt_order_detail` VALUES (205, 11, 2, 15.00, 14.00, 6, NULL, 0, NULL, NULL, NULL, NULL, NULL, 2, 18, 2);
INSERT INTO `wms_receipt_order_detail` VALUES (218, 12, 1, 10.00, 3.00, 5, NULL, 0, NULL, NULL, NULL, NULL, NULL, 1, 13, 2);
INSERT INTO `wms_receipt_order_detail` VALUES (219, 12, 2, 10.00, 3.00, 1, NULL, 0, NULL, NULL, NULL, NULL, NULL, 1, 13, 2);
INSERT INTO `wms_receipt_order_detail` VALUES (228, 7, 1, 10000.00, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0);
INSERT INTO `wms_receipt_order_detail` VALUES (229, 7, 2, 10000.00, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0);
INSERT INTO `wms_receipt_order_detail` VALUES (248, 13, 1, 10.00, 10.00, 1, NULL, 0, NULL, NULL, NULL, NULL, NULL, 1, 13, 2);
INSERT INTO `wms_receipt_order_detail` VALUES (249, 13, 2, 10.00, 6.00, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 3, 16, 2);
INSERT INTO `wms_receipt_order_detail` VALUES (256, 16, 1, 1.00, 1.00, 7, NULL, 0, NULL, NULL, NULL, NULL, NULL, 3, 16, 2);
INSERT INTO `wms_receipt_order_detail` VALUES (268, 19, 1, 5.00, 5.00, 8, NULL, 0, NULL, NULL, NULL, NULL, NULL, 20, 42, 3);
INSERT INTO `wms_receipt_order_detail` VALUES (269, 19, 2, 8.00, 8.00, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 20, 41, 3);
INSERT INTO `wms_receipt_order_detail` VALUES (270, 18, 1, 1.00, 12.00, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 1, 13, 0);
INSERT INTO `wms_receipt_order_detail` VALUES (271, 14, 1, 1.00, 5.00, 1, NULL, 0, NULL, NULL, NULL, NULL, NULL, 1, 13, 3);
INSERT INTO `wms_receipt_order_detail` VALUES (272, 14, 2, 1.00, 1.00, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 2, 18, 3);
INSERT INTO `wms_receipt_order_detail` VALUES (273, 15, 1, 2.00, 1.00, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 4, NULL, 1);
INSERT INTO `wms_receipt_order_detail` VALUES (274, 21, 2, 1.00, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 3, 14, 0);
INSERT INTO `wms_receipt_order_detail` VALUES (284, 22, 1, 6.00, 6.00, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 1, 13, 3);
INSERT INTO `wms_receipt_order_detail` VALUES (285, 22, 2, 3.00, 1.00, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 2, 18, 3);
INSERT INTO `wms_receipt_order_detail` VALUES (288, 23, 1, 3.00, 1.00, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 3, 14, 3);
INSERT INTO `wms_receipt_order_detail` VALUES (289, 25, 1, 1000.00, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 2, 17, 0);
INSERT INTO `wms_receipt_order_detail` VALUES (290, 25, 2, 1.00, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `wms_receipt_order_detail` VALUES (291, 25, 3, 1.00, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `wms_receipt_order_detail` VALUES (292, 25, 4, 1.00, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `wms_receipt_order_detail` VALUES (293, 26, 1, 1.00, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `wms_receipt_order_detail` VALUES (294, 26, 2, 1.00, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `wms_receipt_order_detail` VALUES (296, 28, 1, 3.00, 4.00, 4, NULL, 0, NULL, NULL, NULL, NULL, NULL, 4, 14, 0);
INSERT INTO `wms_receipt_order_detail` VALUES (301, 29, 5, 5.00, 1.00, 6, NULL, 0, NULL, NULL, NULL, NULL, NULL, 2, 18, 3);
INSERT INTO `wms_receipt_order_detail` VALUES (320, 31, 7, 500.00, 600.00, 9, NULL, 0, NULL, NULL, NULL, NULL, NULL, 21, 43, 3);
INSERT INTO `wms_receipt_order_detail` VALUES (321, 31, 8, 100.00, 200.00, 11, NULL, 0, NULL, NULL, NULL, NULL, NULL, 21, 44, 3);
INSERT INTO `wms_receipt_order_detail` VALUES (322, 32, 4, 3.00, NULL, 1, NULL, 0, NULL, NULL, NULL, NULL, NULL, 2, 17, 0);
INSERT INTO `wms_receipt_order_detail` VALUES (323, 32, 5, 3.00, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `wms_receipt_order_detail` VALUES (324, 32, 1, 1.00, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `wms_receipt_order_detail` VALUES (325, 32, 10, 1.00, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `wms_receipt_order_detail` VALUES (356, 33, 1, 2.00, 1.00, 17, NULL, 0, NULL, NULL, NULL, NULL, NULL, 25, 50, 3);
INSERT INTO `wms_receipt_order_detail` VALUES (357, 33, 2, 2.00, 1.00, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 2, 18, 3);
INSERT INTO `wms_receipt_order_detail` VALUES (358, 33, 3, 2.00, 1.00, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 3, 14, 3);
INSERT INTO `wms_receipt_order_detail` VALUES (359, 33, 4, 1.00, 1.00, 1, NULL, 0, NULL, NULL, NULL, NULL, NULL, 2, 17, 3);
INSERT INTO `wms_receipt_order_detail` VALUES (360, 33, 5, 1.00, 1.00, 6, NULL, 0, NULL, NULL, NULL, NULL, NULL, 2, 18, 3);
INSERT INTO `wms_receipt_order_detail` VALUES (361, 33, 6, 1.00, 1.00, 1, NULL, 0, NULL, NULL, NULL, NULL, NULL, 2, 17, 3);
INSERT INTO `wms_receipt_order_detail` VALUES (362, 33, 7, 1.00, 1.00, 9, NULL, 0, NULL, NULL, NULL, NULL, NULL, 21, 43, 3);
INSERT INTO `wms_receipt_order_detail` VALUES (363, 33, 8, 1.00, 1.00, 11, NULL, 0, NULL, NULL, NULL, NULL, NULL, 21, 44, 3);
INSERT INTO `wms_receipt_order_detail` VALUES (364, 33, 9, 1.00, 1.00, 12, NULL, 0, NULL, NULL, NULL, NULL, NULL, 22, 46, 3);
INSERT INTO `wms_receipt_order_detail` VALUES (365, 33, 10, 1.00, 1.00, 14, NULL, 0, NULL, NULL, NULL, NULL, NULL, 23, 47, 3);
INSERT INTO `wms_receipt_order_detail` VALUES (366, 34, 12, 1.00, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `wms_receipt_order_detail` VALUES (368, 35, 12, 1.00, 1.00, 17, NULL, 0, NULL, NULL, NULL, NULL, NULL, 25, 50, 2);
INSERT INTO `wms_receipt_order_detail` VALUES (375, 36, 12, 1.00, 1.00, 17, NULL, 0, NULL, NULL, NULL, NULL, NULL, 25, 50, 1);
INSERT INTO `wms_receipt_order_detail` VALUES (376, 36, 13, 1.00, 1.00, 4, NULL, 0, NULL, NULL, NULL, NULL, NULL, 4, 14, 3);
INSERT INTO `wms_receipt_order_detail` VALUES (380, 39, 12, 1.00, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `wms_receipt_order_detail` VALUES (381, 37, 12, 1.00, 1.00, 1, NULL, 0, NULL, NULL, NULL, NULL, NULL, 2, 17, 1);
INSERT INTO `wms_receipt_order_detail` VALUES (382, 37, 13, 1.00, 1.00, 1, NULL, 0, NULL, NULL, NULL, NULL, NULL, 2, 17, 0);
INSERT INTO `wms_receipt_order_detail` VALUES (383, 38, 12, 3.00, 1.00, 17, NULL, 0, NULL, NULL, NULL, NULL, NULL, 25, 50, 1);
INSERT INTO `wms_receipt_order_detail` VALUES (385, 40, 13, 1.00, 1.00, 4, NULL, 0, NULL, NULL, NULL, NULL, NULL, 4, 14, 1);
INSERT INTO `wms_receipt_order_detail` VALUES (386, 41, 12, 1.00, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 2, NULL, 0);
INSERT INTO `wms_receipt_order_detail` VALUES (393, 42, 12, 1.00, 1.00, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 2, 44, 3);
INSERT INTO `wms_receipt_order_detail` VALUES (394, 42, 13, 1.00, 1.00, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 2, 44, 3);
INSERT INTO `wms_receipt_order_detail` VALUES (395, 42, 14, 1.00, 1.00, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 2, 44, 3);
INSERT INTO `wms_receipt_order_detail` VALUES (399, 43, 12, 2.00, NULL, 13, NULL, 0, NULL, NULL, NULL, NULL, NULL, 2, 44, 0);
INSERT INTO `wms_receipt_order_detail` VALUES (400, 43, 13, 1.00, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `wms_receipt_order_detail` VALUES (401, 43, 14, 1.00, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `wms_receipt_order_detail` VALUES (402, 45, 13, 17.00, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 4, NULL, 0);
INSERT INTO `wms_receipt_order_detail` VALUES (403, 46, 12, 1.00, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `wms_receipt_order_detail` VALUES (404, 46, 13, 1.00, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `wms_receipt_order_detail` VALUES (406, 47, 12, 1.00, 1.00, 17, NULL, 0, NULL, NULL, NULL, NULL, NULL, 25, 50, 1);
INSERT INTO `wms_receipt_order_detail` VALUES (409, 48, 17, 50.00, 1.00, 13, NULL, 0, NULL, NULL, NULL, NULL, NULL, 2, 44, 3);
INSERT INTO `wms_receipt_order_detail` VALUES (410, 49, 12, 1.00, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `wms_receipt_order_detail` VALUES (417, 44, 12, 4.00, 1.00, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 4, NULL, 3);
INSERT INTO `wms_receipt_order_detail` VALUES (418, 44, 13, 4.00, 1.00, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 14, NULL, 2);
INSERT INTO `wms_receipt_order_detail` VALUES (419, 44, 14, 1.00, 1.00, 13, NULL, 0, NULL, NULL, NULL, NULL, NULL, 2, 44, 2);
INSERT INTO `wms_receipt_order_detail` VALUES (430, 50, 12, 1.00, 3.00, 13, NULL, 0, NULL, NULL, NULL, NULL, NULL, 2, 44, 3);
INSERT INTO `wms_receipt_order_detail` VALUES (431, 50, 13, 1.00, 1.00, 13, NULL, 0, NULL, NULL, NULL, NULL, NULL, 2, 44, 3);
INSERT INTO `wms_receipt_order_detail` VALUES (432, 51, 12, 1.00, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `wms_receipt_order_detail` VALUES (433, 51, 13, 1.00, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `wms_receipt_order_detail` VALUES (444, 54, 20, 20.00, 20.00, 13, NULL, 0, NULL, NULL, NULL, NULL, NULL, 2, 44, 3);
INSERT INTO `wms_receipt_order_detail` VALUES (452, 56, 12, 3.00, 3.00, 13, NULL, 0, NULL, NULL, NULL, NULL, NULL, 2, 44, 3);
INSERT INTO `wms_receipt_order_detail` VALUES (453, 53, 20, 1.00, 4.00, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 4, NULL, 3);
INSERT INTO `wms_receipt_order_detail` VALUES (456, 57, 21, 2000.00, 2000.00, 20, NULL, 0, NULL, NULL, NULL, NULL, NULL, 27, 52, 3);
INSERT INTO `wms_receipt_order_detail` VALUES (457, 58, 12, 4.00, NULL, 19, NULL, 0, NULL, NULL, NULL, NULL, NULL, 14, 46, 0);
INSERT INTO `wms_receipt_order_detail` VALUES (458, 55, 20, 30.00, 29.00, 13, NULL, 0, NULL, NULL, NULL, NULL, NULL, 2, 44, 3);
INSERT INTO `wms_receipt_order_detail` VALUES (459, 52, 12, 2.00, 1.00, 17, NULL, 0, NULL, NULL, NULL, NULL, NULL, 25, 50, 0);
INSERT INTO `wms_receipt_order_detail` VALUES (460, 52, 14, 1.00, 1.00, 18, NULL, 0, NULL, NULL, NULL, NULL, NULL, 26, 51, 0);
INSERT INTO `wms_receipt_order_detail` VALUES (463, 59, 12, 22.00, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 14, 53, 0);
INSERT INTO `wms_receipt_order_detail` VALUES (464, 59, 13, 13.00, NULL, 20, NULL, 0, NULL, NULL, NULL, NULL, NULL, 27, 52, 0);
INSERT INTO `wms_receipt_order_detail` VALUES (465, 60, 14, 1.00, NULL, 13, NULL, 0, NULL, NULL, NULL, NULL, NULL, 2, 44, 0);
INSERT INTO `wms_receipt_order_detail` VALUES (475, 61, 13, 1.00, NULL, 21, NULL, 0, NULL, NULL, NULL, NULL, NULL, 2, 45, 0);
INSERT INTO `wms_receipt_order_detail` VALUES (476, 61, 15, 1.00, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `wms_receipt_order_detail` VALUES (477, 61, 16, 1.00, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `wms_receipt_order_detail` VALUES (478, 61, 17, 1.00, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `wms_receipt_order_detail` VALUES (479, 61, 18, 1.00, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `wms_receipt_order_detail` VALUES (480, 61, 19, 1.00, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `wms_receipt_order_detail` VALUES (481, 61, 20, 1.00, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `wms_receipt_order_detail` VALUES (482, 61, 21, 1.00, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `wms_receipt_order_detail` VALUES (525, 62, 17, 1.00, 1.00, 13, NULL, 0, NULL, NULL, NULL, NULL, NULL, 2, 44, 4);
INSERT INTO `wms_receipt_order_detail` VALUES (526, 62, 18, 1.00, 1.00, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 4, NULL, 4);
INSERT INTO `wms_receipt_order_detail` VALUES (527, 62, 19, 1.00, 1.00, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 14, 53, 4);
INSERT INTO `wms_receipt_order_detail` VALUES (534, 67, 13, 1.00, 1.00, 4, NULL, 0, NULL, NULL, NULL, NULL, NULL, 4, 14, 3);
INSERT INTO `wms_receipt_order_detail` VALUES (535, 66, 14, 1.00, 1.00, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 4, NULL, 2);
INSERT INTO `wms_receipt_order_detail` VALUES (536, 65, 13, 1.00, 1.00, 19, NULL, 0, NULL, NULL, NULL, NULL, NULL, 14, 46, 1);
INSERT INTO `wms_receipt_order_detail` VALUES (538, 63, 13, 1.00, 1.00, 4, NULL, 0, NULL, NULL, NULL, NULL, NULL, 4, 14, 4);
INSERT INTO `wms_receipt_order_detail` VALUES (539, 63, 14, 1.00, 1.00, 18, NULL, 0, NULL, NULL, NULL, NULL, NULL, 26, 51, 4);
INSERT INTO `wms_receipt_order_detail` VALUES (540, 63, 16, 1.00, 1.00, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4);
INSERT INTO `wms_receipt_order_detail` VALUES (541, 63, 17, 1.00, 1.00, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4);
INSERT INTO `wms_receipt_order_detail` VALUES (542, 63, 18, 1.00, 1.00, 13, NULL, 0, NULL, NULL, NULL, NULL, NULL, 2, 44, 4);
INSERT INTO `wms_receipt_order_detail` VALUES (543, 63, 19, 1.00, 1.00, 13, NULL, 0, NULL, NULL, NULL, NULL, NULL, 2, 44, 4);
INSERT INTO `wms_receipt_order_detail` VALUES (544, 63, 20, 1.00, 1.00, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4);
INSERT INTO `wms_receipt_order_detail` VALUES (545, 63, 21, 1.00, 1.00, 20, NULL, 0, NULL, NULL, NULL, NULL, NULL, 27, 52, 4);
INSERT INTO `wms_receipt_order_detail` VALUES (552, 68, 14, 1.00, 9.00, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 4, NULL, 2);
INSERT INTO `wms_receipt_order_detail` VALUES (553, 68, 15, 1.00, 8.00, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2);
INSERT INTO `wms_receipt_order_detail` VALUES (563, 64, 16, 1.00, 1.00, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3);
INSERT INTO `wms_receipt_order_detail` VALUES (564, 64, 17, 1.00, 1.00, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `wms_receipt_order_detail` VALUES (565, 64, 18, 1.00, 1.00, 13, NULL, 0, NULL, NULL, NULL, NULL, NULL, 2, 44, 0);
INSERT INTO `wms_receipt_order_detail` VALUES (575, 69, 20, 12.00, 1.00, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3);
INSERT INTO `wms_receipt_order_detail` VALUES (576, 69, 21, 12.00, 1.00, 20, NULL, 0, NULL, NULL, NULL, NULL, NULL, 27, 52, 4);
INSERT INTO `wms_receipt_order_detail` VALUES (577, 69, 22, 12.00, 1.00, 13, NULL, 0, NULL, NULL, NULL, NULL, NULL, 2, 44, 4);
INSERT INTO `wms_receipt_order_detail` VALUES (584, 72, 13, 1.00, 1.00, 13, NULL, 0, NULL, NULL, NULL, NULL, NULL, 2, 44, 3);
INSERT INTO `wms_receipt_order_detail` VALUES (585, 72, 14, 1.00, 1.00, 13, NULL, 0, NULL, NULL, NULL, NULL, NULL, 2, 44, 3);
INSERT INTO `wms_receipt_order_detail` VALUES (586, 73, 13, 3.00, NULL, 13, NULL, 0, NULL, NULL, NULL, NULL, NULL, 2, 44, 0);
INSERT INTO `wms_receipt_order_detail` VALUES (587, 73, 14, 1.00, NULL, 13, NULL, 0, NULL, NULL, NULL, NULL, NULL, 2, 44, 0);
INSERT INTO `wms_receipt_order_detail` VALUES (588, 70, 13, 4.00, 1.00, 13, NULL, 0, NULL, NULL, NULL, NULL, NULL, 2, 44, 3);
INSERT INTO `wms_receipt_order_detail` VALUES (592, 75, 18, 1.00, 1.00, 13, NULL, 0, NULL, NULL, NULL, NULL, NULL, 2, 44, 3);
INSERT INTO `wms_receipt_order_detail` VALUES (593, 75, 21, 1.00, 1.00, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 14, 53, 3);
INSERT INTO `wms_receipt_order_detail` VALUES (594, 75, 22, 1.00, 1.00, 20, NULL, 0, NULL, NULL, NULL, NULL, NULL, 27, 52, 3);
INSERT INTO `wms_receipt_order_detail` VALUES (596, 76, 13, 8.00, 1.00, 19, NULL, 0, NULL, NULL, NULL, NULL, NULL, 14, 46, 0);
INSERT INTO `wms_receipt_order_detail` VALUES (601, 78, 13, 7.00, 1.00, 4, NULL, 0, NULL, NULL, NULL, NULL, NULL, 4, 14, 3);
INSERT INTO `wms_receipt_order_detail` VALUES (602, 78, 14, 1.00, 1.00, 18, NULL, 0, NULL, NULL, NULL, NULL, NULL, 26, 51, 3);
INSERT INTO `wms_receipt_order_detail` VALUES (603, 78, 20, 1.00, 1.00, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3);
INSERT INTO `wms_receipt_order_detail` VALUES (609, 77, 13, 1.00, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `wms_receipt_order_detail` VALUES (612, 80, 19, 1.00, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 2, 54, 0);
INSERT INTO `wms_receipt_order_detail` VALUES (613, 81, 13, 1.00, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `wms_receipt_order_detail` VALUES (614, 81, 14, 1.00, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `wms_receipt_order_detail` VALUES (615, 81, 15, 1.00, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `wms_receipt_order_detail` VALUES (616, 81, 16, 1.00, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `wms_receipt_order_detail` VALUES (617, 81, 17, 1.00, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `wms_receipt_order_detail` VALUES (618, 81, 18, 1.00, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `wms_receipt_order_detail` VALUES (619, 81, 19, 1.00, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `wms_receipt_order_detail` VALUES (620, 81, 20, 1.00, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `wms_receipt_order_detail` VALUES (621, 81, 21, 1.00, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `wms_receipt_order_detail` VALUES (622, 81, 22, 1.00, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `wms_receipt_order_detail` VALUES (623, 82, 14, 1.00, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 2, 54, 0);
INSERT INTO `wms_receipt_order_detail` VALUES (624, 84, 13, 1.00, NULL, 21, NULL, 0, NULL, NULL, NULL, NULL, NULL, 2, 45, 0);
INSERT INTO `wms_receipt_order_detail` VALUES (625, 84, 14, 1.00, NULL, 20, NULL, 0, NULL, NULL, NULL, NULL, NULL, 27, 52, 0);
INSERT INTO `wms_receipt_order_detail` VALUES (632, 87, 14, 1.00, 1.00, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 2, NULL, 0);
INSERT INTO `wms_receipt_order_detail` VALUES (633, 87, 18, 1.00, 1.00, 14, NULL, 0, NULL, NULL, NULL, NULL, NULL, 14, 46, 0);
INSERT INTO `wms_receipt_order_detail` VALUES (634, 87, 19, 1.00, 1.00, 13, NULL, 0, NULL, NULL, NULL, NULL, NULL, 2, 44, 0);
INSERT INTO `wms_receipt_order_detail` VALUES (635, 88, 14, 1.00, NULL, 21, NULL, 0, NULL, NULL, NULL, NULL, NULL, 2, 45, 0);
INSERT INTO `wms_receipt_order_detail` VALUES (636, 88, 13, 1.00, NULL, 21, NULL, 0, NULL, NULL, NULL, NULL, NULL, 2, 45, 0);
INSERT INTO `wms_receipt_order_detail` VALUES (640, 89, 13, 1.00, 1.00, 13, NULL, 0, NULL, NULL, NULL, NULL, NULL, 2, 45, 3);
INSERT INTO `wms_receipt_order_detail` VALUES (641, 90, 16, 1.00, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 2, 45, 0);
INSERT INTO `wms_receipt_order_detail` VALUES (642, 90, 17, 1.00, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 2, 45, 0);
INSERT INTO `wms_receipt_order_detail` VALUES (643, 90, 18, 1.00, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 2, 45, 0);
INSERT INTO `wms_receipt_order_detail` VALUES (644, 90, 19, 1.00, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 2, 45, 0);
INSERT INTO `wms_receipt_order_detail` VALUES (648, 91, 13, 6.00, 1.00, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 4, NULL, 3);
INSERT INTO `wms_receipt_order_detail` VALUES (649, 92, 13, 4.00, NULL, 22, NULL, 0, NULL, NULL, NULL, NULL, NULL, 2, 45, 0);
INSERT INTO `wms_receipt_order_detail` VALUES (650, 92, 14, 1.00, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 14, 53, 0);
INSERT INTO `wms_receipt_order_detail` VALUES (651, 92, 15, 1.00, NULL, 14, NULL, 0, NULL, NULL, NULL, NULL, NULL, 14, 46, 0);
INSERT INTO `wms_receipt_order_detail` VALUES (653, 93, 28, 3.00, 5.00, 13, NULL, 0, NULL, NULL, NULL, NULL, NULL, 2, 45, 3);
INSERT INTO `wms_receipt_order_detail` VALUES (662, 96, 13, 132.00, 132.00, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 4, 54, 3);
INSERT INTO `wms_receipt_order_detail` VALUES (673, 94, 13, 1.00, 1.00, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 14, 46, 3);
INSERT INTO `wms_receipt_order_detail` VALUES (674, 94, 17, 1.00, 1.00, 14, NULL, 0, NULL, NULL, NULL, NULL, NULL, 14, 46, 3);
INSERT INTO `wms_receipt_order_detail` VALUES (675, 79, 13, 1.00, 1.00, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 4, 54, 3);
INSERT INTO `wms_receipt_order_detail` VALUES (676, 79, 14, 1.00, 1.00, 21, NULL, 0, NULL, NULL, NULL, NULL, NULL, 2, 45, 1);
INSERT INTO `wms_receipt_order_detail` VALUES (677, 97, 28, 100.00, 100.00, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 4, 54, 3);
INSERT INTO `wms_receipt_order_detail` VALUES (678, 97, 27, 20.00, 20.00, 14, NULL, 0, NULL, NULL, NULL, NULL, NULL, 14, 46, 3);
INSERT INTO `wms_receipt_order_detail` VALUES (697, 99, 14, 1.00, 1.00, 18, NULL, 0, NULL, NULL, NULL, NULL, NULL, 26, 51, 3);
INSERT INTO `wms_receipt_order_detail` VALUES (698, 99, 15, 1.00, 1.00, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4);
INSERT INTO `wms_receipt_order_detail` VALUES (699, 99, 17, 1.00, 1.00, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3);
INSERT INTO `wms_receipt_order_detail` VALUES (700, 100, 13, 1.00, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `wms_receipt_order_detail` VALUES (703, 101, 13, 10.00, 1.00, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 4, 54, 3);
INSERT INTO `wms_receipt_order_detail` VALUES (705, 102, 19, 6.00, 1.00, 13, NULL, 0, NULL, NULL, NULL, NULL, NULL, 2, 44, 3);
INSERT INTO `wms_receipt_order_detail` VALUES (706, 103, 13, 5.00, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 4, 54, 0);
INSERT INTO `wms_receipt_order_detail` VALUES (707, 104, 27, 4.00, NULL, 23, NULL, 0, NULL, NULL, NULL, NULL, NULL, 14, 55, 0);
INSERT INTO `wms_receipt_order_detail` VALUES (708, 98, 13, 1.00, 1.00, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 4, 54, 3);
INSERT INTO `wms_receipt_order_detail` VALUES (709, 86, 25, 2.00, 2.00, 20, NULL, 0, NULL, NULL, NULL, NULL, NULL, 27, 52, 3);
INSERT INTO `wms_receipt_order_detail` VALUES (712, 105, 29, 26.00, 27.00, 24, NULL, 0, NULL, NULL, NULL, NULL, NULL, 30, 56, 3);
INSERT INTO `wms_receipt_order_detail` VALUES (719, 107, 29, 1.00, 1.00, 24, NULL, 0, NULL, NULL, NULL, NULL, NULL, 30, 56, 3);
INSERT INTO `wms_receipt_order_detail` VALUES (720, 108, 29, 1.00, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `wms_receipt_order_detail` VALUES (723, 109, 29, 1.00, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `wms_receipt_order_detail` VALUES (726, 110, 29, 1.00, 1.00, 24, NULL, 0, NULL, NULL, NULL, NULL, NULL, 30, 56, 3);
INSERT INTO `wms_receipt_order_detail` VALUES (728, 112, 29, 1.00, 1.00, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 32, NULL, 0);
INSERT INTO `wms_receipt_order_detail` VALUES (729, 106, 29, 25.00, 15.00, 24, NULL, 0, NULL, NULL, NULL, NULL, NULL, 30, 56, 3);
INSERT INTO `wms_receipt_order_detail` VALUES (730, 111, 29, 1.00, 1.00, 24, NULL, 0, NULL, NULL, NULL, NULL, NULL, 30, 56, 3);
INSERT INTO `wms_receipt_order_detail` VALUES (731, 113, 29, 1.00, NULL, 24, NULL, 0, NULL, NULL, NULL, NULL, NULL, 31, 56, 0);
INSERT INTO `wms_receipt_order_detail` VALUES (734, 114, 32, 100.00, 6.00, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 34, 59, 0);
INSERT INTO `wms_receipt_order_detail` VALUES (735, 114, 31, 100.00, 5.00, 24, NULL, 0, NULL, NULL, NULL, NULL, NULL, 31, 56, 0);
INSERT INTO `wms_receipt_order_detail` VALUES (738, 115, 55, 100.00, 100.00, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 39, NULL, 3);
INSERT INTO `wms_receipt_order_detail` VALUES (739, 115, 53, 100.00, 100.00, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 39, NULL, 3);
INSERT INTO `wms_receipt_order_detail` VALUES (741, 116, 55, 2.00, 1.00, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 38, NULL, 3);
INSERT INTO `wms_receipt_order_detail` VALUES (742, 117, 55, 2.00, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 38, NULL, 0);
INSERT INTO `wms_receipt_order_detail` VALUES (743, 117, 54, 2.00, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 39, NULL, 0);
INSERT INTO `wms_receipt_order_detail` VALUES (744, 117, 53, 2.00, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 38, NULL, 0);
INSERT INTO `wms_receipt_order_detail` VALUES (745, 117, 52, 2.00, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 39, NULL, 0);
INSERT INTO `wms_receipt_order_detail` VALUES (746, 117, 51, 1.00, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 39, NULL, 0);
INSERT INTO `wms_receipt_order_detail` VALUES (747, 118, 55, 1.00, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 38, NULL, 0);
INSERT INTO `wms_receipt_order_detail` VALUES (751, 119, 55, 1.00, 1.00, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 39, 60, 3);
INSERT INTO `wms_receipt_order_detail` VALUES (752, 120, 50, 1.00, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 38, NULL, 0);
INSERT INTO `wms_receipt_order_detail` VALUES (753, 121, 56, 1.00, NULL, 27, NULL, 0, NULL, NULL, NULL, NULL, NULL, 39, 60, 0);
INSERT INTO `wms_receipt_order_detail` VALUES (754, 121, 55, 1.00, NULL, 27, NULL, 0, NULL, NULL, NULL, NULL, NULL, 39, 60, 0);
INSERT INTO `wms_receipt_order_detail` VALUES (755, 122, 56, 1.00, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `wms_receipt_order_detail` VALUES (756, 122, 55, 1.00, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `wms_receipt_order_detail` VALUES (757, 122, 54, 1.00, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `wms_receipt_order_detail` VALUES (758, 122, 53, 1.00, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `wms_receipt_order_detail` VALUES (759, 122, 52, 1.00, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `wms_receipt_order_detail` VALUES (760, 122, 51, 1.00, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `wms_receipt_order_detail` VALUES (761, 122, 50, 1.00, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `wms_receipt_order_detail` VALUES (762, 122, 49, 1.00, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `wms_receipt_order_detail` VALUES (763, 122, 48, 1.00, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `wms_receipt_order_detail` VALUES (764, 122, 47, 1.00, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `wms_receipt_order_detail` VALUES (765, 123, 57, 600.00, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 38, NULL, 0);
INSERT INTO `wms_receipt_order_detail` VALUES (766, 125, 58, 1.00, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `wms_receipt_order_detail` VALUES (769, 126, 58, 3.00, 5.00, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 38, NULL, 1);
INSERT INTO `wms_receipt_order_detail` VALUES (772, 131, 58, 1.00, 1.00, 29, NULL, 0, NULL, NULL, NULL, NULL, NULL, 38, 61, 0);
INSERT INTO `wms_receipt_order_detail` VALUES (776, 130, 60, 10.00, 1.00, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 42, NULL, 3);
INSERT INTO `wms_receipt_order_detail` VALUES (780, 133, 60, 10.00, 12.00, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 40, NULL, 2);
INSERT INTO `wms_receipt_order_detail` VALUES (785, 135, 60, 10.00, 10.00, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 38, 61, 3);
INSERT INTO `wms_receipt_order_detail` VALUES (786, 135, 58, 10.00, 8.00, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 43, 62, 3);
INSERT INTO `wms_receipt_order_detail` VALUES (789, 136, 60, 3.00, 1.00, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 42, NULL, 4);
INSERT INTO `wms_receipt_order_detail` VALUES (790, 136, 58, 3.00, 1.00, 28, NULL, 0, NULL, NULL, NULL, NULL, NULL, 38, 61, 3);
INSERT INTO `wms_receipt_order_detail` VALUES (799, 137, 60, 11.00, 1.00, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 42, NULL, 3);
INSERT INTO `wms_receipt_order_detail` VALUES (805, 138, 60, 1.00, 1.00, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 42, NULL, 3);
INSERT INTO `wms_receipt_order_detail` VALUES (808, 139, 60, 1.00, 1.00, 29, NULL, 0, NULL, NULL, NULL, NULL, NULL, 38, 61, 3);
INSERT INTO `wms_receipt_order_detail` VALUES (811, 140, 60, 2.00, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `wms_receipt_order_detail` VALUES (812, 140, 58, 2.00, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `wms_receipt_order_detail` VALUES (813, 141, 60, 5.00, NULL, 29, NULL, 0, NULL, NULL, NULL, NULL, NULL, 38, 61, 0);
INSERT INTO `wms_receipt_order_detail` VALUES (814, 142, 58, 8.00, NULL, 29, NULL, 0, NULL, NULL, NULL, NULL, NULL, 38, 61, 0);
INSERT INTO `wms_receipt_order_detail` VALUES (815, 142, 60, 6.00, NULL, 29, NULL, 0, NULL, NULL, NULL, NULL, NULL, 38, 61, 0);
INSERT INTO `wms_receipt_order_detail` VALUES (817, 143, 60, 1.00, 1.00, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 38, NULL, 3);
INSERT INTO `wms_receipt_order_detail` VALUES (821, 145, 60, 1000.00, 1000.00, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 45, 65, 3);
INSERT INTO `wms_receipt_order_detail` VALUES (829, 147, 61, 20.00, 1.00, 29, NULL, 0, NULL, NULL, NULL, NULL, NULL, 38, 61, 3);
INSERT INTO `wms_receipt_order_detail` VALUES (830, 147, 60, 20.00, 1.00, 29, NULL, 0, NULL, NULL, NULL, NULL, NULL, 38, 61, 3);
INSERT INTO `wms_receipt_order_detail` VALUES (831, 144, 60, 1.00, 1.00, 30, NULL, 0, NULL, NULL, NULL, NULL, NULL, 43, 62, 2);
INSERT INTO `wms_receipt_order_detail` VALUES (832, 144, 58, 1.00, 1.00, 28, NULL, 0, NULL, NULL, NULL, NULL, NULL, 38, 61, 0);
INSERT INTO `wms_receipt_order_detail` VALUES (846, 146, 60, 2.00, 8.00, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 42, 63, 1);
INSERT INTO `wms_receipt_order_detail` VALUES (859, 148, 61, 13.00, 13.00, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 42, 63, 3);
INSERT INTO `wms_receipt_order_detail` VALUES (860, 148, 60, 12.00, 1.00, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 45, 65, 3);
INSERT INTO `wms_receipt_order_detail` VALUES (861, 148, 58, 11.00, 11.00, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 45, 65, 3);
INSERT INTO `wms_receipt_order_detail` VALUES (863, 149, 61, 1.00, 1.00, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 42, 63, 3);
INSERT INTO `wms_receipt_order_detail` VALUES (867, 150, 61, 9.00, 1.00, 29, NULL, 0, NULL, NULL, NULL, NULL, NULL, 38, 61, 3);
INSERT INTO `wms_receipt_order_detail` VALUES (869, 152, 60, 1.00, 1.00, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 45, 65, 3);
INSERT INTO `wms_receipt_order_detail` VALUES (871, 153, 61, 4.00, 1.00, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `wms_receipt_order_detail` VALUES (872, 155, 61, 1.00, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 43, NULL, 0);
INSERT INTO `wms_receipt_order_detail` VALUES (875, 157, 63, 30.00, 1.00, 31, NULL, 0, NULL, NULL, NULL, NULL, NULL, 50, 67, 3);
INSERT INTO `wms_receipt_order_detail` VALUES (877, 156, 63, 1.00, 3.00, 31, NULL, 0, NULL, NULL, NULL, NULL, NULL, 50, 67, 3);
INSERT INTO `wms_receipt_order_detail` VALUES (880, 159, 63, 2.00, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `wms_receipt_order_detail` VALUES (881, 159, 62, 2.00, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `wms_receipt_order_detail` VALUES (886, 160, 63, 3.00, 1.00, 31, NULL, 0, NULL, NULL, NULL, NULL, NULL, 50, 70, 3);
INSERT INTO `wms_receipt_order_detail` VALUES (887, 160, 62, 3.00, 1.00, 31, NULL, 0, NULL, NULL, NULL, NULL, NULL, 50, 70, 3);
INSERT INTO `wms_receipt_order_detail` VALUES (889, 161, 63, 3.00, 1.00, 31, NULL, 0, NULL, NULL, NULL, NULL, NULL, 50, 70, 3);
INSERT INTO `wms_receipt_order_detail` VALUES (892, 162, 68, 100.00, 1.00, 34, NULL, 0, NULL, NULL, NULL, NULL, NULL, 53, 73, 3);
INSERT INTO `wms_receipt_order_detail` VALUES (893, 162, 67, 100.00, 1.00, 34, NULL, 0, NULL, NULL, NULL, NULL, NULL, 53, 73, 3);
INSERT INTO `wms_receipt_order_detail` VALUES (894, 163, 68, 4.00, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `wms_receipt_order_detail` VALUES (895, 163, 67, 3.00, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `wms_receipt_order_detail` VALUES (904, 164, 68, 1.00, 1.00, 34, NULL, 0, NULL, NULL, NULL, NULL, NULL, 53, 73, 3);
INSERT INTO `wms_receipt_order_detail` VALUES (905, 164, 67, 1.00, 1.00, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 54, NULL, 3);
INSERT INTO `wms_receipt_order_detail` VALUES (906, 165, 69, 3000.00, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 58, NULL, 0);
INSERT INTO `wms_receipt_order_detail` VALUES (909, 166, 75, 1.00, 1.00, 38, NULL, 0, NULL, NULL, NULL, NULL, NULL, 61, 77, 3);
INSERT INTO `wms_receipt_order_detail` VALUES (910, 166, 74, 1.00, 1.00, 38, NULL, 0, NULL, NULL, NULL, NULL, NULL, 61, 77, 0);
INSERT INTO `wms_receipt_order_detail` VALUES (912, 167, 73, 6.00, 1.00, 37, NULL, 0, NULL, NULL, NULL, NULL, NULL, 61, 77, 1);
INSERT INTO `wms_receipt_order_detail` VALUES (913, 168, 75, 2.00, NULL, 37, NULL, 0, NULL, NULL, NULL, NULL, NULL, 61, 77, 0);
INSERT INTO `wms_receipt_order_detail` VALUES (914, 168, 74, 2.00, NULL, 37, NULL, 0, NULL, NULL, NULL, NULL, NULL, 61, 77, 0);
INSERT INTO `wms_receipt_order_detail` VALUES (927, 169, 76, 100.00, 100.00, 43, NULL, 0, NULL, NULL, NULL, NULL, NULL, 61, 80, 3);
INSERT INTO `wms_receipt_order_detail` VALUES (928, 169, 75, 100.00, 100.00, 38, NULL, 0, NULL, NULL, NULL, NULL, NULL, 61, 77, 3);
INSERT INTO `wms_receipt_order_detail` VALUES (929, 169, 74, 100.00, 100.00, 38, NULL, 0, NULL, NULL, NULL, NULL, NULL, 61, 77, 3);
INSERT INTO `wms_receipt_order_detail` VALUES (930, 169, 73, 100.00, 100.00, 37, NULL, 0, NULL, NULL, NULL, NULL, NULL, 61, 77, 3);
INSERT INTO `wms_receipt_order_detail` VALUES (931, 169, 72, 100.00, 100.00, 37, NULL, 0, NULL, NULL, NULL, NULL, NULL, 61, 77, 3);
INSERT INTO `wms_receipt_order_detail` VALUES (932, 169, 71, 100.00, 100.00, 37, NULL, 0, NULL, NULL, NULL, NULL, NULL, 61, 77, 3);
INSERT INTO `wms_receipt_order_detail` VALUES (939, 170, 76, 10000.00, 10000.00, 43, NULL, 0, NULL, NULL, NULL, NULL, NULL, 61, 80, 3);
INSERT INTO `wms_receipt_order_detail` VALUES (940, 170, 75, 100.00, 100.00, 38, NULL, 0, NULL, NULL, NULL, NULL, NULL, 61, 77, 3);
INSERT INTO `wms_receipt_order_detail` VALUES (941, 170, 74, 100.00, 100.00, 38, NULL, 0, NULL, NULL, NULL, NULL, NULL, 61, 77, 3);
INSERT INTO `wms_receipt_order_detail` VALUES (942, 170, 73, 10000.00, 10000.00, 37, NULL, 0, NULL, NULL, NULL, NULL, NULL, 61, 77, 3);
INSERT INTO `wms_receipt_order_detail` VALUES (943, 170, 72, 10000.00, 100000.00, 37, NULL, 0, NULL, NULL, NULL, NULL, NULL, 61, 77, 3);
INSERT INTO `wms_receipt_order_detail` VALUES (944, 170, 71, 10000.00, 1000.00, 37, NULL, 0, NULL, NULL, NULL, NULL, NULL, 61, 77, 3);
INSERT INTO `wms_receipt_order_detail` VALUES (946, 171, 75, 1.00, 1.00, 38, NULL, 0, NULL, NULL, NULL, NULL, NULL, 61, 77, 3);
INSERT INTO `wms_receipt_order_detail` VALUES (949, 172, 74, 10.00, 10.00, 37, NULL, 0, NULL, NULL, NULL, NULL, NULL, 61, 77, 3);
INSERT INTO `wms_receipt_order_detail` VALUES (950, 172, 71, 10000.00, 1000.00, 38, NULL, 0, NULL, NULL, NULL, NULL, NULL, 61, 77, 3);
INSERT INTO `wms_receipt_order_detail` VALUES (956, 173, 75, 1.00, 1.00, 38, NULL, 0, NULL, NULL, NULL, NULL, NULL, 61, 77, 3);
INSERT INTO `wms_receipt_order_detail` VALUES (957, 173, 74, 1.00, 1.00, 38, NULL, 0, NULL, NULL, NULL, NULL, NULL, 61, 77, 3);
INSERT INTO `wms_receipt_order_detail` VALUES (958, 173, 73, 1.00, 1.00, 37, NULL, 0, NULL, NULL, NULL, NULL, NULL, 61, 77, 3);
INSERT INTO `wms_receipt_order_detail` VALUES (959, 173, 72, 1.00, 1.00, 37, NULL, 0, NULL, NULL, NULL, NULL, NULL, 61, 77, 3);
INSERT INTO `wms_receipt_order_detail` VALUES (960, 173, 71, 1.00, 1.00, 37, NULL, 0, NULL, NULL, NULL, NULL, NULL, 61, 77, 3);
INSERT INTO `wms_receipt_order_detail` VALUES (967, 174, 77, 1.00, 1.00, 47, NULL, 0, NULL, NULL, NULL, NULL, NULL, 64, 82, 3);
INSERT INTO `wms_receipt_order_detail` VALUES (968, 174, 74, 1.00, 1.00, 47, NULL, 0, NULL, NULL, NULL, NULL, NULL, 64, 82, 3);
INSERT INTO `wms_receipt_order_detail` VALUES (969, 174, 71, 1.00, 1.00, 37, NULL, 0, NULL, NULL, NULL, NULL, NULL, 61, 77, 3);
INSERT INTO `wms_receipt_order_detail` VALUES (970, 175, 77, 5.00, NULL, 37, NULL, 0, NULL, NULL, NULL, NULL, NULL, 61, 77, 0);
INSERT INTO `wms_receipt_order_detail` VALUES (971, 175, 75, 1.00, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 61, NULL, 0);
INSERT INTO `wms_receipt_order_detail` VALUES (972, 176, 73, 1.00, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `wms_receipt_order_detail` VALUES (975, 177, 75, 1.00, 1.00, 37, NULL, 0, NULL, NULL, NULL, NULL, NULL, 61, 77, 1);
INSERT INTO `wms_receipt_order_detail` VALUES (976, 178, 75, 1.00, NULL, 47, NULL, 0, NULL, NULL, NULL, NULL, NULL, 64, 82, 0);
INSERT INTO `wms_receipt_order_detail` VALUES (980, 180, 78, 10.00, 1.00, 49, NULL, 0, NULL, NULL, NULL, NULL, NULL, 67, 84, 3);
INSERT INTO `wms_receipt_order_detail` VALUES (982, 181, 78, 12.00, 12.00, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 69, NULL, 3);
INSERT INTO `wms_receipt_order_detail` VALUES (984, 179, 78, 20.00, 1.00, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 69, NULL, 3);
INSERT INTO `wms_receipt_order_detail` VALUES (986, 182, 80, 7.00, 1.00, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 65, 86, 3);
INSERT INTO `wms_receipt_order_detail` VALUES (989, 183, 80, 122.00, 122.00, 51, NULL, 0, NULL, NULL, NULL, NULL, NULL, 65, 86, 3);
INSERT INTO `wms_receipt_order_detail` VALUES (990, 184, 80, 1.00, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `wms_receipt_order_detail` VALUES (991, 185, 79, 2.00, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `wms_receipt_order_detail` VALUES (994, 186, 80, 1.00, 1.00, 51, NULL, 0, NULL, NULL, NULL, NULL, NULL, 65, 86, 3);
INSERT INTO `wms_receipt_order_detail` VALUES (996, 187, 80, 1.00, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `wms_receipt_order_detail` VALUES (997, 188, 80, 1.00, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `wms_receipt_order_detail` VALUES (1004, 189, 80, 1.00, 9.00, 51, NULL, 0, NULL, NULL, NULL, NULL, NULL, 65, 86, 3);
INSERT INTO `wms_receipt_order_detail` VALUES (1005, 189, 79, 1.00, 9.00, 50, NULL, 0, NULL, NULL, NULL, NULL, NULL, 65, 86, 3);
INSERT INTO `wms_receipt_order_detail` VALUES (1006, 189, 78, 1.00, 9.00, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 69, NULL, 3);
INSERT INTO `wms_receipt_order_detail` VALUES (1013, 191, 80, 100.00, 1.00, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 65, 86, 3);
INSERT INTO `wms_receipt_order_detail` VALUES (1014, 191, 79, 1100.00, 1.00, 50, NULL, 0, NULL, NULL, NULL, NULL, NULL, 65, 86, 3);
INSERT INTO `wms_receipt_order_detail` VALUES (1015, 191, 78, 100.00, 1.00, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 69, NULL, 3);
INSERT INTO `wms_receipt_order_detail` VALUES (1017, 192, 80, 6.00, 1.00, 49, NULL, 0, NULL, NULL, NULL, NULL, NULL, 68, 85, 3);
INSERT INTO `wms_receipt_order_detail` VALUES (1025, 193, 79, 1.00, 1.00, 50, NULL, 0, NULL, NULL, NULL, NULL, NULL, 65, 86, 3);
INSERT INTO `wms_receipt_order_detail` VALUES (1026, 193, 78, 1.00, 1.00, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 69, NULL, 1);
INSERT INTO `wms_receipt_order_detail` VALUES (1029, 194, 80, 3.00, 1.00, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 66, 87, 3);
INSERT INTO `wms_receipt_order_detail` VALUES (1030, 194, 79, 1.00, 1.00, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 66, 87, 0);
INSERT INTO `wms_receipt_order_detail` VALUES (1036, 196, 80, 3.00, 2.00, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 67, 84, 3);
INSERT INTO `wms_receipt_order_detail` VALUES (1037, 198, 87, 1.00, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `wms_receipt_order_detail` VALUES (1038, 198, 86, 1.00, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `wms_receipt_order_detail` VALUES (1039, 198, 85, 1.00, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `wms_receipt_order_detail` VALUES (1042, 199, 87, 1.00, 1.00, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 66, 87, 3);
INSERT INTO `wms_receipt_order_detail` VALUES (1051, 202, 88, 1.00, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 66, 87, 0);
INSERT INTO `wms_receipt_order_detail` VALUES (1052, 200, 85, 1.00, 1.00, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `wms_receipt_order_detail` VALUES (1053, 200, 84, 1.00, 1.00, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `wms_receipt_order_detail` VALUES (1055, 201, 88, 1.00, 1.00, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 67, 84, 1);
INSERT INTO `wms_receipt_order_detail` VALUES (1056, 203, 88, 10.00, 1.00, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 66, 86, 0);
INSERT INTO `wms_receipt_order_detail` VALUES (1057, 204, 88, 1000.00, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `wms_receipt_order_detail` VALUES (1058, 204, 86, 1000.00, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `wms_receipt_order_detail` VALUES (1059, 204, 85, 100.00, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `wms_receipt_order_detail` VALUES (1060, 205, 88, 1.00, NULL, 50, NULL, 0, NULL, NULL, NULL, NULL, NULL, 66, 86, 0);
INSERT INTO `wms_receipt_order_detail` VALUES (1061, 205, 86, 1.00, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `wms_receipt_order_detail` VALUES (1062, 205, 85, 1.00, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `wms_receipt_order_detail` VALUES (1063, 205, 84, 1.00, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `wms_receipt_order_detail` VALUES (1064, 205, 83, 1.00, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `wms_receipt_order_detail` VALUES (1065, 206, 82, 1.00, NULL, 52, NULL, 0, NULL, NULL, NULL, NULL, NULL, 72, 88, 0);
INSERT INTO `wms_receipt_order_detail` VALUES (1066, 206, 80, 1.00, NULL, 52, NULL, 0, NULL, NULL, NULL, NULL, NULL, 72, 88, 0);
INSERT INTO `wms_receipt_order_detail` VALUES (1070, 207, 88, 2.00, 1.00, 50, NULL, 0, NULL, NULL, NULL, NULL, NULL, 66, 86, 3);
INSERT INTO `wms_receipt_order_detail` VALUES (1072, 208, 88, 222.00, 1.00, 49, NULL, 0, NULL, NULL, NULL, NULL, NULL, 74, 84, 3);
INSERT INTO `wms_receipt_order_detail` VALUES (1073, 209, 88, 16.00, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 74, NULL, 0);
INSERT INTO `wms_receipt_order_detail` VALUES (1075, 210, 88, 1.00, 1.00, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 74, NULL, 3);
INSERT INTO `wms_receipt_order_detail` VALUES (1077, 211, 88, 10.00, 1.00, 49, NULL, 0, NULL, NULL, NULL, NULL, NULL, 68, 85, 3);
INSERT INTO `wms_receipt_order_detail` VALUES (1079, 212, 88, 2.00, 1.00, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 74, NULL, 3);
INSERT INTO `wms_receipt_order_detail` VALUES (1080, 213, 88, 1.00, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 74, NULL, 0);
INSERT INTO `wms_receipt_order_detail` VALUES (1081, 214, 79, 1.00, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 74, NULL, 0);
INSERT INTO `wms_receipt_order_detail` VALUES (1082, 215, 88, 1.00, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `wms_receipt_order_detail` VALUES (1083, 216, 88, 1.00, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `wms_receipt_order_detail` VALUES (1084, 216, 85, 1.00, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `wms_receipt_order_detail` VALUES (1087, 217, 89, 500.00, 500.00, 50, NULL, 0, NULL, NULL, NULL, NULL, NULL, 76, 89, 3);
INSERT INTO `wms_receipt_order_detail` VALUES (1090, 218, 90, 1.00, 1.00, 49, NULL, 0, NULL, NULL, NULL, NULL, NULL, 75, 90, 3);
INSERT INTO `wms_receipt_order_detail` VALUES (1093, 220, 89, 2.00, 1.00, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 75, NULL, 3);
INSERT INTO `wms_receipt_order_detail` VALUES (1096, 221, 91, 1.00, 1.00, 52, NULL, 0, NULL, NULL, NULL, NULL, NULL, 78, 92, 1);
INSERT INTO `wms_receipt_order_detail` VALUES (1097, 221, 90, 1.00, 1.00, 50, NULL, 0, NULL, NULL, NULL, NULL, NULL, 76, 89, 1);
INSERT INTO `wms_receipt_order_detail` VALUES (1100, 223, 91, 1.00, 1.00, 50, NULL, 0, NULL, NULL, NULL, NULL, NULL, 76, 89, 2);
INSERT INTO `wms_receipt_order_detail` VALUES (1113, 222, 90, 1.00, 1.00, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 75, 90, 4);
INSERT INTO `wms_receipt_order_detail` VALUES (1114, 222, 89, 1.00, 1.00, 50, NULL, 0, NULL, NULL, NULL, NULL, NULL, 76, 89, 4);
INSERT INTO `wms_receipt_order_detail` VALUES (1115, 222, 91, 1.00, 1.00, 50, NULL, 0, NULL, NULL, NULL, NULL, NULL, 76, 89, 3);
INSERT INTO `wms_receipt_order_detail` VALUES (1116, 224, 91, 1.00, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `wms_receipt_order_detail` VALUES (1117, 224, 90, 1.00, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `wms_receipt_order_detail` VALUES (1118, 224, 89, 1.00, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `wms_receipt_order_detail` VALUES (1122, 226, 91, 1.00, 1.00, 50, NULL, 0, NULL, NULL, NULL, NULL, NULL, 76, 89, 3);
INSERT INTO `wms_receipt_order_detail` VALUES (1125, 225, 90, 3.00, NULL, 49, NULL, 0, NULL, NULL, NULL, NULL, NULL, 75, 90, 0);
INSERT INTO `wms_receipt_order_detail` VALUES (1126, 227, 91, 1.00, NULL, 52, NULL, 0, NULL, NULL, NULL, NULL, NULL, 78, 92, 0);
INSERT INTO `wms_receipt_order_detail` VALUES (1127, 227, 90, 1.00, NULL, 52, NULL, 0, NULL, NULL, NULL, NULL, NULL, 78, 92, 0);
INSERT INTO `wms_receipt_order_detail` VALUES (1128, 219, 91, 1.00, 1.00, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 75, 90, 0);
INSERT INTO `wms_receipt_order_detail` VALUES (1132, 228, 91, 5.00, 1.00, 49, NULL, 0, NULL, NULL, NULL, NULL, NULL, 75, 90, 3);
INSERT INTO `wms_receipt_order_detail` VALUES (1134, 229, 91, 1.00, 1.00, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 75, 90, 3);
INSERT INTO `wms_receipt_order_detail` VALUES (1136, 230, 90, 1.00, 1.00, 52, NULL, 0, NULL, NULL, NULL, NULL, NULL, 78, 92, 3);
INSERT INTO `wms_receipt_order_detail` VALUES (1139, 231, 91, 1.00, 1.00, 52, NULL, 0, NULL, NULL, NULL, NULL, NULL, 78, 92, 2);
INSERT INTO `wms_receipt_order_detail` VALUES (1143, 233, 92, 6.00, 6.00, 52, NULL, 0, NULL, NULL, NULL, NULL, NULL, 78, 92, 3);
INSERT INTO `wms_receipt_order_detail` VALUES (1145, 234, 93, 8.00, 1.00, 52, NULL, 0, NULL, NULL, NULL, NULL, NULL, 78, 92, 3);
INSERT INTO `wms_receipt_order_detail` VALUES (1151, 236, 91, 5.00, 3.00, 51, NULL, 0, NULL, NULL, NULL, NULL, NULL, 77, 91, 3);
INSERT INTO `wms_receipt_order_detail` VALUES (1158, 237, 93, 2.00, 4.00, 52, NULL, 0, NULL, NULL, NULL, NULL, NULL, 78, 92, 3);
INSERT INTO `wms_receipt_order_detail` VALUES (1159, 237, 91, 3.00, 1.00, 50, NULL, 0, NULL, NULL, NULL, NULL, NULL, 76, 89, 3);
INSERT INTO `wms_receipt_order_detail` VALUES (1160, 237, 90, 3.00, 1.00, 49, NULL, 0, NULL, NULL, NULL, NULL, NULL, 75, 90, 3);
INSERT INTO `wms_receipt_order_detail` VALUES (1161, 235, 93, 1.00, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `wms_receipt_order_detail` VALUES (1164, 238, 94, 30.00, 1.00, 49, NULL, 0, NULL, NULL, NULL, NULL, NULL, 75, 90, 3);
INSERT INTO `wms_receipt_order_detail` VALUES (1167, 239, 93, 10.00, 1.00, 50, NULL, 0, NULL, NULL, NULL, NULL, NULL, 76, 89, 3);
INSERT INTO `wms_receipt_order_detail` VALUES (1168, 239, 91, 6.00, 1.00, 51, NULL, 0, NULL, NULL, NULL, NULL, NULL, 77, 91, 3);
INSERT INTO `wms_receipt_order_detail` VALUES (1182, 232, 91, 100.00, 1.00, 49, NULL, 0, NULL, NULL, NULL, NULL, NULL, 75, 90, 3);
INSERT INTO `wms_receipt_order_detail` VALUES (1189, 240, 94, 10.00, 1.00, 53, NULL, 0, NULL, NULL, NULL, NULL, NULL, 83, 94, 3);
INSERT INTO `wms_receipt_order_detail` VALUES (1190, 240, 93, 1.00, 1.00, 53, NULL, 0, NULL, NULL, NULL, NULL, NULL, 83, 94, 3);
INSERT INTO `wms_receipt_order_detail` VALUES (1191, 240, 92, 1.00, 1.00, 53, NULL, 0, NULL, NULL, NULL, NULL, NULL, 83, 94, 3);
INSERT INTO `wms_receipt_order_detail` VALUES (1192, 240, 91, 1.00, 1.00, 53, NULL, 0, NULL, NULL, NULL, NULL, NULL, 83, 94, 0);
INSERT INTO `wms_receipt_order_detail` VALUES (1193, 240, 90, 1.00, 1.00, 49, NULL, 0, NULL, NULL, NULL, NULL, NULL, 75, 90, 0);
INSERT INTO `wms_receipt_order_detail` VALUES (1194, 240, 89, 1.00, 1.00, 50, NULL, 0, NULL, NULL, NULL, NULL, NULL, 76, 89, 0);
INSERT INTO `wms_receipt_order_detail` VALUES (1196, 241, 95, 50.00, 1.00, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 84, NULL, 3);
INSERT INTO `wms_receipt_order_detail` VALUES (1197, 242, 95, 1.00, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `wms_receipt_order_detail` VALUES (1201, 244, 95, 1.00, 1.00, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 84, NULL, 0);
INSERT INTO `wms_receipt_order_detail` VALUES (1204, 243, 95, 2.00, 1.00, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 84, NULL, 3);
INSERT INTO `wms_receipt_order_detail` VALUES (1205, 243, 94, 2.00, 1.00, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 85, 95, 3);
INSERT INTO `wms_receipt_order_detail` VALUES (1207, 245, 95, 1.00, 1.00, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 84, NULL, 0);
INSERT INTO `wms_receipt_order_detail` VALUES (1208, 246, 94, 1.00, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 85, NULL, 0);
INSERT INTO `wms_receipt_order_detail` VALUES (1209, 247, 95, 3.00, NULL, 53, NULL, 0, NULL, NULL, NULL, NULL, NULL, 83, 94, 0);
INSERT INTO `wms_receipt_order_detail` VALUES (1210, 248, 95, 1.00, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `wms_receipt_order_detail` VALUES (1215, 249, 96, 6.00, 1.00, 56, NULL, 0, NULL, NULL, NULL, NULL, NULL, 86, 98, 3);
INSERT INTO `wms_receipt_order_detail` VALUES (1216, 249, 97, 6.00, 1.00, 55, NULL, 0, NULL, NULL, NULL, NULL, NULL, 86, 98, 3);
INSERT INTO `wms_receipt_order_detail` VALUES (1219, 250, 94, 1.00, 1.00, 55, NULL, 0, NULL, NULL, NULL, NULL, NULL, 86, 98, 3);
INSERT INTO `wms_receipt_order_detail` VALUES (1221, 251, 94, 1.00, 1.00, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 85, 95, 3);
INSERT INTO `wms_receipt_order_detail` VALUES (1223, 252, 97, 2.00, 2.00, 49, NULL, 0, NULL, NULL, NULL, NULL, NULL, 84, 96, 3);
INSERT INTO `wms_receipt_order_detail` VALUES (1228, 253, 97, 800.00, 1.00, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 85, 95, 3);
INSERT INTO `wms_receipt_order_detail` VALUES (1229, 253, 96, 500.00, 1.00, 55, NULL, 0, NULL, NULL, NULL, NULL, NULL, 86, 98, 3);
INSERT INTO `wms_receipt_order_detail` VALUES (1233, 254, 99, 100.00, 100.00, 57, NULL, 0, NULL, NULL, NULL, NULL, NULL, 87, 100, 3);
INSERT INTO `wms_receipt_order_detail` VALUES (1238, 257, 99, 10.00, 1.00, 53, NULL, 0, NULL, NULL, NULL, NULL, NULL, 83, 94, 3);
INSERT INTO `wms_receipt_order_detail` VALUES (1239, 256, 99, 1.00, 1.00, 53, NULL, 0, NULL, NULL, NULL, NULL, NULL, 83, 94, 0);
INSERT INTO `wms_receipt_order_detail` VALUES (1240, 256, 97, 1.00, 1.00, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `wms_receipt_order_detail` VALUES (1241, 256, 96, 1.00, 1.00, 56, NULL, 0, NULL, NULL, NULL, NULL, NULL, 86, 98, 0);
INSERT INTO `wms_receipt_order_detail` VALUES (1245, 259, 97, 1.00, 1.00, 49, NULL, 0, NULL, NULL, NULL, NULL, NULL, 84, 96, 1);
INSERT INTO `wms_receipt_order_detail` VALUES (1250, 261, 100, 1.00, 1.00, 49, NULL, 0, NULL, NULL, NULL, NULL, NULL, 84, 96, 3);
INSERT INTO `wms_receipt_order_detail` VALUES (1252, 262, 101, 1.00, 1.00, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 89, 103, 3);
INSERT INTO `wms_receipt_order_detail` VALUES (1253, 260, 93, 1.00, 2.00, 49, NULL, 0, NULL, NULL, NULL, NULL, NULL, 84, 96, 3);
INSERT INTO `wms_receipt_order_detail` VALUES (1254, 260, 94, 1.00, 2.00, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 86, 99, 3);
INSERT INTO `wms_receipt_order_detail` VALUES (1257, 263, 99, 200.00, 150.00, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 91, 108, 3);
INSERT INTO `wms_receipt_order_detail` VALUES (1264, 265, 101, 10.00, 10.00, 61, NULL, 0, NULL, NULL, NULL, NULL, NULL, 91, 105, 3);
INSERT INTO `wms_receipt_order_detail` VALUES (1265, 265, 99, 10.00, 10.00, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 91, 106, 3);
INSERT INTO `wms_receipt_order_detail` VALUES (1266, 258, 100, 1.00, 1.00, 49, NULL, 0, NULL, NULL, NULL, NULL, NULL, 84, 96, 3);
INSERT INTO `wms_receipt_order_detail` VALUES (1267, 258, 99, 1.00, 1.00, 53, NULL, 0, NULL, NULL, NULL, NULL, NULL, 83, 94, 0);
INSERT INTO `wms_receipt_order_detail` VALUES (1270, 264, 101, 5.00, 4.00, 61, NULL, 0, NULL, NULL, NULL, NULL, NULL, 91, 105, 3);
INSERT INTO `wms_receipt_order_detail` VALUES (1271, 264, 99, 5.00, 5.00, 61, NULL, 0, NULL, NULL, NULL, NULL, NULL, 91, 105, 3);
INSERT INTO `wms_receipt_order_detail` VALUES (1273, 267, 102, 3.00, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `wms_receipt_order_detail` VALUES (1274, 266, 102, 1.00, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `wms_receipt_order_detail` VALUES (1276, 272, 102, 1.00, NULL, 49, NULL, 0, NULL, NULL, NULL, NULL, NULL, 84, 96, 0);
INSERT INTO `wms_receipt_order_detail` VALUES (1283, 271, 103, 8.00, 1.00, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 86, 99, 3);
INSERT INTO `wms_receipt_order_detail` VALUES (1284, 271, 102, 8.00, 1.00, 57, NULL, 0, NULL, NULL, NULL, NULL, NULL, 87, 100, 3);
INSERT INTO `wms_receipt_order_detail` VALUES (1287, 273, 103, 5.00, 1.00, 55, NULL, 0, NULL, NULL, NULL, NULL, NULL, 86, 98, 3);
INSERT INTO `wms_receipt_order_detail` VALUES (1288, 273, 102, 14.00, 1.00, 56, NULL, 0, NULL, NULL, NULL, NULL, NULL, 86, 98, 3);
INSERT INTO `wms_receipt_order_detail` VALUES (1291, 274, 103, 4.00, 5.00, 57, NULL, 0, NULL, NULL, NULL, NULL, NULL, 87, 100, 3);
INSERT INTO `wms_receipt_order_detail` VALUES (1292, 274, 102, 10.00, 9.00, 61, NULL, 0, NULL, NULL, NULL, NULL, NULL, 91, 105, 3);
INSERT INTO `wms_receipt_order_detail` VALUES (1294, 275, 103, 1.00, 1.00, 55, NULL, 0, NULL, NULL, NULL, NULL, NULL, 86, 98, 3);
INSERT INTO `wms_receipt_order_detail` VALUES (1295, 276, 103, 5.00, NULL, 49, NULL, 0, NULL, NULL, NULL, NULL, NULL, 84, 96, 0);
INSERT INTO `wms_receipt_order_detail` VALUES (1299, 277, 104, 1000.00, 1000.00, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 88, NULL, 3);
INSERT INTO `wms_receipt_order_detail` VALUES (1301, 278, 104, 1.00, 1.00, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 88, NULL, 3);
INSERT INTO `wms_receipt_order_detail` VALUES (1310, 279, 104, 10.00, 2.00, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 88, NULL, 3);
INSERT INTO `wms_receipt_order_detail` VALUES (1311, 279, 103, 10.00, 2.00, 55, NULL, 0, NULL, NULL, NULL, NULL, NULL, 86, 98, 3);
INSERT INTO `wms_receipt_order_detail` VALUES (1312, 281, 104, 1.00, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `wms_receipt_order_detail` VALUES (1313, 281, 103, 1.00, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `wms_receipt_order_detail` VALUES (1314, 282, 104, 4.00, NULL, 49, NULL, 0, NULL, NULL, NULL, NULL, NULL, 84, 96, 0);
INSERT INTO `wms_receipt_order_detail` VALUES (1315, 282, 103, 7.00, NULL, 49, NULL, 0, NULL, NULL, NULL, NULL, NULL, 84, 96, 0);
INSERT INTO `wms_receipt_order_detail` VALUES (1316, 282, 102, 3.00, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 89, 103, 0);
INSERT INTO `wms_receipt_order_detail` VALUES (1317, 283, 104, 1.00, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 84, NULL, 0);
INSERT INTO `wms_receipt_order_detail` VALUES (1320, 284, 105, 1.00, 4.00, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 93, NULL, 3);
INSERT INTO `wms_receipt_order_detail` VALUES (1322, 285, 104, 1.00, 1.00, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 88, NULL, 0);
INSERT INTO `wms_receipt_order_detail` VALUES (1327, 286, 107, 10000.00, 8888.00, 64, NULL, 0, NULL, NULL, NULL, NULL, NULL, 95, 111, 3);
INSERT INTO `wms_receipt_order_detail` VALUES (1328, 287, 106, 1.00, NULL, 55, NULL, 0, NULL, NULL, NULL, NULL, NULL, 86, 98, 0);
INSERT INTO `wms_receipt_order_detail` VALUES (1329, 287, 105, 1.00, NULL, 56, NULL, 0, NULL, NULL, NULL, NULL, NULL, 86, 98, 0);
INSERT INTO `wms_receipt_order_detail` VALUES (1330, 287, 104, 1.00, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 89, 103, 0);
INSERT INTO `wms_receipt_order_detail` VALUES (1331, 287, 103, 4.00, NULL, 62, NULL, 0, NULL, NULL, NULL, NULL, NULL, 92, 109, 0);
INSERT INTO `wms_receipt_order_detail` VALUES (1334, 288, 107, 1.00, 1.00, 64, NULL, 0, NULL, NULL, NULL, NULL, NULL, 95, 111, 0);
INSERT INTO `wms_receipt_order_detail` VALUES (1335, 288, 106, 1.00, 1.00, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `wms_receipt_order_detail` VALUES (1336, 289, 107, 4.00, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 84, 90, 0);
INSERT INTO `wms_receipt_order_detail` VALUES (1337, 289, 106, 3.00, NULL, 55, NULL, 0, NULL, NULL, NULL, NULL, NULL, 86, 98, 0);
INSERT INTO `wms_receipt_order_detail` VALUES (1338, 289, 104, 18.00, NULL, 55, NULL, 0, NULL, NULL, NULL, NULL, NULL, 86, 98, 0);
INSERT INTO `wms_receipt_order_detail` VALUES (1339, 289, 103, 122.00, NULL, 56, NULL, 0, NULL, NULL, NULL, NULL, NULL, 86, 98, 0);
INSERT INTO `wms_receipt_order_detail` VALUES (1340, 290, 104, 4.00, NULL, 55, NULL, 0, NULL, NULL, NULL, NULL, NULL, 86, 98, 0);
INSERT INTO `wms_receipt_order_detail` VALUES (1341, 290, 103, 3.00, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 88, NULL, 0);
INSERT INTO `wms_receipt_order_detail` VALUES (1346, 292, 108, 15.00, 15.00, 65, NULL, 0, NULL, NULL, NULL, NULL, NULL, 98, 112, 3);
INSERT INTO `wms_receipt_order_detail` VALUES (1347, 291, 107, 1.00, 1.00, 55, NULL, 0, NULL, NULL, NULL, NULL, NULL, 86, 98, 0);
INSERT INTO `wms_receipt_order_detail` VALUES (1348, 291, 104, 1.00, 1.00, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 88, NULL, 0);
INSERT INTO `wms_receipt_order_detail` VALUES (1350, 293, 110, 31.00, 1.00, 66, NULL, 0, NULL, NULL, NULL, NULL, NULL, 101, 115, 3);
INSERT INTO `wms_receipt_order_detail` VALUES (1352, 294, 110, 21.00, 14.00, 66, NULL, 0, NULL, NULL, NULL, NULL, NULL, 101, 115, 3);
INSERT INTO `wms_receipt_order_detail` VALUES (1355, 295, 111, 10.00, 10.00, 67, NULL, 0, NULL, NULL, NULL, NULL, NULL, 102, 116, 3);
INSERT INTO `wms_receipt_order_detail` VALUES (1363, 297, 113, 1.00, 1.00, 67, NULL, 0, NULL, NULL, NULL, NULL, NULL, 102, 116, 3);
INSERT INTO `wms_receipt_order_detail` VALUES (1364, 296, 113, 1.00, 1.00, 67, NULL, 0, NULL, NULL, NULL, NULL, NULL, 102, 116, 0);
INSERT INTO `wms_receipt_order_detail` VALUES (1365, 296, 112, 1.00, 1.00, 67, NULL, 0, NULL, NULL, NULL, NULL, NULL, 102, 116, 2);
INSERT INTO `wms_receipt_order_detail` VALUES (1366, 296, 111, 1.00, 1.00, 67, NULL, 0, NULL, NULL, NULL, NULL, NULL, 102, 116, 0);
INSERT INTO `wms_receipt_order_detail` VALUES (1367, 296, 110, 1.00, 1.00, 66, NULL, 0, NULL, NULL, NULL, NULL, NULL, 101, 115, 0);
INSERT INTO `wms_receipt_order_detail` VALUES (1372, 301, 115, 1.00, 1.00, 67, NULL, 0, NULL, NULL, NULL, NULL, NULL, 101, 115, 3);
INSERT INTO `wms_receipt_order_detail` VALUES (1373, 301, 114, 1.00, 1.00, 67, NULL, 0, NULL, NULL, NULL, NULL, NULL, 101, 115, 3);
INSERT INTO `wms_receipt_order_detail` VALUES (1380, 300, 114, 1.00, 1.00, 67, NULL, 0, NULL, NULL, NULL, NULL, NULL, 102, 116, 3);
INSERT INTO `wms_receipt_order_detail` VALUES (1388, 303, 111, 5.00, 1.00, 67, NULL, 0, NULL, NULL, NULL, NULL, NULL, 104, 117, 2);
INSERT INTO `wms_receipt_order_detail` VALUES (1389, 302, 112, 1.00, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `wms_receipt_order_detail` VALUES (1390, 302, 114, 1.00, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `wms_receipt_order_detail` VALUES (1391, 302, 111, 1.00, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `wms_receipt_order_detail` VALUES (1392, 302, 110, 1.00, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `wms_receipt_order_detail` VALUES (1393, 305, 115, 1.00, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `wms_receipt_order_detail` VALUES (1394, 305, 114, 1.00, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `wms_receipt_order_detail` VALUES (1400, 306, 115, 100.00, 10.00, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 105, NULL, 3);
INSERT INTO `wms_receipt_order_detail` VALUES (1401, 298, 114, 100.00, 1.00, 67, NULL, 0, NULL, NULL, NULL, NULL, NULL, 102, 116, 4);
INSERT INTO `wms_receipt_order_detail` VALUES (1408, 307, 117, 1000.00, 999.00, 68, NULL, 0, NULL, NULL, NULL, NULL, NULL, 106, 118, 3);
INSERT INTO `wms_receipt_order_detail` VALUES (1412, 309, 117, 1.00, NULL, 68, NULL, 0, NULL, NULL, NULL, NULL, NULL, 106, 118, 0);
INSERT INTO `wms_receipt_order_detail` VALUES (1413, 311, 117, 1.00, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `wms_receipt_order_detail` VALUES (1416, 312, 117, 2.00, 1.00, 68, NULL, 0, NULL, NULL, NULL, NULL, NULL, 106, 118, 3);
INSERT INTO `wms_receipt_order_detail` VALUES (1421, 314, 117, 1.33, 1.33, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 107, NULL, 0);
INSERT INTO `wms_receipt_order_detail` VALUES (1422, 314, 115, 13333434.00, 146654.00, 68, NULL, 0, NULL, NULL, NULL, NULL, NULL, 106, 118, 0);
INSERT INTO `wms_receipt_order_detail` VALUES (1423, 308, 117, 4.00, 4.00, 68, NULL, 0, NULL, NULL, NULL, NULL, NULL, 106, 118, 1);
INSERT INTO `wms_receipt_order_detail` VALUES (1424, 304, 115, 1.00, 1.00, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 105, NULL, 3);
INSERT INTO `wms_receipt_order_detail` VALUES (1425, 304, 114, 1.00, 1.00, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 105, NULL, 4);
INSERT INTO `wms_receipt_order_detail` VALUES (1426, 315, 117, 1.00, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `wms_receipt_order_detail` VALUES (1430, 317, 112, 3.00, 1.00, 66, NULL, 0, NULL, NULL, NULL, NULL, NULL, 101, 115, 3);
INSERT INTO `wms_receipt_order_detail` VALUES (1431, 317, 110, 3.00, 1.00, 66, NULL, 0, NULL, NULL, NULL, NULL, NULL, 101, 115, 3);
INSERT INTO `wms_receipt_order_detail` VALUES (1433, 316, 117, 1.00, 1.00, 68, NULL, 0, NULL, NULL, NULL, NULL, NULL, 106, 118, 2);
INSERT INTO `wms_receipt_order_detail` VALUES (1439, 320, 114, 8.00, 1.00, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 107, NULL, 3);
INSERT INTO `wms_receipt_order_detail` VALUES (1440, 320, 112, 5.00, 1.00, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 107, NULL, 3);
INSERT INTO `wms_receipt_order_detail` VALUES (1443, 319, 117, 7.00, 1.00, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 107, NULL, 1);
INSERT INTO `wms_receipt_order_detail` VALUES (1449, 323, 117, 10.00, 1.00, 68, NULL, 0, NULL, NULL, NULL, NULL, NULL, 106, 118, 3);
INSERT INTO `wms_receipt_order_detail` VALUES (1450, 323, 115, 7.00, 1.00, 67, NULL, 0, NULL, NULL, NULL, NULL, NULL, 104, 117, 3);
INSERT INTO `wms_receipt_order_detail` VALUES (1451, 323, 114, 5.00, 1.00, 67, NULL, 0, NULL, NULL, NULL, NULL, NULL, 102, 116, 3);
INSERT INTO `wms_receipt_order_detail` VALUES (1452, 323, 113, 5.00, 1.00, 67, NULL, 0, NULL, NULL, NULL, NULL, NULL, 102, 116, 3);
INSERT INTO `wms_receipt_order_detail` VALUES (1454, 324, 117, 20.00, 1.00, 71, NULL, 0, NULL, NULL, NULL, NULL, NULL, 109, 120, 3);
INSERT INTO `wms_receipt_order_detail` VALUES (1459, 325, 117, 1.00, 1.00, 71, NULL, 0, NULL, NULL, NULL, NULL, NULL, 109, 120, 3);
INSERT INTO `wms_receipt_order_detail` VALUES (1460, 325, 112, 1.00, 1.00, 66, NULL, 0, NULL, NULL, NULL, NULL, NULL, 101, 115, 3);
INSERT INTO `wms_receipt_order_detail` VALUES (1463, 322, 117, 2.00, 1.00, 71, NULL, 0, NULL, NULL, NULL, NULL, NULL, 109, 120, 0);
INSERT INTO `wms_receipt_order_detail` VALUES (1466, 326, 117, 1.00, 2.00, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 111, 121, 3);
INSERT INTO `wms_receipt_order_detail` VALUES (1467, 326, 112, 1.00, 1.00, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 111, 121, 3);
INSERT INTO `wms_receipt_order_detail` VALUES (1470, 328, 117, 4.00, 1.00, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 109, NULL, 0);
INSERT INTO `wms_receipt_order_detail` VALUES (1471, 328, 115, 1.00, 1.00, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 109, NULL, 0);
INSERT INTO `wms_receipt_order_detail` VALUES (1487, 329, 117, 5.00, 4.00, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 109, NULL, 0);
INSERT INTO `wms_receipt_order_detail` VALUES (1488, 329, 115, 5.00, 1.00, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 112, 123, 0);
INSERT INTO `wms_receipt_order_detail` VALUES (1489, 329, 114, 5.00, 1.00, 67, NULL, 0, NULL, NULL, NULL, NULL, NULL, 102, 116, 0);
INSERT INTO `wms_receipt_order_detail` VALUES (1490, 330, 117, 1.00, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `wms_receipt_order_detail` VALUES (1493, 331, 118, 1000.00, 1.00, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4);
INSERT INTO `wms_receipt_order_detail` VALUES (1495, 333, 119, 1.00, 1.00, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 111, NULL, 3);
INSERT INTO `wms_receipt_order_detail` VALUES (1502, 334, 119, 4.00, 1.00, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 111, NULL, 3);
INSERT INTO `wms_receipt_order_detail` VALUES (1503, 334, 118, 4.00, 1.00, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 111, NULL, 2);
INSERT INTO `wms_receipt_order_detail` VALUES (1510, 336, 121, 1.00, 1.00, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 111, NULL, 3);
INSERT INTO `wms_receipt_order_detail` VALUES (1511, 336, 119, 1.00, 1.00, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 111, NULL, 3);
INSERT INTO `wms_receipt_order_detail` VALUES (1514, 337, 122, 1.00, 1.00, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 115, 125, 3);
INSERT INTO `wms_receipt_order_detail` VALUES (1524, 339, 121, 6.00, 6.00, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 111, NULL, 3);
INSERT INTO `wms_receipt_order_detail` VALUES (1525, 339, 120, 5.00, 5.00, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 111, NULL, 3);
INSERT INTO `wms_receipt_order_detail` VALUES (1526, 339, 119, 6.00, 6.00, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 111, NULL, 3);
INSERT INTO `wms_receipt_order_detail` VALUES (1527, 339, 118, 6.00, 6.00, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 111, NULL, 3);
INSERT INTO `wms_receipt_order_detail` VALUES (1528, 338, 120, 3.00, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `wms_receipt_order_detail` VALUES (1529, 338, 119, 1.00, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `wms_receipt_order_detail` VALUES (1530, 338, 121, 1.00, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `wms_receipt_order_detail` VALUES (1531, 338, 118, 1.00, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `wms_receipt_order_detail` VALUES (1548, 341, 121, 1.00, 1.00, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 114, NULL, 3);
INSERT INTO `wms_receipt_order_detail` VALUES (1549, 341, 120, 1.00, 1.00, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 114, NULL, 3);
INSERT INTO `wms_receipt_order_detail` VALUES (1550, 341, 119, 1.00, 1.00, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 114, NULL, 3);
INSERT INTO `wms_receipt_order_detail` VALUES (1551, 341, 118, 1.00, 1.00, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 114, NULL, 3);
INSERT INTO `wms_receipt_order_detail` VALUES (1558, 343, 121, 4.00, 1.00, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 113, NULL, 3);
INSERT INTO `wms_receipt_order_detail` VALUES (1561, 342, 121, 5.00, 1.00, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 113, NULL, 3);
INSERT INTO `wms_receipt_order_detail` VALUES (1562, 342, 120, 4.00, 1.00, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 113, NULL, 0);
INSERT INTO `wms_receipt_order_detail` VALUES (1567, 340, 121, 1.00, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `wms_receipt_order_detail` VALUES (1568, 340, 120, 1.00, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `wms_receipt_order_detail` VALUES (1569, 340, 119, 1.00, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `wms_receipt_order_detail` VALUES (1571, 344, 121, 11.00, 1.00, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 111, NULL, 3);
INSERT INTO `wms_receipt_order_detail` VALUES (1574, 345, 121, 1.00, 1.00, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 111, NULL, 0);
INSERT INTO `wms_receipt_order_detail` VALUES (1577, 348, 121, 100000.00, 322424.00, 74, NULL, 0, NULL, NULL, NULL, NULL, NULL, 116, 126, 3);
INSERT INTO `wms_receipt_order_detail` VALUES (1578, 348, 120, 1.00, 234324224.00, 74, NULL, 0, NULL, NULL, NULL, NULL, NULL, 116, 126, 3);
INSERT INTO `wms_receipt_order_detail` VALUES (1582, 349, 121, 100.00, 100.00, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 116, NULL, 3);
INSERT INTO `wms_receipt_order_detail` VALUES (1583, 350, 121, 3.00, NULL, 74, NULL, 0, NULL, NULL, NULL, NULL, NULL, 116, 126, 0);
INSERT INTO `wms_receipt_order_detail` VALUES (1584, 350, 118, 2.00, NULL, 74, NULL, 0, NULL, NULL, NULL, NULL, NULL, 116, 126, 0);
INSERT INTO `wms_receipt_order_detail` VALUES (1588, 353, 123, 1.00, NULL, 74, NULL, 0, NULL, NULL, NULL, NULL, NULL, 116, 126, 0);
INSERT INTO `wms_receipt_order_detail` VALUES (1594, 355, 123, 2147483647.00, 2147483647.00, 74, NULL, 0, NULL, NULL, NULL, NULL, NULL, 116, 126, 3);
INSERT INTO `wms_receipt_order_detail` VALUES (1599, 351, 123, 1.00, 1.00, 74, NULL, 0, NULL, NULL, NULL, NULL, NULL, 116, 126, 4);
INSERT INTO `wms_receipt_order_detail` VALUES (1606, 356, 125, 1000.00, 1.00, 77, NULL, 0, NULL, NULL, NULL, NULL, NULL, 118, 128, 3);
INSERT INTO `wms_receipt_order_detail` VALUES (1607, 356, 124, 198.00, 1.00, 76, NULL, 0, NULL, NULL, NULL, NULL, NULL, 119, 131, 3);
INSERT INTO `wms_receipt_order_detail` VALUES (1608, 354, 123, 3.00, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `wms_receipt_order_detail` VALUES (1611, 357, 125, 1000.00, 1000.00, 77, NULL, 0, NULL, NULL, NULL, NULL, NULL, 118, 128, 3);
INSERT INTO `wms_receipt_order_detail` VALUES (1612, 357, 124, 190.00, 190.00, 79, NULL, 0, NULL, NULL, NULL, NULL, NULL, 119, 131, 3);
INSERT INTO `wms_receipt_order_detail` VALUES (1615, 358, 125, 100.00, 50.00, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `wms_receipt_order_detail` VALUES (1616, 359, 125, 1.00, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `wms_receipt_order_detail` VALUES (1619, 360, 124, 1.00, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `wms_receipt_order_detail` VALUES (1620, 360, 125, 1.00, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `wms_receipt_order_detail` VALUES (1625, 362, 125, 2.00, 1.00, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 117, 127, 3);
INSERT INTO `wms_receipt_order_detail` VALUES (1626, 362, 124, 1.00, 1.00, 78, NULL, 0, NULL, NULL, NULL, NULL, NULL, 118, 129, 3);
INSERT INTO `wms_receipt_order_detail` VALUES (1629, 364, 125, 4.00, 1.00, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 118, 129, 3);
INSERT INTO `wms_receipt_order_detail` VALUES (1630, 363, 125, 1.00, 1.00, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 118, 129, 3);
INSERT INTO `wms_receipt_order_detail` VALUES (1632, 365, 125, 1.00, 1.00, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 116, NULL, 3);
INSERT INTO `wms_receipt_order_detail` VALUES (1637, 367, 128, 2.00, 2.00, 90, NULL, 0, NULL, NULL, NULL, NULL, NULL, 122, 135, 3);
INSERT INTO `wms_receipt_order_detail` VALUES (1638, 367, 127, 11.00, 12.00, 91, NULL, 0, NULL, NULL, NULL, NULL, NULL, 122, 135, 3);
INSERT INTO `wms_receipt_order_detail` VALUES (1640, 368, 127, 100.00, 100.00, 90, NULL, 0, NULL, NULL, NULL, NULL, NULL, 122, 135, 3);
INSERT INTO `wms_receipt_order_detail` VALUES (1643, 369, 127, 200.00, 200.00, 90, NULL, 0, NULL, NULL, NULL, NULL, NULL, 122, 135, 3);
INSERT INTO `wms_receipt_order_detail` VALUES (1645, 370, 130, 13.00, 13.00, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 117, 127, 3);
INSERT INTO `wms_receipt_order_detail` VALUES (1648, 371, 130, 6.00, 6.00, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 117, 127, 3);
INSERT INTO `wms_receipt_order_detail` VALUES (1649, 372, 129, 2.00, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `wms_receipt_order_detail` VALUES (1656, 373, 130, 1.00, 1.00, 89, NULL, 0, NULL, NULL, NULL, NULL, NULL, 121, 134, 3);
INSERT INTO `wms_receipt_order_detail` VALUES (1657, 373, 129, 1.00, 1.00, 89, NULL, 0, NULL, NULL, NULL, NULL, NULL, 121, 134, 3);
INSERT INTO `wms_receipt_order_detail` VALUES (1658, 373, 128, 1.00, 1.00, 91, NULL, 0, NULL, NULL, NULL, NULL, NULL, 122, 135, 3);
INSERT INTO `wms_receipt_order_detail` VALUES (1659, 366, 130, 3.00, 1.00, 89, NULL, 0, NULL, NULL, NULL, NULL, NULL, 121, 134, 3);
INSERT INTO `wms_receipt_order_detail` VALUES (1660, 366, 129, 1.00, 1.00, 89, NULL, 0, NULL, NULL, NULL, NULL, NULL, 121, 134, 0);
INSERT INTO `wms_receipt_order_detail` VALUES (1670, 375, 130, 1.00, 1.00, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 117, 127, 1);
INSERT INTO `wms_receipt_order_detail` VALUES (1677, 374, 130, 1.00, 1.00, 89, NULL, 0, NULL, NULL, NULL, NULL, NULL, 121, 134, 3);
INSERT INTO `wms_receipt_order_detail` VALUES (1678, 374, 129, 1.00, 1.00, 89, NULL, 0, NULL, NULL, NULL, NULL, NULL, 121, 134, 3);
INSERT INTO `wms_receipt_order_detail` VALUES (1679, 376, 130, 1.00, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `wms_receipt_order_detail` VALUES (1680, 376, 129, 1.00, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `wms_receipt_order_detail` VALUES (1681, 376, 128, 1.00, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `wms_receipt_order_detail` VALUES (1682, 376, 127, 1.00, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `wms_receipt_order_detail` VALUES (1683, 376, 126, 1.00, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `wms_receipt_order_detail` VALUES (1684, 376, 125, 1.00, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `wms_receipt_order_detail` VALUES (1685, 376, 124, 1.00, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `wms_receipt_order_detail` VALUES (1686, 377, 130, 1.00, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `wms_receipt_order_detail` VALUES (1687, 377, 129, 1.00, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `wms_receipt_order_detail` VALUES (1692, 379, 131, 20.00, 1.00, 92, NULL, 0, NULL, NULL, NULL, NULL, NULL, 117, 136, 3);
INSERT INTO `wms_receipt_order_detail` VALUES (1694, 380, 131, 200.00, 200.00, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 117, 127, 3);
INSERT INTO `wms_receipt_order_detail` VALUES (1696, 378, 130, 1.00, 1.00, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 117, 127, 0);
INSERT INTO `wms_receipt_order_detail` VALUES (1697, 378, 129, 1.00, 1.00, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 117, NULL, 0);
INSERT INTO `wms_receipt_order_detail` VALUES (1698, 378, 128, 1.00, 1.00, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 117, 127, 0);
INSERT INTO `wms_receipt_order_detail` VALUES (1699, 383, 132, 1.00, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `wms_receipt_order_detail` VALUES (1700, 384, 132, 1.00, NULL, 78, NULL, 0, NULL, NULL, NULL, NULL, NULL, 118, 129, 0);
INSERT INTO `wms_receipt_order_detail` VALUES (1701, 384, 131, 1.00, NULL, 89, NULL, 0, NULL, NULL, NULL, NULL, NULL, 121, 134, 0);
INSERT INTO `wms_receipt_order_detail` VALUES (1702, 384, 130, 1.00, NULL, 89, NULL, 0, NULL, NULL, NULL, NULL, NULL, 121, 134, 0);
INSERT INTO `wms_receipt_order_detail` VALUES (1708, 385, 133, 10.00, 10.00, 92, NULL, 0, NULL, NULL, NULL, NULL, NULL, 117, 136, 3);
INSERT INTO `wms_receipt_order_detail` VALUES (1710, 386, 133, 100.00, 1.00, 92, NULL, 0, NULL, NULL, NULL, NULL, NULL, 117, 136, 3);
INSERT INTO `wms_receipt_order_detail` VALUES (1722, 388, 133, 100.00, 10.00, 92, NULL, 0, NULL, NULL, NULL, NULL, NULL, 117, 136, 3);
INSERT INTO `wms_receipt_order_detail` VALUES (1729, 387, 132, 1.00, 1.00, 92, NULL, 0, NULL, NULL, NULL, NULL, NULL, 117, 136, 4);
INSERT INTO `wms_receipt_order_detail` VALUES (1730, 387, 131, 1.00, 1.00, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 117, 136, 3);
INSERT INTO `wms_receipt_order_detail` VALUES (1731, 387, 131, 1.00, 1.00, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 117, 136, 4);
INSERT INTO `wms_receipt_order_detail` VALUES (1732, 382, 132, 1.00, 1.00, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3);
INSERT INTO `wms_receipt_order_detail` VALUES (1733, 390, 131, 2.00, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 128, 140, 0);
INSERT INTO `wms_receipt_order_detail` VALUES (1734, 390, 120, 5.00, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 128, 140, 0);
INSERT INTO `wms_receipt_order_detail` VALUES (1737, 391, 134, 14.00, 1.00, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 130, NULL, 3);
INSERT INTO `wms_receipt_order_detail` VALUES (1739, 392, 134, 10.00, 10.00, 94, NULL, 0, NULL, NULL, NULL, NULL, NULL, 131, 142, 3);
INSERT INTO `wms_receipt_order_detail` VALUES (1740, 393, 134, 5.00, NULL, 94, NULL, 0, NULL, NULL, NULL, NULL, NULL, 131, 142, 0);
INSERT INTO `wms_receipt_order_detail` VALUES (1742, 394, 134, 1.00, 6.00, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 132, NULL, 3);
INSERT INTO `wms_receipt_order_detail` VALUES (1744, 395, 135, 100.00, 1.00, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 133, NULL, 3);
INSERT INTO `wms_receipt_order_detail` VALUES (1749, 396, 137, 8.00, 50.00, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3);
INSERT INTO `wms_receipt_order_detail` VALUES (1750, 396, 136, 100.00, 100.00, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3);
INSERT INTO `wms_receipt_order_detail` VALUES (1753, 397, 138, 5.00, 1.00, 96, NULL, 0, NULL, NULL, NULL, NULL, NULL, 134, 144, 3);
INSERT INTO `wms_receipt_order_detail` VALUES (1754, 397, 137, 8.00, 1.00, 96, NULL, 0, NULL, NULL, NULL, NULL, NULL, 134, 144, 3);
INSERT INTO `wms_receipt_order_detail` VALUES (1756, 398, 137, 1.00, 1.00, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 135, NULL, 3);
INSERT INTO `wms_receipt_order_detail` VALUES (1758, 399, 138, 3.00, 1.00, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 135, NULL, 3);
INSERT INTO `wms_receipt_order_detail` VALUES (1761, 400, 139, 100.00, 1.00, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 136, 145, 3);
INSERT INTO `wms_receipt_order_detail` VALUES (1763, 401, 139, 100.00, 100.00, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 136, 145, 3);
INSERT INTO `wms_receipt_order_detail` VALUES (1765, 402, 140, 2.00, 1.00, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 135, 147, 3);
INSERT INTO `wms_receipt_order_detail` VALUES (1767, 403, 140, 4.00, 4.00, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 135, 147, 3);
INSERT INTO `wms_receipt_order_detail` VALUES (1769, 404, 136, 3.00, 1.00, 96, NULL, 0, NULL, NULL, NULL, NULL, NULL, 135, 147, 3);
INSERT INTO `wms_receipt_order_detail` VALUES (1773, 405, 140, 1.00, 1.00, 96, NULL, 0, NULL, NULL, NULL, NULL, NULL, 135, 147, 1);
INSERT INTO `wms_receipt_order_detail` VALUES (1774, 405, 139, 1.00, 1.00, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 136, NULL, 1);
INSERT INTO `wms_receipt_order_detail` VALUES (1775, 405, 138, 1.00, 1.00, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 135, NULL, 1);
INSERT INTO `wms_receipt_order_detail` VALUES (1786, 407, 140, 1000.00, 1.00, 96, NULL, 0, NULL, NULL, NULL, NULL, NULL, 135, 147, 3);
INSERT INTO `wms_receipt_order_detail` VALUES (1787, 407, 139, 2000.00, 1.00, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 136, 145, 3);
INSERT INTO `wms_receipt_order_detail` VALUES (1790, 408, 142, 100000.00, 1.00, 97, NULL, 0, NULL, NULL, NULL, NULL, NULL, 135, 147, 3);
INSERT INTO `wms_receipt_order_detail` VALUES (1792, 409, 142, 10000.00, 10000.00, 97, NULL, 0, NULL, NULL, NULL, NULL, NULL, 135, 147, 3);
INSERT INTO `wms_receipt_order_detail` VALUES (1797, 410, 142, 1.00, 1.00, 96, NULL, 0, NULL, NULL, NULL, NULL, NULL, 135, 147, 0);
INSERT INTO `wms_receipt_order_detail` VALUES (1798, 410, 139, 1.00, 1.00, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 136, 145, 0);
INSERT INTO `wms_receipt_order_detail` VALUES (1799, 411, 141, 4.00, NULL, 97, NULL, 0, NULL, NULL, NULL, NULL, NULL, 135, 147, 0);
INSERT INTO `wms_receipt_order_detail` VALUES (1806, 413, 142, 4.00, 1.00, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 137, 148, 3);
INSERT INTO `wms_receipt_order_detail` VALUES (1807, 413, 141, 3.00, 1.00, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 137, NULL, 3);
INSERT INTO `wms_receipt_order_detail` VALUES (1809, 414, 140, 1.00, 1.00, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 135, 149, 3);
INSERT INTO `wms_receipt_order_detail` VALUES (1811, 415, 142, 10.00, 1.00, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 138, NULL, 3);
INSERT INTO `wms_receipt_order_detail` VALUES (1826, 416, 142, 1.00, 1.00, 97, NULL, 0, NULL, NULL, NULL, NULL, NULL, 135, 147, 3);
INSERT INTO `wms_receipt_order_detail` VALUES (1827, 416, 141, 1.00, 1.00, 96, NULL, 0, NULL, NULL, NULL, NULL, NULL, 135, 147, 3);
INSERT INTO `wms_receipt_order_detail` VALUES (1828, 416, 140, 1.00, 1.00, 96, NULL, 0, NULL, NULL, NULL, NULL, NULL, 135, 147, 3);
INSERT INTO `wms_receipt_order_detail` VALUES (1829, 416, 139, 1.00, 1.00, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 136, NULL, 3);
INSERT INTO `wms_receipt_order_detail` VALUES (1830, 416, 138, 1.00, 1.00, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 135, NULL, 3);
INSERT INTO `wms_receipt_order_detail` VALUES (1831, 416, 137, 1.00, 1.00, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 135, NULL, 3);
INSERT INTO `wms_receipt_order_detail` VALUES (1832, 416, 136, 1.00, 1.00, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3);
INSERT INTO `wms_receipt_order_detail` VALUES (1840, 419, 142, 1.00, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 138, NULL, 0);
INSERT INTO `wms_receipt_order_detail` VALUES (1841, 419, 141, 1.00, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 137, NULL, 0);
INSERT INTO `wms_receipt_order_detail` VALUES (1846, 421, 142, 1.00, 1.00, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 136, 145, 3);
INSERT INTO `wms_receipt_order_detail` VALUES (1847, 421, 137, 1.00, 1.00, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 135, NULL, 3);
INSERT INTO `wms_receipt_order_detail` VALUES (1854, 423, 142, 1.00, 1.00, 98, NULL, 0, NULL, NULL, NULL, NULL, NULL, 137, 148, 3);
INSERT INTO `wms_receipt_order_detail` VALUES (1855, 423, 141, 1.00, 1.00, 97, NULL, 0, NULL, NULL, NULL, NULL, NULL, 135, 147, 3);
INSERT INTO `wms_receipt_order_detail` VALUES (1859, 417, 142, 1.00, 1.00, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 136, 145, 0);
INSERT INTO `wms_receipt_order_detail` VALUES (1860, 417, 141, 1.00, 1.00, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 136, 145, 0);
INSERT INTO `wms_receipt_order_detail` VALUES (1861, 417, 140, 1.00, 1.00, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 137, 148, 0);
INSERT INTO `wms_receipt_order_detail` VALUES (1864, 422, 142, 1.00, 1.00, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 137, NULL, 3);
INSERT INTO `wms_receipt_order_detail` VALUES (1865, 422, 141, 1.00, 1.00, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 138, NULL, 3);
INSERT INTO `wms_receipt_order_detail` VALUES (1866, 424, 142, 1.00, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `wms_receipt_order_detail` VALUES (1873, 425, 142, 1000.00, 188.00, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 139, NULL, 2);
INSERT INTO `wms_receipt_order_detail` VALUES (1874, 425, 141, 8888.00, 6000.00, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 135, NULL, 2);
INSERT INTO `wms_receipt_order_detail` VALUES (1876, 426, 141, 4.00, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 135, NULL, 0);
INSERT INTO `wms_receipt_order_detail` VALUES (1880, 428, 143, 1.00, 1.00, 97, NULL, 0, NULL, NULL, NULL, NULL, NULL, 135, 147, 3);
INSERT INTO `wms_receipt_order_detail` VALUES (1884, 429, 143, 10.00, 1.00, 97, NULL, 0, NULL, NULL, NULL, NULL, NULL, 135, 147, 3);
INSERT INTO `wms_receipt_order_detail` VALUES (1885, 429, 142, 10.00, 1.00, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 136, 145, 3);
INSERT INTO `wms_receipt_order_detail` VALUES (1886, 429, 139, 10.00, 1.00, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 136, NULL, 3);
INSERT INTO `wms_receipt_order_detail` VALUES (1888, 430, 142, 11.00, 1.00, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 135, 149, 3);
INSERT INTO `wms_receipt_order_detail` VALUES (1891, 433, 142, 4.00, 1.00, 97, NULL, 0, NULL, NULL, NULL, NULL, NULL, 135, 147, 0);
INSERT INTO `wms_receipt_order_detail` VALUES (1892, 433, 141, 1.00, 1.00, 98, NULL, 0, NULL, NULL, NULL, NULL, NULL, 137, 148, 0);
INSERT INTO `wms_receipt_order_detail` VALUES (1893, 434, 143, 1.00, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `wms_receipt_order_detail` VALUES (1895, 436, 143, 1.00, 1.00, 96, NULL, 0, NULL, NULL, NULL, NULL, NULL, 136, 145, 1);
INSERT INTO `wms_receipt_order_detail` VALUES (1902, 418, 141, 1.00, 1.00, 98, NULL, 0, NULL, NULL, NULL, NULL, NULL, 137, 148, 3);
INSERT INTO `wms_receipt_order_detail` VALUES (1903, 418, 140, 1.00, 1.00, 96, NULL, 0, NULL, NULL, NULL, NULL, NULL, 136, 145, 4);
INSERT INTO `wms_receipt_order_detail` VALUES (1914, 440, 144, 1.00, 1.00, 98, NULL, 0, NULL, NULL, NULL, NULL, NULL, 137, 148, 3);
INSERT INTO `wms_receipt_order_detail` VALUES (1915, 440, 143, 1.00, 1.00, 96, NULL, 0, NULL, NULL, NULL, NULL, NULL, 136, 145, 3);
INSERT INTO `wms_receipt_order_detail` VALUES (1916, 439, 144, 1.00, 1.00, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 139, NULL, 3);
INSERT INTO `wms_receipt_order_detail` VALUES (1917, 439, 143, 1.00, 1.00, 96, NULL, 0, NULL, NULL, NULL, NULL, NULL, 136, 145, 3);
INSERT INTO `wms_receipt_order_detail` VALUES (1919, 441, 145, 5.00, 1.00, 99, NULL, 0, NULL, NULL, NULL, NULL, NULL, 149, 151, 3);
INSERT INTO `wms_receipt_order_detail` VALUES (1922, 442, 145, 2.00, 2.00, 99, NULL, 0, NULL, NULL, NULL, NULL, NULL, 149, 151, 3);
INSERT INTO `wms_receipt_order_detail` VALUES (1924, 443, 146, 100.00, 1.00, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 150, NULL, 3);
INSERT INTO `wms_receipt_order_detail` VALUES (1925, 437, 144, 200.00, 1.00, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3);
INSERT INTO `wms_receipt_order_detail` VALUES (1928, 444, 146, 1.00, 1.00, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2);
INSERT INTO `wms_receipt_order_detail` VALUES (1929, 444, 145, 1.00, 1.00, 99, NULL, 0, NULL, NULL, NULL, NULL, NULL, 149, 151, 2);
INSERT INTO `wms_receipt_order_detail` VALUES (1960, 445, 146, 50.00, 1.00, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 143, NULL, 3);
INSERT INTO `wms_receipt_order_detail` VALUES (1961, 445, 145, 30.00, 1.00, 99, NULL, 0, NULL, NULL, NULL, NULL, NULL, 149, 151, 3);
INSERT INTO `wms_receipt_order_detail` VALUES (1962, 445, 144, 20.00, 1.00, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3);
INSERT INTO `wms_receipt_order_detail` VALUES (1963, 445, 143, 1.00, 1.00, 96, NULL, 0, NULL, NULL, NULL, NULL, NULL, 136, 145, 3);
INSERT INTO `wms_receipt_order_detail` VALUES (1964, 445, 142, 10.00, 1.00, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 136, 145, 3);
INSERT INTO `wms_receipt_order_detail` VALUES (1965, 445, 141, 100.00, 1.00, 98, NULL, 0, NULL, NULL, NULL, NULL, NULL, 137, 148, 3);
INSERT INTO `wms_receipt_order_detail` VALUES (1966, 445, 140, 100.00, 1.00, 96, NULL, 0, NULL, NULL, NULL, NULL, NULL, 135, 147, 3);
INSERT INTO `wms_receipt_order_detail` VALUES (1967, 445, 139, 10.00, 1.00, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 136, NULL, 3);
INSERT INTO `wms_receipt_order_detail` VALUES (1968, 445, 138, 10.00, 1.00, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 135, NULL, 3);
INSERT INTO `wms_receipt_order_detail` VALUES (1969, 445, 137, 10.00, 1.00, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 135, NULL, 3);
INSERT INTO `wms_receipt_order_detail` VALUES (1972, 446, 146, 1.00, 1.00, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 136, NULL, 3);
INSERT INTO `wms_receipt_order_detail` VALUES (1973, 446, 145, 1.00, 1.00, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 136, NULL, 3);
INSERT INTO `wms_receipt_order_detail` VALUES (1978, 450, 147, 50.00, 50.00, 100, NULL, 0, NULL, NULL, NULL, NULL, NULL, 154, 152, 3);
INSERT INTO `wms_receipt_order_detail` VALUES (1980, 451, 148, 10.00, 1.00, 102, NULL, 0, NULL, NULL, NULL, NULL, NULL, 155, 153, 3);
INSERT INTO `wms_receipt_order_detail` VALUES (1989, 452, 148, 1.00, 2.00, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2);
INSERT INTO `wms_receipt_order_detail` VALUES (1990, 452, 147, 1.00, 1.00, 100, NULL, 0, NULL, NULL, NULL, NULL, NULL, 154, 152, 3);
INSERT INTO `wms_receipt_order_detail` VALUES (1991, 412, 142, 1.00, 1.00, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 136, 145, 1);
INSERT INTO `wms_receipt_order_detail` VALUES (1992, 412, 141, 1.00, 1.00, 98, NULL, 0, NULL, NULL, NULL, NULL, NULL, 137, 148, 1);
INSERT INTO `wms_receipt_order_detail` VALUES (1993, 406, 140, 1.00, 1.00, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 136, 145, 3);
INSERT INTO `wms_receipt_order_detail` VALUES (1994, 406, 139, 1.00, 1.00, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 136, 145, 1);
INSERT INTO `wms_receipt_order_detail` VALUES (1995, 453, 141, 1.00, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `wms_receipt_order_detail` VALUES (1996, 453, 140, 1.00, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `wms_receipt_order_detail` VALUES (1997, 453, 139, 1.00, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `wms_receipt_order_detail` VALUES (2003, 454, 148, 1.00, 1.00, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3);
INSERT INTO `wms_receipt_order_detail` VALUES (2004, 454, 147, 1.00, 1.00, 100, NULL, 0, NULL, NULL, NULL, NULL, NULL, 154, 152, 3);
INSERT INTO `wms_receipt_order_detail` VALUES (2005, 454, 146, 1.00, 1.00, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3);
INSERT INTO `wms_receipt_order_detail` VALUES (2006, 454, 145, 1.00, 1.00, 99, NULL, 0, NULL, NULL, NULL, NULL, NULL, 149, 151, 3);
INSERT INTO `wms_receipt_order_detail` VALUES (2007, 454, 144, 1.00, 1.00, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3);
INSERT INTO `wms_receipt_order_detail` VALUES (2012, 455, 148, 1.00, 1.00, 98, NULL, 0, NULL, NULL, NULL, NULL, NULL, 137, 148, 3);
INSERT INTO `wms_receipt_order_detail` VALUES (2013, 455, 147, 1.00, 1.00, 100, NULL, 0, NULL, NULL, NULL, NULL, NULL, 154, 152, 3);
INSERT INTO `wms_receipt_order_detail` VALUES (2014, 455, 146, 1.00, 1.00, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3);
INSERT INTO `wms_receipt_order_detail` VALUES (2015, 455, 145, 1.00, 1.00, 99, NULL, 0, NULL, NULL, NULL, NULL, NULL, 149, 151, 3);
INSERT INTO `wms_receipt_order_detail` VALUES (2020, 457, 147, 1.00, 1.00, 101, NULL, 0, NULL, NULL, NULL, NULL, NULL, 154, 152, 3);
INSERT INTO `wms_receipt_order_detail` VALUES (2023, 458, 147, 1.00, 1.00, 100, NULL, 0, NULL, NULL, NULL, NULL, NULL, 154, 152, 0);
INSERT INTO `wms_receipt_order_detail` VALUES (2024, 459, 148, 1.00, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 139, NULL, 0);
INSERT INTO `wms_receipt_order_detail` VALUES (2026, 461, 150, 1.00, 1.00, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 139, NULL, 1);
INSERT INTO `wms_receipt_order_detail` VALUES (2027, 462, 150, 1.00, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `wms_receipt_order_detail` VALUES (2029, 463, 151, 1.00, 1.00, 98, NULL, 0, NULL, NULL, NULL, NULL, NULL, 137, 148, 1);
INSERT INTO `wms_receipt_order_detail` VALUES (2030, 464, 151, 1.00, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `wms_receipt_order_detail` VALUES (2031, 468, 153, 1.00, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `wms_receipt_order_detail` VALUES (2038, 470, 152, 1.00, 1.00, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 137, NULL, 3);
INSERT INTO `wms_receipt_order_detail` VALUES (2053, 472, 151, 20.00, 10.00, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 138, 150, 4);
INSERT INTO `wms_receipt_order_detail` VALUES (2054, 472, 150, 13.00, 10.00, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 138, 150, 3);
INSERT INTO `wms_receipt_order_detail` VALUES (2055, 471, 151, 3.00, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 137, NULL, 0);
INSERT INTO `wms_receipt_order_detail` VALUES (2056, 473, 155, 100.00, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 163, 156, 0);
INSERT INTO `wms_receipt_order_detail` VALUES (2059, 474, 156, 200.50, 1.00, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 165, 157, 3);
INSERT INTO `wms_receipt_order_detail` VALUES (2060, 474, 146, 10.00, 1.00, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 164, NULL, 3);
INSERT INTO `wms_receipt_order_detail` VALUES (2066, 476, 157, 3.00, 1.00, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 166, NULL, 3);
INSERT INTO `wms_receipt_order_detail` VALUES (2070, 477, 158, 300.00, 300.00, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 143, NULL, 3);
INSERT INTO `wms_receipt_order_detail` VALUES (2074, 478, 159, 100.00, 100.00, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 143, NULL, 3);
INSERT INTO `wms_receipt_order_detail` VALUES (2075, 479, 159, 1.00, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `wms_receipt_order_detail` VALUES (2076, 479, 157, 1.00, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `wms_receipt_order_detail` VALUES (2077, 480, 159, 1.00, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `wms_receipt_order_detail` VALUES (2078, 480, 158, 1.00, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `wms_receipt_order_detail` VALUES (2079, 480, 157, 1.00, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `wms_receipt_order_detail` VALUES (2080, 480, 156, 1.00, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `wms_receipt_order_detail` VALUES (2081, 480, 155, 1.00, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `wms_receipt_order_detail` VALUES (2082, 481, 159, 20.00, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 137, NULL, 0);
INSERT INTO `wms_receipt_order_detail` VALUES (2083, 481, 158, 5.00, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `wms_receipt_order_detail` VALUES (2084, 481, 157, 4.00, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `wms_receipt_order_detail` VALUES (2085, 482, 159, 1.00, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 138, 150, 0);
INSERT INTO `wms_receipt_order_detail` VALUES (2086, 482, 158, 1.00, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 138, 150, 0);
INSERT INTO `wms_receipt_order_detail` VALUES (2087, 482, 157, 1.00, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 138, 150, 0);
INSERT INTO `wms_receipt_order_detail` VALUES (2097, 484, 161, 1.00, 1.00, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 138, 150, 3);
INSERT INTO `wms_receipt_order_detail` VALUES (2098, 484, 160, 1.00, 1.00, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 140, NULL, 3);
INSERT INTO `wms_receipt_order_detail` VALUES (2099, 475, 156, 3.00, 1.00, 98, NULL, 0, NULL, NULL, NULL, NULL, NULL, 137, 148, 2);
INSERT INTO `wms_receipt_order_detail` VALUES (2100, 475, 155, 1.00, 1.00, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 163, 156, 0);
INSERT INTO `wms_receipt_order_detail` VALUES (2105, 486, 161, 1.00, 1.00, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 140, NULL, 2);
INSERT INTO `wms_receipt_order_detail` VALUES (2106, 486, 160, 1.00, 1.00, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 138, 150, 1);
INSERT INTO `wms_receipt_order_detail` VALUES (2108, 485, 161, 1.00, 15.00, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 140, NULL, 2);
INSERT INTO `wms_receipt_order_detail` VALUES (2119, 487, 160, 10.00, 6.00, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 138, 150, 2);
INSERT INTO `wms_receipt_order_detail` VALUES (2120, 487, 158, 10.00, 6.00, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2);
INSERT INTO `wms_receipt_order_detail` VALUES (2121, 466, 147, 1.00, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `wms_receipt_order_detail` VALUES (2122, 466, 145, 1.00, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `wms_receipt_order_detail` VALUES (2123, 488, 161, 1.00, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `wms_receipt_order_detail` VALUES (2124, 488, 160, 1.00, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `wms_receipt_order_detail` VALUES (2128, 491, 162, 100.00, 1.00, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 138, 160, 3);
INSERT INTO `wms_receipt_order_detail` VALUES (2132, 492, 162, 99.00, 99.00, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 138, 160, 3);
INSERT INTO `wms_receipt_order_detail` VALUES (2134, 493, 158, 1.00, 1.00, 110, NULL, 0, NULL, NULL, NULL, NULL, NULL, 138, 160, 0);
INSERT INTO `wms_receipt_order_detail` VALUES (2135, 494, 162, 1.00, NULL, 110, NULL, 0, NULL, NULL, NULL, NULL, NULL, 138, 160, 0);
INSERT INTO `wms_receipt_order_detail` VALUES (2136, 494, 158, 1.00, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `wms_receipt_order_detail` VALUES (2137, 494, 157, 3.00, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `wms_receipt_order_detail` VALUES (2138, 494, 156, 1.00, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `wms_receipt_order_detail` VALUES (2139, 494, 155, 1.00, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `wms_receipt_order_detail` VALUES (2140, 494, 154, 3.00, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `wms_receipt_order_detail` VALUES (2141, 494, 152, 1.00, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `wms_receipt_order_detail` VALUES (2142, 494, 151, 3.00, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `wms_receipt_order_detail` VALUES (2143, 494, 150, 3.00, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `wms_receipt_order_detail` VALUES (2144, 494, 149, 1.00, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `wms_receipt_order_detail` VALUES (2146, 489, 158, 1.00, 1.00, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 138, 150, 3);
INSERT INTO `wms_receipt_order_detail` VALUES (2147, 469, 148, 1.00, 1.00, 98, NULL, 0, NULL, NULL, NULL, NULL, NULL, 137, 148, 3);
INSERT INTO `wms_receipt_order_detail` VALUES (2148, 469, 152, 1.00, 1.00, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 138, 150, 3);
INSERT INTO `wms_receipt_order_detail` VALUES (2152, 497, 157, 1.00, 1.00, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 138, 150, 3);
INSERT INTO `wms_receipt_order_detail` VALUES (2154, 498, 162, 1.00, 1.00, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 138, 160, 3);
INSERT INTO `wms_receipt_order_detail` VALUES (2156, 499, 162, 987.00, 1.00, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 138, 160, 3);
INSERT INTO `wms_receipt_order_detail` VALUES (2161, 495, 162, 1.00, 1.00, 110, NULL, 0, NULL, NULL, NULL, NULL, NULL, 138, 160, 3);
INSERT INTO `wms_receipt_order_detail` VALUES (2162, 495, 158, 1.00, 1.00, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 143, NULL, 4);
INSERT INTO `wms_receipt_order_detail` VALUES (2170, 500, 162, 100.00, 50.00, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 138, 160, 3);
INSERT INTO `wms_receipt_order_detail` VALUES (2174, 501, 157, 1000.00, 1000.00, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3);
INSERT INTO `wms_receipt_order_detail` VALUES (2185, 502, 157, 1000.00, 500.00, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 139, NULL, 3);
INSERT INTO `wms_receipt_order_detail` VALUES (2187, 504, 157, 1999.00, 1999.00, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 144, NULL, 3);
INSERT INTO `wms_receipt_order_detail` VALUES (2189, 505, 157, 1001.00, 1001.00, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 144, NULL, 3);
INSERT INTO `wms_receipt_order_detail` VALUES (2192, 507, 157, 1.00, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `wms_receipt_order_detail` VALUES (2193, 508, 162, 1.00, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `wms_receipt_order_detail` VALUES (2195, 509, 163, 100.00, 100.00, 110, NULL, 0, NULL, NULL, NULL, NULL, NULL, 138, 160, 3);
INSERT INTO `wms_receipt_order_detail` VALUES (2197, 510, 162, 111.00, 1.00, 104, NULL, 0, NULL, NULL, NULL, NULL, NULL, 139, 155, 3);
INSERT INTO `wms_receipt_order_detail` VALUES (2198, 506, 157, 1500.00, 700.00, 104, NULL, 0, NULL, NULL, NULL, NULL, NULL, 139, 155, 3);
INSERT INTO `wms_receipt_order_detail` VALUES (2200, 511, 162, 111.00, 1.00, 107, NULL, 0, NULL, NULL, NULL, NULL, NULL, 139, 155, 3);
INSERT INTO `wms_receipt_order_detail` VALUES (2202, 512, 162, 10.00, 5.00, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 147, NULL, 3);
INSERT INTO `wms_receipt_order_detail` VALUES (2203, 513, 162, 1.00, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `wms_receipt_order_detail` VALUES (2204, 513, 158, 1.00, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `wms_receipt_order_detail` VALUES (2205, 513, 157, 1.00, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `wms_receipt_order_detail` VALUES (2206, 513, 156, 1.00, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `wms_receipt_order_detail` VALUES (2207, 513, 155, 1.00, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `wms_receipt_order_detail` VALUES (2208, 513, 154, 1.00, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `wms_receipt_order_detail` VALUES (2209, 513, 152, 1.00, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `wms_receipt_order_detail` VALUES (2210, 513, 151, 1.00, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `wms_receipt_order_detail` VALUES (2211, 513, 150, 1.00, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `wms_receipt_order_detail` VALUES (2212, 513, 149, 1.00, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `wms_receipt_order_detail` VALUES (2216, 514, 168, 1.00, 22.00, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 181, NULL, 3);
INSERT INTO `wms_receipt_order_detail` VALUES (2219, 515, 169, 10.00, 1.00, 113, NULL, 0, NULL, NULL, NULL, NULL, NULL, 184, 169, 3);
INSERT INTO `wms_receipt_order_detail` VALUES (2221, 516, 169, 10.00, 10.00, 113, NULL, 0, NULL, NULL, NULL, NULL, NULL, 184, 169, 3);
INSERT INTO `wms_receipt_order_detail` VALUES (2222, 503, 162, 1.00, 1.00, 110, NULL, 0, NULL, NULL, NULL, NULL, NULL, 138, 160, 2);
INSERT INTO `wms_receipt_order_detail` VALUES (2223, 503, 156, 1.00, 1.00, 110, NULL, 0, NULL, NULL, NULL, NULL, NULL, 138, 160, 1);
INSERT INTO `wms_receipt_order_detail` VALUES (2230, 517, 169, 1.00, 1.00, 107, NULL, 0, NULL, NULL, NULL, NULL, NULL, 139, 155, 3);
INSERT INTO `wms_receipt_order_detail` VALUES (2231, 517, 162, 1.00, 1.00, 107, NULL, 0, NULL, NULL, NULL, NULL, NULL, 139, 155, 3);
INSERT INTO `wms_receipt_order_detail` VALUES (2263, 519, 169, 1.00, 1.00, 113, NULL, 0, NULL, NULL, NULL, NULL, NULL, 184, 169, 3);
INSERT INTO `wms_receipt_order_detail` VALUES (2264, 519, 168, 1.00, 1.00, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 181, NULL, 4);
INSERT INTO `wms_receipt_order_detail` VALUES (2265, 519, 167, 1.00, 1.00, 107, NULL, 0, NULL, NULL, NULL, NULL, NULL, 139, 155, 0);
INSERT INTO `wms_receipt_order_detail` VALUES (2266, 519, 165, 1.00, 1.00, 109, NULL, 0, NULL, NULL, NULL, NULL, NULL, 139, 155, 3);
INSERT INTO `wms_receipt_order_detail` VALUES (2267, 519, 164, 1.00, 1.00, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 147, NULL, 0);
INSERT INTO `wms_receipt_order_detail` VALUES (2268, 519, 162, 1.00, 1.00, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 138, 160, 0);
INSERT INTO `wms_receipt_order_detail` VALUES (2269, 519, 158, 1.00, 1.00, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `wms_receipt_order_detail` VALUES (2270, 519, 157, 1.00, 1.00, 104, NULL, 0, NULL, NULL, NULL, NULL, NULL, 139, 155, 0);
INSERT INTO `wms_receipt_order_detail` VALUES (2271, 519, 156, 1.00, 1.00, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 165, 157, 0);
INSERT INTO `wms_receipt_order_detail` VALUES (2272, 519, 155, 1.00, 1.00, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 163, 156, 0);
INSERT INTO `wms_receipt_order_detail` VALUES (2273, 518, 169, 1.00, 1.00, 113, NULL, 0, NULL, NULL, NULL, NULL, NULL, 184, 169, 3);
INSERT INTO `wms_receipt_order_detail` VALUES (2278, 522, 162, 1.00, 1.00, 107, NULL, 0, NULL, NULL, NULL, NULL, NULL, 139, 155, 3);
INSERT INTO `wms_receipt_order_detail` VALUES (2280, 523, 170, 1.00, 1.00, 114, NULL, 0, NULL, NULL, NULL, NULL, NULL, 185, 170, 3);
INSERT INTO `wms_receipt_order_detail` VALUES (2287, 521, 169, 1.00, NULL, 107, NULL, 0, NULL, NULL, NULL, NULL, NULL, 139, 155, 0);
INSERT INTO `wms_receipt_order_detail` VALUES (2312, 524, 170, 6.00, 1.00, 107, NULL, 0, NULL, NULL, NULL, NULL, NULL, 139, 155, 3);
INSERT INTO `wms_receipt_order_detail` VALUES (2313, 524, 167, 7.00, 1.00, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 140, 145, 0);
INSERT INTO `wms_receipt_order_detail` VALUES (2314, 524, 165, 4.00, 1.00, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 151, NULL, 0);
INSERT INTO `wms_receipt_order_detail` VALUES (2315, 524, 162, 2.00, 1.00, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 138, 160, 0);
INSERT INTO `wms_receipt_order_detail` VALUES (2316, 524, 158, 2.00, 1.00, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `wms_receipt_order_detail` VALUES (2317, 524, 157, 7.00, 1.00, 104, NULL, 0, NULL, NULL, NULL, NULL, NULL, 139, 155, 0);
INSERT INTO `wms_receipt_order_detail` VALUES (2320, 525, 170, 100.00, 100.00, 107, NULL, 0, NULL, NULL, NULL, NULL, NULL, 139, 155, 3);
INSERT INTO `wms_receipt_order_detail` VALUES (2321, 520, 168, 1.00, 1.00, 106, NULL, 0, NULL, NULL, NULL, NULL, NULL, 167, 158, 1);
INSERT INTO `wms_receipt_order_detail` VALUES (2323, 526, 170, 10.00, 1.00, 113, NULL, 0, NULL, NULL, NULL, NULL, NULL, 184, 169, 3);
INSERT INTO `wms_receipt_order_detail` VALUES (2324, 527, 169, 1.00, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `wms_receipt_order_detail` VALUES (2325, 527, 168, 1.00, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `wms_receipt_order_detail` VALUES (2329, 528, 171, 2.00, 2.00, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 155, 172, 3);
INSERT INTO `wms_receipt_order_detail` VALUES (2332, 530, 171, 10.00, 1.00, 102, NULL, 0, NULL, NULL, NULL, NULL, NULL, 155, 171, 3);
INSERT INTO `wms_receipt_order_detail` VALUES (2334, 531, 172, 3.00, 1.00, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 154, NULL, 3);
INSERT INTO `wms_receipt_order_detail` VALUES (2337, 532, 172, 1.00, 1.00, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 154, NULL, 3);
INSERT INTO `wms_receipt_order_detail` VALUES (2338, 532, 171, 1.00, 1.00, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 154, NULL, 3);
INSERT INTO `wms_receipt_order_detail` VALUES (2340, 533, 172, 16.00, 1.00, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 190, NULL, 3);
INSERT INTO `wms_receipt_order_detail` VALUES (2343, 534, 172, 100.00, 1.00, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 189, NULL, 2);
INSERT INTO `wms_receipt_order_detail` VALUES (2344, 534, 171, 200.00, 1.00, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 189, NULL, 0);
INSERT INTO `wms_receipt_order_detail` VALUES (2350, 536, 173, 1.00, 3.00, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 157, NULL, 2);
INSERT INTO `wms_receipt_order_detail` VALUES (2359, 535, 173, 6.00, 1.00, 115, NULL, 0, NULL, NULL, NULL, NULL, NULL, 178, 176, 3);
INSERT INTO `wms_receipt_order_detail` VALUES (2360, 535, 172, 4.00, 1.00, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 157, NULL, 3);
INSERT INTO `wms_receipt_order_detail` VALUES (2365, 537, 172, 6.00, 3.00, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 157, NULL, 3);
INSERT INTO `wms_receipt_order_detail` VALUES (2366, 537, 173, 2.00, 1.00, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 157, NULL, 0);
INSERT INTO `wms_receipt_order_detail` VALUES (2369, 538, 173, 1000.00, 1.00, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 157, NULL, 0);
INSERT INTO `wms_receipt_order_detail` VALUES (2376, 539, 171, 2.00, 1.00, 102, NULL, 0, NULL, NULL, NULL, NULL, NULL, 155, 171, 3);
INSERT INTO `wms_receipt_order_detail` VALUES (2377, 539, 172, 2.00, 7.00, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 160, NULL, 3);
INSERT INTO `wms_receipt_order_detail` VALUES (2382, 541, 174, 10.00, 6.00, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 157, NULL, 3);
INSERT INTO `wms_receipt_order_detail` VALUES (2383, 541, 173, 11.00, 5.00, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 158, NULL, 3);
INSERT INTO `wms_receipt_order_detail` VALUES (2384, 542, 178, 100.00, NULL, 117, NULL, 0, NULL, NULL, NULL, NULL, NULL, 193, 180, 0);
INSERT INTO `wms_receipt_order_detail` VALUES (2385, 542, 176, 100.00, NULL, 118, NULL, 0, NULL, NULL, NULL, NULL, NULL, 194, 181, 0);
INSERT INTO `wms_receipt_order_detail` VALUES (2386, 543, 178, 3.00, NULL, 118, NULL, 0, NULL, NULL, NULL, NULL, NULL, 194, 181, 0);
INSERT INTO `wms_receipt_order_detail` VALUES (2387, 543, 176, 3.00, NULL, 120, NULL, 0, NULL, NULL, NULL, NULL, NULL, 196, 183, 0);
INSERT INTO `wms_receipt_order_detail` VALUES (2389, 544, 178, 55.00, 1.00, 116, NULL, 0, NULL, NULL, NULL, NULL, NULL, 192, 178, 3);
INSERT INTO `wms_receipt_order_detail` VALUES (2393, 546, 180, 100000.00, 1.00, 122, NULL, 0, NULL, NULL, NULL, NULL, NULL, 198, 185, 3);
INSERT INTO `wms_receipt_order_detail` VALUES (2394, 545, 178, 1.00, 1.00, 120, NULL, 0, NULL, NULL, NULL, NULL, NULL, 196, 183, 3);
INSERT INTO `wms_receipt_order_detail` VALUES (2397, 548, 180, 10.00, 1.00, 116, NULL, 0, NULL, NULL, NULL, NULL, NULL, 192, 178, 0);
INSERT INTO `wms_receipt_order_detail` VALUES (2398, 548, 178, 10.00, 1.00, 124, NULL, 0, NULL, NULL, NULL, NULL, NULL, 192, 178, 1);
INSERT INTO `wms_receipt_order_detail` VALUES (2403, 549, 180, 150.00, 1.00, 119, NULL, 0, NULL, NULL, NULL, NULL, NULL, 195, 182, 3);
INSERT INTO `wms_receipt_order_detail` VALUES (2404, 549, 178, 110.00, 1.00, 122, NULL, 0, NULL, NULL, NULL, NULL, NULL, 198, 185, 4);
INSERT INTO `wms_receipt_order_detail` VALUES (2407, 550, 180, 99.00, 1.00, 123, NULL, 0, NULL, NULL, NULL, NULL, NULL, 199, 186, 4);
INSERT INTO `wms_receipt_order_detail` VALUES (2408, 550, 178, 99.00, 1.00, 123, NULL, 0, NULL, NULL, NULL, NULL, NULL, 199, 186, 4);
INSERT INTO `wms_receipt_order_detail` VALUES (2411, 551, 180, 10.00, 1.00, 119, NULL, 0, NULL, NULL, NULL, NULL, NULL, 195, 182, 3);
INSERT INTO `wms_receipt_order_detail` VALUES (2413, 552, 180, 1.00, NULL, 116, NULL, 0, NULL, NULL, NULL, NULL, NULL, 192, 178, 0);
INSERT INTO `wms_receipt_order_detail` VALUES (2414, 553, 180, 2.00, NULL, 116, NULL, 0, NULL, NULL, NULL, NULL, NULL, 192, 178, 0);
INSERT INTO `wms_receipt_order_detail` VALUES (2418, 554, 180, 1.00, 1.00, 116, NULL, 0, NULL, NULL, NULL, NULL, NULL, 192, 178, 0);
INSERT INTO `wms_receipt_order_detail` VALUES (2419, 554, 178, 1.00, 1.00, 124, NULL, 0, NULL, NULL, NULL, NULL, NULL, 192, 178, 0);
INSERT INTO `wms_receipt_order_detail` VALUES (2420, 554, 176, 1.00, 1.00, 116, NULL, 0, NULL, NULL, NULL, NULL, NULL, 192, 178, 0);
INSERT INTO `wms_receipt_order_detail` VALUES (2423, 555, 180, 100.00, 1.00, 118, NULL, 0, NULL, NULL, NULL, NULL, NULL, 194, 181, 2);
INSERT INTO `wms_receipt_order_detail` VALUES (2424, 555, 176, 100.00, 1.00, 118, NULL, 0, NULL, NULL, NULL, NULL, NULL, 194, 181, 3);
INSERT INTO `wms_receipt_order_detail` VALUES (2427, 556, 180, 10.00, 1.00, 117, NULL, 0, NULL, NULL, NULL, NULL, NULL, 193, 180, 1);
INSERT INTO `wms_receipt_order_detail` VALUES (2430, 559, 180, 3.00, NULL, 117, NULL, 0, NULL, NULL, NULL, NULL, NULL, 193, 180, 0);
INSERT INTO `wms_receipt_order_detail` VALUES (2431, 559, 178, 5.00, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `wms_receipt_order_detail` VALUES (2432, 559, 176, 3.00, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `wms_receipt_order_detail` VALUES (2437, 561, 180, 1.00, 1.00, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 193, NULL, 3);
INSERT INTO `wms_receipt_order_detail` VALUES (2439, 560, 178, 10.00, 10.00, 118, NULL, 0, NULL, NULL, NULL, NULL, NULL, 194, 181, 2);
INSERT INTO `wms_receipt_order_detail` VALUES (2442, 562, 180, 203.00, 203.00, 122, NULL, 0, NULL, NULL, NULL, NULL, NULL, 198, 185, 3);
INSERT INTO `wms_receipt_order_detail` VALUES (2443, 558, 180, 1.00, 1.00, 122, NULL, 0, NULL, NULL, NULL, NULL, NULL, 198, 185, 0);
INSERT INTO `wms_receipt_order_detail` VALUES (2444, 557, 178, 1.00, 1.00, 117, NULL, 0, NULL, NULL, NULL, NULL, NULL, 193, 180, 0);
INSERT INTO `wms_receipt_order_detail` VALUES (2448, 563, 180, 1.00, 1.00, 124, NULL, 0, NULL, NULL, NULL, NULL, NULL, 193, 178, 0);
INSERT INTO `wms_receipt_order_detail` VALUES (2449, 563, 178, 1.00, 1.00, 118, NULL, 0, NULL, NULL, NULL, NULL, NULL, 194, 181, 0);
INSERT INTO `wms_receipt_order_detail` VALUES (2450, 563, 176, 1.00, 1.00, 121, NULL, 0, NULL, NULL, NULL, NULL, NULL, 197, 184, 0);
INSERT INTO `wms_receipt_order_detail` VALUES (2451, 564, 180, 3.00, NULL, 116, NULL, 0, NULL, NULL, NULL, NULL, NULL, 193, 178, 0);
INSERT INTO `wms_receipt_order_detail` VALUES (2452, 564, 178, 4.00, NULL, 124, NULL, 0, NULL, NULL, NULL, NULL, NULL, 193, 178, 0);
INSERT INTO `wms_receipt_order_detail` VALUES (2453, 564, 176, 5.00, NULL, 121, NULL, 0, NULL, NULL, NULL, NULL, NULL, 197, 184, 0);
INSERT INTO `wms_receipt_order_detail` VALUES (2456, 565, 180, 100.00, 10.00, 116, NULL, 0, NULL, NULL, NULL, NULL, NULL, 193, 178, 2);
INSERT INTO `wms_receipt_order_detail` VALUES (2459, 566, 182, 100.00, 50.00, 116, NULL, 0, NULL, NULL, NULL, NULL, NULL, 193, 178, 2);
INSERT INTO `wms_receipt_order_detail` VALUES (2460, 566, 181, 100.00, 50.00, 124, NULL, 0, NULL, NULL, NULL, NULL, NULL, 193, 178, 2);
INSERT INTO `wms_receipt_order_detail` VALUES (2464, 568, 182, 1.00, 1.00, 118, NULL, 0, NULL, NULL, NULL, NULL, NULL, 194, 181, 3);
INSERT INTO `wms_receipt_order_detail` VALUES (2469, 570, 182, 1.00, NULL, 124, NULL, 0, NULL, NULL, NULL, NULL, NULL, 193, 178, 0);
INSERT INTO `wms_receipt_order_detail` VALUES (2470, 570, 181, 1.00, NULL, 124, NULL, 0, NULL, NULL, NULL, NULL, NULL, 193, 178, 0);
INSERT INTO `wms_receipt_order_detail` VALUES (2473, 571, 182, 7.00, 1.00, 124, NULL, 0, NULL, NULL, NULL, NULL, NULL, 193, 178, 3);
INSERT INTO `wms_receipt_order_detail` VALUES (2474, 571, 181, 1.00, 1.00, 124, NULL, 0, NULL, NULL, NULL, NULL, NULL, 193, 178, 3);
INSERT INTO `wms_receipt_order_detail` VALUES (2478, 572, 182, 5.00, 1.00, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 194, 181, 3);
INSERT INTO `wms_receipt_order_detail` VALUES (2479, 572, 181, 1.00, 1.00, 116, NULL, 0, NULL, NULL, NULL, NULL, NULL, 193, 178, 3);
INSERT INTO `wms_receipt_order_detail` VALUES (2480, 572, 180, 1.00, 1.00, 122, NULL, 0, NULL, NULL, NULL, NULL, NULL, 198, 185, 3);
INSERT INTO `wms_receipt_order_detail` VALUES (2481, 573, 182, 6.00, NULL, 119, NULL, 0, NULL, NULL, NULL, NULL, NULL, 195, 182, 0);
INSERT INTO `wms_receipt_order_detail` VALUES (2482, 569, 182, 2.00, 1.00, 124, NULL, 0, NULL, NULL, NULL, NULL, NULL, 193, 178, 3);
INSERT INTO `wms_receipt_order_detail` VALUES (2483, 569, 181, 3.00, 1.00, 116, NULL, 0, NULL, NULL, NULL, NULL, NULL, 193, 178, 3);
INSERT INTO `wms_receipt_order_detail` VALUES (2484, 569, 180, 3.00, 1.00, 122, NULL, 0, NULL, NULL, NULL, NULL, NULL, 198, 185, 3);
INSERT INTO `wms_receipt_order_detail` VALUES (2485, 567, 182, 1.00, 1.00, 118, NULL, 0, NULL, NULL, NULL, NULL, NULL, 194, 181, 3);
INSERT INTO `wms_receipt_order_detail` VALUES (2488, 574, 181, 1.00, NULL, 119, NULL, 0, NULL, NULL, NULL, NULL, NULL, 195, 182, 0);
INSERT INTO `wms_receipt_order_detail` VALUES (2489, 574, 180, 1.00, NULL, 121, NULL, 0, NULL, NULL, NULL, NULL, NULL, 197, 184, 0);
INSERT INTO `wms_receipt_order_detail` VALUES (2490, 575, 182, 1.00, NULL, 126, NULL, 0, NULL, NULL, NULL, NULL, NULL, 210, 188, 0);
INSERT INTO `wms_receipt_order_detail` VALUES (2491, 576, 182, 1.00, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `wms_receipt_order_detail` VALUES (2505, 577, 182, 5.00, 2.00, 118, NULL, 0, NULL, NULL, NULL, NULL, NULL, 194, 181, 0);
INSERT INTO `wms_receipt_order_detail` VALUES (2506, 577, 181, 4.00, 2.00, 116, NULL, 0, NULL, NULL, NULL, NULL, NULL, 193, 178, 0);
INSERT INTO `wms_receipt_order_detail` VALUES (2507, 577, 180, 3.00, 2.00, 122, NULL, 0, NULL, NULL, NULL, NULL, NULL, 198, 185, 0);
INSERT INTO `wms_receipt_order_detail` VALUES (2508, 580, 182, 1.00, NULL, 118, NULL, 0, NULL, NULL, NULL, NULL, NULL, 194, 181, 0);
INSERT INTO `wms_receipt_order_detail` VALUES (2509, 582, 182, 1.00, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `wms_receipt_order_detail` VALUES (2510, 579, 182, 1000.00, 800.00, 118, NULL, 0, NULL, NULL, NULL, NULL, NULL, 194, 181, 1);
INSERT INTO `wms_receipt_order_detail` VALUES (2511, 579, 181, 1000.00, 500.00, 118, NULL, 0, NULL, NULL, NULL, NULL, NULL, 194, 181, 1);
INSERT INTO `wms_receipt_order_detail` VALUES (2516, 584, 182, 1.00, 1.00, 118, NULL, 0, NULL, NULL, NULL, NULL, NULL, 194, 181, 3);
INSERT INTO `wms_receipt_order_detail` VALUES (2517, 584, 181, 1.00, 1.00, 118, NULL, 0, NULL, NULL, NULL, NULL, NULL, 194, 181, 3);
INSERT INTO `wms_receipt_order_detail` VALUES (2520, 585, 182, 100.00, 1.00, 118, NULL, 0, NULL, NULL, NULL, NULL, NULL, 194, 181, 3);
INSERT INTO `wms_receipt_order_detail` VALUES (2521, 585, 181, 100.00, 1.00, 118, NULL, 0, NULL, NULL, NULL, NULL, NULL, 194, 181, 3);
INSERT INTO `wms_receipt_order_detail` VALUES (2524, 583, 182, 3.00, 1.00, 118, NULL, 0, NULL, NULL, NULL, NULL, NULL, 194, 181, 0);
INSERT INTO `wms_receipt_order_detail` VALUES (2525, 583, 181, 1.00, 1.00, 116, NULL, 0, NULL, NULL, NULL, NULL, NULL, 193, 178, 0);
INSERT INTO `wms_receipt_order_detail` VALUES (2527, 587, 182, 1.00, NULL, 118, NULL, 0, NULL, NULL, NULL, NULL, NULL, 194, 181, 0);
INSERT INTO `wms_receipt_order_detail` VALUES (2528, 586, 182, 1.00, 1.00, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 196, 183, 3);
INSERT INTO `wms_receipt_order_detail` VALUES (2529, 586, 181, 1.00, 1.00, 124, NULL, 0, NULL, NULL, NULL, NULL, NULL, 198, 185, 0);
INSERT INTO `wms_receipt_order_detail` VALUES (2533, 588, 182, 1.00, 1.00, 118, NULL, 0, NULL, NULL, NULL, NULL, NULL, 194, 181, 0);
INSERT INTO `wms_receipt_order_detail` VALUES (2534, 588, 184, 1.00, 1.00, 118, NULL, 0, NULL, NULL, NULL, NULL, NULL, 194, 181, 0);
INSERT INTO `wms_receipt_order_detail` VALUES (2535, 589, 181, 1.00, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 194, NULL, 0);
INSERT INTO `wms_receipt_order_detail` VALUES (2536, 589, 182, 2.00, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 195, 182, 0);
INSERT INTO `wms_receipt_order_detail` VALUES (2543, 591, 184, 1.00, 1.00, 118, NULL, 0, NULL, NULL, NULL, NULL, NULL, 194, 181, 3);
INSERT INTO `wms_receipt_order_detail` VALUES (2544, 591, 182, 1.00, 1.00, 121, NULL, 0, NULL, NULL, NULL, NULL, NULL, 195, 182, 3);
INSERT INTO `wms_receipt_order_detail` VALUES (2545, 591, 181, 1.00, 1.00, 124, NULL, 0, NULL, NULL, NULL, NULL, NULL, 198, 185, 3);
INSERT INTO `wms_receipt_order_detail` VALUES (2546, 590, 182, 3.00, 1.00, 123, NULL, 0, NULL, NULL, NULL, NULL, NULL, 199, 186, 0);
INSERT INTO `wms_receipt_order_detail` VALUES (2547, 590, 181, 3.00, 1.00, 124, NULL, 0, NULL, NULL, NULL, NULL, NULL, 198, 185, 0);
INSERT INTO `wms_receipt_order_detail` VALUES (2548, 590, 180, 100.00, 1.00, 118, NULL, 0, NULL, NULL, NULL, NULL, NULL, 194, 181, 0);
INSERT INTO `wms_receipt_order_detail` VALUES (2552, 592, 185, 200.00, 1.00, 127, NULL, 0, NULL, NULL, NULL, NULL, NULL, 215, 189, 3);
INSERT INTO `wms_receipt_order_detail` VALUES (2553, 593, 185, 1.00, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `wms_receipt_order_detail` VALUES (2554, 593, 184, 1.00, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `wms_receipt_order_detail` VALUES (2560, 595, 185, 1.00, 1.00, 118, NULL, 0, NULL, NULL, NULL, NULL, NULL, 194, 181, 3);
INSERT INTO `wms_receipt_order_detail` VALUES (2561, 595, 183, 1.00, 1.00, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 196, 183, 3);
INSERT INTO `wms_receipt_order_detail` VALUES (2562, 596, 185, 1000.00, NULL, 118, NULL, 0, NULL, NULL, NULL, NULL, NULL, 194, 181, 0);
INSERT INTO `wms_receipt_order_detail` VALUES (2564, 597, 186, 12.00, 14.00, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 196, 183, 3);
INSERT INTO `wms_receipt_order_detail` VALUES (2591, 599, 186, 3.00, 3.00, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 196, 183, 4);
INSERT INTO `wms_receipt_order_detail` VALUES (2592, 599, 183, 4.00, 1.00, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3);
INSERT INTO `wms_receipt_order_detail` VALUES (2593, 599, 182, 5.00, 1.00, 118, NULL, 0, NULL, NULL, NULL, NULL, NULL, 194, 181, 3);
INSERT INTO `wms_receipt_order_detail` VALUES (2594, 598, 186, 4.00, 4.00, 118, NULL, 0, NULL, NULL, NULL, NULL, NULL, 194, 181, 3);
INSERT INTO `wms_receipt_order_detail` VALUES (2595, 598, 183, 3.00, 3.00, 119, NULL, 0, NULL, NULL, NULL, NULL, NULL, 195, 182, 3);
INSERT INTO `wms_receipt_order_detail` VALUES (2602, 601, 187, 1.00, 1.00, 117, NULL, 0, NULL, NULL, NULL, NULL, NULL, 194, 181, 3);
INSERT INTO `wms_receipt_order_detail` VALUES (2606, 600, 182, 1.00, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 196, 183, 0);
INSERT INTO `wms_receipt_order_detail` VALUES (2610, 603, 188, 1.00, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 198, 185, 0);
INSERT INTO `wms_receipt_order_detail` VALUES (2616, 609, 176, 1.00, 1.00, 116, NULL, 0, NULL, NULL, NULL, NULL, NULL, 192, 178, 0);
INSERT INTO `wms_receipt_order_detail` VALUES (2617, 594, 181, 6.00, 6.00, 118, NULL, 0, NULL, NULL, NULL, NULL, NULL, 194, 181, 3);
INSERT INTO `wms_receipt_order_detail` VALUES (2618, 610, 188, 2.00, NULL, NULL, 222.00, 0, NULL, NULL, NULL, NULL, NULL, 198, 185, 0);
INSERT INTO `wms_receipt_order_detail` VALUES (2621, 611, 188, 1.00, 1.00, 117, NULL, 0, NULL, NULL, NULL, NULL, NULL, 194, 181, 3);
INSERT INTO `wms_receipt_order_detail` VALUES (2622, 612, 188, 1.00, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `wms_receipt_order_detail` VALUES (2623, 602, 188, 2147483647.00, NULL, NULL, 0.00, 0, NULL, NULL, NULL, NULL, NULL, 225, 210, 0);
INSERT INTO `wms_receipt_order_detail` VALUES (2624, 602, 187, 2147483647.00, NULL, NULL, 0.00, 0, NULL, NULL, NULL, NULL, NULL, 225, 210, 0);
INSERT INTO `wms_receipt_order_detail` VALUES (2625, 602, 186, 2147483647.00, NULL, NULL, 0.00, 0, NULL, NULL, NULL, NULL, NULL, 225, 210, 0);
INSERT INTO `wms_receipt_order_detail` VALUES (2626, 617, 109, 2.00, NULL, NULL, 3.00, 0, NULL, NULL, NULL, NULL, NULL, 230, NULL, 0);
INSERT INTO `wms_receipt_order_detail` VALUES (2627, 618, 165, 1.00, NULL, NULL, 2.00, 0, NULL, NULL, NULL, NULL, NULL, 229, 216, 0);
INSERT INTO `wms_receipt_order_detail` VALUES (2628, 619, 130, 1.00, NULL, NULL, 1.00, 0, NULL, NULL, NULL, NULL, NULL, 230, NULL, 0);
INSERT INTO `wms_receipt_order_detail` VALUES (2633, 621, 193, 1.00, 1.00, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 230, NULL, 3);
INSERT INTO `wms_receipt_order_detail` VALUES (2634, 621, 191, 1.00, 1.00, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 229, NULL, 3);
INSERT INTO `wms_receipt_order_detail` VALUES (2635, 621, 190, 1.00, 1.00, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 229, NULL, 3);
INSERT INTO `wms_receipt_order_detail` VALUES (2636, 621, 189, 1.00, 1.00, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 231, NULL, 3);
INSERT INTO `wms_receipt_order_detail` VALUES (2637, 620, 189, 1.00, NULL, NULL, 1.00, 0, NULL, NULL, NULL, NULL, NULL, 231, 217, 0);
INSERT INTO `wms_receipt_order_detail` VALUES (2639, 624, 193, 1.00, NULL, NULL, 10.00, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `wms_receipt_order_detail` VALUES (2641, 625, 193, 10.00, 1.00, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 229, 216, 3);

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
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `del_flag` tinyint(4) NOT NULL DEFAULT 0 COMMENT '删除标识',
  `create_by` bigint(20) NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(3) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` bigint(20) NULL DEFAULT NULL COMMENT '修改人',
  `update_time` datetime(3) NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 273 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '出库单' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wms_shipment_order
-- ----------------------------
INSERT INTO `wms_shipment_order` VALUES (7, 'E-2022-10-20-181904', 11, '2323123123123', 5, NULL, 11, NULL, NULL, NULL, '2swe 2e213213213', 1, 1, '2022-10-20 18:19:48.221', NULL, NULL);
INSERT INTO `wms_shipment_order` VALUES (8, 'E-2022-10-20-183635', 12, '43432c432432432', 4, NULL, 11, NULL, NULL, NULL, 'erewrc erfewrewrewrewr ', 1, 1, '2022-10-20 18:37:06.000', 1, '2022-10-20 18:38:39.825');
INSERT INTO `wms_shipment_order` VALUES (9, 'E-2022-10-20-183853', 13, 'r43534cerfrev235435435', 4, NULL, 13, NULL, NULL, NULL, 'rdter v retertre terter ', 0, 1, '2022-10-20 18:39:20.000', 1, '2022-10-24 18:49:58.052');
INSERT INTO `wms_shipment_order` VALUES (10, 'E-2022-10-24-185155', 12, '4332423432', 4, NULL, 12, NULL, NULL, NULL, '323', 0, 1, '2022-10-24 18:52:18.000', 115, '2022-11-11 15:25:39.550');
INSERT INTO `wms_shipment_order` VALUES (11, 'E-2022-10-28-105943', 12, '23323213213', 5, NULL, 11, NULL, NULL, NULL, 'efwejifsdknskd nfd多方面克里斯丁', 1, 1, '2022-10-28 11:00:05.000', 1, '2022-10-30 14:12:36.494');
INSERT INTO `wms_shipment_order` VALUES (13, 'E-2022-11-08-173551', 11, NULL, NULL, NULL, 11, NULL, NULL, NULL, NULL, 1, 115, '2022-11-08 17:40:30.000', 115, '2022-11-08 17:40:44.723');
INSERT INTO `wms_shipment_order` VALUES (15, 'E-2022-11-09-113648', 11, NULL, 4, NULL, 11, NULL, NULL, NULL, NULL, 1, 115, '2022-11-09 11:37:32.362', NULL, NULL);
INSERT INTO `wms_shipment_order` VALUES (16, 'E-2022-11-09-113735', 13, NULL, 4, NULL, 11, NULL, NULL, NULL, NULL, 1, 115, '2022-11-09 11:38:22.000', 115, '2022-11-13 17:34:05.906');
INSERT INTO `wms_shipment_order` VALUES (17, 'E-2022-11-11-161339', 11, '这是订单号', 10, NULL, 13, NULL, NULL, NULL, '这是备注，要求100字之内', 0, 115, '2022-11-11 16:14:19.000', 115, '2022-11-11 16:47:16.916');
INSERT INTO `wms_shipment_order` VALUES (18, 'E-2022-11-11-172205', 11, 'shuiguochukula', 10, NULL, 13, NULL, NULL, NULL, 'shuiguochukula', 0, 115, '2022-11-11 17:22:56.000', 115, '2022-11-11 17:25:31.382');
INSERT INTO `wms_shipment_order` VALUES (19, 'E-2022-11-13-174517', 13, '1', NULL, NULL, 11, NULL, NULL, NULL, '1', 1, 115, '2022-11-13 17:45:29.000', 115, '2022-12-03 14:20:11.051');
INSERT INTO `wms_shipment_order` VALUES (20, 'E-2022-11-15-164556', 11, '123', 4, NULL, 11, NULL, NULL, NULL, '1325', 1, 115, '2022-11-15 16:46:31.371', NULL, NULL);
INSERT INTO `wms_shipment_order` VALUES (23, 'E-2022-11-16-143216', 11, '1564', 4, NULL, 11, NULL, NULL, NULL, NULL, 1, 115, '2022-11-16 14:32:26.751', NULL, NULL);
INSERT INTO `wms_shipment_order` VALUES (24, 'E-2022-11-16-143239', 11, '123227', 4, NULL, 11, NULL, NULL, NULL, NULL, 1, 115, '2022-11-16 14:32:54.141', NULL, NULL);
INSERT INTO `wms_shipment_order` VALUES (25, 'E-2022-11-16-163856', 13, 'rwer', 4, NULL, 11, NULL, NULL, NULL, NULL, 1, 115, '2022-11-16 16:47:04.229', NULL, NULL);
INSERT INTO `wms_shipment_order` VALUES (28, 'E-2022-11-20-085609', 11, '7878787', 10, NULL, 11, NULL, NULL, NULL, NULL, 1, 115, '2022-11-20 08:56:39.638', NULL, NULL);
INSERT INTO `wms_shipment_order` VALUES (29, 'E-2022-11-20-211947', 11, '18556959326', 4, NULL, 11, NULL, NULL, NULL, NULL, 1, 115, '2022-11-20 21:20:40.353', NULL, NULL);
INSERT INTO `wms_shipment_order` VALUES (33, 'E-2022-11-22-132003', 11, NULL, NULL, NULL, 11, NULL, NULL, NULL, NULL, 1, 1, '2022-11-22 13:20:11.637', NULL, NULL);
INSERT INTO `wms_shipment_order` VALUES (34, 'E-2022-11-22-155704', 1, 'wqwqwqw', 10, NULL, 11, NULL, NULL, NULL, 'ewrwrwrw', 1, 115, '2022-11-22 15:57:27.476', NULL, NULL);
INSERT INTO `wms_shipment_order` VALUES (35, 'E-2022-11-23-135105', 11, NULL, 4, NULL, 13, NULL, NULL, NULL, NULL, 0, 115, '2022-11-23 13:51:35.000', 115, '2022-11-23 13:51:53.355');
INSERT INTO `wms_shipment_order` VALUES (36, 'E-2022-11-24-144309', 13, '77', 4, NULL, 11, NULL, NULL, NULL, '6', 1, 115, '2022-11-24 14:43:37.000', 1, '2022-12-01 11:10:09.153');
INSERT INTO `wms_shipment_order` VALUES (37, 'E-2022-11-26-223132', 11, '123123123132', 4, NULL, 11, NULL, NULL, NULL, NULL, 1, 115, '2022-11-26 22:32:34.813', NULL, NULL);
INSERT INTO `wms_shipment_order` VALUES (38, 'E-2022-11-28-000740', 11, '122255', 4, NULL, 11, NULL, NULL, NULL, NULL, 1, 115, '2022-11-28 00:08:01.209', NULL, NULL);
INSERT INTO `wms_shipment_order` VALUES (39, 'E-2022-11-28-000819', 11, '10002000', 4, NULL, 11, NULL, NULL, NULL, NULL, 1, 115, '2022-11-28 00:09:06.117', NULL, NULL);
INSERT INTO `wms_shipment_order` VALUES (40, 'E-2022-11-28-000920', 11, '1111111', 4, NULL, 11, NULL, NULL, NULL, NULL, 1, 115, '2022-11-28 00:09:38.857', NULL, NULL);
INSERT INTO `wms_shipment_order` VALUES (41, 'E-2022-11-28-093423', 11, 'AJFAOFJ', 10, NULL, 11, NULL, NULL, NULL, '无备注', 1, 115, '2022-11-28 09:34:37.221', NULL, NULL);
INSERT INTO `wms_shipment_order` VALUES (42, 'E-2022-11-29-115952', 1, NULL, NULL, NULL, 11, NULL, NULL, NULL, NULL, 1, 115, '2022-11-29 12:00:18.180', NULL, NULL);
INSERT INTO `wms_shipment_order` VALUES (43, 'E-2022-11-30-144116', 12, NULL, 4, NULL, 11, NULL, NULL, NULL, NULL, 1, 115, '2022-11-30 14:41:27.067', NULL, NULL);
INSERT INTO `wms_shipment_order` VALUES (44, 'E-2022-12-01-111428', 11, '3432322-32434', 4, NULL, 13, NULL, NULL, NULL, NULL, 0, 1, '2022-12-01 11:14:49.000', 1, '2022-12-01 11:16:14.590');
INSERT INTO `wms_shipment_order` VALUES (45, 'E-2022-12-03-084715', 11, '123123', 4, NULL, 13, NULL, NULL, NULL, NULL, 0, 115, '2022-12-03 08:47:31.000', 115, '2022-12-03 08:47:53.608');
INSERT INTO `wms_shipment_order` VALUES (46, 'E-2022-12-03-160353', 1, NULL, NULL, NULL, 14, NULL, NULL, NULL, NULL, 0, 115, '2022-12-03 16:04:10.000', 115, '2022-12-05 14:09:45.028');
INSERT INTO `wms_shipment_order` VALUES (47, 'E-2022-12-05-140855', 11, NULL, 10, NULL, 11, NULL, NULL, NULL, NULL, 1, 115, '2022-12-05 14:09:28.713', NULL, NULL);
INSERT INTO `wms_shipment_order` VALUES (48, 'E-2022-12-05-174149', 11, '123', NULL, NULL, 13, NULL, NULL, NULL, NULL, 0, 115, '2022-12-05 17:42:25.000', 115, '2022-12-08 15:14:08.552');
INSERT INTO `wms_shipment_order` VALUES (49, 'E-2022-12-07-091725', 11, NULL, NULL, NULL, 13, NULL, NULL, NULL, NULL, 0, 115, '2022-12-07 09:17:51.000', 115, '2022-12-07 09:18:25.605');
INSERT INTO `wms_shipment_order` VALUES (50, 'E-2022-12-08-181356', 11, '2', 11, NULL, 11, NULL, NULL, NULL, '12', 1, 115, '2022-12-08 18:14:12.884', NULL, NULL);
INSERT INTO `wms_shipment_order` VALUES (51, 'E-2022-12-10-154558', 11, NULL, NULL, NULL, 11, NULL, NULL, NULL, NULL, 1, 115, '2022-12-10 15:45:41.000', 115, '2022-12-10 15:46:01.069');
INSERT INTO `wms_shipment_order` VALUES (52, 'E-2022-12-10-170235', 11, '1111222', NULL, NULL, 13, NULL, NULL, NULL, NULL, 0, 115, '2022-12-10 17:02:49.000', 115, '2022-12-10 17:04:23.493');
INSERT INTO `wms_shipment_order` VALUES (53, 'E-2022-12-12-131903', 11, NULL, NULL, NULL, 13, NULL, NULL, NULL, NULL, 0, 115, '2022-12-12 13:19:19.000', 115, '2022-12-12 13:19:41.601');
INSERT INTO `wms_shipment_order` VALUES (54, 'E-2022-12-13-153836', 11, NULL, NULL, NULL, 11, NULL, NULL, NULL, NULL, 1, 115, '2022-12-13 15:38:50.680', NULL, NULL);
INSERT INTO `wms_shipment_order` VALUES (55, 'E-2022-12-20-171438', 11, NULL, NULL, NULL, 13, NULL, NULL, NULL, NULL, 0, 115, '2022-12-20 17:14:53.000', 115, '2022-12-22 09:15:28.743');
INSERT INTO `wms_shipment_order` VALUES (56, 'E-2022-12-22-094210', 11, NULL, NULL, NULL, 11, NULL, NULL, NULL, NULL, 1, 115, '2022-12-22 09:42:30.246', NULL, NULL);
INSERT INTO `wms_shipment_order` VALUES (57, 'E-2022-12-22-094305', 11, NULL, NULL, NULL, 13, NULL, NULL, NULL, NULL, 0, 115, '2022-12-22 09:43:22.000', 115, '2022-12-22 09:43:54.767');
INSERT INTO `wms_shipment_order` VALUES (58, 'E-2022-12-28-095021', 11, NULL, NULL, NULL, 11, NULL, NULL, NULL, NULL, 0, 115, '2022-12-28 09:51:05.527', NULL, NULL);
INSERT INTO `wms_shipment_order` VALUES (59, 'E-2022-12-28-113955', 11, '0001', 12, NULL, 13, NULL, NULL, NULL, NULL, 0, 115, '2022-12-28 11:40:21.000', 115, '2022-12-28 11:41:57.711');
INSERT INTO `wms_shipment_order` VALUES (60, 'E-2022-12-30-164845', 11, 'ORD', 12, NULL, 13, NULL, NULL, NULL, NULL, 0, 115, '2022-12-30 16:49:11.000', 115, '2023-01-03 10:38:07.732');
INSERT INTO `wms_shipment_order` VALUES (61, 'E-2023-01-05-134912', 11, '11', 12, NULL, 12, NULL, NULL, NULL, '11', 0, 115, '2023-01-05 13:50:09.000', 115, '2023-01-05 16:08:25.982');
INSERT INTO `wms_shipment_order` VALUES (62, 'E-2023-01-05-164431', 11, NULL, 13, NULL, 11, NULL, NULL, NULL, NULL, 0, 115, '2023-01-05 16:44:58.000', 115, '2023-01-05 16:45:06.029');
INSERT INTO `wms_shipment_order` VALUES (63, 'E-2023-01-06-141921', 11, '123', NULL, NULL, 13, NULL, NULL, NULL, '1233333333333', 0, 115, '2023-01-06 14:19:47.000', 115, '2023-01-06 14:19:56.131');
INSERT INTO `wms_shipment_order` VALUES (64, 'E-2023-01-06-165149', 11, '123', 12, NULL, 11, NULL, NULL, NULL, NULL, 0, 115, '2023-01-06 16:52:35.000', 115, '2023-01-06 16:53:59.164');
INSERT INTO `wms_shipment_order` VALUES (65, 'E-2023-01-07-134631', 13, NULL, 14, NULL, 11, NULL, NULL, NULL, NULL, 0, 115, '2023-01-07 13:47:00.406', NULL, NULL);
INSERT INTO `wms_shipment_order` VALUES (66, 'E-2023-01-07-181012', 11, NULL, 14, NULL, 11, NULL, NULL, NULL, NULL, 0, 115, '2023-01-07 18:10:46.858', NULL, NULL);
INSERT INTO `wms_shipment_order` VALUES (67, 'E-2023-01-09-024206', 11, NULL, NULL, NULL, 11, NULL, NULL, NULL, NULL, 0, 115, '2023-01-09 02:42:39.000', 115, '2023-01-09 15:31:49.897');
INSERT INTO `wms_shipment_order` VALUES (68, 'E-2023-01-09-024905', 11, NULL, 14, NULL, 13, NULL, NULL, NULL, NULL, 0, 115, '2023-01-09 02:49:24.000', 115, '2023-01-09 02:49:33.218');
INSERT INTO `wms_shipment_order` VALUES (69, 'E-2023-01-11-204913', 11, NULL, 15, NULL, 11, NULL, NULL, NULL, NULL, 0, 115, '2023-01-11 20:49:23.000', 115, '2023-01-12 10:18:49.617');
INSERT INTO `wms_shipment_order` VALUES (70, 'E-2023-01-12-171157', 13, NULL, NULL, NULL, 11, NULL, NULL, NULL, NULL, 1, 115, '2023-01-12 17:12:58.677', NULL, NULL);
INSERT INTO `wms_shipment_order` VALUES (71, 'E-2023-01-13-125240', 11, NULL, NULL, NULL, 14, NULL, NULL, NULL, NULL, 0, 115, '2023-01-13 12:52:58.000', 115, '2023-01-13 12:57:50.619');
INSERT INTO `wms_shipment_order` VALUES (72, 'E-2023-01-13-125402', 12, NULL, 15, NULL, 14, NULL, NULL, NULL, NULL, 0, 115, '2023-01-13 12:54:12.000', 115, '2023-01-13 12:57:44.333');
INSERT INTO `wms_shipment_order` VALUES (73, 'E-2023-01-13-125543', 11, NULL, 14, NULL, 11, NULL, NULL, NULL, NULL, 0, 115, '2023-01-13 12:55:57.770', NULL, NULL);
INSERT INTO `wms_shipment_order` VALUES (74, 'E-2023-01-13-125809', 11, NULL, 14, NULL, 11, NULL, NULL, NULL, NULL, 0, 115, '2023-01-13 12:58:15.000', 115, '2023-01-30 19:35:48.548');
INSERT INTO `wms_shipment_order` VALUES (75, 'E-2023-01-13-192702', 11, '4324323', 15, NULL, 13, NULL, NULL, NULL, NULL, 0, 115, '2023-01-13 19:27:16.000', 115, '2023-01-13 19:27:25.776');
INSERT INTO `wms_shipment_order` VALUES (76, 'E-2023-01-16-110112', 11, '3333', 14, NULL, 11, NULL, NULL, NULL, NULL, 0, 115, '2023-01-16 11:01:44.000', 115, '2023-01-18 15:14:29.411');
INSERT INTO `wms_shipment_order` VALUES (77, 'E-2023-01-18-151507', 11, NULL, 14, NULL, 11, NULL, NULL, NULL, NULL, 0, 115, '2023-01-18 15:15:24.000', 115, '2023-01-18 15:17:39.860');
INSERT INTO `wms_shipment_order` VALUES (78, 'E-2023-01-18-152050', 11, NULL, 14, NULL, 11, NULL, NULL, NULL, NULL, 0, 115, '2023-01-18 15:21:19.146', NULL, NULL);
INSERT INTO `wms_shipment_order` VALUES (79, 'E-2023-01-25-125442', 11, NULL, NULL, NULL, 11, NULL, NULL, NULL, NULL, 1, 115, '2023-01-25 13:01:48.211', NULL, NULL);
INSERT INTO `wms_shipment_order` VALUES (80, 'E-2023-01-26-204833', 11, 'BJ0011002', 14, NULL, 11, NULL, NULL, NULL, NULL, 1, 115, '2023-01-26 20:49:08.000', 115, '2023-01-26 20:53:19.278');
INSERT INTO `wms_shipment_order` VALUES (81, 'E-2023-01-28-124116', 11, NULL, 16, NULL, 11, NULL, NULL, NULL, NULL, 1, 115, '2023-01-28 12:41:43.291', NULL, NULL);
INSERT INTO `wms_shipment_order` VALUES (82, 'E-2023-01-28-162844', 11, NULL, 14, NULL, 11, NULL, NULL, NULL, NULL, 1, 115, '2023-01-28 16:29:02.826', NULL, NULL);
INSERT INTO `wms_shipment_order` VALUES (83, 'E-2023-01-29-202534', 11, NULL, NULL, NULL, 11, NULL, NULL, NULL, NULL, 1, 115, '2023-01-29 20:26:02.187', NULL, NULL);
INSERT INTO `wms_shipment_order` VALUES (84, 'E-2023-01-30-094640', 11, NULL, NULL, NULL, 11, NULL, NULL, NULL, NULL, 1, 115, '2023-01-30 09:46:30.570', NULL, NULL);
INSERT INTO `wms_shipment_order` VALUES (85, 'E-2023-01-30-103918', 11, NULL, NULL, NULL, 11, NULL, NULL, NULL, NULL, 1, 115, '2023-01-30 10:40:14.099', NULL, NULL);
INSERT INTO `wms_shipment_order` VALUES (86, 'E-2023-01-31-163954', 11, '001', NULL, NULL, 13, NULL, NULL, NULL, NULL, 0, 115, '2023-01-31 16:39:39.000', 115, '2023-01-31 16:39:58.344');
INSERT INTO `wms_shipment_order` VALUES (87, 'E-2023-01-31-230349', 13, NULL, NULL, NULL, 11, NULL, NULL, NULL, NULL, 1, 115, '2023-01-31 23:04:06.658', NULL, NULL);
INSERT INTO `wms_shipment_order` VALUES (88, 'E-2023-02-01-220859', 11, '9696516151', 18, NULL, 13, NULL, NULL, NULL, NULL, 0, 115, '2023-02-01 22:09:25.000', 115, '2023-02-01 22:10:30.398');
INSERT INTO `wms_shipment_order` VALUES (89, 'E-2023-02-02-150726', 11, '11', 18, NULL, 11, NULL, NULL, NULL, '11', 0, 115, '2023-02-02 15:07:49.000', 115, '2023-02-02 15:07:55.792');
INSERT INTO `wms_shipment_order` VALUES (90, 'E-2023-02-02-150806', 11, '1', 18, NULL, 13, NULL, NULL, NULL, '1', 0, 115, '2023-02-02 15:08:17.000', 115, '2023-02-02 15:08:54.724');
INSERT INTO `wms_shipment_order` VALUES (91, 'E-2023-02-02-151220', 11, 'aabb', 18, NULL, 13, NULL, NULL, NULL, NULL, 0, 115, '2023-02-02 15:12:34.000', 115, '2023-02-02 15:12:45.138');
INSERT INTO `wms_shipment_order` VALUES (92, 'E-2023-02-02-151302', 11, '1', 18, NULL, 11, NULL, NULL, NULL, '1', 0, 115, '2023-02-02 15:13:18.965', NULL, NULL);
INSERT INTO `wms_shipment_order` VALUES (93, 'E-2023-02-03-153718', 11, NULL, NULL, NULL, 11, NULL, NULL, NULL, NULL, 0, 115, '2023-02-03 15:37:51.313', NULL, NULL);
INSERT INTO `wms_shipment_order` VALUES (94, 'E-2023-02-04-003150', 11, '444', 18, NULL, 11, NULL, NULL, NULL, NULL, 0, 115, '2023-02-04 00:32:11.000', 115, '2023-02-04 00:32:25.973');
INSERT INTO `wms_shipment_order` VALUES (95, 'E-2023-02-04-025840', 11, '123213', 18, NULL, 11, NULL, NULL, NULL, '123132', 0, 115, '2023-02-04 02:58:49.485', NULL, NULL);
INSERT INTO `wms_shipment_order` VALUES (96, 'E-2023-02-04-025900', 11, 'R-2023-02-04-025804', 18, NULL, 11, NULL, NULL, NULL, NULL, 0, 115, '2023-02-04 02:59:04.844', NULL, NULL);
INSERT INTO `wms_shipment_order` VALUES (97, 'E-2023-02-04-163735', 11, '1111111111', NULL, NULL, 13, NULL, NULL, NULL, NULL, 0, 115, '2023-02-04 16:37:58.000', 115, '2023-02-04 16:38:06.213');
INSERT INTO `wms_shipment_order` VALUES (98, 'E-2023-02-06-111816', 13, NULL, NULL, NULL, 11, NULL, NULL, NULL, NULL, 0, 115, '2023-02-06 11:19:15.227', NULL, NULL);
INSERT INTO `wms_shipment_order` VALUES (99, 'E-2023-02-06-115000', 11, '', NULL, NULL, 13, NULL, NULL, NULL, NULL, 0, 115, '2023-02-06 11:50:22.000', 115, '2023-02-06 11:51:14.608');
INSERT INTO `wms_shipment_order` VALUES (100, 'E-2023-02-06-151416', 11, NULL, 18, NULL, 13, NULL, NULL, NULL, NULL, 0, 115, '2023-02-06 15:15:00.000', 115, '2023-02-06 15:15:14.159');
INSERT INTO `wms_shipment_order` VALUES (101, 'E-2023-02-06-152208', 11, NULL, 20, NULL, 13, NULL, NULL, NULL, NULL, 0, 115, '2023-02-06 15:22:26.000', 115, '2023-02-06 15:22:34.757');
INSERT INTO `wms_shipment_order` VALUES (102, 'E-2023-02-07-112236', 11, NULL, NULL, NULL, 11, NULL, NULL, NULL, NULL, 0, 115, '2023-02-07 11:22:53.795', NULL, NULL);
INSERT INTO `wms_shipment_order` VALUES (103, 'E-2023-02-07-140848', 11, NULL, NULL, NULL, 11, NULL, NULL, NULL, NULL, 0, 115, '2023-02-07 14:09:13.330', NULL, NULL);
INSERT INTO `wms_shipment_order` VALUES (104, 'E-2023-02-07-184854', 11, NULL, 20, NULL, 13, NULL, NULL, NULL, NULL, 0, 115, '2023-02-07 18:49:14.000', 115, '2023-02-07 18:50:16.091');
INSERT INTO `wms_shipment_order` VALUES (105, 'E-2023-02-08-104126', 11, NULL, 18, NULL, 11, NULL, NULL, NULL, NULL, 0, 115, '2023-02-08 10:41:57.000', 115, '2023-02-09 16:15:57.225');
INSERT INTO `wms_shipment_order` VALUES (106, 'E-2023-02-08-152332', 11, 'ry5454545454545454545454545454545454545454', 20, NULL, 11, NULL, NULL, NULL, 'thyrrrrrrrrrrrrrrrrrrrrr', 1, 115, '2023-02-08 15:23:51.595', NULL, NULL);
INSERT INTO `wms_shipment_order` VALUES (107, 'E-2023-02-09-165219', 11, NULL, 18, NULL, 11, NULL, NULL, NULL, NULL, 0, 115, '2023-02-09 16:52:29.945', NULL, NULL);
INSERT INTO `wms_shipment_order` VALUES (108, 'E-2023-02-09-165251', 11, NULL, NULL, NULL, 11, NULL, NULL, NULL, NULL, 0, 115, '2023-02-09 16:53:06.758', NULL, NULL);
INSERT INTO `wms_shipment_order` VALUES (109, 'E-2023-02-09-170516', 11, NULL, NULL, NULL, 11, NULL, NULL, NULL, NULL, 0, 115, '2023-02-09 17:15:44.435', NULL, NULL);
INSERT INTO `wms_shipment_order` VALUES (110, 'E-2023-02-09-202054', 11, NULL, NULL, NULL, 11, NULL, NULL, NULL, NULL, 0, 115, '2023-02-09 20:21:30.248', NULL, NULL);
INSERT INTO `wms_shipment_order` VALUES (111, 'E-2023-02-09-231809', 11, NULL, NULL, NULL, 11, NULL, NULL, NULL, NULL, 0, 115, '2023-02-09 23:18:20.962', NULL, NULL);
INSERT INTO `wms_shipment_order` VALUES (112, 'E-2023-02-10-130402', 11, '1111', 18, NULL, 11, NULL, NULL, NULL, NULL, 0, 115, '2023-02-10 13:04:27.000', 115, '2023-02-10 13:04:37.845');
INSERT INTO `wms_shipment_order` VALUES (113, 'E-2023-02-10-155027', 11, NULL, 18, NULL, 11, NULL, NULL, NULL, NULL, 0, 115, '2023-02-10 15:51:10.195', NULL, NULL);
INSERT INTO `wms_shipment_order` VALUES (114, 'E-2023-02-10-155705', 13, NULL, 18, NULL, 13, NULL, NULL, NULL, '现在使用项目为***', 0, 115, '2023-02-10 15:57:41.000', 115, '2023-02-10 15:57:49.172');
INSERT INTO `wms_shipment_order` VALUES (115, 'E-2023-02-11-111208', 11, '1111111111111111111111111', 18, NULL, 11, NULL, NULL, NULL, '11111111111111111111111111111', 0, 115, '2023-02-11 11:12:40.856', NULL, NULL);
INSERT INTO `wms_shipment_order` VALUES (116, 'E-2023-02-13-073615', 11, NULL, 18, NULL, 11, NULL, NULL, NULL, NULL, 0, 115, '2023-02-13 07:36:31.000', 115, '2023-02-15 13:52:57.820');
INSERT INTO `wms_shipment_order` VALUES (117, 'E-2023-02-13-162139', 11, '123165', 19, NULL, 13, NULL, NULL, NULL, '3123', 0, 115, '2023-02-13 16:22:07.000', 115, '2023-02-15 12:10:34.010');
INSERT INTO `wms_shipment_order` VALUES (118, 'E-2023-02-13-171839', 11, '564', 18, NULL, 14, NULL, NULL, NULL, '243', 0, 115, '2023-02-13 17:19:21.000', 115, '2023-02-13 17:21:11.869');
INSERT INTO `wms_shipment_order` VALUES (119, 'E-2023-02-13-172131', 11, NULL, NULL, NULL, 13, NULL, NULL, NULL, NULL, 0, 115, '2023-02-13 17:21:42.000', 115, '2023-02-13 17:21:54.597');
INSERT INTO `wms_shipment_order` VALUES (120, 'E-2023-02-17-131600', 11, NULL, 22, NULL, 12, NULL, NULL, NULL, NULL, 0, 115, '2023-02-17 13:16:42.000', 115, '2023-02-17 13:22:13.053');
INSERT INTO `wms_shipment_order` VALUES (121, 'E-2023-02-17-163809', 11, NULL, 18, NULL, 11, NULL, NULL, NULL, NULL, 1, 115, '2023-02-17 16:38:28.000', 115, '2023-02-17 16:39:13.553');
INSERT INTO `wms_shipment_order` VALUES (122, 'E-2023-02-18-000621', 11, '9988', 18, NULL, 14, NULL, NULL, NULL, NULL, 0, 115, '2023-02-18 00:06:40.000', 115, '2023-02-18 00:07:12.162');
INSERT INTO `wms_shipment_order` VALUES (123, 'E-2023-02-19-022939', 11, NULL, NULL, NULL, 11, NULL, NULL, NULL, NULL, 1, 115, '2023-02-19 02:30:26.864', NULL, NULL);
INSERT INTO `wms_shipment_order` VALUES (124, 'E-2023-02-20-195445', 11, NULL, 18, NULL, 11, NULL, NULL, NULL, NULL, 1, 115, '2023-02-20 19:55:04.000', 115, '2023-02-21 11:23:05.157');
INSERT INTO `wms_shipment_order` VALUES (125, 'E-2023-02-21-120151', 11, '111', 21, NULL, 13, NULL, NULL, NULL, NULL, 0, 115, '2023-02-21 12:02:21.000', 115, '2023-02-21 14:19:36.521');
INSERT INTO `wms_shipment_order` VALUES (126, 'E-2023-02-22-100628', 11, '123', 18, NULL, 11, NULL, NULL, NULL, '12312313', 1, 115, '2023-02-22 10:08:43.000', 115, '2023-02-22 10:10:17.900');
INSERT INTO `wms_shipment_order` VALUES (127, 'E-2023-02-22-135939', 11, NULL, NULL, NULL, 13, NULL, NULL, NULL, NULL, 0, 115, '2023-02-22 13:59:58.000', 115, '2023-02-22 14:00:20.349');
INSERT INTO `wms_shipment_order` VALUES (128, 'E-2023-02-22-143916', 11, '123456', 21, NULL, 11, NULL, NULL, NULL, NULL, 1, 115, '2023-02-22 14:40:27.000', 115, '2023-02-22 14:41:47.389');
INSERT INTO `wms_shipment_order` VALUES (129, 'E-2023-02-22-164141', 11, NULL, 18, NULL, 13, NULL, NULL, NULL, NULL, 0, 115, '2023-02-22 16:42:09.000', 115, '2023-02-23 15:33:40.881');
INSERT INTO `wms_shipment_order` VALUES (130, 'E-2023-02-22-172117', 11, 'cx0000', 22, NULL, 13, NULL, NULL, NULL, NULL, 0, 115, '2023-02-22 17:21:46.000', 115, '2023-02-22 17:22:06.445');
INSERT INTO `wms_shipment_order` VALUES (131, 'E-2023-02-23-103118', 11, NULL, 18, NULL, 11, NULL, NULL, NULL, NULL, 1, 115, '2023-02-23 10:31:50.811', NULL, NULL);
INSERT INTO `wms_shipment_order` VALUES (132, 'E-2023-02-23-120109', 11, NULL, 18, NULL, 13, NULL, NULL, NULL, NULL, 0, 115, '2023-02-23 12:01:23.000', 115, '2023-02-23 15:33:25.257');
INSERT INTO `wms_shipment_order` VALUES (133, 'E-2023-02-23-145819', 13, '111', 20, NULL, 13, NULL, NULL, NULL, '111', 0, 115, '2023-02-23 14:58:48.000', 115, '2023-02-23 14:59:24.935');
INSERT INTO `wms_shipment_order` VALUES (134, 'E-2023-02-23-221758', 13, NULL, NULL, NULL, 11, NULL, NULL, NULL, NULL, 1, 115, '2023-02-23 22:18:26.000', 115, '2023-02-23 22:19:36.406');
INSERT INTO `wms_shipment_order` VALUES (135, 'E-2023-02-24-145805', 11, NULL, 19, NULL, 11, NULL, NULL, NULL, NULL, 1, 115, '2023-02-24 14:58:35.876', NULL, NULL);
INSERT INTO `wms_shipment_order` VALUES (136, 'E-2023-02-24-150822', 11, NULL, 18, NULL, 11, NULL, NULL, NULL, NULL, 1, 115, '2023-02-24 15:08:57.000', 115, '2023-02-24 15:09:23.180');
INSERT INTO `wms_shipment_order` VALUES (137, 'E-2023-02-24-152455', 11, 'df', 18, NULL, 11, NULL, NULL, NULL, 'fdfd', 1, 115, '2023-02-24 15:25:15.000', 115, '2023-02-24 15:25:35.490');
INSERT INTO `wms_shipment_order` VALUES (138, 'E-2023-02-24-163748', 11, '000003', 18, NULL, 13, NULL, NULL, NULL, NULL, 0, 115, '2023-02-24 16:38:07.000', 115, '2023-02-24 16:38:24.397');
INSERT INTO `wms_shipment_order` VALUES (139, 'E-2023-02-25-092323', 11, NULL, 18, NULL, 11, NULL, NULL, NULL, NULL, 1, 115, '2023-02-25 09:23:43.571', NULL, NULL);
INSERT INTO `wms_shipment_order` VALUES (140, 'E-2023-02-25-150912', 11, '54512544645', 20, NULL, 11, NULL, NULL, NULL, NULL, 1, 115, '2023-02-25 15:09:50.739', NULL, NULL);
INSERT INTO `wms_shipment_order` VALUES (141, 'E-2023-02-26-134133', 11, NULL, NULL, NULL, 11, NULL, NULL, NULL, '出库桃花酿200', 1, 115, '2023-02-26 13:41:55.000', 115, '2023-02-26 13:43:57.316');
INSERT INTO `wms_shipment_order` VALUES (142, 'E-2023-02-27-103509', 11, NULL, NULL, NULL, 13, NULL, NULL, NULL, NULL, 0, 115, '2023-02-27 10:34:24.000', 115, '2023-02-27 10:36:27.692');
INSERT INTO `wms_shipment_order` VALUES (143, 'E-2023-02-27-122704', 11, '121313', 23, NULL, 13, NULL, NULL, NULL, NULL, 0, 115, '2023-02-27 12:27:39.000', 115, '2023-02-27 12:34:17.365');
INSERT INTO `wms_shipment_order` VALUES (144, 'E-2023-02-28-135812', 13, NULL, NULL, NULL, 11, NULL, NULL, NULL, NULL, 1, 115, '2023-02-28 13:58:59.145', NULL, NULL);
INSERT INTO `wms_shipment_order` VALUES (145, 'E-2023-03-01-103410', 11, NULL, 23, NULL, 11, NULL, NULL, NULL, NULL, 0, 115, '2023-03-01 10:34:39.456', NULL, NULL);
INSERT INTO `wms_shipment_order` VALUES (146, 'E-2023-03-01-132602', 11, '111', 23, NULL, 11, NULL, NULL, NULL, '1111', 0, 115, '2023-03-01 13:26:13.000', 115, '2023-03-01 13:26:30.980');
INSERT INTO `wms_shipment_order` VALUES (147, 'E-2023-03-01-133937', 11, NULL, NULL, NULL, 11, NULL, NULL, NULL, NULL, 0, 115, '2023-03-01 13:39:50.624', NULL, NULL);
INSERT INTO `wms_shipment_order` VALUES (148, 'E-2023-03-01-160909', 13, NULL, 23, NULL, 11, NULL, NULL, NULL, NULL, 0, 115, '2023-03-01 16:09:27.971', NULL, NULL);
INSERT INTO `wms_shipment_order` VALUES (149, 'E-2023-03-01-180700', 11, 'QD221823E000124349', 24, NULL, 11, NULL, NULL, NULL, 'EI23020013', 0, 115, '2023-03-01 18:07:28.000', 115, '2023-03-02 21:55:09.157');
INSERT INTO `wms_shipment_order` VALUES (150, 'E-2023-03-01-193258', 11, NULL, NULL, NULL, 13, NULL, NULL, NULL, NULL, 0, 115, '2023-03-01 19:33:10.000', 115, '2023-03-02 09:26:39.336');
INSERT INTO `wms_shipment_order` VALUES (151, 'E-2023-03-02-143710', 11, '1112323', 25, NULL, 11, NULL, NULL, NULL, '地方', 0, 115, '2023-03-02 14:37:35.000', 115, '2023-03-02 17:31:11.649');
INSERT INTO `wms_shipment_order` VALUES (152, 'E-2023-03-02-214302', 11, NULL, 23, NULL, 11, NULL, NULL, NULL, 'test', 0, 115, '2023-03-02 21:44:30.000', 115, '2023-03-02 21:55:59.307');
INSERT INTO `wms_shipment_order` VALUES (153, 'E-2023-03-03-083110', 11, '1212121', 24, NULL, 11, NULL, NULL, NULL, NULL, 0, 115, '2023-03-03 08:31:48.869', NULL, NULL);
INSERT INTO `wms_shipment_order` VALUES (154, 'E-2023-03-03-084249', 11, '123', 24, NULL, 13, NULL, NULL, NULL, '123', 0, 115, '2023-03-03 08:43:07.000', 115, '2023-03-03 08:46:33.908');
INSERT INTO `wms_shipment_order` VALUES (155, 'E-2023-03-03-084838', 11, 'dddddd', 23, NULL, 13, NULL, NULL, NULL, 'ddddd', 0, 115, '2023-03-03 08:49:50.000', 115, '2023-03-03 08:50:25.534');
INSERT INTO `wms_shipment_order` VALUES (156, 'E-2023-03-03-085105', 11, 'ddd', 23, NULL, 13, NULL, NULL, NULL, 'ddd', 0, 115, '2023-03-03 08:51:23.000', 115, '2023-03-03 08:51:42.569');
INSERT INTO `wms_shipment_order` VALUES (157, 'E-2023-03-03-220927', 11, NULL, NULL, NULL, 13, NULL, NULL, NULL, NULL, 0, 115, '2023-03-03 22:10:38.000', 115, '2023-03-03 22:12:16.488');
INSERT INTO `wms_shipment_order` VALUES (158, 'E-2023-03-05-161236', 11, NULL, NULL, NULL, 13, NULL, NULL, NULL, NULL, 0, 115, '2023-03-05 16:12:53.000', 115, '2023-03-05 16:13:36.840');
INSERT INTO `wms_shipment_order` VALUES (159, 'E-2023-03-06-114210', 12, NULL, 23, NULL, 11, NULL, NULL, NULL, NULL, 0, 115, '2023-03-06 11:42:50.571', NULL, NULL);
INSERT INTO `wms_shipment_order` VALUES (160, 'E-2023-03-06-173510', 11, '23', 24, NULL, 11, NULL, NULL, NULL, '23', 0, 115, '2023-03-06 17:36:58.000', 115, '2023-03-08 18:57:53.958');
INSERT INTO `wms_shipment_order` VALUES (161, 'E-2023-03-06-235137', 12, NULL, 24, NULL, 11, NULL, NULL, NULL, NULL, 0, 115, '2023-03-06 23:52:21.000', 115, '2023-03-07 08:56:05.712');
INSERT INTO `wms_shipment_order` VALUES (162, 'E-2023-03-07-134028', 11, '20230307001', 24, NULL, 13, NULL, NULL, NULL, NULL, 0, 115, '2023-03-07 13:40:47.000', 115, '2023-03-07 14:17:46.400');
INSERT INTO `wms_shipment_order` VALUES (163, 'E-2023-03-07-152544', 11, NULL, 24, NULL, 11, NULL, NULL, NULL, NULL, 0, 115, '2023-03-07 15:25:59.694', NULL, NULL);
INSERT INTO `wms_shipment_order` VALUES (164, 'E-2023-03-09-130453', 11, '111', 23, NULL, 13, NULL, NULL, NULL, NULL, 0, 115, '2023-03-09 13:05:17.000', 115, '2023-03-09 13:05:28.506');
INSERT INTO `wms_shipment_order` VALUES (165, 'E-2023-03-09-130727', 11, 'QQ', 23, NULL, 13, NULL, NULL, NULL, 'QQ', 0, 115, '2023-03-09 13:07:44.000', 115, '2023-03-09 13:07:54.053');
INSERT INTO `wms_shipment_order` VALUES (166, 'E-2023-03-09-130945', 11, '11', 23, NULL, 13, NULL, NULL, NULL, '11', 0, 115, '2023-03-09 13:10:12.000', 115, '2023-03-09 13:10:25.864');
INSERT INTO `wms_shipment_order` VALUES (167, 'E-2023-03-09-173138', 11, NULL, 24, NULL, 13, NULL, NULL, NULL, NULL, 0, 115, '2023-03-09 17:31:53.000', 115, '2023-03-09 17:32:08.542');
INSERT INTO `wms_shipment_order` VALUES (168, 'E-2023-03-10-152159', 11, NULL, NULL, NULL, 13, NULL, NULL, NULL, NULL, 0, 115, '2023-03-10 15:22:02.000', 115, '2023-03-10 15:24:24.813');
INSERT INTO `wms_shipment_order` VALUES (169, 'E-2023-03-11-203613', 11, NULL, 26, NULL, 11, NULL, NULL, NULL, NULL, 0, 115, '2023-03-11 20:36:33.326', NULL, NULL);
INSERT INTO `wms_shipment_order` VALUES (170, 'E-2023-03-12-160259', 11, '11', 26, NULL, 13, NULL, NULL, NULL, '11', 0, 115, '2023-03-12 16:03:22.000', 115, '2023-03-12 16:05:24.385');
INSERT INTO `wms_shipment_order` VALUES (171, 'E-2023-03-12-160952', 11, '11', 26, NULL, 13, NULL, NULL, NULL, NULL, 0, 115, '2023-03-12 16:10:14.000', 115, '2023-03-12 16:10:28.568');
INSERT INTO `wms_shipment_order` VALUES (172, 'E-2023-03-13-101503', 13, '1212313', 26, NULL, 11, NULL, NULL, NULL, '借用质检测试', 0, 115, '2023-03-13 10:15:59.203', NULL, NULL);
INSERT INTO `wms_shipment_order` VALUES (173, 'E-2023-03-13-103026', 11, '1111111111111', 26, NULL, 11, NULL, NULL, NULL, '销售二部借出', 0, 115, '2023-03-13 10:31:02.415', NULL, NULL);
INSERT INTO `wms_shipment_order` VALUES (174, 'E-2023-03-13-103352', 11, '888888888888888', 26, NULL, 11, NULL, NULL, NULL, '销售二部卖出', 0, 115, '2023-03-13 10:34:13.317', NULL, NULL);
INSERT INTO `wms_shipment_order` VALUES (175, 'E-2023-03-13-152443', 11, NULL, 26, NULL, 13, NULL, NULL, NULL, NULL, 0, 115, '2023-03-13 15:25:06.000', 115, '2023-03-13 15:25:21.407');
INSERT INTO `wms_shipment_order` VALUES (176, 'E-2023-03-13-162739', 11, '233', 26, NULL, 11, NULL, NULL, NULL, NULL, 0, 115, '2023-03-13 16:28:03.000', 115, '2023-03-13 16:28:45.822');
INSERT INTO `wms_shipment_order` VALUES (177, 'E-2023-03-13-162910', 11, NULL, 26, NULL, 13, NULL, NULL, NULL, NULL, 0, 115, '2023-03-13 16:29:26.000', 115, '2023-03-13 16:31:08.295');
INSERT INTO `wms_shipment_order` VALUES (178, 'E-2023-03-13-163157', 11, '333', 26, NULL, 13, NULL, NULL, NULL, NULL, 0, 115, '2023-03-13 16:32:18.000', 115, '2023-03-13 16:33:18.116');
INSERT INTO `wms_shipment_order` VALUES (179, 'E-2023-03-14-084826', 11, '123', 26, NULL, 11, NULL, NULL, NULL, '123', 0, 115, '2023-03-14 08:48:46.141', NULL, NULL);
INSERT INTO `wms_shipment_order` VALUES (180, 'E-2023-03-14-095843', 11, NULL, 26, NULL, 11, NULL, NULL, NULL, NULL, 0, 115, '2023-03-14 09:58:53.286', NULL, NULL);
INSERT INTO `wms_shipment_order` VALUES (181, 'E-2023-03-14-161100', 11, NULL, NULL, NULL, 11, NULL, NULL, NULL, NULL, 0, 115, '2023-03-14 16:11:25.718', NULL, NULL);
INSERT INTO `wms_shipment_order` VALUES (182, 'E-2023-03-14-161902', 11, NULL, NULL, NULL, 13, NULL, NULL, NULL, NULL, 0, 115, '2023-03-14 16:19:29.000', 115, '2023-03-14 16:20:11.521');
INSERT INTO `wms_shipment_order` VALUES (183, 'E-2023-03-14-201213', 12, '12312', 27, NULL, 11, NULL, NULL, NULL, '3123', 0, 115, '2023-03-14 20:12:51.000', 115, '2023-03-16 17:30:51.507');
INSERT INTO `wms_shipment_order` VALUES (184, 'E-2023-03-15-132915', 11, NULL, 27, NULL, 12, NULL, NULL, NULL, NULL, 0, 115, '2023-03-15 13:29:35.000', 115, '2023-03-15 13:30:11.476');
INSERT INTO `wms_shipment_order` VALUES (185, 'E-2023-03-16-112612', 11, NULL, 27, NULL, 11, NULL, NULL, NULL, NULL, 0, 115, '2023-03-16 11:26:36.000', 115, '2023-03-16 11:26:45.468');
INSERT INTO `wms_shipment_order` VALUES (186, 'E-2023-03-16-113132', 11, NULL, NULL, NULL, 11, NULL, NULL, NULL, NULL, 0, 115, '2023-03-16 11:31:55.724', NULL, NULL);
INSERT INTO `wms_shipment_order` VALUES (187, 'E-2023-03-16-181000', 11, NULL, 27, NULL, 11, NULL, NULL, NULL, NULL, 0, 115, '2023-03-16 18:10:29.395', NULL, NULL);
INSERT INTO `wms_shipment_order` VALUES (188, 'E-2023-03-17-143953', 11, 'dasdasdasdas', 27, NULL, 11, NULL, NULL, NULL, NULL, 0, 115, '2023-03-17 14:40:32.252', NULL, NULL);
INSERT INTO `wms_shipment_order` VALUES (189, 'E-2023-03-19-160005', 11, '色富商大贾', 27, NULL, 11, NULL, NULL, NULL, '符号付规划', 0, 115, '2023-03-19 16:00:25.144', NULL, NULL);
INSERT INTO `wms_shipment_order` VALUES (190, 'E-2023-03-19-164717', 11, '1234567890000', 27, NULL, 11, NULL, NULL, NULL, '备注', 0, 115, '2023-03-19 16:48:56.000', 115, '2023-03-20 12:18:48.254');
INSERT INTO `wms_shipment_order` VALUES (191, 'E-2023-03-20-121944', 11, NULL, 27, NULL, 11, NULL, NULL, NULL, NULL, 0, 115, '2023-03-20 12:20:09.846', NULL, NULL);
INSERT INTO `wms_shipment_order` VALUES (192, 'E-2023-03-20-122146', 11, NULL, NULL, NULL, 11, NULL, NULL, NULL, NULL, 0, 115, '2023-03-20 12:22:05.766', NULL, NULL);
INSERT INTO `wms_shipment_order` VALUES (193, 'E-2023-03-20-122254', 11, 'ewr22333444444442', 27, NULL, 11, NULL, NULL, NULL, NULL, 0, 115, '2023-03-20 12:23:14.000', 115, '2023-03-22 11:40:09.255');
INSERT INTO `wms_shipment_order` VALUES (194, 'E-2023-03-20-135008', 11, NULL, 27, NULL, 13, NULL, NULL, NULL, NULL, 0, 115, '2023-03-20 13:50:38.000', 115, '2023-03-20 13:50:53.502');
INSERT INTO `wms_shipment_order` VALUES (195, 'E-2023-03-21-172734', 11, '11', 27, NULL, 13, NULL, NULL, NULL, '11', 0, 115, '2023-03-21 17:28:01.000', 115, '2023-03-21 19:27:13.335');
INSERT INTO `wms_shipment_order` VALUES (196, 'E-2023-03-21-180052', 11, 'test111', 27, NULL, 11, NULL, NULL, NULL, NULL, 0, 115, '2023-03-21 18:01:06.223', NULL, NULL);
INSERT INTO `wms_shipment_order` VALUES (197, 'E-2023-03-21-184929', 11, '234', NULL, NULL, 11, NULL, NULL, NULL, '234234', 0, 115, '2023-03-21 18:49:42.833', NULL, NULL);
INSERT INTO `wms_shipment_order` VALUES (198, 'E-2023-03-21-193036', 11, '110109491', 27, NULL, 11, NULL, NULL, NULL, NULL, 0, 115, '2023-03-21 19:31:05.000', 115, '2023-03-25 16:51:04.639');
INSERT INTO `wms_shipment_order` VALUES (199, 'E-2023-03-21-193604', 11, '1936', 27, NULL, 13, NULL, NULL, NULL, NULL, 0, 115, '2023-03-21 19:36:34.000', 115, '2023-03-21 19:36:49.629');
INSERT INTO `wms_shipment_order` VALUES (200, 'E-2023-03-22-161028', 11, '55555', 28, NULL, 13, NULL, NULL, NULL, NULL, 0, 115, '2023-03-22 16:10:53.000', 115, '2023-03-22 16:11:50.008');
INSERT INTO `wms_shipment_order` VALUES (201, 'E-2023-03-22-225222', 11, 'C202303220000000005', 27, NULL, 13, NULL, NULL, NULL, NULL, 0, 115, '2023-03-22 22:52:44.000', 115, '2023-03-22 22:53:08.573');
INSERT INTO `wms_shipment_order` VALUES (202, 'E-2023-03-23-075553', 11, NULL, NULL, NULL, 11, NULL, NULL, NULL, NULL, 0, 115, '2023-03-23 07:56:19.000', 115, '2023-03-23 11:08:34.104');
INSERT INTO `wms_shipment_order` VALUES (203, 'E-2023-03-23-133606', 11, NULL, NULL, NULL, 11, NULL, NULL, NULL, NULL, 0, 115, '2023-03-23 13:36:47.000', 1, '2023-03-30 21:15:28.933');
INSERT INTO `wms_shipment_order` VALUES (204, 'E-2023-03-24-154848', 11, NULL, 27, NULL, 11, NULL, NULL, NULL, NULL, 0, 115, '2023-03-24 15:49:16.000', 115, '2023-03-29 10:36:21.844');
INSERT INTO `wms_shipment_order` VALUES (205, 'E-2023-03-25-101417', 13, NULL, NULL, NULL, 11, NULL, NULL, NULL, NULL, 0, 115, '2023-03-25 10:14:53.000', 115, '2023-03-25 12:11:07.713');
INSERT INTO `wms_shipment_order` VALUES (206, 'E-2023-03-25-152810', 11, '10', 27, NULL, 11, NULL, NULL, NULL, NULL, 0, 115, '2023-03-25 15:29:00.000', 115, '2023-03-25 15:31:13.267');
INSERT INTO `wms_shipment_order` VALUES (207, 'E-2023-03-25-165018', 11, '02005145', 27, NULL, 11, NULL, NULL, NULL, 'dsasd', 0, 115, '2023-03-25 16:50:49.000', 115, '2023-03-31 14:59:07.207');
INSERT INTO `wms_shipment_order` VALUES (208, 'E-2023-03-27-141302', 11, NULL, NULL, NULL, 11, NULL, NULL, NULL, NULL, 0, 115, '2023-03-27 14:13:15.000', 115, '2023-03-27 18:02:33.770');
INSERT INTO `wms_shipment_order` VALUES (209, 'E-2023-03-28-080332', 11, NULL, 27, NULL, 11, NULL, NULL, NULL, NULL, 0, 115, '2023-03-28 08:04:14.000', 115, '2023-03-28 09:38:40.449');
INSERT INTO `wms_shipment_order` VALUES (210, 'E-2023-03-28-150014', 11, NULL, 27, NULL, 11, NULL, NULL, NULL, NULL, 0, 115, '2023-03-28 15:00:29.000', 115, '2023-03-31 21:16:09.837');
INSERT INTO `wms_shipment_order` VALUES (211, 'E-2023-03-30-152636', 13, NULL, 33, NULL, 11, NULL, NULL, NULL, NULL, 1, 115, '2023-03-30 15:27:07.493', NULL, NULL);
INSERT INTO `wms_shipment_order` VALUES (212, 'E-2023-04-01-235347', 11, NULL, 33, NULL, 11, NULL, NULL, NULL, NULL, 0, 115, '2023-04-01 23:54:14.865', NULL, NULL);
INSERT INTO `wms_shipment_order` VALUES (213, 'E-2023-04-03-090142', 11, NULL, 33, NULL, 11, NULL, NULL, NULL, NULL, 0, 115, '2023-04-03 09:02:37.000', 115, '2023-04-03 16:30:47.898');
INSERT INTO `wms_shipment_order` VALUES (214, 'E-2023-04-03-090830', 11, NULL, 33, NULL, 11, NULL, NULL, NULL, NULL, 0, 115, '2023-04-03 09:08:38.999', NULL, NULL);
INSERT INTO `wms_shipment_order` VALUES (215, 'E-2023-04-03-091741', 13, '123', 33, NULL, 13, NULL, NULL, NULL, NULL, 0, 115, '2023-04-03 09:18:13.000', 115, '2023-04-03 09:18:34.948');
INSERT INTO `wms_shipment_order` VALUES (216, 'E-2023-04-03-093207', 11, '23321313', 33, NULL, 13, NULL, NULL, NULL, NULL, 0, 115, '2023-04-03 09:32:24.000', 115, '2023-04-03 09:32:39.311');
INSERT INTO `wms_shipment_order` VALUES (217, 'E-2023-04-03-131913', 11, NULL, NULL, NULL, 12, NULL, NULL, NULL, NULL, 0, 115, '2023-04-03 13:19:22.000', 115, '2023-04-06 14:23:54.332');
INSERT INTO `wms_shipment_order` VALUES (218, 'E-2023-04-03-141338', 11, NULL, NULL, NULL, 12, NULL, NULL, NULL, NULL, 0, 115, '2023-04-03 14:13:54.000', 115, '2023-04-03 14:17:44.033');
INSERT INTO `wms_shipment_order` VALUES (219, 'E-2023-04-03-162603', 11, NULL, 33, NULL, 13, NULL, NULL, NULL, NULL, 0, 115, '2023-04-03 16:26:24.000', 115, '2023-04-03 16:27:17.540');
INSERT INTO `wms_shipment_order` VALUES (220, 'E-2023-04-03-164713', 11, NULL, NULL, NULL, 11, NULL, NULL, NULL, NULL, 0, 115, '2023-04-03 16:47:33.000', 115, '2023-04-04 14:24:57.821');
INSERT INTO `wms_shipment_order` VALUES (221, 'E-2023-04-03-173242', 13, NULL, NULL, NULL, 11, NULL, NULL, NULL, NULL, 1, 115, '2023-04-03 17:33:33.000', 115, '2023-04-03 17:34:20.237');
INSERT INTO `wms_shipment_order` VALUES (222, 'E-2023-04-03-173738', 13, '123', NULL, NULL, 11, NULL, NULL, NULL, '123', 0, 115, '2023-04-03 17:38:14.687', NULL, NULL);
INSERT INTO `wms_shipment_order` VALUES (223, 'E-2023-04-04-133841', 13, 'qweqwe', NULL, NULL, 11, NULL, NULL, NULL, 'qweqwe', 0, 115, '2023-04-04 13:39:03.799', NULL, NULL);
INSERT INTO `wms_shipment_order` VALUES (224, 'E-2023-04-06-103741', 11, NULL, NULL, NULL, 13, NULL, NULL, NULL, NULL, 0, 115, '2023-04-06 10:38:09.000', 115, '2023-04-06 10:38:58.237');
INSERT INTO `wms_shipment_order` VALUES (225, 'E-2023-04-06-141220', 11, '001', 35, NULL, 13, NULL, NULL, NULL, '001', 0, 115, '2023-04-06 14:12:46.000', 115, '2023-04-06 14:14:19.372');
INSERT INTO `wms_shipment_order` VALUES (226, 'E-2023-04-06-151506', 11, '000001', 36, NULL, 13, NULL, NULL, NULL, NULL, 0, 115, '2023-04-06 15:15:40.000', 115, '2023-04-06 15:16:12.820');
INSERT INTO `wms_shipment_order` VALUES (227, 'E-2023-04-06-224524', 11, '800', 37, NULL, 13, NULL, NULL, NULL, NULL, 0, 115, '2023-04-06 22:45:50.000', 115, '2023-04-06 22:46:28.713');
INSERT INTO `wms_shipment_order` VALUES (228, 'E-2023-04-07-110824', 11, NULL, 35, NULL, 13, NULL, NULL, NULL, NULL, 0, 115, '2023-04-07 11:08:48.000', 115, '2023-04-07 11:10:06.432');
INSERT INTO `wms_shipment_order` VALUES (229, 'E-2023-04-08-080948', 13, NULL, 35, NULL, 11, NULL, NULL, NULL, NULL, 0, 115, '2023-04-08 08:10:24.000', 115, '2023-04-08 13:59:13.943');
INSERT INTO `wms_shipment_order` VALUES (230, 'E-2023-04-08-141941', 11, '098777', 35, NULL, 11, NULL, NULL, NULL, '京津冀', 0, 115, '2023-04-08 14:20:10.951', NULL, NULL);
INSERT INTO `wms_shipment_order` VALUES (231, 'E-2023-04-09-174723', 11, NULL, 35, NULL, 11, NULL, NULL, NULL, NULL, 0, 115, '2023-04-09 17:47:44.919', NULL, NULL);
INSERT INTO `wms_shipment_order` VALUES (232, 'E-2023-04-10-110741', 11, NULL, 35, NULL, 11, NULL, NULL, NULL, NULL, 0, 115, '2023-04-10 11:08:23.521', NULL, NULL);
INSERT INTO `wms_shipment_order` VALUES (233, 'E-2023-04-10-115848', 11, 'HR0001', 35, NULL, 11, NULL, NULL, NULL, NULL, 1, 115, '2023-04-10 11:59:28.000', 115, '2023-04-10 11:59:40.387');
INSERT INTO `wms_shipment_order` VALUES (234, 'E-2023-04-10-115954', 11, 'A00001', 35, NULL, 11, NULL, NULL, NULL, NULL, 0, 115, '2023-04-10 12:00:07.000', 115, '2023-04-13 11:38:16.230');
INSERT INTO `wms_shipment_order` VALUES (235, 'E-2023-04-10-164716', 11, NULL, 35, NULL, 12, NULL, NULL, NULL, NULL, 0, 115, '2023-04-10 16:47:47.000', 115, '2023-04-11 17:33:10.538');
INSERT INTO `wms_shipment_order` VALUES (236, 'E-2023-04-10-165056', 11, NULL, NULL, NULL, 13, NULL, NULL, NULL, NULL, 0, 115, '2023-04-10 16:51:09.000', 115, '2023-04-10 16:51:24.575');
INSERT INTO `wms_shipment_order` VALUES (237, 'E-2023-04-11-160037', 11, NULL, 35, NULL, 13, NULL, NULL, NULL, NULL, 0, 115, '2023-04-11 16:01:02.000', 115, '2023-04-11 16:01:14.401');
INSERT INTO `wms_shipment_order` VALUES (238, 'E-2023-04-11-160209', 13, NULL, 35, NULL, 14, NULL, NULL, NULL, NULL, 0, 115, '2023-04-11 16:02:29.000', 115, '2023-04-11 16:02:49.504');
INSERT INTO `wms_shipment_order` VALUES (239, 'E-2023-04-12-185929', 11, '12333', 37, NULL, 11, NULL, NULL, NULL, '12333', 0, 115, '2023-04-12 19:00:00.000', 115, '2023-04-12 19:01:28.496');
INSERT INTO `wms_shipment_order` VALUES (240, 'E-2023-04-13-114307', 11, '额3333333', 35, NULL, 11, NULL, NULL, NULL, NULL, 0, 115, '2023-04-13 11:43:19.000', 115, '2023-04-13 11:44:21.018');
INSERT INTO `wms_shipment_order` VALUES (241, 'E-2023-04-13-215045', 13, '1', 35, NULL, 11, NULL, NULL, NULL, '1', 0, 115, '2023-04-13 21:51:13.000', 115, '2023-04-13 21:51:45.527');
INSERT INTO `wms_shipment_order` VALUES (242, 'E-2023-04-15-063402', 13, NULL, 35, NULL, 11, NULL, NULL, NULL, NULL, 0, 115, '2023-04-15 06:35:26.047', NULL, NULL);
INSERT INTO `wms_shipment_order` VALUES (243, 'E-2023-04-15-162750', 13, 'sdfs', 35, NULL, 11, NULL, NULL, NULL, 'dsfs', 0, 115, '2023-04-15 16:28:21.922', NULL, NULL);
INSERT INTO `wms_shipment_order` VALUES (244, 'E-2023-04-15-172459', 11, 'xxxx', 35, NULL, 11, NULL, NULL, NULL, NULL, 0, 115, '2023-04-15 17:25:19.000', 115, '2023-04-15 17:25:28.175');
INSERT INTO `wms_shipment_order` VALUES (245, 'E-2023-04-15-204311', 11, '121212121', 35, NULL, 11, NULL, NULL, NULL, NULL, 0, 115, '2023-04-15 20:43:39.741', NULL, NULL);
INSERT INTO `wms_shipment_order` VALUES (246, 'E-2023-04-15-204800', 11, '11', 35, NULL, 13, NULL, NULL, NULL, '11', 0, 115, '2023-04-15 20:48:35.000', 115, '2023-04-15 20:49:04.334');
INSERT INTO `wms_shipment_order` VALUES (247, 'E-2023-04-18-132909', 11, '566656', 35, NULL, 13, NULL, NULL, NULL, NULL, 0, 115, '2023-04-18 13:29:51.000', 115, '2023-04-18 13:30:05.444');
INSERT INTO `wms_shipment_order` VALUES (248, 'E-2023-04-18-133807', 11, 'test', 38, NULL, 11, NULL, NULL, NULL, NULL, 0, 115, '2023-04-18 13:38:43.241', NULL, NULL);
INSERT INTO `wms_shipment_order` VALUES (249, 'E-2023-04-18-211910', 11, 'f', 36, NULL, 11, NULL, NULL, NULL, NULL, 0, 115, '2023-04-18 21:19:33.000', 115, '2023-04-22 19:10:12.998');
INSERT INTO `wms_shipment_order` VALUES (250, 'E-2023-04-21-101910', 11, 'abcdev', 35, NULL, 11, NULL, NULL, NULL, NULL, 0, 115, '2023-04-21 10:19:33.000', 115, '2023-04-22 19:19:16.111');
INSERT INTO `wms_shipment_order` VALUES (251, 'E-2023-04-21-165911', 11, NULL, 36, NULL, 13, NULL, NULL, NULL, NULL, 0, 115, '2023-04-21 16:59:41.000', 115, '2023-04-25 15:46:56.409');
INSERT INTO `wms_shipment_order` VALUES (252, 'E-2023-04-22-095555', 12, NULL, NULL, NULL, 11, NULL, NULL, NULL, NULL, 0, 115, '2023-04-22 09:56:15.175', NULL, NULL);
INSERT INTO `wms_shipment_order` VALUES (253, 'E-2023-04-22-160938', 11, 'aa', 35, NULL, 13, NULL, NULL, NULL, NULL, 0, 115, '2023-04-22 16:09:47.000', 115, '2023-04-22 19:11:49.707');
INSERT INTO `wms_shipment_order` VALUES (254, 'E-2023-04-23-152423', 11, NULL, NULL, NULL, 11, NULL, NULL, NULL, NULL, 0, 115, '2023-04-23 15:25:21.000', 115, '2023-04-23 15:25:37.401');
INSERT INTO `wms_shipment_order` VALUES (255, 'E-2023-04-23-152545', 11, NULL, NULL, NULL, 11, NULL, NULL, NULL, NULL, 0, 115, '2023-04-23 15:26:01.437', NULL, NULL);
INSERT INTO `wms_shipment_order` VALUES (256, 'E-2023-04-23-152835', 11, NULL, NULL, NULL, 11, NULL, NULL, NULL, NULL, 0, 115, '2023-04-23 15:29:13.020', NULL, NULL);
INSERT INTO `wms_shipment_order` VALUES (257, 'E-2023-04-23-164852', 11, NULL, NULL, NULL, 11, NULL, NULL, NULL, NULL, 0, 115, '2023-04-23 16:49:40.368', NULL, NULL);
INSERT INTO `wms_shipment_order` VALUES (258, 'E-2023-04-23-204001', 12, NULL, 36, NULL, 12, NULL, NULL, NULL, NULL, 0, 115, '2023-04-23 20:40:36.000', 115, '2023-04-27 15:18:00.372');
INSERT INTO `wms_shipment_order` VALUES (259, 'E-2023-04-24-153642', 11, '阿大使21', 37, NULL, 13, NULL, NULL, NULL, '121233', 0, 115, '2023-04-24 15:37:03.000', 115, '2023-04-24 15:37:11.003');
INSERT INTO `wms_shipment_order` VALUES (260, 'E-2023-04-25-111123', 11, NULL, 35, NULL, 13, NULL, NULL, NULL, NULL, 0, 115, '2023-04-25 11:11:52.000', 115, '2023-04-25 15:01:00.142');
INSERT INTO `wms_shipment_order` VALUES (261, 'E-2023-04-25-155032', 11, '235345', 36, NULL, 13, NULL, NULL, NULL, 'hhhhhhhhhhhggggggggggg', 0, 115, '2023-04-25 15:50:54.000', 115, '2023-04-25 15:54:56.907');
INSERT INTO `wms_shipment_order` VALUES (262, 'E-2023-04-26-105917', 11, '001', 39, NULL, 11, NULL, NULL, NULL, NULL, 0, 115, '2023-04-26 10:59:46.000', 115, '2023-04-27 21:16:15.529');
INSERT INTO `wms_shipment_order` VALUES (263, 'E-2023-04-30-222934', 11, NULL, 35, NULL, 11, NULL, NULL, NULL, NULL, 0, 115, '2023-04-30 22:29:57.596', NULL, NULL);
INSERT INTO `wms_shipment_order` VALUES (268, 'E-2023-05-04-110614', 11, '434444444444444', 35, NULL, 11, NULL, NULL, NULL, '444444444444444444444444444444444444444444', 0, 1, '2023-05-04 11:06:26.723', NULL, NULL);
INSERT INTO `wms_shipment_order` VALUES (269, 'E-2023-05-04-110658', 11, '432444444444444444', 37, 28.00, 11, NULL, NULL, NULL, '4233333333333333333333333333333', 0, 1, '2023-05-04 11:07:19.413', NULL, NULL);
INSERT INTO `wms_shipment_order` VALUES (270, 'E-2023-05-04-110912', 11, '171814943274023', 39, 20.00, 11, NULL, NULL, NULL, '测试出库金额', 0, 1, '2023-05-04 11:09:35.965', NULL, NULL);
INSERT INTO `wms_shipment_order` VALUES (271, 'E-2023-05-04-181653', 11, '4793472384', 37, 1800.00, 11, NULL, NULL, NULL, '41234213213213', 0, 1, '2023-05-04 18:17:15.753', NULL, NULL);
INSERT INTO `wms_shipment_order` VALUES (272, 'E-2023-05-04-190751', 11, NULL, NULL, NULL, 11, NULL, NULL, NULL, NULL, 0, 115, '2023-05-04 19:08:52.354', NULL, NULL);

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
) ENGINE = InnoDB AUTO_INCREMENT = 889 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '出库单详情' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wms_shipment_order_detail
-- ----------------------------
INSERT INTO `wms_shipment_order_detail` VALUES (1, 7, 1, 20.00, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 3, 14, 11);
INSERT INTO `wms_shipment_order_detail` VALUES (2, 7, 2, 101.00, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 7, NULL, 11);
INSERT INTO `wms_shipment_order_detail` VALUES (5, 8, 1, 15.00, NULL, 1, NULL, 0, NULL, NULL, NULL, NULL, NULL, 1, 13, 0);
INSERT INTO `wms_shipment_order_detail` VALUES (6, 8, 2, 200.00, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 3, 14, 0);
INSERT INTO `wms_shipment_order_detail` VALUES (16, 9, 1, 40.00, 40.00, 1, NULL, 0, NULL, NULL, NULL, NULL, NULL, 1, 13, 13);
INSERT INTO `wms_shipment_order_detail` VALUES (23, 11, 1, 11.00, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 1, 15, 11);
INSERT INTO `wms_shipment_order_detail` VALUES (24, 11, 2, 22.00, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 4, NULL, 11);
INSERT INTO `wms_shipment_order_detail` VALUES (25, 12, 1, 1.00, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 11);
INSERT INTO `wms_shipment_order_detail` VALUES (27, 13, 1, 4.00, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 3, 14, 11);
INSERT INTO `wms_shipment_order_detail` VALUES (28, 14, 1, 100.00, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 3, 14, 11);
INSERT INTO `wms_shipment_order_detail` VALUES (29, 15, 1, 1.00, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 11);
INSERT INTO `wms_shipment_order_detail` VALUES (31, 10, 1, 20.00, 1.00, 1, NULL, 0, NULL, NULL, NULL, NULL, NULL, 1, 13, 12);
INSERT INTO `wms_shipment_order_detail` VALUES (32, 10, 2, 40.00, 1.00, 4, NULL, 0, NULL, NULL, NULL, NULL, NULL, 2, 17, 11);
INSERT INTO `wms_shipment_order_detail` VALUES (35, 17, 5, 5.00, 1.00, 6, NULL, 0, NULL, NULL, NULL, NULL, NULL, 2, 18, 13);
INSERT INTO `wms_shipment_order_detail` VALUES (40, 18, 7, 10.00, 10.00, 9, NULL, 0, NULL, NULL, NULL, NULL, NULL, 21, 43, 13);
INSERT INTO `wms_shipment_order_detail` VALUES (41, 18, 8, 10.00, 10.00, 11, NULL, 0, NULL, NULL, NULL, NULL, NULL, 21, 44, 13);
INSERT INTO `wms_shipment_order_detail` VALUES (44, 16, 2, 3.00, NULL, 1, NULL, 0, NULL, NULL, NULL, NULL, NULL, 2, 17, 11);
INSERT INTO `wms_shipment_order_detail` VALUES (47, 20, 17, 1.00, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 2, 44, 11);
INSERT INTO `wms_shipment_order_detail` VALUES (49, 21, 14, 1.00, 1.00, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 2, 44, 13);
INSERT INTO `wms_shipment_order_detail` VALUES (50, 22, 12, 1.00, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 11);
INSERT INTO `wms_shipment_order_detail` VALUES (51, 22, 14, 1.00, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 11);
INSERT INTO `wms_shipment_order_detail` VALUES (53, 25, 12, 1.00, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 11);
INSERT INTO `wms_shipment_order_detail` VALUES (54, 25, 13, 1.00, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 11);
INSERT INTO `wms_shipment_order_detail` VALUES (55, 26, 13, 1.00, NULL, 13, NULL, 0, NULL, NULL, NULL, NULL, NULL, 2, 44, 11);
INSERT INTO `wms_shipment_order_detail` VALUES (56, 27, 12, 100.00, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 11);
INSERT INTO `wms_shipment_order_detail` VALUES (57, 28, 20, 20.00, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 4, NULL, 11);
INSERT INTO `wms_shipment_order_detail` VALUES (58, 29, 12, 1.00, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 4, NULL, 11);
INSERT INTO `wms_shipment_order_detail` VALUES (59, 29, 13, 1.00, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 14, NULL, 11);
INSERT INTO `wms_shipment_order_detail` VALUES (60, 29, 14, 1.00, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 14, 53, 11);
INSERT INTO `wms_shipment_order_detail` VALUES (61, 29, 18, 1.00, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 4, NULL, 11);
INSERT INTO `wms_shipment_order_detail` VALUES (62, 29, 19, 1.00, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 27, NULL, 11);
INSERT INTO `wms_shipment_order_detail` VALUES (63, 29, 21, 1.00, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 27, NULL, 11);
INSERT INTO `wms_shipment_order_detail` VALUES (64, 30, 17, 1000.00, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 11);
INSERT INTO `wms_shipment_order_detail` VALUES (65, 30, 18, 1.00, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 11);
INSERT INTO `wms_shipment_order_detail` VALUES (66, 31, 13, 1.00, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 11);
INSERT INTO `wms_shipment_order_detail` VALUES (67, 31, 14, 1.00, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 11);
INSERT INTO `wms_shipment_order_detail` VALUES (68, 31, 15, 1.00, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 11);
INSERT INTO `wms_shipment_order_detail` VALUES (69, 31, 16, 1.00, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 11);
INSERT INTO `wms_shipment_order_detail` VALUES (70, 31, 17, 1.00, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 11);
INSERT INTO `wms_shipment_order_detail` VALUES (71, 31, 18, 1.00, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 11);
INSERT INTO `wms_shipment_order_detail` VALUES (72, 31, 19, 1.00, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 11);
INSERT INTO `wms_shipment_order_detail` VALUES (73, 31, 20, 1.00, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 11);
INSERT INTO `wms_shipment_order_detail` VALUES (74, 31, 21, 1.00, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 11);
INSERT INTO `wms_shipment_order_detail` VALUES (76, 35, 13, 10000.00, 1.00, 13, NULL, 0, NULL, NULL, NULL, NULL, NULL, 2, 44, 13);
INSERT INTO `wms_shipment_order_detail` VALUES (77, 37, 17, 1.00, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 11);
INSERT INTO `wms_shipment_order_detail` VALUES (78, 37, 19, 1.00, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 11);
INSERT INTO `wms_shipment_order_detail` VALUES (79, 38, 13, 1.00, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 11);
INSERT INTO `wms_shipment_order_detail` VALUES (80, 39, 13, 1.00, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 14, 53, 11);
INSERT INTO `wms_shipment_order_detail` VALUES (81, 40, 15, 1.00, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 11);
INSERT INTO `wms_shipment_order_detail` VALUES (82, 42, 13, 1.00, NULL, 13, NULL, 0, NULL, NULL, NULL, NULL, NULL, 2, 45, 11);
INSERT INTO `wms_shipment_order_detail` VALUES (83, 42, 14, 1.00, NULL, 21, NULL, 0, NULL, NULL, NULL, NULL, NULL, 2, 45, 11);
INSERT INTO `wms_shipment_order_detail` VALUES (84, 42, 15, 1.00, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 4, NULL, 11);
INSERT INTO `wms_shipment_order_detail` VALUES (85, 36, 28, 10.00, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 4, 54, 11);
INSERT INTO `wms_shipment_order_detail` VALUES (86, 36, 27, 10.00, NULL, 14, NULL, 0, NULL, NULL, NULL, NULL, NULL, 14, 46, 11);
INSERT INTO `wms_shipment_order_detail` VALUES (91, 44, 28, 1.00, 1.00, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 4, 54, 13);
INSERT INTO `wms_shipment_order_detail` VALUES (92, 44, 27, 1.00, 1.00, 14, NULL, 0, NULL, NULL, NULL, NULL, NULL, 14, 46, 13);
INSERT INTO `wms_shipment_order_detail` VALUES (94, 45, 13, 3.00, 1.00, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 4, 54, 13);
INSERT INTO `wms_shipment_order_detail` VALUES (95, 19, 15, 7.00, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 4, 54, 11);
INSERT INTO `wms_shipment_order_detail` VALUES (98, 47, 22, 2.00, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 4, NULL, 11);
INSERT INTO `wms_shipment_order_detail` VALUES (100, 46, 13, 19.00, 2.00, 4, NULL, 0, NULL, NULL, NULL, NULL, NULL, 4, 14, 14);
INSERT INTO `wms_shipment_order_detail` VALUES (104, 49, 29, 3.00, 3.00, 25, NULL, 0, NULL, NULL, NULL, NULL, NULL, 31, 57, 13);
INSERT INTO `wms_shipment_order_detail` VALUES (105, 48, 29, 1.00, 1.00, 24, NULL, 0, NULL, NULL, NULL, NULL, NULL, 30, 56, 13);
INSERT INTO `wms_shipment_order_detail` VALUES (107, 51, 54, 1200.00, 1.00, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 39, NULL, 11);
INSERT INTO `wms_shipment_order_detail` VALUES (110, 52, 55, 200.00, 1.00, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 38, NULL, 13);
INSERT INTO `wms_shipment_order_detail` VALUES (113, 53, 55, 1.00, 1.00, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 39, NULL, 13);
INSERT INTO `wms_shipment_order_detail` VALUES (114, 54, 57, 6.00, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 38, NULL, 11);
INSERT INTO `wms_shipment_order_detail` VALUES (116, 55, 60, 10.00, 1.00, 29, NULL, 0, NULL, NULL, NULL, NULL, NULL, 38, 61, 13);
INSERT INTO `wms_shipment_order_detail` VALUES (117, 56, 60, 14.00, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 11);
INSERT INTO `wms_shipment_order_detail` VALUES (120, 57, 60, 80000.00, 1.00, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 42, NULL, 13);
INSERT INTO `wms_shipment_order_detail` VALUES (121, 58, 60, 1.00, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 11);
INSERT INTO `wms_shipment_order_detail` VALUES (125, 59, 61, 1000.00, 1.00, 29, NULL, 0, NULL, NULL, NULL, NULL, NULL, 38, 61, 13);
INSERT INTO `wms_shipment_order_detail` VALUES (127, 60, 61, 1.00, 1.00, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 38, 61, 13);
INSERT INTO `wms_shipment_order_detail` VALUES (134, 61, 63, 2.00, 1.00, 31, NULL, 0, NULL, NULL, NULL, NULL, NULL, 50, 67, 12);
INSERT INTO `wms_shipment_order_detail` VALUES (135, 61, 62, 1.00, 1.00, 31, NULL, 0, NULL, NULL, NULL, NULL, NULL, 50, 67, 11);
INSERT INTO `wms_shipment_order_detail` VALUES (138, 62, 64, 2.00, 1.00, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 51, 68, 11);
INSERT INTO `wms_shipment_order_detail` VALUES (139, 62, 63, 1.00, 1.00, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 51, 68, 11);
INSERT INTO `wms_shipment_order_detail` VALUES (141, 63, 65, 10.00, 1.00, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 50, 69, 13);
INSERT INTO `wms_shipment_order_detail` VALUES (144, 64, 68, 8.00, NULL, 31, NULL, 0, NULL, NULL, NULL, NULL, NULL, 50, 70, 11);
INSERT INTO `wms_shipment_order_detail` VALUES (145, 64, 67, 9.00, NULL, 31, NULL, 0, NULL, NULL, NULL, NULL, NULL, 50, 70, 11);
INSERT INTO `wms_shipment_order_detail` VALUES (146, 65, 68, 100.00, NULL, 34, NULL, 0, NULL, NULL, NULL, NULL, NULL, 53, 73, 11);
INSERT INTO `wms_shipment_order_detail` VALUES (147, 66, 69, 10.00, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 58, NULL, 11);
INSERT INTO `wms_shipment_order_detail` VALUES (148, 66, 68, 10.00, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 58, NULL, 11);
INSERT INTO `wms_shipment_order_detail` VALUES (149, 66, 67, 10.00, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 58, NULL, 11);
INSERT INTO `wms_shipment_order_detail` VALUES (166, 68, 75, 1.00, 1.00, 38, NULL, 0, NULL, NULL, NULL, NULL, NULL, 61, 77, 13);
INSERT INTO `wms_shipment_order_detail` VALUES (172, 67, 75, 8.00, 8.00, 38, NULL, 0, NULL, NULL, NULL, NULL, NULL, 61, 77, 11);
INSERT INTO `wms_shipment_order_detail` VALUES (173, 67, 74, 1.00, 1.00, 37, NULL, 0, NULL, NULL, NULL, NULL, NULL, 61, 77, 14);
INSERT INTO `wms_shipment_order_detail` VALUES (174, 67, 73, 100.00, 1.00, 38, NULL, 0, NULL, NULL, NULL, NULL, NULL, 61, 77, 14);
INSERT INTO `wms_shipment_order_detail` VALUES (175, 67, 72, 10.00, 1.00, 38, NULL, 0, NULL, NULL, NULL, NULL, NULL, 61, 77, 14);
INSERT INTO `wms_shipment_order_detail` VALUES (176, 67, 71, 10.00, 1.00, 38, NULL, 0, NULL, NULL, NULL, NULL, NULL, 61, 77, 14);
INSERT INTO `wms_shipment_order_detail` VALUES (180, 69, 77, 1.00, 1.00, 46, NULL, 0, NULL, NULL, NULL, NULL, NULL, 61, 77, 11);
INSERT INTO `wms_shipment_order_detail` VALUES (181, 69, 75, 1.00, 1.00, 38, NULL, 0, NULL, NULL, NULL, NULL, NULL, 61, 77, 11);
INSERT INTO `wms_shipment_order_detail` VALUES (182, 69, 74, 1.00, 1.00, 38, NULL, 0, NULL, NULL, NULL, NULL, NULL, 61, 77, 11);
INSERT INTO `wms_shipment_order_detail` VALUES (185, 73, 78, 5.00, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 69, NULL, 11);
INSERT INTO `wms_shipment_order_detail` VALUES (186, 72, 78, 1.00, 1.00, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 69, NULL, 14);
INSERT INTO `wms_shipment_order_detail` VALUES (187, 71, 78, 5.00, 1.00, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 69, NULL, 14);
INSERT INTO `wms_shipment_order_detail` VALUES (191, 75, 78, 4.00, 4.00, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 69, NULL, 13);
INSERT INTO `wms_shipment_order_detail` VALUES (210, 76, 80, 8.00, 4.00, 51, NULL, 0, NULL, NULL, NULL, NULL, NULL, 65, 86, 13);
INSERT INTO `wms_shipment_order_detail` VALUES (211, 76, 79, 6.00, 4.00, 50, NULL, 0, NULL, NULL, NULL, NULL, NULL, 65, 86, 11);
INSERT INTO `wms_shipment_order_detail` VALUES (212, 76, 78, 6.00, 4.00, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 69, NULL, 11);
INSERT INTO `wms_shipment_order_detail` VALUES (215, 77, 80, 1.00, 1.00, 51, NULL, 0, NULL, NULL, NULL, NULL, NULL, 65, 86, 13);
INSERT INTO `wms_shipment_order_detail` VALUES (216, 77, 79, 1.00, 1.00, 50, NULL, 0, NULL, NULL, NULL, NULL, NULL, 65, 86, 11);
INSERT INTO `wms_shipment_order_detail` VALUES (217, 78, 80, 1.00, NULL, 50, NULL, 0, NULL, NULL, NULL, NULL, NULL, 65, 86, 11);
INSERT INTO `wms_shipment_order_detail` VALUES (218, 79, 80, 1.00, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 11);
INSERT INTO `wms_shipment_order_detail` VALUES (222, 80, 87, 1.00, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 11);
INSERT INTO `wms_shipment_order_detail` VALUES (223, 80, 86, 1.00, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 11);
INSERT INTO `wms_shipment_order_detail` VALUES (224, 80, 85, 1.00, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 11);
INSERT INTO `wms_shipment_order_detail` VALUES (225, 80, 84, 1.00, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 11);
INSERT INTO `wms_shipment_order_detail` VALUES (226, 80, 83, 1.00, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 11);
INSERT INTO `wms_shipment_order_detail` VALUES (227, 80, 82, 1.00, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 11);
INSERT INTO `wms_shipment_order_detail` VALUES (228, 80, 81, 1.00, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 11);
INSERT INTO `wms_shipment_order_detail` VALUES (229, 80, 80, 1.00, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 11);
INSERT INTO `wms_shipment_order_detail` VALUES (230, 80, 79, 1.00, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 11);
INSERT INTO `wms_shipment_order_detail` VALUES (231, 80, 78, 1.00, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 11);
INSERT INTO `wms_shipment_order_detail` VALUES (232, 81, 82, 1.00, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 11);
INSERT INTO `wms_shipment_order_detail` VALUES (233, 82, 85, 1.00, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 11);
INSERT INTO `wms_shipment_order_detail` VALUES (234, 83, 88, 100.00, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 66, 87, 11);
INSERT INTO `wms_shipment_order_detail` VALUES (235, 85, 88, 1.00, NULL, 50, NULL, 0, NULL, NULL, NULL, NULL, NULL, 66, 86, 11);
INSERT INTO `wms_shipment_order_detail` VALUES (236, 74, 88, 1.00, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 11);
INSERT INTO `wms_shipment_order_detail` VALUES (237, 74, 86, 4.00, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 11);
INSERT INTO `wms_shipment_order_detail` VALUES (239, 86, 88, 10.00, 1.00, 49, NULL, 0, NULL, NULL, NULL, NULL, NULL, 68, 85, 13);
INSERT INTO `wms_shipment_order_detail` VALUES (240, 87, 88, 1.00, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 11);
INSERT INTO `wms_shipment_order_detail` VALUES (241, 87, 86, 1.00, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 11);
INSERT INTO `wms_shipment_order_detail` VALUES (242, 87, 85, 1.00, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 11);
INSERT INTO `wms_shipment_order_detail` VALUES (246, 88, 89, 20.00, 10.00, 50, NULL, 0, NULL, NULL, NULL, NULL, NULL, 76, 89, 13);
INSERT INTO `wms_shipment_order_detail` VALUES (249, 89, 90, 1.00, 1.00, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 75, 90, 11);
INSERT INTO `wms_shipment_order_detail` VALUES (250, 89, 89, 1.00, 1.00, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 75, 90, 11);
INSERT INTO `wms_shipment_order_detail` VALUES (252, 90, 90, 1.00, 1.00, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 75, 90, 13);
INSERT INTO `wms_shipment_order_detail` VALUES (254, 91, 89, 1.00, 1.00, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 75, NULL, 13);
INSERT INTO `wms_shipment_order_detail` VALUES (255, 92, 89, 1.00, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 75, NULL, 11);
INSERT INTO `wms_shipment_order_detail` VALUES (256, 93, 91, 500.00, NULL, 50, NULL, 0, NULL, NULL, NULL, NULL, NULL, 74, 89, 11);
INSERT INTO `wms_shipment_order_detail` VALUES (258, 94, 90, 1.00, NULL, 50, NULL, 0, NULL, NULL, NULL, NULL, NULL, 76, 89, 11);
INSERT INTO `wms_shipment_order_detail` VALUES (260, 97, 92, 1.00, 1.00, 52, NULL, 0, NULL, NULL, NULL, NULL, NULL, 78, 92, 13);
INSERT INTO `wms_shipment_order_detail` VALUES (261, 98, 93, 5.00, NULL, 49, NULL, 0, NULL, NULL, NULL, NULL, NULL, 75, 90, 11);
INSERT INTO `wms_shipment_order_detail` VALUES (262, 98, 92, 4.00, NULL, 52, NULL, 0, NULL, NULL, NULL, NULL, NULL, 78, 92, 11);
INSERT INTO `wms_shipment_order_detail` VALUES (263, 98, 91, 4.00, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 11);
INSERT INTO `wms_shipment_order_detail` VALUES (265, 99, 94, 1.00, 1.00, 49, NULL, 0, NULL, NULL, NULL, NULL, NULL, 75, 90, 13);
INSERT INTO `wms_shipment_order_detail` VALUES (268, 100, 94, 2.00, 1.00, 53, NULL, 0, NULL, NULL, NULL, NULL, NULL, 83, 94, 13);
INSERT INTO `wms_shipment_order_detail` VALUES (269, 100, 93, 2.00, 1.00, 53, NULL, 0, NULL, NULL, NULL, NULL, NULL, 83, 94, 13);
INSERT INTO `wms_shipment_order_detail` VALUES (271, 101, 95, 25.00, 1.00, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 84, NULL, 13);
INSERT INTO `wms_shipment_order_detail` VALUES (272, 103, 95, 1.00, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 83, 94, 11);
INSERT INTO `wms_shipment_order_detail` VALUES (274, 104, 95, 17.00, 1.00, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 84, NULL, 13);
INSERT INTO `wms_shipment_order_detail` VALUES (278, 105, 95, 1.00, 1.00, 49, NULL, 0, NULL, NULL, NULL, NULL, NULL, 84, 96, 11);
INSERT INTO `wms_shipment_order_detail` VALUES (279, 107, 100, 1.00, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 11);
INSERT INTO `wms_shipment_order_detail` VALUES (280, 107, 99, 1.00, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 11);
INSERT INTO `wms_shipment_order_detail` VALUES (281, 108, 99, 6.00, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 11);
INSERT INTO `wms_shipment_order_detail` VALUES (282, 108, 97, 7.00, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 11);
INSERT INTO `wms_shipment_order_detail` VALUES (283, 108, 96, 6.00, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 11);
INSERT INTO `wms_shipment_order_detail` VALUES (284, 109, 100, 1.00, NULL, 53, NULL, 0, NULL, NULL, NULL, NULL, NULL, 83, 94, 11);
INSERT INTO `wms_shipment_order_detail` VALUES (285, 109, 99, 1.00, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 11);
INSERT INTO `wms_shipment_order_detail` VALUES (286, 109, 97, 1.00, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 11);
INSERT INTO `wms_shipment_order_detail` VALUES (287, 109, 96, 1.00, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 11);
INSERT INTO `wms_shipment_order_detail` VALUES (288, 109, 95, 1.00, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 11);
INSERT INTO `wms_shipment_order_detail` VALUES (289, 109, 94, 1.00, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 11);
INSERT INTO `wms_shipment_order_detail` VALUES (290, 109, 93, 1.00, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 11);
INSERT INTO `wms_shipment_order_detail` VALUES (291, 109, 92, 1.00, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 11);
INSERT INTO `wms_shipment_order_detail` VALUES (292, 109, 91, 1.00, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 11);
INSERT INTO `wms_shipment_order_detail` VALUES (293, 109, 90, 1.00, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 11);
INSERT INTO `wms_shipment_order_detail` VALUES (294, 110, 100, 1.00, NULL, 49, NULL, 0, NULL, NULL, NULL, NULL, NULL, 84, 96, 11);
INSERT INTO `wms_shipment_order_detail` VALUES (295, 111, 100, 2.00, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 11);
INSERT INTO `wms_shipment_order_detail` VALUES (298, 112, 100, 1.00, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 11);
INSERT INTO `wms_shipment_order_detail` VALUES (299, 112, 99, 1.00, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 11);
INSERT INTO `wms_shipment_order_detail` VALUES (300, 113, 100, 1.00, NULL, 59, NULL, 0, NULL, NULL, NULL, NULL, NULL, 89, 102, 11);
INSERT INTO `wms_shipment_order_detail` VALUES (302, 114, 101, 1.00, 1.00, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 89, 103, 13);
INSERT INTO `wms_shipment_order_detail` VALUES (303, 115, 101, 1.00, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 11);
INSERT INTO `wms_shipment_order_detail` VALUES (304, 115, 100, 1.00, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 11);
INSERT INTO `wms_shipment_order_detail` VALUES (305, 115, 99, 1.00, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 11);
INSERT INTO `wms_shipment_order_detail` VALUES (310, 118, 103, 1.00, 1.00, 55, NULL, 0, NULL, NULL, NULL, NULL, NULL, 86, 98, 14);
INSERT INTO `wms_shipment_order_detail` VALUES (313, 119, 103, 1.00, 1.00, 55, NULL, 0, NULL, NULL, NULL, NULL, NULL, 86, 98, 13);
INSERT INTO `wms_shipment_order_detail` VALUES (315, 117, 103, 1.00, 1.00, 55, NULL, 0, NULL, NULL, NULL, NULL, NULL, 86, 98, 13);
INSERT INTO `wms_shipment_order_detail` VALUES (316, 116, 102, 1.00, 1.00, 49, NULL, 0, NULL, NULL, NULL, NULL, NULL, 84, 96, 11);
INSERT INTO `wms_shipment_order_detail` VALUES (319, 120, 111, 7.00, 1.00, 67, NULL, 0, NULL, NULL, NULL, NULL, NULL, 102, 116, 12);
INSERT INTO `wms_shipment_order_detail` VALUES (321, 121, 114, 10000.00, 18.00, 67, NULL, 0, NULL, NULL, NULL, NULL, NULL, 102, 116, 11);
INSERT INTO `wms_shipment_order_detail` VALUES (324, 122, 114, 1.00, 1.00, 67, NULL, 0, NULL, NULL, NULL, NULL, NULL, 102, 116, 14);
INSERT INTO `wms_shipment_order_detail` VALUES (325, 123, 111, 1.00, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 11);
INSERT INTO `wms_shipment_order_detail` VALUES (328, 124, 115, 3.00, 1.00, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 105, NULL, 11);
INSERT INTO `wms_shipment_order_detail` VALUES (330, 125, 117, 100.00, 100.00, 68, NULL, 0, NULL, NULL, NULL, NULL, NULL, 106, 118, 13);
INSERT INTO `wms_shipment_order_detail` VALUES (337, 126, 117, 13.00, 1.00, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 107, NULL, 11);
INSERT INTO `wms_shipment_order_detail` VALUES (338, 126, 115, 4.00, 1.00, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 107, NULL, 11);
INSERT INTO `wms_shipment_order_detail` VALUES (341, 127, 117, 101.00, 1.00, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 106, NULL, 13);
INSERT INTO `wms_shipment_order_detail` VALUES (348, 128, 117, 100.00, 100.00, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 105, NULL, 11);
INSERT INTO `wms_shipment_order_detail` VALUES (349, 128, 115, 100.00, 102.00, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 105, NULL, 11);
INSERT INTO `wms_shipment_order_detail` VALUES (352, 130, 117, 1.00, 1.00, 68, NULL, 0, NULL, NULL, NULL, NULL, NULL, 106, 118, 13);
INSERT INTO `wms_shipment_order_detail` VALUES (356, 133, 117, 1.00, 1.00, 68, NULL, 0, NULL, NULL, NULL, NULL, NULL, 106, 118, 13);
INSERT INTO `wms_shipment_order_detail` VALUES (357, 132, 117, 1.00, 1.00, 68, NULL, 0, NULL, NULL, NULL, NULL, NULL, 106, 118, 13);
INSERT INTO `wms_shipment_order_detail` VALUES (358, 129, 117, 1.00, 1.00, 68, NULL, 0, NULL, NULL, NULL, NULL, NULL, 106, 118, 13);
INSERT INTO `wms_shipment_order_detail` VALUES (361, 134, 117, 1.00, 1.00, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 107, NULL, 11);
INSERT INTO `wms_shipment_order_detail` VALUES (362, 134, 115, 1.00, 1.00, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 107, NULL, 11);
INSERT INTO `wms_shipment_order_detail` VALUES (363, 135, 117, 1.00, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 11);
INSERT INTO `wms_shipment_order_detail` VALUES (365, 136, 117, 999.00, 999.00, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 109, 120, 11);
INSERT INTO `wms_shipment_order_detail` VALUES (368, 137, 117, 2.00, NULL, 71, NULL, 0, NULL, NULL, NULL, NULL, NULL, 109, 120, 11);
INSERT INTO `wms_shipment_order_detail` VALUES (371, 138, 117, 1.00, 1.00, 71, NULL, 0, NULL, NULL, NULL, NULL, NULL, 109, 120, 13);
INSERT INTO `wms_shipment_order_detail` VALUES (372, 138, 112, 1.00, 1.00, 66, NULL, 0, NULL, NULL, NULL, NULL, NULL, 101, 115, 13);
INSERT INTO `wms_shipment_order_detail` VALUES (373, 139, 117, 1.00, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 109, NULL, 11);
INSERT INTO `wms_shipment_order_detail` VALUES (374, 139, 115, 1.00, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 11);
INSERT INTO `wms_shipment_order_detail` VALUES (375, 140, 113, 1.00, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 11);
INSERT INTO `wms_shipment_order_detail` VALUES (376, 140, 110, 1.00, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 11);
INSERT INTO `wms_shipment_order_detail` VALUES (378, 141, 118, 200.00, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 11);
INSERT INTO `wms_shipment_order_detail` VALUES (380, 142, 122, 1.00, 1.00, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 115, 125, 13);
INSERT INTO `wms_shipment_order_detail` VALUES (385, 143, 121, 1.00, 1.00, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 111, NULL, 13);
INSERT INTO `wms_shipment_order_detail` VALUES (386, 143, 120, 1.00, 1.00, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 111, NULL, 13);
INSERT INTO `wms_shipment_order_detail` VALUES (387, 144, 121, 1.00, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 111, NULL, 11);
INSERT INTO `wms_shipment_order_detail` VALUES (388, 144, 120, 1.00, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 113, NULL, 11);
INSERT INTO `wms_shipment_order_detail` VALUES (389, 144, 119, 1.00, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 114, NULL, 11);
INSERT INTO `wms_shipment_order_detail` VALUES (390, 144, 118, 1.00, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 113, NULL, 11);
INSERT INTO `wms_shipment_order_detail` VALUES (391, 145, 120, 2.00, NULL, 74, NULL, 0, NULL, NULL, NULL, NULL, NULL, 116, 126, 11);
INSERT INTO `wms_shipment_order_detail` VALUES (393, 146, 123, 1.00, NULL, 74, NULL, 0, NULL, NULL, NULL, NULL, NULL, 116, 126, 11);
INSERT INTO `wms_shipment_order_detail` VALUES (394, 147, 123, 10.00, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 11);
INSERT INTO `wms_shipment_order_detail` VALUES (395, 148, 123, 1.00, NULL, 74, NULL, 0, NULL, NULL, NULL, NULL, NULL, 116, 126, 11);
INSERT INTO `wms_shipment_order_detail` VALUES (418, 150, 125, 300.00, 300.00, 77, NULL, 0, NULL, NULL, NULL, NULL, NULL, 118, 128, 13);
INSERT INTO `wms_shipment_order_detail` VALUES (419, 150, 124, 100.00, 17.00, 79, NULL, 0, NULL, NULL, NULL, NULL, NULL, 119, 131, 13);
INSERT INTO `wms_shipment_order_detail` VALUES (425, 151, 125, 3.00, 1.00, 74, NULL, 0, NULL, NULL, NULL, NULL, NULL, 116, 126, 11);
INSERT INTO `wms_shipment_order_detail` VALUES (426, 151, 124, 2.00, 1.00, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 117, 127, 11);
INSERT INTO `wms_shipment_order_detail` VALUES (432, 149, 125, 100.00, 1.00, 75, NULL, 0, NULL, NULL, NULL, NULL, NULL, 119, 131, 11);
INSERT INTO `wms_shipment_order_detail` VALUES (433, 149, 124, 19.00, 1.00, 76, NULL, 0, NULL, NULL, NULL, NULL, NULL, 119, 131, 11);
INSERT INTO `wms_shipment_order_detail` VALUES (434, 152, 117, 1.00, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 11);
INSERT INTO `wms_shipment_order_detail` VALUES (435, 153, 125, 2.00, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 117, 127, 11);
INSERT INTO `wms_shipment_order_detail` VALUES (436, 153, 124, 2.00, NULL, 77, NULL, 0, NULL, NULL, NULL, NULL, NULL, 120, 128, 11);
INSERT INTO `wms_shipment_order_detail` VALUES (439, 154, 125, 2.00, 1.00, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 118, NULL, 13);
INSERT INTO `wms_shipment_order_detail` VALUES (441, 155, 125, 10.00, 1.00, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 117, NULL, 13);
INSERT INTO `wms_shipment_order_detail` VALUES (443, 156, 125, 200.00, 1.00, 78, NULL, 0, NULL, NULL, NULL, NULL, NULL, 118, 129, 13);
INSERT INTO `wms_shipment_order_detail` VALUES (446, 157, 127, 9.00, 8.00, 90, NULL, 0, NULL, NULL, NULL, NULL, NULL, 122, 135, 13);
INSERT INTO `wms_shipment_order_detail` VALUES (450, 158, 127, 1.00, 1.00, 90, NULL, 0, NULL, NULL, NULL, NULL, NULL, 122, 135, 13);
INSERT INTO `wms_shipment_order_detail` VALUES (451, 159, 130, 90998.00, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 117, 127, 11);
INSERT INTO `wms_shipment_order_detail` VALUES (461, 161, 130, 1.00, NULL, 89, NULL, 0, NULL, NULL, NULL, NULL, NULL, 121, 134, 11);
INSERT INTO `wms_shipment_order_detail` VALUES (462, 161, 129, 1.00, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 11);
INSERT INTO `wms_shipment_order_detail` VALUES (463, 161, 128, 1.00, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 11);
INSERT INTO `wms_shipment_order_detail` VALUES (464, 161, 127, 1.00, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 11);
INSERT INTO `wms_shipment_order_detail` VALUES (465, 161, 126, 1.00, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 11);
INSERT INTO `wms_shipment_order_detail` VALUES (466, 161, 125, 1.00, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 11);
INSERT INTO `wms_shipment_order_detail` VALUES (467, 161, 124, 1.00, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 11);
INSERT INTO `wms_shipment_order_detail` VALUES (471, 162, 130, 2.00, 1.00, 89, NULL, 0, NULL, NULL, NULL, NULL, NULL, 121, 134, 13);
INSERT INTO `wms_shipment_order_detail` VALUES (472, 163, 130, 1.00, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 11);
INSERT INTO `wms_shipment_order_detail` VALUES (473, 163, 129, 1.00, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 11);
INSERT INTO `wms_shipment_order_detail` VALUES (474, 163, 128, 1.00, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 11);
INSERT INTO `wms_shipment_order_detail` VALUES (475, 160, 130, 1.00, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 117, 127, 11);
INSERT INTO `wms_shipment_order_detail` VALUES (476, 160, 129, 1.00, NULL, 89, NULL, 0, NULL, NULL, NULL, NULL, NULL, 121, 134, 11);
INSERT INTO `wms_shipment_order_detail` VALUES (478, 164, 133, 10.00, 1.00, 92, NULL, 0, NULL, NULL, NULL, NULL, NULL, 117, 136, 13);
INSERT INTO `wms_shipment_order_detail` VALUES (480, 165, 133, 9.00, 1.00, 92, NULL, 0, NULL, NULL, NULL, NULL, NULL, 117, 136, 13);
INSERT INTO `wms_shipment_order_detail` VALUES (482, 166, 133, 10.00, 1.00, 92, NULL, 0, NULL, NULL, NULL, NULL, NULL, 117, 136, 13);
INSERT INTO `wms_shipment_order_detail` VALUES (484, 167, 133, 1.00, 1.00, 92, NULL, 0, NULL, NULL, NULL, NULL, NULL, 117, 136, 13);
INSERT INTO `wms_shipment_order_detail` VALUES (493, 168, 133, 7.00, 1.00, 92, NULL, 0, NULL, NULL, NULL, NULL, NULL, 117, 136, 13);
INSERT INTO `wms_shipment_order_detail` VALUES (494, 168, 128, 7.00, 1.00, 91, NULL, 0, NULL, NULL, NULL, NULL, NULL, 122, 135, 13);
INSERT INTO `wms_shipment_order_detail` VALUES (497, 170, 134, 10.00, 7.00, 94, NULL, 0, NULL, NULL, NULL, NULL, NULL, 131, 142, 13);
INSERT INTO `wms_shipment_order_detail` VALUES (499, 171, 134, 3.00, 3.00, 94, NULL, 0, NULL, NULL, NULL, NULL, NULL, 131, 142, 13);
INSERT INTO `wms_shipment_order_detail` VALUES (500, 172, 135, 6.00, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 133, NULL, 11);
INSERT INTO `wms_shipment_order_detail` VALUES (501, 172, 134, 7.00, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 133, NULL, 11);
INSERT INTO `wms_shipment_order_detail` VALUES (502, 173, 136, 5.00, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 11);
INSERT INTO `wms_shipment_order_detail` VALUES (503, 174, 136, 6.00, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 11);
INSERT INTO `wms_shipment_order_detail` VALUES (505, 175, 138, 1.00, 1.00, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 134, 144, 13);
INSERT INTO `wms_shipment_order_detail` VALUES (508, 176, 140, 2.00, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 135, 147, 11);
INSERT INTO `wms_shipment_order_detail` VALUES (510, 177, 140, 15.00, 1.00, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 135, 147, 13);
INSERT INTO `wms_shipment_order_detail` VALUES (512, 178, 140, 4.00, 4.00, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 135, 147, 13);
INSERT INTO `wms_shipment_order_detail` VALUES (513, 179, 140, 123.00, NULL, 96, NULL, 0, NULL, NULL, NULL, NULL, NULL, 135, 147, 11);
INSERT INTO `wms_shipment_order_detail` VALUES (514, 180, 140, 3.00, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 11);
INSERT INTO `wms_shipment_order_detail` VALUES (515, 181, 139, 10.00, NULL, 98, NULL, 0, NULL, NULL, NULL, NULL, NULL, 137, 148, 11);
INSERT INTO `wms_shipment_order_detail` VALUES (517, 182, 142, 100.00, 100.00, 97, NULL, 0, NULL, NULL, NULL, NULL, NULL, 135, 147, 13);
INSERT INTO `wms_shipment_order_detail` VALUES (523, 184, 142, 200.00, 50.00, 97, NULL, 0, NULL, NULL, NULL, NULL, NULL, 135, 147, 12);
INSERT INTO `wms_shipment_order_detail` VALUES (526, 185, 142, 999999.00, 1.00, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 136, 145, 11);
INSERT INTO `wms_shipment_order_detail` VALUES (527, 185, 136, 1.00, 1.00, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 11);
INSERT INTO `wms_shipment_order_detail` VALUES (528, 186, 142, 4.00, NULL, 98, NULL, 0, NULL, NULL, NULL, NULL, NULL, 137, 148, 11);
INSERT INTO `wms_shipment_order_detail` VALUES (529, 186, 141, 4.00, NULL, 98, NULL, 0, NULL, NULL, NULL, NULL, NULL, 137, 148, 11);
INSERT INTO `wms_shipment_order_detail` VALUES (530, 183, 142, 1.00, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 139, NULL, 11);
INSERT INTO `wms_shipment_order_detail` VALUES (531, 183, 141, 1.00, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 136, 145, 11);
INSERT INTO `wms_shipment_order_detail` VALUES (532, 183, 138, 1.00, NULL, 98, NULL, 0, NULL, NULL, NULL, NULL, NULL, 137, 148, 11);
INSERT INTO `wms_shipment_order_detail` VALUES (533, 183, 137, 1.00, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 139, NULL, 11);
INSERT INTO `wms_shipment_order_detail` VALUES (534, 187, 141, 1.00, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 11);
INSERT INTO `wms_shipment_order_detail` VALUES (535, 188, 136, 2.00, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 11);
INSERT INTO `wms_shipment_order_detail` VALUES (536, 188, 124, 1.00, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 11);
INSERT INTO `wms_shipment_order_detail` VALUES (537, 188, 115, 1.00, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 11);
INSERT INTO `wms_shipment_order_detail` VALUES (538, 189, 143, 1.00, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 11);
INSERT INTO `wms_shipment_order_detail` VALUES (547, 190, 140, 999.00, 5.00, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 139, NULL, 11);
INSERT INTO `wms_shipment_order_detail` VALUES (548, 190, 139, 19999.00, 3.00, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 140, NULL, 11);
INSERT INTO `wms_shipment_order_detail` VALUES (549, 190, 138, 1999.00, 1.00, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 138, NULL, 11);
INSERT INTO `wms_shipment_order_detail` VALUES (550, 190, 137, 1999.00, 1.00, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 139, NULL, 11);
INSERT INTO `wms_shipment_order_detail` VALUES (551, 190, 143, 19999.00, 1.00, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 140, NULL, 11);
INSERT INTO `wms_shipment_order_detail` VALUES (552, 190, 142, 1999.00, 1.00, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 138, NULL, 11);
INSERT INTO `wms_shipment_order_detail` VALUES (553, 190, 141, 19.00, 1.00, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 139, NULL, 11);
INSERT INTO `wms_shipment_order_detail` VALUES (554, 190, 136, 1999.00, 1.00, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 138, NULL, 11);
INSERT INTO `wms_shipment_order_detail` VALUES (555, 191, 142, 1.00, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 140, NULL, 11);
INSERT INTO `wms_shipment_order_detail` VALUES (556, 192, 142, 5.00, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 140, NULL, 11);
INSERT INTO `wms_shipment_order_detail` VALUES (562, 194, 143, 1.00, 1.00, 97, NULL, 0, NULL, NULL, NULL, NULL, NULL, 135, 147, 13);
INSERT INTO `wms_shipment_order_detail` VALUES (565, 196, 145, 1.00, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 11);
INSERT INTO `wms_shipment_order_detail` VALUES (566, 196, 142, 1.00, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 11);
INSERT INTO `wms_shipment_order_detail` VALUES (567, 197, 145, 1.00, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 11);
INSERT INTO `wms_shipment_order_detail` VALUES (569, 195, 143, 1.00, 1.00, 96, NULL, 0, NULL, NULL, NULL, NULL, NULL, 136, 145, 13);
INSERT INTO `wms_shipment_order_detail` VALUES (572, 199, 145, 3.00, 3.00, 99, NULL, 0, NULL, NULL, NULL, NULL, NULL, 149, 151, 13);
INSERT INTO `wms_shipment_order_detail` VALUES (573, 193, 142, 188.00, 1.00, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 139, NULL, 11);
INSERT INTO `wms_shipment_order_detail` VALUES (576, 200, 147, 30.00, 30.00, 100, NULL, 0, NULL, NULL, NULL, NULL, NULL, 154, 152, 13);
INSERT INTO `wms_shipment_order_detail` VALUES (579, 201, 148, 3.00, 1.00, 102, NULL, 0, NULL, NULL, NULL, NULL, NULL, 155, 153, 13);
INSERT INTO `wms_shipment_order_detail` VALUES (583, 202, 148, 1.00, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 138, 150, 11);
INSERT INTO `wms_shipment_order_detail` VALUES (584, 202, 147, 1.00, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 11);
INSERT INTO `wms_shipment_order_detail` VALUES (585, 202, 146, 1.00, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 11);
INSERT INTO `wms_shipment_order_detail` VALUES (595, 205, 148, 1.00, 1.00, 98, NULL, 0, NULL, NULL, NULL, NULL, NULL, 137, 148, 11);
INSERT INTO `wms_shipment_order_detail` VALUES (598, 206, 156, 150.00, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 165, 157, 11);
INSERT INTO `wms_shipment_order_detail` VALUES (599, 206, 146, 5.00, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 163, 156, 11);
INSERT INTO `wms_shipment_order_detail` VALUES (600, 198, 145, 1.00, 1.00, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 139, NULL, 11);
INSERT INTO `wms_shipment_order_detail` VALUES (609, 208, 159, 1000000.00, 1.00, 98, NULL, 0, NULL, NULL, NULL, NULL, NULL, 137, 148, 11);
INSERT INTO `wms_shipment_order_detail` VALUES (652, 209, 160, 1.00, NULL, 98, NULL, 0, NULL, NULL, NULL, NULL, NULL, 137, 148, 11);
INSERT INTO `wms_shipment_order_detail` VALUES (653, 209, 158, 1.00, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 139, NULL, 11);
INSERT INTO `wms_shipment_order_detail` VALUES (654, 209, 157, 1.00, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 140, NULL, 11);
INSERT INTO `wms_shipment_order_detail` VALUES (655, 209, 156, 1.00, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 11);
INSERT INTO `wms_shipment_order_detail` VALUES (656, 209, 155, 1.00, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 11);
INSERT INTO `wms_shipment_order_detail` VALUES (657, 209, 152, 1.00, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 11);
INSERT INTO `wms_shipment_order_detail` VALUES (658, 209, 151, 1.00, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 11);
INSERT INTO `wms_shipment_order_detail` VALUES (659, 209, 150, 1.00, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 11);
INSERT INTO `wms_shipment_order_detail` VALUES (660, 209, 149, 1.00, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 11);
INSERT INTO `wms_shipment_order_detail` VALUES (664, 204, 143, 5.00, 1.00, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 139, NULL, 11);
INSERT INTO `wms_shipment_order_detail` VALUES (665, 211, 155, 1.00, NULL, 104, NULL, 0, NULL, NULL, NULL, NULL, NULL, 139, 155, 11);
INSERT INTO `wms_shipment_order_detail` VALUES (666, 211, 154, 1.00, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 143, NULL, 11);
INSERT INTO `wms_shipment_order_detail` VALUES (667, 203, 148, 1.00, 1.00, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 11);
INSERT INTO `wms_shipment_order_detail` VALUES (668, 203, 147, 1.00, 1.00, 100, NULL, 0, NULL, NULL, NULL, NULL, NULL, 154, 152, 11);
INSERT INTO `wms_shipment_order_detail` VALUES (669, 203, 146, 1.00, 1.00, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 11);
INSERT INTO `wms_shipment_order_detail` VALUES (670, 207, 152, 1.00, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 138, 150, 11);
INSERT INTO `wms_shipment_order_detail` VALUES (671, 207, 151, 1000.00, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 11);
INSERT INTO `wms_shipment_order_detail` VALUES (672, 207, 150, 1.00, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 11);
INSERT INTO `wms_shipment_order_detail` VALUES (673, 210, 162, 1.00, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 138, 150, 11);
INSERT INTO `wms_shipment_order_detail` VALUES (674, 210, 158, 1.00, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 11);
INSERT INTO `wms_shipment_order_detail` VALUES (675, 210, 157, 1.00, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 11);
INSERT INTO `wms_shipment_order_detail` VALUES (676, 210, 156, 1.00, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 11);
INSERT INTO `wms_shipment_order_detail` VALUES (677, 210, 155, 1.00, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 11);
INSERT INTO `wms_shipment_order_detail` VALUES (678, 210, 154, 1.00, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 11);
INSERT INTO `wms_shipment_order_detail` VALUES (679, 210, 152, 1.00, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 11);
INSERT INTO `wms_shipment_order_detail` VALUES (680, 210, 151, 1.00, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 11);
INSERT INTO `wms_shipment_order_detail` VALUES (681, 210, 150, 1.00, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 11);
INSERT INTO `wms_shipment_order_detail` VALUES (682, 210, 149, 1.00, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 11);
INSERT INTO `wms_shipment_order_detail` VALUES (683, 212, 156, 1.00, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 140, 145, 11);
INSERT INTO `wms_shipment_order_detail` VALUES (684, 212, 155, 1.00, NULL, 110, NULL, 0, NULL, NULL, NULL, NULL, NULL, 138, 160, 11);
INSERT INTO `wms_shipment_order_detail` VALUES (689, 215, 162, 3.00, 1.00, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 138, 160, 13);
INSERT INTO `wms_shipment_order_detail` VALUES (691, 216, 162, 1.00, 1.00, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 138, 160, 13);
INSERT INTO `wms_shipment_order_detail` VALUES (695, 218, 157, 200.00, 1.00, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 139, NULL, 12);
INSERT INTO `wms_shipment_order_detail` VALUES (697, 219, 163, 50.00, 20.00, 110, NULL, 0, NULL, NULL, NULL, NULL, NULL, 138, 160, 13);
INSERT INTO `wms_shipment_order_detail` VALUES (698, 213, 162, 1.00, NULL, 107, NULL, 0, NULL, NULL, NULL, NULL, NULL, 139, 155, 11);
INSERT INTO `wms_shipment_order_detail` VALUES (699, 213, 157, 2.00, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 11);
INSERT INTO `wms_shipment_order_detail` VALUES (707, 221, 158, 1.00, 1.00, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 11);
INSERT INTO `wms_shipment_order_detail` VALUES (708, 221, 162, 1.00, 1.00, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 138, 160, 11);
INSERT INTO `wms_shipment_order_detail` VALUES (709, 223, 162, 2.00, NULL, 104, NULL, 0, NULL, NULL, NULL, NULL, NULL, 139, 155, 11);
INSERT INTO `wms_shipment_order_detail` VALUES (710, 220, 162, 11111.00, 1.00, 107, NULL, 0, NULL, NULL, NULL, NULL, NULL, 139, 155, 11);
INSERT INTO `wms_shipment_order_detail` VALUES (712, 224, 162, 1.00, 1.00, 107, NULL, 0, NULL, NULL, NULL, NULL, NULL, 139, 155, 13);
INSERT INTO `wms_shipment_order_detail` VALUES (715, 225, 168, 1.00, 1.00, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 181, NULL, 13);
INSERT INTO `wms_shipment_order_detail` VALUES (716, 217, 162, 1.00, 1.00, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 138, 160, 12);
INSERT INTO `wms_shipment_order_detail` VALUES (719, 226, 169, 10.00, 1.00, 113, NULL, 0, NULL, NULL, NULL, NULL, NULL, 184, 169, 13);
INSERT INTO `wms_shipment_order_detail` VALUES (722, 227, 170, 1.00, 1.00, 114, NULL, 0, NULL, NULL, NULL, NULL, NULL, 185, 170, 13);
INSERT INTO `wms_shipment_order_detail` VALUES (725, 228, 162, 1.00, 1.00, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 147, NULL, 13);
INSERT INTO `wms_shipment_order_detail` VALUES (728, 229, 170, 2544444.00, 1.00, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 152, NULL, 11);
INSERT INTO `wms_shipment_order_detail` VALUES (729, 230, 170, 1000000.00, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 147, NULL, 11);
INSERT INTO `wms_shipment_order_detail` VALUES (730, 230, 169, 1000000.00, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 147, NULL, 11);
INSERT INTO `wms_shipment_order_detail` VALUES (731, 231, 169, 1.00, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 11);
INSERT INTO `wms_shipment_order_detail` VALUES (732, 232, 171, 1.00, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 154, NULL, 11);
INSERT INTO `wms_shipment_order_detail` VALUES (735, 236, 172, 3.00, 1.00, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 154, NULL, 13);
INSERT INTO `wms_shipment_order_detail` VALUES (739, 237, 173, 20.00, 1.00, 115, NULL, 0, NULL, NULL, NULL, NULL, NULL, 178, 176, 13);
INSERT INTO `wms_shipment_order_detail` VALUES (742, 238, 173, 11.00, 1.00, 115, NULL, 0, NULL, NULL, NULL, NULL, NULL, 178, 176, 14);
INSERT INTO `wms_shipment_order_detail` VALUES (743, 235, 172, 1.00, 1.00, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 157, NULL, 12);
INSERT INTO `wms_shipment_order_detail` VALUES (746, 239, 173, 2.00, 1.00, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 160, NULL, 11);
INSERT INTO `wms_shipment_order_detail` VALUES (747, 239, 172, 3.00, 1.00, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 158, NULL, 11);
INSERT INTO `wms_shipment_order_detail` VALUES (748, 234, 178, 1.00, NULL, 116, NULL, 0, NULL, NULL, NULL, NULL, NULL, 192, 178, 11);
INSERT INTO `wms_shipment_order_detail` VALUES (749, 234, 176, 1.00, NULL, 117, NULL, 0, NULL, NULL, NULL, NULL, NULL, 193, 180, 11);
INSERT INTO `wms_shipment_order_detail` VALUES (752, 240, 178, 1.00, 1.00, 116, NULL, 0, NULL, NULL, NULL, NULL, NULL, 192, 178, 11);
INSERT INTO `wms_shipment_order_detail` VALUES (753, 240, 176, 1.00, 1.00, 116, NULL, 0, NULL, NULL, NULL, NULL, NULL, 192, 178, 11);
INSERT INTO `wms_shipment_order_detail` VALUES (756, 241, 180, 1.00, 1.00, 118, NULL, 0, NULL, NULL, NULL, NULL, NULL, 194, 181, 11);
INSERT INTO `wms_shipment_order_detail` VALUES (757, 243, 180, 1.00, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 196, NULL, 11);
INSERT INTO `wms_shipment_order_detail` VALUES (759, 244, 180, 4.00, 1.00, 117, NULL, 0, NULL, NULL, NULL, NULL, NULL, 193, 180, 11);
INSERT INTO `wms_shipment_order_detail` VALUES (760, 245, 180, 1.00, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 11);
INSERT INTO `wms_shipment_order_detail` VALUES (763, 246, 180, 10.00, 10.00, 122, NULL, 0, NULL, NULL, NULL, NULL, NULL, 198, 185, 13);
INSERT INTO `wms_shipment_order_detail` VALUES (765, 247, 182, 1.00, 1.00, 118, NULL, 0, NULL, NULL, NULL, NULL, NULL, 194, 181, 13);
INSERT INTO `wms_shipment_order_detail` VALUES (766, 248, 182, 1.00, NULL, 124, NULL, 0, NULL, NULL, NULL, NULL, NULL, 193, 178, 11);
INSERT INTO `wms_shipment_order_detail` VALUES (773, 252, 182, 7.00, NULL, 118, NULL, 0, NULL, NULL, NULL, NULL, NULL, 194, 181, 11);
INSERT INTO `wms_shipment_order_detail` VALUES (774, 249, 182, 1.00, 1.00, 124, NULL, 0, NULL, NULL, NULL, NULL, NULL, 193, 178, 11);
INSERT INTO `wms_shipment_order_detail` VALUES (779, 253, 182, 1.00, 1.00, 118, NULL, 0, NULL, NULL, NULL, NULL, NULL, 194, 181, 13);
INSERT INTO `wms_shipment_order_detail` VALUES (780, 253, 181, 1.00, 1.00, 116, NULL, 0, NULL, NULL, NULL, NULL, NULL, 193, 178, 13);
INSERT INTO `wms_shipment_order_detail` VALUES (799, 250, 182, 1.00, 1.00, 118, NULL, 0, NULL, NULL, NULL, NULL, NULL, 194, 181, 13);
INSERT INTO `wms_shipment_order_detail` VALUES (800, 250, 181, 1.00, 1.00, 119, NULL, 0, NULL, NULL, NULL, NULL, NULL, 195, 182, 14);
INSERT INTO `wms_shipment_order_detail` VALUES (801, 250, 180, 1.00, 1.00, 118, NULL, 0, NULL, NULL, NULL, NULL, NULL, 194, 181, 13);
INSERT INTO `wms_shipment_order_detail` VALUES (803, 254, 181, 2.00, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 11);
INSERT INTO `wms_shipment_order_detail` VALUES (804, 255, 181, 26.00, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 11);
INSERT INTO `wms_shipment_order_detail` VALUES (805, 256, 184, 1.00, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 11);
INSERT INTO `wms_shipment_order_detail` VALUES (806, 256, 182, 1.00, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 11);
INSERT INTO `wms_shipment_order_detail` VALUES (807, 256, 181, 1.00, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 11);
INSERT INTO `wms_shipment_order_detail` VALUES (808, 257, 184, 1.00, NULL, 122, NULL, 0, NULL, NULL, NULL, NULL, NULL, 198, 185, 11);
INSERT INTO `wms_shipment_order_detail` VALUES (810, 259, 185, 12.00, 1.00, 127, NULL, 0, NULL, NULL, NULL, NULL, NULL, 215, 189, 13);
INSERT INTO `wms_shipment_order_detail` VALUES (812, 260, 185, 1.00, 1.00, 118, NULL, 0, NULL, NULL, NULL, NULL, NULL, 194, 181, 13);
INSERT INTO `wms_shipment_order_detail` VALUES (813, 251, 182, 1.00, 1.00, 118, NULL, 0, NULL, NULL, NULL, NULL, NULL, 194, 181, 13);
INSERT INTO `wms_shipment_order_detail` VALUES (814, 251, 181, 1.00, 1.00, 116, NULL, 0, NULL, NULL, NULL, NULL, NULL, 193, 178, 13);
INSERT INTO `wms_shipment_order_detail` VALUES (815, 251, 180, 1.00, 1.00, 122, NULL, 0, NULL, NULL, NULL, NULL, NULL, 198, 185, 13);
INSERT INTO `wms_shipment_order_detail` VALUES (816, 251, 178, 1.00, 1.00, 116, NULL, 0, NULL, NULL, NULL, NULL, NULL, 192, 178, 13);
INSERT INTO `wms_shipment_order_detail` VALUES (818, 261, 186, 8.00, 8.00, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 196, 183, 13);
INSERT INTO `wms_shipment_order_detail` VALUES (855, 258, 186, 2.00, 2.00, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 196, 183, 13);
INSERT INTO `wms_shipment_order_detail` VALUES (856, 258, 183, 1.00, 1.00, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 14);
INSERT INTO `wms_shipment_order_detail` VALUES (857, 258, 182, 1.00, 1.00, 118, NULL, 0, NULL, NULL, NULL, NULL, NULL, 194, 181, 12);
INSERT INTO `wms_shipment_order_detail` VALUES (858, 258, 181, 1.00, 1.00, 116, NULL, 0, NULL, NULL, NULL, NULL, NULL, 193, 178, 11);
INSERT INTO `wms_shipment_order_detail` VALUES (859, 258, 180, 1.00, 1.00, 122, NULL, 0, NULL, NULL, NULL, NULL, NULL, 198, 185, 11);
INSERT INTO `wms_shipment_order_detail` VALUES (860, 258, 178, 1.00, 1.00, 116, NULL, 0, NULL, NULL, NULL, NULL, NULL, 192, 178, 11);
INSERT INTO `wms_shipment_order_detail` VALUES (861, 258, 176, 1.00, 1.00, 116, NULL, 0, NULL, NULL, NULL, NULL, NULL, 192, 178, 11);
INSERT INTO `wms_shipment_order_detail` VALUES (862, 262, 187, 1.00, 1.00, 117, NULL, 0, NULL, NULL, NULL, NULL, NULL, 194, 181, 11);
INSERT INTO `wms_shipment_order_detail` VALUES (863, 262, 186, 1.00, 1.00, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 196, 183, 11);
INSERT INTO `wms_shipment_order_detail` VALUES (864, 262, 183, 1.00, 1.00, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 11);
INSERT INTO `wms_shipment_order_detail` VALUES (865, 262, 182, 1.00, 1.00, 118, NULL, 0, NULL, NULL, NULL, NULL, NULL, 194, 181, 11);
INSERT INTO `wms_shipment_order_detail` VALUES (866, 262, 181, 1.00, 1.00, 116, NULL, 0, NULL, NULL, NULL, NULL, NULL, 193, 178, 11);
INSERT INTO `wms_shipment_order_detail` VALUES (867, 262, 180, 1.00, 1.00, 122, NULL, 0, NULL, NULL, NULL, NULL, NULL, 198, 185, 11);
INSERT INTO `wms_shipment_order_detail` VALUES (868, 262, 178, 1.00, 1.00, 116, NULL, 0, NULL, NULL, NULL, NULL, NULL, 192, 178, 11);
INSERT INTO `wms_shipment_order_detail` VALUES (869, 262, 176, 1.00, 1.00, 116, NULL, 0, NULL, NULL, NULL, NULL, NULL, 192, 178, 11);
INSERT INTO `wms_shipment_order_detail` VALUES (870, 263, 188, 1.00, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 11);
INSERT INTO `wms_shipment_order_detail` VALUES (871, 263, 187, 1.00, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 11);
INSERT INTO `wms_shipment_order_detail` VALUES (872, 263, 186, 1.00, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 11);
INSERT INTO `wms_shipment_order_detail` VALUES (877, 268, 193, 1.00, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 11);
INSERT INTO `wms_shipment_order_detail` VALUES (878, 268, 191, 1.00, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 11);
INSERT INTO `wms_shipment_order_detail` VALUES (879, 269, 193, 1.00, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 230, NULL, 11);
INSERT INTO `wms_shipment_order_detail` VALUES (880, 269, 191, 1.00, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 11);
INSERT INTO `wms_shipment_order_detail` VALUES (881, 269, 190, 1.00, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 11);
INSERT INTO `wms_shipment_order_detail` VALUES (882, 269, 189, 1.00, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 11);
INSERT INTO `wms_shipment_order_detail` VALUES (883, 270, 193, 1.00, NULL, NULL, 8.00, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 11);
INSERT INTO `wms_shipment_order_detail` VALUES (884, 270, 191, 1.00, NULL, NULL, 4.00, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 11);
INSERT INTO `wms_shipment_order_detail` VALUES (885, 270, 190, 1.00, NULL, NULL, 4.00, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 11);
INSERT INTO `wms_shipment_order_detail` VALUES (886, 270, 189, 1.00, NULL, NULL, 4.00, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 11);
INSERT INTO `wms_shipment_order_detail` VALUES (887, 271, 193, 1.00, NULL, NULL, 1800.00, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 11);
INSERT INTO `wms_shipment_order_detail` VALUES (888, 272, 193, 4.00, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 234, 221, 11);

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
) ENGINE = InnoDB AUTO_INCREMENT = 53 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '供应商' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wms_supplier
-- ----------------------------
INSERT INTO `wms_supplier` VALUES (1, 'youda', '友达光电', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '第一级', NULL, NULL, 1, 1, '2022-08-19 09:08:03.000', 115, '2022-11-25 20:29:35.345');
INSERT INTO `wms_supplier` VALUES (2, 'huawei', '华为', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '第一级', NULL, NULL, 1, 1, '2022-09-07 17:15:38.364', NULL, NULL);
INSERT INTO `wms_supplier` VALUES (3, 'ximenzi', '西门子', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, '2022-09-07 17:15:49.629', NULL, NULL);
INSERT INTO `wms_supplier` VALUES (4, 'aike', '艾克', NULL, NULL, NULL, 'AAA', '1354175285', '8054152', 'A', '第二级', 'A', 'A', 1, 115, '2022-11-10 16:56:27.364', NULL, NULL);
INSERT INTO `wms_supplier` VALUES (5, '11', '222', NULL, NULL, NULL, NULL, 'fgfgf', NULL, NULL, NULL, NULL, NULL, 1, 115, '2022-11-21 10:01:08.627', NULL, NULL);
INSERT INTO `wms_supplier` VALUES (6, 'G10000', 'ddd', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 115, '2022-12-05 16:01:39.771', NULL, NULL);
INSERT INTO `wms_supplier` VALUES (7, '1', '博世', NULL, NULL, NULL, '祥符', NULL, NULL, NULL, NULL, NULL, NULL, 1, 115, '2022-12-10 14:53:22.000', 115, '2022-12-30 12:22:40.787');
INSERT INTO `wms_supplier` VALUES (8, '2', '英飞凌', NULL, NULL, NULL, '祥符', NULL, NULL, NULL, NULL, NULL, NULL, 1, 115, '2022-12-13 15:28:29.000', 115, '2022-12-30 12:22:57.832');
INSERT INTO `wms_supplier` VALUES (9, '123', '123', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 115, '2022-12-28 21:02:07.589', NULL, NULL);
INSERT INTO `wms_supplier` VALUES (10, '8', '供应商', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 115, '2023-01-03 13:50:27.000', 115, '2023-01-05 16:41:34.448');
INSERT INTO `wms_supplier` VALUES (11, '01', '焦作市公司', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 115, '2023-01-06 16:57:16.000', 115, '2023-01-09 00:53:25.267');
INSERT INTO `wms_supplier` VALUES (12, '01', '供应商2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 115, '2023-01-06 16:57:24.396', NULL, NULL);
INSERT INTO `wms_supplier` VALUES (13, '02', '在线商城', NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 1, 115, '2023-01-07 14:01:28.000', 115, '2023-01-28 17:47:14.412');
INSERT INTO `wms_supplier` VALUES (14, '03', '淘宝修改后', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 115, '2023-01-09 00:58:01.000', 115, '2023-01-09 01:02:54.994');
INSERT INTO `wms_supplier` VALUES (15, '03', '淘宝修改后', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 115, '2023-01-09 01:07:14.000', 115, '2023-01-09 01:07:48.019');
INSERT INTO `wms_supplier` VALUES (16, '1', '供应商', NULL, NULL, NULL, '会计核算法国人付好款', '15463126', '33262', '215623252', '第一级', NULL, NULL, 1, 115, '2023-02-01 13:43:09.000', 115, '2023-02-01 22:04:57.844');
INSERT INTO `wms_supplier` VALUES (17, '2', '供应商2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 115, '2023-02-06 10:13:44.464', NULL, NULL);
INSERT INTO `wms_supplier` VALUES (18, '001', '哈尔滨千合', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '第一级', NULL, NULL, 1, 115, '2023-02-06 14:00:00.505', NULL, NULL);
INSERT INTO `wms_supplier` VALUES (19, '23020600001', '生产机台', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 115, '2023-02-06 15:20:26.000', 115, '2023-02-16 09:08:31.528');
INSERT INTO `wms_supplier` VALUES (20, '74564987', '联想配件供应商', NULL, NULL, NULL, '北京科技园', NULL, NULL, NULL, '第一级', NULL, NULL, 1, 115, '2023-02-08 09:13:21.482', NULL, NULL);
INSERT INTO `wms_supplier` VALUES (21, '444', '444', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 115, '2023-02-09 11:36:13.446', NULL, NULL);
INSERT INTO `wms_supplier` VALUES (22, '45', '44', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 115, '2023-02-09 11:36:17.000', 115, '2023-02-18 00:29:56.669');
INSERT INTO `wms_supplier` VALUES (23, '44', '44', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 115, '2023-02-09 11:36:20.870', NULL, NULL);
INSERT INTO `wms_supplier` VALUES (24, '44', '44', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 115, '2023-02-09 11:36:24.163', NULL, NULL);
INSERT INTO `wms_supplier` VALUES (25, '44', '44', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 115, '2023-02-09 11:36:28.378', NULL, NULL);
INSERT INTO `wms_supplier` VALUES (26, '44', '44', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 115, '2023-02-09 11:36:43.981', NULL, NULL);
INSERT INTO `wms_supplier` VALUES (27, '44', '44', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 115, '2023-02-09 11:36:49.755', NULL, NULL);
INSERT INTO `wms_supplier` VALUES (28, '44', '44', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 115, '2023-02-09 11:36:58.366', NULL, NULL);
INSERT INTO `wms_supplier` VALUES (29, '01', '广州雅量科技有限公司', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 115, '2023-02-10 15:46:02.000', 115, '2023-02-10 15:55:30.698');
INSERT INTO `wms_supplier` VALUES (30, '963258', '供应商2', NULL, NULL, NULL, '天朝', '13288888888', '123456', '王霸天', '第一级', 'za.r.a.e.l.l.i.s.33@gmail.com', NULL, 1, 115, '2023-02-15 15:00:20.077', NULL, NULL);
INSERT INTO `wms_supplier` VALUES (31, '1001', '青丘特供', NULL, NULL, NULL, '东荒青丘', '1380001234', NULL, NULL, NULL, '123456@qq.com', NULL, 1, 115, '2023-02-26 13:32:57.046', NULL, NULL);
INSERT INTO `wms_supplier` VALUES (32, 'g_001', 'g_test', NULL, NULL, NULL, NULL, '1234567890', NULL, NULL, NULL, NULL, NULL, 1, 115, '2023-02-27 10:32:47.000', 115, '2023-03-13 14:04:49.156');
INSERT INTO `wms_supplier` VALUES (33, '国贸', '国贸', NULL, NULL, NULL, '12', '12', '123', '123', '第一级', '123', '132', 1, 115, '2023-03-01 17:57:58.000', 115, '2023-03-10 15:02:45.150');
INSERT INTO `wms_supplier` VALUES (34, '电机供应商', '电机供应商', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 115, '2023-03-01 17:58:45.476', NULL, NULL);
INSERT INTO `wms_supplier` VALUES (35, 'A001', '青岛新材料有限公司', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 115, '2023-03-03 21:32:36.706', NULL, NULL);
INSERT INTO `wms_supplier` VALUES (36, 'g_002', 'g_002test', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 115, '2023-03-12 15:53:50.633', NULL, NULL);
INSERT INTO `wms_supplier` VALUES (37, 'x', 'x', NULL, NULL, NULL, 'x', NULL, 'x', NULL, '第一级', NULL, 'x', 1, 115, '2023-03-20 20:55:03.226', NULL, NULL);
INSERT INTO `wms_supplier` VALUES (38, '001', '天升', NULL, NULL, NULL, '11', NULL, NULL, NULL, NULL, NULL, NULL, 1, 115, '2023-03-20 22:09:32.000', 115, '2023-03-20 22:11:36.112');
INSERT INTO `wms_supplier` VALUES (39, '46', '546', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 115, '2023-03-21 16:16:29.856', NULL, NULL);
INSERT INTO `wms_supplier` VALUES (40, 'sy01', '大铜', NULL, NULL, NULL, '北京市朝阳区', '222', '111', NULL, '第一级', NULL, '1', 1, 115, '2023-03-22 15:53:16.000', 115, '2023-03-22 16:07:58.098');
INSERT INTO `wms_supplier` VALUES (41, '31354', '哈哈哈哈', NULL, NULL, NULL, '河北邯郸', '15110043888', NULL, '维持', '第一级', '2813846259@qq.com', '123', 1, 115, '2023-03-25 14:22:03.729', NULL, NULL);
INSERT INTO `wms_supplier` VALUES (42, '0101', '好邻居', NULL, NULL, NULL, '襄阳', NULL, NULL, NULL, '第一级', NULL, NULL, 1, 115, '2023-03-25 15:25:55.043', NULL, NULL);
INSERT INTO `wms_supplier` VALUES (43, '11', 'DEMATIC', NULL, NULL, NULL, '湖北武汉', '17756628255', '177123456', 'hhhhh', '第二级', '2581626255@qq.com', '第二大供应商', 1, 115, '2023-03-28 08:55:12.163', NULL, NULL);
INSERT INTO `wms_supplier` VALUES (44, '11', 'DEMATIC', NULL, NULL, NULL, '湖北武汉', '17756628255', '177123456', 'hhhhh', '第二级', '2581626255@qq.com', '第二大供应商', 1, 115, '2023-03-28 08:55:12.166', NULL, NULL);
INSERT INTO `wms_supplier` VALUES (45, '2', '李宁体育器材提供商', NULL, NULL, NULL, '北京朝阳', '13454353441', '1231321331', '张思', '第一级', NULL, NULL, 1, 115, '2023-03-29 20:45:27.828', NULL, NULL);
INSERT INTO `wms_supplier` VALUES (46, '01', '电脑', NULL, NULL, NULL, '山西太原', '15110688276', '122345', '小柳', '第一级', NULL, NULL, 1, 115, '2023-04-01 14:34:38.192', NULL, NULL);
INSERT INTO `wms_supplier` VALUES (47, 'SP0001', '玖龙', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 115, '2023-04-04 16:02:44.000', 115, '2023-04-08 19:06:43.194');
INSERT INTO `wms_supplier` VALUES (48, 'SP0002', '熊猫', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 115, '2023-04-06 14:09:40.000', 115, '2023-04-08 19:06:57.556');
INSERT INTO `wms_supplier` VALUES (49, 'SP0003', '利乐', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 115, '2023-04-06 15:10:08.000', 115, '2023-04-08 19:06:48.051');
INSERT INTO `wms_supplier` VALUES (50, 'SP0004', '金轮', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 115, '2023-04-06 22:44:05.000', 115, '2023-04-08 18:52:41.073');
INSERT INTO `wms_supplier` VALUES (51, 'sp0005', '海洋', NULL, NULL, NULL, '湖南', '17873378924', '01', '海洋', '第三级', '2602065420@163.com', '客户', 1, 115, '2023-04-11 14:08:55.459', NULL, NULL);
INSERT INTO `wms_supplier` VALUES (52, 'SP0005', '王成', NULL, NULL, 990.00, '广东省深圳市中广核大厦', '', NULL, NULL, '第一级', NULL, '', 0, 115, '2023-04-12 20:37:43.000', 1, '2023-05-04 15:01:04.489');

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
) ENGINE = InnoDB AUTO_INCREMENT = 49 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '供应商账户流水' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wms_supplier_transaction
-- ----------------------------
INSERT INTO `wms_supplier_transaction` VALUES (44, 'TS-2023-05-124-135324', '52', '33', 10.00, 0.00, 10.00, 624, NULL, 0, '2023-05-04 13:53:25', '2023-05-04 13:51:40');
INSERT INTO `wms_supplier_transaction` VALUES (45, 'TS-2023-05-04-141335', '52', '22', 5.00, 10.00, 15.00, 0, NULL, 0, '2023-05-04 14:13:40', '2023-05-04 14:11:54');
INSERT INTO `wms_supplier_transaction` VALUES (46, 'TS-2023-05-04-141517', '52', '11', 5.00, 15.00, 10.00, 0, NULL, 0, '2023-05-04 14:15:21', '2023-05-04 14:13:36');
INSERT INTO `wms_supplier_transaction` VALUES (47, 'TS-2023-05-04-141543', '52', '11', 20.00, 10.00, -10.00, 0, NULL, 0, '2023-05-04 14:15:47', '2023-05-04 14:14:02');
INSERT INTO `wms_supplier_transaction` VALUES (48, 'TS-2023-05-04-150058', '52', '22', 1000.00, -10.00, 990.00, 0, NULL, 0, '2023-05-04 15:01:04', '2023-05-04 14:59:20');

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
) ENGINE = InnoDB AUTO_INCREMENT = 236 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '仓库' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wms_warehouse
-- ----------------------------
INSERT INTO `wms_warehouse` VALUES (1, 'suzhou', '苏州', 1, '创意产业园', 1, '2022-08-03 18:15:44.000', 115, '2022-11-07 11:21:23.129');
INSERT INTO `wms_warehouse` VALUES (2, 'nanjing', '南京', 1, '中央门1号', 1, '2022-08-08 11:06:22.000', 115, '2022-11-21 11:52:28.182');
INSERT INTO `wms_warehouse` VALUES (3, 'shanghai', '上海', 1, '青浦仓', 1, '2022-08-08 22:12:22.000', 115, '2022-11-07 11:21:43.635');
INSERT INTO `wms_warehouse` VALUES (4, 'guagnzhou', '广州', 1, NULL, 1, '2022-08-16 11:14:01.000', 115, '2022-11-15 15:02:36.952');
INSERT INTO `wms_warehouse` VALUES (5, '22222', '2222', 1, NULL, 1, '2022-08-16 11:14:05.000', 1, '2022-10-09 09:36:56.646');
INSERT INTO `wms_warehouse` VALUES (6, '3', '3', 1, NULL, 1, '2022-08-16 11:14:10.409', NULL, NULL);
INSERT INTO `wms_warehouse` VALUES (7, '4', '4', 1, NULL, 1, '2022-08-16 11:14:14.965', NULL, NULL);
INSERT INTO `wms_warehouse` VALUES (8, '5', '5', 1, NULL, 1, '2022-08-16 11:14:19.883', NULL, NULL);
INSERT INTO `wms_warehouse` VALUES (9, '6', '6', 1, NULL, 1, '2022-08-16 11:14:25.186', NULL, NULL);
INSERT INTO `wms_warehouse` VALUES (10, '7', '7', 1, NULL, 1, '2022-08-16 11:14:30.594', NULL, NULL);
INSERT INTO `wms_warehouse` VALUES (11, '8', '8', 1, NULL, 1, '2022-08-16 11:14:35.686', NULL, NULL);
INSERT INTO `wms_warehouse` VALUES (12, '11', '11', 1, NULL, 1, '2022-10-18 18:57:23.006', NULL, NULL);
INSERT INTO `wms_warehouse` VALUES (13, '11', '北京', 1, NULL, 1, '2022-11-01 14:12:13.665', NULL, NULL);
INSERT INTO `wms_warehouse` VALUES (14, 'beijing', '北京', 1, NULL, 1, '2022-11-01 14:12:15.000', 115, '2022-11-07 11:22:43.136');
INSERT INTO `wms_warehouse` VALUES (15, '11', '北京', 1, NULL, 1, '2022-11-01 14:12:17.170', NULL, NULL);
INSERT INTO `wms_warehouse` VALUES (16, '12', '北京', 1, NULL, 1, '2022-11-01 14:13:15.060', NULL, NULL);
INSERT INTO `wms_warehouse` VALUES (17, '12', '北京', 1, NULL, 1, '2022-11-01 14:14:01.121', NULL, NULL);
INSERT INTO `wms_warehouse` VALUES (18, '009', 'guangzhou', 1, NULL, 115, '2022-11-07 21:36:06.396', NULL, NULL);
INSERT INTO `wms_warehouse` VALUES (19, '010', 'shenzhen', 1, NULL, 115, '2022-11-07 21:36:43.488', NULL, NULL);
INSERT INTO `wms_warehouse` VALUES (20, 'guizhou', '贵州', 1, NULL, 115, '2022-11-07 21:37:52.646', NULL, NULL);
INSERT INTO `wms_warehouse` VALUES (21, 'cangku1', '仓库1', 1, '感谢字节叔叔', 115, '2022-11-11 17:01:11.000', 115, '2022-11-11 17:02:36.564');
INSERT INTO `wms_warehouse` VALUES (22, 'cangku2', '仓库2', 1, '感谢字节叔叔', 115, '2022-11-11 17:01:23.000', 115, '2022-11-11 17:02:40.528');
INSERT INTO `wms_warehouse` VALUES (23, 'cangku3', '仓库3', 1, '感谢字节叔叔', 115, '2022-11-11 17:01:30.000', 115, '2022-11-11 17:02:42.916');
INSERT INTO `wms_warehouse` VALUES (24, 'cangku4', '仓库4', 1, '感谢字节叔叔', 115, '2022-11-11 17:01:40.000', 115, '2022-11-11 17:02:45.575');
INSERT INTO `wms_warehouse` VALUES (25, 'luobo', '萝卜仓库', 1, '萝卜仓库备注', 115, '2022-11-13 17:08:46.966', NULL, NULL);
INSERT INTO `wms_warehouse` VALUES (26, 'A100', '服装', 1, '现场v从', 115, '2022-11-14 16:36:55.213', NULL, NULL);
INSERT INTO `wms_warehouse` VALUES (27, '001', '深圳', 1, NULL, 115, '2022-11-20 15:07:55.284', NULL, NULL);
INSERT INTO `wms_warehouse` VALUES (28, '哈哈', '是是是', 1, NULL, 115, '2022-11-23 10:48:52.246', NULL, NULL);
INSERT INTO `wms_warehouse` VALUES (29, '12', '12', 1, '12', 115, '2022-11-29 19:20:21.561', NULL, NULL);
INSERT INTO `wms_warehouse` VALUES (30, 'A', '金融仓库', 1, '金融仓库', 115, '2022-12-05 15:46:35.000', 115, '2022-12-08 10:27:45.868');
INSERT INTO `wms_warehouse` VALUES (31, 'xmld', '北仓1', 1, NULL, 115, '2022-12-07 09:11:26.167', NULL, NULL);
INSERT INTO `wms_warehouse` VALUES (32, '001', '天等工业园区仓库', 1, NULL, 115, '2022-12-07 14:50:32.751', NULL, NULL);
INSERT INTO `wms_warehouse` VALUES (33, 'b', 'bb', 1, 'bbb', 115, '2022-12-08 10:28:01.407', NULL, NULL);
INSERT INTO `wms_warehouse` VALUES (34, 'A0001', '仓库1', 1, NULL, 115, '2022-12-09 16:22:48.790', NULL, NULL);
INSERT INTO `wms_warehouse` VALUES (35, '最新', '最新', 1, '有管', 115, '2022-12-10 14:45:37.053', NULL, NULL);
INSERT INTO `wms_warehouse` VALUES (36, '新', '新', 1, '有管', 115, '2022-12-10 14:46:21.971', NULL, NULL);
INSERT INTO `wms_warehouse` VALUES (37, '无管', '无管', 1, '无管', 115, '2022-12-10 14:46:58.200', NULL, NULL);
INSERT INTO `wms_warehouse` VALUES (38, '1', '支队警保', 1, 'A仓库1', 115, '2022-12-10 14:51:15.000', 115, '2023-01-04 09:19:11.213');
INSERT INTO `wms_warehouse` VALUES (39, '2', '钟表城', 1, NULL, 115, '2022-12-10 14:51:59.000', 115, '2022-12-10 22:43:05.171');
INSERT INTO `wms_warehouse` VALUES (40, '1231231231', 'sdrfsd', 1, '14', 115, '2022-12-14 23:12:50.000', 115, '2022-12-15 16:07:22.036');
INSERT INTO `wms_warehouse` VALUES (41, '123', 'sdrfsd', 1, '14', 115, '2022-12-14 23:12:50.747', NULL, NULL);
INSERT INTO `wms_warehouse` VALUES (42, '001', '黑线', 1, NULL, 115, '2022-12-15 14:38:42.563', NULL, NULL);
INSERT INTO `wms_warehouse` VALUES (43, 'A001', '成品仓', 1, '成品仓', 115, '2022-12-18 17:32:37.952', NULL, NULL);
INSERT INTO `wms_warehouse` VALUES (44, '1', '1', 1, '1', 115, '2022-12-26 15:48:20.289', NULL, NULL);
INSERT INTO `wms_warehouse` VALUES (45, 'AA001', '测试仓库', 1, '无备注', 115, '2022-12-27 14:10:43.467', NULL, NULL);
INSERT INTO `wms_warehouse` VALUES (46, '1', '1', 1, '1', 115, '2022-12-27 15:32:12.187', NULL, NULL);
INSERT INTO `wms_warehouse` VALUES (47, '111', '111', 1, '111', 115, '2022-12-28 14:04:42.745', NULL, NULL);
INSERT INTO `wms_warehouse` VALUES (48, 'test', 'test', 1, 'test', 115, '2023-01-03 10:06:43.689', NULL, NULL);
INSERT INTO `wms_warehouse` VALUES (49, '010', '加绒款', 1, '3L', 115, '2023-01-04 14:11:06.027', NULL, NULL);
INSERT INTO `wms_warehouse` VALUES (50, '001', '车衣库', 1, NULL, 115, '2023-01-04 14:12:32.000', 115, '2023-01-04 19:06:39.470');
INSERT INTO `wms_warehouse` VALUES (51, '001', '云南仓', 1, NULL, 115, '2023-01-05 14:48:02.911', NULL, NULL);
INSERT INTO `wms_warehouse` VALUES (52, '1123', '123', 1, '123', 115, '2023-01-06 14:22:02.095', NULL, NULL);
INSERT INTO `wms_warehouse` VALUES (53, '01', '仓库1', 1, NULL, 115, '2023-01-06 16:54:59.571', NULL, NULL);
INSERT INTO `wms_warehouse` VALUES (54, '02', '仓库2', 1, NULL, 115, '2023-01-06 16:55:06.639', NULL, NULL);
INSERT INTO `wms_warehouse` VALUES (55, '03', '仓库33', 1, NULL, 115, '2023-01-06 16:55:16.000', 115, '2023-01-07 10:23:36.204');
INSERT INTO `wms_warehouse` VALUES (56, '33333', '3333', 1, '33333', 115, '2023-01-07 15:49:21.962', NULL, NULL);
INSERT INTO `wms_warehouse` VALUES (57, '44444', '44444', 1, '44444', 115, '2023-01-07 15:49:34.824', NULL, NULL);
INSERT INTO `wms_warehouse` VALUES (58, 'TX_01', '仓库1', 1, NULL, 115, '2023-01-07 18:07:55.686', NULL, NULL);
INSERT INTO `wms_warehouse` VALUES (59, 'TX_02', '仓库2', 1, NULL, 115, '2023-01-07 18:08:05.652', NULL, NULL);
INSERT INTO `wms_warehouse` VALUES (60, '1', '博爱西仓', 1, 'BOAI-XI', 115, '2023-01-07 22:17:18.603', NULL, NULL);
INSERT INTO `wms_warehouse` VALUES (61, '2', 'BOAI', 1, '博爱', 115, '2023-01-07 23:52:23.000', 115, '2023-01-13 11:15:03.385');
INSERT INTO `wms_warehouse` VALUES (62, '2', '修改后的test', 1, '测试仓库', 115, '2023-01-08 22:57:21.000', 115, '2023-01-08 23:00:22.141');
INSERT INTO `wms_warehouse` VALUES (63, '2', '323', 1, '4545', 115, '2023-01-10 18:37:45.380', NULL, NULL);
INSERT INTO `wms_warehouse` VALUES (64, '2', '测试仓库', 1, NULL, 115, '2023-01-11 20:47:03.415', NULL, NULL);
INSERT INTO `wms_warehouse` VALUES (65, '01', '华南仓库', 1, NULL, 115, '2023-01-13 12:40:12.000', 115, '2023-01-14 12:58:11.402');
INSERT INTO `wms_warehouse` VALUES (66, '01', '成品库', 1, NULL, 115, '2023-01-13 12:40:12.000', 115, '2023-01-30 16:35:51.758');
INSERT INTO `wms_warehouse` VALUES (67, '01', '咖啡厅仓库', 1, NULL, 115, '2023-01-13 12:48:18.997', NULL, NULL);
INSERT INTO `wms_warehouse` VALUES (68, '02', '餐厅冷藏间', 1, NULL, 115, '2023-01-13 12:48:30.627', NULL, NULL);
INSERT INTO `wms_warehouse` VALUES (69, '03', '餐厅仓库', 1, NULL, 115, '2023-01-13 12:48:46.741', NULL, NULL);
INSERT INTO `wms_warehouse` VALUES (70, '001', '智能柜1', 1, '1', 115, '2023-01-28 17:06:55.249', NULL, NULL);
INSERT INTO `wms_warehouse` VALUES (71, '03', 'testtest', 1, '测试', 115, '2023-01-29 16:12:59.000', 115, '2023-01-29 16:13:08.262');
INSERT INTO `wms_warehouse` VALUES (72, '999', '999', 1, NULL, 115, '2023-01-29 21:27:57.637', NULL, NULL);
INSERT INTO `wms_warehouse` VALUES (73, '1', '没', 1, NULL, 115, '2023-01-31 13:28:52.171', NULL, NULL);
INSERT INTO `wms_warehouse` VALUES (74, 'asgfsadg', 'sdg', 1, NULL, 115, '2023-01-31 14:07:27.097', NULL, NULL);
INSERT INTO `wms_warehouse` VALUES (75, '01', '原材料库', 1, NULL, 115, '2023-02-01 22:01:00.157', NULL, NULL);
INSERT INTO `wms_warehouse` VALUES (76, '02', '成品库', 1, NULL, 115, '2023-02-01 22:01:14.149', NULL, NULL);
INSERT INTO `wms_warehouse` VALUES (77, '03', '外库', 1, NULL, 115, '2023-02-01 22:01:26.652', NULL, NULL);
INSERT INTO `wms_warehouse` VALUES (78, '04', '不良品库', 1, NULL, 115, '2023-02-01 22:01:36.220', NULL, NULL);
INSERT INTO `wms_warehouse` VALUES (79, '1', '1', 1, NULL, 115, '2023-02-02 13:50:21.221', NULL, NULL);
INSERT INTO `wms_warehouse` VALUES (80, '11', '11', 1, '13', 115, '2023-02-02 15:05:11.909', NULL, NULL);
INSERT INTO `wms_warehouse` VALUES (81, 'A-1-1', '1号', 1, NULL, 115, '2023-02-03 16:03:42.752', NULL, NULL);
INSERT INTO `wms_warehouse` VALUES (82, 'SWV', 'dfd', 1, NULL, 115, '2023-02-03 16:45:55.102', NULL, NULL);
INSERT INTO `wms_warehouse` VALUES (83, '0801965387', '消黄利', 1, NULL, 115, '2023-02-06 14:01:22.000', 115, '2023-02-10 09:27:00.090');
INSERT INTO `wms_warehouse` VALUES (84, '230206001', '废料仓', 1, NULL, 115, '2023-02-06 15:17:53.000', 115, '2023-02-13 16:34:38.388');
INSERT INTO `wms_warehouse` VALUES (85, '0019', '种花仓库', 1, NULL, 115, '2023-02-06 16:27:47.388', NULL, NULL);
INSERT INTO `wms_warehouse` VALUES (86, '3000', '四楼仓库', 1, NULL, 115, '2023-02-08 09:03:41.000', 115, '2023-02-16 15:03:19.074');
INSERT INTO `wms_warehouse` VALUES (87, '26', '26楼原材料仓', 1, '存放电子料', 115, '2023-02-08 16:31:16.364', NULL, NULL);
INSERT INTO `wms_warehouse` VALUES (88, '001', 'A仓库', 1, 'A仓库', 115, '2023-02-10 10:42:14.817', NULL, NULL);
INSERT INTO `wms_warehouse` VALUES (89, '数创中心库存', '库房1', 1, '产品室办公室', 115, '2023-02-10 15:21:23.000', 115, '2023-02-10 15:52:51.372');
INSERT INTO `wms_warehouse` VALUES (90, '510', 'wyl的仓库', 1, '测试用', 115, '2023-02-11 10:53:40.542', NULL, NULL);
INSERT INTO `wms_warehouse` VALUES (91, 'A001', '备品备件仓库', 1, NULL, 115, '2023-02-11 14:04:36.168', NULL, NULL);
INSERT INTO `wms_warehouse` VALUES (92, 'A000001', '配件仓库', 1, '备注test', 115, '2023-02-13 13:47:13.541', NULL, NULL);
INSERT INTO `wms_warehouse` VALUES (93, '1', '11', 1, NULL, 115, '2023-02-15 11:27:35.250', NULL, NULL);
INSERT INTO `wms_warehouse` VALUES (94, '01', '仓库A', 1, '备注', 115, '2023-02-15 14:06:46.000', 115, '2023-02-15 14:08:45.687');
INSERT INTO `wms_warehouse` VALUES (95, '01', '食品仓库', 1, NULL, 115, '2023-02-15 15:01:55.264', NULL, NULL);
INSERT INTO `wms_warehouse` VALUES (96, '202302151', '二楼仓库', 1, '水泥', 115, '2023-02-15 17:24:18.863', NULL, NULL);
INSERT INTO `wms_warehouse` VALUES (97, '01', '天线', 1, '700~3700', 115, '2023-02-15 19:27:32.000', 115, '2023-02-15 19:28:41.662');
INSERT INTO `wms_warehouse` VALUES (98, '3002', 'test', 1, NULL, 115, '2023-02-16 15:03:55.714', NULL, NULL);
INSERT INTO `wms_warehouse` VALUES (99, '30021', 'ooop', 1, NULL, 115, '2023-02-16 15:04:53.699', NULL, NULL);
INSERT INTO `wms_warehouse` VALUES (100, '899', '6355', 1, NULL, 115, '2023-02-16 15:05:35.331', NULL, NULL);
INSERT INTO `wms_warehouse` VALUES (101, 'WB001', '焦作万邦周转筐集散中心', 1, NULL, 115, '2023-02-17 10:47:05.000', 115, '2023-02-17 10:47:25.371');
INSERT INTO `wms_warehouse` VALUES (102, 'test', 'dddd', 1, 'dd', 115, '2023-02-17 13:06:09.992', NULL, NULL);
INSERT INTO `wms_warehouse` VALUES (103, 'aaa', 'ddd', 1, 'dd', 115, '2023-02-17 13:06:23.341', NULL, NULL);
INSERT INTO `wms_warehouse` VALUES (104, '333333', 'A仓库', 1, '仓库A', 115, '2023-02-17 13:49:52.633', NULL, NULL);
INSERT INTO `wms_warehouse` VALUES (105, '123', '阿拉伯', 1, '干什么用的', 115, '2023-02-18 16:18:09.000', 115, '2023-02-23 15:41:14.834');
INSERT INTO `wms_warehouse` VALUES (106, '1', '中国', 1, NULL, 115, '2023-02-21 12:00:26.144', NULL, NULL);
INSERT INTO `wms_warehouse` VALUES (107, '001', '大仓', 1, NULL, 115, '2023-02-21 22:15:44.547', NULL, NULL);
INSERT INTO `wms_warehouse` VALUES (108, '2', '2', 1, '2', 115, '2023-02-23 14:52:31.818', NULL, NULL);
INSERT INTO `wms_warehouse` VALUES (109, '001', 'ICC', 1, 'xxx', 115, '2023-02-23 17:48:31.373', NULL, NULL);
INSERT INTO `wms_warehouse` VALUES (110, '001', 'ICC', 1, 'xxx', 115, '2023-02-23 17:51:25.210', NULL, NULL);
INSERT INTO `wms_warehouse` VALUES (111, '001', 'kkk', 1, 'kk', 115, '2023-02-24 14:02:35.785', NULL, NULL);
INSERT INTO `wms_warehouse` VALUES (112, '001', '深北莫学生服务中心', 1, NULL, 115, '2023-02-25 08:16:53.376', NULL, NULL);
INSERT INTO `wms_warehouse` VALUES (113, 'test', 'test12:55', 1, NULL, 115, '2023-02-25 12:55:21.863', NULL, NULL);
INSERT INTO `wms_warehouse` VALUES (114, '002', '库区2', 1, NULL, 115, '2023-02-25 17:08:59.287', NULL, NULL);
INSERT INTO `wms_warehouse` VALUES (115, '100', 'm_test', 1, NULL, 115, '2023-02-27 10:28:58.806', NULL, NULL);
INSERT INTO `wms_warehouse` VALUES (116, '001', '1号仓库', 1, '张氏牛场', 115, '2023-03-01 01:08:45.000', 115, '2023-03-02 10:14:30.603');
INSERT INTO `wms_warehouse` VALUES (117, '002', '2号仓库', 1, '王某牛场000', 115, '2023-03-01 15:29:08.000', 115, '2023-03-07 22:37:35.224');
INSERT INTO `wms_warehouse` VALUES (118, '003', '3号仓库', 1, '丰都牛场', 115, '2023-03-01 17:27:10.000', 115, '2023-03-02 10:15:04.947');
INSERT INTO `wms_warehouse` VALUES (119, '004', '3号仓库', 1, '私家牛舍', 115, '2023-03-01 17:27:26.000', 115, '2023-03-02 10:15:39.108');
INSERT INTO `wms_warehouse` VALUES (120, '005', '5号仓库', 1, '王木牛', 115, '2023-03-02 10:16:18.000', 115, '2023-03-02 10:16:24.332');
INSERT INTO `wms_warehouse` VALUES (121, '7100', '半成品一库', 1, NULL, 115, '2023-03-03 20:03:03.000', 115, '2023-03-03 20:04:44.792');
INSERT INTO `wms_warehouse` VALUES (122, '1200', '原料标准件库', 1, NULL, 115, '2023-03-03 20:04:39.677', NULL, NULL);
INSERT INTO `wms_warehouse` VALUES (123, '1', '1', 1, '1', 115, '2023-03-03 20:04:50.276', NULL, NULL);
INSERT INTO `wms_warehouse` VALUES (124, '1', '1', 1, '2', 115, '2023-03-03 20:05:31.882', NULL, NULL);
INSERT INTO `wms_warehouse` VALUES (125, '155', '495646', 1, NULL, 115, '2023-03-08 23:57:39.854', NULL, NULL);
INSERT INTO `wms_warehouse` VALUES (126, '258', '份饭', 1, NULL, 115, '2023-03-09 13:10:35.838', NULL, NULL);
INSERT INTO `wms_warehouse` VALUES (127, '01', '粤东中心仓库', 1, NULL, 115, '2023-03-10 17:57:38.838', NULL, NULL);
INSERT INTO `wms_warehouse` VALUES (128, '02', '潮州仓库', 1, NULL, 115, '2023-03-10 17:57:59.433', NULL, NULL);
INSERT INTO `wms_warehouse` VALUES (129, '3', '22', 1, NULL, 115, '2023-03-11 21:22:03.849', NULL, NULL);
INSERT INTO `wms_warehouse` VALUES (130, '33', '333', 1, NULL, 115, '2023-03-12 13:37:54.419', NULL, NULL);
INSERT INTO `wms_warehouse` VALUES (131, '001', '测试仓库', 1, '测试仓库', 115, '2023-03-12 15:50:48.572', NULL, NULL);
INSERT INTO `wms_warehouse` VALUES (132, '2', 'dwsd', 1, NULL, 115, '2023-03-12 16:32:07.615', NULL, NULL);
INSERT INTO `wms_warehouse` VALUES (133, '测试1', '仓库1', 1, NULL, 115, '2023-03-12 19:11:43.396', NULL, NULL);
INSERT INTO `wms_warehouse` VALUES (134, 'A', 'AKU', 1, NULL, 115, '2023-03-13 14:39:27.992', NULL, NULL);
INSERT INTO `wms_warehouse` VALUES (135, '1', '1', 1, NULL, 115, '2023-03-13 15:29:24.257', NULL, NULL);
INSERT INTO `wms_warehouse` VALUES (136, 'ggg', 'fff', 1, NULL, 115, '2023-03-13 15:51:54.133', NULL, NULL);
INSERT INTO `wms_warehouse` VALUES (137, '001', '欧拉sss', 1, NULL, 115, '2023-03-14 14:11:48.000', 115, '2023-03-28 12:27:21.420');
INSERT INTO `wms_warehouse` VALUES (138, '1001sss', '物料', 1, '123', 115, '2023-03-15 16:15:35.000', 115, '2023-03-30 17:34:51.717');
INSERT INTO `wms_warehouse` VALUES (139, '001', '一号仓', 1, '北京', 115, '2023-03-16 16:28:58.000', 115, '2023-03-23 09:12:26.931');
INSERT INTO `wms_warehouse` VALUES (140, '002', '上海仓', 1, NULL, 115, '2023-03-16 16:29:19.171', NULL, NULL);
INSERT INTO `wms_warehouse` VALUES (141, '1', '11', 1, NULL, 115, '2023-03-17 09:58:38.171', NULL, NULL);
INSERT INTO `wms_warehouse` VALUES (142, '1', '11', 1, NULL, 115, '2023-03-17 09:58:46.514', NULL, NULL);
INSERT INTO `wms_warehouse` VALUES (143, '666', '测试', 1, '测试666', 115, '2023-03-20 08:42:06.808', NULL, NULL);
INSERT INTO `wms_warehouse` VALUES (144, '3333', '333', 1, NULL, 115, '2023-03-20 11:31:24.000', 115, '2023-03-22 09:09:13.759');
INSERT INTO `wms_warehouse` VALUES (145, '2133', '2222', 1, '灌灌灌灌', 115, '2023-03-20 11:32:29.953', NULL, NULL);
INSERT INTO `wms_warehouse` VALUES (146, '针织', '8088', 1, '正常款未加长', 115, '2023-03-20 18:02:54.284', NULL, NULL);
INSERT INTO `wms_warehouse` VALUES (147, '12312', '白酒', 1, '1111111', 115, '2023-03-21 17:25:59.663', NULL, NULL);
INSERT INTO `wms_warehouse` VALUES (148, '123', '白酒', 1, NULL, 115, '2023-03-21 17:28:02.906', NULL, NULL);
INSERT INTO `wms_warehouse` VALUES (149, '111', '白酒仓库', 1, NULL, 115, '2023-03-21 17:29:42.077', NULL, NULL);
INSERT INTO `wms_warehouse` VALUES (150, '茅台仓库', '茅台仓库', 1, NULL, 115, '2023-03-22 00:17:01.307', NULL, NULL);
INSERT INTO `wms_warehouse` VALUES (151, '888', '测试', 1, NULL, 115, '2023-03-22 09:09:39.162', NULL, NULL);
INSERT INTO `wms_warehouse` VALUES (152, '111', '111', 1, '111', 115, '2023-03-22 14:28:04.589', NULL, NULL);
INSERT INTO `wms_warehouse` VALUES (153, '111', '111', 1, '111', 115, '2023-03-22 14:28:12.324', NULL, NULL);
INSERT INTO `wms_warehouse` VALUES (154, '20230322', '服装仓1', 1, NULL, 115, '2023-03-22 15:44:47.463', NULL, NULL);
INSERT INTO `wms_warehouse` VALUES (155, 'HD-01', '华东1号库', 1, NULL, 115, '2023-03-22 22:46:42.842', NULL, NULL);
INSERT INTO `wms_warehouse` VALUES (156, '666', '测试', 1, '001', 115, '2023-03-23 00:47:27.306', NULL, NULL);
INSERT INTO `wms_warehouse` VALUES (157, 'sy01', '仓库1', 1, NULL, 115, '2023-03-23 14:04:51.000', 115, '2023-04-12 14:45:47.746');
INSERT INTO `wms_warehouse` VALUES (158, 'sy001', '仓库的', 1, NULL, 115, '2023-03-23 14:05:21.894', NULL, NULL);
INSERT INTO `wms_warehouse` VALUES (159, 'test', 'test', 1, NULL, 115, '2023-03-24 11:13:10.198', NULL, NULL);
INSERT INTO `wms_warehouse` VALUES (160, '1234', '啤酒', 1, NULL, 115, '2023-03-24 14:20:14.726', NULL, NULL);
INSERT INTO `wms_warehouse` VALUES (161, '135', 'fcl', 1, '', 115, '2023-03-24 23:56:47.000', 115, '2023-04-12 14:19:39.119');
INSERT INTO `wms_warehouse` VALUES (162, 'baohan', '159', 1, '4526', 115, '2023-03-25 12:06:43.252', NULL, NULL);
INSERT INTO `wms_warehouse` VALUES (163, '666', '666', 1, NULL, 115, '2023-03-25 15:18:45.541', NULL, NULL);
INSERT INTO `wms_warehouse` VALUES (164, '001', '001', 1, NULL, 115, '2023-03-25 15:21:06.252', NULL, NULL);
INSERT INTO `wms_warehouse` VALUES (165, '00101', '00101', 1, NULL, 115, '2023-03-25 15:21:38.322', NULL, NULL);
INSERT INTO `wms_warehouse` VALUES (166, '001', '商学院', 1, NULL, 115, '2023-03-26 19:50:46.095', NULL, NULL);
INSERT INTO `wms_warehouse` VALUES (167, '033', '033', 1, NULL, 115, '2023-03-27 13:43:18.000', 115, '2023-03-27 13:43:28.329');
INSERT INTO `wms_warehouse` VALUES (168, '004', '正常运行', 1, '面包', 115, '2023-03-28 08:45:12.673', NULL, NULL);
INSERT INTO `wms_warehouse` VALUES (169, '777', '数据', 1, '包子', 115, '2023-03-28 08:45:59.000', 115, '2023-03-28 08:47:07.787');
INSERT INTO `wms_warehouse` VALUES (170, '123', '威威', 1, '威威嗡嗡嗡', 115, '2023-03-28 15:30:20.059', NULL, NULL);
INSERT INTO `wms_warehouse` VALUES (171, 'test20230329-01', '测试仓库1', 1, '', 115, '2023-03-29 13:31:48.682', NULL, NULL);
INSERT INTO `wms_warehouse` VALUES (172, '185', '厦门仓', 1, '无', 115, '2023-03-30 14:11:36.977', NULL, NULL);
INSERT INTO `wms_warehouse` VALUES (173, 'cq001', '莆田鞋', 1, '重庆仓', 115, '2023-03-31 12:05:16.497', NULL, NULL);
INSERT INTO `wms_warehouse` VALUES (174, 'beijing', '北京', 1, NULL, 115, '2023-04-01 06:30:59.411', NULL, NULL);
INSERT INTO `wms_warehouse` VALUES (175, '22222222222', 'byrzjhh', 1, 'byrzjhh', 115, '2023-04-03 17:30:55.984', NULL, NULL);
INSERT INTO `wms_warehouse` VALUES (176, 'No.89757', '不潮不用花钱', 1, '莆田潮鞋', 115, '2023-04-04 11:39:54.000', 115, '2023-04-04 11:44:11.326');
INSERT INTO `wms_warehouse` VALUES (177, '不能 ', '一条', 1, NULL, 115, '2023-04-04 11:57:53.918', NULL, NULL);
INSERT INTO `wms_warehouse` VALUES (178, 'No.89757', '不潮不用花钱', 1, '莆田潮鞋～～不潮不花钱', 115, '2023-04-04 14:51:45.437', NULL, NULL);
INSERT INTO `wms_warehouse` VALUES (179, '111', 'aaaa', 1, 'ccc', 115, '2023-04-04 22:19:16.898', NULL, NULL);
INSERT INTO `wms_warehouse` VALUES (180, '333', '333', 1, NULL, 115, '2023-04-05 12:22:50.146', NULL, NULL);
INSERT INTO `wms_warehouse` VALUES (181, '1', '我是仓库', 1, '1', 115, '2023-04-06 14:03:47.000', 115, '2023-04-06 14:49:50.781');
INSERT INTO `wms_warehouse` VALUES (182, '001', '111', 1, '111', 115, '2023-04-06 14:05:12.478', NULL, NULL);
INSERT INTO `wms_warehouse` VALUES (183, '003', 'ceshi', 1, '111', 115, '2023-04-06 14:10:28.893', NULL, NULL);
INSERT INTO `wms_warehouse` VALUES (184, 'one', 'yyf的仓库', 1, 'yyf', 115, '2023-04-06 14:57:31.399', NULL, NULL);
INSERT INTO `wms_warehouse` VALUES (185, '800', 'sjtu', 1, NULL, 115, '2023-04-06 22:41:21.285', NULL, NULL);
INSERT INTO `wms_warehouse` VALUES (186, '001', '黄酒', 1, NULL, 115, '2023-04-06 23:09:39.639', NULL, NULL);
INSERT INTO `wms_warehouse` VALUES (187, '0025', '总仓', 1, NULL, 115, '2023-04-07 14:34:02.572', NULL, NULL);
INSERT INTO `wms_warehouse` VALUES (188, '6677', '213423', 1, '4324', 115, '2023-04-08 12:04:34.108', NULL, NULL);
INSERT INTO `wms_warehouse` VALUES (189, 'BJT0001', '一队', 1, NULL, 115, '2023-04-11 11:59:08.385', NULL, NULL);
INSERT INTO `wms_warehouse` VALUES (190, 'BJT0002', '二队', 1, NULL, 115, '2023-04-11 11:59:30.519', NULL, NULL);
INSERT INTO `wms_warehouse` VALUES (191, '2019065416', '王成', 1, '中期答辩', 115, '2023-04-12 20:13:33.571', NULL, NULL);
INSERT INTO `wms_warehouse` VALUES (192, 'TG101', '泰国1仓', 1, '泰国1仓', 115, '2023-04-13 10:04:53.741', NULL, NULL);
INSERT INTO `wms_warehouse` VALUES (193, 'TG102', '泰国2仓', 1, '二仓', 115, '2023-04-13 10:05:11.000', 115, '2023-04-15 12:53:28.563');
INSERT INTO `wms_warehouse` VALUES (194, 'ZJ201', '浙江1仓', 1, '浙江仓12', 115, '2023-04-13 10:06:03.000', 1, '2023-04-26 13:18:15.920');
INSERT INTO `wms_warehouse` VALUES (195, 'ZJ202', '浙江2仓', 1, '浙江202', 115, '2023-04-13 10:06:17.988', NULL, NULL);
INSERT INTO `wms_warehouse` VALUES (196, 'FJ301', '福建1仓', 1, NULL, 115, '2023-04-13 10:06:38.612', NULL, NULL);
INSERT INTO `wms_warehouse` VALUES (197, 'FJ302', '福建2仓', 1, '福建2仓', 115, '2023-04-13 10:07:06.000', 115, '2023-04-28 11:35:53.262');
INSERT INTO `wms_warehouse` VALUES (198, 'SC401', '四川1仓', 1, NULL, 115, '2023-04-13 10:07:29.513', NULL, NULL);
INSERT INTO `wms_warehouse` VALUES (199, 'SC402', '四川2仓', 1, NULL, 115, '2023-04-13 10:07:44.135', NULL, NULL);
INSERT INTO `wms_warehouse` VALUES (200, '0001', '一门店', 1, '一门店', 115, '2023-04-13 14:39:12.930', NULL, NULL);
INSERT INTO `wms_warehouse` VALUES (201, 'TG004', '1', 1, '1', 115, '2023-04-15 12:54:04.763', NULL, NULL);
INSERT INTO `wms_warehouse` VALUES (202, 'TG10002', 'ff', 1, NULL, 115, '2023-04-18 10:49:40.938', NULL, NULL);
INSERT INTO `wms_warehouse` VALUES (203, '10002', 'gg', 1, NULL, 115, '2023-04-18 10:49:49.000', 115, '2023-04-18 10:54:08.451');
INSERT INTO `wms_warehouse` VALUES (204, 'SXJ01', '山西1仓', 1, '太原中心仓', 115, '2023-04-18 11:00:06.000', 115, '2023-04-18 16:02:23.129');
INSERT INTO `wms_warehouse` VALUES (205, 'SXS01', '陕西1仓', 1, '陕西1仓', 115, '2023-04-18 11:19:26.694', NULL, NULL);
INSERT INTO `wms_warehouse` VALUES (206, '34', '34', 1, NULL, 115, '2023-04-18 16:25:15.908', NULL, NULL);
INSERT INTO `wms_warehouse` VALUES (207, 'TG102', '2323', 1, NULL, 115, '2023-04-18 16:54:50.414', NULL, NULL);
INSERT INTO `wms_warehouse` VALUES (208, 'sdf', 'sdf', 1, NULL, 115, '2023-04-18 18:01:23.934', NULL, NULL);
INSERT INTO `wms_warehouse` VALUES (209, 'sdf', 'sdf', 1, NULL, 115, '2023-04-18 18:01:24.079', NULL, NULL);
INSERT INTO `wms_warehouse` VALUES (210, '33', '33', 1, NULL, 115, '2023-04-20 11:29:52.156', NULL, NULL);
INSERT INTO `wms_warehouse` VALUES (211, '99', 'gk', 1, NULL, 115, '2023-04-21 14:56:41.829', NULL, NULL);
INSERT INTO `wms_warehouse` VALUES (212, '1', '1', 1, '1', 115, '2023-04-23 18:22:24.337', NULL, NULL);
INSERT INTO `wms_warehouse` VALUES (213, 'FV222', '黑龙江1仓', 1, NULL, 115, '2023-04-23 19:17:46.607', NULL, NULL);
INSERT INTO `wms_warehouse` VALUES (214, 'test', 'test', 1, NULL, 115, '2023-04-24 14:44:03.585', NULL, NULL);
INSERT INTO `wms_warehouse` VALUES (215, 'HF001', '合肥1仓', 1, NULL, 115, '2023-04-24 15:32:22.013', NULL, NULL);
INSERT INTO `wms_warehouse` VALUES (216, 'FFF101', 'FFF仓库', 1, '测试在何处', 115, '2023-04-24 17:24:07.492', NULL, NULL);
INSERT INTO `wms_warehouse` VALUES (217, '111', '111111', 1, '111', 115, '2023-04-25 15:56:51.980', NULL, NULL);
INSERT INTO `wms_warehouse` VALUES (218, 'test', 'test', 1, 'tsest', 1, '2023-04-26 09:24:23.601', NULL, NULL);
INSERT INTO `wms_warehouse` VALUES (219, 'test', 'test', 1, 'test', 1, '2023-04-26 09:35:38.004', NULL, NULL);
INSERT INTO `wms_warehouse` VALUES (220, 'test3', 'test3', 1, 'test3', 1, '2023-04-26 09:36:16.703', NULL, NULL);
INSERT INTO `wms_warehouse` VALUES (221, 'test4', 'test4', 1, 'test4', 1, '2023-04-26 09:37:31.304', NULL, NULL);
INSERT INTO `wms_warehouse` VALUES (222, 'test5', 'test5', 1, 'test5', 1, '2023-04-26 09:37:59.511', NULL, NULL);
INSERT INTO `wms_warehouse` VALUES (223, 'test', 'testestest', 1, 'tset', 1, '2023-04-26 09:44:54.988', NULL, NULL);
INSERT INTO `wms_warehouse` VALUES (224, 'test6', '这个仓库名称会比较昌', 1, NULL, 1, '2023-04-26 09:46:47.419', NULL, NULL);
INSERT INTO `wms_warehouse` VALUES (225, '实际线下已有库位规划的情况下', '允许编号输入', 1, NULL, 115, '2023-04-27 16:49:30.156', NULL, NULL);
INSERT INTO `wms_warehouse` VALUES (226, '4', '4', 1, '4', 115, '2023-04-28 17:24:07.514', NULL, NULL);
INSERT INTO `wms_warehouse` VALUES (227, '111', '231', 1, '231', 115, '2023-04-29 08:43:27.263', NULL, NULL);
INSERT INTO `wms_warehouse` VALUES (228, '1', '1', 1, '1', 115, '2023-04-30 16:43:16.443', NULL, NULL);
INSERT INTO `wms_warehouse` VALUES (229, 'suzhou', '苏州仓', 1, NULL, 115, '2023-05-01 12:16:42.300', NULL, NULL);
INSERT INTO `wms_warehouse` VALUES (230, 'shanghia', '上海仓库', 1, NULL, 115, '2023-05-01 12:17:11.184', NULL, NULL);
INSERT INTO `wms_warehouse` VALUES (231, '测试', '测试仓库', 1, NULL, 115, '2023-05-02 13:35:54.829', NULL, NULL);
INSERT INTO `wms_warehouse` VALUES (232, '12345', '南京仓', 1, NULL, 1, '2023-05-04 16:31:13.661', NULL, NULL);
INSERT INTO `wms_warehouse` VALUES (233, 'nanjing', '南京仓', 1, '南京的仓库', 1, '2023-05-04 16:38:02.861', NULL, NULL);
INSERT INTO `wms_warehouse` VALUES (234, '1', 'df', 0, 'dfasd', 115, '2023-05-04 16:42:43.844', NULL, NULL);
INSERT INTO `wms_warehouse` VALUES (235, 'ghh', 'drw', 0, 'fff', 115, '2023-05-04 16:42:55.223', NULL, NULL);

SET FOREIGN_KEY_CHECKS = 1;
