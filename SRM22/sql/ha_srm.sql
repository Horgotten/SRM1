/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 50730
 Source Host           : localhost:3306
 Source Schema         : ha_srm

 Target Server Type    : MySQL
 Target Server Version : 50730
 File Encoding         : 65001

 Date: 11/10/2024 10:28:19
*/

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
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`table_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '代码生成业务表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of gen_table
-- ----------------------------
INSERT INTO `gen_table` VALUES (1, 'lp_inventory', '库存列表', NULL, NULL, 'Inventory', 'crud', 'com.ruoyi.system', 'inventory', 'inventory', '库存', 'ruoyi', '0', '/', '{}', 'admin', '2024-05-05 08:20:58', '', '2024-05-05 08:37:55', NULL);
INSERT INTO `gen_table` VALUES (2, 'lp_materials', '原料列表', NULL, NULL, 'Materials', 'crud', 'lp.xian.production', 'materials', 'materials', '原材料列表', 'ruoyi', '0', '/', '{}', 'admin', '2024-05-05 08:58:19', '', '2024-05-05 09:00:01', NULL);

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
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`column_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 22 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '代码生成业务表字段' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of gen_table_column
-- ----------------------------
INSERT INTO `gen_table_column` VALUES (1, '1', 'inventory_id', '主键', 'int', 'Long', 'inventoryId', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2024-05-05 08:20:58', '', '2024-05-05 08:37:55');
INSERT INTO `gen_table_column` VALUES (2, '1', 'inventory_name', '库存名称', 'varchar(100)', 'String', 'inventoryName', '0', '0', NULL, '1', '1', '1', '1', 'LIKE', 'input', '', 2, 'admin', '2024-05-05 08:20:58', '', '2024-05-05 08:37:55');
INSERT INTO `gen_table_column` VALUES (3, '1', 'inventory_num', '数量', 'int', 'Long', 'inventoryNum', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2024-05-05 08:20:58', '', '2024-05-05 08:37:55');
INSERT INTO `gen_table_column` VALUES (4, '1', 'inventory_price', '价格', 'decimal(10,2)', 'BigDecimal', 'inventoryPrice', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 4, 'admin', '2024-05-05 08:20:58', '', '2024-05-05 08:37:55');
INSERT INTO `gen_table_column` VALUES (5, '1', 'inventory_unit', '单位', 'varchar(15)', 'String', 'inventoryUnit', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 5, 'admin', '2024-05-05 08:20:58', '', '2024-05-05 08:37:55');
INSERT INTO `gen_table_column` VALUES (6, '1', 'warehouse_warrant_id', '入库列表ID', 'int', 'Long', 'warehouseWarrantId', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 6, 'admin', '2024-05-05 08:20:58', '', '2024-05-05 08:37:55');
INSERT INTO `gen_table_column` VALUES (7, '1', 'remark', '备注', 'varchar(255)', 'String', 'remark', '0', '0', NULL, '1', '1', '1', NULL, 'EQ', 'input', '', 7, 'admin', '2024-05-05 08:20:58', '', '2024-05-05 08:37:55');
INSERT INTO `gen_table_column` VALUES (8, '1', 'create_by', '创建者', 'varchar(50)', 'String', 'createBy', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 8, 'admin', '2024-05-05 08:20:58', '', '2024-05-05 08:37:55');
INSERT INTO `gen_table_column` VALUES (9, '1', 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 9, 'admin', '2024-05-05 08:20:58', '', '2024-05-05 08:37:55');
INSERT INTO `gen_table_column` VALUES (10, '1', 'update_by', '修改者', 'varchar(50)', 'String', 'updateBy', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'input', '', 10, 'admin', '2024-05-05 08:20:58', '', '2024-05-05 08:37:55');
INSERT INTO `gen_table_column` VALUES (11, '1', 'update_time', '修改时间', 'datetime', 'Date', 'updateTime', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'datetime', '', 11, 'admin', '2024-05-05 08:20:58', '', '2024-05-05 08:37:55');
INSERT INTO `gen_table_column` VALUES (12, '2', 'lp_materials_id', '原料ID', 'int', 'Long', 'lpMaterialsId', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2024-05-05 08:58:19', '', '2024-05-05 09:00:01');
INSERT INTO `gen_table_column` VALUES (13, '2', 'materials_name', '原材料名称', 'varchar(100)', 'String', 'materialsName', '0', '0', NULL, '1', '1', '1', '1', 'LIKE', 'input', '', 2, 'admin', '2024-05-05 08:58:19', '', '2024-05-05 09:00:01');
INSERT INTO `gen_table_column` VALUES (14, '2', 'materials_num', '原料数量', 'int', 'Long', 'materialsNum', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2024-05-05 08:58:19', '', '2024-05-05 09:00:01');
INSERT INTO `gen_table_column` VALUES (15, '2', 'materials_price', '价格', 'decimal(10,2)', 'BigDecimal', 'materialsPrice', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 4, 'admin', '2024-05-05 08:58:19', '', '2024-05-05 09:00:01');
INSERT INTO `gen_table_column` VALUES (16, '2', 'unit', '单位', 'varchar(15)', 'String', 'unit', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 5, 'admin', '2024-05-05 08:58:19', '', '2024-05-05 09:00:01');
INSERT INTO `gen_table_column` VALUES (17, '2', 'remark', '备注', 'varchar(255)', 'String', 'remark', '0', '0', NULL, '1', '1', '1', NULL, 'EQ', 'input', '', 6, 'admin', '2024-05-05 08:58:19', '', '2024-05-05 09:00:01');
INSERT INTO `gen_table_column` VALUES (18, '2', 'create_by', '创建者', 'varchar(50)', 'String', 'createBy', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 7, 'admin', '2024-05-05 08:58:19', '', '2024-05-05 09:00:01');
INSERT INTO `gen_table_column` VALUES (19, '2', 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 8, 'admin', '2024-05-05 08:58:19', '', '2024-05-05 09:00:01');
INSERT INTO `gen_table_column` VALUES (20, '2', 'update_by', '修改者', 'varchar(50)', 'String', 'updateBy', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'input', '', 9, 'admin', '2024-05-05 08:58:19', '', '2024-05-05 09:00:01');
INSERT INTO `gen_table_column` VALUES (21, '2', 'update_time', '修改时间', 'datetime', 'Date', 'updateTime', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'datetime', '', 10, 'admin', '2024-05-05 08:58:19', '', '2024-05-05 09:00:01');

-- ----------------------------
-- Table structure for lp_adjunct
-- ----------------------------
DROP TABLE IF EXISTS `lp_adjunct`;
CREATE TABLE `lp_adjunct`  (
  `adjunct_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键递增',
  `adjunct_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '设备附件名称',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '设备描述',
  `model_type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '设备附件型号',
  `supplier_id` int(11) NULL DEFAULT NULL COMMENT '供应商Id',
  `adjunct_price` decimal(10, 2) NULL DEFAULT NULL COMMENT '附件设备价格',
  `equipment_id` int(11) NULL DEFAULT NULL COMMENT '设备ID',
  `classification_id` int(11) NULL DEFAULT NULL COMMENT '附件设备分类ID',
  `adjunct_status` int(11) NULL DEFAULT NULL COMMENT '0表示设备正常  1表示设备保养 2表示设备维修 3表示设备损坏',
  `audit_status` int(11) NULL DEFAULT NULL COMMENT '0表示未审核 1表示审核 2表示审批',
  `audit_opinion` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '审核意见',
  `audit_time` datetime(0) NULL DEFAULT NULL COMMENT '审核时间',
  `audit_person` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '审核人员',
  `approver_opinion` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '审批意见',
  `approver_time` datetime(0) NULL DEFAULT NULL COMMENT '审批时间',
  `approver_person` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '审批人员',
  `sort` int(11) NULL DEFAULT NULL COMMENT '排序',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `create_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '修改者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`adjunct_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of lp_adjunct
-- ----------------------------
INSERT INTO `lp_adjunct` VALUES (1, '螺丝', '附件螺丝', '小型', 1, 10.00, 1, 1, 0, 1, '无意见', '2024-05-04 23:13:42', 'admin', NULL, NULL, NULL, 1, '螺丝钉', 'admin', '2024-05-04 23:13:28', NULL, NULL);

-- ----------------------------
-- Table structure for lp_classes_product
-- ----------------------------
DROP TABLE IF EXISTS `lp_classes_product`;
CREATE TABLE `lp_classes_product`  (
  `classes_product_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键递增',
  `classes_product_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '成品分类名称',
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '成品分类名称描述',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `create_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`classes_product_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of lp_classes_product
-- ----------------------------
INSERT INTO `lp_classes_product` VALUES (1, '完成品', '全部完成', '完成', NULL, '2024-05-05 07:51:14', NULL, NULL);

-- ----------------------------
-- Table structure for lp_classification
-- ----------------------------
DROP TABLE IF EXISTS `lp_classification`;
CREATE TABLE `lp_classification`  (
  `classification_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键递增',
  `classification_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '设备分类名称',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '设备描述',
  `sort` int(11) NULL DEFAULT NULL COMMENT '排序',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `create_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '修改者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`classification_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of lp_classification
-- ----------------------------
INSERT INTO `lp_classification` VALUES (1, '大设备', '很大', 1, '很大', NULL, '2024-04-28 08:52:12', NULL, NULL);

-- ----------------------------
-- Table structure for lp_classify
-- ----------------------------
DROP TABLE IF EXISTS `lp_classify`;
CREATE TABLE `lp_classify`  (
  `classify_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键递增',
  `classify_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '供应商分类名称',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '供应商分类描述',
  `sort` int(11) NULL DEFAULT NULL COMMENT '排序',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `create_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '修改者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`classify_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of lp_classify
-- ----------------------------
INSERT INTO `lp_classify` VALUES (1, '最大的供应商', '最大', 1, '最大', NULL, NULL, NULL, '2024-05-12 16:51:31');

-- ----------------------------
-- Table structure for lp_client
-- ----------------------------
DROP TABLE IF EXISTS `lp_client`;
CREATE TABLE `lp_client`  (
  `client_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `client_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '客户名称',
  `client_classify_id` int(11) NULL DEFAULT NULL COMMENT '分类ID',
  `client_address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '客户地址',
  `client_person` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系人',
  `client_phone` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系电话',
  `audit_status` int(11) NULL DEFAULT NULL COMMENT '0表示未审核  1表示审核  2表示审批',
  `audit_opinion` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '审核意见',
  `audit_time` datetime(0) NULL DEFAULT NULL COMMENT '审核时间。',
  `audit_person` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '审核人',
  `approver_opinion` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '审批意见',
  `approver_time` datetime(0) NULL DEFAULT NULL COMMENT '审批时间',
  `approver_person` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '审批人',
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '描述',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `create_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`client_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of lp_client
-- ----------------------------
INSERT INTO `lp_client` VALUES (1, '客户', NULL, '湖北宜昌', '柯南', '123456789', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-05-28 00:32:56', NULL, NULL);

-- ----------------------------
-- Table structure for lp_client_classify
-- ----------------------------
DROP TABLE IF EXISTS `lp_client_classify`;
CREATE TABLE `lp_client_classify`  (
  `client_classify_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `client_classify_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '客户分类名称',
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '描述',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `create_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`client_classify_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of lp_client_classify
-- ----------------------------
INSERT INTO `lp_client_classify` VALUES (1, '小客户', NULL, NULL, NULL, '2024-05-28 00:32:34', NULL, NULL);

-- ----------------------------
-- Table structure for lp_equipment
-- ----------------------------
DROP TABLE IF EXISTS `lp_equipment`;
CREATE TABLE `lp_equipment`  (
  `equipment_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键递增',
  `equipment_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '设备名称',
  `nums` int(11) NULL DEFAULT NULL COMMENT '设备数量',
  `sort` int(11) NULL DEFAULT NULL COMMENT '排序',
  `classification_id` int(11) NULL DEFAULT NULL COMMENT '设备分类ID',
  `price` decimal(10, 2) NULL DEFAULT NULL COMMENT '设备价格',
  `supplier_id` int(11) NULL DEFAULT NULL COMMENT '供应商ID',
  `matter` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '注意事项',
  `maintain` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '保养周期',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '设备描述',
  `equipment_status` int(11) NULL DEFAULT NULL COMMENT '0表示设备正常  1表示设备保养 2表示设备维修 3表示设备损坏',
  `audit_status` int(11) NULL DEFAULT NULL COMMENT '0表示未审核  1表示审核  2表示审批',
  `audit_opinion` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '审核意见',
  `audit_time` datetime(0) NULL DEFAULT NULL COMMENT '审核时间',
  `audit_person` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '审核人员',
  `approver_opinion` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '审批意见',
  `approver_time` datetime(0) NULL DEFAULT NULL COMMENT '审批时间',
  `approver_person` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '审批人员',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `create_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '修改者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`equipment_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of lp_equipment
-- ----------------------------
INSERT INTO `lp_equipment` VALUES (1, '家电', 10, NULL, NULL, 1000.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for lp_finance
-- ----------------------------
DROP TABLE IF EXISTS `lp_finance`;
CREATE TABLE `lp_finance`  (
  `finance_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键递增',
  `finance_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '财务数据名称',
  `finance_content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '财务数据内容',
  `finance_money` decimal(10, 2) NULL DEFAULT NULL COMMENT '发生金额',
  `finance_balance` decimal(10, 2) NULL DEFAULT NULL COMMENT '余额',
  `finance_status` int(11) NULL DEFAULT NULL COMMENT '0表示支出  1表示收入',
  `audit_status` int(11) NULL DEFAULT NULL COMMENT '0表示未审核  1表示审核  2表示审批',
  `supplier_id` int(11) NULL DEFAULT NULL COMMENT '供应商ID',
  `audit_opinion` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '审核意见',
  `audit_time` datetime(0) NULL DEFAULT NULL COMMENT '审核时间',
  `audit_person` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '审核人员',
  `approver_opinion` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '审批意见',
  `approver_time` datetime(0) NULL DEFAULT NULL COMMENT '审批时间',
  `approver_person` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '审批人员',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `create_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '修改者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`finance_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of lp_finance
-- ----------------------------
INSERT INTO `lp_finance` VALUES (1, '财务', '<p>客户财务</p>', 1000.00, 20.00, 0, 0, 1, NULL, NULL, NULL, NULL, NULL, NULL, '小客户', 'admin', '2024-05-28 00:32:20', 'admin', '2024-05-28 01:30:12');

-- ----------------------------
-- Table structure for lp_finished_product
-- ----------------------------
DROP TABLE IF EXISTS `lp_finished_product`;
CREATE TABLE `lp_finished_product`  (
  `finished_product_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键递增',
  `finished_product_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '成品名称',
  `finished_product_num` int(11) NULL DEFAULT NULL COMMENT '成品数据',
  `finished_product_unit` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '成品单位',
  `first_duty` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '带班人员',
  `first_duty_phone` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系电话',
  `grade_class` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '班次',
  `office_time` datetime(0) NULL DEFAULT NULL COMMENT '上班时间',
  `off_time` datetime(0) NULL DEFAULT NULL COMMENT '下班时间',
  `office_num` int(11) NULL DEFAULT NULL COMMENT '上班人数',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `create_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`finished_product_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of lp_finished_product
-- ----------------------------
INSERT INTO `lp_finished_product` VALUES (1, '以纯', 100, '件', '刘主管', '17817189499', '早班', '2024-08-08 08:00:00', '2024-08-08 12:00:00', 10, NULL, NULL, '2024-10-11 10:20:54', NULL, NULL);

-- ----------------------------
-- Table structure for lp_inventory
-- ----------------------------
DROP TABLE IF EXISTS `lp_inventory`;
CREATE TABLE `lp_inventory`  (
  `inventory_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `inventory_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '库存名称',
  `inventory_num` int(11) NULL DEFAULT NULL COMMENT '数量',
  `inventory_price` decimal(10, 2) NULL DEFAULT NULL COMMENT '价格',
  `inventory_unit` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '单位',
  `warehouse_warrant_id` int(11) NULL DEFAULT NULL COMMENT '入库列表ID',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `create_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '修改者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`inventory_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of lp_inventory
-- ----------------------------
INSERT INTO `lp_inventory` VALUES (1, '以纯库存', 1000, 99.00, '件', 1, NULL, NULL, '2024-10-11 10:14:59', NULL, NULL);

-- ----------------------------
-- Table structure for lp_location
-- ----------------------------
DROP TABLE IF EXISTS `lp_location`;
CREATE TABLE `lp_location`  (
  `location_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `location_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'h货位名称',
  `location_encoding` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '货位编码',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `create_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '修改者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`location_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of lp_location
-- ----------------------------
INSERT INTO `lp_location` VALUES (1, 'A区108货位', 'AH101', '女装', NULL, '2024-10-11 10:13:43', NULL, NULL);

-- ----------------------------
-- Table structure for lp_market
-- ----------------------------
DROP TABLE IF EXISTS `lp_market`;
CREATE TABLE `lp_market`  (
  `market_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `market_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '销售名称',
  `client_id` int(11) NULL DEFAULT NULL COMMENT '客户ID',
  `market_num` int(11) NULL DEFAULT NULL COMMENT '销售数量',
  `market_price` decimal(10, 2) NULL DEFAULT NULL COMMENT '销售价格',
  `market_unit` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '单位',
  `audit_status` int(11) NULL DEFAULT NULL COMMENT '0表示未审核  1表示审核  2表示审批',
  `audit_opinion` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '审核意见',
  `audit_time` datetime(0) NULL DEFAULT NULL COMMENT '审核时间。',
  `audit_person` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '审核人',
  `approver_opinion` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '审批意见',
  `approver_time` datetime(0) NULL DEFAULT NULL COMMENT '审批时间',
  `approver_person` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '审批人',
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '描述',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `create_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`market_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of lp_market
-- ----------------------------
INSERT INTO `lp_market` VALUES (1, '采购出货', 1, 100, 10000.00, '件', 0, '同意', '2024-10-22 00:00:00', '刘主管', '同意', '2024-10-15 00:00:00', '刘主管', NULL, NULL, NULL, '2024-10-11 10:25:08', NULL, NULL);

-- ----------------------------
-- Table structure for lp_materials
-- ----------------------------
DROP TABLE IF EXISTS `lp_materials`;
CREATE TABLE `lp_materials`  (
  `lp_materials_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '原料ID',
  `materials_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '原材料名称',
  `materials_num` int(11) NULL DEFAULT NULL COMMENT '原料数量',
  `materials_price` decimal(10, 2) NULL DEFAULT NULL COMMENT '价格',
  `unit` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '单位',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `create_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '修改者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`lp_materials_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of lp_materials
-- ----------------------------

-- ----------------------------
-- Table structure for lp_materials_classify
-- ----------------------------
DROP TABLE IF EXISTS `lp_materials_classify`;
CREATE TABLE `lp_materials_classify`  (
  `materials_classify_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `materials_classify_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '原材料分类名称',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `create_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '修改者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`materials_classify_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of lp_materials_classify
-- ----------------------------
INSERT INTO `lp_materials_classify` VALUES (1, '零件', '设备零件', NULL, '2024-05-04 19:09:29', NULL, NULL);

-- ----------------------------
-- Table structure for lp_procurement_plan
-- ----------------------------
DROP TABLE IF EXISTS `lp_procurement_plan`;
CREATE TABLE `lp_procurement_plan`  (
  `procurement_plan_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `procurement_plan_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '采购计划名称',
  `procurement_plan_num` int(11) NULL DEFAULT NULL COMMENT '数量',
  `procurement_plan_price` decimal(10, 0) NULL DEFAULT NULL COMMENT '价格',
  `unit` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '单位',
  `materials_classify_id` int(11) NULL DEFAULT NULL COMMENT '原材料分类ID',
  `supplier_id` int(11) NULL DEFAULT NULL COMMENT '供应商ID',
  `audit_status` int(11) NULL DEFAULT NULL COMMENT '采购状态：0表示未审核  1表示审核  2表示审批',
  `audit_opinion` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '审核意见',
  `audit_time` datetime(0) NULL DEFAULT NULL COMMENT '审核时间',
  `audit_person` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '审核人员',
  `approver_opinion` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '审批意见',
  `approver_time` datetime(0) NULL DEFAULT NULL COMMENT '审批时间',
  `approver_person` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '审批人员',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `create_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '修改者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`procurement_plan_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of lp_procurement_plan
-- ----------------------------
INSERT INTO `lp_procurement_plan` VALUES (1, '全买', 100, 1000, '国企', NULL, 1, 1, '无意间', '2024-05-04 19:04:55', 'admin', NULL, NULL, NULL, '全买', NULL, '2024-05-04 19:04:44', NULL, NULL);

-- ----------------------------
-- Table structure for lp_product
-- ----------------------------
DROP TABLE IF EXISTS `lp_product`;
CREATE TABLE `lp_product`  (
  `product_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `product_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '成品库存名称',
  `product_num` int(11) NULL DEFAULT NULL COMMENT '数量',
  `product_price` decimal(10, 2) NULL DEFAULT NULL COMMENT '价格',
  `product_unit` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '单位',
  `operation_product_id` int(11) NULL DEFAULT NULL COMMENT '入库列表ID',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `create_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`product_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of lp_product
-- ----------------------------
INSERT INTO `lp_product` VALUES (1, '以纯', 1000, 99.00, '件', 1, NULL, NULL, '2024-10-11 10:21:57', NULL, NULL);

-- ----------------------------
-- Table structure for lp_production_inventory
-- ----------------------------
DROP TABLE IF EXISTS `lp_production_inventory`;
CREATE TABLE `lp_production_inventory`  (
  `production_inventory_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键递增',
  `production_inventory_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '原料名称',
  `production_inventory_num` int(11) NULL DEFAULT NULL COMMENT '原料数量',
  `production_inventory_price` decimal(10, 2) NULL DEFAULT NULL COMMENT '原料价格',
  `production_inventory_unit` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '单位',
  `finished_product_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '成品名称',
  `finished_product_num` int(11) NULL DEFAULT NULL COMMENT '成品数量',
  `finished_product__unit` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '成品单位',
  `loss_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '损耗名称',
  `loss_num` int(11) NULL DEFAULT NULL COMMENT '损耗数量',
  `loss_unit` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '损耗单位',
  `first_duty` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '带班人员',
  `first_duty_phone` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系电话',
  `grade_class` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '班次',
  `office_time` datetime(0) NULL DEFAULT NULL COMMENT '上班时间',
  `off_time` datetime(0) NULL DEFAULT NULL COMMENT '下班时间',
  `office_num` int(11) NULL DEFAULT NULL COMMENT '上班人数',
  `audit_status` int(11) NULL DEFAULT NULL COMMENT '0表示未审核  1表示审核  2表示审批',
  `audit_opinion` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '审核意见',
  `audit_time` datetime(0) NULL DEFAULT NULL COMMENT '审核时间。',
  `audit_person` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '审核人',
  `approver_opinion` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '审批意见',
  `approver_time` datetime(0) NULL DEFAULT NULL COMMENT '审批时间',
  `approver_person` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '审批人',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `create_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`production_inventory_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of lp_production_inventory
-- ----------------------------

-- ----------------------------
-- Table structure for lp_shelf
-- ----------------------------
DROP TABLE IF EXISTS `lp_shelf`;
CREATE TABLE `lp_shelf`  (
  `shelf_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `shelf_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '货架名称',
  `shelf_encoding` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '货架编码',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `create_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '修改者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`shelf_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of lp_shelf
-- ----------------------------
INSERT INTO `lp_shelf` VALUES (1, 'A区货架', 'A101', '服装区', NULL, '2024-10-11 10:13:02', NULL, NULL);

-- ----------------------------
-- Table structure for lp_supplier
-- ----------------------------
DROP TABLE IF EXISTS `lp_supplier`;
CREATE TABLE `lp_supplier`  (
  `supplier_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键递增',
  `supplier_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '供应商名称',
  `contact` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '供应商联系人',
  `classify_id` int(11) NULL DEFAULT NULL COMMENT '供应商分类ID',
  `supplier_address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '供应商地址',
  `supplier_phone` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '供应商联系电话',
  `supplier_synopsis` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '供应商简介',
  `supplier_category` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '供应商类别',
  `audit_status` int(11) NULL DEFAULT NULL COMMENT '0表示未审核  1表示审核  2表示审批 审批后的供应商可以采购操作',
  `audit_opinion` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '审核意见',
  `audit_time` datetime(0) NULL DEFAULT NULL COMMENT '审核时间。',
  `audit_person` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '审核人',
  `approver_opinion` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '审批意见',
  `approver_time` datetime(0) NULL DEFAULT NULL COMMENT '审批时间',
  `approver_person` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '审批人',
  `sort` int(11) NULL DEFAULT NULL COMMENT '排序',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `create_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '修改者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`supplier_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of lp_supplier
-- ----------------------------
INSERT INTO `lp_supplier` VALUES (1, '三科', '柯南', 1, '三科', '123456789', '商品供应', NULL, 1, '无意间', '2024-04-28 08:40:32', 'admin', NULL, NULL, NULL, 1, '三科商品供应', 'admin', '2024-04-28 08:34:51', NULL, NULL);

-- ----------------------------
-- Table structure for lp_temporary
-- ----------------------------
DROP TABLE IF EXISTS `lp_temporary`;
CREATE TABLE `lp_temporary`  (
  `temporary_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '临时采购ID',
  `temporary_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '临时采购名称',
  `temporary_num` int(11) NULL DEFAULT NULL COMMENT '临时采购数量',
  `temporary_price` decimal(10, 2) NULL DEFAULT NULL COMMENT '临时采购价格',
  `unit` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '单位',
  `supplier_id` int(11) NULL DEFAULT NULL COMMENT '供应商ID',
  `materials_classify_id` int(11) NULL DEFAULT NULL COMMENT '分类ID',
  `audit_status` int(11) NULL DEFAULT NULL COMMENT '采购状态：0表示未审核  1表示审核  2表示审批',
  `audit_opinion` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '审核意见',
  `audit_time` datetime(0) NULL DEFAULT NULL COMMENT '审核时间',
  `audit_person` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '审核人员',
  `approver_opinion` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '审批意见',
  `approver_time` datetime(0) NULL DEFAULT NULL COMMENT '审批时间',
  `approver_person` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '审批人员',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `create_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '修改者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`temporary_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of lp_temporary
-- ----------------------------
INSERT INTO `lp_temporary` VALUES (1, '急需', 10, 1000.00, '国企', 1, 1, 1, 'admin', '2024-05-04 19:46:58', NULL, NULL, NULL, NULL, '临时需要', NULL, '2024-05-04 19:17:41', NULL, NULL);
INSERT INTO `lp_temporary` VALUES (2, '急需', 10, 1000.00, '国企', 1, 1, 0, NULL, NULL, NULL, NULL, NULL, NULL, '临时需要', NULL, '2024-05-04 19:17:50', NULL, NULL);
INSERT INTO `lp_temporary` VALUES (3, '急需', 10, 1000.00, '国企', 1, 1, 0, NULL, NULL, NULL, NULL, NULL, NULL, '临时需要', NULL, '2024-05-04 19:17:59', NULL, NULL);

-- ----------------------------
-- Table structure for lp_upkeep
-- ----------------------------
DROP TABLE IF EXISTS `lp_upkeep`;
CREATE TABLE `lp_upkeep`  (
  `upkeep_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键递增',
  `equipment_id` int(11) NULL DEFAULT NULL COMMENT '设备ID',
  `adjunct_id` int(11) NULL DEFAULT NULL COMMENT '设备附件ID',
  `upkeep_name` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '保养名称',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '保养描述',
  `upkeep_period` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '保养周期',
  `announcements` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '注意事项',
  `upkeep_content` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '保养内容',
  `upkeep_price` decimal(10, 2) NULL DEFAULT NULL COMMENT '保养价格',
  `audit_status` int(11) NULL DEFAULT NULL COMMENT '0表示未审核 1表示审核 2表示审批',
  `audit_opinion` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '审核意见',
  `audit_time` datetime(0) NULL DEFAULT NULL COMMENT '审核时间',
  `audit_person` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '审核人员',
  `approver_opinion` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '审批意见',
  `approver_time` datetime(0) NULL DEFAULT NULL COMMENT '审批时间',
  `approver_person` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '审批人员',
  `sort` int(11) NULL DEFAULT NULL COMMENT '排序',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `create_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '修改者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`upkeep_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of lp_upkeep
-- ----------------------------
INSERT INTO `lp_upkeep` VALUES (1, 1, NULL, '全套服务', '整个保养', '10', '好好保养', '<p><s>好好保养</s></p>', 1000.00, 1, '无意间', '2024-05-04 22:49:33', 'admin', NULL, NULL, NULL, 1, '保养好', NULL, '2024-05-04 22:46:39', NULL, '2024-05-04 23:01:48');

-- ----------------------------
-- Table structure for lp_warehouse
-- ----------------------------
DROP TABLE IF EXISTS `lp_warehouse`;
CREATE TABLE `lp_warehouse`  (
  `warehouse_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `warehouse_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '库房名称',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `create_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '修改者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`warehouse_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of lp_warehouse
-- ----------------------------
INSERT INTO `lp_warehouse` VALUES (1, 'A库房', '其它设备仓库', NULL, '2024-10-11 10:12:22', NULL, '2024-10-11 10:12:33');

-- ----------------------------
-- Table structure for lp_warehouse_warrant
-- ----------------------------
DROP TABLE IF EXISTS `lp_warehouse_warrant`;
CREATE TABLE `lp_warehouse_warrant`  (
  `warehouse_warrant_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `warehouse_warrant_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '入库名称',
  `warehouse_warrant_num` int(11) NULL DEFAULT NULL COMMENT '入库数量',
  `warehouse_warrant_price` decimal(10, 2) NULL DEFAULT NULL COMMENT '入库价格',
  `unit` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '单位',
  `warehouse_id` int(11) NULL DEFAULT NULL COMMENT '库房ID',
  `shelf_id` int(11) NULL DEFAULT NULL COMMENT '货架ID',
  `location_id` int(11) NULL DEFAULT NULL COMMENT '库位ID',
  `audit_status` int(11) NULL DEFAULT NULL COMMENT '采购状态：0表示未审核  1表示审核  2表示审批',
  `audit_opinion` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '审核意见',
  `audit_time` datetime(0) NULL DEFAULT NULL COMMENT '审核时间',
  `audit_person` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '审核人员',
  `approver_opinion` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '审批意见',
  `approver_time` datetime(0) NULL DEFAULT NULL COMMENT '审批时间',
  `approver_person` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '审批人员',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `create_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '修改者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`warehouse_warrant_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of lp_warehouse_warrant
-- ----------------------------
INSERT INTO `lp_warehouse_warrant` VALUES (1, '以纯', 100, 99.00, '件', 1, 1, 1, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-10-11 10:14:30', NULL, NULL);

-- ----------------------------
-- Table structure for qrtz_blob_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_blob_triggers`;
CREATE TABLE `qrtz_blob_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `blob_data` blob NULL COMMENT '存放持久化Trigger对象',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_blob_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'Blob类型的触发器表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_blob_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_calendars
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_calendars`;
CREATE TABLE `qrtz_calendars`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '调度名称',
  `calendar_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '日历名称',
  `calendar` blob NOT NULL COMMENT '存放持久化calendar对象',
  PRIMARY KEY (`sched_name`, `calendar_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '日历信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_calendars
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_cron_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_cron_triggers`;
CREATE TABLE `qrtz_cron_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `cron_expression` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'cron表达式',
  `time_zone_id` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '时区',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_cron_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'Cron类型的触发器表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_cron_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_fired_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_fired_triggers`;
CREATE TABLE `qrtz_fired_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '调度名称',
  `entry_id` varchar(95) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '调度器实例id',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `instance_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '调度器实例名',
  `fired_time` bigint(20) NOT NULL COMMENT '触发的时间',
  `sched_time` bigint(20) NOT NULL COMMENT '定时器制定的时间',
  `priority` int(11) NOT NULL COMMENT '优先级',
  `state` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '状态',
  `job_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '任务名称',
  `job_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '任务组名',
  `is_nonconcurrent` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '是否并发',
  `requests_recovery` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '是否接受恢复执行',
  PRIMARY KEY (`sched_name`, `entry_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '已触发的触发器表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_fired_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_job_details
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_job_details`;
CREATE TABLE `qrtz_job_details`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '调度名称',
  `job_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '任务名称',
  `job_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '任务组名',
  `description` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '相关介绍',
  `job_class_name` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '执行任务类名称',
  `is_durable` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '是否持久化',
  `is_nonconcurrent` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '是否并发',
  `is_update_data` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '是否更新数据',
  `requests_recovery` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '是否接受恢复执行',
  `job_data` blob NULL COMMENT '存放持久化job对象',
  PRIMARY KEY (`sched_name`, `job_name`, `job_group`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '任务详细信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_job_details
-- ----------------------------

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

-- ----------------------------
-- Table structure for qrtz_paused_trigger_grps
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_paused_trigger_grps`;
CREATE TABLE `qrtz_paused_trigger_grps`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '调度名称',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  PRIMARY KEY (`sched_name`, `trigger_group`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '暂停的触发器表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_paused_trigger_grps
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_scheduler_state
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_scheduler_state`;
CREATE TABLE `qrtz_scheduler_state`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '调度名称',
  `instance_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '实例名称',
  `last_checkin_time` bigint(20) NOT NULL COMMENT '上次检查时间',
  `checkin_interval` bigint(20) NOT NULL COMMENT '检查间隔时间',
  PRIMARY KEY (`sched_name`, `instance_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '调度器状态表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_scheduler_state
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_simple_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simple_triggers`;
CREATE TABLE `qrtz_simple_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `repeat_count` bigint(20) NOT NULL COMMENT '重复的次数统计',
  `repeat_interval` bigint(20) NOT NULL COMMENT '重复的间隔时间',
  `times_triggered` bigint(20) NOT NULL COMMENT '已经触发的次数',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_simple_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '简单触发器的信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_simple_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_simprop_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simprop_triggers`;
CREATE TABLE `qrtz_simprop_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `str_prop_1` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'String类型的trigger的第一个参数',
  `str_prop_2` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'String类型的trigger的第二个参数',
  `str_prop_3` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'String类型的trigger的第三个参数',
  `int_prop_1` int(11) NULL DEFAULT NULL COMMENT 'int类型的trigger的第一个参数',
  `int_prop_2` int(11) NULL DEFAULT NULL COMMENT 'int类型的trigger的第二个参数',
  `long_prop_1` bigint(20) NULL DEFAULT NULL COMMENT 'long类型的trigger的第一个参数',
  `long_prop_2` bigint(20) NULL DEFAULT NULL COMMENT 'long类型的trigger的第二个参数',
  `dec_prop_1` decimal(13, 4) NULL DEFAULT NULL COMMENT 'decimal类型的trigger的第一个参数',
  `dec_prop_2` decimal(13, 4) NULL DEFAULT NULL COMMENT 'decimal类型的trigger的第二个参数',
  `bool_prop_1` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'Boolean类型的trigger的第一个参数',
  `bool_prop_2` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'Boolean类型的trigger的第二个参数',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_simprop_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '同步机制的行锁表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_simprop_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_triggers`;
CREATE TABLE `qrtz_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '触发器的名字',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '触发器所属组的名字',
  `job_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'qrtz_job_details表job_name的外键',
  `job_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'qrtz_job_details表job_group的外键',
  `description` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '相关介绍',
  `next_fire_time` bigint(20) NULL DEFAULT NULL COMMENT '上一次触发时间（毫秒）',
  `prev_fire_time` bigint(20) NULL DEFAULT NULL COMMENT '下一次触发时间（默认为-1表示不触发）',
  `priority` int(11) NULL DEFAULT NULL COMMENT '优先级',
  `trigger_state` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '触发器状态',
  `trigger_type` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '触发器的类型',
  `start_time` bigint(20) NOT NULL COMMENT '开始时间',
  `end_time` bigint(20) NULL DEFAULT NULL COMMENT '结束时间',
  `calendar_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '日程表名称',
  `misfire_instr` smallint(6) NULL DEFAULT NULL COMMENT '补偿执行的策略',
  `job_data` blob NULL COMMENT '存放持久化job对象',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  INDEX `sched_name`(`sched_name`, `job_name`, `job_group`) USING BTREE,
  CONSTRAINT `qrtz_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `job_name`, `job_group`) REFERENCES `qrtz_job_details` (`sched_name`, `job_name`, `job_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '触发器详细信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config`  (
  `config_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '参数主键',
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
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '参数配置表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_config
-- ----------------------------
INSERT INTO `sys_config` VALUES (1, '主框架页-默认皮肤样式名称', 'sys.index.skinName', 'skin-blue', 'Y', 'admin', '2024-04-27 19:46:02', '', NULL, '蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow');
INSERT INTO `sys_config` VALUES (2, '用户管理-账号初始密码', 'sys.user.initPassword', '123456', 'Y', 'admin', '2024-04-27 19:46:02', '', NULL, '初始化密码 123456');
INSERT INTO `sys_config` VALUES (3, '主框架页-侧边栏主题', 'sys.index.sideTheme', 'theme-dark', 'Y', 'admin', '2024-04-27 19:46:02', '', NULL, '深色主题theme-dark，浅色主题theme-light');
INSERT INTO `sys_config` VALUES (4, '账号自助-验证码开关', 'sys.account.captchaEnabled', 'true', 'Y', 'admin', '2024-04-27 19:46:02', '', NULL, '是否开启验证码功能（true开启，false关闭）');
INSERT INTO `sys_config` VALUES (5, '账号自助-是否开启用户注册功能', 'sys.account.registerUser', 'false', 'Y', 'admin', '2024-04-27 19:46:02', '', NULL, '是否开启注册用户功能（true开启，false关闭）');
INSERT INTO `sys_config` VALUES (6, '用户登录-黑名单列表', 'sys.login.blackIPList', '', 'Y', 'admin', '2024-04-27 19:46:02', '', NULL, '设置登录IP黑名单限制，多个匹配项以;分隔，支持匹配（*通配、网段）');

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept`  (
  `dept_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '部门id',
  `parent_id` bigint(20) NULL DEFAULT 0 COMMENT '父部门id',
  `ancestors` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '祖级列表',
  `dept_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '部门名称',
  `order_num` int(11) NULL DEFAULT 0 COMMENT '显示顺序',
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
) ENGINE = InnoDB AUTO_INCREMENT = 200 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '部门表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
INSERT INTO `sys_dept` VALUES (100, 0, '0', '华安素材', 0, '华安', '17817189499', '463183884@qq.com', '0', '0', 'admin', '2024-04-27 19:46:02', 'admin', '2024-10-11 10:08:12');
INSERT INTO `sys_dept` VALUES (101, 100, '0,100', '深圳总公司', 1, '华安', '17817189499', '463183884@qq.com', '0', '0', 'admin', '2024-04-27 19:46:02', 'admin', '2024-10-11 10:10:23');
INSERT INTO `sys_dept` VALUES (102, 100, '0,100', '长沙分公司', 2, '华安', '17817189499', '463183884@qq.com', '0', '0', 'admin', '2024-04-27 19:46:02', 'admin', '2024-10-11 10:10:27');
INSERT INTO `sys_dept` VALUES (103, 101, '0,100,101', '研发部门', 1, '华安', '17817189499', '463183884@qq.com', '0', '0', 'admin', '2024-04-27 19:46:02', '', NULL);
INSERT INTO `sys_dept` VALUES (104, 101, '0,100,101', '市场部门', 2, '华安', '17817189499', '463183884@qq.com', '0', '0', 'admin', '2024-04-27 19:46:02', '', NULL);
INSERT INTO `sys_dept` VALUES (105, 101, '0,100,101', '测试部门', 3, '华安', '17817189499', '463183884@qq.com', '0', '0', 'admin', '2024-04-27 19:46:02', '', NULL);
INSERT INTO `sys_dept` VALUES (106, 101, '0,100,101', '财务部门', 4, '华安', '17817189499', '463183884@qq.com', '0', '0', 'admin', '2024-04-27 19:46:02', '', NULL);
INSERT INTO `sys_dept` VALUES (107, 101, '0,100,101', '运维部门', 5, '华安', '17817189499', '463183884@qq.com', '0', '0', 'admin', '2024-04-27 19:46:02', 'admin', '2024-10-11 10:10:31');
INSERT INTO `sys_dept` VALUES (108, 102, '0,100,102', '市场部门', 1, '华安', '17817189499', '463183884@qq.com', '0', '0', 'admin', '2024-04-27 19:46:02', '', NULL);
INSERT INTO `sys_dept` VALUES (109, 102, '0,100,102', '财务部门', 2, '华安', '17817189499', '463183884@qq.com', '0', '0', 'admin', '2024-04-27 19:46:02', '', NULL);

-- ----------------------------
-- Table structure for sys_dict_data
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_data`;
CREATE TABLE `sys_dict_data`  (
  `dict_code` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '字典编码',
  `dict_sort` int(11) NULL DEFAULT 0 COMMENT '字典排序',
  `dict_label` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '字典标签',
  `dict_value` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '字典键值',
  `dict_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '字典类型',
  `css_class` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '样式属性（其他样式扩展）',
  `list_class` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '表格回显样式',
  `is_default` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'N' COMMENT '是否默认（Y是 N否）',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_code`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '字典数据表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dict_data
-- ----------------------------
INSERT INTO `sys_dict_data` VALUES (1, 1, '男', '0', 'sys_user_sex', '', '', 'Y', '0', 'admin', '2024-04-27 19:46:02', '', NULL, '性别男');
INSERT INTO `sys_dict_data` VALUES (2, 2, '女', '1', 'sys_user_sex', '', '', 'N', '0', 'admin', '2024-04-27 19:46:02', '', NULL, '性别女');
INSERT INTO `sys_dict_data` VALUES (3, 3, '未知', '2', 'sys_user_sex', '', '', 'N', '0', 'admin', '2024-04-27 19:46:02', '', NULL, '性别未知');
INSERT INTO `sys_dict_data` VALUES (4, 1, '显示', '0', 'sys_show_hide', '', 'primary', 'Y', '0', 'admin', '2024-04-27 19:46:02', '', NULL, '显示菜单');
INSERT INTO `sys_dict_data` VALUES (5, 2, '隐藏', '1', 'sys_show_hide', '', 'danger', 'N', '0', 'admin', '2024-04-27 19:46:02', '', NULL, '隐藏菜单');
INSERT INTO `sys_dict_data` VALUES (6, 1, '正常', '0', 'sys_normal_disable', '', 'primary', 'Y', '0', 'admin', '2024-04-27 19:46:02', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (7, 2, '停用', '1', 'sys_normal_disable', '', 'danger', 'N', '0', 'admin', '2024-04-27 19:46:02', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (8, 1, '正常', '0', 'sys_job_status', '', 'primary', 'Y', '0', 'admin', '2024-04-27 19:46:02', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (9, 2, '暂停', '1', 'sys_job_status', '', 'danger', 'N', '0', 'admin', '2024-04-27 19:46:02', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (10, 1, '默认', 'DEFAULT', 'sys_job_group', '', '', 'Y', '0', 'admin', '2024-04-27 19:46:02', '', NULL, '默认分组');
INSERT INTO `sys_dict_data` VALUES (11, 2, '系统', 'SYSTEM', 'sys_job_group', '', '', 'N', '0', 'admin', '2024-04-27 19:46:02', '', NULL, '系统分组');
INSERT INTO `sys_dict_data` VALUES (12, 1, '是', 'Y', 'sys_yes_no', '', 'primary', 'Y', '0', 'admin', '2024-04-27 19:46:02', '', NULL, '系统默认是');
INSERT INTO `sys_dict_data` VALUES (13, 2, '否', 'N', 'sys_yes_no', '', 'danger', 'N', '0', 'admin', '2024-04-27 19:46:02', '', NULL, '系统默认否');
INSERT INTO `sys_dict_data` VALUES (14, 1, '通知', '1', 'sys_notice_type', '', 'warning', 'Y', '0', 'admin', '2024-04-27 19:46:02', '', NULL, '通知');
INSERT INTO `sys_dict_data` VALUES (15, 2, '公告', '2', 'sys_notice_type', '', 'success', 'N', '0', 'admin', '2024-04-27 19:46:02', '', NULL, '公告');
INSERT INTO `sys_dict_data` VALUES (16, 1, '正常', '0', 'sys_notice_status', '', 'primary', 'Y', '0', 'admin', '2024-04-27 19:46:02', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (17, 2, '关闭', '1', 'sys_notice_status', '', 'danger', 'N', '0', 'admin', '2024-04-27 19:46:02', '', NULL, '关闭状态');
INSERT INTO `sys_dict_data` VALUES (18, 99, '其他', '0', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2024-04-27 19:46:02', '', NULL, '其他操作');
INSERT INTO `sys_dict_data` VALUES (19, 1, '新增', '1', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2024-04-27 19:46:02', '', NULL, '新增操作');
INSERT INTO `sys_dict_data` VALUES (20, 2, '修改', '2', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2024-04-27 19:46:02', '', NULL, '修改操作');
INSERT INTO `sys_dict_data` VALUES (21, 3, '删除', '3', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2024-04-27 19:46:02', '', NULL, '删除操作');
INSERT INTO `sys_dict_data` VALUES (22, 4, '授权', '4', 'sys_oper_type', '', 'primary', 'N', '0', 'admin', '2024-04-27 19:46:02', '', NULL, '授权操作');
INSERT INTO `sys_dict_data` VALUES (23, 5, '导出', '5', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2024-04-27 19:46:02', '', NULL, '导出操作');
INSERT INTO `sys_dict_data` VALUES (24, 6, '导入', '6', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2024-04-27 19:46:02', '', NULL, '导入操作');
INSERT INTO `sys_dict_data` VALUES (25, 7, '强退', '7', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2024-04-27 19:46:02', '', NULL, '强退操作');
INSERT INTO `sys_dict_data` VALUES (26, 8, '生成代码', '8', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2024-04-27 19:46:02', '', NULL, '生成操作');
INSERT INTO `sys_dict_data` VALUES (27, 9, '清空数据', '9', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2024-04-27 19:46:02', '', NULL, '清空操作');
INSERT INTO `sys_dict_data` VALUES (28, 1, '成功', '0', 'sys_common_status', '', 'primary', 'N', '0', 'admin', '2024-04-27 19:46:02', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (29, 2, '失败', '1', 'sys_common_status', '', 'danger', 'N', '0', 'admin', '2024-04-27 19:46:02', '', NULL, '停用状态');

-- ----------------------------
-- Table structure for sys_dict_type
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_type`;
CREATE TABLE `sys_dict_type`  (
  `dict_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '字典主键',
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
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '字典类型表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dict_type
-- ----------------------------
INSERT INTO `sys_dict_type` VALUES (1, '用户性别', 'sys_user_sex', '0', 'admin', '2024-04-27 19:46:02', '', NULL, '用户性别列表');
INSERT INTO `sys_dict_type` VALUES (2, '菜单状态', 'sys_show_hide', '0', 'admin', '2024-04-27 19:46:02', '', NULL, '菜单状态列表');
INSERT INTO `sys_dict_type` VALUES (3, '系统开关', 'sys_normal_disable', '0', 'admin', '2024-04-27 19:46:02', '', NULL, '系统开关列表');
INSERT INTO `sys_dict_type` VALUES (4, '任务状态', 'sys_job_status', '0', 'admin', '2024-04-27 19:46:02', '', NULL, '任务状态列表');
INSERT INTO `sys_dict_type` VALUES (5, '任务分组', 'sys_job_group', '0', 'admin', '2024-04-27 19:46:02', '', NULL, '任务分组列表');
INSERT INTO `sys_dict_type` VALUES (6, '系统是否', 'sys_yes_no', '0', 'admin', '2024-04-27 19:46:02', '', NULL, '系统是否列表');
INSERT INTO `sys_dict_type` VALUES (7, '通知类型', 'sys_notice_type', '0', 'admin', '2024-04-27 19:46:02', '', NULL, '通知类型列表');
INSERT INTO `sys_dict_type` VALUES (8, '通知状态', 'sys_notice_status', '0', 'admin', '2024-04-27 19:46:02', '', NULL, '通知状态列表');
INSERT INTO `sys_dict_type` VALUES (9, '操作类型', 'sys_oper_type', '0', 'admin', '2024-04-27 19:46:02', '', NULL, '操作类型列表');
INSERT INTO `sys_dict_type` VALUES (10, '系统状态', 'sys_common_status', '0', 'admin', '2024-04-27 19:46:02', '', NULL, '登录状态列表');

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
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '备注信息',
  PRIMARY KEY (`job_id`, `job_name`, `job_group`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '定时任务调度表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_job
-- ----------------------------
INSERT INTO `sys_job` VALUES (1, '系统默认（无参）', 'DEFAULT', 'ryTask.ryNoParams', '0/10 * * * * ?', '3', '1', '1', 'admin', '2024-04-27 19:46:02', '', NULL, '');
INSERT INTO `sys_job` VALUES (2, '系统默认（有参）', 'DEFAULT', 'ryTask.ryParams(\'ry\')', '0/15 * * * * ?', '3', '1', '1', 'admin', '2024-04-27 19:46:02', '', NULL, '');
INSERT INTO `sys_job` VALUES (3, '系统默认（多参）', 'DEFAULT', 'ryTask.ryMultipleParams(\'ry\', true, 2000L, 316.50D, 100)', '0/20 * * * * ?', '3', '1', '1', 'admin', '2024-04-27 19:46:02', '', NULL, '');

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
-- Records of sys_job_log
-- ----------------------------

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
  PRIMARY KEY (`info_id`) USING BTREE,
  INDEX `idx_sys_logininfor_s`(`status`) USING BTREE,
  INDEX `idx_sys_logininfor_lt`(`login_time`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 152 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '系统访问记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_logininfor
-- ----------------------------
INSERT INTO `sys_logininfor` VALUES (100, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2024-04-27 23:22:01');
INSERT INTO `sys_logininfor` VALUES (101, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2024-04-28 08:12:48');
INSERT INTO `sys_logininfor` VALUES (102, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2024-04-28 08:29:56');
INSERT INTO `sys_logininfor` VALUES (103, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2024-05-04 11:56:38');
INSERT INTO `sys_logininfor` VALUES (104, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '验证码已失效', '2024-05-04 12:14:23');
INSERT INTO `sys_logininfor` VALUES (105, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2024-05-04 12:14:33');
INSERT INTO `sys_logininfor` VALUES (106, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2024-05-04 12:59:27');
INSERT INTO `sys_logininfor` VALUES (107, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2024-05-04 13:36:32');
INSERT INTO `sys_logininfor` VALUES (108, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2024-05-04 13:53:22');
INSERT INTO `sys_logininfor` VALUES (109, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '验证码已失效', '2024-05-04 18:29:31');
INSERT INTO `sys_logininfor` VALUES (110, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2024-05-04 18:29:35');
INSERT INTO `sys_logininfor` VALUES (111, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2024-05-04 19:28:49');
INSERT INTO `sys_logininfor` VALUES (112, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2024-05-04 21:54:01');
INSERT INTO `sys_logininfor` VALUES (113, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2024-05-04 22:36:36');
INSERT INTO `sys_logininfor` VALUES (114, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2024-05-04 22:57:47');
INSERT INTO `sys_logininfor` VALUES (115, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2024-05-04 23:58:41');
INSERT INTO `sys_logininfor` VALUES (116, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2024-05-05 07:50:37');
INSERT INTO `sys_logininfor` VALUES (117, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2024-05-05 08:40:25');
INSERT INTO `sys_logininfor` VALUES (118, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2024-05-05 13:52:58');
INSERT INTO `sys_logininfor` VALUES (119, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2024-05-05 14:21:57');
INSERT INTO `sys_logininfor` VALUES (120, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2024-05-06 00:02:04');
INSERT INTO `sys_logininfor` VALUES (121, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2024-05-09 14:57:43');
INSERT INTO `sys_logininfor` VALUES (122, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2024-05-09 15:59:07');
INSERT INTO `sys_logininfor` VALUES (123, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2024-05-12 15:26:23');
INSERT INTO `sys_logininfor` VALUES (124, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2024-05-12 15:43:13');
INSERT INTO `sys_logininfor` VALUES (125, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2024-05-12 16:15:18');
INSERT INTO `sys_logininfor` VALUES (126, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2024-05-13 14:02:15');
INSERT INTO `sys_logininfor` VALUES (127, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2024-05-15 16:50:46');
INSERT INTO `sys_logininfor` VALUES (128, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2024-05-15 21:56:56');
INSERT INTO `sys_logininfor` VALUES (129, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2024-05-15 21:58:27');
INSERT INTO `sys_logininfor` VALUES (130, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '验证码已失效', '2024-05-15 23:17:16');
INSERT INTO `sys_logininfor` VALUES (131, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2024-05-15 23:17:20');
INSERT INTO `sys_logininfor` VALUES (132, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2024-05-16 00:10:36');
INSERT INTO `sys_logininfor` VALUES (133, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2024-05-18 09:45:12');
INSERT INTO `sys_logininfor` VALUES (134, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2024-05-18 10:08:40');
INSERT INTO `sys_logininfor` VALUES (135, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2024-05-18 10:22:45');
INSERT INTO `sys_logininfor` VALUES (136, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2024-05-19 23:13:18');
INSERT INTO `sys_logininfor` VALUES (137, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2024-05-20 00:45:45');
INSERT INTO `sys_logininfor` VALUES (138, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2024-05-24 16:10:01');
INSERT INTO `sys_logininfor` VALUES (139, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2024-05-24 16:14:48');
INSERT INTO `sys_logininfor` VALUES (140, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2024-05-24 19:58:16');
INSERT INTO `sys_logininfor` VALUES (141, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2024-05-28 00:17:00');
INSERT INTO `sys_logininfor` VALUES (142, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2024-05-28 01:51:43');
INSERT INTO `sys_logininfor` VALUES (143, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-11 09:44:52');
INSERT INTO `sys_logininfor` VALUES (144, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-10-11 09:47:33');
INSERT INTO `sys_logininfor` VALUES (145, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-11 09:47:39');
INSERT INTO `sys_logininfor` VALUES (146, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-10-11 09:50:50');
INSERT INTO `sys_logininfor` VALUES (147, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-11 09:50:58');
INSERT INTO `sys_logininfor` VALUES (148, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-10-11 09:51:28');
INSERT INTO `sys_logininfor` VALUES (149, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-11 09:51:33');
INSERT INTO `sys_logininfor` VALUES (150, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-10-11 09:51:47');
INSERT INTO `sys_logininfor` VALUES (151, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-11 09:52:28');

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu`  (
  `menu_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `menu_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '菜单名称',
  `parent_id` bigint(20) NULL DEFAULT 0 COMMENT '父菜单ID',
  `order_num` int(11) NULL DEFAULT 0 COMMENT '显示顺序',
  `path` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '路由地址',
  `component` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '组件路径',
  `query` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '路由参数',
  `is_frame` int(11) NULL DEFAULT 1 COMMENT '是否为外链（0是 1否）',
  `is_cache` int(11) NULL DEFAULT 0 COMMENT '是否缓存（0缓存 1不缓存）',
  `menu_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '菜单类型（M目录 C菜单 F按钮）',
  `visible` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '菜单状态（0显示 1隐藏）',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '菜单状态（0正常 1停用）',
  `perms` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '权限标识',
  `icon` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '#' COMMENT '菜单图标',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`menu_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2033 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '菜单权限表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES (1, '系统管理', 0, 1, 'system', NULL, '', 1, 0, 'M', '0', '0', '', 'system', 'admin', '2024-04-27 19:46:02', 'admin', '2024-05-24 16:14:25', '系统管理目录');
INSERT INTO `sys_menu` VALUES (2, '系统监控', 0, 11, 'monitor', NULL, '', 1, 0, 'M', '0', '0', '', 'monitor', 'admin', '2024-04-27 19:46:02', 'admin', '2024-05-24 16:14:16', '系统监控目录');
INSERT INTO `sys_menu` VALUES (3, '系统工具', 0, 12, 'tool', NULL, '', 1, 0, 'M', '0', '0', '', 'tool', 'admin', '2024-04-27 19:46:02', 'admin', '2024-05-24 16:14:03', '系统工具目录');
INSERT INTO `sys_menu` VALUES (100, '用户管理', 1, 1, 'user', 'system/user/index', '', 1, 0, 'C', '0', '0', 'system:user:list', 'user', 'admin', '2024-04-27 19:46:02', '', NULL, '用户管理菜单');
INSERT INTO `sys_menu` VALUES (101, '角色管理', 1, 2, 'role', 'system/role/index', '', 1, 0, 'C', '0', '0', 'system:role:list', 'peoples', 'admin', '2024-04-27 19:46:02', '', NULL, '角色管理菜单');
INSERT INTO `sys_menu` VALUES (102, '菜单管理', 1, 3, 'menu', 'system/menu/index', '', 1, 0, 'C', '0', '0', 'system:menu:list', 'tree-table', 'admin', '2024-04-27 19:46:02', '', NULL, '菜单管理菜单');
INSERT INTO `sys_menu` VALUES (103, '部门管理', 1, 4, 'dept', 'system/dept/index', '', 1, 0, 'C', '0', '0', 'system:dept:list', 'tree', 'admin', '2024-04-27 19:46:02', '', NULL, '部门管理菜单');
INSERT INTO `sys_menu` VALUES (104, '岗位管理', 1, 5, 'post', 'system/post/index', '', 1, 0, 'C', '0', '0', 'system:post:list', 'post', 'admin', '2024-04-27 19:46:02', '', NULL, '岗位管理菜单');
INSERT INTO `sys_menu` VALUES (105, '字典管理', 1, 6, 'dict', 'system/dict/index', '', 1, 0, 'C', '0', '0', 'system:dict:list', 'dict', 'admin', '2024-04-27 19:46:02', '', NULL, '字典管理菜单');
INSERT INTO `sys_menu` VALUES (106, '参数设置', 1, 7, 'config', 'system/config/index', '', 1, 0, 'C', '0', '0', 'system:config:list', 'edit', 'admin', '2024-04-27 19:46:02', '', NULL, '参数设置菜单');
INSERT INTO `sys_menu` VALUES (107, '通知公告', 1, 8, 'notice', 'system/notice/index', '', 1, 0, 'C', '0', '0', 'system:notice:list', 'message', 'admin', '2024-04-27 19:46:02', '', NULL, '通知公告菜单');
INSERT INTO `sys_menu` VALUES (108, '日志管理', 1, 9, 'log', '', '', 1, 0, 'M', '0', '0', '', 'log', 'admin', '2024-04-27 19:46:02', '', NULL, '日志管理菜单');
INSERT INTO `sys_menu` VALUES (109, '在线用户', 2, 1, 'online', 'monitor/online/index', '', 1, 0, 'C', '0', '0', 'monitor:online:list', 'online', 'admin', '2024-04-27 19:46:02', '', NULL, '在线用户菜单');
INSERT INTO `sys_menu` VALUES (110, '定时任务', 2, 2, 'job', 'monitor/job/index', '', 1, 0, 'C', '0', '0', 'monitor:job:list', 'job', 'admin', '2024-04-27 19:46:02', '', NULL, '定时任务菜单');
INSERT INTO `sys_menu` VALUES (111, '数据监控', 2, 3, 'druid', 'monitor/druid/index', '', 1, 0, 'C', '0', '0', 'monitor:druid:list', 'druid', 'admin', '2024-04-27 19:46:02', '', NULL, '数据监控菜单');
INSERT INTO `sys_menu` VALUES (112, '服务监控', 2, 4, 'server', 'monitor/server/index', '', 1, 0, 'C', '0', '0', 'monitor:server:list', 'server', 'admin', '2024-04-27 19:46:02', '', NULL, '服务监控菜单');
INSERT INTO `sys_menu` VALUES (113, '缓存监控', 2, 5, 'cache', 'monitor/cache/index', '', 1, 0, 'C', '0', '0', 'monitor:cache:list', 'redis', 'admin', '2024-04-27 19:46:02', '', NULL, '缓存监控菜单');
INSERT INTO `sys_menu` VALUES (114, '缓存列表', 2, 6, 'cacheList', 'monitor/cache/list', '', 1, 0, 'C', '0', '0', 'monitor:cache:list', 'redis-list', 'admin', '2024-04-27 19:46:02', '', NULL, '缓存列表菜单');
INSERT INTO `sys_menu` VALUES (115, '表单构建', 3, 1, 'build', 'tool/build/index', '', 1, 0, 'C', '0', '0', 'tool:build:list', 'build', 'admin', '2024-04-27 19:46:02', '', NULL, '表单构建菜单');
INSERT INTO `sys_menu` VALUES (116, '代码生成', 3, 2, 'gen', 'tool/gen/index', '', 1, 0, 'C', '0', '0', 'tool:gen:list', 'code', 'admin', '2024-04-27 19:46:02', '', NULL, '代码生成菜单');
INSERT INTO `sys_menu` VALUES (117, '系统接口', 3, 3, 'swagger', 'tool/swagger/index', '', 1, 0, 'C', '0', '0', 'tool:swagger:list', 'swagger', 'admin', '2024-04-27 19:46:02', '', NULL, '系统接口菜单');
INSERT INTO `sys_menu` VALUES (500, '操作日志', 108, 1, 'operlog', 'monitor/operlog/index', '', 1, 0, 'C', '0', '0', 'monitor:operlog:list', 'form', 'admin', '2024-04-27 19:46:02', '', NULL, '操作日志菜单');
INSERT INTO `sys_menu` VALUES (501, '登录日志', 108, 2, 'logininfor', 'monitor/logininfor/index', '', 1, 0, 'C', '0', '0', 'monitor:logininfor:list', 'logininfor', 'admin', '2024-04-27 19:46:02', '', NULL, '登录日志菜单');
INSERT INTO `sys_menu` VALUES (1000, '用户查询', 100, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:user:query', '#', 'admin', '2024-04-27 19:46:02', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1001, '用户新增', 100, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:user:add', '#', 'admin', '2024-04-27 19:46:02', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1002, '用户修改', 100, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:user:edit', '#', 'admin', '2024-04-27 19:46:02', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1003, '用户删除', 100, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:user:remove', '#', 'admin', '2024-04-27 19:46:02', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1004, '用户导出', 100, 5, '', '', '', 1, 0, 'F', '0', '0', 'system:user:export', '#', 'admin', '2024-04-27 19:46:02', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1005, '用户导入', 100, 6, '', '', '', 1, 0, 'F', '0', '0', 'system:user:import', '#', 'admin', '2024-04-27 19:46:02', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1006, '重置密码', 100, 7, '', '', '', 1, 0, 'F', '0', '0', 'system:user:resetPwd', '#', 'admin', '2024-04-27 19:46:02', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1007, '角色查询', 101, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:role:query', '#', 'admin', '2024-04-27 19:46:02', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1008, '角色新增', 101, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:role:add', '#', 'admin', '2024-04-27 19:46:02', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1009, '角色修改', 101, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:role:edit', '#', 'admin', '2024-04-27 19:46:02', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1010, '角色删除', 101, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:role:remove', '#', 'admin', '2024-04-27 19:46:02', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1011, '角色导出', 101, 5, '', '', '', 1, 0, 'F', '0', '0', 'system:role:export', '#', 'admin', '2024-04-27 19:46:02', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1012, '菜单查询', 102, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:query', '#', 'admin', '2024-04-27 19:46:02', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1013, '菜单新增', 102, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:add', '#', 'admin', '2024-04-27 19:46:02', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1014, '菜单修改', 102, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:edit', '#', 'admin', '2024-04-27 19:46:02', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1015, '菜单删除', 102, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:remove', '#', 'admin', '2024-04-27 19:46:02', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1016, '部门查询', 103, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:query', '#', 'admin', '2024-04-27 19:46:02', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1017, '部门新增', 103, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:add', '#', 'admin', '2024-04-27 19:46:02', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1018, '部门修改', 103, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:edit', '#', 'admin', '2024-04-27 19:46:02', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1019, '部门删除', 103, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:remove', '#', 'admin', '2024-04-27 19:46:02', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1020, '岗位查询', 104, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:post:query', '#', 'admin', '2024-04-27 19:46:02', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1021, '岗位新增', 104, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:post:add', '#', 'admin', '2024-04-27 19:46:02', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1022, '岗位修改', 104, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:post:edit', '#', 'admin', '2024-04-27 19:46:02', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1023, '岗位删除', 104, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:post:remove', '#', 'admin', '2024-04-27 19:46:02', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1024, '岗位导出', 104, 5, '', '', '', 1, 0, 'F', '0', '0', 'system:post:export', '#', 'admin', '2024-04-27 19:46:02', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1025, '字典查询', 105, 1, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:query', '#', 'admin', '2024-04-27 19:46:02', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1026, '字典新增', 105, 2, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:add', '#', 'admin', '2024-04-27 19:46:02', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1027, '字典修改', 105, 3, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:edit', '#', 'admin', '2024-04-27 19:46:02', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1028, '字典删除', 105, 4, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:remove', '#', 'admin', '2024-04-27 19:46:02', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1029, '字典导出', 105, 5, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:export', '#', 'admin', '2024-04-27 19:46:02', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1030, '参数查询', 106, 1, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:query', '#', 'admin', '2024-04-27 19:46:02', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1031, '参数新增', 106, 2, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:add', '#', 'admin', '2024-04-27 19:46:02', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1032, '参数修改', 106, 3, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:edit', '#', 'admin', '2024-04-27 19:46:02', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1033, '参数删除', 106, 4, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:remove', '#', 'admin', '2024-04-27 19:46:02', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1034, '参数导出', 106, 5, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:export', '#', 'admin', '2024-04-27 19:46:02', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1035, '公告查询', 107, 1, '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:query', '#', 'admin', '2024-04-27 19:46:02', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1036, '公告新增', 107, 2, '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:add', '#', 'admin', '2024-04-27 19:46:02', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1037, '公告修改', 107, 3, '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:edit', '#', 'admin', '2024-04-27 19:46:02', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1038, '公告删除', 107, 4, '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:remove', '#', 'admin', '2024-04-27 19:46:02', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1039, '操作查询', 500, 1, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:operlog:query', '#', 'admin', '2024-04-27 19:46:02', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1040, '操作删除', 500, 2, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:operlog:remove', '#', 'admin', '2024-04-27 19:46:02', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1041, '日志导出', 500, 3, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:operlog:export', '#', 'admin', '2024-04-27 19:46:02', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1042, '登录查询', 501, 1, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:query', '#', 'admin', '2024-04-27 19:46:02', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1043, '登录删除', 501, 2, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:remove', '#', 'admin', '2024-04-27 19:46:02', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1044, '日志导出', 501, 3, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:export', '#', 'admin', '2024-04-27 19:46:02', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1045, '账户解锁', 501, 4, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:unlock', '#', 'admin', '2024-04-27 19:46:02', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1046, '在线查询', 109, 1, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:online:query', '#', 'admin', '2024-04-27 19:46:02', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1047, '批量强退', 109, 2, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:online:batchLogout', '#', 'admin', '2024-04-27 19:46:02', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1048, '单条强退', 109, 3, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:online:forceLogout', '#', 'admin', '2024-04-27 19:46:02', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1049, '任务查询', 110, 1, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:query', '#', 'admin', '2024-04-27 19:46:02', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1050, '任务新增', 110, 2, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:add', '#', 'admin', '2024-04-27 19:46:02', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1051, '任务修改', 110, 3, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:edit', '#', 'admin', '2024-04-27 19:46:02', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1052, '任务删除', 110, 4, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:remove', '#', 'admin', '2024-04-27 19:46:02', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1053, '状态修改', 110, 5, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:changeStatus', '#', 'admin', '2024-04-27 19:46:02', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1054, '任务导出', 110, 6, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:export', '#', 'admin', '2024-04-27 19:46:02', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1055, '生成查询', 116, 1, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:query', '#', 'admin', '2024-04-27 19:46:02', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1056, '生成修改', 116, 2, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:edit', '#', 'admin', '2024-04-27 19:46:02', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1057, '生成删除', 116, 3, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:remove', '#', 'admin', '2024-04-27 19:46:02', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1058, '导入代码', 116, 4, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:import', '#', 'admin', '2024-04-27 19:46:02', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1059, '预览代码', 116, 5, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:preview', '#', 'admin', '2024-04-27 19:46:02', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1060, '生成代码', 116, 6, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:code', '#', 'admin', '2024-04-27 19:46:02', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2000, '供应商管理', 0, 2, 'classify', NULL, NULL, 1, 0, 'M', '0', '0', NULL, 'documentation', 'admin', '2024-04-27 23:24:37', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2001, '供应商分类', 2000, 1, 'classify/classify/index', 'classify/classify/index', NULL, 1, 0, 'C', '0', '0', '', 'example', 'admin', '2024-04-27 23:26:18', 'admin', '2024-04-27 23:27:03', '');
INSERT INTO `sys_menu` VALUES (2002, '供应商列表', 2000, 2, 'supplier', 'supplier/supplier/index', NULL, 1, 0, 'C', '0', '0', NULL, 'color', 'admin', '2024-04-28 08:21:02', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2003, '设备管理', 0, 3, 'classification', NULL, NULL, 1, 0, 'M', '0', '0', NULL, 'documentation', 'admin', '2024-04-28 08:47:50', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2004, '设备分类', 2003, 1, 'classification', 'classification/classification/index', NULL, 1, 0, 'C', '0', '0', NULL, 'chart', 'admin', '2024-04-28 08:49:32', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2005, '设备列表', 2003, 2, 'equipment', 'equipment/equipment/index', NULL, 1, 0, 'C', '0', '0', '', 'chart', 'admin', '2024-04-28 08:53:26', 'admin', '2024-04-28 08:53:49', '');
INSERT INTO `sys_menu` VALUES (2006, '设备附件列表', 2003, 3, 'adjunct', 'adjunct/adjunct/index', NULL, 1, 0, 'C', '0', '0', '', 'dict', 'admin', '2024-05-04 13:00:47', 'admin', '2024-05-04 13:01:36', '');
INSERT INTO `sys_menu` VALUES (2007, '财务管理', 0, 4, 'finance', NULL, NULL, 1, 0, 'M', '0', '0', NULL, 'documentation', 'admin', '2024-05-04 13:07:53', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2008, '财务数据', 2007, 1, 'finance', 'finance/finance/index', NULL, 1, 0, 'C', '0', '0', '', 'edit', 'admin', '2024-05-04 13:49:47', 'admin', '2024-05-04 18:30:01', '');
INSERT INTO `sys_menu` VALUES (2009, '设备保养', 2003, 4, 'upkeep', 'upkeep/upkeep/index', NULL, 1, 0, 'C', '0', '0', '', 'edit', 'admin', '2024-05-04 18:44:28', 'admin', '2024-05-04 18:44:37', '');
INSERT INTO `sys_menu` VALUES (2010, '原材料管理', 0, 7, 'materialsClassify', NULL, NULL, 1, 0, 'M', '0', '0', '', 'dict', 'admin', '2024-05-04 18:47:22', 'admin', '2024-05-06 00:04:23', '');
INSERT INTO `sys_menu` VALUES (2011, '原材料分类', 2010, 1, 'materialsClassify', 'materialsClassify/materialsClassify/index', NULL, 1, 0, 'C', '0', '0', NULL, 'edit', 'admin', '2024-05-04 18:47:54', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2012, '采购管理', 0, 6, 'procurementPlan', NULL, NULL, 1, 0, 'M', '0', '0', '', 'dict', 'admin', '2024-05-04 18:48:54', 'admin', '2024-05-06 00:04:11', '');
INSERT INTO `sys_menu` VALUES (2013, '采购计划', 2012, 1, 'procurementPlan', 'procurementPlan/procurementPlan/index', NULL, 1, 0, 'C', '0', '0', NULL, 'edit', 'admin', '2024-05-04 18:49:23', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2014, '临时采购', 2012, 2, 'temporary', 'temporary/temporary/index', NULL, 1, 0, 'C', '0', '0', NULL, 'edit', 'admin', '2024-05-04 19:16:56', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2015, '客户管理', 0, 5, 'clientclassify', NULL, NULL, 1, 0, 'M', '0', '0', '', 'documentation', 'admin', '2024-05-04 19:33:48', 'admin', '2024-05-06 00:03:51', '');
INSERT INTO `sys_menu` VALUES (2016, '客户分类', 2015, 1, 'clientclassify', 'clientclassify/clientclassify/index', NULL, 1, 0, 'C', '0', '0', NULL, 'edit', 'admin', '2024-05-04 19:34:51', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2017, '客户列表', 2015, 2, 'client', 'client/client/index', NULL, 1, 0, 'C', '0', '0', NULL, 'edit', 'admin', '2024-05-04 19:35:23', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2018, '生产管理', 0, 9, 'production', NULL, NULL, 1, 0, 'M', '0', '0', '', 'dict', 'admin', '2024-05-04 20:07:05', 'admin', '2024-05-06 00:04:38', '');
INSERT INTO `sys_menu` VALUES (2019, '成品分类', 2018, 1, 'classesproduct', 'classesproduct/classesproduct/index', NULL, 1, 0, 'C', '0', '0', NULL, 'edit', 'admin', '2024-05-04 20:08:17', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2020, '生产耗材', 2010, 3, 'productioninventory', 'productioninventory/productioninventory/index', NULL, 1, 0, 'C', '0', '0', '', 'edit', 'admin', '2024-05-04 20:11:03', 'admin', '2024-05-05 14:38:38', '');
INSERT INTO `sys_menu` VALUES (2021, '仓库管理', 0, 8, 'warehouse', NULL, NULL, 1, 0, 'M', '0', '0', '', 'excel', 'admin', '2024-05-05 08:06:27', 'admin', '2024-05-06 00:04:30', '');
INSERT INTO `sys_menu` VALUES (2022, '库房列表', 2021, 1, 'warehouse', 'warehouse/warehouse/index', NULL, 1, 0, 'C', '0', '0', NULL, 'edit', 'admin', '2024-05-05 08:07:30', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2023, '货架列表', 2021, 2, 'shelf', 'shelf/shelf/index', NULL, 1, 0, 'C', '0', '0', '', 'edit', 'admin', '2024-05-05 08:08:39', 'admin', '2024-05-05 08:09:35', '');
INSERT INTO `sys_menu` VALUES (2024, '货位列表', 2021, 3, 'location', 'location/location/index', NULL, 1, 0, 'C', '0', '0', NULL, 'edit', 'admin', '2024-05-05 08:11:02', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2025, '入库列表', 2021, 4, 'warehouseWarrant', 'warehouseWarrant/warehouseWarrant/index', NULL, 1, 0, 'C', '0', '0', NULL, 'edit', 'admin', '2024-05-05 08:12:36', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2026, '库存列表', 2021, 5, 'inventory', 'inventory/inventory/index', NULL, 1, 0, 'M', '0', '0', '', 'edit', 'admin', '2024-05-05 08:13:43', 'admin', '2024-05-05 08:16:27', '');
INSERT INTO `sys_menu` VALUES (2027, '销售管理', 0, 10, 'market', '', NULL, 1, 0, 'M', '0', '0', '', 'excel', 'admin', '2024-05-05 08:44:24', 'admin', '2024-05-06 00:04:47', '');
INSERT INTO `sys_menu` VALUES (2028, '销售列表', 2027, 1, 'market', 'market/market/index', NULL, 1, 0, 'C', '0', '0', NULL, 'edit', 'admin', '2024-05-05 08:45:36', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2029, '原材料列表', 2010, 2, 'materials', 'materials/materials/index', NULL, 1, 0, 'C', '0', '0', NULL, 'edit', 'admin', '2024-05-05 08:54:07', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2030, '成品列表', 2019, 2, 'finishedproduct', 'finishedproduct/finishedproduct/index', NULL, 1, 0, 'C', '0', '0', NULL, 'edit', 'admin', '2024-05-05 14:45:11', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2031, '成品列表', 2018, 2, 'finishedproduct', 'finishedproduct/finishedproduct/index', NULL, 1, 0, 'C', '0', '0', NULL, 'edit', 'admin', '2024-05-05 14:47:11', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2032, '成品库存', 2018, 3, 'product', 'product/product/index', NULL, 1, 0, 'C', '0', '0', NULL, 'edit', 'admin', '2024-05-05 14:56:51', '', NULL, '');

-- ----------------------------
-- Table structure for sys_notice
-- ----------------------------
DROP TABLE IF EXISTS `sys_notice`;
CREATE TABLE `sys_notice`  (
  `notice_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '公告ID',
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
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '通知公告表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_notice
-- ----------------------------
INSERT INTO `sys_notice` VALUES (1, '温馨提醒：2018-07-01 华安新版本发布啦', '2', 0xE696B0E78988E69CACE58685E5AEB9, '0', 'admin', '2024-04-27 19:46:02', 'admin', '2024-10-11 10:11:12', '管理员');
INSERT INTO `sys_notice` VALUES (2, '维护通知：2018-07-01 华安系统凌晨维护', '1', 0x3C703EE7BBB4E68AA4E58685E5AEB93C2F703E, '0', 'admin', '2024-04-27 19:46:02', 'admin', '2024-10-11 10:11:21', '管理员');

-- ----------------------------
-- Table structure for sys_oper_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_oper_log`;
CREATE TABLE `sys_oper_log`  (
  `oper_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '日志主键',
  `title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '模块标题',
  `business_type` int(11) NULL DEFAULT 0 COMMENT '业务类型（0其它 1新增 2修改 3删除）',
  `method` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '方法名称',
  `request_method` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '请求方式',
  `operator_type` int(11) NULL DEFAULT 0 COMMENT '操作类别（0其它 1后台用户 2手机端用户）',
  `oper_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '操作人员',
  `dept_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '部门名称',
  `oper_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '请求URL',
  `oper_ip` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '主机地址',
  `oper_location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '操作地点',
  `oper_param` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '请求参数',
  `json_result` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '返回参数',
  `status` int(11) NULL DEFAULT 0 COMMENT '操作状态（0正常 1异常）',
  `error_msg` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '错误消息',
  `oper_time` datetime(0) NULL DEFAULT NULL COMMENT '操作时间',
  `cost_time` bigint(20) NULL DEFAULT 0 COMMENT '消耗时间',
  PRIMARY KEY (`oper_id`) USING BTREE,
  INDEX `idx_sys_oper_log_bt`(`business_type`) USING BTREE,
  INDEX `idx_sys_oper_log_s`(`status`) USING BTREE,
  INDEX `idx_sys_oper_log_ot`(`oper_time`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 234 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '操作日志记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_oper_log
-- ----------------------------
INSERT INTO `sys_oper_log` VALUES (100, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2024-04-27 19:46:02\",\"icon\":\"monitor\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2,\"menuName\":\"系统监控\",\"menuType\":\"M\",\"orderNum\":3,\"params\":{},\"parentId\":0,\"path\":\"monitor\",\"perms\":\"\",\"query\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-04-27 23:23:42', 19);
INSERT INTO `sys_oper_log` VALUES (101, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2024-04-27 19:46:02\",\"icon\":\"tool\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":3,\"menuName\":\"系统工具\",\"menuType\":\"M\",\"orderNum\":4,\"params\":{},\"parentId\":0,\"path\":\"tool\",\"perms\":\"\",\"query\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-04-27 23:23:46', 8);
INSERT INTO `sys_oper_log` VALUES (102, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2024-04-27 19:46:02\",\"icon\":\"guide\",\"isCache\":\"0\",\"isFrame\":\"0\",\"menuId\":4,\"menuName\":\"若依官网\",\"menuType\":\"M\",\"orderNum\":5,\"params\":{},\"parentId\":0,\"path\":\"http://ruoyi.vip\",\"perms\":\"\",\"query\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-04-27 23:23:52', 7);
INSERT INTO `sys_oper_log` VALUES (103, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"icon\":\"documentation\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"供应商管理\",\"menuType\":\"M\",\"orderNum\":2,\"params\":{},\"parentId\":0,\"path\":\"classify\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-04-27 23:24:37', 9);
INSERT INTO `sys_oper_log` VALUES (104, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"icon\":\"example\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"供应商分类\",\"menuType\":\"M\",\"orderNum\":1,\"params\":{},\"parentId\":2000,\"path\":\"classify/classify/index\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-04-27 23:26:18', 12);
INSERT INTO `sys_oper_log` VALUES (105, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"classify/classify/index\",\"createTime\":\"2024-04-27 23:26:18\",\"icon\":\"example\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2001,\"menuName\":\"供应商分类\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2000,\"path\":\"classify/classify/index\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-04-27 23:27:03', 9);
INSERT INTO `sys_oper_log` VALUES (106, '供应商分类', 1, 'lp.xian.equipment.controller.ClassifyController.add()', 'POST', 1, 'admin', NULL, '/classify/classify', '127.0.0.1', '内网IP', '{\"classifyName\":\"最大的供应商\",\"createTime\":\"2024-04-27 23:28:22\",\"description\":\"最大\",\"params\":{},\"remark\":\"都说了最大了\",\"sort\":1}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'classify_id\' doesn\'t have a default value\r\n### The error may exist in file [C:\\Users\\admin\\Desktop\\若依后台管理\\RuoYi-Vue\\lp_materials\\target\\classes\\mapper\\ClassifyMapper.xml]\r\n### The error may involve lp.xian.equipment.mapper.ClassifyMapper.insertClassify-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into lp_classify          ( classify_name,             description,             sort,             remark,                          create_time )           values ( ?,             ?,             ?,             ?,                          ? )\r\n### Cause: java.sql.SQLException: Field \'classify_id\' doesn\'t have a default value\n; Field \'classify_id\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'classify_id\' doesn\'t have a default value', '2024-04-27 23:28:22', 53);
INSERT INTO `sys_oper_log` VALUES (107, '用户头像', 2, 'com.ruoyi.web.controller.system.SysProfileController.avatar()', 'POST', 1, 'admin', NULL, '/system/user/profile/avatar', '127.0.0.1', '内网IP', '', '{\"msg\":\"操作成功\",\"imgUrl\":\"/profile/avatar/2023/04/27/blob_20230427233119A001.png\",\"code\":200}', 0, NULL, '2024-04-27 23:31:19', 59);
INSERT INTO `sys_oper_log` VALUES (108, '用户头像', 2, 'com.ruoyi.web.controller.system.SysProfileController.avatar()', 'POST', 1, 'admin', NULL, '/system/user/profile/avatar', '127.0.0.1', '内网IP', '', '{\"msg\":\"操作成功\",\"imgUrl\":\"/profile/avatar/2023/04/27/blob_20230427233140A002.png\",\"code\":200}', 0, NULL, '2024-04-27 23:31:40', 10);
INSERT INTO `sys_oper_log` VALUES (109, '个人信息', 2, 'com.ruoyi.web.controller.system.SysProfileController.updateProfile()', 'PUT', 1, 'admin', NULL, '/system/user/profile', '127.0.0.1', '内网IP', '{\"admin\":true,\"createBy\":\"admin\",\"createTime\":\"2024-04-27 19:46:02\",\"delFlag\":\"0\",\"dept\":{\"ancestors\":\"0,100,101\",\"children\":[],\"deptId\":103,\"deptName\":\"研发部门\",\"leader\":\"若依\",\"orderNum\":1,\"params\":{},\"parentId\":101,\"status\":\"0\"},\"email\":\"1076072836@163.com\",\"loginDate\":\"2024-04-27 19:46:02\",\"loginIp\":\"127.0.0.1\",\"nickName\":\"柯南\",\"params\":{},\"phonenumber\":\"13687179759\",\"remark\":\"管理员\",\"roles\":[{\"admin\":true,\"dataScope\":\"1\",\"deptCheckStrictly\":false,\"flag\":false,\"menuCheckStrictly\":false,\"params\":{},\"roleId\":1,\"roleKey\":\"admin\",\"roleName\":\"超级管理员\",\"roleSort\":1,\"status\":\"0\"}],\"sex\":\"0\",\"status\":\"0\",\"userId\":1,\"userName\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-04-27 23:32:02', 12);
INSERT INTO `sys_oper_log` VALUES (110, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"supplier/supplier/index\",\"createBy\":\"admin\",\"icon\":\"color\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"供应商列表\",\"menuType\":\"C\",\"orderNum\":2,\"params\":{},\"parentId\":2000,\"path\":\"supplier\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-04-28 08:21:03', 22);
INSERT INTO `sys_oper_log` VALUES (111, '供应商', 1, 'lp.xian.equipment.controller.SupplierController.add()', 'POST', 1, 'admin', NULL, '/supplier/supplier', '127.0.0.1', '内网IP', '{\"auditStatus\":0,\"classifyId\":1,\"contact\":\"柯南\",\"createBy\":\"admin\",\"createTime\":\"2024-04-28 08:22:21\",\"params\":{},\"sort\":2,\"supplierAddress\":\"三科\",\"supplierName\":\"三科\",\"supplierPhone\":\"123456789\",\"supplierSynopsis\":\"商品供应\"}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'supplier_id\' doesn\'t have a default value\r\n### The error may exist in file [C:\\Users\\admin\\Desktop\\若依后台管理\\RuoYi-Vue\\lp_materials\\target\\classes\\mapper\\SupplierMapper.xml]\r\n### The error may involve lp.xian.equipment.mapper.SupplierMapper.insertSupplier-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into lp_supplier          ( supplier_name,             contact,             classify_id,             supplier_address,             supplier_phone,             supplier_synopsis,             audit_status,                                                                                           sort,                          create_by,             create_time )           values ( ?,             ?,             ?,             ?,             ?,             ?,             ?,                                                                                           ?,                          ?,             ? )\r\n### Cause: java.sql.SQLException: Field \'supplier_id\' doesn\'t have a default value\n; Field \'supplier_id\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'supplier_id\' doesn\'t have a default value', '2024-04-28 08:22:21', 59);
INSERT INTO `sys_oper_log` VALUES (112, '供应商', 1, 'lp.xian.equipment.controller.SupplierController.add()', 'POST', 1, 'admin', NULL, '/supplier/supplier', '127.0.0.1', '内网IP', '{\"auditStatus\":0,\"classifyId\":1,\"contact\":\"柯南\",\"createBy\":\"admin\",\"createTime\":\"2024-04-28 08:22:27\",\"params\":{},\"supplierAddress\":\"三科\",\"supplierName\":\"三科\",\"supplierPhone\":\"123456789\",\"supplierSynopsis\":\"商品供应\"}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'supplier_id\' doesn\'t have a default value\r\n### The error may exist in file [C:\\Users\\admin\\Desktop\\若依后台管理\\RuoYi-Vue\\lp_materials\\target\\classes\\mapper\\SupplierMapper.xml]\r\n### The error may involve lp.xian.equipment.mapper.SupplierMapper.insertSupplier-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into lp_supplier          ( supplier_name,             contact,             classify_id,             supplier_address,             supplier_phone,             supplier_synopsis,             audit_status,                                                                                                                     create_by,             create_time )           values ( ?,             ?,             ?,             ?,             ?,             ?,             ?,                                                                                                                     ?,             ? )\r\n### Cause: java.sql.SQLException: Field \'supplier_id\' doesn\'t have a default value\n; Field \'supplier_id\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'supplier_id\' doesn\'t have a default value', '2024-04-28 08:22:27', 3);
INSERT INTO `sys_oper_log` VALUES (113, '供应商', 1, 'lp.xian.equipment.controller.SupplierController.add()', 'POST', 1, 'admin', NULL, '/supplier/supplier', '127.0.0.1', '内网IP', '{\"auditStatus\":0,\"classifyId\":1,\"contact\":\"柯南\",\"createBy\":\"admin\",\"createTime\":\"2024-04-28 08:22:40\",\"params\":{},\"remark\":\"商品供应\",\"sort\":1,\"supplierAddress\":\"三科\",\"supplierName\":\"三科\",\"supplierPhone\":\"123456789\",\"supplierSynopsis\":\"商品供应\"}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'supplier_id\' doesn\'t have a default value\r\n### The error may exist in file [C:\\Users\\admin\\Desktop\\若依后台管理\\RuoYi-Vue\\lp_materials\\target\\classes\\mapper\\SupplierMapper.xml]\r\n### The error may involve lp.xian.equipment.mapper.SupplierMapper.insertSupplier-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into lp_supplier          ( supplier_name,             contact,             classify_id,             supplier_address,             supplier_phone,             supplier_synopsis,             audit_status,                                                                                           sort,             remark,             create_by,             create_time )           values ( ?,             ?,             ?,             ?,             ?,             ?,             ?,                                                                                           ?,             ?,             ?,             ? )\r\n### Cause: java.sql.SQLException: Field \'supplier_id\' doesn\'t have a default value\n; Field \'supplier_id\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'supplier_id\' doesn\'t have a default value', '2024-04-28 08:22:40', 2);
INSERT INTO `sys_oper_log` VALUES (114, '供应商', 1, 'lp.xian.equipment.controller.SupplierController.add()', 'POST', 1, 'admin', NULL, '/supplier/supplier', '127.0.0.1', '内网IP', '{\"auditStatus\":0,\"classifyId\":1,\"contact\":\"柯南\",\"createBy\":\"admin\",\"createTime\":\"2024-04-28 08:23:08\",\"params\":{},\"remark\":\"商品供应\",\"sort\":1,\"supplierAddress\":\"三科\",\"supplierName\":\"三科\",\"supplierPhone\":\"123456789\",\"supplierSynopsis\":\"商品供应\"}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'supplier_id\' doesn\'t have a default value\r\n### The error may exist in file [C:\\Users\\admin\\Desktop\\若依后台管理\\RuoYi-Vue\\lp_materials\\target\\classes\\mapper\\SupplierMapper.xml]\r\n### The error may involve lp.xian.equipment.mapper.SupplierMapper.insertSupplier-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into lp_supplier          ( supplier_name,             contact,             classify_id,             supplier_address,             supplier_phone,             supplier_synopsis,             audit_status,                                                                                           sort,             remark,             create_by,             create_time )           values ( ?,             ?,             ?,             ?,             ?,             ?,             ?,                                                                                           ?,             ?,             ?,             ? )\r\n### Cause: java.sql.SQLException: Field \'supplier_id\' doesn\'t have a default value\n; Field \'supplier_id\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'supplier_id\' doesn\'t have a default value', '2024-04-28 08:23:08', 2);
INSERT INTO `sys_oper_log` VALUES (115, '供应商', 1, 'lp.xian.equipment.controller.SupplierController.add()', 'POST', 1, 'admin', NULL, '/supplier/supplier', '127.0.0.1', '内网IP', '{\"auditStatus\":0,\"classifyId\":1,\"contact\":\"柯南\",\"createBy\":\"admin\",\"createTime\":\"2024-04-28 08:30:37\",\"params\":{},\"remark\":\"三科商品供应\",\"sort\":1,\"supplierAddress\":\"三科\",\"supplierName\":\"三科\",\"supplierPhone\":\"123456789\",\"supplierSynopsis\":\"商品供应\"}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'supplier_id\' doesn\'t have a default value\r\n### The error may exist in file [C:\\Users\\admin\\Desktop\\若依后台管理\\RuoYi-Vue\\lp_materials\\target\\classes\\mapper\\SupplierMapper.xml]\r\n### The error may involve lp.xian.equipment.mapper.SupplierMapper.insertSupplier-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into lp_supplier          ( supplier_name,             contact,             classify_id,             supplier_address,             supplier_phone,             supplier_synopsis,             audit_status,                                                                                           sort,             remark,             create_by,             create_time )           values ( ?,             ?,             ?,             ?,             ?,             ?,             ?,                                                                                           ?,             ?,             ?,             ? )\r\n### Cause: java.sql.SQLException: Field \'supplier_id\' doesn\'t have a default value\n; Field \'supplier_id\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'supplier_id\' doesn\'t have a default value', '2024-04-28 08:30:37', 3);
INSERT INTO `sys_oper_log` VALUES (116, '供应商', 1, 'lp.xian.equipment.controller.SupplierController.add()', 'POST', 1, 'admin', NULL, '/supplier/supplier', '127.0.0.1', '内网IP', '{\"auditStatus\":0,\"classifyId\":1,\"contact\":\"柯南\",\"createBy\":\"admin\",\"createTime\":\"2024-04-28 08:31:08\",\"params\":{},\"remark\":\"三科商品供应\",\"sort\":1,\"supplierAddress\":\"三科\",\"supplierName\":\"三科\",\"supplierPhone\":\"123456789\",\"supplierSynopsis\":\"商品供应\"}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'supplier_id\' doesn\'t have a default value\r\n### The error may exist in file [C:\\Users\\admin\\Desktop\\若依后台管理\\RuoYi-Vue\\lp_materials\\target\\classes\\mapper\\SupplierMapper.xml]\r\n### The error may involve lp.xian.equipment.mapper.SupplierMapper.insertSupplier-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into lp_supplier          ( supplier_name,             contact,             classify_id,             supplier_address,             supplier_phone,             supplier_synopsis,             audit_status,                                                                                           sort,             remark,             create_by,             create_time )           values ( ?,             ?,             ?,             ?,             ?,             ?,             ?,                                                                                           ?,             ?,             ?,             ? )\r\n### Cause: java.sql.SQLException: Field \'supplier_id\' doesn\'t have a default value\n; Field \'supplier_id\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'supplier_id\' doesn\'t have a default value', '2024-04-28 08:31:08', 2);
INSERT INTO `sys_oper_log` VALUES (117, '供应商', 1, 'lp.xian.equipment.controller.SupplierController.add()', 'POST', 1, 'admin', NULL, '/supplier/supplier', '127.0.0.1', '内网IP', '{\"auditStatus\":0,\"classifyId\":1,\"contact\":\"柯南\",\"createBy\":\"admin\",\"createTime\":\"2024-04-28 08:31:29\",\"params\":{},\"remark\":\"三科商品供应\",\"sort\":1,\"supplierAddress\":\"三科\",\"supplierName\":\"三科\",\"supplierPhone\":\"123456789\",\"supplierSynopsis\":\"商品供应\"}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'supplier_id\' doesn\'t have a default value\r\n### The error may exist in file [C:\\Users\\admin\\Desktop\\若依后台管理\\RuoYi-Vue\\lp_materials\\target\\classes\\mapper\\SupplierMapper.xml]\r\n### The error may involve lp.xian.equipment.mapper.SupplierMapper.insertSupplier-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into lp_supplier          ( supplier_name,             contact,             classify_id,             supplier_address,             supplier_phone,             supplier_synopsis,             audit_status,                                                                                           sort,             remark,             create_by,             create_time )           values ( ?,             ?,             ?,             ?,             ?,             ?,             ?,                                                                                           ?,             ?,             ?,             ? )\r\n### Cause: java.sql.SQLException: Field \'supplier_id\' doesn\'t have a default value\n; Field \'supplier_id\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'supplier_id\' doesn\'t have a default value', '2024-04-28 08:31:29', 2);
INSERT INTO `sys_oper_log` VALUES (118, '供应商', 1, 'lp.xian.equipment.controller.SupplierController.add()', 'POST', 1, 'admin', NULL, '/supplier/supplier', '127.0.0.1', '内网IP', '{\"auditStatus\":0,\"classifyId\":1,\"contact\":\"柯南\",\"createBy\":\"admin\",\"createTime\":\"2024-04-28 08:31:40\",\"params\":{},\"remark\":\"三科商品供应\",\"sort\":1,\"supplierAddress\":\"三科\",\"supplierName\":\"三科\",\"supplierPhone\":\"123456789\",\"supplierSynopsis\":\"商品供应\"}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'supplier_id\' doesn\'t have a default value\r\n### The error may exist in file [C:\\Users\\admin\\Desktop\\若依后台管理\\RuoYi-Vue\\lp_materials\\target\\classes\\mapper\\SupplierMapper.xml]\r\n### The error may involve lp.xian.equipment.mapper.SupplierMapper.insertSupplier-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into lp_supplier          ( supplier_name,             contact,             classify_id,             supplier_address,             supplier_phone,             supplier_synopsis,             audit_status,                                                                                           sort,             remark,             create_by,             create_time )           values ( ?,             ?,             ?,             ?,             ?,             ?,             ?,                                                                                           ?,             ?,             ?,             ? )\r\n### Cause: java.sql.SQLException: Field \'supplier_id\' doesn\'t have a default value\n; Field \'supplier_id\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'supplier_id\' doesn\'t have a default value', '2024-04-28 08:31:40', 3);
INSERT INTO `sys_oper_log` VALUES (119, '供应商', 1, 'lp.xian.equipment.controller.SupplierController.add()', 'POST', 1, 'admin', NULL, '/supplier/supplier', '127.0.0.1', '内网IP', '{\"auditStatus\":0,\"classifyId\":1,\"contact\":\"柯南\",\"createBy\":\"admin\",\"createTime\":\"2024-04-28 08:33:18\",\"params\":{},\"remark\":\"三科商品供应\",\"sort\":1,\"supplierAddress\":\"三科\",\"supplierName\":\"三科\",\"supplierPhone\":\"123456789\",\"supplierSynopsis\":\"商品供应\"}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'supplier_id\' doesn\'t have a default value\r\n### The error may exist in file [C:\\Users\\admin\\Desktop\\若依后台管理\\RuoYi-Vue\\lp_materials\\target\\classes\\mapper\\SupplierMapper.xml]\r\n### The error may involve lp.xian.equipment.mapper.SupplierMapper.insertSupplier-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into lp_supplier          ( supplier_name,             contact,             classify_id,             supplier_address,             supplier_phone,             supplier_synopsis,             audit_status,                                                                                           sort,             remark,             create_by,             create_time )           values ( ?,             ?,             ?,             ?,             ?,             ?,             ?,                                                                                           ?,             ?,             ?,             ? )\r\n### Cause: java.sql.SQLException: Field \'supplier_id\' doesn\'t have a default value\n; Field \'supplier_id\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'supplier_id\' doesn\'t have a default value', '2024-04-28 08:33:18', 83);
INSERT INTO `sys_oper_log` VALUES (120, '供应商', 1, 'lp.xian.equipment.controller.SupplierController.add()', 'POST', 1, 'admin', NULL, '/supplier/supplier', '127.0.0.1', '内网IP', '{\"auditStatus\":0,\"classifyId\":1,\"contact\":\"柯南\",\"createBy\":\"admin\",\"createTime\":\"2024-04-28 08:34:50\",\"params\":{},\"remark\":\"三科商品供应\",\"sort\":1,\"supplierAddress\":\"三科\",\"supplierId\":1,\"supplierName\":\"三科\",\"supplierPhone\":\"123456789\",\"supplierSynopsis\":\"商品供应\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-04-28 08:34:50', 18);
INSERT INTO `sys_oper_log` VALUES (121, '供应商', 2, 'lp.xian.equipment.controller.SupplierController.audit()', 'PUT', 1, 'admin', NULL, '/supplier/supplier/audit', '127.0.0.1', '内网IP', '{\"auditOpinion\":\"无意间\",\"auditStatus\":\"1\",\"params\":{},\"supplierId\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-04-28 08:40:32', 12);
INSERT INTO `sys_oper_log` VALUES (122, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"icon\":\"documentation\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"设备管理\",\"menuType\":\"M\",\"orderNum\":3,\"params\":{},\"parentId\":0,\"path\":\"classification\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-04-28 08:47:51', 15);
INSERT INTO `sys_oper_log` VALUES (123, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"classification/classification/index\",\"createBy\":\"admin\",\"icon\":\"chart\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"设备分类\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2003,\"path\":\"classification\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-04-28 08:49:32', 8);
INSERT INTO `sys_oper_log` VALUES (124, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2024-04-27 19:46:02\",\"icon\":\"monitor\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2,\"menuName\":\"系统监控\",\"menuType\":\"M\",\"orderNum\":5,\"params\":{},\"parentId\":0,\"path\":\"monitor\",\"perms\":\"\",\"query\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-04-28 08:50:08', 10);
INSERT INTO `sys_oper_log` VALUES (125, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2024-04-27 19:46:02\",\"icon\":\"tool\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":3,\"menuName\":\"系统工具\",\"menuType\":\"M\",\"orderNum\":6,\"params\":{},\"parentId\":0,\"path\":\"tool\",\"perms\":\"\",\"query\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-04-28 08:50:14', 11);
INSERT INTO `sys_oper_log` VALUES (126, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2024-04-27 19:46:02\",\"icon\":\"guide\",\"isCache\":\"0\",\"isFrame\":\"0\",\"menuId\":4,\"menuName\":\"若依官网\",\"menuType\":\"M\",\"orderNum\":7,\"params\":{},\"parentId\":0,\"path\":\"http://ruoyi.vip\",\"perms\":\"\",\"query\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-04-28 08:50:19', 10);
INSERT INTO `sys_oper_log` VALUES (127, '设备分类', 1, 'lp.xian.equipment.controller.ClassificationController.add()', 'POST', 1, 'admin', NULL, '/classification/classification', '127.0.0.1', '内网IP', '{\"classificationId\":1,\"classificationName\":\"大设备\",\"createTime\":\"2024-04-28 08:52:11\",\"description\":\"很大\",\"params\":{},\"remark\":\"很大\",\"sort\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-04-28 08:52:11', 9);
INSERT INTO `sys_oper_log` VALUES (128, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"icon\":\"chart\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"设备列表\",\"menuType\":\"M\",\"orderNum\":2,\"params\":{},\"parentId\":2003,\"path\":\"equipment\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-04-28 08:53:26', 10);
INSERT INTO `sys_oper_log` VALUES (129, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"equipment/equipment/index\",\"createTime\":\"2024-04-28 08:53:26\",\"icon\":\"chart\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2005,\"menuName\":\"设备列表\",\"menuType\":\"C\",\"orderNum\":2,\"params\":{},\"parentId\":2003,\"path\":\"equipment\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-04-28 08:53:49', 9);
INSERT INTO `sys_oper_log` VALUES (130, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"adjunct/adjunct/index\",\"createBy\":\"admin\",\"icon\":\"dict\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"设备附件列表\",\"menuType\":\"C\",\"orderNum\":3,\"params\":{},\"parentId\":2003,\"path\":\"adjunct/adjunct\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-04 13:00:47', 20);
INSERT INTO `sys_oper_log` VALUES (131, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"adjunct/adjunct/index\",\"createTime\":\"2024-05-04 13:00:47\",\"icon\":\"dict\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2006,\"menuName\":\"设备附件列表\",\"menuType\":\"C\",\"orderNum\":3,\"params\":{},\"parentId\":2003,\"path\":\"adjunct\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-04 13:01:36', 12);
INSERT INTO `sys_oper_log` VALUES (132, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"icon\":\"documentation\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"财务管理\",\"menuType\":\"M\",\"orderNum\":4,\"params\":{},\"parentId\":0,\"path\":\"finance\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-04 13:07:53', 8);
INSERT INTO `sys_oper_log` VALUES (133, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"adjunct2/adjunct2/index\",\"createBy\":\"admin\",\"icon\":\"edit\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"财务数据\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2007,\"path\":\"adjunct2\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-04 13:49:47', 9);
INSERT INTO `sys_oper_log` VALUES (134, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"adjunctv/adjunctv/index\",\"createTime\":\"2024-05-04 13:49:47\",\"icon\":\"edit\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2008,\"menuName\":\"财务数据\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2007,\"path\":\"adjunctv\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-04 13:57:02', 9);
INSERT INTO `sys_oper_log` VALUES (135, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"finance/finance/index\",\"createTime\":\"2024-05-04 13:49:47\",\"icon\":\"edit\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2008,\"menuName\":\"财务数据\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2007,\"path\":\"finance\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-04 18:30:01', 20);
INSERT INTO `sys_oper_log` VALUES (136, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"upkeep/upkeep/index\",\"createBy\":\"admin\",\"icon\":\"edit\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"设备保养\",\"menuType\":\"C\",\"orderNum\":2,\"params\":{},\"parentId\":2003,\"path\":\"upkeep\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-04 18:44:28', 10);
INSERT INTO `sys_oper_log` VALUES (137, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"upkeep/upkeep/index\",\"createTime\":\"2024-05-04 18:44:28\",\"icon\":\"edit\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2009,\"menuName\":\"设备保养\",\"menuType\":\"C\",\"orderNum\":4,\"params\":{},\"parentId\":2003,\"path\":\"upkeep\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-04 18:44:37', 8);
INSERT INTO `sys_oper_log` VALUES (138, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"icon\":\"dict\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"原材料管理\",\"menuType\":\"M\",\"orderNum\":4,\"params\":{},\"parentId\":0,\"path\":\"materialsClassify\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-04 18:47:22', 9);
INSERT INTO `sys_oper_log` VALUES (139, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"materialsClassify/materialsClassify/index\",\"createBy\":\"admin\",\"icon\":\"edit\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"原材料分类\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2010,\"path\":\"materialsClassify\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-04 18:47:54', 8);
INSERT INTO `sys_oper_log` VALUES (140, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"icon\":\"dict\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"采购管理\",\"menuType\":\"M\",\"orderNum\":4,\"params\":{},\"parentId\":0,\"path\":\"procurementPlan\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-04 18:48:54', 7);
INSERT INTO `sys_oper_log` VALUES (141, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"procurementPlan/procurementPlan/index\",\"createBy\":\"admin\",\"icon\":\"edit\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"采购计划\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2012,\"path\":\"procurementPlan\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-04 18:49:23', 7);
INSERT INTO `sys_oper_log` VALUES (142, '采购计划', 1, 'lp.xian.materials.controller.ProcurementPlanController.add()', 'POST', 1, 'admin', NULL, '/procurementPlan/procurementPlan', '127.0.0.1', '内网IP', '{\"auditStatus\":0,\"createTime\":\"2024-05-04 19:04:44\",\"params\":{},\"procurementPlanId\":1,\"procurementPlanName\":\"全买\",\"procurementPlanNum\":100,\"procurementPlanPrice\":1000,\"remark\":\"全买\",\"supplierId\":1,\"unit\":\"国企\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-04 19:04:44', 14);
INSERT INTO `sys_oper_log` VALUES (143, '采购计划', 2, 'lp.xian.materials.controller.ProcurementPlanController.auditProcurementPlan()', 'PUT', 1, 'admin', NULL, '/procurementPlan/procurementPlan/audit', '127.0.0.1', '内网IP', '{\"auditOpinion\":\"无意间\",\"auditStatus\":\"1\",\"params\":{},\"procurementPlanId\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-04 19:04:55', 7);
INSERT INTO `sys_oper_log` VALUES (144, '原材料分类', 1, 'lp.xian.materials.controller.MaterialsClassifyController.add()', 'POST', 1, 'admin', NULL, '/materialsClassify/materialsClassify', '127.0.0.1', '内网IP', '{\"createTime\":\"2024-05-04 19:09:29\",\"materialsClassifyId\":1,\"materialsClassifyName\":\"零件\",\"params\":{},\"remark\":\"设备零件\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-04 19:09:29', 7);
INSERT INTO `sys_oper_log` VALUES (145, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"temporary/temporary/index\",\"createBy\":\"admin\",\"icon\":\"edit\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"临时采购\",\"menuType\":\"C\",\"orderNum\":2,\"params\":{},\"parentId\":2012,\"path\":\"temporary\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-04 19:16:56', 10);
INSERT INTO `sys_oper_log` VALUES (146, '临时采购', 1, 'lp.xian.materials.controller.TemporaryController.add()', 'POST', 1, 'admin', NULL, '/temporary/temporary', '127.0.0.1', '内网IP', '{\"auditStatus\":0,\"createTime\":\"2024-05-04 19:17:41\",\"materialsClassifyId\":1,\"params\":{},\"remark\":\"临时需要\",\"supplierId\":1,\"temporaryName\":\"急需\",\"temporaryNum\":10,\"temporaryPrice\":1000,\"unit\":\"国企\"}', NULL, 1, 'nested exception is org.apache.ibatis.executor.ExecutorException: Error getting generated key or setting result to parameter object. Cause: org.apache.ibatis.executor.ExecutorException: No setter found for the keyProperty \'lpTemporaryId\' in \'lp.xian.materials.domain.Temporary\'.', '2024-05-04 19:17:41', 17);
INSERT INTO `sys_oper_log` VALUES (147, '临时采购', 1, 'lp.xian.materials.controller.TemporaryController.add()', 'POST', 1, 'admin', NULL, '/temporary/temporary', '127.0.0.1', '内网IP', '{\"auditStatus\":0,\"createTime\":\"2024-05-04 19:17:49\",\"materialsClassifyId\":1,\"params\":{},\"remark\":\"临时需要\",\"supplierId\":1,\"temporaryName\":\"急需\",\"temporaryNum\":10,\"temporaryPrice\":1000,\"unit\":\"国企\"}', NULL, 1, 'nested exception is org.apache.ibatis.executor.ExecutorException: Error getting generated key or setting result to parameter object. Cause: org.apache.ibatis.executor.ExecutorException: No setter found for the keyProperty \'lpTemporaryId\' in \'lp.xian.materials.domain.Temporary\'.', '2024-05-04 19:17:49', 8);
INSERT INTO `sys_oper_log` VALUES (148, '临时采购', 1, 'lp.xian.materials.controller.TemporaryController.add()', 'POST', 1, 'admin', NULL, '/temporary/temporary', '127.0.0.1', '内网IP', '{\"auditStatus\":0,\"createTime\":\"2024-05-04 19:17:58\",\"materialsClassifyId\":1,\"params\":{},\"remark\":\"临时需要\",\"supplierId\":1,\"temporaryName\":\"急需\",\"temporaryNum\":10,\"temporaryPrice\":1000,\"unit\":\"国企\"}', NULL, 1, 'nested exception is org.apache.ibatis.executor.ExecutorException: Error getting generated key or setting result to parameter object. Cause: org.apache.ibatis.executor.ExecutorException: No setter found for the keyProperty \'lpTemporaryId\' in \'lp.xian.materials.domain.Temporary\'.', '2024-05-04 19:17:58', 5);
INSERT INTO `sys_oper_log` VALUES (149, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"icon\":\"documentation\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"客户管理\",\"menuType\":\"M\",\"orderNum\":4,\"params\":{},\"parentId\":0,\"path\":\"clientclassify\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-04 19:33:48', 25);
INSERT INTO `sys_oper_log` VALUES (150, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"clientclassify/clientclassify/index\",\"createBy\":\"admin\",\"icon\":\"edit\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"客户分类\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2015,\"path\":\"clientclassify\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-04 19:34:51', 10);
INSERT INTO `sys_oper_log` VALUES (151, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"client/client/index\",\"createBy\":\"admin\",\"icon\":\"edit\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"客户列表\",\"menuType\":\"C\",\"orderNum\":2,\"params\":{},\"parentId\":2015,\"path\":\"client\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-04 19:35:23', 12);
INSERT INTO `sys_oper_log` VALUES (152, '临时采购', 2, 'lp.xian.materials.controller.TemporaryController.auditTemporary()', 'PUT', 1, 'admin', NULL, '/temporary/temporary/audit', '127.0.0.1', '内网IP', '{\"auditOpinion\":\"无意间\",\"auditStatus\":\"1\",\"params\":{},\"temporaryId\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-04 19:46:57', 9);
INSERT INTO `sys_oper_log` VALUES (153, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"icon\":\"dict\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"生产管理\",\"menuType\":\"M\",\"orderNum\":4,\"params\":{},\"parentId\":0,\"path\":\"production\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-04 20:07:05', 11);
INSERT INTO `sys_oper_log` VALUES (154, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"classesproduct/classesproduct/index\",\"createBy\":\"admin\",\"icon\":\"edit\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"成品分类\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2018,\"path\":\"classesproduct\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-04 20:08:17', 11);
INSERT INTO `sys_oper_log` VALUES (155, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"materials/materials/index\",\"createBy\":\"admin\",\"icon\":\"edit\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"生产耗材\",\"menuType\":\"C\",\"orderNum\":2,\"params\":{},\"parentId\":2010,\"path\":\"materials\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-04 20:11:03', 11);
INSERT INTO `sys_oper_log` VALUES (156, '设备保养', 1, 'lp.xian.equipment.controller.UpkeepController.add()', 'POST', 1, 'admin', NULL, '/upkeep/upkeep', '127.0.0.1', '内网IP', '{\"announcements\":\"好好保养\",\"auditStatus\":0,\"createTime\":\"2024-05-04 22:46:39\",\"description\":\"整个保养\",\"equipmentId\":1,\"params\":{},\"remark\":\"保养好\",\"sort\":1,\"upkeepContent\":\"<p><strong>洗干净</strong></p>\",\"upkeepId\":1,\"upkeepName\":\"全套服务\",\"upkeepPeriod\":\"10\",\"upkeepPrice\":1000}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-04 22:46:39', 20);
INSERT INTO `sys_oper_log` VALUES (157, '设备保养', 2, 'lp.xian.equipment.controller.UpkeepController.auditUpkeep()', 'PUT', 1, 'admin', NULL, '/upkeep/upkeep/audit', '127.0.0.1', '内网IP', '{\"auditOpinion\":\"无意间\",\"auditStatus\":\"1\",\"params\":{},\"upkeepId\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-04 22:49:33', 8);
INSERT INTO `sys_oper_log` VALUES (158, '设备保养', 2, 'lp.xian.equipment.controller.UpkeepController.edit()', 'PUT', 1, 'admin', NULL, '/upkeep/upkeep', '127.0.0.1', '内网IP', '{\"announcements\":\"好好保养\",\"auditOpinion\":\"无意间\",\"auditPerson\":\"admin\",\"auditStatus\":1,\"auditTime\":\"2024-05-04 22:49:33\",\"createTime\":\"2024-05-04 22:46:39\",\"description\":\"整个保养\",\"equipment\":{\"equipmentId\":1,\"params\":{}},\"equipmentId\":1,\"params\":{},\"remark\":\"保养好\",\"sort\":1,\"updateTime\":\"2024-05-04 22:59:59\",\"upkeepContent\":\"<p><br></p>\",\"upkeepId\":1,\"upkeepName\":\"全套服务\",\"upkeepPeriod\":\"10\",\"upkeepPrice\":1000}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-04 22:59:59', 7);
INSERT INTO `sys_oper_log` VALUES (159, '设备保养', 2, 'lp.xian.equipment.controller.UpkeepController.edit()', 'PUT', 1, 'admin', NULL, '/upkeep/upkeep', '127.0.0.1', '内网IP', '{\"announcements\":\"好好保养\",\"auditOpinion\":\"无意间\",\"auditPerson\":\"admin\",\"auditStatus\":1,\"auditTime\":\"2024-05-04 22:49:33\",\"createTime\":\"2024-05-04 22:46:39\",\"description\":\"整个保养\",\"equipment\":{\"equipmentId\":1,\"params\":{}},\"equipmentId\":1,\"params\":{},\"remark\":\"保养好\",\"sort\":1,\"updateTime\":\"2024-05-04 23:01:47\",\"upkeepContent\":\"<p><s>好好保养</s></p>\",\"upkeepId\":1,\"upkeepName\":\"全套服务\",\"upkeepPeriod\":\"10\",\"upkeepPrice\":1000}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-04 23:01:47', 5);
INSERT INTO `sys_oper_log` VALUES (160, '设备附件列表', 1, 'lp.xian.equipment.controller.AdjunctController.add()', 'POST', 1, 'admin', NULL, '/adjunct/adjunct', '127.0.0.1', '内网IP', '{\"adjunctId\":1,\"adjunctName\":\"螺丝\",\"adjunctPrice\":10,\"adjunctStatus\":0,\"auditStatus\":0,\"classificationId\":1,\"createBy\":\"admin\",\"createTime\":\"2024-05-04 23:13:27\",\"description\":\"附件螺丝\",\"equipmentId\":1,\"modelType\":\"小型\",\"params\":{},\"remark\":\"螺丝钉\",\"sort\":1,\"supplierId\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-04 23:13:27', 11);
INSERT INTO `sys_oper_log` VALUES (161, '设备附件列表', 2, 'lp.xian.equipment.controller.AdjunctController.auditAdjunct()', 'PUT', 1, 'admin', NULL, '/adjunct/adjunct/audit', '127.0.0.1', '内网IP', '{\"adjunctId\":1,\"auditOpinion\":\"无意见\",\"auditStatus\":\"1\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-04 23:13:42', 6);
INSERT INTO `sys_oper_log` VALUES (162, '成品分类', 1, 'lp.xian.production.controller.ClassesProductController.add()', 'POST', 1, 'admin', NULL, '/classesproduct/classesproduct', '127.0.0.1', '内网IP', '{\"classesProductName\":\"完成品\",\"createTime\":\"2024-05-05 07:51:13\",\"description\":\"全部完成\",\"params\":{},\"remark\":\"完成\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-05 07:51:13', 13);
INSERT INTO `sys_oper_log` VALUES (163, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"icon\":\"excel\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"仓库管理\",\"menuType\":\"M\",\"orderNum\":4,\"params\":{},\"parentId\":0,\"path\":\"warehouse\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-05 08:06:27', 17);
INSERT INTO `sys_oper_log` VALUES (164, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"warehouse/warehouse/index\",\"createBy\":\"admin\",\"icon\":\"edit\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"库房列表\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2021,\"path\":\"warehouse\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-05 08:07:30', 10);
INSERT INTO `sys_oper_log` VALUES (165, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"shelf/shelf/index\",\"createBy\":\"admin\",\"icon\":\"edit\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"货架列表\",\"menuType\":\"C\",\"orderNum\":2,\"params\":{},\"parentId\":2021,\"path\":\"shelf\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-05 08:08:39', 13);
INSERT INTO `sys_oper_log` VALUES (166, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"shelf/shelf/index\",\"createTime\":\"2024-05-05 08:08:39\",\"icon\":\"edit\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2023,\"menuName\":\"货架列表\",\"menuType\":\"C\",\"orderNum\":2,\"params\":{},\"parentId\":2021,\"path\":\"warehouse\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-05 08:09:00', 13);
INSERT INTO `sys_oper_log` VALUES (167, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"shelf/shelf/index\",\"createTime\":\"2024-05-05 08:08:39\",\"icon\":\"edit\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2023,\"menuName\":\"货架列表\",\"menuType\":\"C\",\"orderNum\":2,\"params\":{},\"parentId\":2021,\"path\":\"shelf\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-05 08:09:35', 9);
INSERT INTO `sys_oper_log` VALUES (168, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"location/location/index\",\"createBy\":\"admin\",\"icon\":\"edit\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"货位列表\",\"menuType\":\"C\",\"orderNum\":3,\"params\":{},\"parentId\":2021,\"path\":\"location\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-05 08:11:02', 9);
INSERT INTO `sys_oper_log` VALUES (169, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"warehouseWarrant/warehouseWarrant/index\",\"createBy\":\"admin\",\"icon\":\"edit\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"入库列表\",\"menuType\":\"C\",\"orderNum\":4,\"params\":{},\"parentId\":2021,\"path\":\"warehouseWarrant\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-05 08:12:36', 8);
INSERT INTO `sys_oper_log` VALUES (170, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"inventory/inventory/index\",\"createBy\":\"admin\",\"icon\":\"edit\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"库存列表\",\"menuType\":\"C\",\"orderNum\":5,\"params\":{},\"parentId\":2021,\"path\":\"inventory\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-05 08:13:43', 8);
INSERT INTO `sys_oper_log` VALUES (171, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"inventory/inventory/index\",\"createTime\":\"2024-05-05 08:13:43\",\"icon\":\"edit\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2026,\"menuName\":\"库存列表\",\"menuType\":\"M\",\"orderNum\":5,\"params\":{},\"parentId\":2021,\"path\":\"inventory\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-05 08:16:27', 7);
INSERT INTO `sys_oper_log` VALUES (172, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', NULL, '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":\"lp_inventory\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-05 08:20:58', 57);
INSERT INTO `sys_oper_log` VALUES (173, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"inventory\",\"className\":\"Inventory\",\"columns\":[{\"capJavaField\":\"InventoryId\",\"columnComment\":\"主键\",\"columnId\":1,\"columnName\":\"inventory_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2024-05-05 08:20:58\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"javaField\":\"inventoryId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"InventoryName\",\"columnComment\":\"库存名称\",\"columnId\":2,\"columnName\":\"inventory_name\",\"columnType\":\"varchar(100)\",\"createBy\":\"admin\",\"createTime\":\"2024-05-05 08:20:58\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"inventoryName\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"InventoryNum\",\"columnComment\":\"数量\",\"columnId\":3,\"columnName\":\"inventory_num\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2024-05-05 08:20:58\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"inventoryNum\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"InventoryPrice\",\"columnComment\":\"价格\",\"columnId\":4,\"columnName\":\"inventory_price\",\"columnType\":\"decimal(10,2)\",\"createBy\":\"admin\",\"createTime\":\"2024-05-05 08:20:58\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"inventoryP', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-05 08:22:23', 31);
INSERT INTO `sys_oper_log` VALUES (174, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"inventory\",\"className\":\"Inventory\",\"columns\":[{\"capJavaField\":\"InventoryId\",\"columnComment\":\"主键\",\"columnId\":1,\"columnName\":\"inventory_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2024-05-05 08:20:58\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"javaField\":\"inventoryId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"updateTime\":\"2024-05-05 08:22:23\",\"usableColumn\":false},{\"capJavaField\":\"InventoryName\",\"columnComment\":\"库存名称\",\"columnId\":2,\"columnName\":\"inventory_name\",\"columnType\":\"varchar(100)\",\"createBy\":\"admin\",\"createTime\":\"2024-05-05 08:20:58\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"inventoryName\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"updateTime\":\"2024-05-05 08:22:23\",\"usableColumn\":false},{\"capJavaField\":\"InventoryNum\",\"columnComment\":\"数量\",\"columnId\":3,\"columnName\":\"inventory_num\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2024-05-05 08:20:58\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"inventoryNum\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"updateTime\":\"2024-05-05 08:22:23\",\"usableColumn\":false},{\"capJavaField\":\"InventoryPrice\",\"columnComment\":\"价格\",\"columnId\":4,\"columnName\":\"inventory_price\",\"columnType\":\"decimal(10,2)\",\"createBy\":\"admin\",\"createTime\":\"2024-05-05 08:20:58\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"i', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-05 08:37:55', 54);
INSERT INTO `sys_oper_log` VALUES (175, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"market/market/index\",\"createBy\":\"admin\",\"icon\":\"excel\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"销售管理\",\"menuType\":\"C\",\"orderNum\":4,\"params\":{},\"parentId\":0,\"path\":\"market\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-05 08:44:24', 21);
INSERT INTO `sys_oper_log` VALUES (176, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"\",\"createTime\":\"2024-05-05 08:44:24\",\"icon\":\"excel\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2027,\"menuName\":\"销售管理\",\"menuType\":\"C\",\"orderNum\":4,\"params\":{},\"parentId\":0,\"path\":\"market\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-05 08:45:11', 10);
INSERT INTO `sys_oper_log` VALUES (177, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"market/market/index\",\"createBy\":\"admin\",\"icon\":\"edit\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"销售列表\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2027,\"path\":\"market\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-05 08:45:36', 10);
INSERT INTO `sys_oper_log` VALUES (178, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"market/market/index\",\"createTime\":\"2024-05-05 08:44:24\",\"icon\":\"excel\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2027,\"menuName\":\"销售管理\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":0,\"path\":\"market\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-05 08:48:06', 9);
INSERT INTO `sys_oper_log` VALUES (179, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"\",\"createTime\":\"2024-05-05 08:44:24\",\"icon\":\"excel\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2027,\"menuName\":\"销售管理\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":0,\"path\":\"market\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-05 08:49:08', 7);
INSERT INTO `sys_oper_log` VALUES (180, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"\",\"createTime\":\"2024-05-05 08:44:24\",\"icon\":\"excel\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2027,\"menuName\":\"销售管理\",\"menuType\":\"M\",\"orderNum\":4,\"params\":{},\"parentId\":0,\"path\":\"market\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-05 08:49:29', 11);
INSERT INTO `sys_oper_log` VALUES (181, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"materials/materials/index\",\"createTime\":\"2024-05-04 20:11:03\",\"icon\":\"edit\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2020,\"menuName\":\"生产耗材\",\"menuType\":\"C\",\"orderNum\":3,\"params\":{},\"parentId\":2010,\"path\":\"materials\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-05 08:53:41', 7);
INSERT INTO `sys_oper_log` VALUES (182, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"materials/materials/index\",\"createBy\":\"admin\",\"icon\":\"edit\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"原材料列表\",\"menuType\":\"C\",\"orderNum\":2,\"params\":{},\"parentId\":2010,\"path\":\"materials\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-05 08:54:07', 9);
INSERT INTO `sys_oper_log` VALUES (183, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"materials/materials/index\",\"createTime\":\"2024-05-04 20:11:03\",\"icon\":\"edit\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2020,\"menuName\":\"生产耗材\",\"menuType\":\"C\",\"orderNum\":3,\"params\":{},\"parentId\":2010,\"path\":\"productioninventory\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-05 08:55:37', 11);
INSERT INTO `sys_oper_log` VALUES (184, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', NULL, '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":\"lp_materials\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-05 08:58:19', 63);
INSERT INTO `sys_oper_log` VALUES (185, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"materials\",\"className\":\"Materials\",\"columns\":[{\"capJavaField\":\"LpMaterialsId\",\"columnComment\":\"原料ID\",\"columnId\":12,\"columnName\":\"lp_materials_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2024-05-05 08:58:19\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"javaField\":\"lpMaterialsId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"MaterialsName\",\"columnComment\":\"原材料名称\",\"columnId\":13,\"columnName\":\"materials_name\",\"columnType\":\"varchar(100)\",\"createBy\":\"admin\",\"createTime\":\"2024-05-05 08:58:19\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"materialsName\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"MaterialsNum\",\"columnComment\":\"原料数量\",\"columnId\":14,\"columnName\":\"materials_num\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2024-05-05 08:58:19\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"materialsNum\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"MaterialsPrice\",\"columnComment\":\"价格\",\"columnId\":15,\"columnName\":\"materials_price\",\"columnType\":\"decimal(10,2)\",\"createBy\":\"admin\",\"createTime\":\"2024-05-05 08:58:19\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaFi', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-05 08:58:59', 30);
INSERT INTO `sys_oper_log` VALUES (186, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"materials\",\"className\":\"Materials\",\"columns\":[{\"capJavaField\":\"LpMaterialsId\",\"columnComment\":\"原料ID\",\"columnId\":12,\"columnName\":\"lp_materials_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2024-05-05 08:58:19\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"javaField\":\"lpMaterialsId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"updateTime\":\"2024-05-05 08:58:59\",\"usableColumn\":false},{\"capJavaField\":\"MaterialsName\",\"columnComment\":\"原材料名称\",\"columnId\":13,\"columnName\":\"materials_name\",\"columnType\":\"varchar(100)\",\"createBy\":\"admin\",\"createTime\":\"2024-05-05 08:58:19\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"materialsName\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"updateTime\":\"2024-05-05 08:58:59\",\"usableColumn\":false},{\"capJavaField\":\"MaterialsNum\",\"columnComment\":\"原料数量\",\"columnId\":14,\"columnName\":\"materials_num\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2024-05-05 08:58:19\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"materialsNum\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"updateTime\":\"2024-05-05 08:58:59\",\"usableColumn\":false},{\"capJavaField\":\"MaterialsPrice\",\"columnComment\":\"价格\",\"columnId\":15,\"columnName\":\"materials_price\",\"columnType\":\"decimal(10,2)\",\"createBy\":\"admin\",\"createTime\":\"2024-05-05 08:58:19\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-05 09:00:02', 21);
INSERT INTO `sys_oper_log` VALUES (187, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"lp_materials\"}', NULL, 0, NULL, '2024-05-05 09:00:05', 35);
INSERT INTO `sys_oper_log` VALUES (188, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"productioninventory/productioninventory/index\",\"createTime\":\"2024-05-04 20:11:03\",\"icon\":\"edit\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2020,\"menuName\":\"生产耗材\",\"menuType\":\"C\",\"orderNum\":3,\"params\":{},\"parentId\":2010,\"path\":\"productioninventory\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-05 14:38:38', 18);
INSERT INTO `sys_oper_log` VALUES (189, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"finishedproduct/finishedproduct/index\",\"createBy\":\"admin\",\"icon\":\"edit\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"成品列表\",\"menuType\":\"C\",\"orderNum\":2,\"params\":{},\"parentId\":2019,\"path\":\"finishedproduct\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-05 14:45:11', 11);
INSERT INTO `sys_oper_log` VALUES (190, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"finishedproduct/finishedproduct/index\",\"createBy\":\"admin\",\"icon\":\"edit\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"成品列表\",\"menuType\":\"C\",\"orderNum\":2,\"params\":{},\"parentId\":2018,\"path\":\"finishedproduct\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-05 14:47:11', 9);
INSERT INTO `sys_oper_log` VALUES (191, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"product/product/index\",\"createBy\":\"admin\",\"icon\":\"edit\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"成品库存\",\"menuType\":\"C\",\"orderNum\":3,\"params\":{},\"parentId\":2018,\"path\":\"product\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-05 14:56:52', 10);
INSERT INTO `sys_oper_log` VALUES (192, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2024-04-27 19:46:02\",\"icon\":\"monitor\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2,\"menuName\":\"系统监控\",\"menuType\":\"M\",\"orderNum\":11,\"params\":{},\"parentId\":0,\"path\":\"monitor\",\"perms\":\"\",\"query\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-06 00:02:56', 21);
INSERT INTO `sys_oper_log` VALUES (193, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2024-04-27 19:46:02\",\"icon\":\"tool\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":3,\"menuName\":\"系统工具\",\"menuType\":\"M\",\"orderNum\":12,\"params\":{},\"parentId\":0,\"path\":\"tool\",\"perms\":\"\",\"query\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-06 00:03:03', 9);
INSERT INTO `sys_oper_log` VALUES (194, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2024-04-27 19:46:02\",\"icon\":\"guide\",\"isCache\":\"0\",\"isFrame\":\"0\",\"menuId\":4,\"menuName\":\"若依官网\",\"menuType\":\"M\",\"orderNum\":13,\"params\":{},\"parentId\":0,\"path\":\"http://ruoyi.vip\",\"perms\":\"\",\"query\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-06 00:03:09', 8);
INSERT INTO `sys_oper_log` VALUES (195, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2024-05-04 19:33:48\",\"icon\":\"documentation\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2015,\"menuName\":\"客户管理\",\"menuType\":\"M\",\"orderNum\":5,\"params\":{},\"parentId\":0,\"path\":\"clientclassify\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-06 00:03:51', 8);
INSERT INTO `sys_oper_log` VALUES (196, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2024-05-04 18:48:54\",\"icon\":\"dict\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2012,\"menuName\":\"采购管理\",\"menuType\":\"M\",\"orderNum\":6,\"params\":{},\"parentId\":0,\"path\":\"procurementPlan\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-06 00:04:11', 8);
INSERT INTO `sys_oper_log` VALUES (197, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2024-05-04 18:47:22\",\"icon\":\"dict\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2010,\"menuName\":\"原材料管理\",\"menuType\":\"M\",\"orderNum\":7,\"params\":{},\"parentId\":0,\"path\":\"materialsClassify\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-06 00:04:23', 7);
INSERT INTO `sys_oper_log` VALUES (198, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2024-05-05 08:06:27\",\"icon\":\"excel\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2021,\"menuName\":\"仓库管理\",\"menuType\":\"M\",\"orderNum\":8,\"params\":{},\"parentId\":0,\"path\":\"warehouse\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-06 00:04:30', 8);
INSERT INTO `sys_oper_log` VALUES (199, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2024-05-04 20:07:05\",\"icon\":\"dict\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2018,\"menuName\":\"生产管理\",\"menuType\":\"M\",\"orderNum\":9,\"params\":{},\"parentId\":0,\"path\":\"production\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-06 00:04:38', 8);
INSERT INTO `sys_oper_log` VALUES (200, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"\",\"createTime\":\"2024-05-05 08:44:24\",\"icon\":\"excel\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2027,\"menuName\":\"销售管理\",\"menuType\":\"M\",\"orderNum\":10,\"params\":{},\"parentId\":0,\"path\":\"market\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-06 00:04:47', 7);
INSERT INTO `sys_oper_log` VALUES (201, '供应商分类', 2, 'com.ruoyi.equipment.controller.ClassifyController.edit()', 'PUT', 1, 'admin', NULL, '/classify/classify', '127.0.0.1', '内网IP', '{\"classifyId\":1,\"classifyName\":\"最大的供应商\",\"description\":\"最大\",\"params\":{},\"remark\":\"最大\",\"sort\":1,\"updateTime\":\"2024-05-12 16:51:31\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-12 16:51:31', 22);
INSERT INTO `sys_oper_log` VALUES (202, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2024-04-27 19:46:02\",\"icon\":\"system\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":1,\"menuName\":\"系统管理\",\"menuType\":\"M\",\"orderNum\":1,\"params\":{},\"parentId\":0,\"path\":\"system\",\"perms\":\"\",\"query\":\"\",\"status\":\"1\",\"updateBy\":\"admin\",\"visible\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-24 16:11:24', 21);
INSERT INTO `sys_oper_log` VALUES (203, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/4', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"菜单已分配,不允许删除\",\"code\":601}', 0, NULL, '2024-05-24 16:13:36', 8);
INSERT INTO `sys_oper_log` VALUES (204, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/4', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"菜单已分配,不允许删除\",\"code\":601}', 0, NULL, '2024-05-24 16:13:42', 4);
INSERT INTO `sys_oper_log` VALUES (205, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2024-04-27 19:46:02\",\"icon\":\"guide\",\"isCache\":\"0\",\"isFrame\":\"0\",\"menuId\":4,\"menuName\":\"若依官网\",\"menuType\":\"M\",\"orderNum\":13,\"params\":{},\"parentId\":0,\"path\":\"http://ruoyi.vip\",\"perms\":\"\",\"query\":\"\",\"status\":\"1\",\"updateBy\":\"admin\",\"visible\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-24 16:13:55', 9);
INSERT INTO `sys_oper_log` VALUES (206, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2024-04-27 19:46:02\",\"icon\":\"tool\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":3,\"menuName\":\"系统工具\",\"menuType\":\"M\",\"orderNum\":12,\"params\":{},\"parentId\":0,\"path\":\"tool\",\"perms\":\"\",\"query\":\"\",\"status\":\"1\",\"updateBy\":\"admin\",\"visible\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-24 16:14:03', 8);
INSERT INTO `sys_oper_log` VALUES (207, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2024-04-27 19:46:02\",\"icon\":\"monitor\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2,\"menuName\":\"系统监控\",\"menuType\":\"M\",\"orderNum\":11,\"params\":{},\"parentId\":0,\"path\":\"monitor\",\"perms\":\"\",\"query\":\"\",\"status\":\"1\",\"updateBy\":\"admin\",\"visible\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-24 16:14:16', 8);
INSERT INTO `sys_oper_log` VALUES (208, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2024-04-27 19:46:02\",\"icon\":\"system\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":1,\"menuName\":\"系统管理\",\"menuType\":\"M\",\"orderNum\":1,\"params\":{},\"parentId\":0,\"path\":\"system\",\"perms\":\"\",\"query\":\"\",\"status\":\"1\",\"updateBy\":\"admin\",\"visible\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-24 16:14:25', 8);
INSERT INTO `sys_oper_log` VALUES (209, '财务数据', 1, 'com.ruoyi.equipment.controller.FinanceController.add()', 'POST', 1, 'admin', NULL, '/finance/finance', '127.0.0.1', '内网IP', '{\"auditStatus\":0,\"createBy\":\"admin\",\"createTime\":\"2024-05-28 00:32:19\",\"financeBalance\":20,\"financeId\":1,\"financeMoney\":1000,\"financeName\":\"财务\",\"financeStatus\":0,\"params\":{},\"supplierId\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-28 00:32:19', 19);
INSERT INTO `sys_oper_log` VALUES (210, '客户分类', 1, 'com.ruoyi.production.controller.ClientClassifyController.add()', 'POST', 1, 'admin', NULL, '/clientclassify/clientclassify', '127.0.0.1', '内网IP', '{\"clientClassifyName\":\"小客户\",\"createTime\":\"2024-05-28 00:32:33\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-28 00:32:34', 7);
INSERT INTO `sys_oper_log` VALUES (211, '客户列表', 1, 'com.ruoyi.production.controller.ClientController.add()', 'POST', 1, 'admin', NULL, '/client/client', '127.0.0.1', '内网IP', '{\"auditStatus\":0,\"clientAddress\":\"湖北宜昌\",\"clientName\":\"客户\",\"clientPerson\":\"柯南\",\"clientPhone\":\"123456789\",\"createTime\":\"2024-05-28 00:32:56\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-28 00:32:56', 8);
INSERT INTO `sys_oper_log` VALUES (212, '财务数据', 2, 'com.ruoyi.equipment.controller.FinanceController.edit()', 'PUT', 1, 'admin', NULL, '/finance/finance', '127.0.0.1', '内网IP', '{\"auditStatus\":0,\"createBy\":\"admin\",\"createTime\":\"2024-05-28 00:32:20\",\"financeBalance\":20,\"financeContent\":\"<p>客户财务</p>\",\"financeId\":1,\"financeMoney\":1000,\"financeName\":\"财务\",\"financeStatus\":0,\"params\":{},\"remark\":\"小客户\",\"supplierId\":1,\"updateBy\":\"admin\",\"updateTime\":\"2024-05-28 01:10:47\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-28 01:10:47', 9);
INSERT INTO `sys_oper_log` VALUES (213, '财务数据', 2, 'com.ruoyi.equipment.controller.FinanceController.edit()', 'PUT', 1, 'admin', NULL, '/finance/finance', '127.0.0.1', '内网IP', '{\"auditStatus\":0,\"createBy\":\"admin\",\"createTime\":\"2024-05-28 00:32:20\",\"financeBalance\":20,\"financeContent\":\"<p>客户财务</p>\",\"financeId\":1,\"financeMoney\":1000,\"financeName\":\"财务\",\"financeStatus\":0,\"params\":{},\"remark\":\"小客户\",\"supplierId\":1,\"updateBy\":\"admin\",\"updateTime\":\"2024-05-28 01:30:11\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-28 01:30:11', 5);
INSERT INTO `sys_oper_log` VALUES (214, '用户头像', 2, 'com.huaan.web.controller.system.SysProfileController.avatar()', 'POST', 1, 'admin', NULL, '/system/user/profile/avatar', '127.0.0.1', '内网IP', '', '{\"msg\":\"操作成功\",\"imgUrl\":\"/profile/avatar/2024/10/11/blob_20241011100709A001.png\",\"code\":200}', 0, NULL, '2024-10-11 10:07:09', 422);
INSERT INTO `sys_oper_log` VALUES (215, '部门管理', 2, 'com.huaan.web.controller.system.SysDeptController.edit()', 'PUT', 1, 'admin', NULL, '/system/dept', '127.0.0.1', '内网IP', '{\"ancestors\":\"0\",\"children\":[],\"deptId\":100,\"deptName\":\"华安素材\",\"email\":\"463183884@qq.com\",\"leader\":\"华安\",\"orderNum\":0,\"params\":{},\"parentId\":0,\"phone\":\"17817189499\",\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-10-11 10:08:12', 18);
INSERT INTO `sys_oper_log` VALUES (216, '部门管理', 2, 'com.huaan.web.controller.system.SysDeptController.edit()', 'PUT', 1, 'admin', NULL, '/system/dept', '127.0.0.1', '内网IP', '{\"ancestors\":\"0,100\",\"children\":[],\"deptId\":101,\"deptName\":\"深圳总公司\",\"email\":\"463183884@qq.com\",\"leader\":\"华安\",\"orderNum\":1,\"params\":{},\"parentId\":100,\"parentName\":\"华安素材\",\"phone\":\"17817189499\",\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-10-11 10:08:47', 21);
INSERT INTO `sys_oper_log` VALUES (217, '部门管理', 2, 'com.huaan.web.controller.system.SysDeptController.edit()', 'PUT', 1, 'admin', NULL, '/system/dept', '127.0.0.1', '内网IP', '{\"ancestors\":\"0,100\",\"children\":[],\"deptId\":101,\"deptName\":\"深圳总公司\",\"email\":\"463183884@qq.com\",\"leader\":\"华安\",\"orderNum\":1,\"params\":{},\"parentId\":100,\"parentName\":\"华安素材\",\"phone\":\"17817189499\",\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-10-11 10:10:23', 18);
INSERT INTO `sys_oper_log` VALUES (218, '部门管理', 2, 'com.huaan.web.controller.system.SysDeptController.edit()', 'PUT', 1, 'admin', NULL, '/system/dept', '127.0.0.1', '内网IP', '{\"ancestors\":\"0,100\",\"children\":[],\"deptId\":102,\"deptName\":\"长沙分公司\",\"email\":\"463183884@qq.com\",\"leader\":\"华安\",\"orderNum\":2,\"params\":{},\"parentId\":100,\"parentName\":\"华安素材\",\"phone\":\"17817189499\",\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-10-11 10:10:27', 19);
INSERT INTO `sys_oper_log` VALUES (219, '部门管理', 2, 'com.huaan.web.controller.system.SysDeptController.edit()', 'PUT', 1, 'admin', NULL, '/system/dept', '127.0.0.1', '内网IP', '{\"ancestors\":\"0,100,101\",\"children\":[],\"deptId\":107,\"deptName\":\"运维部门\",\"email\":\"463183884@qq.com\",\"leader\":\"华安\",\"orderNum\":5,\"params\":{},\"parentId\":101,\"parentName\":\"深圳总公司\",\"phone\":\"17817189499\",\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-10-11 10:10:31', 16);
INSERT INTO `sys_oper_log` VALUES (220, '通知公告', 2, 'com.huaan.web.controller.system.SysNoticeController.edit()', 'PUT', 1, 'admin', NULL, '/system/notice', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2024-04-27 19:46:02\",\"noticeContent\":\"新版本内容\",\"noticeId\":1,\"noticeTitle\":\"温馨提醒：2018-07-01 华安新版本发布啦\",\"noticeType\":\"2\",\"params\":{},\"remark\":\"管理员\",\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-10-11 10:11:12', 9);
INSERT INTO `sys_oper_log` VALUES (221, '通知公告', 2, 'com.huaan.web.controller.system.SysNoticeController.edit()', 'PUT', 1, 'admin', NULL, '/system/notice', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2024-04-27 19:46:02\",\"noticeContent\":\"<p>维护内容</p>\",\"noticeId\":2,\"noticeTitle\":\"维护通知：2018-07-01 华安系统凌晨维护\",\"noticeType\":\"1\",\"params\":{},\"remark\":\"管理员\",\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-10-11 10:11:21', 5);
INSERT INTO `sys_oper_log` VALUES (222, '库房列', 1, 'com.huaan.materials.controller.WarehouseController.add()', 'POST', 1, 'admin', NULL, '/warehouse/warehouse', '127.0.0.1', '内网IP', '{\"createTime\":\"2024-10-11 10:12:22\",\"params\":{},\"warehouseId\":1,\"warehouseName\":\"A库房\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-10-11 10:12:22', 10);
INSERT INTO `sys_oper_log` VALUES (223, '库房列', 2, 'com.huaan.materials.controller.WarehouseController.edit()', 'PUT', 1, 'admin', NULL, '/warehouse/warehouse', '127.0.0.1', '内网IP', '{\"createTime\":\"2024-10-11 10:12:22\",\"params\":{},\"remark\":\"其它设备仓库\",\"updateTime\":\"2024-10-11 10:12:32\",\"warehouseId\":1,\"warehouseName\":\"A库房\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-10-11 10:12:32', 5);
INSERT INTO `sys_oper_log` VALUES (224, '货架列表', 1, 'com.huaan.materials.controller.ShelfController.add()', 'POST', 1, 'admin', NULL, '/shelf/shelf', '127.0.0.1', '内网IP', '{\"createTime\":\"2024-10-11 10:13:01\",\"params\":{},\"remark\":\"服装区\",\"shelfEncoding\":\"A101\",\"shelfId\":1,\"shelfName\":\"A区货架\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-10-11 10:13:01', 7);
INSERT INTO `sys_oper_log` VALUES (225, '货位列表', 1, 'com.huaan.materials.controller.LocationController.add()', 'POST', 1, 'admin', NULL, '/location/location', '127.0.0.1', '内网IP', '{\"createTime\":\"2024-10-11 10:13:42\",\"locationEncoding\":\"AH101\",\"locationId\":1,\"locationName\":\"A区108货位\",\"params\":{},\"remark\":\"女装\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-10-11 10:13:42', 8);
INSERT INTO `sys_oper_log` VALUES (226, '入库列表', 1, 'com.huaan.equipment.controller.WarehouseWarrantController.add()', 'POST', 1, 'admin', NULL, '/warehouseWarrant/warehouseWarrant', '127.0.0.1', '内网IP', '{\"auditStatus\":0,\"createTime\":\"2024-10-11 10:14:29\",\"locationId\":1,\"params\":{},\"shelfId\":1,\"unit\":\"件\",\"warehouseId\":1,\"warehouseWarrantId\":1,\"warehouseWarrantName\":\"以纯\",\"warehouseWarrantNum\":100,\"warehouseWarrantPrice\":99}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-10-11 10:14:29', 10);
INSERT INTO `sys_oper_log` VALUES (227, '库存列表对象', 1, 'com.huaan.equipment.controller.InventoryController.add()', 'POST', 1, 'admin', NULL, '/inventory/inventory', '127.0.0.1', '内网IP', '{\"createTime\":\"2024-10-11 10:14:59\",\"inventoryId\":1,\"inventoryName\":\"以纯库存\",\"inventoryNum\":1000,\"inventoryPrice\":99,\"inventoryUnit\":\"件\",\"params\":{},\"warehouseWarrantId\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-10-11 10:14:59', 6);
INSERT INTO `sys_oper_log` VALUES (228, '成品列表', 1, 'com.huaan.production.controller.FinishedProductController.add()', 'POST', 1, 'admin', NULL, '/finishedproduct/finishedproduct', '127.0.0.1', '内网IP', '{\"createTime\":\"2024-10-11 10:16:04\",\"finishedProductName\":\"以纯\",\"finishedProductNum\":100,\"finishedProductUnit\":\"件\",\"firstDuty\":\"刘主管\",\"firstDutyPhone\":\"17817189499\",\"gradeClass\":\"早班\",\"offTime\":\"12:00\",\"officeNum\":8,\"officeTime\":\"8:00\",\"params\":{}}', NULL, 1, '\r\n### Error updating database.  Cause: com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Data too long for column \'first_duty_phone\' at row 1\r\n### The error may exist in file [H:\\Company\\华安源码\\SRM供应商综合管理系统\\HA-SRM\\huaan-production\\target\\classes\\mapper\\FinishedProductMapper.xml]\r\n### The error may involve com.huaan.production.mapper.FinishedProductMapper.insertFinishedProduct-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into lp_finished_product          ( finished_product_name,             finished_product_num,             finished_product_unit,             first_duty,             first_duty_phone,             grade_class,             office_time,             off_time,             office_num,                                       create_time )           values ( ?,             ?,             ?,             ?,             ?,             ?,             ?,             ?,             ?,                                       ? )\r\n### Cause: com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Data too long for column \'first_duty_phone\' at row 1\n; Data truncation: Data too long for column \'first_duty_phone\' at row 1; nested exception is com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Data too long for column \'first_duty_phone\' at row 1', '2024-10-11 10:16:05', 64);
INSERT INTO `sys_oper_log` VALUES (229, '成品列表', 1, 'com.huaan.production.controller.FinishedProductController.add()', 'POST', 1, 'admin', NULL, '/finishedproduct/finishedproduct', '127.0.0.1', '内网IP', '{\"createTime\":\"2024-10-11 10:18:32\",\"finishedProductName\":\"以纯\",\"finishedProductNum\":100,\"finishedProductUnit\":\"件\",\"firstDuty\":\"刘主管\",\"firstDutyPhone\":\"17817189499\",\"gradeClass\":\"早班\",\"offTime\":\"12:00\",\"officeNum\":8,\"officeTime\":\"8:00\",\"params\":{}}', NULL, 1, '\r\n### Error updating database.  Cause: com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Incorrect datetime value: \'8:00\' for column \'office_time\' at row 1\r\n### The error may exist in file [H:\\Company\\华安源码\\SRM供应商综合管理系统\\HA-SRM\\huaan-production\\target\\classes\\mapper\\FinishedProductMapper.xml]\r\n### The error may involve com.huaan.production.mapper.FinishedProductMapper.insertFinishedProduct-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into lp_finished_product          ( finished_product_name,             finished_product_num,             finished_product_unit,             first_duty,             first_duty_phone,             grade_class,             office_time,             off_time,             office_num,                                       create_time )           values ( ?,             ?,             ?,             ?,             ?,             ?,             ?,             ?,             ?,                                       ? )\r\n### Cause: com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Incorrect datetime value: \'8:00\' for column \'office_time\' at row 1\n; Data truncation: Incorrect datetime value: \'8:00\' for column \'office_time\' at row 1; nested exception is com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Incorrect datetime value: \'8:00\' for column \'office_time\' at row 1', '2024-10-11 10:18:32', 4);
INSERT INTO `sys_oper_log` VALUES (230, '成品列表', 1, 'com.huaan.production.controller.FinishedProductController.add()', 'POST', 1, 'admin', NULL, '/finishedproduct/finishedproduct', '127.0.0.1', '内网IP', '{\"createTime\":\"2024-10-11 10:18:41\",\"finishedProductName\":\"以纯\",\"finishedProductNum\":100,\"finishedProductUnit\":\"件\",\"firstDuty\":\"刘主管\",\"firstDutyPhone\":\"17817189499\",\"gradeClass\":\"早班\",\"offTime\":\"12:00\",\"officeNum\":8,\"officeTime\":\"8:00\",\"params\":{}}', NULL, 1, '\r\n### Error updating database.  Cause: com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Incorrect datetime value: \'8:00\' for column \'office_time\' at row 1\r\n### The error may exist in file [H:\\Company\\华安源码\\SRM供应商综合管理系统\\HA-SRM\\huaan-production\\target\\classes\\mapper\\FinishedProductMapper.xml]\r\n### The error may involve com.huaan.production.mapper.FinishedProductMapper.insertFinishedProduct-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into lp_finished_product          ( finished_product_name,             finished_product_num,             finished_product_unit,             first_duty,             first_duty_phone,             grade_class,             office_time,             off_time,             office_num,                                       create_time )           values ( ?,             ?,             ?,             ?,             ?,             ?,             ?,             ?,             ?,                                       ? )\r\n### Cause: com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Incorrect datetime value: \'8:00\' for column \'office_time\' at row 1\n; Data truncation: Incorrect datetime value: \'8:00\' for column \'office_time\' at row 1; nested exception is com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Incorrect datetime value: \'8:00\' for column \'office_time\' at row 1', '2024-10-11 10:18:41', 3);
INSERT INTO `sys_oper_log` VALUES (231, '成品列表', 1, 'com.huaan.production.controller.FinishedProductController.add()', 'POST', 1, 'admin', NULL, '/finishedproduct/finishedproduct', '127.0.0.1', '内网IP', '{\"createTime\":\"2024-10-11 10:20:53\",\"finishedProductName\":\"以纯\",\"finishedProductNum\":100,\"finishedProductUnit\":\"件\",\"firstDuty\":\"刘主管\",\"firstDutyPhone\":\"17817189499\",\"gradeClass\":\"早班\",\"offTime\":\"2024-08-08 12:00\",\"officeNum\":10,\"officeTime\":\"2024-08-08 8:00\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-10-11 10:20:53', 7);
INSERT INTO `sys_oper_log` VALUES (232, '成品库存', 1, 'com.huaan.production.controller.ProductController.add()', 'POST', 1, 'admin', NULL, '/product/product', '127.0.0.1', '内网IP', '{\"createTime\":\"2024-10-11 10:21:56\",\"operationProductId\":1,\"params\":{},\"productName\":\"以纯\",\"productNum\":1000,\"productPrice\":99,\"productUnit\":\"件\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-10-11 10:21:56', 9);
INSERT INTO `sys_oper_log` VALUES (233, 'market', 1, 'com.huaan.equipment.controller.MarketController.add()', 'POST', 1, 'admin', NULL, '/market/market', '127.0.0.1', '内网IP', '{\"approverOpinion\":\"同意\",\"approverPerson\":\"刘主管\",\"approverTime\":\"2024-10-15\",\"auditOpinion\":\"同意\",\"auditPerson\":\"刘主管\",\"auditStatus\":0,\"auditTime\":\"2024-10-22\",\"clientId\":1,\"createTime\":\"2024-10-11 10:25:07\",\"marketName\":\"采购出货\",\"marketNum\":100,\"marketPrice\":10000,\"marketUnit\":\"件\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-10-11 10:25:07', 11);

-- ----------------------------
-- Table structure for sys_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_post`;
CREATE TABLE `sys_post`  (
  `post_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '岗位ID',
  `post_code` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '岗位编码',
  `post_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '岗位名称',
  `post_sort` int(11) NOT NULL COMMENT '显示顺序',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`post_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '岗位信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_post
-- ----------------------------
INSERT INTO `sys_post` VALUES (1, 'ceo', '董事长', 1, '0', 'admin', '2024-04-27 19:46:02', '', NULL, '');
INSERT INTO `sys_post` VALUES (2, 'se', '项目经理', 2, '0', 'admin', '2024-04-27 19:46:02', '', NULL, '');
INSERT INTO `sys_post` VALUES (3, 'hr', '人力资源', 3, '0', 'admin', '2024-04-27 19:46:02', '', NULL, '');
INSERT INTO `sys_post` VALUES (4, 'user', '普通员工', 4, '0', 'admin', '2024-04-27 19:46:02', '', NULL, '');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `role_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `role_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '角色名称',
  `role_key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '角色权限字符串',
  `role_sort` int(11) NOT NULL COMMENT '显示顺序',
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
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '角色信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES (1, '超级管理员', 'admin', 1, '1', 1, 1, '0', '0', 'admin', '2024-04-27 19:46:02', '', NULL, '超级管理员');
INSERT INTO `sys_role` VALUES (2, '普通角色', 'common', 2, '2', 1, 1, '0', '0', 'admin', '2024-04-27 19:46:02', '', NULL, '普通角色');

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
INSERT INTO `sys_role_menu` VALUES (2, 117);
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

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `user_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `dept_id` bigint(20) NULL DEFAULT NULL COMMENT '部门ID',
  `user_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户账号',
  `nick_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户昵称',
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
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (1, 103, 'admin', '华安', '00', '463183884@163.com', '17817189499', '0', '/profile/avatar/2024/10/11/blob_20241011100709A001.png', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '0', '127.0.0.1', '2024-10-11 09:52:29', 'admin', '2024-04-27 19:46:02', '', '2024-10-11 09:52:28', '管理员');
INSERT INTO `sys_user` VALUES (2, 105, 'huaan', 'huan', '00', '463183884@qq.com', '18973308117', '1', '', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '0', '127.0.0.1', '2024-04-27 19:46:02', 'admin', '2024-04-27 19:46:02', '', NULL, '测试员');

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
INSERT INTO `sys_user_post` VALUES (2, 2);

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
INSERT INTO `sys_user_role` VALUES (2, 2);

SET FOREIGN_KEY_CHECKS = 1;
