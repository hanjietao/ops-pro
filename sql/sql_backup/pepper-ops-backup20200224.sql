/*
 Navicat Premium Data Transfer

 Source Server         : local
 Source Server Type    : MySQL
 Source Server Version : 50723
 Source Host           : localhost:3306
 Source Schema         : pepper-ops

 Target Server Type    : MySQL
 Target Server Version : 50723
 File Encoding         : 65001

 Date: 24/02/2020 14:11:59
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for ch_appointment
-- ----------------------------
DROP TABLE IF EXISTS `ch_appointment`;
CREATE TABLE `ch_appointment`  (
  `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '预约ID',
  `USER_ID` bigint(20) NOT NULL COMMENT '用户id',
  `HOSPITAL_ID` int(11) DEFAULT NULL COMMENT '预约医院ID',
  `MEDICAL_PROJECT_ID` int(11) DEFAULT NULL COMMENT '预约服务项目ID',
  `APPOINTMENT_TIME` date DEFAULT NULL COMMENT '预约日期',
  `APPOINTMENT_NAME` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '预约人姓名',
  `APPOINTMENT_PHONE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '预约人手机号',
  `CANCEL_REASON` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '取消原因',
  `STATUS` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '状态 0-正常，1-关闭（取消预约）',
  `CREATE_BY` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '创建人',
  `CREATE_TIME` datetime(0) DEFAULT NULL COMMENT '创建时间',
  `UPDATE_BY` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '更新人',
  `UPDATE_TIME` datetime(0) DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '预约管理 ' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ch_appointment
-- ----------------------------
INSERT INTO `ch_appointment` VALUES (3, 10000001, 2, 2, '2020-02-20', 'hant', '18978790987', NULL, '0', 'admin', '2020-02-20 11:44:37', 'admin', '2020-02-20 11:44:37');
INSERT INTO `ch_appointment` VALUES (4, 10000001, 11, 2, '2020-02-24', '1111', '1111', NULL, '0', 'hospital1', '2020-02-23 13:12:01', 'hospital1', '2020-02-23 13:12:01');

-- ----------------------------
-- Table structure for ch_doctor
-- ----------------------------
DROP TABLE IF EXISTS `ch_doctor`;
CREATE TABLE `ch_doctor`  (
  `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '医生ID',
  `DOCTOR_CODE` int(11) NOT NULL COMMENT '医生ID',
  `DOCTOR_NAME` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '医生名称',
  `MAJOR_FIELD` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '专业方向介绍',
  `DOCTOR_TYPE` int(11) DEFAULT NULL COMMENT '医生类型1-主治医生，2-助理医生，3-实习医生',
  `HOSPITAL_ID` int(11) DEFAULT NULL COMMENT '所属医院',
  `STATUS` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '状态 0-正常，1-关闭',
  `CREATE_BY` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '创建人',
  `CREATE_TIME` datetime(0) DEFAULT NULL COMMENT '创建时间',
  `UPDATE_BY` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '更新人',
  `UPDATE_TIME` datetime(0) DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2001 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '医生管理 ' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ch_doctor
-- ----------------------------
INSERT INTO `ch_doctor` VALUES (2000, 1000, '1111111', '11111', 1, 11, '0', 'hospital1', '2020-02-21 22:46:33', 'hospital1', '2020-02-21 22:46:33');

-- ----------------------------
-- Table structure for ch_hospital
-- ----------------------------
DROP TABLE IF EXISTS `ch_hospital`;
CREATE TABLE `ch_hospital`  (
  `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '医院ID',
  `HOS_NAME` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '医院名称',
  `HOS_CODE` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '医院英文名',
  `INTRODUCTION` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci COMMENT '医院介绍',
  `COMMUNITY_IDS` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '服务的社区IDS 社区1，社区2，。。。',
  `AREA_ID` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '所属区域',
  `STATUS` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '状态 0-正常，1-关闭',
  `CREATE_BY` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '创建人',
  `CREATE_TIME` datetime(0) DEFAULT NULL COMMENT '创建时间',
  `UPDATE_BY` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '更新人',
  `UPDATE_TIME` datetime(0) DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '社区服务服务中心-医院介绍 ' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ch_hospital
-- ----------------------------
INSERT INTO `ch_hospital` VALUES (2, '天山花园快乐社区医院', 'sky garden happy hospital', '<span style=\"font-size: 18px; background-color: rgb(255, 231, 156);\">90909</span>', '3,4', '4', '0', 'admin', '2020-02-06 12:11:26', 'admin', '2020-02-13 13:20:00');
INSERT INTO `ch_hospital` VALUES (6, '沙依巴克区红十月社区健康医院', 'sybk red month community hospital', '这是一家社区医院，提供基础的医疗救助服务！', '4', '3', '0', 'admin', '2020-02-11 07:04:54', 'admin', '2020-02-20 11:03:50');
INSERT INTO `ch_hospital` VALUES (8, '米东区 万福街道社区医院', '110002', '<p>米东区社区医院&nbsp; 为您服务</p>', '5', '4', '0', 'admin', '2020-02-20 11:10:31', 'admin', '2020-02-21 16:57:27');
INSERT INTO `ch_hospital` VALUES (9, 'htest3医院', NULL, '这是一个医院！', NULL, '4', '0', 'admin', '2020-02-21 16:13:07', 'admin', '2020-02-21 16:13:07');
INSERT INTO `ch_hospital` VALUES (10, 'htest4医院', NULL, '这是一个医院！', NULL, '4', '0', 'admin', '2020-02-21 16:22:34', 'admin', '2020-02-21 16:22:34');
INSERT INTO `ch_hospital` VALUES (11, 'hospital1医院', '11', '111222', '3,4', '5', '0', 'admin', '2020-02-21 18:04:17', 'hospital1', '2020-02-23 13:31:47');
INSERT INTO `ch_hospital` VALUES (12, 'hospital2医院', '12', '这是一个医院！', NULL, '4', '0', 'admin', '2020-02-21 18:04:53', 'admin', '2020-02-21 18:04:53');
INSERT INTO `ch_hospital` VALUES (13, 'hospital3医院', '13', '[object Object]', '3,5,6,7,8', '3', '0', 'admin', '2020-02-21 18:05:26', 'admin', '2020-02-23 13:25:30');

-- ----------------------------
-- Table structure for ch_medical_project
-- ----------------------------
DROP TABLE IF EXISTS `ch_medical_project`;
CREATE TABLE `ch_medical_project`  (
  `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '医疗项目ID',
  `NAME` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '医疗项目名称',
  `SERVICE_CONTENT` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '服务内容',
  `PRICE` decimal(32, 2) DEFAULT NULL COMMENT '收费标准 45',
  `HOSPITAL_ID` int(11) DEFAULT NULL COMMENT '医院id',
  `DELETE_FLAG` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '0' COMMENT '删除标志 1-已删除，0-未删除',
  `STATUS` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '状态 0-正常，1-关闭',
  `CREATE_BY` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '创建人',
  `CREATE_TIME` datetime(0) DEFAULT NULL COMMENT '创建时间',
  `UPDATE_BY` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '更新人',
  `UPDATE_TIME` datetime(0) DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '医疗项目' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ch_medical_project
-- ----------------------------
INSERT INTO `ch_medical_project` VALUES (2, '健康检查', '健康检查：检查血压/心率，面容情况', 100.00, 8, '0', '0', 'admin', '2020-02-13 09:31:20', 'admin', '2020-02-20 13:29:10');
INSERT INTO `ch_medical_project` VALUES (3, '专治各种疑难杂症', '专治各种疑难杂症', 12.00, 11, '0', '0', 'hospital1', '2020-02-23 13:32:17', 'hospital1', '2020-02-23 13:32:17');

-- ----------------------------
-- Table structure for cm_activity
-- ----------------------------
DROP TABLE IF EXISTS `cm_activity`;
CREATE TABLE `cm_activity`  (
  `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '活动ID',
  `TITLE` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '活动标题',
  `CONTENT` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci COMMENT '活动内容',
  `STATUS` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '状态 0-正常，1-关闭',
  `CREATE_BY` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '创建人',
  `CREATE_TIME` datetime(0) DEFAULT NULL COMMENT '创建时间',
  `UPDATE_BY` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '更新人',
  `UPDATE_TIME` datetime(0) DEFAULT NULL COMMENT '更新时间',
  `COMMUNITY_ID` int(11) DEFAULT NULL COMMENT '社区id',
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '社区活动 ' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cm_activity
-- ----------------------------
INSERT INTO `cm_activity` VALUES (1, '沙依巴克区十月红社区服务中心2020防疫献爱心活动', '<p>sfdfsf</p>', '0', 'admin', '2020-02-14 15:59:44', 'admin', '2020-02-16 13:41:38', 1);
INSERT INTO `cm_activity` VALUES (2, '天山区花园社区迎接新春活动', '<p>222</p>', '0', 'admin', '2020-02-14 16:02:19', 'admin', '2020-02-16 13:40:40', 2);
INSERT INTO `cm_activity` VALUES (3, 'community2   大活动那个', '<p>&nbsp; 大活动那个&nbsp; 大活动那个&nbsp; 大活动那个&nbsp; 大活动那个&nbsp; 大活动那个&nbsp; 大活动那个&nbsp; 大活动那个</p><p><br></p><p>&nbsp; 大活动那个<br></p>', '0', 'community2', '2020-02-21 18:42:56', 'community2', '2020-02-21 18:42:56', 12);
INSERT INTO `cm_activity` VALUES (4, 'community  大大大大大', '<p>犯得上犯得上发射点</p>', '0', 'community2', '2020-02-21 20:02:06', 'community2', '2020-02-21 20:02:06', 12);

-- ----------------------------
-- Table structure for cm_activity_apply
-- ----------------------------
DROP TABLE IF EXISTS `cm_activity_apply`;
CREATE TABLE `cm_activity_apply`  (
  `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '活动ID',
  `activity_id` int(11) DEFAULT NULL COMMENT '活动id',
  `USER_ID` bigint(20) DEFAULT NULL COMMENT '用户id',
  `USER_MOBILE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '用户手机号，参加活动用',
  `STATUS` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '状态 0-正常，1-关闭',
  `CREATE_BY` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '创建人',
  `CREATE_TIME` datetime(0) DEFAULT NULL COMMENT '创建时间',
  `UPDATE_BY` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '更新人',
  `UPDATE_TIME` datetime(0) DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '社区活动 ' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cm_activity_apply
-- ----------------------------
INSERT INTO `cm_activity_apply` VALUES (2, 2, 10000001, '1899999999', '0', 'admin', '2020-02-15 19:01:29', 'admin', '2020-02-15 13:40:42');
INSERT INTO `cm_activity_apply` VALUES (4, 1, 10000001, '18900080008', '1', 'admin', '2020-02-15 21:07:30', 'admin', '2020-02-15 21:07:36');
INSERT INTO `cm_activity_apply` VALUES (5, 1, 10000001, '18900080008', '0', 'admin', '2020-02-15 21:07:51', 'admin', '2020-02-15 21:07:54');
INSERT INTO `cm_activity_apply` VALUES (6, 2, 10000001, '18506678909', '0', 'admin', '2020-02-15 13:22:30', 'admin', '2020-02-15 13:22:30');
INSERT INTO `cm_activity_apply` VALUES (7, 2, 10000001, '1222212121', '0', 'admin', '2020-02-15 13:23:01', 'admin', '2020-02-15 13:23:01');
INSERT INTO `cm_activity_apply` VALUES (8, 3, 10000001, '18900009999', '0', 'community2', '2020-02-21 18:48:59', 'community2', '2020-02-21 18:48:59');

-- ----------------------------
-- Table structure for cm_business_guide
-- ----------------------------
DROP TABLE IF EXISTS `cm_business_guide`;
CREATE TABLE `cm_business_guide`  (
  `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '办事指南ID',
  `TITLE` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '指南标题',
  `CONTENT` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci COMMENT '指南内容',
  `COMMUNITY_ID` int(11) DEFAULT NULL COMMENT '所属社区',
  `STATUS` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '状态 状态 0-正常，1-关闭',
  `CREATE_BY` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '创建人',
  `CREATE_TIME` datetime(0) DEFAULT NULL COMMENT '创建时间',
  `UPDATE_BY` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '更新人',
  `UPDATE_TIME` datetime(0) DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '办事指南 ' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cm_business_guide
-- ----------------------------
INSERT INTO `cm_business_guide` VALUES (1, '乘坐电梯规范', '<p>乘坐电梯规范<img src=\"http://localhost/profile/upload/2020/02/15/af63a7a83a4acd530f015be70a64539a.png\" data-filename=\"/profile/upload/2020/02/15/af63a7a83a4acd530f015be70a64539a.png\" style=\"width: 500px;\"></p><p><br></p><p><img style=\"width: 600px;\" src=\"http://localhost/profile/upload/2020/02/15/1d5d079c6304d571fe8e088af83cb8eb.jpg\" data-filename=\"/profile/upload/2020/02/15/1d5d079c6304d571fe8e088af83cb8eb.jpg\"><br></p><p><br></p>', 2, '0', 'admin', '2020-02-15 14:35:14', 'admin', '2020-02-16 05:58:10');
INSERT INTO `cm_business_guide` VALUES (2, 'hello', '<p>hello</p><p><img src=\"http://localhost/profile/upload/2020/02/16/1f28f43cd6ad2605d304b858489803d0.jpg\" data-filename=\"/profile/upload/2020/02/16/1f28f43cd6ad2605d304b858489803d0.jpg\" style=\"width: 800px;\"><br></p>', 1, '0', 'admin', '2020-02-16 06:06:55', 'admin', '2020-02-16 06:07:01');
INSERT INTO `cm_business_guide` VALUES (3, 'qqqq', '<p>qqqqqq</p>', 1, '0', 'admin', '2020-02-16 06:07:24', 'admin', '2020-02-16 06:08:39');
INSERT INTO `cm_business_guide` VALUES (4, 'sdfsdfsd', '<p>fsdfsdfsd</p>', 1, '0', 'admin', '2020-02-16 06:08:47', 'admin', '2020-02-16 06:08:47');
INSERT INTO `cm_business_guide` VALUES (5, 'community12211212221', '<p>community12211212221dd&nbsp; &nbsp;ddddd<br></p>', 12, '0', 'community2', '2020-02-21 22:22:37', 'community2', '2020-02-21 22:22:45');

-- ----------------------------
-- Table structure for cm_client_user
-- ----------------------------
DROP TABLE IF EXISTS `cm_client_user`;
CREATE TABLE `cm_client_user`  (
  `USER_ID` bigint(20) NOT NULL COMMENT '用户ID',
  `NIKE_NAME` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '用户昵称',
  `USER_CURRENT_POINTS` bigint(20) DEFAULT NULL COMMENT '用户当前积分',
  `USER_ACC_POINTS` bigint(20) DEFAULT NULL COMMENT '用户累计积分',
  `USER_USED_POINTS` bigint(20) DEFAULT NULL COMMENT '用户已用积分',
  `USER_NAME` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '姓名',
  `USER_MOBILE` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '手机号',
  `gender` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '2' COMMENT '0-女，1-男，2-未知',
  `PASSWORD` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '密码 MD5',
  `REGISTER_TIME` datetime(0) DEFAULT NULL COMMENT '注册时间',
  `LAST_LOGIN_TIME` datetime(0) DEFAULT NULL COMMENT '最近登陆时间',
  `STATUS` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '状态 状态 0-正常，1-关闭',
  `CREATED_BY` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '创建人',
  `CREATED_TIME` datetime(0) DEFAULT NULL COMMENT '创建时间',
  `UPDATED_BY` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '更新人',
  `UPDATED_TIME` datetime(0) DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`USER_ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户会员表 community memeber' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cm_client_user
-- ----------------------------
INSERT INTO `cm_client_user` VALUES (1234444, 'hant', 100, 100, 10, 'hanjietao', '18978789090', '1', '123456', '2020-02-18 15:27:59', '2020-02-18 15:28:03', '0', 'admin', '2020-02-18 15:28:15', 'admin', '2020-02-18 15:28:25');

-- ----------------------------
-- Table structure for cm_community
-- ----------------------------
DROP TABLE IF EXISTS `cm_community`;
CREATE TABLE `cm_community`  (
  `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '社区ID',
  `COMMUNITY_CODE` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '社区编码',
  `COMMUNITY_NAME` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '社区名称',
  `AREA_ID` int(11) DEFAULT NULL COMMENT '社区所属区域ID',
  `INTRODUCTION` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci COMMENT '社区介绍',
  `STATUS` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '状态 0-正常，1-关闭（取消预约）',
  `CREATE_BY` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '创建人',
  `CREATE_TIME` datetime(0) DEFAULT NULL COMMENT '创建时间',
  `UPDATE_BY` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '更新人',
  `UPDATE_TIME` datetime(0) DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '社区 ' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cm_community
-- ----------------------------
INSERT INTO `cm_community` VALUES (1, 'sybk_beautiful', '沙依巴克区花园社区', 3, 'fsfdfsfdfdssdf13213123sfdafdsfafd', '0', 'admin', '2020-02-14 13:28:22', 'hant', '2020-02-20 23:48:36');
INSERT INTO `cm_community` VALUES (2, '1001001', '幸福社区【沙依巴克区】', 4, '幸福社区', '0', 'admin', '2020-02-14 14:51:50', 'admin', '2020-02-21 11:24:34');
INSERT INTO `cm_community` VALUES (3, NULL, 'test2社区', 3, '这是一个社区！', '0', 'admin', '2020-02-21 15:54:17', 'admin', '2020-02-21 15:54:17');
INSERT INTO `cm_community` VALUES (4, NULL, 'test2社区', 3, '这是一个社区！', '0', 'admin', '2020-02-21 15:56:10', 'admin', '2020-02-21 15:56:10');
INSERT INTO `cm_community` VALUES (5, NULL, 'test2社区', 3, '这是一个社区！', '0', 'admin', '2020-02-21 16:01:08', 'admin', '2020-02-21 16:01:08');
INSERT INTO `cm_community` VALUES (6, NULL, 'test2社区', 3, '这是一个社区！', '0', 'admin', '2020-02-21 16:05:03', 'admin', '2020-02-21 16:05:03');
INSERT INTO `cm_community` VALUES (7, NULL, 'test2社区', 3, '这是一个社区！', '0', 'admin', '2020-02-21 16:07:03', 'admin', '2020-02-21 16:07:03');
INSERT INTO `cm_community` VALUES (8, NULL, 'ctest3社区', 3, '这是一个社区！', '0', 'admin', '2020-02-21 16:10:40', 'admin', '2020-02-21 16:10:40');
INSERT INTO `cm_community` VALUES (9, NULL, 'ctest5社区', 3, '这是一个社区！', '0', 'admin', '2020-02-21 16:42:15', 'admin', '2020-02-21 16:42:15');
INSERT INTO `cm_community` VALUES (10, '10', 'ctest6社区1  admin modify', 3, '这是一个社区！', '0', 'admin', '2020-02-21 16:48:22', 'admin', '2020-02-21 17:31:48');
INSERT INTO `cm_community` VALUES (11, '11', 'community1社区', 3, '这是一个社区！', '0', 'admin', '2020-02-21 18:01:58', 'admin', '2020-02-21 18:01:58');
INSERT INTO `cm_community` VALUES (12, '12', 'community2', 4, '这是一个社区！22222', '0', 'admin', '2020-02-21 18:02:45', 'admin', '2020-02-21 18:19:13');

-- ----------------------------
-- Table structure for cm_note
-- ----------------------------
DROP TABLE IF EXISTS `cm_note`;
CREATE TABLE `cm_note`  (
  `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '留言ID',
  `CONTENT` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci COMMENT '留言内容',
  `USER_ID` bigint(20) DEFAULT NULL COMMENT '用户id',
  `COMMUNITY_ID` int(11) DEFAULT NULL COMMENT '所属社区',
  `STATUS` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '状态 状态 状态 0-正常，1-关闭',
  `CREATE_BY` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '创建人',
  `CREATE_TIME` datetime(0) DEFAULT NULL COMMENT '创建时间',
  `UPDATE_BY` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '更新人',
  `UPDATE_TIME` datetime(0) DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户留言社区 ' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cm_note
-- ----------------------------
INSERT INTO `cm_note` VALUES (2, 'DDDDSSSSDDDDF111DDD', 10000001, 1, '0', 'admin', '2020-02-16 12:39:25', 'admin', '2020-02-16 13:01:53');
INSERT INTO `cm_note` VALUES (3, 'hahahahahahah', 10000001, 2, '0', 'admin', '2020-02-20 21:15:26', 'admin', '2020-02-20 21:15:43');

-- ----------------------------
-- Table structure for csc_area
-- ----------------------------
DROP TABLE IF EXISTS `csc_area`;
CREATE TABLE `csc_area`  (
  `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '区域ID 区域管理ID',
  `AREA_CODE` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '区域Code：沙区-sybk',
  `AREA_NAME` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '区域名称 例如：沙依巴克区',
  `COORDINATE` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '经纬度',
  `STATUS` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '0' COMMENT '状态 0-正常，1-关闭',
  `UPDATE_BY` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '更新人',
  `UPDATE_TIME` datetime(0) DEFAULT NULL COMMENT '更新时间',
  `CREATE_BY` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '创建人',
  `CREATE_TIME` datetime(0) DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '社区服务服务中心-区域设置' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of csc_area
-- ----------------------------
INSERT INTO `csc_area` VALUES (3, 'sybk', '沙依巴克区', '87.59788,43.80118', '0', 'admin', '2020-02-06 07:44:43', 'admin', '2020-02-06 07:44:43');
INSERT INTO `csc_area` VALUES (4, 'ts', '天山区', '87.65990,43.78007', '1', 'admin', '2020-02-10 14:35:49', 'admin', '2020-02-06 07:46:29');
INSERT INTO `csc_area` VALUES (5, 'md', '米东区', '10,90877,89.09987', '0', 'admin', '2020-02-20 11:11:12', 'admin', '2020-02-20 11:11:12');

-- ----------------------------
-- Table structure for fp_loop_image
-- ----------------------------
DROP TABLE IF EXISTS `fp_loop_image`;
CREATE TABLE `fp_loop_image`  (
  `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `title` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '广告标题',
  `image_url` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '轮播图片url',
  `STATUS` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '状态 状态 状态 0-正常，1-关闭',
  `SORT` int(11) DEFAULT 0 COMMENT '排序，越大排在前面',
  `CREATE_BY` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '创建人',
  `CREATE_TIME` datetime(0) DEFAULT NULL COMMENT '创建时间',
  `UPDATE_BY` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '更新人',
  `UPDATE_TIME` datetime(0) DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '首页轮播图 ' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of fp_loop_image
-- ----------------------------
INSERT INTO `fp_loop_image` VALUES (1, '1212', '/profile/loopImage/2020/02/18/dfa5fb8c7241c8d3700a6e440cc29060.png', '0', 1221, 'admin', '2020-02-18 14:22:39', 'admin', '2020-02-18 14:22:39');
INSERT INTO `fp_loop_image` VALUES (2, '123112321', '/profile/loopImage/2020/02/20/c9738e1ea0082a57c4c709665f02ca77.png', '0', 12313, 'admin', '2020-02-18 14:25:15', 'admin', '2020-02-20 13:21:45');

-- ----------------------------
-- Table structure for gen_table
-- ----------------------------
DROP TABLE IF EXISTS `gen_table`;
CREATE TABLE `gen_table`  (
  `table_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '表名称',
  `table_comment` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '表描述',
  `class_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '实体类名称',
  `tpl_category` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT 'crud' COMMENT '使用的模板（crud单表操作 tree树表操作）',
  `package_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '生成包路径',
  `module_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '生成模块名',
  `business_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '生成业务名',
  `function_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '生成功能名',
  `function_author` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '生成功能作者',
  `options` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '其它生成选项',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`table_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '代码生成业务表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of gen_table
-- ----------------------------
INSERT INTO `gen_table` VALUES (1, 'csc_hospital', '社区服务服务中心-医院介绍 ', 'CscHospital', 'crud', 'com.pepper.project.system', 'system', 'hospital', '社区服务服务中心-医院介绍 ', 'pepper', NULL, 'admin', '2020-02-06 13:21:52', '', NULL, NULL);

-- ----------------------------
-- Table structure for gen_table_column
-- ----------------------------
DROP TABLE IF EXISTS `gen_table_column`;
CREATE TABLE `gen_table_column`  (
  `column_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '归属表编号',
  `column_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '列名称',
  `column_comment` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '列描述',
  `column_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '列类型',
  `java_type` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'JAVA类型',
  `java_field` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'JAVA字段名',
  `is_pk` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '是否主键（1是）',
  `is_increment` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '是否自增（1是）',
  `is_required` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '是否必填（1是）',
  `is_insert` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '是否为插入字段（1是）',
  `is_edit` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '是否编辑字段（1是）',
  `is_list` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '是否列表字段（1是）',
  `is_query` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '是否查询字段（1是）',
  `query_type` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT 'EQ' COMMENT '查询方式（等于、不等于、大于、小于、范围）',
  `html_type` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '显示类型（文本框、文本域、下拉框、复选框、单选框、日期控件）',
  `dict_type` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '字典类型',
  `sort` int(11) DEFAULT NULL COMMENT '排序',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`column_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '代码生成业务表字段' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of gen_table_column
-- ----------------------------
INSERT INTO `gen_table_column` VALUES (1, '1', 'ID', '医院ID', 'int(11)', 'Long', 'id', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2020-02-06 13:21:52', '', NULL);
INSERT INTO `gen_table_column` VALUES (2, '1', 'HOS_NAME', '医院名称', 'varchar(128)', 'String', 'hosName', '0', '0', NULL, '1', '1', '1', '1', 'LIKE', 'input', '', 2, 'admin', '2020-02-06 13:21:52', '', NULL);
INSERT INTO `gen_table_column` VALUES (3, '1', 'HOS_CODE', '医院英文名', 'varchar(64)', 'String', 'hosCode', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2020-02-06 13:21:52', '', NULL);
INSERT INTO `gen_table_column` VALUES (4, '1', 'INTRODUCTION', '医院介绍', 'text', 'String', 'introduction', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 4, 'admin', '2020-02-06 13:21:52', '', NULL);
INSERT INTO `gen_table_column` VALUES (5, '1', 'COMMUNITY_IDS', '服务的社区IDS 社区1，社区2，。。。', 'varchar(32)', 'String', 'communityIds', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 5, 'admin', '2020-02-06 13:21:52', '', NULL);
INSERT INTO `gen_table_column` VALUES (6, '1', 'AREA_ID', '所属区域', 'varchar(32)', 'String', 'areaId', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 6, 'admin', '2020-02-06 13:21:52', '', NULL);
INSERT INTO `gen_table_column` VALUES (7, '1', 'STATUS', '状态 0-正常，1-关闭', 'char(1)', 'String', 'status', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'radio', '', 7, 'admin', '2020-02-06 13:21:52', '', NULL);
INSERT INTO `gen_table_column` VALUES (8, '1', 'CREATE_BY', '创建人', 'varchar(32)', 'String', 'createBy', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 8, 'admin', '2020-02-06 13:21:52', '', NULL);
INSERT INTO `gen_table_column` VALUES (9, '1', 'CREATE_TIME', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'datetime', '', 9, 'admin', '2020-02-06 13:21:52', '', NULL);
INSERT INTO `gen_table_column` VALUES (10, '1', 'UPDATE_BY', '更新人', 'varchar(32)', 'String', 'updateBy', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 10, 'admin', '2020-02-06 13:21:52', '', NULL);
INSERT INTO `gen_table_column` VALUES (11, '1', 'UPDATE_TIME', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'datetime', '', 11, 'admin', '2020-02-06 13:21:52', '', NULL);

-- ----------------------------
-- Table structure for he_article
-- ----------------------------
DROP TABLE IF EXISTS `he_article`;
CREATE TABLE `he_article`  (
  `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `BOARD_ID` int(11) DEFAULT NULL COMMENT '板块编码',
  `TITLE` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '文章标题',
  `CONTENT` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci COMMENT '文章内容',
  `WATCH_COUNT` int(11) DEFAULT NULL COMMENT '观看数',
  `STATUS` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '状态 状态 状态 0-正常，1-关闭',
  `CREATE_BY` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '创建人',
  `CREATE_TIME` datetime(0) DEFAULT NULL COMMENT '创建时间',
  `UPDATE_BY` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '更新人',
  `UPDATE_TIME` datetime(0) DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '健康宣教宣教文章 ' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of he_article
-- ----------------------------
INSERT INTO `he_article` VALUES (1, 1, '111', '犯得上反对撒犯得上发射点', NULL, '0', 'admin', '2020-02-17 07:42:35', 'admin', '2020-02-18 08:38:03');
INSERT INTO `he_article` VALUES (2, 2, '2222', '<p>撒犯得上发射点<img src=\"http://localhost/profile/upload/2020/02/17/f4c45ebd265172ee79d18a6eafd6ef80.png\" data-filename=\"/profile/upload/2020/02/17/f4c45ebd265172ee79d18a6eafd6ef80.png\" style=\"width: 500px;\"></p>', NULL, '0', 'admin', '2020-02-17 07:48:03', 'admin', '2020-02-17 09:24:04');

-- ----------------------------
-- Table structure for he_board
-- ----------------------------
DROP TABLE IF EXISTS `he_board`;
CREATE TABLE `he_board`  (
  `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `BOARD_CODE` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '板块编码',
  `BOARD_NAME` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '板块名称',
  `STATUS` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '状态 状态 状态 0-正常，1-关闭',
  `CREATE_BY` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '创建人',
  `CREATE_TIME` datetime(0) DEFAULT NULL COMMENT '创建时间',
  `UPDATE_BY` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '更新人',
  `UPDATE_TIME` datetime(0) DEFAULT NULL COMMENT '更新时间',
  `SORT` int(11) DEFAULT 0 COMMENT '排序，越大排在前面',
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '健康宣教板块 ' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of he_board
-- ----------------------------
INSERT INTO `he_board` VALUES (1, '10001', '食品安全', '0', 'admin', '2020-02-17 07:31:26', 'admin', '2020-02-17 07:31:26', 0);
INSERT INTO `he_board` VALUES (2, '10002', '用药健康', '0', 'admin', '2020-02-17 07:33:24', 'admin', '2020-02-17 07:33:24', 0);
INSERT INTO `he_board` VALUES (3, '10003', '儿童健康', '0', 'admin', '2020-02-17 07:33:34', 'admin', '2020-02-17 07:33:34', 0);
INSERT INTO `he_board` VALUES (4, '10004', '常见病护理', '0', 'admin', '2020-02-17 07:33:51', 'admin', '2020-02-17 07:33:51', 0);
INSERT INTO `he_board` VALUES (7, '10004', '常见病护理', '0', 'admin', '2020-02-18 08:50:11', 'admin', '2020-02-18 08:50:11', 110);

-- ----------------------------
-- Table structure for he_video
-- ----------------------------
DROP TABLE IF EXISTS `he_video`;
CREATE TABLE `he_video`  (
  `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `BOARD_ID` int(11) DEFAULT NULL COMMENT '板块编码',
  `TITLE` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '视频标题',
  `VIDEO_URL` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '视频地址',
  `WATCH_COUNT` int(11) DEFAULT NULL COMMENT '观看数',
  `STATUS` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '状态 状态 状态 0-正常，1-关闭',
  `CREATE_BY` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '创建人',
  `CREATE_TIME` datetime(0) DEFAULT NULL COMMENT '创建时间',
  `UPDATE_BY` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '更新人',
  `UPDATE_TIME` datetime(0) DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '健康宣教宣教视频 ' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of he_video
-- ----------------------------
INSERT INTO `he_video` VALUES (6, 1, '12千千万万', '/profile/healthVideo/2020/02/18/d508e786eb929da75d783b57fb3c655d.mp4', 0, '0', 'admin', '2020-02-17 13:08:15', 'admin', '2020-02-18 04:31:47');
INSERT INTO `he_video` VALUES (9, 1, '食品安全要注意-关注家人健康', '/profile/healthVideo/2020/02/18/f5ff18da716b0ca8ba71c85f36de550b.mp4', 0, '0', 'admin', '2020-02-18 04:31:11', 'admin', '2020-02-18 05:26:49');
INSERT INTO `he_video` VALUES (10, 3, '12121212', '/profile/healthEducation/2020/02/18/95ca7b443ecb720632d299104307a3e1.mp4', 0, '0', 'admin', '2020-02-18 08:55:49', 'admin', '2020-02-18 08:56:04');

-- ----------------------------
-- Table structure for pm_activity
-- ----------------------------
DROP TABLE IF EXISTS `pm_activity`;
CREATE TABLE `pm_activity`  (
  `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '活动ID',
  `PROPERTY_ID` int(11) DEFAULT NULL COMMENT '物业',
  `TITLE` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '活动标题',
  `CONTENT` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci COMMENT '活动内容',
  `STATUS` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '状态 0-正常，1-关闭',
  `CREATE_BY` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '创建人',
  `CREATE_TIME` datetime(0) DEFAULT NULL COMMENT '创建时间',
  `UPDATE_BY` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '更新人',
  `UPDATE_TIME` datetime(0) DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '物业活动 ' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pm_activity
-- ----------------------------
INSERT INTO `pm_activity` VALUES (1, 1, '鼎盛物业  缴费优惠活动', '<p>3年连续缴存 ，8折</p>', '0', 'admin', '2020-02-17 03:47:34', 'admin', '2020-02-17 03:47:34');
INSERT INTO `pm_activity` VALUES (2, 4, 'property1 物业的大活动那个', '<p>property1 物业的大活动那个<br></p>', '0', 'property1', '2020-02-21 20:40:27', 'property1', '2020-02-21 20:40:27');

-- ----------------------------
-- Table structure for pm_activity_apply
-- ----------------------------
DROP TABLE IF EXISTS `pm_activity_apply`;
CREATE TABLE `pm_activity_apply`  (
  `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '活动ID',
  `activity_id` int(11) DEFAULT NULL COMMENT '活动id',
  `USER_ID` bigint(20) DEFAULT NULL COMMENT '用户id',
  `USER_MOBILE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '用户手机号，参加活动用',
  `STATUS` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '状态 0-正常，1-关闭',
  `CREATE_BY` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '创建人',
  `CREATE_TIME` datetime(0) DEFAULT NULL COMMENT '创建时间',
  `UPDATE_BY` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '更新人',
  `UPDATE_TIME` datetime(0) DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '物业活动报名 ' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pm_activity_apply
-- ----------------------------
INSERT INTO `pm_activity_apply` VALUES (1, 2, 10000001, '14567890987', '0', 'property1', '2020-02-21 21:14:47', 'property1', '2020-02-21 21:14:47');
INSERT INTO `pm_activity_apply` VALUES (2, 1, 10000001, '2132423423', '0', 'admin', '2020-02-21 21:15:57', 'admin', '2020-02-21 21:15:57');
INSERT INTO `pm_activity_apply` VALUES (3, 1, 10000001, '1231232423', '0', 'admin', '2020-02-21 21:16:06', 'admin', '2020-02-21 21:16:06');

-- ----------------------------
-- Table structure for pm_business_guide
-- ----------------------------
DROP TABLE IF EXISTS `pm_business_guide`;
CREATE TABLE `pm_business_guide`  (
  `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '办事指南ID',
  `TITLE` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '指南标题',
  `CONTENT` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci COMMENT '指南内容',
  `PROPERTY_ID` int(11) DEFAULT NULL COMMENT '所属物业',
  `STATUS` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '状态 状态 0-正常，1-关闭',
  `CREATE_BY` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '创建人',
  `CREATE_TIME` datetime(0) DEFAULT NULL COMMENT '创建时间',
  `UPDATE_BY` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '更新人',
  `UPDATE_TIME` datetime(0) DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '办事指南 ' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pm_business_guide
-- ----------------------------
INSERT INTO `pm_business_guide` VALUES (1, '11111', '<p>11111</p>', 1, '0', 'admin', '2020-02-17 03:41:51', 'admin', '2020-02-17 03:46:41');
INSERT INTO `pm_business_guide` VALUES (2, '121221212112212111111111', '<p>1221122121212123ewweewew</p>', 4, '0', 'property1', '2020-02-21 22:09:01', 'property1', '2020-02-21 22:09:18');

-- ----------------------------
-- Table structure for pm_note
-- ----------------------------
DROP TABLE IF EXISTS `pm_note`;
CREATE TABLE `pm_note`  (
  `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '留言ID',
  `CONTENT` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci COMMENT '留言内容',
  `USER_ID` bigint(20) DEFAULT NULL COMMENT '用户id',
  `PROPERTY_ID` int(11) DEFAULT NULL COMMENT '所属物业',
  `STATUS` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '状态 状态 状态 0-正常，1-关闭',
  `CREATE_BY` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '创建人',
  `CREATE_TIME` datetime(0) DEFAULT NULL COMMENT '创建时间',
  `UPDATE_BY` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '更新人',
  `UPDATE_TIME` datetime(0) DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户留言物业 ' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pm_note
-- ----------------------------
INSERT INTO `pm_note` VALUES (1, '123456678899', 10000001, 1, '0', 'admin', '2020-02-17 03:43:19', 'admin', '2020-02-17 03:46:31');
INSERT INTO `pm_note` VALUES (2, '11111111', 10000001, 4, '0', 'property1', '2020-02-21 21:43:08', 'property1', '2020-02-21 21:45:24');

-- ----------------------------
-- Table structure for pm_notice
-- ----------------------------
DROP TABLE IF EXISTS `pm_notice`;
CREATE TABLE `pm_notice`  (
  `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `TITLE` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '通知内容',
  `CONTENT` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci COMMENT '通知内容',
  `PROPERTY_ID` int(11) DEFAULT NULL COMMENT '物业id',
  `STATUS` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '状态 状态 状态 0-正常，1-关闭',
  `CREATE_BY` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '创建人',
  `CREATE_TIME` datetime(0) DEFAULT NULL COMMENT '创建时间',
  `UPDATE_BY` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '更新人',
  `UPDATE_TIME` datetime(0) DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '物业通知 ' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pm_notice
-- ----------------------------
INSERT INTO `pm_notice` VALUES (1, '9999', '999990000', 1, '0', 'admin', '2020-02-17 05:26:23', 'admin', '2020-02-17 05:31:19');
INSERT INTO `pm_notice` VALUES (2, '111222122  property1', '111222122  property12323232', 4, '0', 'property1', '2020-02-21 21:32:55', 'property1', '2020-02-21 21:35:26');

-- ----------------------------
-- Table structure for pm_property
-- ----------------------------
DROP TABLE IF EXISTS `pm_property`;
CREATE TABLE `pm_property`  (
  `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '社区ID',
  `PROPERTY_CODE` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '社区编码',
  `PROPERTY_NAME` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '社区名称',
  `AREA_ID` int(11) DEFAULT NULL COMMENT '社区所属区域ID',
  `INTRODUCTION` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci COMMENT '社区介绍',
  `STATUS` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '状态 0-正常，1-关闭（取消预约）',
  `CREATE_BY` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '创建人',
  `CREATE_TIME` datetime(0) DEFAULT NULL COMMENT '创建时间',
  `UPDATE_BY` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '更新人',
  `UPDATE_TIME` datetime(0) DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '物业 ' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pm_property
-- ----------------------------
INSERT INTO `pm_property` VALUES (1, '100292', '天山区  鼎盛物业管理', 3, '<p>大幅降低司法局四点顶顶顶顶</p>', '0', 'admin', '2020-02-17 03:31:40', 'admin', '2020-02-17 03:52:35');
INSERT INTO `pm_property` VALUES (2, '100984', '天山区时代物业', 4, '<p>10093293838432</p>', '0', 'admin', '2020-02-17 05:33:33', 'admin', '2020-02-17 05:33:33');
INSERT INTO `pm_property` VALUES (3, NULL, 'ptest3物业', 3, '这是一个物业！', '0', 'admin', '2020-02-21 16:26:59', 'admin', '2020-02-21 16:26:59');
INSERT INTO `pm_property` VALUES (4, '4', 'property1物业', 4, '这是一个物业！', '0', 'admin', '2020-02-21 18:06:15', 'property1', '2020-02-21 21:19:15');
INSERT INTO `pm_property` VALUES (5, '5', 'property2wuye', 4, '这是一个物业！', '0', 'admin', '2020-02-21 18:06:49', 'admin', '2020-02-21 18:06:49');

-- ----------------------------
-- Table structure for qrtz_blob_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_blob_triggers`;
CREATE TABLE `qrtz_blob_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `trigger_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `blob_data` blob,
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `QRTZ_BLOB_TRIGGERS_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for qrtz_calendars
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_calendars`;
CREATE TABLE `qrtz_calendars`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `calendar_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `calendar` blob NOT NULL,
  PRIMARY KEY (`sched_name`, `calendar_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for qrtz_cron_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_cron_triggers`;
CREATE TABLE `qrtz_cron_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `trigger_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `cron_expression` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `time_zone_id` varchar(80) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `QRTZ_CRON_TRIGGERS_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_cron_triggers
-- ----------------------------
INSERT INTO `qrtz_cron_triggers` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME1', 'DEFAULT', '0/10 * * * * ?', 'Asia/Shanghai');
INSERT INTO `qrtz_cron_triggers` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME2', 'DEFAULT', '0/15 * * * * ?', 'Asia/Shanghai');
INSERT INTO `qrtz_cron_triggers` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME3', 'DEFAULT', '0/20 * * * * ?', 'Asia/Shanghai');

-- ----------------------------
-- Table structure for qrtz_fired_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_fired_triggers`;
CREATE TABLE `qrtz_fired_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `entry_id` varchar(95) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `trigger_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `instance_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `fired_time` bigint(13) NOT NULL,
  `sched_time` bigint(13) NOT NULL,
  `priority` int(11) NOT NULL,
  `state` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `job_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `job_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `is_nonconcurrent` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `requests_recovery` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`sched_name`, `entry_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for qrtz_job_details
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_job_details`;
CREATE TABLE `qrtz_job_details`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `job_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `job_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `description` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `job_class_name` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `is_durable` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `is_nonconcurrent` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `is_update_data` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `requests_recovery` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `job_data` blob,
  PRIMARY KEY (`sched_name`, `job_name`, `job_group`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_job_details
-- ----------------------------
INSERT INTO `qrtz_job_details` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME1', 'DEFAULT', NULL, 'com.pepper.project.monitor.job.util.QuartzDisallowConcurrentExecution', '0', '1', '0', '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000F5441534B5F50524F5045525449455373720029636F6D2E7065707065722E70726F6A6563742E6D6F6E69746F722E6A6F622E646F6D61696E2E4A6F6200000000000000010200084C000A636F6E63757272656E747400124C6A6176612F6C616E672F537472696E673B4C000E63726F6E45787072657373696F6E71007E00094C000C696E766F6B6554617267657471007E00094C00086A6F6247726F757071007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C00076A6F624E616D6571007E00094C000D6D697366697265506F6C69637971007E00094C000673746174757371007E00097872002A636F6D2E7065707065722E6672616D65776F726B2E7765622E646F6D61696E2E42617365456E7469747900000000000000010200074C0008637265617465427971007E00094C000A63726561746554696D657400104C6A6176612F7574696C2F446174653B4C0006706172616D7371007E00034C000672656D61726B71007E00094C000B73656172636856616C756571007E00094C0008757064617465427971007E00094C000A75706461746554696D6571007E000C787074000561646D696E7372000E6A6176612E7574696C2E44617465686A81014B59741903000078707708000001622CDE29E078707400007070707400013174000E302F3130202A202A202A202A203F74001172795461736B2E72794E6F506172616D7374000744454641554C547372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B02000078700000000000000001740018E7B3BBE7BB9FE9BB98E8AEA4EFBC88E697A0E58F82EFBC8974000133740001317800);
INSERT INTO `qrtz_job_details` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME2', 'DEFAULT', NULL, 'com.pepper.project.monitor.job.util.QuartzDisallowConcurrentExecution', '0', '1', '0', '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000F5441534B5F50524F5045525449455373720029636F6D2E7065707065722E70726F6A6563742E6D6F6E69746F722E6A6F622E646F6D61696E2E4A6F6200000000000000010200084C000A636F6E63757272656E747400124C6A6176612F6C616E672F537472696E673B4C000E63726F6E45787072657373696F6E71007E00094C000C696E766F6B6554617267657471007E00094C00086A6F6247726F757071007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C00076A6F624E616D6571007E00094C000D6D697366697265506F6C69637971007E00094C000673746174757371007E00097872002A636F6D2E7065707065722E6672616D65776F726B2E7765622E646F6D61696E2E42617365456E7469747900000000000000010200074C0008637265617465427971007E00094C000A63726561746554696D657400104C6A6176612F7574696C2F446174653B4C0006706172616D7371007E00034C000672656D61726B71007E00094C000B73656172636856616C756571007E00094C0008757064617465427971007E00094C000A75706461746554696D6571007E000C787074000561646D696E7372000E6A6176612E7574696C2E44617465686A81014B59741903000078707708000001622CDE29E078707400007070707400013174000E302F3135202A202A202A202A203F74001572795461736B2E7279506172616D7328277279272974000744454641554C547372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B02000078700000000000000002740018E7B3BBE7BB9FE9BB98E8AEA4EFBC88E69C89E58F82EFBC8974000133740001317800);
INSERT INTO `qrtz_job_details` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME3', 'DEFAULT', NULL, 'com.pepper.project.monitor.job.util.QuartzDisallowConcurrentExecution', '0', '1', '0', '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000F5441534B5F50524F5045525449455373720029636F6D2E7065707065722E70726F6A6563742E6D6F6E69746F722E6A6F622E646F6D61696E2E4A6F6200000000000000010200084C000A636F6E63757272656E747400124C6A6176612F6C616E672F537472696E673B4C000E63726F6E45787072657373696F6E71007E00094C000C696E766F6B6554617267657471007E00094C00086A6F6247726F757071007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C00076A6F624E616D6571007E00094C000D6D697366697265506F6C69637971007E00094C000673746174757371007E00097872002A636F6D2E7065707065722E6672616D65776F726B2E7765622E646F6D61696E2E42617365456E7469747900000000000000010200074C0008637265617465427971007E00094C000A63726561746554696D657400104C6A6176612F7574696C2F446174653B4C0006706172616D7371007E00034C000672656D61726B71007E00094C000B73656172636856616C756571007E00094C0008757064617465427971007E00094C000A75706461746554696D6571007E000C787074000561646D696E7372000E6A6176612E7574696C2E44617465686A81014B59741903000078707708000001622CDE29E078707400007070707400013174000E302F3230202A202A202A202A203F74003872795461736B2E72794D756C7469706C65506172616D7328277279272C20747275652C20323030304C2C203331362E3530442C203130302974000744454641554C547372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B02000078700000000000000003740018E7B3BBE7BB9FE9BB98E8AEA4EFBC88E5A49AE58F82EFBC8974000133740001317800);

-- ----------------------------
-- Table structure for qrtz_locks
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_locks`;
CREATE TABLE `qrtz_locks`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `lock_name` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`sched_name`, `lock_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_locks
-- ----------------------------
INSERT INTO `qrtz_locks` VALUES ('RuoyiScheduler', 'STATE_ACCESS');
INSERT INTO `qrtz_locks` VALUES ('RuoyiScheduler', 'TRIGGER_ACCESS');

-- ----------------------------
-- Table structure for qrtz_paused_trigger_grps
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_paused_trigger_grps`;
CREATE TABLE `qrtz_paused_trigger_grps`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`sched_name`, `trigger_group`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for qrtz_scheduler_state
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_scheduler_state`;
CREATE TABLE `qrtz_scheduler_state`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `instance_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `last_checkin_time` bigint(13) NOT NULL,
  `checkin_interval` bigint(13) NOT NULL,
  PRIMARY KEY (`sched_name`, `instance_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_scheduler_state
-- ----------------------------
INSERT INTO `qrtz_scheduler_state` VALUES ('RuoyiScheduler', 'DESKTOP-QGR3FOO1582436993772', 1582437193246, 15000);

-- ----------------------------
-- Table structure for qrtz_simple_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simple_triggers`;
CREATE TABLE `qrtz_simple_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `trigger_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `repeat_count` bigint(7) NOT NULL,
  `repeat_interval` bigint(12) NOT NULL,
  `times_triggered` bigint(10) NOT NULL,
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `QRTZ_SIMPLE_TRIGGERS_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for qrtz_simprop_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simprop_triggers`;
CREATE TABLE `qrtz_simprop_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `trigger_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `str_prop_1` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `str_prop_2` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `str_prop_3` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `int_prop_1` int(11) DEFAULT NULL,
  `int_prop_2` int(11) DEFAULT NULL,
  `long_prop_1` bigint(20) DEFAULT NULL,
  `long_prop_2` bigint(20) DEFAULT NULL,
  `dec_prop_1` decimal(13, 4) DEFAULT NULL,
  `dec_prop_2` decimal(13, 4) DEFAULT NULL,
  `bool_prop_1` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `bool_prop_2` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `QRTZ_SIMPROP_TRIGGERS_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for qrtz_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_triggers`;
CREATE TABLE `qrtz_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `trigger_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `job_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `job_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `description` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `next_fire_time` bigint(13) DEFAULT NULL,
  `prev_fire_time` bigint(13) DEFAULT NULL,
  `priority` int(11) DEFAULT NULL,
  `trigger_state` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `trigger_type` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `start_time` bigint(13) NOT NULL,
  `end_time` bigint(13) DEFAULT NULL,
  `calendar_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `misfire_instr` smallint(2) DEFAULT NULL,
  `job_data` blob,
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  INDEX `sched_name`(`sched_name`, `job_name`, `job_group`) USING BTREE,
  CONSTRAINT `QRTZ_TRIGGERS_ibfk_1` FOREIGN KEY (`sched_name`, `job_name`, `job_group`) REFERENCES `qrtz_job_details` (`sched_name`, `job_name`, `job_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_triggers
-- ----------------------------
INSERT INTO `qrtz_triggers` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME1', 'DEFAULT', 'TASK_CLASS_NAME1', 'DEFAULT', NULL, 1582437000000, -1, 5, 'PAUSED', 'CRON', 1582436994000, 0, NULL, 2, '');
INSERT INTO `qrtz_triggers` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME2', 'DEFAULT', 'TASK_CLASS_NAME2', 'DEFAULT', NULL, 1582437000000, -1, 5, 'PAUSED', 'CRON', 1582436994000, 0, NULL, 2, '');
INSERT INTO `qrtz_triggers` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME3', 'DEFAULT', 'TASK_CLASS_NAME3', 'DEFAULT', NULL, 1582437000000, -1, 5, 'PAUSED', 'CRON', 1582436994000, 0, NULL, 2, '');

-- ----------------------------
-- Table structure for sm_client_user
-- ----------------------------
DROP TABLE IF EXISTS `sm_client_user`;
CREATE TABLE `sm_client_user`  (
  `USER_ID` bigint(20) NOT NULL COMMENT '用户ID',
  `NIKE_NAME` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '用户昵称',
  `USER_CURRENT_POINTS` bigint(20) DEFAULT NULL COMMENT '用户当前积分',
  `USER_ACC_POINTS` bigint(20) DEFAULT NULL COMMENT '用户累计积分',
  `USER_USED_POINTS` bigint(20) DEFAULT NULL COMMENT '用户已用积分',
  `USER_NAME` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '姓名',
  `USER_MOBILE` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '手机号',
  `gender` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '2' COMMENT '0-女，1-男，2-未知',
  `PASSWORD` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '密码 MD5',
  `REGISTER_TIME` datetime(0) DEFAULT NULL COMMENT '注册时间',
  `LAST_LOGIN_TIME` datetime(0) DEFAULT NULL COMMENT '最近登陆时间',
  `STATUS` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '状态 状态 0-正常，1-关闭',
  `CREATE_BY` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '创建人',
  `CREATE_TIME` datetime(0) DEFAULT NULL COMMENT '创建时间',
  `UPDATE_BY` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '更新人',
  `UPDATE_TIME` datetime(0) DEFAULT NULL COMMENT '更新时间',
  `AVATAR_URL` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '用户头像url',
  `age` int(11) DEFAULT NULL COMMENT '年龄',
  `birthday` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '生日 yyyy-MM-dd',
  PRIMARY KEY (`USER_ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户会员表 system memeber' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sm_client_user
-- ----------------------------
INSERT INTO `sm_client_user` VALUES (10000001, 'hant', 100, 121, 12, 'hanjietao', '18978786767', '0', '123456', '2020-02-18 16:16:00', '2020-02-18 16:16:04', '0', 'admin', '2020-02-18 16:16:11', 'admin', '2020-02-18 16:16:17', '/profile/avatar/2020/02/17/1d3120d56f3e28a7012ff5b05a36bfd7.png', 29, '1991-07-09');

-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config`  (
  `config_id` int(5) NOT NULL AUTO_INCREMENT COMMENT '参数主键',
  `config_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '参数名称',
  `config_key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '参数键名',
  `config_value` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '参数键值',
  `config_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT 'N' COMMENT '系统内置（Y是 N否）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`config_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '参数配置表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_config
-- ----------------------------
INSERT INTO `sys_config` VALUES (1, '主框架页-默认皮肤样式名称', 'sys.index.skinName', 'skin-blue', 'Y', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow');
INSERT INTO `sys_config` VALUES (2, '用户管理-账号初始密码', 'sys.user.initPassword', '123456', 'Y', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '初始化密码 123456');
INSERT INTO `sys_config` VALUES (3, '主框架页-侧边栏主题', 'sys.index.sideTheme', 'theme-dark', 'Y', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '深黑主题theme-dark，浅色主题theme-light，深蓝主题theme-blue');

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept`  (
  `dept_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '部门id',
  `parent_id` bigint(20) DEFAULT 0 COMMENT '父部门id',
  `ancestors` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '祖级列表',
  `dept_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '部门名称',
  `order_num` int(4) DEFAULT 0 COMMENT '显示顺序',
  `leader` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '负责人',
  `phone` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '联系电话',
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '邮箱',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '0' COMMENT '部门状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`dept_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 112 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '部门表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
INSERT INTO `sys_dept` VALUES (100, 0, '0', '社区医院总公司', 0, 'admin', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2018-03-16 11:33:00', 'admin', '2020-02-19 20:25:33');
INSERT INTO `sys_dept` VALUES (101, 100, '0,100', '管理员管理部', 1, 'admin', '15888888888', 'admin@163.com', '0', '0', 'admin', '2018-03-16 11:33:00', 'admin', '2020-02-19 20:25:33');
INSERT INTO `sys_dept` VALUES (102, 100, '0,100', '长沙分公司', 2, '若依', '15888888888', 'ry@qq.com', '0', '2', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00');
INSERT INTO `sys_dept` VALUES (103, 101, '0,100,101', '超级管理员', 1, '若依', '15888888888', 'admin@163.com', '0', '0', 'admin', '2018-03-16 11:33:00', 'admin', '2020-02-19 20:24:56');
INSERT INTO `sys_dept` VALUES (104, 101, '0,100,101', '社区管理员', 2, 'admin', '15888888888', 'admin@163.com', '0', '0', 'admin', '2018-03-16 11:33:00', 'admin', '2020-02-19 20:25:19');
INSERT INTO `sys_dept` VALUES (105, 101, '0,100,101', '测试部门', 3, '若依', '15888888888', 'ry@qq.com', '0', '2', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00');
INSERT INTO `sys_dept` VALUES (106, 101, '0,100,101', '财务部门', 4, '若依', '15888888888', 'ry@qq.com', '0', '2', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00');
INSERT INTO `sys_dept` VALUES (107, 101, '0,100,101', '运维部门', 5, '若依', '15888888888', 'ry@qq.com', '0', '2', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00');
INSERT INTO `sys_dept` VALUES (108, 102, '0,100,102', '市场部门', 1, '若依', '15888888888', 'ry@qq.com', '0', '2', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00');
INSERT INTO `sys_dept` VALUES (109, 102, '0,100,102', '财务部门', 2, '若依', '15888888888', 'ry@qq.com', '0', '2', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00');
INSERT INTO `sys_dept` VALUES (110, 101, '0,100,101', '物业管理员', 3, 'admin', '15888888888', 'admin@163.com', '0', '0', 'admin', '2020-02-19 20:20:23', 'admin', '2020-02-19 20:25:30');
INSERT INTO `sys_dept` VALUES (111, 101, '0,100,101', '医院管理员', 4, 'admin', '15888888888', 'admin@163.com', '0', '0', 'admin', '2020-02-19 20:21:33', 'admin', '2020-02-19 20:25:33');

-- ----------------------------
-- Table structure for sys_dict_data
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_data`;
CREATE TABLE `sys_dict_data`  (
  `dict_code` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '字典编码',
  `dict_sort` int(4) DEFAULT 0 COMMENT '字典排序',
  `dict_label` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '字典标签',
  `dict_value` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '字典键值',
  `dict_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '字典类型',
  `css_class` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '样式属性（其他样式扩展）',
  `list_class` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '表格回显样式',
  `is_default` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT 'N' COMMENT '是否默认（Y是 N否）',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_code`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 37 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '字典数据表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dict_data
-- ----------------------------
INSERT INTO `sys_dict_data` VALUES (1, 1, '男', '0', 'sys_user_sex', '', '', 'Y', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '性别男');
INSERT INTO `sys_dict_data` VALUES (2, 2, '女', '1', 'sys_user_sex', '', '', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '性别女');
INSERT INTO `sys_dict_data` VALUES (3, 3, '未知', '2', 'sys_user_sex', '', '', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '性别未知');
INSERT INTO `sys_dict_data` VALUES (4, 1, '显示', '0', 'sys_show_hide', '', 'primary', 'Y', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '显示菜单');
INSERT INTO `sys_dict_data` VALUES (5, 2, '隐藏', '1', 'sys_show_hide', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '隐藏菜单');
INSERT INTO `sys_dict_data` VALUES (6, 1, '正常', '0', 'sys_normal_disable', '', 'primary', 'Y', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '正常状态');
INSERT INTO `sys_dict_data` VALUES (7, 2, '停用', '1', 'sys_normal_disable', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '停用状态');
INSERT INTO `sys_dict_data` VALUES (8, 1, '正常', '0', 'sys_job_status', '', 'primary', 'Y', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '正常状态');
INSERT INTO `sys_dict_data` VALUES (9, 2, '暂停', '1', 'sys_job_status', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '停用状态');
INSERT INTO `sys_dict_data` VALUES (10, 1, '默认', 'DEFAULT', 'sys_job_group', '', '', 'Y', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '默认分组');
INSERT INTO `sys_dict_data` VALUES (11, 2, '系统', 'SYSTEM', 'sys_job_group', '', '', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '系统分组');
INSERT INTO `sys_dict_data` VALUES (12, 1, '是', 'Y', 'sys_yes_no', '', 'primary', 'Y', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '系统默认是');
INSERT INTO `sys_dict_data` VALUES (13, 2, '否', 'N', 'sys_yes_no', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '系统默认否');
INSERT INTO `sys_dict_data` VALUES (14, 1, '通知', '1', 'sys_notice_type', '', 'warning', 'Y', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '通知');
INSERT INTO `sys_dict_data` VALUES (15, 2, '公告', '2', 'sys_notice_type', '', 'success', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '公告');
INSERT INTO `sys_dict_data` VALUES (16, 1, '正常', '0', 'sys_notice_status', '', 'primary', 'Y', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '正常状态');
INSERT INTO `sys_dict_data` VALUES (17, 2, '关闭', '1', 'sys_notice_status', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '关闭状态');
INSERT INTO `sys_dict_data` VALUES (18, 1, '新增', '1', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '新增操作');
INSERT INTO `sys_dict_data` VALUES (19, 2, '修改', '2', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '修改操作');
INSERT INTO `sys_dict_data` VALUES (20, 3, '删除', '3', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '删除操作');
INSERT INTO `sys_dict_data` VALUES (21, 4, '授权', '4', 'sys_oper_type', '', 'primary', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '授权操作');
INSERT INTO `sys_dict_data` VALUES (22, 5, '导出', '5', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '导出操作');
INSERT INTO `sys_dict_data` VALUES (23, 6, '导入', '6', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '导入操作');
INSERT INTO `sys_dict_data` VALUES (24, 7, '强退', '7', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '强退操作');
INSERT INTO `sys_dict_data` VALUES (25, 8, '生成代码', '8', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '生成操作');
INSERT INTO `sys_dict_data` VALUES (26, 9, '清空数据', '9', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '清空操作');
INSERT INTO `sys_dict_data` VALUES (27, 1, '成功', '0', 'sys_common_status', '', 'primary', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '正常状态');
INSERT INTO `sys_dict_data` VALUES (28, 2, '失败', '1', 'sys_common_status', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '停用状态');
INSERT INTO `sys_dict_data` VALUES (29, 1, '主治医师', '1', 'sys_doctor_type', NULL, NULL, 'Y', '0', 'admin', '2020-02-13 12:49:20', '', NULL, '主治医生');
INSERT INTO `sys_dict_data` VALUES (30, 2, '助理医生', '2', 'sys_doctor_type', NULL, NULL, 'Y', '0', 'admin', '2020-02-13 12:49:59', '', NULL, '助理医生');
INSERT INTO `sys_dict_data` VALUES (31, 3, '实习医生', '3', 'sys_doctor_type', NULL, NULL, 'Y', '0', 'admin', '2020-02-13 12:50:17', '', NULL, '实习医生');
INSERT INTO `sys_dict_data` VALUES (32, 1, '总管理员', '0', 'sys_user_type', '', '', 'Y', '0', 'admin', '2020-02-21 10:10:22', 'admin', '2020-02-21 10:12:59', '超级管理员，社区总管理员，医院总管理员，物业总管理员，都是这个类别');
INSERT INTO `sys_dict_data` VALUES (33, 2, '社区管理员', '1', 'sys_user_type', NULL, NULL, 'Y', '0', 'admin', '2020-02-21 10:10:59', '', NULL, '社区管理员');
INSERT INTO `sys_dict_data` VALUES (34, 3, '医院管理员', '2', 'sys_user_type', NULL, NULL, 'Y', '0', 'admin', '2020-02-21 10:11:42', '', NULL, '医院管理员');
INSERT INTO `sys_dict_data` VALUES (35, 4, '物业管理员', '3', 'sys_user_type', NULL, NULL, 'Y', '0', 'admin', '2020-02-21 10:12:11', '', NULL, '物业管理员');
INSERT INTO `sys_dict_data` VALUES (36, 1001, '客户端用户', '1001', 'sys_user_type', NULL, NULL, 'Y', '0', 'admin', '2020-02-21 10:13:55', '', NULL, '客户端用户，准备使用这个系统参数来保存用户类型');

-- ----------------------------
-- Table structure for sys_dict_type
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_type`;
CREATE TABLE `sys_dict_type`  (
  `dict_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '字典主键',
  `dict_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '字典名称',
  `dict_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '字典类型',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_id`) USING BTREE,
  UNIQUE INDEX `dict_type`(`dict_type`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '字典类型表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dict_type
-- ----------------------------
INSERT INTO `sys_dict_type` VALUES (1, '用户性别', 'sys_user_sex', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '用户性别列表');
INSERT INTO `sys_dict_type` VALUES (2, '菜单状态', 'sys_show_hide', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '菜单状态列表');
INSERT INTO `sys_dict_type` VALUES (3, '系统开关', 'sys_normal_disable', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '系统开关列表');
INSERT INTO `sys_dict_type` VALUES (4, '任务状态', 'sys_job_status', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '任务状态列表');
INSERT INTO `sys_dict_type` VALUES (5, '任务分组', 'sys_job_group', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '任务分组列表');
INSERT INTO `sys_dict_type` VALUES (6, '系统是否', 'sys_yes_no', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '系统是否列表');
INSERT INTO `sys_dict_type` VALUES (7, '通知类型', 'sys_notice_type', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '通知类型列表');
INSERT INTO `sys_dict_type` VALUES (8, '通知状态', 'sys_notice_status', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '通知状态列表');
INSERT INTO `sys_dict_type` VALUES (9, '操作类型', 'sys_oper_type', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '操作类型列表');
INSERT INTO `sys_dict_type` VALUES (10, '系统状态', 'sys_common_status', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '登录状态列表');
INSERT INTO `sys_dict_type` VALUES (11, '医生类型', 'sys_doctor_type', '0', 'admin', '2020-02-13 12:47:40', 'admin', '2020-02-13 12:48:04', '医生类型列表');
INSERT INTO `sys_dict_type` VALUES (12, '系统用户类型', 'sys_user_type', '0', 'admin', '2020-02-21 10:09:20', 'admin', '2020-02-21 10:14:45', '!!!不要删除!!! 0-管理员，1-社区管理员，2-医院管理员，3-物业管理员，10001-客户端用户');

-- ----------------------------
-- Table structure for sys_job
-- ----------------------------
DROP TABLE IF EXISTS `sys_job`;
CREATE TABLE `sys_job`  (
  `job_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务ID',
  `job_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '任务名称',
  `job_group` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'DEFAULT' COMMENT '任务组名',
  `invoke_target` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '调用目标字符串',
  `cron_expression` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT 'cron执行表达式',
  `misfire_policy` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '3' COMMENT '计划执行错误策略（1立即执行 2执行一次 3放弃执行）',
  `concurrent` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '1' COMMENT '是否并发执行（0允许 1禁止）',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '0' COMMENT '状态（0正常 1暂停）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '备注信息',
  PRIMARY KEY (`job_id`, `job_name`, `job_group`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '定时任务调度表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_job
-- ----------------------------
INSERT INTO `sys_job` VALUES (1, '系统默认（无参）', 'DEFAULT', 'ryTask.ryNoParams', '0/10 * * * * ?', '3', '1', '1', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_job` VALUES (2, '系统默认（有参）', 'DEFAULT', 'ryTask.ryParams(\'ry\')', '0/15 * * * * ?', '3', '1', '1', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_job` VALUES (3, '系统默认（多参）', 'DEFAULT', 'ryTask.ryMultipleParams(\'ry\', true, 2000L, 316.50D, 100)', '0/20 * * * * ?', '3', '1', '1', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');

-- ----------------------------
-- Table structure for sys_job_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_job_log`;
CREATE TABLE `sys_job_log`  (
  `job_log_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务日志ID',
  `job_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '任务名称',
  `job_group` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '任务组名',
  `invoke_target` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '调用目标字符串',
  `job_message` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '日志信息',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '0' COMMENT '执行状态（0正常 1失败）',
  `exception_info` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '异常信息',
  `create_time` datetime(0) DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`job_log_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '定时任务调度日志表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sys_logininfor
-- ----------------------------
DROP TABLE IF EXISTS `sys_logininfor`;
CREATE TABLE `sys_logininfor`  (
  `info_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '访问ID',
  `login_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '登录账号',
  `ipaddr` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '登录IP地址',
  `login_location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '登录地点',
  `browser` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '浏览器类型',
  `os` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '操作系统',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '0' COMMENT '登录状态（0成功 1失败）',
  `msg` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '提示消息',
  `login_time` datetime(0) DEFAULT NULL COMMENT '访问时间',
  PRIMARY KEY (`info_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 610 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '系统访问记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_logininfor
-- ----------------------------
INSERT INTO `sys_logininfor` VALUES (100, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-02-02 04:08:05');
INSERT INTO `sys_logininfor` VALUES (101, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-02-02 04:55:56');
INSERT INTO `sys_logininfor` VALUES (102, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-02-02 06:17:26');
INSERT INTO `sys_logininfor` VALUES (103, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-02-02 10:39:05');
INSERT INTO `sys_logininfor` VALUES (104, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-02-02 10:45:10');
INSERT INTO `sys_logininfor` VALUES (105, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2020-02-02 10:51:00');
INSERT INTO `sys_logininfor` VALUES (106, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '验证码错误', '2020-02-02 10:51:04');
INSERT INTO `sys_logininfor` VALUES (107, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-02-02 10:51:07');
INSERT INTO `sys_logininfor` VALUES (108, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2020-02-02 10:52:00');
INSERT INTO `sys_logininfor` VALUES (109, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-02-02 10:57:08');
INSERT INTO `sys_logininfor` VALUES (110, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2020-02-02 10:58:00');
INSERT INTO `sys_logininfor` VALUES (111, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-02-02 11:01:21');
INSERT INTO `sys_logininfor` VALUES (112, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2020-02-02 11:01:39');
INSERT INTO `sys_logininfor` VALUES (113, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-02-02 11:01:43');
INSERT INTO `sys_logininfor` VALUES (114, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2020-02-02 11:02:23');
INSERT INTO `sys_logininfor` VALUES (115, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-02-02 11:02:39');
INSERT INTO `sys_logininfor` VALUES (116, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-02-02 11:29:49');
INSERT INTO `sys_logininfor` VALUES (117, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2020-02-02 11:34:30');
INSERT INTO `sys_logininfor` VALUES (118, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-02-02 11:34:33');
INSERT INTO `sys_logininfor` VALUES (119, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2020-02-02 11:40:13');
INSERT INTO `sys_logininfor` VALUES (120, 'hanjietao', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-02-02 11:40:23');
INSERT INTO `sys_logininfor` VALUES (121, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-02-02 13:11:03');
INSERT INTO `sys_logininfor` VALUES (122, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-02-02 13:27:33');
INSERT INTO `sys_logininfor` VALUES (123, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-02-02 13:30:36');
INSERT INTO `sys_logininfor` VALUES (124, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-02-02 13:40:44');
INSERT INTO `sys_logininfor` VALUES (125, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2020-02-02 13:41:26');
INSERT INTO `sys_logininfor` VALUES (126, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-02-02 13:41:37');
INSERT INTO `sys_logininfor` VALUES (127, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-02-02 13:46:23');
INSERT INTO `sys_logininfor` VALUES (128, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-02-02 13:50:14');
INSERT INTO `sys_logininfor` VALUES (129, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-02-02 14:17:31');
INSERT INTO `sys_logininfor` VALUES (130, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2020-02-02 14:19:01');
INSERT INTO `sys_logininfor` VALUES (131, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-02-02 14:19:10');
INSERT INTO `sys_logininfor` VALUES (132, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2020-02-02 14:21:39');
INSERT INTO `sys_logininfor` VALUES (133, 'hanjietao', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '验证码错误', '2020-02-02 14:21:55');
INSERT INTO `sys_logininfor` VALUES (134, 'hanjietao', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-02-02 14:21:59');
INSERT INTO `sys_logininfor` VALUES (135, 'hanjietao', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2020-02-02 14:22:22');
INSERT INTO `sys_logininfor` VALUES (136, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-02-02 14:22:26');
INSERT INTO `sys_logininfor` VALUES (137, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2020-02-02 14:22:57');
INSERT INTO `sys_logininfor` VALUES (138, 'hanjietao', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-02-02 14:23:27');
INSERT INTO `sys_logininfor` VALUES (139, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '验证码错误', '2020-02-02 14:34:22');
INSERT INTO `sys_logininfor` VALUES (140, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-02-02 14:34:38');
INSERT INTO `sys_logininfor` VALUES (141, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2020-02-02 14:35:07');
INSERT INTO `sys_logininfor` VALUES (142, 'hanjietao', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-02-02 14:35:26');
INSERT INTO `sys_logininfor` VALUES (143, 'hanjietao', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-02-02 14:42:18');
INSERT INTO `sys_logininfor` VALUES (144, 'hanjietao', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2020-02-03 02:24:33');
INSERT INTO `sys_logininfor` VALUES (145, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-02-03 02:24:40');
INSERT INTO `sys_logininfor` VALUES (146, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-02-03 02:31:37');
INSERT INTO `sys_logininfor` VALUES (147, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '验证码错误', '2020-02-05 13:35:04');
INSERT INTO `sys_logininfor` VALUES (148, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-02-05 13:35:07');
INSERT INTO `sys_logininfor` VALUES (149, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-02-05 15:18:18');
INSERT INTO `sys_logininfor` VALUES (150, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2020-02-05 15:18:23');
INSERT INTO `sys_logininfor` VALUES (151, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-02-05 15:19:00');
INSERT INTO `sys_logininfor` VALUES (152, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-02-05 15:35:15');
INSERT INTO `sys_logininfor` VALUES (153, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-02-05 15:40:21');
INSERT INTO `sys_logininfor` VALUES (154, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2020-02-05 15:42:56');
INSERT INTO `sys_logininfor` VALUES (155, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-02-05 15:43:01');
INSERT INTO `sys_logininfor` VALUES (156, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-02-05 15:46:11');
INSERT INTO `sys_logininfor` VALUES (157, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-02-05 15:51:03');
INSERT INTO `sys_logininfor` VALUES (158, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-02-05 15:54:30');
INSERT INTO `sys_logininfor` VALUES (159, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-02-05 15:58:16');
INSERT INTO `sys_logininfor` VALUES (160, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-02-05 16:42:15');
INSERT INTO `sys_logininfor` VALUES (161, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-02-05 16:45:54');
INSERT INTO `sys_logininfor` VALUES (162, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-02-05 16:54:37');
INSERT INTO `sys_logininfor` VALUES (163, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-02-05 17:01:02');
INSERT INTO `sys_logininfor` VALUES (164, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-02-05 17:15:11');
INSERT INTO `sys_logininfor` VALUES (165, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-02-05 17:20:40');
INSERT INTO `sys_logininfor` VALUES (166, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-02-05 17:33:49');
INSERT INTO `sys_logininfor` VALUES (167, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '验证码错误', '2020-02-05 17:39:13');
INSERT INTO `sys_logininfor` VALUES (168, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-02-05 17:39:17');
INSERT INTO `sys_logininfor` VALUES (169, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-02-05 17:43:27');
INSERT INTO `sys_logininfor` VALUES (170, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-02-05 17:47:18');
INSERT INTO `sys_logininfor` VALUES (171, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-02-05 17:48:52');
INSERT INTO `sys_logininfor` VALUES (172, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-02-06 01:35:05');
INSERT INTO `sys_logininfor` VALUES (173, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-02-06 01:37:19');
INSERT INTO `sys_logininfor` VALUES (174, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2020-02-06 01:37:49');
INSERT INTO `sys_logininfor` VALUES (175, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-02-06 01:39:42');
INSERT INTO `sys_logininfor` VALUES (176, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-02-06 01:43:24');
INSERT INTO `sys_logininfor` VALUES (177, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-02-06 01:45:32');
INSERT INTO `sys_logininfor` VALUES (178, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-02-06 02:05:47');
INSERT INTO `sys_logininfor` VALUES (179, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-02-06 02:07:45');
INSERT INTO `sys_logininfor` VALUES (180, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-02-06 02:12:04');
INSERT INTO `sys_logininfor` VALUES (181, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-02-06 02:19:38');
INSERT INTO `sys_logininfor` VALUES (182, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-02-06 02:42:50');
INSERT INTO `sys_logininfor` VALUES (183, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-02-06 02:45:41');
INSERT INTO `sys_logininfor` VALUES (184, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-02-06 02:54:53');
INSERT INTO `sys_logininfor` VALUES (185, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-02-06 03:42:10');
INSERT INTO `sys_logininfor` VALUES (186, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-02-06 03:58:52');
INSERT INTO `sys_logininfor` VALUES (187, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-02-06 04:00:20');
INSERT INTO `sys_logininfor` VALUES (188, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-02-06 04:01:30');
INSERT INTO `sys_logininfor` VALUES (189, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '验证码错误', '2020-02-06 04:10:58');
INSERT INTO `sys_logininfor` VALUES (190, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-02-06 04:11:01');
INSERT INTO `sys_logininfor` VALUES (191, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-02-06 04:12:04');
INSERT INTO `sys_logininfor` VALUES (192, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-02-06 05:35:38');
INSERT INTO `sys_logininfor` VALUES (193, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-02-06 05:44:03');
INSERT INTO `sys_logininfor` VALUES (194, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-02-06 05:53:05');
INSERT INTO `sys_logininfor` VALUES (195, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-02-06 06:01:33');
INSERT INTO `sys_logininfor` VALUES (196, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-02-06 06:14:33');
INSERT INTO `sys_logininfor` VALUES (197, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-02-06 06:16:09');
INSERT INTO `sys_logininfor` VALUES (198, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-02-06 06:25:05');
INSERT INTO `sys_logininfor` VALUES (199, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-02-06 06:30:59');
INSERT INTO `sys_logininfor` VALUES (200, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-02-06 06:32:39');
INSERT INTO `sys_logininfor` VALUES (201, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-02-06 06:37:39');
INSERT INTO `sys_logininfor` VALUES (202, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-02-06 06:40:34');
INSERT INTO `sys_logininfor` VALUES (203, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-02-06 06:47:21');
INSERT INTO `sys_logininfor` VALUES (204, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-02-06 06:58:03');
INSERT INTO `sys_logininfor` VALUES (205, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-02-06 07:00:48');
INSERT INTO `sys_logininfor` VALUES (206, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-02-06 07:02:48');
INSERT INTO `sys_logininfor` VALUES (207, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-02-06 07:05:03');
INSERT INTO `sys_logininfor` VALUES (208, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-02-06 07:07:16');
INSERT INTO `sys_logininfor` VALUES (209, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-02-06 07:08:40');
INSERT INTO `sys_logininfor` VALUES (210, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-02-06 07:09:49');
INSERT INTO `sys_logininfor` VALUES (211, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '验证码错误', '2020-02-06 07:11:05');
INSERT INTO `sys_logininfor` VALUES (212, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-02-06 07:11:09');
INSERT INTO `sys_logininfor` VALUES (213, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-02-06 07:13:29');
INSERT INTO `sys_logininfor` VALUES (214, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-02-06 07:26:56');
INSERT INTO `sys_logininfor` VALUES (215, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-02-06 07:29:03');
INSERT INTO `sys_logininfor` VALUES (216, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-02-06 07:33:48');
INSERT INTO `sys_logininfor` VALUES (217, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-02-06 07:36:00');
INSERT INTO `sys_logininfor` VALUES (218, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-02-06 07:43:22');
INSERT INTO `sys_logininfor` VALUES (219, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-02-06 09:01:51');
INSERT INTO `sys_logininfor` VALUES (220, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '验证码错误', '2020-02-06 09:07:38');
INSERT INTO `sys_logininfor` VALUES (221, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-02-06 09:07:41');
INSERT INTO `sys_logininfor` VALUES (222, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-02-06 09:09:44');
INSERT INTO `sys_logininfor` VALUES (223, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-02-06 09:18:08');
INSERT INTO `sys_logininfor` VALUES (224, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-02-06 09:21:07');
INSERT INTO `sys_logininfor` VALUES (225, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-02-06 12:06:55');
INSERT INTO `sys_logininfor` VALUES (226, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '验证码错误', '2020-02-06 12:18:27');
INSERT INTO `sys_logininfor` VALUES (227, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-02-06 12:18:30');
INSERT INTO `sys_logininfor` VALUES (228, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-02-06 13:02:22');
INSERT INTO `sys_logininfor` VALUES (229, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-02-06 13:11:27');
INSERT INTO `sys_logininfor` VALUES (230, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '验证码错误', '2020-02-10 14:31:55');
INSERT INTO `sys_logininfor` VALUES (231, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '验证码错误', '2020-02-10 14:32:01');
INSERT INTO `sys_logininfor` VALUES (232, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-02-10 14:32:05');
INSERT INTO `sys_logininfor` VALUES (233, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-02-10 15:02:20');
INSERT INTO `sys_logininfor` VALUES (234, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-02-10 15:27:42');
INSERT INTO `sys_logininfor` VALUES (235, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-02-11 04:36:57');
INSERT INTO `sys_logininfor` VALUES (236, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-02-11 04:37:59');
INSERT INTO `sys_logininfor` VALUES (237, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-02-11 04:48:17');
INSERT INTO `sys_logininfor` VALUES (238, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-02-11 05:55:39');
INSERT INTO `sys_logininfor` VALUES (239, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '验证码错误', '2020-02-11 05:58:03');
INSERT INTO `sys_logininfor` VALUES (240, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-02-11 05:58:46');
INSERT INTO `sys_logininfor` VALUES (241, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-02-11 06:15:59');
INSERT INTO `sys_logininfor` VALUES (242, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-02-11 06:17:21');
INSERT INTO `sys_logininfor` VALUES (243, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-02-11 06:25:54');
INSERT INTO `sys_logininfor` VALUES (244, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-02-12 13:10:44');
INSERT INTO `sys_logininfor` VALUES (245, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-02-12 13:11:33');
INSERT INTO `sys_logininfor` VALUES (246, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-02-12 14:03:22');
INSERT INTO `sys_logininfor` VALUES (247, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-02-12 14:14:42');
INSERT INTO `sys_logininfor` VALUES (248, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-02-12 14:17:36');
INSERT INTO `sys_logininfor` VALUES (249, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-02-12 14:22:03');
INSERT INTO `sys_logininfor` VALUES (250, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-02-13 01:54:33');
INSERT INTO `sys_logininfor` VALUES (251, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-02-13 06:57:15');
INSERT INTO `sys_logininfor` VALUES (252, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-02-13 07:33:21');
INSERT INTO `sys_logininfor` VALUES (253, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-02-13 11:47:32');
INSERT INTO `sys_logininfor` VALUES (254, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-02-13 13:58:57');
INSERT INTO `sys_logininfor` VALUES (255, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-02-13 14:00:21');
INSERT INTO `sys_logininfor` VALUES (256, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-02-13 15:12:08');
INSERT INTO `sys_logininfor` VALUES (257, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '验证码错误', '2020-02-14 02:01:20');
INSERT INTO `sys_logininfor` VALUES (258, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-02-14 02:01:25');
INSERT INTO `sys_logininfor` VALUES (259, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-02-14 02:51:54');
INSERT INTO `sys_logininfor` VALUES (260, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-02-14 03:01:46');
INSERT INTO `sys_logininfor` VALUES (261, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-02-14 05:35:46');
INSERT INTO `sys_logininfor` VALUES (262, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-02-14 11:32:46');
INSERT INTO `sys_logininfor` VALUES (263, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-02-14 11:35:29');
INSERT INTO `sys_logininfor` VALUES (264, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-02-14 12:12:35');
INSERT INTO `sys_logininfor` VALUES (265, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-02-14 13:14:12');
INSERT INTO `sys_logininfor` VALUES (266, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-02-14 13:21:10');
INSERT INTO `sys_logininfor` VALUES (267, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-02-14 13:21:54');
INSERT INTO `sys_logininfor` VALUES (268, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-02-14 14:50:51');
INSERT INTO `sys_logininfor` VALUES (269, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-02-14 15:07:01');
INSERT INTO `sys_logininfor` VALUES (270, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-02-15 02:57:27');
INSERT INTO `sys_logininfor` VALUES (271, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-02-15 08:02:03');
INSERT INTO `sys_logininfor` VALUES (272, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-02-15 08:09:59');
INSERT INTO `sys_logininfor` VALUES (273, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-02-15 08:34:40');
INSERT INTO `sys_logininfor` VALUES (274, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-02-15 08:41:58');
INSERT INTO `sys_logininfor` VALUES (275, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-02-15 09:23:35');
INSERT INTO `sys_logininfor` VALUES (276, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-02-15 10:54:59');
INSERT INTO `sys_logininfor` VALUES (277, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-02-15 11:52:46');
INSERT INTO `sys_logininfor` VALUES (278, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-02-15 13:27:58');
INSERT INTO `sys_logininfor` VALUES (279, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-02-15 14:32:18');
INSERT INTO `sys_logininfor` VALUES (280, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2020-02-15 15:19:15');
INSERT INTO `sys_logininfor` VALUES (281, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-02-15 15:19:21');
INSERT INTO `sys_logininfor` VALUES (282, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2020-02-15 15:19:31');
INSERT INTO `sys_logininfor` VALUES (283, 'hanjietao', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-02-15 15:20:15');
INSERT INTO `sys_logininfor` VALUES (284, 'hanjietao', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2020-02-15 15:40:20');
INSERT INTO `sys_logininfor` VALUES (285, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-02-15 15:40:26');
INSERT INTO `sys_logininfor` VALUES (286, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-02-15 16:35:11');
INSERT INTO `sys_logininfor` VALUES (287, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2020-02-15 16:37:58');
INSERT INTO `sys_logininfor` VALUES (288, 'hanjietao1', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '密码输入错误1次', '2020-02-15 16:38:12');
INSERT INTO `sys_logininfor` VALUES (289, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '密码输入错误1次', '2020-02-15 16:38:24');
INSERT INTO `sys_logininfor` VALUES (290, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-02-16 01:57:35');
INSERT INTO `sys_logininfor` VALUES (291, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-02-16 05:53:45');
INSERT INTO `sys_logininfor` VALUES (292, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-02-16 05:57:10');
INSERT INTO `sys_logininfor` VALUES (293, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-02-16 11:37:03');
INSERT INTO `sys_logininfor` VALUES (294, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-02-16 12:34:38');
INSERT INTO `sys_logininfor` VALUES (295, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-02-17 02:52:53');
INSERT INTO `sys_logininfor` VALUES (296, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-02-17 03:11:31');
INSERT INTO `sys_logininfor` VALUES (297, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-02-17 05:19:50');
INSERT INTO `sys_logininfor` VALUES (298, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-02-17 07:27:49');
INSERT INTO `sys_logininfor` VALUES (299, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-02-17 07:31:13');
INSERT INTO `sys_logininfor` VALUES (300, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-02-17 07:42:25');
INSERT INTO `sys_logininfor` VALUES (301, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-02-17 07:44:30');
INSERT INTO `sys_logininfor` VALUES (302, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-02-17 07:45:55');
INSERT INTO `sys_logininfor` VALUES (303, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-02-17 07:57:35');
INSERT INTO `sys_logininfor` VALUES (304, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-02-17 08:34:36');
INSERT INTO `sys_logininfor` VALUES (305, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-02-17 08:36:50');
INSERT INTO `sys_logininfor` VALUES (306, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-02-17 12:39:57');
INSERT INTO `sys_logininfor` VALUES (307, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-02-17 12:46:01');
INSERT INTO `sys_logininfor` VALUES (308, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-02-17 12:53:19');
INSERT INTO `sys_logininfor` VALUES (309, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-02-17 14:31:08');
INSERT INTO `sys_logininfor` VALUES (310, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-02-18 02:29:16');
INSERT INTO `sys_logininfor` VALUES (311, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-02-18 04:19:43');
INSERT INTO `sys_logininfor` VALUES (312, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-02-18 04:21:28');
INSERT INTO `sys_logininfor` VALUES (313, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-02-18 05:26:08');
INSERT INTO `sys_logininfor` VALUES (314, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-02-18 07:21:44');
INSERT INTO `sys_logininfor` VALUES (315, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-02-18 08:12:43');
INSERT INTO `sys_logininfor` VALUES (316, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-02-18 13:03:55');
INSERT INTO `sys_logininfor` VALUES (317, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2020-02-18 16:20:33');
INSERT INTO `sys_logininfor` VALUES (318, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-02-18 16:29:32');
INSERT INTO `sys_logininfor` VALUES (319, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-02-19 17:40:53');
INSERT INTO `sys_logininfor` VALUES (320, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-02-19 20:18:44');
INSERT INTO `sys_logininfor` VALUES (321, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-02-19 21:44:37');
INSERT INTO `sys_logininfor` VALUES (322, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-02-19 21:45:12');
INSERT INTO `sys_logininfor` VALUES (323, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2020-02-19 21:46:31');
INSERT INTO `sys_logininfor` VALUES (324, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '验证码错误', '2020-02-19 21:54:44');
INSERT INTO `sys_logininfor` VALUES (325, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '验证码错误', '2020-02-19 21:54:46');
INSERT INTO `sys_logininfor` VALUES (326, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '验证码错误', '2020-02-19 21:54:46');
INSERT INTO `sys_logininfor` VALUES (327, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-02-19 23:14:19');
INSERT INTO `sys_logininfor` VALUES (328, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-02-19 23:14:59');
INSERT INTO `sys_logininfor` VALUES (329, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2020-02-19 23:15:05');
INSERT INTO `sys_logininfor` VALUES (330, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '验证码错误', '2020-02-19 23:15:25');
INSERT INTO `sys_logininfor` VALUES (331, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-02-19 23:15:28');
INSERT INTO `sys_logininfor` VALUES (332, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-02-20 09:55:37');
INSERT INTO `sys_logininfor` VALUES (333, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '验证码错误', '2020-02-20 10:45:48');
INSERT INTO `sys_logininfor` VALUES (334, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-02-20 10:45:51');
INSERT INTO `sys_logininfor` VALUES (335, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-02-20 11:21:12');
INSERT INTO `sys_logininfor` VALUES (336, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-02-20 11:22:49');
INSERT INTO `sys_logininfor` VALUES (337, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-02-20 11:42:43');
INSERT INTO `sys_logininfor` VALUES (338, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-02-20 11:53:11');
INSERT INTO `sys_logininfor` VALUES (339, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-02-20 12:01:16');
INSERT INTO `sys_logininfor` VALUES (340, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-02-20 13:16:39');
INSERT INTO `sys_logininfor` VALUES (341, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-02-20 13:59:43');
INSERT INTO `sys_logininfor` VALUES (342, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2020-02-20 14:40:03');
INSERT INTO `sys_logininfor` VALUES (343, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-02-20 14:40:08');
INSERT INTO `sys_logininfor` VALUES (344, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2020-02-20 15:23:34');
INSERT INTO `sys_logininfor` VALUES (345, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-02-20 15:23:40');
INSERT INTO `sys_logininfor` VALUES (346, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-02-20 17:01:25');
INSERT INTO `sys_logininfor` VALUES (347, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-02-20 17:24:40');
INSERT INTO `sys_logininfor` VALUES (348, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-02-20 18:12:47');
INSERT INTO `sys_logininfor` VALUES (349, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2020-02-20 19:03:59');
INSERT INTO `sys_logininfor` VALUES (350, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-02-20 19:04:04');
INSERT INTO `sys_logininfor` VALUES (351, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2020-02-20 19:04:23');
INSERT INTO `sys_logininfor` VALUES (352, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-02-20 19:04:28');
INSERT INTO `sys_logininfor` VALUES (353, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2020-02-20 19:04:53');
INSERT INTO `sys_logininfor` VALUES (354, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-02-20 19:04:59');
INSERT INTO `sys_logininfor` VALUES (355, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2020-02-20 19:06:11');
INSERT INTO `sys_logininfor` VALUES (356, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-02-20 19:06:22');
INSERT INTO `sys_logininfor` VALUES (357, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-02-20 20:12:37');
INSERT INTO `sys_logininfor` VALUES (358, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2020-02-20 20:27:58');
INSERT INTO `sys_logininfor` VALUES (359, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-02-20 20:28:01');
INSERT INTO `sys_logininfor` VALUES (360, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2020-02-20 20:28:40');
INSERT INTO `sys_logininfor` VALUES (361, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-02-20 20:28:45');
INSERT INTO `sys_logininfor` VALUES (362, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2020-02-20 20:30:46');
INSERT INTO `sys_logininfor` VALUES (363, 'hant', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-02-20 20:30:57');
INSERT INTO `sys_logininfor` VALUES (364, 'hant', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2020-02-20 20:31:45');
INSERT INTO `sys_logininfor` VALUES (365, 'hant', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-02-20 20:31:55');
INSERT INTO `sys_logininfor` VALUES (366, 'hant', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2020-02-20 20:35:19');
INSERT INTO `sys_logininfor` VALUES (367, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-02-20 20:35:27');
INSERT INTO `sys_logininfor` VALUES (368, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-02-20 20:36:51');
INSERT INTO `sys_logininfor` VALUES (369, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2020-02-20 20:37:25');
INSERT INTO `sys_logininfor` VALUES (370, 'hant', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-02-20 20:37:36');
INSERT INTO `sys_logininfor` VALUES (371, 'hant', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2020-02-20 20:41:59');
INSERT INTO `sys_logininfor` VALUES (372, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-02-20 20:42:05');
INSERT INTO `sys_logininfor` VALUES (373, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2020-02-20 20:42:28');
INSERT INTO `sys_logininfor` VALUES (374, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '验证码错误', '2020-02-20 20:43:13');
INSERT INTO `sys_logininfor` VALUES (375, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-02-20 20:43:21');
INSERT INTO `sys_logininfor` VALUES (376, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2020-02-20 20:43:44');
INSERT INTO `sys_logininfor` VALUES (377, 'hant', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-02-20 20:44:47');
INSERT INTO `sys_logininfor` VALUES (378, 'hant', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2020-02-20 20:47:09');
INSERT INTO `sys_logininfor` VALUES (379, 'hant', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-02-20 20:47:18');
INSERT INTO `sys_logininfor` VALUES (380, 'hant', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2020-02-20 20:57:30');
INSERT INTO `sys_logininfor` VALUES (381, 'hant', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-02-20 20:57:36');
INSERT INTO `sys_logininfor` VALUES (382, 'hant', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2020-02-20 20:57:47');
INSERT INTO `sys_logininfor` VALUES (383, 'hant', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-02-20 20:58:09');
INSERT INTO `sys_logininfor` VALUES (384, 'hant', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2020-02-20 20:59:48');
INSERT INTO `sys_logininfor` VALUES (385, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-02-20 20:59:59');
INSERT INTO `sys_logininfor` VALUES (386, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2020-02-20 21:01:03');
INSERT INTO `sys_logininfor` VALUES (387, 'hant', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-02-20 21:01:07');
INSERT INTO `sys_logininfor` VALUES (388, 'hant', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2020-02-20 21:02:20');
INSERT INTO `sys_logininfor` VALUES (389, 'hant', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-02-20 21:02:27');
INSERT INTO `sys_logininfor` VALUES (390, 'hant', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2020-02-20 21:02:31');
INSERT INTO `sys_logininfor` VALUES (391, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-02-20 21:02:41');
INSERT INTO `sys_logininfor` VALUES (392, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2020-02-20 21:03:16');
INSERT INTO `sys_logininfor` VALUES (393, 'hant', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-02-20 21:03:20');
INSERT INTO `sys_logininfor` VALUES (394, 'hant', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2020-02-20 21:03:26');
INSERT INTO `sys_logininfor` VALUES (395, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-02-20 21:03:36');
INSERT INTO `sys_logininfor` VALUES (396, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2020-02-20 21:04:02');
INSERT INTO `sys_logininfor` VALUES (397, 'hant', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-02-20 21:04:06');
INSERT INTO `sys_logininfor` VALUES (398, 'hant', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2020-02-20 21:04:19');
INSERT INTO `sys_logininfor` VALUES (399, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-02-20 21:04:32');
INSERT INTO `sys_logininfor` VALUES (400, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2020-02-20 21:06:51');
INSERT INTO `sys_logininfor` VALUES (401, 'hant', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-02-20 21:06:56');
INSERT INTO `sys_logininfor` VALUES (402, 'hant', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2020-02-20 21:14:56');
INSERT INTO `sys_logininfor` VALUES (403, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '验证码错误', '2020-02-20 21:15:05');
INSERT INTO `sys_logininfor` VALUES (404, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '验证码错误', '2020-02-20 21:15:08');
INSERT INTO `sys_logininfor` VALUES (405, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-02-20 21:15:11');
INSERT INTO `sys_logininfor` VALUES (406, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2020-02-20 21:16:46');
INSERT INTO `sys_logininfor` VALUES (407, 'hant', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-02-20 21:16:50');
INSERT INTO `sys_logininfor` VALUES (408, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '验证码错误', '2020-02-20 23:12:22');
INSERT INTO `sys_logininfor` VALUES (409, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-02-20 23:12:27');
INSERT INTO `sys_logininfor` VALUES (410, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2020-02-20 23:30:54');
INSERT INTO `sys_logininfor` VALUES (411, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-02-20 23:31:09');
INSERT INTO `sys_logininfor` VALUES (412, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2020-02-20 23:32:03');
INSERT INTO `sys_logininfor` VALUES (413, 'hant', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-02-20 23:32:08');
INSERT INTO `sys_logininfor` VALUES (414, 'hant', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2020-02-20 23:37:14');
INSERT INTO `sys_logininfor` VALUES (415, 'hant', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-02-20 23:37:34');
INSERT INTO `sys_logininfor` VALUES (416, 'hant', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2020-02-20 23:37:46');
INSERT INTO `sys_logininfor` VALUES (417, 'hant', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-02-20 23:37:51');
INSERT INTO `sys_logininfor` VALUES (418, 'hant', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2020-02-20 23:40:00');
INSERT INTO `sys_logininfor` VALUES (419, 'hant', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-02-20 23:40:05');
INSERT INTO `sys_logininfor` VALUES (420, 'hant', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2020-02-20 23:40:09');
INSERT INTO `sys_logininfor` VALUES (421, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '密码输入错误1次', '2020-02-20 23:40:17');
INSERT INTO `sys_logininfor` VALUES (422, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '密码输入错误2次', '2020-02-20 23:40:22');
INSERT INTO `sys_logininfor` VALUES (423, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '密码输入错误3次', '2020-02-20 23:40:26');
INSERT INTO `sys_logininfor` VALUES (424, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '密码输入错误4次', '2020-02-20 23:40:34');
INSERT INTO `sys_logininfor` VALUES (425, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '密码输入错误5次', '2020-02-20 23:40:39');
INSERT INTO `sys_logininfor` VALUES (426, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '密码输入错误5次，帐户锁定10分钟', '2020-02-20 23:40:44');
INSERT INTO `sys_logininfor` VALUES (427, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '密码输入错误5次，帐户锁定10分钟', '2020-02-20 23:41:12');
INSERT INTO `sys_logininfor` VALUES (428, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-02-20 23:46:19');
INSERT INTO `sys_logininfor` VALUES (429, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2020-02-20 23:48:16');
INSERT INTO `sys_logininfor` VALUES (430, 'hant', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-02-20 23:48:21');
INSERT INTO `sys_logininfor` VALUES (431, 'hant', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2020-02-20 23:51:45');
INSERT INTO `sys_logininfor` VALUES (432, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-02-20 23:52:01');
INSERT INTO `sys_logininfor` VALUES (433, 'hant', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-02-21 09:40:15');
INSERT INTO `sys_logininfor` VALUES (434, 'hant', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2020-02-21 09:42:06');
INSERT INTO `sys_logininfor` VALUES (435, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-02-21 09:42:15');
INSERT INTO `sys_logininfor` VALUES (436, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2020-02-21 09:49:54');
INSERT INTO `sys_logininfor` VALUES (437, 'hant', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-02-21 09:50:00');
INSERT INTO `sys_logininfor` VALUES (438, 'hant', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2020-02-21 09:50:31');
INSERT INTO `sys_logininfor` VALUES (439, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-02-21 09:50:42');
INSERT INTO `sys_logininfor` VALUES (440, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2020-02-21 09:57:02');
INSERT INTO `sys_logininfor` VALUES (441, 'client', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-02-21 09:57:13');
INSERT INTO `sys_logininfor` VALUES (442, 'client', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2020-02-21 09:59:57');
INSERT INTO `sys_logininfor` VALUES (443, 'hant', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-02-21 10:00:00');
INSERT INTO `sys_logininfor` VALUES (444, 'hant', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2020-02-21 10:02:00');
INSERT INTO `sys_logininfor` VALUES (445, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-02-21 10:04:57');
INSERT INTO `sys_logininfor` VALUES (446, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2020-02-21 10:19:24');
INSERT INTO `sys_logininfor` VALUES (447, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-02-21 10:19:37');
INSERT INTO `sys_logininfor` VALUES (448, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2020-02-21 10:24:26');
INSERT INTO `sys_logininfor` VALUES (449, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-02-21 10:24:38');
INSERT INTO `sys_logininfor` VALUES (450, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2020-02-21 10:24:52');
INSERT INTO `sys_logininfor` VALUES (451, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-02-21 10:24:59');
INSERT INTO `sys_logininfor` VALUES (452, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2020-02-21 10:25:50');
INSERT INTO `sys_logininfor` VALUES (453, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-02-21 10:25:59');
INSERT INTO `sys_logininfor` VALUES (454, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2020-02-21 10:34:50');
INSERT INTO `sys_logininfor` VALUES (455, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-02-21 10:35:25');
INSERT INTO `sys_logininfor` VALUES (456, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-02-21 10:45:21');
INSERT INTO `sys_logininfor` VALUES (457, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2020-02-21 10:46:24');
INSERT INTO `sys_logininfor` VALUES (458, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-02-21 10:46:29');
INSERT INTO `sys_logininfor` VALUES (459, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2020-02-21 11:15:20');
INSERT INTO `sys_logininfor` VALUES (460, 'hant', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-02-21 11:15:28');
INSERT INTO `sys_logininfor` VALUES (461, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-02-21 11:21:08');
INSERT INTO `sys_logininfor` VALUES (462, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '验证码错误', '2020-02-21 13:07:51');
INSERT INTO `sys_logininfor` VALUES (463, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-02-21 13:07:59');
INSERT INTO `sys_logininfor` VALUES (464, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-02-21 15:53:16');
INSERT INTO `sys_logininfor` VALUES (465, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-02-21 16:04:22');
INSERT INTO `sys_logininfor` VALUES (466, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2020-02-21 16:07:19');
INSERT INTO `sys_logininfor` VALUES (467, 'test2', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-02-21 16:07:24');
INSERT INTO `sys_logininfor` VALUES (468, 'test2', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2020-02-21 16:09:39');
INSERT INTO `sys_logininfor` VALUES (469, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-02-21 16:09:43');
INSERT INTO `sys_logininfor` VALUES (470, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2020-02-21 16:10:44');
INSERT INTO `sys_logininfor` VALUES (471, 'ctest3', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-02-21 16:10:50');
INSERT INTO `sys_logininfor` VALUES (472, 'ctest3', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2020-02-21 16:11:02');
INSERT INTO `sys_logininfor` VALUES (473, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-02-21 16:11:04');
INSERT INTO `sys_logininfor` VALUES (474, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2020-02-21 16:13:13');
INSERT INTO `sys_logininfor` VALUES (475, 'htest3', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-02-21 16:13:18');
INSERT INTO `sys_logininfor` VALUES (476, 'htest3', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-02-21 16:14:04');
INSERT INTO `sys_logininfor` VALUES (477, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-02-21 16:21:46');
INSERT INTO `sys_logininfor` VALUES (478, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2020-02-21 16:22:37');
INSERT INTO `sys_logininfor` VALUES (479, 'htest4', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-02-21 16:22:42');
INSERT INTO `sys_logininfor` VALUES (480, 'htest4', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2020-02-21 16:25:09');
INSERT INTO `sys_logininfor` VALUES (481, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-02-21 16:25:13');
INSERT INTO `sys_logininfor` VALUES (482, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2020-02-21 16:25:38');
INSERT INTO `sys_logininfor` VALUES (483, 'ctest3', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-02-21 16:25:46');
INSERT INTO `sys_logininfor` VALUES (484, 'ctest3', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2020-02-21 16:25:59');
INSERT INTO `sys_logininfor` VALUES (485, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-02-21 16:26:02');
INSERT INTO `sys_logininfor` VALUES (486, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2020-02-21 16:27:03');
INSERT INTO `sys_logininfor` VALUES (487, 'ptest3', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-02-21 16:27:10');
INSERT INTO `sys_logininfor` VALUES (488, 'ptest3', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2020-02-21 16:41:34');
INSERT INTO `sys_logininfor` VALUES (489, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-02-21 16:41:37');
INSERT INTO `sys_logininfor` VALUES (490, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2020-02-21 16:42:21');
INSERT INTO `sys_logininfor` VALUES (491, 'ctest5', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-02-21 16:42:25');
INSERT INTO `sys_logininfor` VALUES (492, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-02-21 16:47:26');
INSERT INTO `sys_logininfor` VALUES (493, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2020-02-21 16:48:31');
INSERT INTO `sys_logininfor` VALUES (494, 'ctest6', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-02-21 16:48:37');
INSERT INTO `sys_logininfor` VALUES (495, 'ctest6', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2020-02-21 16:49:08');
INSERT INTO `sys_logininfor` VALUES (496, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-02-21 16:49:11');
INSERT INTO `sys_logininfor` VALUES (497, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-02-21 17:30:15');
INSERT INTO `sys_logininfor` VALUES (498, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2020-02-21 17:30:25');
INSERT INTO `sys_logininfor` VALUES (499, 'ctest6', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-02-21 17:30:30');
INSERT INTO `sys_logininfor` VALUES (500, 'ctest6', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2020-02-21 17:30:35');
INSERT INTO `sys_logininfor` VALUES (501, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-02-21 17:30:38');
INSERT INTO `sys_logininfor` VALUES (502, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2020-02-21 17:30:52');
INSERT INTO `sys_logininfor` VALUES (503, 'ctest6', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-02-21 17:30:59');
INSERT INTO `sys_logininfor` VALUES (504, 'ctest6', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2020-02-21 17:31:29');
INSERT INTO `sys_logininfor` VALUES (505, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-02-21 17:31:33');
INSERT INTO `sys_logininfor` VALUES (506, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2020-02-21 17:33:54');
INSERT INTO `sys_logininfor` VALUES (507, 'chaoguan', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-02-21 17:33:59');
INSERT INTO `sys_logininfor` VALUES (508, 'chaoguan', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2020-02-21 17:40:31');
INSERT INTO `sys_logininfor` VALUES (509, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-02-21 17:40:36');
INSERT INTO `sys_logininfor` VALUES (510, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2020-02-21 17:44:02');
INSERT INTO `sys_logininfor` VALUES (511, 'chaog1', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-02-21 17:44:10');
INSERT INTO `sys_logininfor` VALUES (512, 'chaog1', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2020-02-21 17:44:20');
INSERT INTO `sys_logininfor` VALUES (513, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-02-21 17:44:25');
INSERT INTO `sys_logininfor` VALUES (514, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '验证码错误', '2020-02-21 17:49:39');
INSERT INTO `sys_logininfor` VALUES (515, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-02-21 17:49:42');
INSERT INTO `sys_logininfor` VALUES (516, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2020-02-21 17:50:26');
INSERT INTO `sys_logininfor` VALUES (517, 'chaoji', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-02-21 17:50:33');
INSERT INTO `sys_logininfor` VALUES (518, 'chaoji', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2020-02-21 17:50:54');
INSERT INTO `sys_logininfor` VALUES (519, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-02-21 17:59:02');
INSERT INTO `sys_logininfor` VALUES (520, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2020-02-21 17:59:17');
INSERT INTO `sys_logininfor` VALUES (521, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-02-21 17:59:58');
INSERT INTO `sys_logininfor` VALUES (522, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2020-02-21 18:09:59');
INSERT INTO `sys_logininfor` VALUES (523, 'property1', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-02-21 18:10:08');
INSERT INTO `sys_logininfor` VALUES (524, 'property1', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2020-02-21 18:18:58');
INSERT INTO `sys_logininfor` VALUES (525, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-02-21 18:19:01');
INSERT INTO `sys_logininfor` VALUES (526, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2020-02-21 18:19:25');
INSERT INTO `sys_logininfor` VALUES (527, 'community2', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-02-21 18:19:34');
INSERT INTO `sys_logininfor` VALUES (528, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-02-21 18:40:57');
INSERT INTO `sys_logininfor` VALUES (529, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2020-02-21 18:42:19');
INSERT INTO `sys_logininfor` VALUES (530, 'community2', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-02-21 18:42:28');
INSERT INTO `sys_logininfor` VALUES (531, 'community2', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2020-02-21 18:43:05');
INSERT INTO `sys_logininfor` VALUES (532, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '验证码错误', '2020-02-21 18:43:08');
INSERT INTO `sys_logininfor` VALUES (533, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-02-21 18:43:11');
INSERT INTO `sys_logininfor` VALUES (534, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2020-02-21 18:43:26');
INSERT INTO `sys_logininfor` VALUES (535, 'community2', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '验证码错误', '2020-02-21 18:43:37');
INSERT INTO `sys_logininfor` VALUES (536, 'community2', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-02-21 18:43:40');
INSERT INTO `sys_logininfor` VALUES (537, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-02-21 19:48:06');
INSERT INTO `sys_logininfor` VALUES (538, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '验证码错误', '2020-02-21 19:48:08');
INSERT INTO `sys_logininfor` VALUES (539, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-02-21 19:50:41');
INSERT INTO `sys_logininfor` VALUES (540, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2020-02-21 19:50:54');
INSERT INTO `sys_logininfor` VALUES (541, 'community2', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-02-21 19:51:05');
INSERT INTO `sys_logininfor` VALUES (542, 'community2', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2020-02-21 20:02:27');
INSERT INTO `sys_logininfor` VALUES (543, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-02-21 20:02:30');
INSERT INTO `sys_logininfor` VALUES (544, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2020-02-21 20:05:21');
INSERT INTO `sys_logininfor` VALUES (545, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-02-21 20:06:06');
INSERT INTO `sys_logininfor` VALUES (546, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2020-02-21 20:06:09');
INSERT INTO `sys_logininfor` VALUES (547, 'community2', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-02-21 20:06:15');
INSERT INTO `sys_logininfor` VALUES (548, 'community2', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2020-02-21 20:06:43');
INSERT INTO `sys_logininfor` VALUES (549, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-02-21 20:06:46');
INSERT INTO `sys_logininfor` VALUES (550, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2020-02-21 20:07:48');
INSERT INTO `sys_logininfor` VALUES (551, 'community2', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-02-21 20:07:55');
INSERT INTO `sys_logininfor` VALUES (552, 'community2', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2020-02-21 20:08:40');
INSERT INTO `sys_logininfor` VALUES (553, 'property1', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-02-21 20:08:52');
INSERT INTO `sys_logininfor` VALUES (554, 'property1', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2020-02-21 20:12:13');
INSERT INTO `sys_logininfor` VALUES (555, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-02-21 20:12:21');
INSERT INTO `sys_logininfor` VALUES (556, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2020-02-21 20:14:28');
INSERT INTO `sys_logininfor` VALUES (557, 'property1', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-02-21 20:14:35');
INSERT INTO `sys_logininfor` VALUES (558, 'property1', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2020-02-21 20:33:29');
INSERT INTO `sys_logininfor` VALUES (559, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-02-21 20:33:32');
INSERT INTO `sys_logininfor` VALUES (560, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2020-02-21 20:35:51');
INSERT INTO `sys_logininfor` VALUES (561, 'property1', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-02-21 20:35:59');
INSERT INTO `sys_logininfor` VALUES (562, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-02-21 20:44:03');
INSERT INTO `sys_logininfor` VALUES (563, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2020-02-21 20:44:20');
INSERT INTO `sys_logininfor` VALUES (564, 'property1', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-02-21 20:44:32');
INSERT INTO `sys_logininfor` VALUES (565, 'property1', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2020-02-21 20:47:21');
INSERT INTO `sys_logininfor` VALUES (566, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-02-21 20:47:26');
INSERT INTO `sys_logininfor` VALUES (567, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2020-02-21 20:48:20');
INSERT INTO `sys_logininfor` VALUES (568, 'property1', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-02-21 20:48:30');
INSERT INTO `sys_logininfor` VALUES (569, 'property1', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-02-21 21:07:22');
INSERT INTO `sys_logininfor` VALUES (570, 'property1', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-02-21 21:13:05');
INSERT INTO `sys_logininfor` VALUES (571, 'property1', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2020-02-21 21:15:03');
INSERT INTO `sys_logininfor` VALUES (572, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-02-21 21:15:07');
INSERT INTO `sys_logininfor` VALUES (573, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2020-02-21 21:16:14');
INSERT INTO `sys_logininfor` VALUES (574, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-02-21 21:16:20');
INSERT INTO `sys_logininfor` VALUES (575, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2020-02-21 21:17:06');
INSERT INTO `sys_logininfor` VALUES (576, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-02-21 21:18:29');
INSERT INTO `sys_logininfor` VALUES (577, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2020-02-21 21:18:56');
INSERT INTO `sys_logininfor` VALUES (578, 'property1', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-02-21 21:19:05');
INSERT INTO `sys_logininfor` VALUES (579, 'property1', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2020-02-21 21:20:52');
INSERT INTO `sys_logininfor` VALUES (580, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-02-21 21:20:56');
INSERT INTO `sys_logininfor` VALUES (581, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2020-02-21 21:21:53');
INSERT INTO `sys_logininfor` VALUES (582, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-02-21 21:21:58');
INSERT INTO `sys_logininfor` VALUES (583, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2020-02-21 21:22:03');
INSERT INTO `sys_logininfor` VALUES (584, 'property1', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-02-21 21:22:11');
INSERT INTO `sys_logininfor` VALUES (585, 'property1', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2020-02-21 22:07:36');
INSERT INTO `sys_logininfor` VALUES (586, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-02-21 22:07:40');
INSERT INTO `sys_logininfor` VALUES (587, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2020-02-21 22:08:36');
INSERT INTO `sys_logininfor` VALUES (588, 'property1', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-02-21 22:08:49');
INSERT INTO `sys_logininfor` VALUES (589, 'property1', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2020-02-21 22:09:32');
INSERT INTO `sys_logininfor` VALUES (590, 'community2', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-02-21 22:11:03');
INSERT INTO `sys_logininfor` VALUES (591, 'community2', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2020-02-21 22:22:57');
INSERT INTO `sys_logininfor` VALUES (592, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-02-21 22:23:01');
INSERT INTO `sys_logininfor` VALUES (593, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2020-02-21 22:23:25');
INSERT INTO `sys_logininfor` VALUES (594, 'hospital1', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '验证码错误', '2020-02-21 22:23:39');
INSERT INTO `sys_logininfor` VALUES (595, 'hospital1', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-02-21 22:23:42');
INSERT INTO `sys_logininfor` VALUES (596, 'hospital1', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2020-02-21 22:48:19');
INSERT INTO `sys_logininfor` VALUES (597, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-02-21 22:48:23');
INSERT INTO `sys_logininfor` VALUES (598, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2020-02-21 22:48:47');
INSERT INTO `sys_logininfor` VALUES (599, 'hospital1', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-02-21 22:48:57');
INSERT INTO `sys_logininfor` VALUES (600, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-02-22 09:40:09');
INSERT INTO `sys_logininfor` VALUES (601, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-02-23 13:11:05');
INSERT INTO `sys_logininfor` VALUES (602, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2020-02-23 13:11:34');
INSERT INTO `sys_logininfor` VALUES (603, 'hospital1', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-02-23 13:11:42');
INSERT INTO `sys_logininfor` VALUES (604, 'hospital1', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2020-02-23 13:12:16');
INSERT INTO `sys_logininfor` VALUES (605, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-02-23 13:12:18');
INSERT INTO `sys_logininfor` VALUES (606, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2020-02-23 13:12:36');
INSERT INTO `sys_logininfor` VALUES (607, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-02-23 13:13:11');
INSERT INTO `sys_logininfor` VALUES (608, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2020-02-23 13:25:56');
INSERT INTO `sys_logininfor` VALUES (609, 'hospital1', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-02-23 13:26:10');

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu`  (
  `menu_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `menu_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '菜单名称',
  `parent_id` bigint(20) DEFAULT 0 COMMENT '父菜单ID',
  `order_num` int(4) DEFAULT 0 COMMENT '显示顺序',
  `url` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '#' COMMENT '请求地址',
  `target` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '打开方式（menuItem页签 menuBlank新窗口）',
  `menu_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '菜单类型（M目录 C菜单 F按钮）',
  `visible` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '0' COMMENT '菜单状态（0显示 1隐藏）',
  `perms` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '权限标识',
  `icon` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '#' COMMENT '菜单图标',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`menu_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1198 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '菜单权限表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES (1, '系统管理', 0, 1, '#', '', 'M', '0', '', 'fa fa-gear', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '系统管理目录');
INSERT INTO `sys_menu` VALUES (2, '系统监控', 0, 2, '#', '', 'M', '0', '', 'fa fa-video-camera', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '系统监控目录');
INSERT INTO `sys_menu` VALUES (3, '系统工具', 0, 3, '#', '', 'M', '0', '', 'fa fa-bars', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '系统工具目录');
INSERT INTO `sys_menu` VALUES (100, '用户管理', 1, 1, '/system/user', '', 'C', '0', 'system:user:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '用户管理菜单');
INSERT INTO `sys_menu` VALUES (101, '角色管理', 1, 2, '/system/role', '', 'C', '0', 'system:role:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '角色管理菜单');
INSERT INTO `sys_menu` VALUES (102, '菜单管理', 1, 3, '/system/menu', '', 'C', '0', 'system:menu:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '菜单管理菜单');
INSERT INTO `sys_menu` VALUES (103, '部门管理', 1, 4, '/system/dept', '', 'C', '0', 'system:dept:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '部门管理菜单');
INSERT INTO `sys_menu` VALUES (104, '岗位管理', 1, 5, '/system/post', '', 'C', '0', 'system:post:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '岗位管理菜单');
INSERT INTO `sys_menu` VALUES (105, '字典管理', 1, 6, '/system/dict', '', 'C', '0', 'system:dict:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '字典管理菜单');
INSERT INTO `sys_menu` VALUES (106, '参数设置', 1, 7, '/system/config', '', 'C', '0', 'system:config:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '参数设置菜单');
INSERT INTO `sys_menu` VALUES (107, '通知公告', 1, 8, '/system/notice', '', 'C', '0', 'system:notice:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '通知公告菜单');
INSERT INTO `sys_menu` VALUES (108, '日志管理', 1, 9, '#', '', 'M', '0', '', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '日志管理菜单');
INSERT INTO `sys_menu` VALUES (109, '在线用户', 2, 1, '/monitor/online', '', 'C', '0', 'monitor:online:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '在线用户菜单');
INSERT INTO `sys_menu` VALUES (110, '定时任务', 2, 2, '/monitor/job', '', 'C', '0', 'monitor:job:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '定时任务菜单');
INSERT INTO `sys_menu` VALUES (111, '数据监控', 2, 3, '/monitor/data', '', 'C', '0', 'monitor:data:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '数据监控菜单');
INSERT INTO `sys_menu` VALUES (112, '服务监控', 2, 3, '/monitor/server', '', 'C', '0', 'monitor:server:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '服务监控菜单');
INSERT INTO `sys_menu` VALUES (113, '表单构建', 3, 1, '/tool/build', '', 'C', '0', 'tool:build:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '表单构建菜单');
INSERT INTO `sys_menu` VALUES (114, '代码生成', 3, 2, '/tool/gen', '', 'C', '0', 'tool:gen:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '代码生成菜单');
INSERT INTO `sys_menu` VALUES (115, '系统接口', 3, 3, '/tool/swagger', '', 'C', '0', 'tool:swagger:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '系统接口菜单');
INSERT INTO `sys_menu` VALUES (500, '操作日志', 108, 1, '/monitor/operlog', '', 'C', '0', 'monitor:operlog:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '操作日志菜单');
INSERT INTO `sys_menu` VALUES (501, '登录日志', 108, 2, '/monitor/logininfor', '', 'C', '0', 'monitor:logininfor:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '登录日志菜单');
INSERT INTO `sys_menu` VALUES (1000, '用户查询', 100, 1, '#', '', 'F', '0', 'system:user:list', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1001, '用户新增', 100, 2, '#', '', 'F', '0', 'system:user:add', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1002, '用户修改', 100, 3, '#', '', 'F', '0', 'system:user:edit', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1003, '用户删除', 100, 4, '#', '', 'F', '0', 'system:user:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1004, '用户导出', 100, 5, '#', '', 'F', '0', 'system:user:export', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1005, '用户导入', 100, 6, '#', '', 'F', '0', 'system:user:import', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1006, '重置密码', 100, 7, '#', '', 'F', '0', 'system:user:resetPwd', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1007, '角色查询', 101, 1, '#', '', 'F', '0', 'system:role:list', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1008, '角色新增', 101, 2, '#', '', 'F', '0', 'system:role:add', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1009, '角色修改', 101, 3, '#', '', 'F', '0', 'system:role:edit', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1010, '角色删除', 101, 4, '#', '', 'F', '0', 'system:role:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1011, '角色导出', 101, 5, '#', '', 'F', '0', 'system:role:export', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1012, '菜单查询', 102, 1, '#', '', 'F', '0', 'system:menu:list', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1013, '菜单新增', 102, 2, '#', '', 'F', '0', 'system:menu:add', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1014, '菜单修改', 102, 3, '#', '', 'F', '0', 'system:menu:edit', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1015, '菜单删除', 102, 4, '#', '', 'F', '0', 'system:menu:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1016, '部门查询', 103, 1, '#', '', 'F', '0', 'system:dept:list', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1017, '部门新增', 103, 2, '#', '', 'F', '0', 'system:dept:add', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1018, '部门修改', 103, 3, '#', '', 'F', '0', 'system:dept:edit', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1019, '部门删除', 103, 4, '#', '', 'F', '0', 'system:dept:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1020, '岗位查询', 104, 1, '#', '', 'F', '0', 'system:post:list', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1021, '岗位新增', 104, 2, '#', '', 'F', '0', 'system:post:add', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1022, '岗位修改', 104, 3, '#', '', 'F', '0', 'system:post:edit', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1023, '岗位删除', 104, 4, '#', '', 'F', '0', 'system:post:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1024, '岗位导出', 104, 5, '#', '', 'F', '0', 'system:post:export', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1025, '字典查询', 105, 1, '#', '', 'F', '0', 'system:dict:list', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1026, '字典新增', 105, 2, '#', '', 'F', '0', 'system:dict:add', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1027, '字典修改', 105, 3, '#', '', 'F', '0', 'system:dict:edit', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1028, '字典删除', 105, 4, '#', '', 'F', '0', 'system:dict:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1029, '字典导出', 105, 5, '#', '', 'F', '0', 'system:dict:export', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1030, '参数查询', 106, 1, '#', '', 'F', '0', 'system:config:list', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1031, '参数新增', 106, 2, '#', '', 'F', '0', 'system:config:add', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1032, '参数修改', 106, 3, '#', '', 'F', '0', 'system:config:edit', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1033, '参数删除', 106, 4, '#', '', 'F', '0', 'system:config:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1034, '参数导出', 106, 5, '#', '', 'F', '0', 'system:config:export', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1035, '公告查询', 107, 1, '#', '', 'F', '0', 'system:notice:list', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1036, '公告新增', 107, 2, '#', '', 'F', '0', 'system:notice:add', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1037, '公告修改', 107, 3, '#', '', 'F', '0', 'system:notice:edit', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1038, '公告删除', 107, 4, '#', '', 'F', '0', 'system:notice:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1039, '操作查询', 500, 1, '#', '', 'F', '0', 'monitor:operlog:list', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1040, '操作删除', 500, 2, '#', '', 'F', '0', 'monitor:operlog:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1041, '详细信息', 500, 3, '#', '', 'F', '0', 'monitor:operlog:detail', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1042, '日志导出', 500, 4, '#', '', 'F', '0', 'monitor:operlog:export', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1043, '登录查询', 501, 1, '#', '', 'F', '0', 'monitor:logininfor:list', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1044, '登录删除', 501, 2, '#', '', 'F', '0', 'monitor:logininfor:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1045, '日志导出', 501, 3, '#', '', 'F', '0', 'monitor:logininfor:export', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1046, '账户解锁', 501, 4, '#', '', 'F', '0', 'monitor:logininfor:unlock', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1047, '在线查询', 109, 1, '#', '', 'F', '0', 'monitor:online:list', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1048, '批量强退', 109, 2, '#', '', 'F', '0', 'monitor:online:batchForceLogout', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1049, '单条强退', 109, 3, '#', '', 'F', '0', 'monitor:online:forceLogout', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1050, '任务查询', 110, 1, '#', '', 'F', '0', 'monitor:job:list', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1051, '任务新增', 110, 2, '#', '', 'F', '0', 'monitor:job:add', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1052, '任务修改', 110, 3, '#', '', 'F', '0', 'monitor:job:edit', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1053, '任务删除', 110, 4, '#', '', 'F', '0', 'monitor:job:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1054, '状态修改', 110, 5, '#', '', 'F', '0', 'monitor:job:changeStatus', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1055, '任务详细', 110, 6, '#', '', 'F', '0', 'monitor:job:detail', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1056, '任务导出', 110, 7, '#', '', 'F', '0', 'monitor:job:export', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1057, '生成查询', 114, 1, '#', '', 'F', '0', 'tool:gen:list', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1058, '生成修改', 114, 2, '#', '', 'F', '0', 'tool:gen:edit', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1059, '生成删除', 114, 3, '#', '', 'F', '0', 'tool:gen:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1060, '预览代码', 114, 4, '#', '', 'F', '0', 'tool:gen:preview', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1061, '生成代码', 114, 5, '#', '', 'F', '0', 'tool:gen:code', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1065, '社区服务中心管理', 0, 4, '#', 'menuItem', 'M', '0', NULL, 'fa fa-coffee', 'admin', '2020-02-05 15:41:35', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1066, '区域设置', 1065, 1, '/csc/area', 'menuItem', 'C', '0', 'csc:area:view', 'fa fa-globe', 'admin', '2020-02-05 15:42:35', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1094, '社区管理', 0, 5, '#', 'menuItem', 'M', '0', '', 'fa fa-home', 'admin', '2020-02-14 12:22:01', 'admin', '2020-02-16 13:03:16', '');
INSERT INTO `sys_menu` VALUES (1095, '社区列表', 1094, 1, '/cm/community', 'menuItem', 'C', '0', 'cm:community:view', 'fa fa-child', 'admin', '2020-02-14 12:24:26', 'admin', '2020-02-16 13:07:35', '');
INSERT INTO `sys_menu` VALUES (1096, '社区查询', 1095, 1, '#', 'menuItem', 'F', '0', 'cm:community:list', '#', 'admin', '2020-02-14 15:38:57', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1097, '社区新增', 1095, 2, '#', 'menuItem', 'F', '0', 'cm:community:add', '#', 'admin', '2020-02-14 15:39:24', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1098, '社区修改', 1095, 3, '#', 'menuItem', 'F', '0', 'cm:community:edit', '#', 'admin', '2020-02-14 15:40:01', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1099, '社区删除', 1095, 4, '#', 'menuItem', 'F', '0', 'cm:community:remove', '#', 'admin', '2020-02-14 15:40:33', 'admin', '2020-02-21 09:43:51', '');
INSERT INTO `sys_menu` VALUES (1100, '社区活动', 1094, 2, '/cm/activity', 'menuItem', 'C', '0', 'cm:activity:view', 'fa fa-user-plus', 'admin', '2020-02-14 15:42:14', 'admin', '2020-02-20 21:03:06', '');
INSERT INTO `sys_menu` VALUES (1101, '活动查询', 1100, 1, '#', 'menuItem', 'F', '0', 'cm:activity:list', '#', 'admin', '2020-02-15 03:54:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1102, '活动新增', 1100, 2, '#', 'menuItem', 'F', '0', 'cm:activity:add', '#', 'admin', '2020-02-15 03:55:04', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1103, '活动修改', 1100, 3, '#', 'menuItem', 'F', '0', 'cm:activity:edit', '#', 'admin', '2020-02-15 03:55:34', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1104, '活动删除', 1100, 4, '#', 'menuItem', 'F', '0', 'cm:activity:remove', '#', 'admin', '2020-02-15 03:56:11', 'admin', '2020-02-21 09:44:12', '');
INSERT INTO `sys_menu` VALUES (1107, '办事指南', 1094, 3, '/cm/guide', 'menuItem', 'C', '0', 'cm:guide:view', 'fa fa-calendar', 'admin', '2020-02-15 14:10:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1108, '办事指南查询', 1107, 1, '#', 'menuItem', 'F', '0', 'cm:guide:list', '#', 'admin', '2020-02-15 14:11:07', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1109, '办事指南新增', 1107, 2, '#', 'menuItem', 'F', '0', 'cm:guide:add', '#', 'admin', '2020-02-15 14:11:30', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1110, '办事指南修改', 1107, 3, '#', 'menuItem', 'F', '0', 'cm:guide:edit', '#', 'admin', '2020-02-15 14:11:56', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1111, '办事指南删除', 1107, 4, '#', 'menuItem', 'F', '0', 'cm:guide:remove', '#', 'admin', '2020-02-15 14:12:15', 'admin', '2020-02-21 09:44:21', '');
INSERT INTO `sys_menu` VALUES (1112, '留言查看', 1094, 4, '/cm/note', 'menuItem', 'C', '0', 'cm:note:view', 'fa fa-leaf', 'admin', '2020-02-16 11:40:51', 'admin', '2020-02-20 21:06:39', '');
INSERT INTO `sys_menu` VALUES (1113, '留言查询', 1112, 1, '#', 'menuItem', 'F', '0', 'cm:note:list', '#', 'admin', '2020-02-16 11:41:42', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1114, '留言删除', 1112, 2, '#', 'menuItem', 'F', '0', 'cm:note:remove', '#', 'admin', '2020-02-16 11:42:04', 'admin', '2020-02-21 09:44:30', '');
INSERT INTO `sys_menu` VALUES (1115, '物业管理', 0, 7, '#', 'menuItem', 'M', '0', '', 'fa fa-archive', 'admin', '2020-02-16 13:03:09', 'admin', '2020-02-20 10:05:34', '');
INSERT INTO `sys_menu` VALUES (1116, '物业管理', 1115, 1, '/pm/property', 'menuItem', 'C', '0', 'pm:property:view', 'fa fa-bank', 'admin', '2020-02-16 13:07:19', 'admin', '2020-02-17 02:58:45', '');
INSERT INTO `sys_menu` VALUES (1117, '物业列表查询', 1116, 1, '#', 'menuItem', 'F', '0', 'pm:property:list', '#', 'admin', '2020-02-16 13:08:48', 'admin', '2020-02-16 13:09:01', '');
INSERT INTO `sys_menu` VALUES (1118, '物业新增', 1116, 2, '#', 'menuItem', 'F', '0', 'pm:property:add', '#', 'admin', '2020-02-16 13:09:53', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1119, '物业修改', 1116, 3, '#', 'menuItem', 'F', '0', 'pm:property:edit', '#', 'admin', '2020-02-16 13:10:33', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1120, '物业删除', 1116, 4, '#', 'menuItem', 'F', '0', 'pm:property:remove', '#', 'admin', '2020-02-16 13:11:02', 'admin', '2020-02-21 09:45:33', '');
INSERT INTO `sys_menu` VALUES (1121, '活动管理', 1115, 2, '/pm/activity', 'menuItem', 'C', '0', 'pm:activity:view', 'fa fa-archive', 'admin', '2020-02-17 02:53:49', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1122, '留言管理', 1115, 4, '/pm/note', 'menuItem', 'C', '0', 'pm:note:view', 'fa fa-id-badge', 'admin', '2020-02-17 02:56:46', 'admin', '2020-02-17 02:57:35', '');
INSERT INTO `sys_menu` VALUES (1123, '办事指南', 1115, 5, '/pm/guide', 'menuItem', 'C', '0', 'pm:guide:view', 'fa fa-language', 'admin', '2020-02-17 02:59:35', 'admin', '2020-02-17 05:20:20', '');
INSERT INTO `sys_menu` VALUES (1124, '活动查询', 1121, 1, '#', 'menuItem', 'F', '0', 'pm:activity:list', '#', 'admin', '2020-02-17 03:01:00', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1125, '活动编辑', 1121, 3, '#', 'menuItem', 'F', '0', 'pm:activity:edit', '#', 'admin', '2020-02-17 03:01:20', 'admin', '2020-02-17 03:01:57', '');
INSERT INTO `sys_menu` VALUES (1126, '活动新增', 1121, 2, '#', 'menuItem', 'F', '0', 'pm:activity:add', '#', 'admin', '2020-02-17 03:01:47', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1127, '活动删除', 1121, 4, '#', 'menuItem', 'F', '0', 'pm:activity:remove', '#', 'admin', '2020-02-17 03:02:17', 'admin', '2020-02-21 09:45:43', '');
INSERT INTO `sys_menu` VALUES (1128, '办事指南查询', 1123, 1, '#', 'menuItem', 'F', '0', 'pm:guide:list', '#', 'admin', '2020-02-17 03:02:45', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1129, '活动指南新增', 1123, 2, '#', 'menuItem', 'F', '0', 'pm:guide:add', '#', 'admin', '2020-02-17 03:03:06', 'admin', '2020-02-21 22:08:34', '');
INSERT INTO `sys_menu` VALUES (1130, '办事指南编辑', 1123, 3, '#', 'menuItem', 'F', '0', 'pm:guide:edit', '#', 'admin', '2020-02-17 03:03:53', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1131, '办事指南删除', 1123, 4, '#', 'menuItem', 'F', '0', 'pm:guide:remove', '#', 'admin', '2020-02-17 03:04:15', 'admin', '2020-02-21 09:47:29', '');
INSERT INTO `sys_menu` VALUES (1132, '留言列表查询', 1122, 1, '#', 'menuItem', 'F', '0', 'pm:note:list', '#', 'admin', '2020-02-17 03:04:48', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1133, '留言新增', 1122, 2, '#', 'menuItem', 'F', '0', 'pm:note:add', '#', 'admin', '2020-02-17 03:05:16', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1134, '留言编辑', 1122, 3, '#', 'menuItem', 'F', '0', 'pm:note:edit', '#', 'admin', '2020-02-17 03:05:36', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1135, '留言删除', 1122, 4, '#', 'menuItem', 'F', '0', 'pm:note:remove', '#', 'admin', '2020-02-17 03:05:58', 'admin', '2020-02-21 09:47:01', '');
INSERT INTO `sys_menu` VALUES (1136, '物业通知', 1115, 3, '/pm/notice', 'menuItem', 'C', '0', 'pm:notice:view', 'fa fa-bars', 'admin', '2020-02-17 05:21:13', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1137, '通知列表查询', 1136, 1, '#', 'menuItem', 'F', '0', 'pm:notice:list', '#', 'admin', '2020-02-17 05:21:33', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1138, '通知修改', 1136, 3, '#', 'menuItem', 'F', '0', 'pm:notice:edit', '#', 'admin', '2020-02-17 05:21:49', 'admin', '2020-02-17 05:22:30', '');
INSERT INTO `sys_menu` VALUES (1139, '通知新增', 1136, 2, '#', 'menuItem', 'F', '0', 'pm:notice:add', '#', 'admin', '2020-02-17 05:22:13', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1140, '物业通知删除', 1136, 4, '#', 'menuItem', 'F', '0', 'pm:notice:remove', '#', 'admin', '2020-02-17 05:22:55', 'admin', '2020-02-21 09:45:58', '');
INSERT INTO `sys_menu` VALUES (1141, '健康宣教', 0, 8, '#', 'menuItem', 'M', '0', '', 'fa fa-dashboard', 'admin', '2020-02-17 05:42:03', 'admin', '2020-02-20 10:05:48', '');
INSERT INTO `sys_menu` VALUES (1142, '宣教文章管理', 1141, 2, '/he/article', 'menuItem', 'C', '0', 'he:article:view', 'fa fa-reorder', 'admin', '2020-02-17 05:43:42', 'admin', '2020-02-17 05:46:09', '');
INSERT INTO `sys_menu` VALUES (1143, '宣教视频管理', 1141, 3, '/he/video', 'menuItem', 'C', '0', 'he:video:view', 'fa fa-toggle-right', 'admin', '2020-02-17 05:44:35', 'admin', '2020-02-17 05:46:21', '');
INSERT INTO `sys_menu` VALUES (1144, '宣教板块', 1141, 1, '/he/board', 'menuItem', 'C', '0', 'he:board:view', 'fa fa-gear', 'admin', '2020-02-17 05:46:01', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1145, '宣教板块查询', 1144, 1, '#', 'menuItem', 'F', '0', 'he:board:list', '#', 'admin', '2020-02-17 05:47:45', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1146, '宣教板块新增', 1144, 2, '#', 'menuItem', 'F', '0', 'he:board:add', '#', 'admin', '2020-02-17 05:48:15', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1147, '宣教板块修改', 1144, 3, '#', 'menuItem', 'F', '0', 'he:board:edit', '#', 'admin', '2020-02-17 05:48:37', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1148, '宣教板块删除', 1144, 4, '#', 'menuItem', 'F', '0', 'he:board:remove', '#', 'admin', '2020-02-17 05:49:08', 'admin', '2020-02-21 09:47:51', '');
INSERT INTO `sys_menu` VALUES (1149, '宣教文章查询', 1142, 1, '#', 'menuItem', 'F', '0', 'he:article:list', '#', 'admin', '2020-02-17 05:49:45', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1150, '宣教文章新增', 1142, 2, '#', 'menuItem', 'F', '0', 'he:article:add', '#', 'admin', '2020-02-17 05:50:12', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1151, '宣教文章编辑', 1142, 3, '#', 'menuItem', 'F', '0', 'he:article:edit', '#', 'admin', '2020-02-17 05:50:36', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1152, '宣教文章删除', 1142, 4, '#', 'menuItem', 'F', '0', 'he:article:remove', '#', 'admin', '2020-02-17 05:50:57', 'admin', '2020-02-21 09:48:06', '');
INSERT INTO `sys_menu` VALUES (1153, '宣教视频查询', 1143, 1, '#', 'menuItem', 'F', '0', 'he:video:list', '#', 'admin', '2020-02-17 05:51:21', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1154, '宣教视频新增', 1143, 2, '#', 'menuItem', 'F', '0', 'he:video:add', '#', 'admin', '2020-02-17 05:51:43', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1155, '宣教视频修改', 1143, 3, '#', 'menuItem', 'F', '0', 'he:video:edit', '#', 'admin', '2020-02-17 05:52:03', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1156, '宣教视频删除', 1143, 4, '#', 'menuItem', 'F', '0', 'he:video:remove', '#', 'admin', '2020-02-17 05:52:22', 'admin', '2020-02-21 09:48:18', '');
INSERT INTO `sys_menu` VALUES (1157, '客户端用户管理', 0, 9, '#', 'menuItem', 'M', '0', '', 'fa fa-user', 'admin', '2020-02-18 07:22:34', 'admin', '2020-02-20 10:05:55', '');
INSERT INTO `sys_menu` VALUES (1158, '用户列表', 1157, 1, '/sm/clientuser', 'menuItem', 'C', '0', 'sm:clientuser:view', 'fa fa-user-circle', 'admin', '2020-02-18 07:23:25', 'admin', '2020-02-18 07:40:54', '');
INSERT INTO `sys_menu` VALUES (1159, '用户列表查询', 1158, 1, '#', 'menuItem', 'F', '0', 'sm:clientuser:list', '#', 'admin', '2020-02-18 07:23:51', 'admin', '2020-02-18 07:41:01', '');
INSERT INTO `sys_menu` VALUES (1160, '首页管理', 0, 10, '#', 'menuItem', 'M', '0', '', 'fa fa-braille', 'admin', '2020-02-18 13:48:44', 'admin', '2020-02-20 10:05:59', '');
INSERT INTO `sys_menu` VALUES (1161, '轮播广告', 1160, 1, '/fp/loopImage', 'menuItem', 'C', '0', 'fp:loop:view', 'fa fa-image', 'admin', '2020-02-18 13:50:14', 'admin', '2020-02-18 14:15:23', '');
INSERT INTO `sys_menu` VALUES (1162, '轮播广告查询', 1161, 1, '#', 'menuItem', 'F', '0', 'fp:loop:list', '#', 'admin', '2020-02-18 13:50:37', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1163, '轮播广告新增', 1161, 2, '#', 'menuItem', 'F', '0', 'fp:loop:add', '#', 'admin', '2020-02-18 13:50:59', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1164, '轮播广告编辑', 1161, 3, '#', 'menuItem', 'F', '0', 'fp:loop:edit', '#', 'admin', '2020-02-18 13:51:23', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1165, '轮播广告删除', 1161, 4, '#', 'menuItem', 'F', '0', 'fp:loop:remove', '#', 'admin', '2020-02-18 13:51:41', 'admin', '2020-02-21 09:48:44', '');
INSERT INTO `sys_menu` VALUES (1171, '社区医院管理', 0, 6, '#', 'menuItem', 'M', '0', NULL, 'fa fa-plus-circle', 'admin', '2020-02-20 09:57:36', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1172, '医院管理', 1171, 1, '/ch/hospital', 'menuItem', 'C', '0', 'ch:hospital:view', 'fa fa-bank', 'admin', '2020-02-20 09:59:29', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1173, '医院列表查询', 1172, 1, '#', 'menuItem', 'F', '0', 'ch:hospital:list', '#', 'admin', '2020-02-20 10:05:09', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1174, '医疗项目', 1171, 2, '/ch/medical', 'menuItem', 'C', '0', 'ch:medical:view', 'fa fa-window-restore', 'admin', '2020-02-20 10:07:13', 'admin', '2020-02-20 10:09:18', '');
INSERT INTO `sys_menu` VALUES (1175, '医生管理', 1171, 3, '/ch/doctor', 'menuItem', 'C', '0', 'ch:doctor:view', 'fa fa-user-circle', 'admin', '2020-02-20 10:08:14', 'admin', '2020-02-20 10:08:26', '');
INSERT INTO `sys_menu` VALUES (1176, '预约管理', 1171, 4, '/ch/appointment', 'menuItem', 'C', '0', 'ch:appointment:view', 'fa fa-calendar-plus-o', 'admin', '2020-02-20 10:10:16', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1177, '医院新增', 1172, 2, '#', 'menuItem', 'F', '0', 'ch:hospital:add', '#', 'admin', '2020-02-20 10:11:23', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1178, '医院编辑', 1172, 3, '#', 'menuItem', 'F', '0', 'ch:hospital:edit', '#', 'admin', '2020-02-20 10:15:10', 'admin', '2020-02-20 10:15:26', '');
INSERT INTO `sys_menu` VALUES (1179, '医院删除', 1172, 4, '#', 'menuItem', 'F', '0', 'ch:hospital:remove', '#', 'admin', '2020-02-20 10:15:51', 'admin', '2020-02-21 09:44:50', '');
INSERT INTO `sys_menu` VALUES (1180, '医疗项目列表查询', 1174, 1, '#', 'menuItem', 'F', '0', 'ch:medical:list', '#', 'admin', '2020-02-20 10:16:39', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1181, '医疗项目新增', 1174, 2, '#', 'menuItem', 'F', '0', 'ch:medical:add', '#', 'admin', '2020-02-20 10:17:06', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1182, '医疗项目编辑', 1174, 3, '#', 'menuItem', 'F', '0', 'ch:medical:edit', '#', 'admin', '2020-02-20 10:17:34', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1183, '医疗项目删除', 1174, 4, '#', 'menuItem', 'F', '0', 'ch:medical:remove', '#', 'admin', '2020-02-20 10:17:59', 'admin', '2020-02-21 09:46:22', '');
INSERT INTO `sys_menu` VALUES (1184, '医生列表', 1175, 1, '#', 'menuItem', 'F', '0', 'ch:doctor:list', '#', 'admin', '2020-02-20 10:18:34', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1185, '医生新增', 1175, 2, '#', 'menuItem', 'F', '0', 'ch:doctor:add', '#', 'admin', '2020-02-20 10:19:13', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1186, '医生编辑', 1175, 3, '#', 'menuItem', 'F', '0', 'ch:doctor:edit', '#', 'admin', '2020-02-20 10:19:39', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1187, '医生删除', 1175, 4, '#', 'menuItem', 'F', '0', 'ch:doctor:remove', '#', 'admin', '2020-02-20 10:20:12', 'admin', '2020-02-21 09:46:36', '');
INSERT INTO `sys_menu` VALUES (1188, '预约列表查询', 1176, 1, '#', 'menuItem', 'F', '0', 'ch:appointment:list', '#', 'admin', '2020-02-20 10:21:01', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1189, '预约新增', 1176, 2, '#', 'menuItem', 'F', '0', 'ch:appointment:add', '#', 'admin', '2020-02-20 10:21:33', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1190, '预约编辑', 1176, 3, '#', 'menuItem', 'F', '0', 'ch:appointment:edit', '#', 'admin', '2020-02-20 10:21:59', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1191, '预约删除', 1176, 4, '#', 'menuItem', 'F', '0', 'ch:appointment:remove', '#', 'admin', '2020-02-20 10:23:15', 'admin', '2020-02-21 09:45:08', '');
INSERT INTO `sys_menu` VALUES (1192, '区域列表查询', 1066, 1, '#', 'menuItem', 'F', '0', 'csc:area:list', '#', 'admin', '2020-02-20 11:02:01', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1193, '区域新增', 1066, 2, '#', 'menuItem', 'F', '0', 'csc:area:add', '#', 'admin', '2020-02-20 11:02:21', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1194, '区域编辑', 1066, 3, '#', 'menuItem', 'F', '0', 'csc:area:edit', '#', 'admin', '2020-02-20 11:02:45', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1195, '区域删除', 1066, 4, '#', 'menuItem', 'F', '0', 'csc:area:delete', '#', 'admin', '2020-02-20 11:03:02', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1196, '活动报名列表导出', 1100, 5, '#', 'menuItem', 'F', '0', 'cm:activity:export', '#', 'admin', '2020-02-21 20:07:34', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1197, '物业活动报名列表导出', 1121, 5, '#', 'menuItem', 'F', '0', 'pm:activity:export', '#', 'admin', '2020-02-21 20:48:19', '', NULL, '');

-- ----------------------------
-- Table structure for sys_notice
-- ----------------------------
DROP TABLE IF EXISTS `sys_notice`;
CREATE TABLE `sys_notice`  (
  `notice_id` int(4) NOT NULL AUTO_INCREMENT COMMENT '公告ID',
  `notice_title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '公告标题',
  `notice_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '公告类型（1通知 2公告）',
  `notice_content` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '公告内容',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '0' COMMENT '公告状态（0正常 1关闭）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`notice_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '通知公告表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_notice
-- ----------------------------
INSERT INTO `sys_notice` VALUES (1, '温馨提醒：2018-07-01 若依新版本发布啦', '2', '<p>新版本内容</p><p>管理员先新增社区或者物业</p><p>然后添加用户的时候更具物业或者社区类型，选择物业或者社区，</p><p>然后给其添加菜单，</p><p>这里给其添加得菜单都是需要做处理得，查询都需要带上所属得社区或者物业id</p><p>操作员的化，那就给权限得时候给一个查询权限</p><p><br></p>', '0', 'admin', '2018-03-16 11:33:00', 'admin', '2020-02-18 16:13:41', '管理员');
INSERT INTO `sys_notice` VALUES (2, '维护通知：2018-07-01 若依系统凌晨维护', '1', '维护内容', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '管理员');

-- ----------------------------
-- Table structure for sys_oper_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_oper_log`;
CREATE TABLE `sys_oper_log`  (
  `oper_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '日志主键',
  `title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '模块标题',
  `business_type` int(2) DEFAULT 0 COMMENT '业务类型（0其它 1新增 2修改 3删除）',
  `method` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '方法名称',
  `request_method` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '请求方式',
  `operator_type` int(1) DEFAULT 0 COMMENT '操作类别（0其它 1后台用户 2手机端用户）',
  `oper_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '操作人员',
  `dept_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '部门名称',
  `oper_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '请求URL',
  `oper_ip` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '主机地址',
  `oper_location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '操作地点',
  `oper_param` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '请求参数',
  `json_result` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '返回参数',
  `status` int(1) DEFAULT 0 COMMENT '操作状态（0正常 1异常）',
  `error_msg` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '错误消息',
  `oper_time` datetime(0) DEFAULT NULL COMMENT '操作时间',
  PRIMARY KEY (`oper_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 907 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '操作日志记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_oper_log
-- ----------------------------
INSERT INTO `sys_oper_log` VALUES (100, '个人信息', 2, 'com.ruoyi.project.system.user.controller.ProfileController.updateAvatar()', 'POST', 1, 'admin', '研发部门', '/system/user/profile/updateAvatar', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-02 11:07:27');
INSERT INTO `sys_oper_log` VALUES (101, '重置密码', 2, 'com.ruoyi.project.system.user.controller.UserController.resetPwd()', 'GET', 1, 'admin', '研发部门', '/system/user/resetPwd/2', '127.0.0.1', '内网IP', '{}', '\"system/user/resetPwd\"', 0, NULL, '2020-02-02 11:35:06');
INSERT INTO `sys_oper_log` VALUES (102, '重置密码', 2, 'com.ruoyi.project.system.user.controller.UserController.resetPwdSave()', 'POST', 1, 'admin', '研发部门', '/system/user/resetPwd', '127.0.0.1', '内网IP', '{\"userId\":[\"2\"],\"loginName\":[\"ry\"],\"password\":[\"123456\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-02 11:35:12');
INSERT INTO `sys_oper_log` VALUES (103, '角色管理', 1, 'com.ruoyi.project.system.role.controller.RoleController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/role/add', '127.0.0.1', '内网IP', '{\"roleName\":[\"运维监控\"],\"roleKey\":[\"monitor\"],\"roleSort\":[\"3\"],\"status\":[\"0\"],\"remark\":[\"\"],\"menuIds\":[\"2,109,1047,1048,1049,110,1050,1051,1052,1053,1054,1055,1056,111,112\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-02 11:39:22');
INSERT INTO `sys_oper_log` VALUES (104, '用户管理', 1, 'com.ruoyi.project.system.user.controller.UserController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/user/add', '127.0.0.1', '内网IP', '{\"deptId\":[\"107\"],\"userName\":[\"hanjietao\"],\"deptName\":[\"运维部门\"],\"phonenumber\":[\"18505561893\"],\"email\":[\"hjtxyr@163.com\"],\"loginName\":[\"hanjietao\"],\"password\":[\"123456\"],\"sex\":[\"0\"],\"role\":[\"100\"],\"remark\":[\"test  menu\"],\"status\":[\"0\"],\"roleIds\":[\"100\"],\"postIds\":[\"4\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-02 11:40:09');
INSERT INTO `sys_oper_log` VALUES (105, '个人信息', 2, 'com.pepper.project.system.user.controller.ProfileController.updateAvatar()', 'POST', 1, 'admin', '研发部门', '/system/user/profile/updateAvatar', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"java.io.FileNotFoundException: C:\\\\Users\\\\hanjietao\\\\AppData\\\\Local\\\\Temp\\\\tomcat.7796190783299704868.80\\\\work\\\\Tomcat\\\\localhost\\\\ROOT\\\\null\\\\avatar\\\\2020\\\\02\\\\02\\\\bfb48a5f84576a4036c9bf2f34f143dc.png (系统找不到指定的路径。)\",\"code\":500}', 0, NULL, '2020-02-02 13:31:05');
INSERT INTO `sys_oper_log` VALUES (106, '个人信息', 2, 'com.pepper.project.system.user.controller.ProfileController.updateAvatar()', 'POST', 1, 'admin', '研发部门', '/system/user/profile/updateAvatar', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"java.io.FileNotFoundException: C:\\\\Users\\\\hanjietao\\\\AppData\\\\Local\\\\Temp\\\\tomcat.7796190783299704868.80\\\\work\\\\Tomcat\\\\localhost\\\\ROOT\\\\null\\\\avatar\\\\2020\\\\02\\\\02\\\\ef7fcd2cccc0daea01de9d2089c03558.png (系统找不到指定的路径。)\",\"code\":500}', 0, NULL, '2020-02-02 13:31:31');
INSERT INTO `sys_oper_log` VALUES (107, '个人信息', 2, 'com.pepper.project.system.user.controller.ProfileController.updateAvatar()', 'POST', 1, 'admin', '研发部门', '/system/user/profile/updateAvatar', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"java.io.FileNotFoundException: C:\\\\Users\\\\hanjietao\\\\AppData\\\\Local\\\\Temp\\\\tomcat.7796190783299704868.80\\\\work\\\\Tomcat\\\\localhost\\\\ROOT\\\\null\\\\avatar\\\\2020\\\\02\\\\02\\\\45151d5d71a6c3a5b24f49bf84a06320.png (系统找不到指定的路径。)\",\"code\":500}', 0, NULL, '2020-02-02 13:32:15');
INSERT INTO `sys_oper_log` VALUES (108, '菜单管理', 1, 'com.pepper.project.system.menu.controller.MenuController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"0\"],\"menuType\":[\"M\"],\"menuName\":[\"区域管理\"],\"url\":[\"\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"4\"],\"icon\":[\"fa fa-globe\"],\"visible\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-05 13:44:17');
INSERT INTO `sys_oper_log` VALUES (109, '菜单管理', 2, 'com.pepper.project.system.menu.controller.MenuController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"1062\"],\"parentId\":[\"0\"],\"menuType\":[\"M\"],\"menuName\":[\"社区服务中心管理\"],\"url\":[\"#\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"4\"],\"icon\":[\"fa fa-globe\"],\"visible\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-05 13:46:01');
INSERT INTO `sys_oper_log` VALUES (110, '菜单管理', 1, 'com.pepper.project.system.menu.controller.MenuController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"0\"],\"menuType\":[\"C\"],\"menuName\":[\"区域设置\"],\"url\":[\"/csc/area\"],\"target\":[\"menuItem\"],\"perms\":[\"csc:area:view\"],\"orderNum\":[\"1\"],\"icon\":[\"fa fa-globe\"],\"visible\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-05 13:50:29');
INSERT INTO `sys_oper_log` VALUES (111, '菜单管理', 3, 'com.pepper.project.system.menu.controller.MenuController.remove()', 'GET', 1, 'admin', '研发部门', '/system/menu/remove/1063', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-05 13:51:11');
INSERT INTO `sys_oper_log` VALUES (112, '菜单管理', 1, 'com.pepper.project.system.menu.controller.MenuController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"1062\"],\"menuType\":[\"C\"],\"menuName\":[\"区域设置\"],\"url\":[\"/csc/area\"],\"target\":[\"menuItem\"],\"perms\":[\"csc:area:view\"],\"orderNum\":[\"1\"],\"icon\":[\"fa fa-globe\"],\"visible\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-05 13:51:51');
INSERT INTO `sys_oper_log` VALUES (113, '菜单管理', 2, 'com.pepper.project.system.menu.controller.MenuController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"1064\"],\"parentId\":[\"1062\"],\"menuType\":[\"C\"],\"menuName\":[\"区域设置\"],\"url\":[\"/cservice/area\"],\"target\":[\"menuItem\"],\"perms\":[\"cservice:area:view\"],\"orderNum\":[\"1\"],\"icon\":[\"fa fa-globe\"],\"visible\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-05 14:04:09');
INSERT INTO `sys_oper_log` VALUES (114, '菜单管理', 2, 'com.pepper.project.system.menu.controller.MenuController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"1064\"],\"parentId\":[\"1062\"],\"menuType\":[\"C\"],\"menuName\":[\"区域设置\"],\"url\":[\"/cservicec/area\"],\"target\":[\"menuItem\"],\"perms\":[\"cservicec:area:view\"],\"orderNum\":[\"1\"],\"icon\":[\"fa fa-globe\"],\"visible\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-05 14:07:26');
INSERT INTO `sys_oper_log` VALUES (115, '菜单管理', 2, 'com.pepper.project.system.menu.controller.MenuController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"1064\"],\"parentId\":[\"1062\"],\"menuType\":[\"C\"],\"menuName\":[\"区域设置\"],\"url\":[\"/cservicec/area\"],\"target\":[\"menuItem\"],\"perms\":[\"cservicec:area:view\"],\"orderNum\":[\"1\"],\"icon\":[\"fa fa-globe\"],\"visible\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-05 14:07:40');
INSERT INTO `sys_oper_log` VALUES (116, '菜单管理', 1, 'com.ruoyi.project.system.menu.controller.MenuController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"0\"],\"menuType\":[\"M\"],\"menuName\":[\"社区服务中心管理\"],\"url\":[\"\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"4\"],\"icon\":[\"fa fa-coffee\"],\"visible\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-05 15:41:35');
INSERT INTO `sys_oper_log` VALUES (117, '菜单管理', 1, 'com.ruoyi.project.system.menu.controller.MenuController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"1065\"],\"menuType\":[\"C\"],\"menuName\":[\"区域设置\"],\"url\":[\"/csc/area\"],\"target\":[\"menuItem\"],\"perms\":[\"csc:area:view\"],\"orderNum\":[\"1\"],\"icon\":[\"fa fa-globe\"],\"visible\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-05 15:42:35');
INSERT INTO `sys_oper_log` VALUES (118, '菜单管理', 1, 'com.pepper.project.system.menu.controller.MenuController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"1066\"],\"menuType\":[\"F\"],\"menuName\":[\"区域查询\"],\"url\":[\"\"],\"target\":[\"menuItem\"],\"perms\":[\"csc:area:list\"],\"orderNum\":[\"1\"],\"icon\":[\"\"],\"visible\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-05 17:07:35');
INSERT INTO `sys_oper_log` VALUES (119, '菜单管理', 1, 'com.pepper.project.system.menu.controller.MenuController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"1066\"],\"menuType\":[\"F\"],\"menuName\":[\"区域新增\"],\"url\":[\"\"],\"target\":[\"menuItem\"],\"perms\":[\"csc:area:add\"],\"orderNum\":[\"2\"],\"icon\":[\"\"],\"visible\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-05 17:08:05');
INSERT INTO `sys_oper_log` VALUES (120, '个人信息', 2, 'com.pepper.project.system.user.controller.ProfileController.updateAvatar()', 'POST', 1, 'admin', '研发部门', '/system/user/profile/updateAvatar', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"java.io.FileNotFoundException: C:\\\\Users\\\\hanjietao\\\\AppData\\\\Local\\\\Temp\\\\tomcat.395593626794465235.80\\\\work\\\\Tomcat\\\\localhost\\\\ROOT\\\\null\\\\avatar\\\\2020\\\\02\\\\06\\\\6d98df8b237c969754a1ba169070a3f0.png (系统找不到指定的路径。)\",\"code\":500}', 0, NULL, '2020-02-06 01:44:00');
INSERT INTO `sys_oper_log` VALUES (121, '区域设置', 1, 'com.pepper.project.csc.area.controller.AreaController.addSave()', 'POST', 1, 'admin', '研发部门', '/csc/area/add', '127.0.0.1', '内网IP', '{\"areaCode\":[\"dddd\"],\"areaName\":[\"ddd\"],\"coordinate\":[\"121\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-06 03:59:01');
INSERT INTO `sys_oper_log` VALUES (122, '区域设置', 1, 'com.pepper.project.csc.area.controller.AreaController.addSave()', 'POST', 1, 'admin', '研发部门', '/csc/area/add', '127.0.0.1', '内网IP', '{\"areaCode\":[\"2222\"],\"areaName\":[\"222\"],\"coordinate\":[\"2222\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-06 04:01:47');
INSERT INTO `sys_oper_log` VALUES (123, '区域设置', 1, 'com.pepper.project.csc.area.controller.AreaController.addSave()', 'POST', 1, 'admin', '研发部门', '/csc/area/add', '127.0.0.1', '内网IP', '{\"areaCode\":[\"qwwqwq\"],\"areaName\":[\"qwwq\"],\"coordinate\":[\"qwwq\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-06 04:12:17');
INSERT INTO `sys_oper_log` VALUES (124, '区域设置', 1, 'com.pepper.project.csc.area.controller.AreaController.addSave()', 'POST', 1, 'admin', '研发部门', '/csc/area/add', '127.0.0.1', '内网IP', '{\"areaCode\":[\"sybk\"],\"areaName\":[\"沙依巴克区\"],\"coordinate\":[\"10.222245,89.99087\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-06 05:44:40');
INSERT INTO `sys_oper_log` VALUES (125, '通知公告', 1, 'com.pepper.project.system.notice.controller.NoticeController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/notice/add', '127.0.0.1', '内网IP', '{\"noticeTitle\":[\"hahhahah\"],\"noticeType\":[\"1\"],\"noticeContent\":[\"<p>ddddddd</p>\"],\"status\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-06 05:49:18');
INSERT INTO `sys_oper_log` VALUES (126, '通知公告', 3, 'com.pepper.project.system.notice.controller.NoticeController.remove()', 'POST', 1, 'admin', '研发部门', '/system/notice/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"3\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-06 05:49:29');
INSERT INTO `sys_oper_log` VALUES (127, '区域设置', 3, 'com.pepper.project.csc.area.controller.AreaController.remove()', 'POST', 1, 'admin', '研发部门', '/csc/area/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-06 06:01:52');
INSERT INTO `sys_oper_log` VALUES (128, '区域设置', 1, 'com.pepper.project.csc.area.controller.AreaController.addSave()', 'POST', 1, 'admin', '研发部门', '/csc/area/add', '127.0.0.1', '内网IP', '{\"areaCode\":[\"222\"],\"areaName\":[\"222\"],\"coordinate\":[\"222\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-06 06:02:04');
INSERT INTO `sys_oper_log` VALUES (129, '区域设置', 1, 'com.pepper.project.csc.area.controller.AreaController.addSave()', 'POST', 1, 'admin', '研发部门', '/csc/area/add', '127.0.0.1', '内网IP', '{\"areaCode\":[\"222\"],\"areaName\":[\"222\"],\"coordinate\":[\"222\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-06 06:02:09');
INSERT INTO `sys_oper_log` VALUES (130, '区域设置', 3, 'com.pepper.project.csc.area.controller.AreaController.remove()', 'POST', 1, 'admin', '研发部门', '/csc/area/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"3,2\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-06 06:02:12');
INSERT INTO `sys_oper_log` VALUES (131, '区域设置', 1, 'com.pepper.project.csc.area.controller.AreaController.addSave()', 'POST', 1, 'admin', '研发部门', '/csc/area/add', '127.0.0.1', '内网IP', '{\"areaCode\":[\"333\"],\"areaName\":[\"333\"],\"coordinate\":[\"333\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-06 06:02:21');
INSERT INTO `sys_oper_log` VALUES (132, '菜单管理', 1, 'com.pepper.project.system.menu.controller.MenuController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"1066\"],\"menuType\":[\"F\"],\"menuName\":[\"区域修改\"],\"url\":[\"\"],\"target\":[\"menuItem\"],\"perms\":[\"csc:area:edit\"],\"orderNum\":[\"3\"],\"icon\":[\"\"],\"visible\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-06 06:17:27');
INSERT INTO `sys_oper_log` VALUES (133, '区域设置', 2, 'com.pepper.project.csc.area.controller.AreaController.editSave()', 'POST', 1, 'admin', '研发部门', '/csc/area/edit', '127.0.0.1', '内网IP', '{\"id\":[\"4\"],\"areaCode\":[\"333\"],\"areaName\":[\"333\"],\"coordinate\":[\"333\"]}', 'null', 1, '\r\n### Error updating database.  Cause: java.sql.SQLSyntaxErrorException: Unknown column \'id\' in \'where clause\'\r\n### The error may involve com.pepper.project.csc.area.mapper.AreaMapper.updateArea-Inline\r\n### The error occurred while setting parameters\r\n### SQL: update sys_notice    SET area_code = ?,     area_name = ?,     coordinate = ?,     update_by = ?,    update_time = sysdate()    where id = ?\r\n### Cause: java.sql.SQLSyntaxErrorException: Unknown column \'id\' in \'where clause\'\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: Unknown column \'id\' in \'where clause\'', '2020-02-06 06:31:07');
INSERT INTO `sys_oper_log` VALUES (134, '区域设置', 2, 'com.pepper.project.csc.area.controller.AreaController.editSave()', 'POST', 1, 'admin', '研发部门', '/csc/area/edit', '127.0.0.1', '内网IP', '{\"id\":[\"4\"],\"areaCode\":[\"333\"],\"areaName\":[\"333\"],\"coordinate\":[\"333\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-06 06:32:48');
INSERT INTO `sys_oper_log` VALUES (135, '区域设置', 2, 'com.pepper.project.csc.area.controller.AreaController.editSave()', 'POST', 1, 'admin', '研发部门', '/csc/area/edit', '127.0.0.1', '内网IP', '{\"id\":[\"4\"],\"areaCode\":[\"333\"],\"areaName\":[\"333\"],\"coordinate\":[\"3331112\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-06 06:32:55');
INSERT INTO `sys_oper_log` VALUES (136, '区域设置', 1, 'com.pepper.project.csc.area.controller.AreaController.addSave()', 'POST', 1, 'admin', '研发部门', '/csc/area/add', '127.0.0.1', '内网IP', '{\"areaCode\":[\"90\"],\"areaName\":[\"90\"],\"coordinate\":[\"89\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-06 06:33:16');
INSERT INTO `sys_oper_log` VALUES (137, '通知公告', 2, 'com.pepper.project.system.notice.controller.NoticeController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/notice/edit', '127.0.0.1', '内网IP', '{\"noticeId\":[\"1\"],\"noticeTitle\":[\"温馨提醒：2018-07-01 若依新版本发布啦\"],\"noticeType\":[\"2\"],\"noticeContent\":[\"新版本内容\"],\"status\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-06 06:34:39');
INSERT INTO `sys_oper_log` VALUES (138, '区域设置', 3, 'com.pepper.project.csc.area.controller.AreaController.remove()', 'POST', 1, 'admin', '研发部门', '/csc/area/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"5\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-06 06:40:50');
INSERT INTO `sys_oper_log` VALUES (139, '区域设置', 1, 'com.pepper.project.csc.area.controller.AreaController.addSave()', 'POST', 1, 'admin', '研发部门', '/csc/area/add', '127.0.0.1', '内网IP', '{\"areaCode\":[\"3\"],\"areaName\":[\"3\"],\"coordinate\":[\"3\"],\"status\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-06 06:58:34');
INSERT INTO `sys_oper_log` VALUES (140, '区域设置', 1, 'com.pepper.project.csc.area.controller.AreaController.addSave()', 'POST', 1, 'admin', '研发部门', '/csc/area/add', '127.0.0.1', '内网IP', '{\"areaCode\":[\"12\"],\"areaName\":[\"12\"],\"coordinate\":[\"12\"],\"status\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-06 07:08:49');
INSERT INTO `sys_oper_log` VALUES (141, '区域设置', 1, 'com.pepper.project.csc.area.controller.AreaController.addSave()', 'POST', 1, 'admin', '研发部门', '/csc/area/add', '127.0.0.1', '内网IP', '{\"areaCode\":[\"23\"],\"areaName\":[\"213\"],\"coordinate\":[\"123\"],\"status\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-06 07:10:00');
INSERT INTO `sys_oper_log` VALUES (142, '区域设置', 2, 'com.pepper.project.csc.area.controller.AreaController.editSave()', 'POST', 1, 'admin', '研发部门', '/csc/area/edit', '127.0.0.1', '内网IP', '{\"id\":[\"2\"],\"areaCode\":[\"23\"],\"areaName\":[\"213\"],\"coordinate\":[\"123\"],\"status\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-06 07:11:18');
INSERT INTO `sys_oper_log` VALUES (143, '区域设置', 2, 'com.pepper.project.csc.area.controller.AreaController.editSave()', 'POST', 1, 'admin', '研发部门', '/csc/area/edit', '127.0.0.1', '内网IP', '{\"id\":[\"2\"],\"areaCode\":[\"23\"],\"areaName\":[\"213\"],\"coordinate\":[\"123\"],\"status\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-06 07:36:14');
INSERT INTO `sys_oper_log` VALUES (144, '菜单管理', 1, 'com.pepper.project.system.menu.controller.MenuController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"1066\"],\"menuType\":[\"F\"],\"menuName\":[\"区域删除\"],\"url\":[\"\"],\"target\":[\"menuItem\"],\"perms\":[\"csc:area:remove\"],\"orderNum\":[\"4\"],\"icon\":[\"\"],\"visible\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-06 07:40:53');
INSERT INTO `sys_oper_log` VALUES (145, '区域设置', 3, 'com.pepper.project.csc.area.controller.AreaController.remove()', 'POST', 1, 'admin', '研发部门', '/csc/area/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"2,1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-06 07:43:39');
INSERT INTO `sys_oper_log` VALUES (146, '区域设置', 1, 'com.pepper.project.csc.area.controller.AreaController.addSave()', 'POST', 1, 'admin', '研发部门', '/csc/area/add', '127.0.0.1', '内网IP', '{\"areaCode\":[\"sybk\"],\"areaName\":[\"沙依巴克区\"],\"coordinate\":[\"87.59788,43.80118\"],\"status\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-06 07:44:43');
INSERT INTO `sys_oper_log` VALUES (147, '区域设置', 1, 'com.pepper.project.csc.area.controller.AreaController.addSave()', 'POST', 1, 'admin', '研发部门', '/csc/area/add', '127.0.0.1', '内网IP', '{\"areaCode\":[\"ts\"],\"areaName\":[\"天山区\"],\"coordinate\":[\"87.65990,43.78007\"],\"status\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-06 07:46:29');
INSERT INTO `sys_oper_log` VALUES (148, '菜单管理', 1, 'com.pepper.project.system.menu.controller.MenuController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"1065\"],\"menuType\":[\"C\"],\"menuName\":[\"医院介绍\"],\"url\":[\"/csc/hospital\"],\"target\":[\"menuItem\"],\"perms\":[\"csc:hospital:view\"],\"orderNum\":[\"2\"],\"icon\":[\"fa fa-bank\"],\"visible\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-06 07:49:24');
INSERT INTO `sys_oper_log` VALUES (149, '医院介绍', 1, 'com.pepper.project.csc.hospital.controller.HospitalController.addSave()', 'POST', 1, 'admin', '研发部门', '/csc/hospital/add', '127.0.0.1', '内网IP', '{\"hosName\":[\"jdifeji\"],\"hosCode\":[\"dsfsd\"],\"introduction\":[\"\"],\"commuIds\":[\"sdf\"],\"areaId\":[\"sdf\"],\"status\":[\"0\"]}', 'null', 1, 'nested exception is org.apache.ibatis.reflection.ReflectionException: There is no getter for property named \'commuIds\' in \'class com.pepper.project.csc.hospital.domain.Hospital\'', '2020-02-06 09:14:09');
INSERT INTO `sys_oper_log` VALUES (150, '医院介绍', 1, 'com.pepper.project.csc.hospital.controller.HospitalController.addSave()', 'POST', 1, 'admin', '研发部门', '/csc/hospital/add', '127.0.0.1', '内网IP', '{\"hosName\":[\"jdifeji\"],\"hosCode\":[\"dsfsd\"],\"introduction\":[\"\"],\"commuIds\":[\"sdf\"],\"areaId\":[\"sdf\"],\"status\":[\"0\"]}', 'null', 1, 'nested exception is org.apache.ibatis.reflection.ReflectionException: There is no getter for property named \'commuIds\' in \'class com.pepper.project.csc.hospital.domain.Hospital\'', '2020-02-06 09:14:33');
INSERT INTO `sys_oper_log` VALUES (151, '医院介绍', 1, 'com.pepper.project.csc.hospital.controller.HospitalController.addSave()', 'POST', 1, 'admin', '研发部门', '/csc/hospital/add', '127.0.0.1', '内网IP', '{\"hosName\":[\"12\"],\"hosCode\":[\"12\"],\"introduction\":[\"\"],\"communityIds\":[\"12\"],\"areaId\":[\"12\"],\"status\":[\"0\"]}', 'null', 1, '\r\n### Error updating database.  Cause: java.sql.SQLSyntaxErrorException: Unknown column \'community_ids\' in \'field list\'\r\n### The error may involve com.pepper.project.csc.hospital.mapper.HospitalMapper.insertHospital-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into csc_hospital (    hos_name,      hos_code,          community_ids,      area_id,      status,      create_by,     update_by,    create_time,   update_time   )values(    ?,      ?,          ?,      ?,      status,      ?,     ?,    sysdate(),   sysdate()   )\r\n### Cause: java.sql.SQLSyntaxErrorException: Unknown column \'community_ids\' in \'field list\'\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: Unknown column \'community_ids\' in \'field list\'', '2020-02-06 09:18:17');
INSERT INTO `sys_oper_log` VALUES (152, '医院介绍', 1, 'com.pepper.project.csc.hospital.controller.HospitalController.addSave()', 'POST', 1, 'admin', '研发部门', '/csc/hospital/add', '127.0.0.1', '内网IP', '{\"hosName\":[\"12\"],\"hosCode\":[\"12\"],\"introduction\":[\"\"],\"communityIds\":[\"12\"],\"areaId\":[\"12\"],\"status\":[\"0\"]}', 'null', 1, '\r\n### Error updating database.  Cause: java.sql.SQLSyntaxErrorException: Unknown column \'community_ids\' in \'field list\'\r\n### The error may involve com.pepper.project.csc.hospital.mapper.HospitalMapper.insertHospital-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into csc_hospital (    hos_name,      hos_code,          community_ids,      area_id,      status,      create_by,     update_by,    create_time,   update_time   )values(    ?,      ?,          ?,      ?,      status,      ?,     ?,    sysdate(),   sysdate()   )\r\n### Cause: java.sql.SQLSyntaxErrorException: Unknown column \'community_ids\' in \'field list\'\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: Unknown column \'community_ids\' in \'field list\'', '2020-02-06 09:18:24');
INSERT INTO `sys_oper_log` VALUES (153, '医院介绍', 1, 'com.pepper.project.csc.hospital.controller.HospitalController.addSave()', 'POST', 1, 'admin', '研发部门', '/csc/hospital/add', '127.0.0.1', '内网IP', '{\"hosName\":[\"dsf\"],\"hosCode\":[\"sdf\"],\"introduction\":[\"\"],\"communityIds\":[\"sdf\"],\"areaId\":[\"sf\"],\"status\":[\"0\"]}', 'null', 1, '\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'ID\' doesn\'t have a default value\r\n### The error may involve com.pepper.project.csc.hospital.mapper.HospitalMapper.insertHospital-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into csc_hospital (    hos_name,      hos_code,          community_ids,      area_id,      status,      create_by,     update_by,    create_time,   update_time   )values(    ?,      ?,          ?,      ?,      status,      ?,     ?,    sysdate(),   sysdate()   )\r\n### Cause: java.sql.SQLException: Field \'ID\' doesn\'t have a default value\n; Field \'ID\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'ID\' doesn\'t have a default value', '2020-02-06 09:19:15');
INSERT INTO `sys_oper_log` VALUES (154, '医院介绍', 1, 'com.pepper.project.csc.hospital.controller.HospitalController.addSave()', 'POST', 1, 'admin', '研发部门', '/csc/hospital/add', '127.0.0.1', '内网IP', '{\"hosName\":[\"dsf\"],\"hosCode\":[\"sdf\"],\"introduction\":[\"\"],\"communityIds\":[\"sdf\"],\"areaId\":[\"sf\"],\"status\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-06 09:19:56');
INSERT INTO `sys_oper_log` VALUES (155, '医院介绍', 3, 'com.pepper.project.csc.hospital.controller.HospitalController.remove()', 'POST', 1, 'admin', '研发部门', '/csc/hospital/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-06 09:23:41');
INSERT INTO `sys_oper_log` VALUES (156, '医院介绍', 1, 'com.pepper.project.csc.hospital.controller.HospitalController.addSave()', 'POST', 1, 'admin', '研发部门', '/csc/hospital/add', '127.0.0.1', '内网IP', '{\"hosName\":[\"1222\"],\"hosCode\":[\"211221212\"],\"introduction\":[\"\"],\"communityIds\":[\"221\"],\"areaId\":[\"12212112\"],\"status\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-06 09:23:48');
INSERT INTO `sys_oper_log` VALUES (157, '医院介绍', 1, 'com.pepper.project.csc.hospital.controller.HospitalController.addSave()', 'POST', 1, 'admin', '研发部门', '/csc/hospital/add', '127.0.0.1', '内网IP', '{\"hosName\":[\"sdfs\"],\"hosCode\":[\"fsdf\"],\"introduction\":[\"\"],\"communityIds\":[\"fsdf\"],\"areaId\":[\"sdfds\"],\"status\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-06 09:25:35');
INSERT INTO `sys_oper_log` VALUES (158, '医院介绍', 3, 'com.pepper.project.csc.hospital.controller.HospitalController.remove()', 'POST', 1, 'admin', '研发部门', '/csc/hospital/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-06 12:11:13');
INSERT INTO `sys_oper_log` VALUES (159, '医院介绍', 1, 'com.pepper.project.csc.hospital.controller.HospitalController.addSave()', 'POST', 1, 'admin', '研发部门', '/csc/hospital/add', '127.0.0.1', '内网IP', '{\"hosName\":[\"1111\"],\"hosCode\":[\"11112222\"],\"introduction\":[\"\"],\"communityIds\":[\"12\"],\"areaId\":[\"12\"],\"status\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-06 12:11:26');
INSERT INTO `sys_oper_log` VALUES (160, '医院介绍', 2, 'com.pepper.project.csc.hospital.controller.HospitalController.editSave()', 'POST', 1, 'admin', '研发部门', '/csc/hospital/edit', '127.0.0.1', '内网IP', '{\"id\":[\"2\"],\"hosName\":[\"1111\"],\"hosCode\":[\"11112222\"],\"introduction\":[\"\"],\"communityIds\":[\"12\"],\"areaId\":[\"12\"],\"status\":[\"0\"]}', 'null', 1, 'nested exception is org.apache.ibatis.reflection.ReflectionException: There is no getter for property named \'areaCode\' in \'class com.pepper.project.csc.hospital.domain.Hospital\'', '2020-02-06 12:16:20');
INSERT INTO `sys_oper_log` VALUES (161, '医院介绍', 2, 'com.pepper.project.csc.hospital.controller.HospitalController.editSave()', 'POST', 1, 'admin', '研发部门', '/csc/hospital/edit', '127.0.0.1', '内网IP', '{\"id\":[\"2\"],\"hosName\":[\"1111\"],\"hosCode\":[\"11112222\"],\"introduction\":[\"\"],\"communityIds\":[\"12\"],\"areaId\":[\"12\"],\"status\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-06 12:18:45');
INSERT INTO `sys_oper_log` VALUES (162, '医院介绍', 2, 'com.pepper.project.csc.hospital.controller.HospitalController.editSave()', 'POST', 1, 'admin', '研发部门', '/csc/hospital/edit', '127.0.0.1', '内网IP', '{\"id\":[\"2\"],\"hosName\":[\"1111\"],\"hosCode\":[\"11112222\"],\"introduction\":[\"\"],\"communityIds\":[\"12\"],\"areaId\":[\"12\"],\"status\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-06 12:20:10');
INSERT INTO `sys_oper_log` VALUES (163, '医院介绍', 2, 'com.pepper.project.csc.hospital.controller.HospitalController.editSave()', 'POST', 1, 'admin', '研发部门', '/csc/hospital/edit', '127.0.0.1', '内网IP', '{\"id\":[\"2\"],\"hosName\":[\"1111\"],\"hosCode\":[\"11112222\"],\"introduction\":[\"90909\"],\"communityIds\":[\"12\"],\"areaId\":[\"12\"],\"status\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-06 12:28:43');
INSERT INTO `sys_oper_log` VALUES (164, '医院介绍', 2, 'com.pepper.project.csc.hospital.controller.HospitalController.editSave()', 'POST', 1, 'admin', '研发部门', '/csc/hospital/edit', '127.0.0.1', '内网IP', '{\"id\":[\"2\"],\"hosName\":[\"1111\"],\"hosCode\":[\"11112222\"],\"introduction\":[\"<span style=\\\"font-size: 18px; background-color: rgb(255, 231, 156);\\\">90909</span>\"],\"communityIds\":[\"12\"],\"areaId\":[\"12\"],\"status\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-06 12:28:59');
INSERT INTO `sys_oper_log` VALUES (165, '菜单管理', 1, 'com.pepper.project.system.menu.controller.MenuController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"1071\"],\"menuType\":[\"F\"],\"menuName\":[\"医院查询\"],\"url\":[\"\"],\"target\":[\"menuItem\"],\"perms\":[\"csc:hospital:view\"],\"orderNum\":[\"1\"],\"icon\":[\"\"],\"visible\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-06 12:56:01');
INSERT INTO `sys_oper_log` VALUES (166, '菜单管理', 1, 'com.pepper.project.system.menu.controller.MenuController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"1072\"],\"menuType\":[\"F\"],\"menuName\":[\"医院新增\"],\"url\":[\"\"],\"target\":[\"menuItem\"],\"perms\":[\"csc:hospital:add\"],\"orderNum\":[\"2\"],\"icon\":[\"\"],\"visible\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-06 12:56:24');
INSERT INTO `sys_oper_log` VALUES (167, '菜单管理', 3, 'com.pepper.project.system.menu.controller.MenuController.remove()', 'GET', 1, 'admin', '研发部门', '/system/menu/remove/1073', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-06 12:56:31');
INSERT INTO `sys_oper_log` VALUES (168, '菜单管理', 1, 'com.pepper.project.system.menu.controller.MenuController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"1071\"],\"menuType\":[\"F\"],\"menuName\":[\"医院新增\"],\"url\":[\"\"],\"target\":[\"menuItem\"],\"perms\":[\"csc:hospital:add\"],\"orderNum\":[\"2\"],\"icon\":[\"\"],\"visible\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-06 12:56:53');
INSERT INTO `sys_oper_log` VALUES (169, '菜单管理', 1, 'com.pepper.project.system.menu.controller.MenuController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"1071\"],\"menuType\":[\"F\"],\"menuName\":[\"医院修改\"],\"url\":[\"\"],\"target\":[\"menuItem\"],\"perms\":[\"csc:hospital:edit\"],\"orderNum\":[\"3\"],\"icon\":[\"\"],\"visible\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-06 12:57:20');
INSERT INTO `sys_oper_log` VALUES (170, '菜单管理', 1, 'com.pepper.project.system.menu.controller.MenuController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"1071\"],\"menuType\":[\"F\"],\"menuName\":[\"医院删除\"],\"url\":[\"\"],\"target\":[\"menuItem\"],\"perms\":[\"csc:hospital:delete\"],\"orderNum\":[\"4\"],\"icon\":[\"\"],\"visible\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-06 12:57:36');
INSERT INTO `sys_oper_log` VALUES (171, '医院介绍', 2, 'com.pepper.project.csc.hospital.controller.HospitalController.editSave()', 'POST', 1, 'admin', '研发部门', '/csc/hospital/edit', '127.0.0.1', '内网IP', '{\"id\":[\"2\"],\"hosName\":[\"1111\"],\"hosCode\":[\"11112222\"],\"introduction\":[\"<span style=\\\"font-size: 18px; background-color: rgb(255, 231, 156);\\\">90909</span>\"],\"communityIds\":[\"12\"],\"areaId\":[\"12\"],\"status\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-06 13:11:58');
INSERT INTO `sys_oper_log` VALUES (172, '医院介绍', 2, 'com.pepper.project.csc.hospital.controller.HospitalController.editSave()', 'POST', 1, 'admin', '研发部门', '/csc/hospital/edit', '127.0.0.1', '内网IP', '{\"id\":[\"2\"],\"hosName\":[\"天山花园快乐社区医院\"],\"hosCode\":[\"sky_mountain_happy_hospital\"],\"introduction\":[\"<span style=\\\"font-size: 18px; background-color: rgb(255, 231, 156);\\\">90909</span>\"],\"communityIds\":[\"12\"],\"areaId\":[\"12\"],\"status\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-06 13:13:52');
INSERT INTO `sys_oper_log` VALUES (173, '代码生成', 6, 'com.pepper.project.tool.gen.controller.GenController.importTableSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":[\"csc_hospital\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-06 13:21:52');
INSERT INTO `sys_oper_log` VALUES (174, '区域设置', 2, 'com.pepper.project.csc.area.controller.AreaController.editSave()', 'POST', 1, 'admin', '研发部门', '/csc/area/edit', '127.0.0.1', '内网IP', '{\"id\":[\"4\"],\"areaCode\":[\"ts\"],\"areaName\":[\"天山区\"],\"coordinate\":[\"87.65990,43.78007\"],\"status\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-10 14:35:49');
INSERT INTO `sys_oper_log` VALUES (175, '医院介绍', 1, 'com.pepper.project.csc.hospital.controller.HospitalController.addSave()', 'POST', 1, 'admin', '研发部门', '/csc/hospital/add', '127.0.0.1', '内网IP', '{\"hosName\":[\"11\"],\"hosCode\":[\"111\"],\"introduction\":[\"<p><u><b style=\\\"background-color: rgb(165, 198, 206);\\\"><span style=\\\"font-size: 18px;\\\">1111</span></b></u></p>\"],\"communityIds\":[\"1\"],\"areaId\":[\"1\"],\"status\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-10 14:36:38');
INSERT INTO `sys_oper_log` VALUES (176, '医院介绍', 3, 'com.pepper.project.csc.hospital.controller.HospitalController.remove()', 'POST', 1, 'admin', '研发部门', '/csc/hospital/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"3\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-10 14:36:59');
INSERT INTO `sys_oper_log` VALUES (177, '个人信息', 2, 'com.pepper.project.system.user.controller.ProfileController.updateAvatar()', 'POST', 1, 'admin', '研发部门', '/system/user/profile/updateAvatar', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-11 04:38:31');
INSERT INTO `sys_oper_log` VALUES (178, '个人信息', 2, 'com.pepper.project.system.user.controller.ProfileController.update()', 'POST', 1, 'admin', '研发部门', '/system/user/profile/update', '127.0.0.1', '内网IP', '{\"id\":[\"\"],\"userName\":[\"若依\"],\"phonenumber\":[\"15888888888\"],\"email\":[\"ry@163.com\"],\"sex\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-11 04:38:37');
INSERT INTO `sys_oper_log` VALUES (179, '医院介绍', 1, 'com.pepper.project.csc.hospital.controller.HospitalController.addSave()', 'POST', 1, 'admin', '研发部门', '/csc/hospital/add', '127.0.0.1', '内网IP', '{\"hosName\":[\"顶顶顶顶\"],\"hosCode\":[\"顶顶顶顶\"],\"introduction\":[\"<p>顶顶顶</p>\"],\"status\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-11 04:58:43');
INSERT INTO `sys_oper_log` VALUES (180, '医院介绍', 1, 'com.pepper.project.csc.hospital.controller.HospitalController.addSave()', 'POST', 1, 'admin', '研发部门', '/csc/hospital/add', '127.0.0.1', '内网IP', '{\"hosName\":[\"dddd\"],\"hosCode\":[\"ddd\"],\"introduction\":[\"<p>ddfdsfdf</p>\"],\"communityIds\":[\"3\",\"4\"],\"area\":[\"3\"],\"status\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-11 06:47:26');
INSERT INTO `sys_oper_log` VALUES (181, '医院介绍', 1, 'com.pepper.project.csc.hospital.controller.HospitalController.addSave()', 'POST', 1, 'admin', '研发部门', '/csc/hospital/add', '127.0.0.1', '内网IP', '{\"hosName\":[\"fsdf\"],\"hosCode\":[\"fsdfs\"],\"introduction\":[\"<p>fsdfs</p>\"],\"communityIds\":[\"3\",\"4\"],\"area\":[\"3\"],\"status\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-11 06:48:08');
INSERT INTO `sys_oper_log` VALUES (182, '医院介绍', 2, 'com.pepper.project.csc.hospital.controller.HospitalController.editSave()', 'POST', 1, 'admin', '研发部门', '/csc/hospital/edit', '127.0.0.1', '内网IP', '{\"id\":[\"2\"],\"hosName\":[\"天山花园快乐社区医院\"],\"hosCode\":[\"sky_mountain_happy_hospital\"],\"introduction\":[\"<span style=\\\"font-size: 18px; background-color: rgb(255, 231, 156);\\\">90909</span>\"],\"communityIds\":[\"12\"],\"areaId\":[\"121\"],\"status\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-11 07:03:10');
INSERT INTO `sys_oper_log` VALUES (183, '医院介绍', 1, 'com.pepper.project.csc.hospital.controller.HospitalController.addSave()', 'POST', 1, 'admin', '研发部门', '/csc/hospital/add', '127.0.0.1', '内网IP', '{\"hosName\":[\"fd\"],\"hosCode\":[\"dfd\"],\"introduction\":[\"<p><br></p>\"],\"communityIds\":[\"3\"],\"areaId\":[\"3\"],\"status\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-11 07:04:54');
INSERT INTO `sys_oper_log` VALUES (184, '医院介绍', 2, 'com.pepper.project.csc.hospital.controller.HospitalController.editSave()', 'POST', 1, 'admin', '研发部门', '/csc/hospital/edit', '127.0.0.1', '内网IP', '{\"id\":[\"6\"],\"hosName\":[\"fd\"],\"hosCode\":[\"dfd\"],\"introduction\":[\"<p>dfsdfsdf</p>\"],\"communityIds\":[\"4\"],\"areaId\":[\"3\"],\"status\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-11 07:13:35');
INSERT INTO `sys_oper_log` VALUES (185, '医院介绍', 2, 'com.pepper.project.csc.hospital.controller.HospitalController.editSave()', 'POST', 1, 'admin', '研发部门', '/csc/hospital/edit', '127.0.0.1', '内网IP', '{\"id\":[\"6\"],\"hosName\":[\"fd\"],\"hosCode\":[\"dfd\"],\"introduction\":[\"<p>dfsdfsdf</p>\"],\"communityIds\":[\"3\",\"4\"],\"areaId\":[\"3\"],\"status\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-11 07:17:43');
INSERT INTO `sys_oper_log` VALUES (186, '医院介绍', 2, 'com.pepper.project.csc.hospital.controller.HospitalController.editSave()', 'POST', 1, 'admin', '研发部门', '/csc/hospital/edit', '127.0.0.1', '内网IP', '{\"id\":[\"6\"],\"hosName\":[\"fd\"],\"hosCode\":[\"dfd\"],\"introduction\":[\"<p>dfsdfsdf</p>\"],\"communityIds\":[\"3\",\"4\"],\"areaId\":[\"3\"],\"status\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-11 07:50:06');
INSERT INTO `sys_oper_log` VALUES (187, '医院介绍', 2, 'com.pepper.project.csc.hospital.controller.HospitalController.editSave()', 'POST', 1, 'admin', '研发部门', '/csc/hospital/edit', '127.0.0.1', '内网IP', '{\"id\":[\"6\"],\"hosName\":[\"fd\"],\"hosCode\":[\"dfd\"],\"introduction\":[\"<p>dfsdfsdf</p>\"],\"communityIds\":[\"3\"],\"areaId\":[\"3\"],\"status\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-11 07:50:15');
INSERT INTO `sys_oper_log` VALUES (188, '医院介绍', 2, 'com.pepper.project.csc.hospital.controller.HospitalController.editSave()', 'POST', 1, 'admin', '研发部门', '/csc/hospital/edit', '127.0.0.1', '内网IP', '{\"id\":[\"6\"],\"hosName\":[\"fd\"],\"hosCode\":[\"dfd\"],\"introduction\":[\"<p>dfsdfsdf</p>\"],\"communityIds\":[\"3\",\"4\"],\"areaId\":[\"3\"],\"status\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-11 08:16:12');
INSERT INTO `sys_oper_log` VALUES (189, '医院介绍', 2, 'com.pepper.project.csc.hospital.controller.HospitalController.editSave()', 'POST', 1, 'admin', '研发部门', '/csc/hospital/edit', '127.0.0.1', '内网IP', '{\"id\":[\"6\"],\"hosName\":[\"fd\"],\"hosCode\":[\"dfd\"],\"introduction\":[\"<p>dfsdfsdf</p>\"],\"communityIds\":[\"3\",\"4\"],\"areaId\":[\"3\"],\"status\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-11 08:16:40');
INSERT INTO `sys_oper_log` VALUES (190, '医院介绍', 2, 'com.pepper.project.csc.hospital.controller.HospitalController.editSave()', 'POST', 1, 'admin', '研发部门', '/csc/hospital/edit', '127.0.0.1', '内网IP', '{\"id\":[\"6\"],\"hosName\":[\"fd\"],\"hosCode\":[\"dfd\"],\"introduction\":[\"<p>dfsdfsdf</p>\"],\"communityIds\":[\"3\"],\"areaId\":[\"3\"],\"status\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-11 08:17:45');
INSERT INTO `sys_oper_log` VALUES (191, '医院介绍', 2, 'com.pepper.project.csc.hospital.controller.HospitalController.editSave()', 'POST', 1, 'admin', '研发部门', '/csc/hospital/edit', '127.0.0.1', '内网IP', '{\"id\":[\"6\"],\"hosName\":[\"fd\"],\"hosCode\":[\"dfd\"],\"introduction\":[\"<p>dfsdfsdf</p>\"],\"communityIds\":[\"3\"],\"areaId\":[\"3\"],\"status\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-11 08:18:56');
INSERT INTO `sys_oper_log` VALUES (192, '医院介绍', 2, 'com.pepper.project.csc.hospital.controller.HospitalController.editSave()', 'POST', 1, 'admin', '研发部门', '/csc/hospital/edit', '127.0.0.1', '内网IP', '{\"id\":[\"6\"],\"hosName\":[\"fd\"],\"hosCode\":[\"dfd\"],\"introduction\":[\"<p>dfsdfsdf</p>\"],\"communityIds\":[\"3\"],\"areaId\":[\"3\"],\"status\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-11 08:19:00');
INSERT INTO `sys_oper_log` VALUES (193, '医院介绍', 2, 'com.pepper.project.csc.hospital.controller.HospitalController.editSave()', 'POST', 1, 'admin', '研发部门', '/csc/hospital/edit', '127.0.0.1', '内网IP', '{\"id\":[\"6\"],\"hosName\":[\"fd\"],\"hosCode\":[\"dfd\"],\"introduction\":[\"<p>dfsdfsdf</p>\"],\"communityIds\":[\"3\",\"4\"],\"areaId\":[\"3\"],\"status\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-11 08:19:04');
INSERT INTO `sys_oper_log` VALUES (194, '医院介绍', 2, 'com.pepper.project.csc.hospital.controller.HospitalController.editSave()', 'POST', 1, 'admin', '研发部门', '/csc/hospital/edit', '127.0.0.1', '内网IP', '{\"id\":[\"6\"],\"hosName\":[\"fd\"],\"hosCode\":[\"dfd\"],\"introduction\":[\"<p>dfsdfsdf</p>\"],\"communityIds\":[\"3\"],\"areaId\":[\"3\"],\"status\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-11 08:23:21');
INSERT INTO `sys_oper_log` VALUES (195, '医院介绍', 2, 'com.pepper.project.csc.hospital.controller.HospitalController.editSave()', 'POST', 1, 'admin', '研发部门', '/csc/hospital/edit', '127.0.0.1', '内网IP', '{\"id\":[\"6\"],\"hosName\":[\"fd\"],\"hosCode\":[\"dfd\"],\"introduction\":[\"<p>dfsdfsdf</p>\"],\"communityIds\":[\"4\"],\"areaId\":[\"3\"],\"status\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-11 08:23:28');
INSERT INTO `sys_oper_log` VALUES (196, '医院介绍', 2, 'com.pepper.project.csc.hospital.controller.HospitalController.editSave()', 'POST', 1, 'admin', '研发部门', '/csc/hospital/edit', '127.0.0.1', '内网IP', '{\"id\":[\"2\"],\"hosName\":[\"天山花园快乐社区医院\"],\"hosCode\":[\"sky_mountain_happy_hospital\"],\"introduction\":[\"<span style=\\\"font-size: 18px; background-color: rgb(255, 231, 156);\\\">90909</span>\"],\"communityIds\":[\"3\"],\"areaId\":[\"3\"],\"status\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-11 08:23:41');
INSERT INTO `sys_oper_log` VALUES (197, '医院介绍', 2, 'com.pepper.project.csc.hospital.controller.HospitalController.editSave()', 'POST', 1, 'admin', '研发部门', '/csc/hospital/edit', '127.0.0.1', '内网IP', '{\"id\":[\"4\"],\"hosName\":[\"dddd\"],\"hosCode\":[\"ddd\"],\"introduction\":[\"<p>ddfdsfdf</p>\"],\"communityIds\":[\"3\",\"4\"],\"areaId\":[\"3\"],\"status\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-11 08:23:46');
INSERT INTO `sys_oper_log` VALUES (198, '医院介绍', 3, 'com.pepper.project.csc.hospital.controller.HospitalController.remove()', 'POST', 1, 'admin', '研发部门', '/csc/hospital/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"4\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-11 08:23:55');
INSERT INTO `sys_oper_log` VALUES (199, '医院介绍', 3, 'com.pepper.project.csc.hospital.controller.HospitalController.remove()', 'POST', 1, 'admin', '研发部门', '/csc/hospital/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"3\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-11 08:23:57');
INSERT INTO `sys_oper_log` VALUES (200, '医院介绍', 3, 'com.pepper.project.csc.hospital.controller.HospitalController.remove()', 'POST', 1, 'admin', '研发部门', '/csc/hospital/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"5\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-11 08:24:00');
INSERT INTO `sys_oper_log` VALUES (201, '医院介绍', 2, 'com.pepper.project.csc.hospital.controller.HospitalController.editSave()', 'POST', 1, 'admin', '研发部门', '/csc/hospital/edit', '127.0.0.1', '内网IP', '{\"id\":[\"2\"],\"hosName\":[\"天山花园快乐社区医院\"],\"hosCode\":[\"sky_mountain_happy_hospital\"],\"introduction\":[\"<span style=\\\"font-size: 18px; background-color: rgb(255, 231, 156);\\\">90909</span>\"],\"communityIds\":[\"3\",\"4\"],\"areaId\":[\"3\"],\"status\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-11 08:24:07');
INSERT INTO `sys_oper_log` VALUES (202, '医院介绍', 2, 'com.pepper.project.csc.hospital.controller.HospitalController.editSave()', 'POST', 1, 'admin', '研发部门', '/csc/hospital/edit', '127.0.0.1', '内网IP', '{\"id\":[\"2\"],\"hosName\":[\"天山花园快乐社区医院\"],\"hosCode\":[\"sky_mountain_happy_hospital\"],\"introduction\":[\"<span style=\\\"font-size: 18px; background-color: rgb(255, 231, 156);\\\">90909</span>\"],\"communityIds\":[\"3\",\"4\"],\"areaId\":[\"3\"],\"status\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-11 08:24:14');
INSERT INTO `sys_oper_log` VALUES (203, '医院介绍', 2, 'com.pepper.project.csc.hospital.controller.HospitalController.editSave()', 'POST', 1, 'admin', '研发部门', '/csc/hospital/edit', '127.0.0.1', '内网IP', '{\"id\":[\"6\"],\"hosName\":[\"fd\"],\"hosCode\":[\"dfd\"],\"introduction\":[\"<p>dfsdfsdf</p>\"],\"communityIds\":[\"3\",\"4\"],\"areaId\":[\"3\"],\"status\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-11 08:39:30');
INSERT INTO `sys_oper_log` VALUES (204, '医院介绍', 2, 'com.pepper.project.csc.hospital.controller.HospitalController.editSave()', 'POST', 1, 'admin', '研发部门', '/csc/hospital/edit', '127.0.0.1', '内网IP', '{\"id\":[\"2\"],\"hosName\":[\"天山花园快乐社区医院\"],\"hosCode\":[\"sky garden happy hospital\"],\"introduction\":[\"<span style=\\\"font-size: 18px; background-color: rgb(255, 231, 156);\\\">90909</span>\"],\"communityIds\":[\"3\",\"4\"],\"areaId\":[\"3\"],\"status\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-11 08:41:56');
INSERT INTO `sys_oper_log` VALUES (205, '医院介绍', 2, 'com.pepper.project.csc.hospital.controller.HospitalController.editSave()', 'POST', 1, 'admin', '研发部门', '/csc/hospital/edit', '127.0.0.1', '内网IP', '{\"id\":[\"6\"],\"hosName\":[\"沙依巴克区红十月社区健康医院\"],\"hosCode\":[\"sybk red month community hospital\"],\"introduction\":[\"这是一家社区医院，提供基础的医疗救助服务！\"],\"communityIds\":[\"3\",\"4\"],\"areaId\":[\"3\"],\"status\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-11 08:43:59');
INSERT INTO `sys_oper_log` VALUES (206, '医院介绍', 2, 'com.pepper.project.csc.hospital.controller.HospitalController.editSave()', 'POST', 1, 'admin', '研发部门', '/csc/hospital/edit', '127.0.0.1', '内网IP', '{\"id\":[\"6\"],\"hosName\":[\"沙依巴克区红十月社区健康医院\"],\"hosCode\":[\"sybk red month community hospital\"],\"introduction\":[\"这是一家社区医院，提供基础的医疗救助服务！\"],\"communityIds\":[\"3\",\"4\"],\"areaId\":[\"3\"],\"status\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-12 13:12:40');
INSERT INTO `sys_oper_log` VALUES (207, '菜单管理', 1, 'com.pepper.project.system.menu.controller.MenuController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"1066\"],\"menuType\":[\"C\"],\"menuName\":[\"医疗项目\"],\"url\":[\"/csc/medicalProject\"],\"target\":[\"menuItem\"],\"perms\":[\"csc:medical:view\"],\"orderNum\":[\"3\"],\"icon\":[\"fa fa-crosshairs\"],\"visible\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-12 14:04:59');
INSERT INTO `sys_oper_log` VALUES (208, '菜单管理', 3, 'com.pepper.project.system.menu.controller.MenuController.remove()', 'GET', 1, 'admin', '研发部门', '/system/menu/remove/1077', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-12 14:05:24');
INSERT INTO `sys_oper_log` VALUES (209, '菜单管理', 2, 'com.pepper.project.system.menu.controller.MenuController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"1072\"],\"parentId\":[\"1071\"],\"menuType\":[\"F\"],\"menuName\":[\"医院查询\"],\"url\":[\"#\"],\"target\":[\"menuItem\"],\"perms\":[\"csc:hospital:list\"],\"orderNum\":[\"1\"],\"icon\":[\"#\"],\"visible\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-12 14:06:54');
INSERT INTO `sys_oper_log` VALUES (210, '菜单管理', 1, 'com.pepper.project.system.menu.controller.MenuController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"1065\"],\"menuType\":[\"C\"],\"menuName\":[\"医疗项目\"],\"url\":[\"/csc/medicalProject\"],\"target\":[\"menuItem\"],\"perms\":[\"csc:medical:view\"],\"orderNum\":[\"3\"],\"icon\":[\"fa fa-asl-interpreting\"],\"visible\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-12 14:07:57');
INSERT INTO `sys_oper_log` VALUES (211, '菜单管理', 2, 'com.pepper.project.system.menu.controller.MenuController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"1078\"],\"parentId\":[\"1065\"],\"menuType\":[\"C\"],\"menuName\":[\"医疗项目\"],\"url\":[\"/csc/medical\"],\"target\":[\"menuItem\"],\"perms\":[\"csc:medical:view\"],\"orderNum\":[\"3\"],\"icon\":[\"fa fa-asl-interpreting\"],\"visible\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-12 14:18:30');
INSERT INTO `sys_oper_log` VALUES (212, '菜单管理', 1, 'com.pepper.project.system.menu.controller.MenuController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"1078\"],\"menuType\":[\"F\"],\"menuName\":[\"医疗项目查询\"],\"url\":[\"/\"],\"target\":[\"menuItem\"],\"perms\":[\"csc:medical:list\"],\"orderNum\":[\"1\"],\"icon\":[\"\"],\"visible\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-13 07:51:09');
INSERT INTO `sys_oper_log` VALUES (213, '菜单管理', 2, 'com.pepper.project.system.menu.controller.MenuController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"1079\"],\"parentId\":[\"1078\"],\"menuType\":[\"F\"],\"menuName\":[\"医疗项目查询\"],\"url\":[\"/\"],\"target\":[\"menuItem\"],\"perms\":[\"csc:medical:list\"],\"orderNum\":[\"1\"],\"icon\":[\"#\"],\"visible\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-13 08:08:47');
INSERT INTO `sys_oper_log` VALUES (214, '菜单管理', 2, 'com.pepper.project.system.menu.controller.MenuController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"1079\"],\"parentId\":[\"1078\"],\"menuType\":[\"F\"],\"menuName\":[\"医疗项目查询\"],\"url\":[\"\"],\"target\":[\"menuItem\"],\"perms\":[\"csc:medical:list\"],\"orderNum\":[\"1\"],\"icon\":[\"#\"],\"visible\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-13 08:09:05');
INSERT INTO `sys_oper_log` VALUES (215, '菜单管理', 3, 'com.pepper.project.system.menu.controller.MenuController.remove()', 'GET', 1, 'admin', '研发部门', '/system/menu/remove/1079', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-13 08:09:16');
INSERT INTO `sys_oper_log` VALUES (216, '菜单管理', 1, 'com.pepper.project.system.menu.controller.MenuController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"1078\"],\"menuType\":[\"F\"],\"menuName\":[\"医疗项目查询\"],\"url\":[\"\"],\"target\":[\"menuItem\"],\"perms\":[\"csc:medical:list\"],\"orderNum\":[\"1\"],\"icon\":[\"\"],\"visible\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-13 08:09:51');
INSERT INTO `sys_oper_log` VALUES (217, '菜单管理', 1, 'com.pepper.project.system.menu.controller.MenuController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"1078\"],\"menuType\":[\"F\"],\"menuName\":[\"医疗项目新增\"],\"url\":[\"\"],\"target\":[\"menuItem\"],\"perms\":[\"csc:medical:add\"],\"orderNum\":[\"2\"],\"icon\":[\"\"],\"visible\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-13 08:10:17');
INSERT INTO `sys_oper_log` VALUES (218, '菜单管理', 1, 'com.pepper.project.system.menu.controller.MenuController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"1078\"],\"menuType\":[\"F\"],\"menuName\":[\"医疗项目编辑\"],\"url\":[\"\"],\"target\":[\"menuItem\"],\"perms\":[\"csc:medical:edit\"],\"orderNum\":[\"3\"],\"icon\":[\"\"],\"visible\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-13 08:10:43');
INSERT INTO `sys_oper_log` VALUES (219, '菜单管理', 1, 'com.pepper.project.system.menu.controller.MenuController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"1078\"],\"menuType\":[\"F\"],\"menuName\":[\"医疗项目删除\"],\"url\":[\"\"],\"target\":[\"menuItem\"],\"perms\":[\"csc:medical:delete\"],\"orderNum\":[\"4\"],\"icon\":[\"\"],\"visible\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-13 08:11:17');
INSERT INTO `sys_oper_log` VALUES (220, '医疗项目', 1, 'com.pepper.project.csc.medical.controller.MedicalController.addSave()', 'POST', 1, 'admin', '研发部门', '/csc/medical/add', '127.0.0.1', '内网IP', '{\"name\":[\"eeeeee\"],\"serviceContent\":[\"eeeee\"],\"price\":[\"eeeeeeee\"],\"status\":[\"0\"]}', 'null', 1, '\r\n### Error updating database.  Cause: java.sql.SQLSyntaxErrorException: Unknown column \'create_by\' in \'field list\'\r\n### The error may involve com.pepper.project.csc.medical.mapper.MedicalProjectMapper.insertMedicalProject-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into csc_medical_project (    name,      service_content,      price,      status,      create_by,     update_by,    create_time,   update_time   )values(    ?,      ?,      ?,      status,      ?,     ?,    sysdate(),   sysdate()   )\r\n### Cause: java.sql.SQLSyntaxErrorException: Unknown column \'create_by\' in \'field list\'\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: Unknown column \'create_by\' in \'field list\'', '2020-02-13 08:40:50');
INSERT INTO `sys_oper_log` VALUES (221, '医疗项目', 1, 'com.pepper.project.csc.medical.controller.MedicalController.addSave()', 'POST', 1, 'admin', '研发部门', '/csc/medical/add', '127.0.0.1', '内网IP', '{\"name\":[\"eeeeee\"],\"serviceContent\":[\"eeeee\"],\"price\":[\"eeeeeeee\"],\"status\":[\"0\"]}', 'null', 1, '\r\n### Error updating database.  Cause: java.sql.SQLSyntaxErrorException: Unknown column \'create_by\' in \'field list\'\r\n### The error may involve com.pepper.project.csc.medical.mapper.MedicalProjectMapper.insertMedicalProject-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into csc_medical_project (    name,      service_content,      price,      status,      create_by,     update_by,    create_time,   update_time   )values(    ?,      ?,      ?,      status,      ?,     ?,    sysdate(),   sysdate()   )\r\n### Cause: java.sql.SQLSyntaxErrorException: Unknown column \'create_by\' in \'field list\'\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: Unknown column \'create_by\' in \'field list\'', '2020-02-13 08:45:18');
INSERT INTO `sys_oper_log` VALUES (222, '医疗项目', 1, 'com.pepper.project.csc.medical.controller.MedicalController.addSave()', 'POST', 1, 'admin', '研发部门', '/csc/medical/add', '127.0.0.1', '内网IP', '{\"name\":[\"eeeeee\"],\"serviceContent\":[\"eeeee\"],\"price\":[\"eeeeeeee\"],\"status\":[\"0\"]}', 'null', 1, '\r\n### Error updating database.  Cause: java.sql.SQLSyntaxErrorException: Unknown column \'create_by\' in \'field list\'\r\n### The error may involve com.pepper.project.csc.medical.mapper.MedicalProjectMapper.insertMedicalProject-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into csc_medical_project (    name,      service_content,      price,      status,      create_by,     update_by,    create_time,   update_time   )values(    ?,      ?,      ?,      status,      ?,     ?,    sysdate(),   sysdate()   )\r\n### Cause: java.sql.SQLSyntaxErrorException: Unknown column \'create_by\' in \'field list\'\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: Unknown column \'create_by\' in \'field list\'', '2020-02-13 08:45:54');
INSERT INTO `sys_oper_log` VALUES (223, '医疗项目', 1, 'com.pepper.project.csc.medical.controller.MedicalController.addSave()', 'POST', 1, 'admin', '研发部门', '/csc/medical/add', '127.0.0.1', '内网IP', '{\"name\":[\"eeeeee\"],\"serviceContent\":[\"eeeee\"],\"price\":[\"eeeeeeee\"],\"status\":[\"0\"]}', 'null', 1, '\r\n### Error updating database.  Cause: java.sql.SQLSyntaxErrorException: Unknown column \'create_by\' in \'field list\'\r\n### The error may involve com.pepper.project.csc.medical.mapper.MedicalProjectMapper.insertMedicalProject-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into csc_medical_project (    name,      service_content,      price,      status,      create_by,     update_by,    create_time,   update_time   )values(    ?,      ?,      ?,      status,      ?,     ?,    sysdate(),   sysdate()   )\r\n### Cause: java.sql.SQLSyntaxErrorException: Unknown column \'create_by\' in \'field list\'\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: Unknown column \'create_by\' in \'field list\'', '2020-02-13 08:46:16');
INSERT INTO `sys_oper_log` VALUES (224, '医疗项目', 1, 'com.pepper.project.csc.medical.controller.MedicalController.addSave()', 'POST', 1, 'admin', '研发部门', '/csc/medical/add', '127.0.0.1', '内网IP', '{\"name\":[\"111\"],\"serviceContent\":[\"wwwww\"],\"price\":[\"1223\"],\"status\":[\"0\"]}', 'null', 1, '\r\n### Error updating database.  Cause: java.sql.SQLSyntaxErrorException: Unknown column \'create_by\' in \'field list\'\r\n### The error may involve com.pepper.project.csc.medical.mapper.MedicalProjectMapper.insertMedicalProject-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into csc_medical_project (    name,      service_content,      price,      status,      create_by,     update_by,    create_time,   update_time   )values(    ?,      ?,      ?,      status,      ?,     ?,    sysdate(),   sysdate()   )\r\n### Cause: java.sql.SQLSyntaxErrorException: Unknown column \'create_by\' in \'field list\'\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: Unknown column \'create_by\' in \'field list\'', '2020-02-13 08:48:33');
INSERT INTO `sys_oper_log` VALUES (225, '医疗项目', 1, 'com.pepper.project.csc.medical.controller.MedicalController.addSave()', 'POST', 1, 'admin', '研发部门', '/csc/medical/add', '127.0.0.1', '内网IP', '{\"name\":[\"1212\"],\"serviceContent\":[\"1221211221\"],\"price\":[\"12221122\"],\"status\":[\"0\"]}', 'null', 1, '\r\n### Error updating database.  Cause: java.sql.SQLSyntaxErrorException: Unknown column \'create_by\' in \'field list\'\r\n### The error may involve com.pepper.project.csc.medical.mapper.MedicalProjectMapper.insertMedicalProject-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into csc_medical_project (    name,      service_content,      price,      status,      create_by,     update_by,    create_time,   update_time   )values(    ?,      ?,      ?,      ?,      ?,     ?,    sysdate(),   sysdate()   )\r\n### Cause: java.sql.SQLSyntaxErrorException: Unknown column \'create_by\' in \'field list\'\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: Unknown column \'create_by\' in \'field list\'', '2020-02-13 08:51:20');
INSERT INTO `sys_oper_log` VALUES (226, '医疗项目', 1, 'com.pepper.project.csc.medical.controller.MedicalController.addSave()', 'POST', 1, 'admin', '研发部门', '/csc/medical/add', '127.0.0.1', '内网IP', '{\"name\":[\"1212\"],\"serviceContent\":[\"1221211221\"],\"price\":[\"12221122\"],\"status\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-13 08:52:23');
INSERT INTO `sys_oper_log` VALUES (227, '医疗项目', 2, 'com.pepper.project.csc.medical.controller.MedicalController.editSave()', 'POST', 1, 'admin', '研发部门', '/csc/medical/edit', '127.0.0.1', '内网IP', '{\"id\":[\"1\"],\"name\":[\"1212\"],\"serviceContent\":[\"1221211221\"],\"price\":[\"12221122.00000000\"],\"status\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-13 09:03:40');
INSERT INTO `sys_oper_log` VALUES (228, '医疗项目', 2, 'com.pepper.project.csc.medical.controller.MedicalController.editSave()', 'POST', 1, 'admin', '研发部门', '/csc/medical/edit', '127.0.0.1', '内网IP', '{\"id\":[\"1\"],\"name\":[\"1212\"],\"serviceContent\":[\"1221211221\"],\"price\":[\"12\"],\"status\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-13 09:03:51');
INSERT INTO `sys_oper_log` VALUES (229, '医疗项目', 2, 'com.pepper.project.csc.medical.controller.MedicalController.editSave()', 'POST', 1, 'admin', '研发部门', '/csc/medical/edit', '127.0.0.1', '内网IP', '{\"id\":[\"1\"],\"name\":[\"1212\"],\"serviceContent\":[\"1221211221\"],\"price\":[\"12.00000000\"],\"status\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-13 09:07:03');
INSERT INTO `sys_oper_log` VALUES (230, '医疗项目', 3, 'com.pepper.project.csc.medical.controller.MedicalController.remove()', 'POST', 1, 'admin', '研发部门', '/csc/medical/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-13 09:11:57');
INSERT INTO `sys_oper_log` VALUES (231, '医疗项目', 1, 'com.pepper.project.csc.medical.controller.MedicalController.addSave()', 'POST', 1, 'admin', '研发部门', '/csc/medical/add', '127.0.0.1', '内网IP', '{\"name\":[\"djfifj\"],\"serviceContent\":[\"jdfjidsj\"],\"price\":[\"jijdfijds\"],\"status\":[\"0\"]}', 'null', 1, '\r\n### Error updating database.  Cause: java.sql.SQLException: Incorrect decimal value: \'jijdfijds\' for column \'PRICE\' at row 1\r\n### The error may involve com.pepper.project.csc.medical.mapper.MedicalProjectMapper.insertMedicalProject-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into csc_medical_project (    name,      service_content,      price,      status,      create_by,     update_by,    create_time,   update_time   )values(    ?,      ?,      ?,      ?,      ?,     ?,    sysdate(),   sysdate()   )\r\n### Cause: java.sql.SQLException: Incorrect decimal value: \'jijdfijds\' for column \'PRICE\' at row 1\n; uncategorized SQLException; SQL state [HY000]; error code [1366]; Incorrect decimal value: \'jijdfijds\' for column \'PRICE\' at row 1; nested exception is java.sql.SQLException: Incorrect decimal value: \'jijdfijds\' for column \'PRICE\' at row 1', '2020-02-13 09:31:10');
INSERT INTO `sys_oper_log` VALUES (232, '医疗项目', 1, 'com.pepper.project.csc.medical.controller.MedicalController.addSave()', 'POST', 1, 'admin', '研发部门', '/csc/medical/add', '127.0.0.1', '内网IP', '{\"name\":[\"djfifj\"],\"serviceContent\":[\"jdfjidsj\"],\"price\":[\"100\"],\"status\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-13 09:31:20');
INSERT INTO `sys_oper_log` VALUES (233, '菜单管理', 1, 'com.pepper.project.system.menu.controller.MenuController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"1065\"],\"menuType\":[\"C\"],\"menuName\":[\"医生管理\"],\"url\":[\"/csc/doctor\"],\"target\":[\"menuItem\"],\"perms\":[\"csc:doctor:view\"],\"orderNum\":[\"4\"],\"icon\":[\"fa fa-plus-circle\"],\"visible\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-13 09:41:43');
INSERT INTO `sys_oper_log` VALUES (234, '菜单管理', 1, 'com.pepper.project.system.menu.controller.MenuController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"1084\"],\"menuType\":[\"F\"],\"menuName\":[\"医生查询\"],\"url\":[\"\"],\"target\":[\"menuItem\"],\"perms\":[\"csc:doctor:list\"],\"orderNum\":[\"1\"],\"icon\":[\"\"],\"visible\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-13 10:10:56');
INSERT INTO `sys_oper_log` VALUES (235, '菜单管理', 1, 'com.pepper.project.system.menu.controller.MenuController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"1084\"],\"menuType\":[\"F\"],\"menuName\":[\"医生新增\"],\"url\":[\"\"],\"target\":[\"menuItem\"],\"perms\":[\"csc:doctor:add\"],\"orderNum\":[\"2\"],\"icon\":[\"\"],\"visible\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-13 10:12:02');
INSERT INTO `sys_oper_log` VALUES (236, '菜单管理', 1, 'com.pepper.project.system.menu.controller.MenuController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"1084\"],\"menuType\":[\"F\"],\"menuName\":[\"医生编辑\"],\"url\":[\"\"],\"target\":[\"menuItem\"],\"perms\":[\"csc:doctor:edit\"],\"orderNum\":[\"3\"],\"icon\":[\"\"],\"visible\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-13 10:12:28');
INSERT INTO `sys_oper_log` VALUES (237, '菜单管理', 1, 'com.pepper.project.system.menu.controller.MenuController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"1084\"],\"menuType\":[\"F\"],\"menuName\":[\"医生删除\"],\"url\":[\"\"],\"target\":[\"menuItem\"],\"perms\":[\"csc:doctor:delete\"],\"orderNum\":[\"4\"],\"icon\":[\"\"],\"visible\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-13 10:12:52');
INSERT INTO `sys_oper_log` VALUES (238, '医生管理', 1, 'com.pepper.project.csc.doctor.controller.DoctorController.addSave()', 'POST', 1, 'admin', '研发部门', '/csc/doctor/add', '127.0.0.1', '内网IP', '{\"doctorCode\":[\"10001\"],\"doctorName\":[\"hanjietao\"],\"majorField\":[\"小儿感冒\"],\"doctorType\":[\"1\"],\"hospitalId\":[\"2\"],\"status\":[\"0\"]}', 'null', 1, 'nested exception is org.apache.ibatis.reflection.ReflectionException: There is no getter for property named \'doctorField\' in \'class com.pepper.project.csc.doctor.domain.Doctor\'', '2020-02-13 12:36:00');
INSERT INTO `sys_oper_log` VALUES (239, '医生管理', 1, 'com.pepper.project.csc.doctor.controller.DoctorController.addSave()', 'POST', 1, 'admin', '研发部门', '/csc/doctor/add', '127.0.0.1', '内网IP', '{\"doctorCode\":[\"1001\"],\"doctorName\":[\"韩结涛\"],\"majorField\":[\"小儿感冒\"],\"doctorType\":[\"1\"],\"hospitalId\":[\"2\"],\"status\":[\"0\"]}', 'null', 1, '\r\n### Error updating database.  Cause: java.sql.SQLSyntaxErrorException: Unknown column \'doctor_name\' in \'field list\'\r\n### The error may involve com.pepper.project.csc.doctor.mapper.DoctorMapper.insertDoctor-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into csc_doctor (    doctor_name,      doctor_code,      major_field,      doctor_type,      hospital_id,      status,      create_by,     update_by,    create_time,   update_time   )values(    ?,      ?,      ?,      ?,     ?,      ?,      ?,     ?,    sysdate(),   sysdate()   )\r\n### Cause: java.sql.SQLSyntaxErrorException: Unknown column \'doctor_name\' in \'field list\'\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: Unknown column \'doctor_name\' in \'field list\'', '2020-02-13 12:38:56');
INSERT INTO `sys_oper_log` VALUES (240, '医生管理', 1, 'com.pepper.project.csc.doctor.controller.DoctorController.addSave()', 'POST', 1, 'admin', '研发部门', '/csc/doctor/add', '127.0.0.1', '内网IP', '{\"doctorCode\":[\"1001\"],\"doctorName\":[\"韩结涛\"],\"majorField\":[\"小儿感冒\"],\"doctorType\":[\"1\"],\"hospitalId\":[\"2\"],\"status\":[\"0\"]}', 'null', 1, '\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'ID\' doesn\'t have a default value\r\n### The error may involve com.pepper.project.csc.doctor.mapper.DoctorMapper.insertDoctor-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into csc_doctor (    doctor_name,      doctor_code,      major_field,      doctor_type,      hospital_id,      status,      create_by,     update_by,    create_time,   update_time   )values(    ?,      ?,      ?,      ?,     ?,      ?,      ?,     ?,    sysdate(),   sysdate()   )\r\n### Cause: java.sql.SQLException: Field \'ID\' doesn\'t have a default value\n; Field \'ID\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'ID\' doesn\'t have a default value', '2020-02-13 12:39:40');
INSERT INTO `sys_oper_log` VALUES (241, '医生管理', 1, 'com.pepper.project.csc.doctor.controller.DoctorController.addSave()', 'POST', 1, 'admin', '研发部门', '/csc/doctor/add', '127.0.0.1', '内网IP', '{\"doctorCode\":[\"1001\"],\"doctorName\":[\"韩结涛\"],\"majorField\":[\"小儿感冒\"],\"doctorType\":[\"1\"],\"hospitalId\":[\"2\"],\"status\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-13 12:40:07');
INSERT INTO `sys_oper_log` VALUES (242, '医生管理', 1, 'com.pepper.project.csc.doctor.controller.DoctorController.addSave()', 'POST', 1, 'admin', '研发部门', '/csc/doctor/add', '127.0.0.1', '内网IP', '{\"doctorCode\":[\"1002\"],\"doctorName\":[\"刘元坤\"],\"majorField\":[\"小儿感冒2\"],\"doctorType\":[\"2\"],\"hospitalId\":[\"2\"],\"status\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-13 12:43:12');
INSERT INTO `sys_oper_log` VALUES (243, '字典类型', 1, 'com.pepper.project.system.dict.controller.DictTypeController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/dict/add', '127.0.0.1', '内网IP', '{\"dictName\":[\"医生类型\"],\"dictType\":[\"sys_doctor_type\"],\"status\":[\"0\"],\"remark\":[\"医生类型\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-13 12:47:40');
INSERT INTO `sys_oper_log` VALUES (244, '字典类型', 2, 'com.pepper.project.system.dict.controller.DictTypeController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/dict/edit', '127.0.0.1', '内网IP', '{\"dictId\":[\"11\"],\"dictName\":[\"医生类型\"],\"dictType\":[\"sys_doctor_type\"],\"status\":[\"0\"],\"remark\":[\"医生类型列表\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-13 12:48:04');
INSERT INTO `sys_oper_log` VALUES (245, '字典数据', 1, 'com.pepper.project.system.dict.controller.DictDataController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/dict/data/add', '127.0.0.1', '内网IP', '{\"dictLabel\":[\"主治医师\"],\"dictValue\":[\"1\"],\"dictType\":[\"sys_doctor_type\"],\"cssClass\":[\"\"],\"dictSort\":[\"1\"],\"listClass\":[\"\"],\"isDefault\":[\"Y\"],\"status\":[\"0\"],\"remark\":[\"主治医生\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-13 12:49:20');
INSERT INTO `sys_oper_log` VALUES (246, '字典数据', 1, 'com.pepper.project.system.dict.controller.DictDataController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/dict/data/add', '127.0.0.1', '内网IP', '{\"dictLabel\":[\"助理医生\"],\"dictValue\":[\"2\"],\"dictType\":[\"sys_doctor_type\"],\"cssClass\":[\"\"],\"dictSort\":[\"2\"],\"listClass\":[\"\"],\"isDefault\":[\"Y\"],\"status\":[\"0\"],\"remark\":[\"助理医生\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-13 12:49:59');
INSERT INTO `sys_oper_log` VALUES (247, '字典数据', 1, 'com.pepper.project.system.dict.controller.DictDataController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/dict/data/add', '127.0.0.1', '内网IP', '{\"dictLabel\":[\"实习医生\"],\"dictValue\":[\"3\"],\"dictType\":[\"sys_doctor_type\"],\"cssClass\":[\"\"],\"dictSort\":[\"3\"],\"listClass\":[\"\"],\"isDefault\":[\"Y\"],\"status\":[\"0\"],\"remark\":[\"实习医生\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-13 12:50:17');
INSERT INTO `sys_oper_log` VALUES (248, '医生管理', 1, 'com.pepper.project.csc.doctor.controller.DoctorController.addSave()', 'POST', 1, 'admin', '研发部门', '/csc/doctor/add', '127.0.0.1', '内网IP', '{\"doctorCode\":[\"1003\"],\"doctorName\":[\"韩结涛\"],\"majorField\":[\"低级的等级\"],\"doctorType\":[\"1\"],\"hospitalId\":[\"2\"],\"status\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-13 12:58:17');
INSERT INTO `sys_oper_log` VALUES (249, '医生管理', 1, 'com.pepper.project.csc.doctor.controller.DoctorController.addSave()', 'POST', 1, 'admin', '研发部门', '/csc/doctor/add', '127.0.0.1', '内网IP', '{\"doctorCode\":[\"1004\"],\"doctorName\":[\"助理医生\"],\"majorField\":[\"hi大夫\"],\"doctorType\":[\"2\"],\"hospitalId\":[\"2\"],\"status\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-13 12:58:55');
INSERT INTO `sys_oper_log` VALUES (250, '医生管理', 2, 'com.pepper.project.csc.doctor.controller.DoctorController.editSave()', 'POST', 1, 'admin', '研发部门', '/csc/doctor/edit', '127.0.0.1', '内网IP', '{\"id\":[\"4\"],\"doctorCode\":[\"1004\"],\"doctorName\":[\"助理医生\"],\"majorField\":[\"hi大夫\",\"2\"],\"hospitalId\":[\"2\"],\"status\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-13 13:12:40');
INSERT INTO `sys_oper_log` VALUES (251, '医生管理', 2, 'com.pepper.project.csc.doctor.controller.DoctorController.editSave()', 'POST', 1, 'admin', '研发部门', '/csc/doctor/edit', '127.0.0.1', '内网IP', '{\"id\":[\"4\"],\"doctorCode\":[\"1004\"],\"doctorName\":[\"助理医生\"],\"majorField\":[\"hi大夫,2\",\"2\"],\"hospitalId\":[\"6\"],\"status\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-13 13:12:45');
INSERT INTO `sys_oper_log` VALUES (252, '医生管理', 2, 'com.pepper.project.csc.doctor.controller.DoctorController.editSave()', 'POST', 1, 'admin', '研发部门', '/csc/doctor/edit', '127.0.0.1', '内网IP', '{\"id\":[\"4\"],\"doctorCode\":[\"1004\"],\"doctorName\":[\"助理医生\"],\"majorField\":[\"hi大夫,2,2\",\"2\"],\"hospitalId\":[\"6\"],\"status\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-13 13:12:49');
INSERT INTO `sys_oper_log` VALUES (253, '医生管理', 2, 'com.pepper.project.csc.doctor.controller.DoctorController.editSave()', 'POST', 1, 'admin', '研发部门', '/csc/doctor/edit', '127.0.0.1', '内网IP', '{\"id\":[\"4\"],\"doctorCode\":[\"1004\"],\"doctorName\":[\"助理医生\"],\"majorField\":[\"hi大夫,2,2,2\",\"2\"],\"hospitalId\":[\"6\"],\"status\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-13 13:12:57');
INSERT INTO `sys_oper_log` VALUES (254, '医生管理', 2, 'com.pepper.project.csc.doctor.controller.DoctorController.editSave()', 'POST', 1, 'admin', '研发部门', '/csc/doctor/edit', '127.0.0.1', '内网IP', '{\"id\":[\"4\"],\"doctorCode\":[\"1004\"],\"doctorName\":[\"助理医生\"],\"majorField\":[\"hi大夫,2,2,2,2\",\"2\"],\"hospitalId\":[\"2\"],\"status\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-13 13:13:00');
INSERT INTO `sys_oper_log` VALUES (255, '医生管理', 1, 'com.pepper.project.csc.doctor.controller.DoctorController.addSave()', 'POST', 1, 'admin', '研发部门', '/csc/doctor/add', '127.0.0.1', '内网IP', '{\"doctorCode\":[\"1005\"],\"doctorName\":[\"jdjdjdj\"],\"majorField\":[\"打击敌方基地\"],\"doctorType\":[\"1\"],\"hospitalId\":[\"6\"],\"status\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-13 13:13:32');
INSERT INTO `sys_oper_log` VALUES (256, '医生管理', 2, 'com.pepper.project.csc.doctor.controller.DoctorController.editSave()', 'POST', 1, 'admin', '研发部门', '/csc/doctor/edit', '127.0.0.1', '内网IP', '{\"id\":[\"5\"],\"doctorCode\":[\"1005\"],\"doctorName\":[\"jdjdjdj\"],\"majorField\":[\"打击敌方基地\",\"1\"],\"hospitalId\":[\"6\"],\"status\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-13 13:15:38');
INSERT INTO `sys_oper_log` VALUES (257, '医生管理', 2, 'com.pepper.project.csc.doctor.controller.DoctorController.editSave()', 'POST', 1, 'admin', '研发部门', '/csc/doctor/edit', '127.0.0.1', '内网IP', '{\"id\":[\"5\"],\"doctorCode\":[\"1005\"],\"doctorName\":[\"jdjdjdj\"],\"majorField\":[\"打击敌方基地,1\",\"1\"],\"hospitalId\":[\"2\"],\"status\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-13 13:15:49');
INSERT INTO `sys_oper_log` VALUES (258, '医生管理', 2, 'com.pepper.project.csc.doctor.controller.DoctorController.editSave()', 'POST', 1, 'admin', '研发部门', '/csc/doctor/edit', '127.0.0.1', '内网IP', '{\"id\":[\"5\"],\"doctorCode\":[\"1005\"],\"doctorName\":[\"jdjdjdj\"],\"majorField\":[\"打击敌方基地,1,1\",\"1\"],\"hospitalId\":[\"2\"],\"status\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-13 13:15:53');
INSERT INTO `sys_oper_log` VALUES (259, '医生管理', 2, 'com.pepper.project.csc.doctor.controller.DoctorController.editSave()', 'POST', 1, 'admin', '研发部门', '/csc/doctor/edit', '127.0.0.1', '内网IP', '{\"id\":[\"5\"],\"doctorCode\":[\"1005\"],\"doctorName\":[\"jdjdjdj\"],\"majorField\":[\"打击敌方基地,1,1,1\"],\"doctorType\":[\"1\"],\"hospitalId\":[\"2\"],\"status\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-13 13:18:26');
INSERT INTO `sys_oper_log` VALUES (260, '医生管理', 2, 'com.pepper.project.csc.doctor.controller.DoctorController.editSave()', 'POST', 1, 'admin', '研发部门', '/csc/doctor/edit', '127.0.0.1', '内网IP', '{\"id\":[\"5\"],\"doctorCode\":[\"1005\"],\"doctorName\":[\"jdjdjdj\"],\"majorField\":[\"打击敌方基地\"],\"doctorType\":[\"1\"],\"hospitalId\":[\"2\"],\"status\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-13 13:18:31');
INSERT INTO `sys_oper_log` VALUES (261, '医生管理', 2, 'com.pepper.project.csc.doctor.controller.DoctorController.editSave()', 'POST', 1, 'admin', '研发部门', '/csc/doctor/edit', '127.0.0.1', '内网IP', '{\"id\":[\"5\"],\"doctorCode\":[\"1005\"],\"doctorName\":[\"jdjdjdj\"],\"majorField\":[\"打击敌方基地\"],\"doctorType\":[\"1\"],\"hospitalId\":[\"6\"],\"status\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-13 13:18:35');
INSERT INTO `sys_oper_log` VALUES (262, '医生管理', 2, 'com.pepper.project.csc.doctor.controller.DoctorController.editSave()', 'POST', 1, 'admin', '研发部门', '/csc/doctor/edit', '127.0.0.1', '内网IP', '{\"id\":[\"5\"],\"doctorCode\":[\"1005\"],\"doctorName\":[\"jdjdjdj\"],\"majorField\":[\"打击敌方基地\"],\"doctorType\":[\"1\"],\"hospitalId\":[\"6\"],\"status\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-13 13:18:40');
INSERT INTO `sys_oper_log` VALUES (263, '医院介绍', 2, 'com.pepper.project.csc.hospital.controller.HospitalController.editSave()', 'POST', 1, 'admin', '研发部门', '/csc/hospital/edit', '127.0.0.1', '内网IP', '{\"id\":[\"2\"],\"hosName\":[\"天山花园快乐社区医院\"],\"hosCode\":[\"sky garden happy hospital\"],\"introduction\":[\"<span style=\\\"font-size: 18px; background-color: rgb(255, 231, 156);\\\">90909</span>\"],\"communityIds\":[\"3\",\"4\"],\"areaId\":[\"4\"],\"status\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-13 13:19:55');
INSERT INTO `sys_oper_log` VALUES (264, '医院介绍', 2, 'com.pepper.project.csc.hospital.controller.HospitalController.editSave()', 'POST', 1, 'admin', '研发部门', '/csc/hospital/edit', '127.0.0.1', '内网IP', '{\"id\":[\"2\"],\"hosName\":[\"天山花园快乐社区医院\"],\"hosCode\":[\"sky garden happy hospital\"],\"introduction\":[\"<span style=\\\"font-size: 18px; background-color: rgb(255, 231, 156);\\\">90909</span>\"],\"communityIds\":[\"3\",\"4\"],\"areaId\":[\"4\"],\"status\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-13 13:20:00');
INSERT INTO `sys_oper_log` VALUES (265, '医生管理', 2, 'com.pepper.project.csc.doctor.controller.DoctorController.editSave()', 'POST', 1, 'admin', '研发部门', '/csc/doctor/edit', '127.0.0.1', '内网IP', '{\"id\":[\"5\"],\"doctorCode\":[\"1005\"],\"doctorName\":[\"jdjdjdj\"],\"majorField\":[\"打击敌方基地\"],\"doctorType\":[\"1\"],\"hospitalId\":[\"2\"],\"status\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-13 13:21:48');
INSERT INTO `sys_oper_log` VALUES (266, '医生管理', 2, 'com.pepper.project.csc.doctor.controller.DoctorController.editSave()', 'POST', 1, 'admin', '研发部门', '/csc/doctor/edit', '127.0.0.1', '内网IP', '{\"id\":[\"5\"],\"doctorCode\":[\"1005\"],\"doctorName\":[\"jdjdjdj\"],\"majorField\":[\"打击敌方基地\"],\"doctorType\":[\"1\"],\"hospitalId\":[\"6\"],\"status\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-13 13:21:53');
INSERT INTO `sys_oper_log` VALUES (267, '医生管理', 2, 'com.pepper.project.csc.doctor.controller.DoctorController.editSave()', 'POST', 1, 'admin', '研发部门', '/csc/doctor/edit', '127.0.0.1', '内网IP', '{\"id\":[\"5\"],\"doctorCode\":[\"1005\"],\"doctorName\":[\"jdjdjdj\"],\"majorField\":[\"打击敌方基地\"],\"doctorType\":[\"1\"],\"hospitalId\":[\"2\"],\"status\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-13 13:21:58');
INSERT INTO `sys_oper_log` VALUES (268, '医生管理', 2, 'com.pepper.project.csc.doctor.controller.DoctorController.editSave()', 'POST', 1, 'admin', '研发部门', '/csc/doctor/edit', '127.0.0.1', '内网IP', '{\"id\":[\"5\"],\"doctorCode\":[\"1005\"],\"doctorName\":[\"jdjdjdj\"],\"majorField\":[\"打击敌方基地\"],\"doctorType\":[\"1\"],\"hospitalId\":[\"6\"],\"status\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-13 13:23:08');
INSERT INTO `sys_oper_log` VALUES (269, '医生管理', 2, 'com.pepper.project.csc.doctor.controller.DoctorController.editSave()', 'POST', 1, 'admin', '研发部门', '/csc/doctor/edit', '127.0.0.1', '内网IP', '{\"id\":[\"5\"],\"doctorCode\":[\"1005\"],\"doctorName\":[\"jdjdjdj\"],\"majorField\":[\"打击敌方基地\"],\"doctorType\":[\"1\"],\"hospitalId\":[\"2\"],\"status\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-13 13:23:11');
INSERT INTO `sys_oper_log` VALUES (270, '医生管理', 2, 'com.pepper.project.csc.doctor.controller.DoctorController.editSave()', 'POST', 1, 'admin', '研发部门', '/csc/doctor/edit', '127.0.0.1', '内网IP', '{\"id\":[\"5\"],\"doctorCode\":[\"1005\"],\"doctorName\":[\"jdjdjdj\"],\"majorField\":[\"打击敌方基地\"],\"doctorType\":[\"1\"],\"hospitalId\":[\"2\"],\"status\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-13 13:23:17');
INSERT INTO `sys_oper_log` VALUES (271, '菜单管理', 1, 'com.pepper.project.system.menu.controller.MenuController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"1065\"],\"menuType\":[\"C\"],\"menuName\":[\"预约管理\"],\"url\":[\"/csc/appointment\"],\"target\":[\"menuItem\"],\"perms\":[\"csc:appointment:view\"],\"orderNum\":[\"5\"],\"icon\":[\"fa fa-hand-pointer-o\"],\"visible\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-13 14:02:30');
INSERT INTO `sys_oper_log` VALUES (272, '医院介绍', 1, 'com.pepper.project.csc.appointment.controller.AppointmentController.addSave()', 'POST', 1, 'admin', '研发部门', '/csc/appointment/add', '127.0.0.1', '内网IP', '{\"userId\":[\"12\"],\"medicalProjectId\":[\"12\"],\"appointmentName\":[\"12\"],\"appointmentPhone\":[\"12\"],\"status\":[\"0\"]}', 'null', 1, '\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'ID\' doesn\'t have a default value\r\n### The error may involve com.pepper.project.csc.appointment.mapper.AppointmentMapper.insertAppointment-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into csc_appointment (    user_id,          medical_project_id,          appointment_name,      appointment_phone,      status,      create_by,     update_by,    create_time,   update_time   )values(    ?,          ?,          ?,      ?,      status,      ?,     ?,    sysdate(),   sysdate()   )\r\n### Cause: java.sql.SQLException: Field \'ID\' doesn\'t have a default value\n; Field \'ID\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'ID\' doesn\'t have a default value', '2020-02-14 05:35:59');
INSERT INTO `sys_oper_log` VALUES (273, '医院介绍', 1, 'com.pepper.project.csc.appointment.controller.AppointmentController.addSave()', 'POST', 1, 'admin', '研发部门', '/csc/appointment/add', '127.0.0.1', '内网IP', '{\"userId\":[\"12\"],\"medicalProjectId\":[\"12\"],\"appointmentName\":[\"12\"],\"appointmentPhone\":[\"12\"],\"status\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-14 05:37:54');
INSERT INTO `sys_oper_log` VALUES (274, '医院介绍', 1, 'com.pepper.project.csc.appointment.controller.AppointmentController.addSave()', 'POST', 1, 'admin', '研发部门', '/csc/appointment/add', '127.0.0.1', '内网IP', '{\"userId\":[\"11221212121\"],\"medicalProjectId\":[\"12222\"],\"appointmentName\":[\"2122\"],\"appointmentPhone\":[\"12122\"],\"status\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-14 05:45:28');
INSERT INTO `sys_oper_log` VALUES (275, '医院介绍', 1, 'com.pepper.project.csc.appointment.controller.AppointmentController.addSave()', 'POST', 1, 'admin', '研发部门', '/csc/appointment/add', '127.0.0.1', '内网IP', '{\"userId\":[\"1234231232\"],\"medicalProjectId\":[\"12221\"],\"appointmentName\":[\"1221212\"],\"appointmentPhone\":[\"12212121122\"],\"status\":[\"0\"]}', 'null', 1, '\r\n### Error updating database.  Cause: com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Out of range value for column \'APPOINTMENT_PHONE\' at row 1\r\n### The error may involve com.pepper.project.csc.appointment.mapper.AppointmentMapper.insertAppointment-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into csc_appointment (    user_id,          medical_project_id,          appointment_name,      appointment_phone,      status,      create_by,     update_by,    create_time,   update_time   )values(    ?,          ?,          ?,      ?,      status,      ?,     ?,    sysdate(),   sysdate()   )\r\n### Cause: com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Out of range value for column \'APPOINTMENT_PHONE\' at row 1\n; Data truncation: Out of range value for column \'APPOINTMENT_PHONE\' at row 1; nested exception is com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Out of range value for column \'APPOINTMENT_PHONE\' at row 1', '2020-02-14 05:49:01');
INSERT INTO `sys_oper_log` VALUES (276, '医院介绍', 1, 'com.pepper.project.csc.appointment.controller.AppointmentController.addSave()', 'POST', 1, 'admin', '研发部门', '/csc/appointment/add', '127.0.0.1', '内网IP', '{\"userId\":[\"123121\"],\"medicalProjectId\":[\"1212\"],\"appointmentName\":[\"1223213\"],\"appointmentPhone\":[\"1234\"],\"status\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-14 05:52:27');
INSERT INTO `sys_oper_log` VALUES (277, '医院介绍', 3, 'com.pepper.project.csc.appointment.controller.AppointmentController.remove()', 'POST', 1, 'admin', '研发部门', '/csc/appointment/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-14 05:55:55');
INSERT INTO `sys_oper_log` VALUES (278, '医院介绍', 3, 'com.pepper.project.csc.appointment.controller.AppointmentController.remove()', 'POST', 1, 'admin', '研发部门', '/csc/appointment/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"2\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-14 05:55:57');
INSERT INTO `sys_oper_log` VALUES (279, '医院介绍', 3, 'com.pepper.project.csc.appointment.controller.AppointmentController.remove()', 'POST', 1, 'admin', '研发部门', '/csc/appointment/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"3\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-14 05:55:59');
INSERT INTO `sys_oper_log` VALUES (280, '医院介绍', 1, 'com.pepper.project.csc.appointment.controller.AppointmentController.addSave()', 'POST', 1, 'admin', '研发部门', '/csc/appointment/add', '127.0.0.1', '内网IP', '{\"userId\":[\"111121\"],\"medicalProjectId\":[\"1234\"],\"appointmentName\":[\"2233\"],\"appointmentPhone\":[\"123455566\"],\"status\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-14 05:56:26');
INSERT INTO `sys_oper_log` VALUES (281, '医院介绍', 1, 'com.pepper.project.csc.appointment.controller.AppointmentController.addSave()', 'POST', 1, 'admin', '研发部门', '/csc/appointment/add', '127.0.0.1', '内网IP', '{\"userId\":[\"1001\"],\"medicalProjectId\":[\"100\"],\"appointmentName\":[\"111111\"],\"appointmentPhone\":[\"1111\"],\"status\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-14 05:58:46');
INSERT INTO `sys_oper_log` VALUES (282, '医院介绍', 3, 'com.pepper.project.csc.appointment.controller.AppointmentController.remove()', 'POST', 1, 'admin', '研发部门', '/csc/appointment/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"4,5\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-14 05:58:54');
INSERT INTO `sys_oper_log` VALUES (283, '医院介绍', 1, 'com.pepper.project.csc.appointment.controller.AppointmentController.addSave()', 'POST', 1, 'admin', '研发部门', '/csc/appointment/add', '127.0.0.1', '内网IP', '{\"userId\":[\"1001\"],\"medicalProjectId\":[\"10\"],\"appointmentName\":[\"hanjietao\"],\"appointmentPhone\":[\"12345678900\"],\"status\":[\"0\"]}', 'null', 1, '\r\n### Error updating database.  Cause: com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Out of range value for column \'APPOINTMENT_PHONE\' at row 1\r\n### The error may involve com.pepper.project.csc.appointment.mapper.AppointmentMapper.insertAppointment-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into csc_appointment (    user_id,          medical_project_id,          appointment_name,      appointment_phone,      status,      create_by,     update_by,    create_time,   update_time   )values(    ?,          ?,          ?,      ?,      ?,      ?,     ?,    sysdate(),   sysdate()   )\r\n### Cause: com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Out of range value for column \'APPOINTMENT_PHONE\' at row 1\n; Data truncation: Out of range value for column \'APPOINTMENT_PHONE\' at row 1; nested exception is com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Out of range value for column \'APPOINTMENT_PHONE\' at row 1', '2020-02-14 05:59:28');
INSERT INTO `sys_oper_log` VALUES (284, '医院介绍', 1, 'com.pepper.project.csc.appointment.controller.AppointmentController.addSave()', 'POST', 1, 'admin', '研发部门', '/csc/appointment/add', '127.0.0.1', '内网IP', '{\"userId\":[\"1001\"],\"medicalProjectId\":[\"10\"],\"appointmentName\":[\"hanjietao\"],\"appointmentPhone\":[\"12345678900\"],\"status\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-14 06:01:38');
INSERT INTO `sys_oper_log` VALUES (285, '医院介绍', 1, 'com.pepper.project.csc.appointment.controller.AppointmentController.addSave()', 'POST', 1, 'admin', '研发部门', '/csc/appointment/add', '127.0.0.1', '内网IP', '{\"userId\":[\"12\"],\"medicalProjectId\":[\"12\"],\"appointmentName\":[\"1212\"],\"appointmentPhone\":[\"12\"],\"status\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-14 06:15:28');
INSERT INTO `sys_oper_log` VALUES (286, '医院介绍', 1, 'com.pepper.project.csc.appointment.controller.AppointmentController.addSave()', 'POST', 1, 'admin', '研发部门', '/csc/appointment/add', '127.0.0.1', '内网IP', '{\"userId\":[\"12\"],\"medicalProjectId\":[\"2112\"],\"appointmentTime\":[\"2020-02-14 00:00:00\"],\"appointmentName\":[\"12212\"],\"appointmentPhone\":[\"212\"],\"status\":[\"0\"]}', 'null', 1, 'nested exception is org.apache.ibatis.exceptions.PersistenceException: \r\n### Error updating database.  Cause: java.lang.IllegalArgumentException: invalid comparison: java.util.Date and java.lang.String\r\n### Cause: java.lang.IllegalArgumentException: invalid comparison: java.util.Date and java.lang.String', '2020-02-14 06:22:37');
INSERT INTO `sys_oper_log` VALUES (287, '医院介绍', 1, 'com.pepper.project.csc.appointment.controller.AppointmentController.addSave()', 'POST', 1, 'admin', '研发部门', '/csc/appointment/add', '127.0.0.1', '内网IP', '{\"userId\":[\"1\"],\"medicalProjectId\":[\"2\"],\"appointmentTimeStr\":[\"2020-02-14 00:00:00\"],\"appointmentName\":[\"3\"],\"appointmentPhone\":[\"4\"],\"status\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-14 06:44:47');
INSERT INTO `sys_oper_log` VALUES (288, '医院介绍', 1, 'com.pepper.project.csc.appointment.controller.AppointmentController.addSave()', 'POST', 1, 'admin', '研发部门', '/csc/appointment/add', '127.0.0.1', '内网IP', '{\"userId\":[\"2\"],\"medicalProjectId\":[\"3\"],\"appointmentTimeStr\":[\"2020-02-20 00:00:00\"],\"appointmentName\":[\"4\"],\"appointmentPhone\":[\"5\"],\"status\":[\"0\"]}', 'null', 1, 'nested exception is org.apache.ibatis.exceptions.PersistenceException: \r\n### Error updating database.  Cause: java.lang.IllegalArgumentException: invalid comparison: java.util.Date and java.lang.String\r\n### Cause: java.lang.IllegalArgumentException: invalid comparison: java.util.Date and java.lang.String', '2020-02-14 06:46:52');
INSERT INTO `sys_oper_log` VALUES (289, '医院介绍', 1, 'com.pepper.project.csc.appointment.controller.AppointmentController.addSave()', 'POST', 1, 'admin', '研发部门', '/csc/appointment/add', '127.0.0.1', '内网IP', '{\"userId\":[\"2\"],\"medicalProjectId\":[\"3333\"],\"appointmentTimeStr\":[\"2020-02-21 00:00:00\"],\"appointmentName\":[\"3333\"],\"appointmentPhone\":[\"4455\"],\"status\":[\"0\"]}', 'null', 1, 'nested exception is org.apache.ibatis.exceptions.PersistenceException: \r\n### Error updating database.  Cause: java.lang.IllegalArgumentException: invalid comparison: java.sql.Date and java.lang.String\r\n### Cause: java.lang.IllegalArgumentException: invalid comparison: java.sql.Date and java.lang.String', '2020-02-14 06:53:13');
INSERT INTO `sys_oper_log` VALUES (290, '医院介绍', 1, 'com.pepper.project.csc.appointment.controller.AppointmentController.addSave()', 'POST', 1, 'admin', '研发部门', '/csc/appointment/add', '127.0.0.1', '内网IP', '{\"userId\":[\"222333\"],\"medicalProjectId\":[\"4444\"],\"appointmentTimeStr\":[\"2020-02-14 00:00:00\"],\"appointmentName\":[\"4445\"],\"appointmentPhone\":[\"5566\"],\"status\":[\"0\"]}', 'null', 1, 'nested exception is org.apache.ibatis.exceptions.PersistenceException: \r\n### Error updating database.  Cause: java.lang.IllegalArgumentException: invalid comparison: java.sql.Date and java.lang.String\r\n### Cause: java.lang.IllegalArgumentException: invalid comparison: java.sql.Date and java.lang.String', '2020-02-14 06:56:15');
INSERT INTO `sys_oper_log` VALUES (291, '医院介绍', 1, 'com.pepper.project.csc.appointment.controller.AppointmentController.addSave()', 'POST', 1, 'admin', '研发部门', '/csc/appointment/add', '127.0.0.1', '内网IP', '{\"userId\":[\"222333\"],\"medicalProjectId\":[\"4444\"],\"appointmentTimeStr\":[\"2020-02-14 00:00:00\"],\"appointmentName\":[\"4445\"],\"appointmentPhone\":[\"5566\"],\"status\":[\"0\"]}', 'null', 1, 'nested exception is org.apache.ibatis.exceptions.PersistenceException: \r\n### Error updating database.  Cause: java.lang.IllegalArgumentException: invalid comparison: java.sql.Date and java.lang.String\r\n### Cause: java.lang.IllegalArgumentException: invalid comparison: java.sql.Date and java.lang.String', '2020-02-14 06:57:57');
INSERT INTO `sys_oper_log` VALUES (292, '医院介绍', 1, 'com.pepper.project.csc.appointment.controller.AppointmentController.addSave()', 'POST', 1, 'admin', '研发部门', '/csc/appointment/add', '127.0.0.1', '内网IP', '{\"userId\":[\"1\"],\"medicalProjectId\":[\"1\"],\"appointmentTimeStr\":[\"2020-02-14 00:00:00\"],\"appointmentName\":[\"1\"],\"appointmentPhone\":[\"1\"],\"status\":[\"0\"]}', 'null', 1, 'nested exception is org.apache.ibatis.exceptions.PersistenceException: \r\n### Error updating database.  Cause: java.lang.IllegalArgumentException: invalid comparison: java.sql.Date and java.lang.String\r\n### Cause: java.lang.IllegalArgumentException: invalid comparison: java.sql.Date and java.lang.String', '2020-02-14 07:02:47');
INSERT INTO `sys_oper_log` VALUES (293, '医院介绍', 1, 'com.pepper.project.csc.appointment.controller.AppointmentController.addSave()', 'POST', 1, 'admin', '研发部门', '/csc/appointment/add', '127.0.0.1', '内网IP', '{\"userId\":[\"333\"],\"medicalProjectId\":[\"3333\"],\"appointmentTimeStr\":[\"2020-02-14 00:00:00\"],\"appointmentName\":[\"33333\"],\"appointmentPhone\":[\"33444\"],\"status\":[\"0\"]}', 'null', 1, 'nested exception is org.apache.ibatis.exceptions.PersistenceException: \r\n### Error updating database.  Cause: java.lang.IllegalArgumentException: invalid comparison: java.util.Date and java.lang.String\r\n### Cause: java.lang.IllegalArgumentException: invalid comparison: java.util.Date and java.lang.String', '2020-02-14 07:09:21');
INSERT INTO `sys_oper_log` VALUES (294, '医院介绍', 1, 'com.pepper.project.csc.appointment.controller.AppointmentController.addSave()', 'POST', 1, 'admin', '研发部门', '/csc/appointment/add', '127.0.0.1', '内网IP', '{\"userId\":[\"112\"],\"medicalProjectId\":[\"123\"],\"appointmentTimeStr\":[\"2020-02-14 00:00:00\"],\"appointmentName\":[\"11222\"],\"appointmentPhone\":[\"11233\"],\"status\":[\"0\"]}', 'null', 1, 'nested exception is org.apache.ibatis.exceptions.PersistenceException: \r\n### Error updating database.  Cause: java.lang.IllegalArgumentException: invalid comparison: java.util.Date and java.lang.String\r\n### Cause: java.lang.IllegalArgumentException: invalid comparison: java.util.Date and java.lang.String', '2020-02-14 07:15:35');
INSERT INTO `sys_oper_log` VALUES (295, '医院介绍', 1, 'com.pepper.project.csc.appointment.controller.AppointmentController.addSave()', 'POST', 1, 'admin', '研发部门', '/csc/appointment/add', '127.0.0.1', '内网IP', '{\"userId\":[\"12\"],\"medicalProjectId\":[\"123\"],\"appointmentTimeStr\":[\"2020-02-14 00:00:00\"],\"appointmentName\":[\"1223\"],\"appointmentPhone\":[\"1222\"],\"status\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-14 07:18:06');
INSERT INTO `sys_oper_log` VALUES (296, '医院介绍', 3, 'com.pepper.project.csc.appointment.controller.AppointmentController.remove()', 'POST', 1, 'admin', '研发部门', '/csc/appointment/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-14 07:22:14');
INSERT INTO `sys_oper_log` VALUES (297, '医疗项目', 2, 'com.pepper.project.csc.medical.controller.MedicalController.editSave()', 'POST', 1, 'admin', '研发部门', '/csc/medical/edit', '127.0.0.1', '内网IP', '{\"id\":[\"2\"],\"name\":[\"健康检查\"],\"serviceContent\":[\"健康检查：检查血压/心率，面容情况\"],\"price\":[\"100.00000000\"],\"status\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-14 07:23:59');
INSERT INTO `sys_oper_log` VALUES (298, '医院介绍', 1, 'com.pepper.project.csc.appointment.controller.AppointmentController.addSave()', 'POST', 1, 'admin', '研发部门', '/csc/appointment/add', '127.0.0.1', '内网IP', '{\"userId\":[\"1009939401\"],\"hospitalId\":[\"6\"],\"medicalProjectId\":[\"2\"],\"appointmentTimeStr\":[\"2020-02-15 00:00:00\"],\"appointmentName\":[\"韩结涛\"],\"appointmentPhone\":[\"18505561893\"],\"status\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-14 07:26:23');
INSERT INTO `sys_oper_log` VALUES (299, '医院介绍', 1, 'com.pepper.project.csc.appointment.controller.AppointmentController.addSave()', 'POST', 1, 'admin', '研发部门', '/csc/appointment/add', '127.0.0.1', '内网IP', '{\"userId\":[\"100294949\"],\"hospitalId\":[\"6\"],\"medicalProjectId\":[\"2\"],\"appointmentTimeStr\":[\"2020-02-19 00:00:00\"],\"appointmentName\":[\"东非大裂谷\"],\"appointmentPhone\":[\"18900998876\"],\"status\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-14 07:28:07');
INSERT INTO `sys_oper_log` VALUES (300, '医院介绍', 3, 'com.pepper.project.csc.appointment.controller.AppointmentController.remove()', 'POST', 1, 'admin', '研发部门', '/csc/appointment/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"3\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-14 07:28:18');
INSERT INTO `sys_oper_log` VALUES (301, '菜单管理', 1, 'com.pepper.project.system.menu.controller.MenuController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"1089\"],\"menuType\":[\"F\"],\"menuName\":[\"预约列表查询\"],\"url\":[\"\"],\"target\":[\"menuItem\"],\"perms\":[\"csc:appointment:list\"],\"orderNum\":[\"1\"],\"icon\":[\"\"],\"visible\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-14 08:58:14');
INSERT INTO `sys_oper_log` VALUES (302, '菜单管理', 1, 'com.pepper.project.system.menu.controller.MenuController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"1089\"],\"menuType\":[\"F\"],\"menuName\":[\"预约新增\"],\"url\":[\"\"],\"target\":[\"menuItem\"],\"perms\":[\"csc:appointment:add\"],\"orderNum\":[\"2\"],\"icon\":[\"\"],\"visible\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-14 08:58:39');
INSERT INTO `sys_oper_log` VALUES (303, '菜单管理', 1, 'com.pepper.project.system.menu.controller.MenuController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"1089\"],\"menuType\":[\"F\"],\"menuName\":[\"预约详情\"],\"url\":[\"\"],\"target\":[\"menuItem\"],\"perms\":[\"csc:appointment:detail\"],\"orderNum\":[\"3\"],\"icon\":[\"\"],\"visible\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-14 08:59:03');
INSERT INTO `sys_oper_log` VALUES (304, '菜单管理', 1, 'com.pepper.project.system.menu.controller.MenuController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"1089\"],\"menuType\":[\"F\"],\"menuName\":[\"取消预约\"],\"url\":[\"\"],\"target\":[\"menuItem\"],\"perms\":[\"csc:appointment:cancel\"],\"orderNum\":[\"4\"],\"icon\":[\"\"],\"visible\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-14 09:49:23');
INSERT INTO `sys_oper_log` VALUES (305, '菜单管理', 2, 'com.pepper.project.system.menu.controller.MenuController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"1093\"],\"parentId\":[\"1089\"],\"menuType\":[\"F\"],\"menuName\":[\"取消预约\"],\"url\":[\"#\"],\"target\":[\"menuItem\"],\"perms\":[\"csc:appointment:changeStatus\"],\"orderNum\":[\"4\"],\"icon\":[\"#\"],\"visible\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-14 09:50:35');
INSERT INTO `sys_oper_log` VALUES (306, '预约管理', 2, 'com.pepper.project.csc.appointment.controller.AppointmentController.changeStatus()', 'POST', 1, 'admin', '研发部门', '/csc/appointment/changeStatus', '127.0.0.1', '内网IP', '{\"id\":[\"2\"],\"status\":[\"1\"],\"cancelReason\":[\"系统取消\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-14 10:09:11');
INSERT INTO `sys_oper_log` VALUES (307, '医院介绍', 1, 'com.pepper.project.csc.appointment.controller.AppointmentController.addSave()', 'POST', 1, 'admin', '研发部门', '/csc/appointment/add', '127.0.0.1', '内网IP', '{\"userId\":[\"102940393459\"],\"hospitalId\":[\"2\"],\"medicalProjectId\":[\"2\"],\"appointmentTimeStr\":[\"2020-02-19 00:00:00\"],\"appointmentName\":[\"wangtingting\"],\"appointmentPhone\":[\"18978789098\"],\"status\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-14 10:11:47');
INSERT INTO `sys_oper_log` VALUES (308, '菜单管理', 1, 'com.pepper.project.system.menu.controller.MenuController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"0\"],\"menuType\":[\"M\"],\"menuName\":[\"社区管理\"],\"url\":[\"\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"4\"],\"icon\":[\"fa fa-home\"],\"visible\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-14 12:22:01');
INSERT INTO `sys_oper_log` VALUES (309, '菜单管理', 1, 'com.pepper.project.system.menu.controller.MenuController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"1094\"],\"menuType\":[\"C\"],\"menuName\":[\"社区管理\"],\"url\":[\"/cm/community\"],\"target\":[\"menuItem\"],\"perms\":[\"cm:community\"],\"orderNum\":[\"1\"],\"icon\":[\"fa fa-child\"],\"visible\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-14 12:24:26');
INSERT INTO `sys_oper_log` VALUES (310, '菜单管理', 2, 'com.pepper.project.system.menu.controller.MenuController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"1095\"],\"parentId\":[\"1094\"],\"menuType\":[\"C\"],\"menuName\":[\"社区管理\"],\"url\":[\"/cm/community\"],\"target\":[\"menuItem\"],\"perms\":[\"cm:community:view\"],\"orderNum\":[\"1\"],\"icon\":[\"fa fa-child\"],\"visible\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-14 12:24:46');
INSERT INTO `sys_oper_log` VALUES (311, '菜单管理', 2, 'com.pepper.project.system.menu.controller.MenuController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"1095\"],\"parentId\":[\"1094\"],\"menuType\":[\"C\"],\"menuName\":[\"社区\"],\"url\":[\"/cm/community\"],\"target\":[\"menuItem\"],\"perms\":[\"cm:community:view\"],\"orderNum\":[\"1\"],\"icon\":[\"fa fa-child\"],\"visible\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-14 12:25:56');
INSERT INTO `sys_oper_log` VALUES (312, '菜单管理', 2, 'com.pepper.project.system.menu.controller.MenuController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"1095\"],\"parentId\":[\"1094\"],\"menuType\":[\"C\"],\"menuName\":[\"社区介绍\"],\"url\":[\"/cm/community\"],\"target\":[\"menuItem\"],\"perms\":[\"cm:community:view\"],\"orderNum\":[\"1\"],\"icon\":[\"fa fa-child\"],\"visible\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-14 12:26:18');
INSERT INTO `sys_oper_log` VALUES (313, '社区', 1, 'com.pepper.project.cm.community.controller.CommunityController.addSave()', 'POST', 1, 'admin', '研发部门', '/cm/community/add', '127.0.0.1', '内网IP', '{\"communityName\":[\"打发打发\"],\"communityCode\":[\"打发打发\"],\"introduction\":[\"<p>打发士大夫士大夫</p>\"],\"areaId\":[\"3\"],\"status\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-14 13:16:40');
INSERT INTO `sys_oper_log` VALUES (314, '社区', 3, 'com.pepper.project.cm.community.controller.CommunityController.remove()', 'POST', 1, 'admin', '研发部门', '/cm/community/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"null\"]}', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2020-02-14 13:22:13');
INSERT INTO `sys_oper_log` VALUES (315, '社区', 3, 'com.pepper.project.cm.community.controller.CommunityController.remove()', 'POST', 1, 'admin', '研发部门', '/cm/community/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"null\"]}', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2020-02-14 13:22:19');
INSERT INTO `sys_oper_log` VALUES (316, '社区', 1, 'com.pepper.project.cm.community.controller.CommunityController.addSave()', 'POST', 1, 'admin', '研发部门', '/cm/community/add', '127.0.0.1', '内网IP', '{\"communityName\":[\"d\'f\'d\"],\"communityCode\":[\"dfdd所发生的\"],\"introduction\":[\"<p>沙发沙发</p>\"],\"areaId\":[\"3\"],\"status\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-14 13:28:23');
INSERT INTO `sys_oper_log` VALUES (317, '社区', 2, 'com.pepper.project.cm.community.controller.CommunityController.editSave()', 'POST', 1, 'admin', '研发部门', '/cm/community/edit', '127.0.0.1', '内网IP', '{\"id\":[\"1\"],\"communityName\":[\"d\'f\'d\"],\"communityCode\":[\"dfdd所发生的\"],\"introduction\":[\"<p>沙发沙发</p>\"],\"areaId\":[\"4\"],\"status\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-14 13:33:45');
INSERT INTO `sys_oper_log` VALUES (318, '社区', 2, 'com.pepper.project.cm.community.controller.CommunityController.editSave()', 'POST', 1, 'admin', '研发部门', '/cm/community/edit', '127.0.0.1', '内网IP', '{\"id\":[\"1\"],\"communityName\":[\"d\'f\'d\"],\"communityCode\":[\"dfdd所发生的\"],\"introduction\":[\"<p>沙发沙发</p>\"],\"areaId\":[\"3\"],\"status\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-14 13:33:51');
INSERT INTO `sys_oper_log` VALUES (319, '社区', 1, 'com.pepper.project.cm.community.controller.CommunityController.addSave()', 'POST', 1, 'admin', '研发部门', '/cm/community/add', '127.0.0.1', '内网IP', '{\"communityName\":[\"幸福社区【沙依巴克区】\"],\"communityCode\":[\"1001001\"],\"introduction\":[\"<p>幸福社区<br></p>\"],\"areaId\":[\"3\"],\"status\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-14 14:51:50');
INSERT INTO `sys_oper_log` VALUES (320, '社区', 2, 'com.pepper.project.cm.community.controller.CommunityController.editSave()', 'POST', 1, 'admin', '研发部门', '/cm/community/edit', '127.0.0.1', '内网IP', '{\"id\":[\"2\"],\"communityName\":[\"幸福社区【沙依巴克区】\"],\"communityCode\":[\"1001001\"],\"introduction\":[\"<p>幸福社区<br></p>\"],\"areaId\":[\"4\"],\"status\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-14 15:07:17');
INSERT INTO `sys_oper_log` VALUES (321, '菜单管理', 1, 'com.pepper.project.system.menu.controller.MenuController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"1095\"],\"menuType\":[\"F\"],\"menuName\":[\"社区查询\"],\"url\":[\"\"],\"target\":[\"menuItem\"],\"perms\":[\"cm:community:list\"],\"orderNum\":[\"1\"],\"icon\":[\"\"],\"visible\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-14 15:38:57');
INSERT INTO `sys_oper_log` VALUES (322, '菜单管理', 1, 'com.pepper.project.system.menu.controller.MenuController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"1095\"],\"menuType\":[\"F\"],\"menuName\":[\"社区新增\"],\"url\":[\"\"],\"target\":[\"menuItem\"],\"perms\":[\"cm:community:add\"],\"orderNum\":[\"2\"],\"icon\":[\"\"],\"visible\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-14 15:39:24');
INSERT INTO `sys_oper_log` VALUES (323, '菜单管理', 1, 'com.pepper.project.system.menu.controller.MenuController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"1095\"],\"menuType\":[\"F\"],\"menuName\":[\"社区修改\"],\"url\":[\"\"],\"target\":[\"menuItem\"],\"perms\":[\"cm:community:edit\"],\"orderNum\":[\"3\"],\"icon\":[\"\"],\"visible\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-14 15:40:01');
INSERT INTO `sys_oper_log` VALUES (324, '菜单管理', 1, 'com.pepper.project.system.menu.controller.MenuController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"1095\"],\"menuType\":[\"F\"],\"menuName\":[\"社区删除\"],\"url\":[\"\"],\"target\":[\"menuItem\"],\"perms\":[\"cm:community:delete\"],\"orderNum\":[\"4\"],\"icon\":[\"\"],\"visible\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-14 15:40:33');
INSERT INTO `sys_oper_log` VALUES (325, '菜单管理', 1, 'com.pepper.project.system.menu.controller.MenuController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"1094\"],\"menuType\":[\"C\"],\"menuName\":[\"社区活动\"],\"url\":[\"/cm/activity\"],\"target\":[\"menuItem\"],\"perms\":[\"csc:activity:view\"],\"orderNum\":[\"2\"],\"icon\":[\"fa fa-user-plus\"],\"visible\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-14 15:42:14');
INSERT INTO `sys_oper_log` VALUES (326, '社区', 1, 'com.pepper.project.cm.community.controller.CommunityController.addSave()', 'POST', 1, 'admin', '研发部门', '/cm/community/add', '127.0.0.1', '内网IP', '{\"title\":[\"dfddff\"],\"content\":[\"<p>dffdfdfdf</p>\"],\"status\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-14 15:56:18');
INSERT INTO `sys_oper_log` VALUES (327, '活动', 1, 'com.pepper.project.cm.activity.controller.ActivityController.addSave()', 'POST', 1, 'admin', '研发部门', '/cm/activity/add', '127.0.0.1', '内网IP', '{\"title\":[\"dfssdf\"],\"content\":[\"<p>sdfsdfsf</p>\"],\"status\":[\"0\"]}', 'null', 1, '\r\n### Error updating database.  Cause: java.sql.SQLSyntaxErrorException: Unknown column \'status\' in \'field list\'\r\n### The error may involve com.pepper.project.cm.activity.mapper.ActivityMapper.insertActivity-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into cm_activity (    title,      content,      status,      create_by,     update_by,    create_time,   update_time   )values(    ?,      ?,      ?,      ?,     ?,    sysdate(),   sysdate()   )\r\n### Cause: java.sql.SQLSyntaxErrorException: Unknown column \'status\' in \'field list\'\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: Unknown column \'status\' in \'field list\'', '2020-02-14 15:57:39');
INSERT INTO `sys_oper_log` VALUES (328, '活动', 1, 'com.pepper.project.cm.activity.controller.ActivityController.addSave()', 'POST', 1, 'admin', '研发部门', '/cm/activity/add', '127.0.0.1', '内网IP', '{\"title\":[\"sfd\"],\"content\":[\"<p>sfdfsf</p>\"],\"status\":[\"0\"]}', 'null', 1, '\r\n### Error updating database.  Cause: java.sql.SQLSyntaxErrorException: Unknown column \'status\' in \'field list\'\r\n### The error may involve com.pepper.project.cm.activity.mapper.ActivityMapper.insertActivity-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into cm_activity (    title,      content,      status,      create_by,     update_by,    create_time,   update_time   )values(    ?,      ?,      ?,      ?,     ?,    sysdate(),   sysdate()   )\r\n### Cause: java.sql.SQLSyntaxErrorException: Unknown column \'status\' in \'field list\'\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: Unknown column \'status\' in \'field list\'', '2020-02-14 15:59:26');
INSERT INTO `sys_oper_log` VALUES (329, '活动', 1, 'com.pepper.project.cm.activity.controller.ActivityController.addSave()', 'POST', 1, 'admin', '研发部门', '/cm/activity/add', '127.0.0.1', '内网IP', '{\"title\":[\"sfd\"],\"content\":[\"<p>sfdfsf</p>\"],\"status\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-14 15:59:44');
INSERT INTO `sys_oper_log` VALUES (330, '活动', 1, 'com.pepper.project.cm.activity.controller.ActivityController.addSave()', 'POST', 1, 'admin', '研发部门', '/cm/activity/add', '127.0.0.1', '内网IP', '{\"title\":[\"222\"],\"content\":[\"<p>222</p>\"],\"status\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-14 16:02:19');
INSERT INTO `sys_oper_log` VALUES (331, '活动', 2, 'com.pepper.project.cm.activity.controller.ActivityController.editSave()', 'POST', 1, 'admin', '研发部门', '/cm/activity/edit', '127.0.0.1', '内网IP', '{\"id\":[\"2\"],\"title\":[\"2222222222222222222222222222222222\"],\"content\":[\"<p>222</p>\"],\"status\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-14 16:02:29');
INSERT INTO `sys_oper_log` VALUES (332, '活动', 2, 'com.pepper.project.cm.activity.controller.ActivityController.editSave()', 'POST', 1, 'admin', '研发部门', '/cm/activity/edit', '127.0.0.1', '内网IP', '{\"id\":[\"2\"],\"title\":[\"2222222222222222222222222222222222\"],\"content\":[\"<p>222</p>\"],\"status\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-15 03:21:18');
INSERT INTO `sys_oper_log` VALUES (333, '活动', 2, 'com.pepper.project.cm.activity.controller.ActivityController.editSave()', 'POST', 1, 'admin', '研发部门', '/cm/activity/edit', '127.0.0.1', '内网IP', '{\"id\":[\"1\"],\"title\":[\"sfd11122222\"],\"content\":[\"<p>sfdfsf</p>\"],\"status\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-15 03:36:26');
INSERT INTO `sys_oper_log` VALUES (334, '活动', 2, 'com.pepper.project.cm.activity.controller.ActivityController.editSave()', 'POST', 1, 'admin', '研发部门', '/cm/activity/edit', '127.0.0.1', '内网IP', '{\"id\":[\"2\"],\"title\":[\"2222222222222222222222222222222222\"],\"content\":[\"<p>222</p>\"],\"status\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-15 03:36:31');
INSERT INTO `sys_oper_log` VALUES (335, '菜单管理', 1, 'com.pepper.project.system.menu.controller.MenuController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"1100\"],\"menuType\":[\"F\"],\"menuName\":[\"活动查询\"],\"url\":[\"\"],\"target\":[\"menuItem\"],\"perms\":[\"cm:activity:list\"],\"orderNum\":[\"1\"],\"icon\":[\"\"],\"visible\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-15 03:54:46');
INSERT INTO `sys_oper_log` VALUES (336, '菜单管理', 1, 'com.pepper.project.system.menu.controller.MenuController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"1100\"],\"menuType\":[\"F\"],\"menuName\":[\"活动新增\"],\"url\":[\"\"],\"target\":[\"menuItem\"],\"perms\":[\"cm:activity:add\"],\"orderNum\":[\"2\"],\"icon\":[\"\"],\"visible\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-15 03:55:04');
INSERT INTO `sys_oper_log` VALUES (337, '菜单管理', 1, 'com.pepper.project.system.menu.controller.MenuController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"1100\"],\"menuType\":[\"F\"],\"menuName\":[\"活动修改\"],\"url\":[\"\"],\"target\":[\"menuItem\"],\"perms\":[\"cm:activity:edit\"],\"orderNum\":[\"3\"],\"icon\":[\"\"],\"visible\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-15 03:55:34');
INSERT INTO `sys_oper_log` VALUES (338, '菜单管理', 1, 'com.pepper.project.system.menu.controller.MenuController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"1100\"],\"menuType\":[\"F\"],\"menuName\":[\"活动删除\"],\"url\":[\"\"],\"target\":[\"menuItem\"],\"perms\":[\"cm:activity:delete\"],\"orderNum\":[\"4\"],\"icon\":[\"\"],\"visible\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-15 03:56:11');
INSERT INTO `sys_oper_log` VALUES (339, '菜单管理', 1, 'com.pepper.project.system.menu.controller.MenuController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"1094\"],\"menuType\":[\"C\"],\"menuName\":[\"活动报名\"],\"url\":[\"/cm/activityapply\"],\"target\":[\"menuItem\"],\"perms\":[\"cm:activityapply:view\"],\"orderNum\":[\"3\"],\"icon\":[\"fa fa-users\"],\"visible\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-15 04:08:17');
INSERT INTO `sys_oper_log` VALUES (340, '菜单管理', 1, 'com.pepper.project.system.menu.controller.MenuController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"1105\"],\"menuType\":[\"F\"],\"menuName\":[\"报名列表查询\"],\"url\":[\"\"],\"target\":[\"menuItem\"],\"perms\":[\"cm:activityapply:list\"],\"orderNum\":[\"1\"],\"icon\":[\"\"],\"visible\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-15 04:08:55');
INSERT INTO `sys_oper_log` VALUES (341, '菜单管理', 3, 'com.pepper.project.system.menu.controller.MenuController.remove()', 'GET', 1, 'admin', '研发部门', '/system/menu/remove/1105', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"存在子菜单,不允许删除\",\"code\":301}', 0, NULL, '2020-02-15 09:23:48');
INSERT INTO `sys_oper_log` VALUES (342, '菜单管理', 3, 'com.pepper.project.system.menu.controller.MenuController.remove()', 'GET', 1, 'admin', '研发部门', '/system/menu/remove/1106', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-15 09:23:51');
INSERT INTO `sys_oper_log` VALUES (343, '菜单管理', 3, 'com.pepper.project.system.menu.controller.MenuController.remove()', 'GET', 1, 'admin', '研发部门', '/system/menu/remove/1105', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-15 09:23:56');
INSERT INTO `sys_oper_log` VALUES (344, '活动报名', 5, 'com.pepper.project.cm.activity.controller.ActivityApplyController.export()', 'POST', 1, 'admin', '研发部门', '/cm/activity/apply/export', '127.0.0.1', '内网IP', '{\"activityId\":[\"1\"],\"status\":[\"\"]}', '{\"msg\":\"96aa8087-5219-4b3d-8789-cb71ebf7d35b_活动报名列表_null.xlsx\",\"code\":0}', 0, NULL, '2020-02-15 12:45:18');
INSERT INTO `sys_oper_log` VALUES (345, '活动报名', 5, 'com.pepper.project.cm.activity.controller.ActivityApplyController.export()', 'POST', 1, 'admin', '研发部门', '/cm/activity/apply/export', '127.0.0.1', '内网IP', '{\"activityId\":[\"1\"],\"status\":[\"\"]}', '{\"msg\":\"a0906762-8559-45ab-a7cb-6aeb57f7bf50_活动报名列表_null.xlsx\",\"code\":0}', 0, NULL, '2020-02-15 12:47:54');
INSERT INTO `sys_oper_log` VALUES (346, '活动报名', 5, 'com.pepper.project.cm.activity.controller.ActivityApplyController.export()', 'POST', 1, 'admin', '研发部门', '/cm/activity/apply/export', '127.0.0.1', '内网IP', '{\"activityId\":[\"1\"],\"status\":[\"\"]}', '{\"msg\":\"8f99c9e3-b04b-4821-8818-0ac83b4b0fd5_活动报名列表_null.xlsx\",\"code\":0}', 0, NULL, '2020-02-15 12:56:28');
INSERT INTO `sys_oper_log` VALUES (347, '活动报名', 5, 'com.pepper.project.cm.activity.controller.ActivityApplyController.export()', 'POST', 1, 'admin', '研发部门', '/cm/activity/apply/export', '127.0.0.1', '内网IP', '{\"activityId\":[\"1\"],\"status\":[\"\"]}', '{\"msg\":\"aacb6f5e-7beb-4d78-a1c1-453268219686_活动报名列表_null.xlsx\",\"code\":0}', 0, NULL, '2020-02-15 12:57:15');
INSERT INTO `sys_oper_log` VALUES (348, '活动报名', 5, 'com.pepper.project.cm.activity.controller.ActivityApplyController.export()', 'POST', 1, 'admin', '研发部门', '/cm/activity/apply/export', '127.0.0.1', '内网IP', '{\"activityId\":[\"1\"],\"status\":[\"\"]}', '{\"msg\":\"bb88fb32-2f37-4f3e-85d6-9aab62e5f719_活动报名列表_null.xlsx\",\"code\":0}', 0, NULL, '2020-02-15 12:58:38');
INSERT INTO `sys_oper_log` VALUES (349, '活动报名', 3, 'com.pepper.project.cm.activity.controller.ActivityApplyController.remove()', 'POST', 1, 'admin', '研发部门', '/cm/activity/apply/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"3,1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-15 13:07:36');
INSERT INTO `sys_oper_log` VALUES (350, '活动', 1, 'com.pepper.project.cm.activity.controller.ActivityApplyController.addSave()', 'POST', 1, 'admin', '研发部门', '/cm/activity/apply/add', '127.0.0.1', '内网IP', '{\"userId\":[\"1234444\"],\"activityId\":[\"2\"],\"userMobile\":[\"18506678909\"],\"status\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-15 13:22:30');
INSERT INTO `sys_oper_log` VALUES (351, '活动', 1, 'com.pepper.project.cm.activity.controller.ActivityApplyController.addSave()', 'POST', 1, 'admin', '研发部门', '/cm/activity/apply/add', '127.0.0.1', '内网IP', '{\"userId\":[\"1234444\"],\"activityId\":[\"2\"],\"userMobile\":[\"1222212121\"],\"status\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-15 13:23:01');
INSERT INTO `sys_oper_log` VALUES (352, '活动', 1, 'com.pepper.project.cm.activity.controller.ActivityApplyController.addSave()', 'POST', 1, 'admin', '研发部门', '/cm/activity/apply/add', '127.0.0.1', '内网IP', '{\"userId\":[\"1234444\"],\"activityId\":[\"3\"],\"userMobile\":[\"133435343432\"],\"status\":[\"0\"]}', 'null', 1, '当前选择的报名的活动已下架！', '2020-02-15 13:28:12');
INSERT INTO `sys_oper_log` VALUES (353, '活动报名', 2, 'com.pepper.project.cm.activity.controller.ActivityApplyController.editSave()', 'POST', 1, 'admin', '研发部门', '/cm/activity/apply/edit', '127.0.0.1', '内网IP', '{\"id\":[\"2\"],\"userId\":[\"1234444\"],\"activityId\":[\"2\"],\"userMobile\":[\"18900090009\"],\"status\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-15 13:39:48');
INSERT INTO `sys_oper_log` VALUES (354, '活动报名', 2, 'com.pepper.project.cm.activity.controller.ActivityApplyController.editSave()', 'POST', 1, 'admin', '研发部门', '/cm/activity/apply/edit', '127.0.0.1', '内网IP', '{\"id\":[\"2\"],\"userId\":[\"1234444\"],\"activityId\":[\"2\"],\"userMobile\":[\"1899999999\"],\"status\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-15 13:40:42');
INSERT INTO `sys_oper_log` VALUES (355, '菜单管理', 1, 'com.pepper.project.system.menu.controller.MenuController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"1094\"],\"menuType\":[\"C\"],\"menuName\":[\"办事指南\"],\"url\":[\"/cm/guide\"],\"target\":[\"menuItem\"],\"perms\":[\"cm:guide:view\"],\"orderNum\":[\"3\"],\"icon\":[\"fa fa-calendar\"],\"visible\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-15 14:10:46');
INSERT INTO `sys_oper_log` VALUES (356, '菜单管理', 1, 'com.pepper.project.system.menu.controller.MenuController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"1107\"],\"menuType\":[\"F\"],\"menuName\":[\"办事指南查询\"],\"url\":[\"\"],\"target\":[\"menuItem\"],\"perms\":[\"cm:guide:list\"],\"orderNum\":[\"1\"],\"icon\":[\"\"],\"visible\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-15 14:11:07');
INSERT INTO `sys_oper_log` VALUES (357, '菜单管理', 1, 'com.pepper.project.system.menu.controller.MenuController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"1107\"],\"menuType\":[\"F\"],\"menuName\":[\"办事指南新增\"],\"url\":[\"\"],\"target\":[\"menuItem\"],\"perms\":[\"cm:guide:add\"],\"orderNum\":[\"2\"],\"icon\":[\"\"],\"visible\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-15 14:11:30');
INSERT INTO `sys_oper_log` VALUES (358, '菜单管理', 1, 'com.pepper.project.system.menu.controller.MenuController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"1107\"],\"menuType\":[\"F\"],\"menuName\":[\"办事指南修改\"],\"url\":[\"\"],\"target\":[\"menuItem\"],\"perms\":[\"cm:guide:edit\"],\"orderNum\":[\"3\"],\"icon\":[\"\"],\"visible\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-15 14:11:56');
INSERT INTO `sys_oper_log` VALUES (359, '菜单管理', 1, 'com.pepper.project.system.menu.controller.MenuController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"1107\"],\"menuType\":[\"F\"],\"menuName\":[\"办事指南删除\"],\"url\":[\"\"],\"target\":[\"menuItem\"],\"perms\":[\"cm:guide:delete\"],\"orderNum\":[\"4\"],\"icon\":[\"\"],\"visible\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-15 14:12:15');
INSERT INTO `sys_oper_log` VALUES (360, '社区', 2, 'com.pepper.project.cm.community.controller.CommunityController.editSave()', 'POST', 1, 'admin', '研发部门', '/cm/community/edit', '127.0.0.1', '内网IP', '{\"id\":[\"1\"],\"communityName\":[\"沙依巴克区花园社区\"],\"communityCode\":[\"sybk_beautiful\"],\"introduction\":[\"<p>沙发沙发</p>\"],\"areaId\":[\"3\"],\"status\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-15 14:33:45');
INSERT INTO `sys_oper_log` VALUES (361, '医院介绍', 1, 'com.pepper.project.cm.guide.controller.GuideController.addSave()', 'POST', 1, 'admin', '研发部门', '/cm/guide/add', '127.0.0.1', '内网IP', '{\"title\":[\"乘坐电梯规范\"],\"content\":[\"<p>乘坐电梯规范</p>\"],\"areaId\":[\"2\"],\"status\":[\"0\"]}', 'null', 1, '\r\n### Error updating database.  Cause: java.sql.SQLSyntaxErrorException: Unknown column \'create_by\' in \'field list\'\r\n### The error may involve com.pepper.project.cm.guide.mapper.GuideMapper.insertGuide-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into cm_business_guide (    title,      content,          status,      create_by,     update_by,    create_time,   update_time   )values(    ?,      ?,          ?,      ?,     ?,    sysdate(),   sysdate()   )\r\n### Cause: java.sql.SQLSyntaxErrorException: Unknown column \'create_by\' in \'field list\'\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: Unknown column \'create_by\' in \'field list\'', '2020-02-15 14:34:25');
INSERT INTO `sys_oper_log` VALUES (362, '医院介绍', 1, 'com.pepper.project.cm.guide.controller.GuideController.addSave()', 'POST', 1, 'admin', '研发部门', '/cm/guide/add', '127.0.0.1', '内网IP', '{\"title\":[\"乘坐电梯规范\"],\"content\":[\"<p>乘坐电梯规范</p>\"],\"areaId\":[\"2\"],\"status\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-15 14:35:14');
INSERT INTO `sys_oper_log` VALUES (363, '医院介绍', 2, 'com.pepper.project.cm.guide.controller.GuideController.editSave()', 'POST', 1, 'admin', '研发部门', '/cm/guide/edit', '127.0.0.1', '内网IP', '{\"id\":[\"1\"],\"title\":[\"乘坐电梯规范\"],\"content\":[\"<p>乘坐电梯规范</p>\"],\"communityId\":[\"2\"],\"status\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-15 14:49:44');
INSERT INTO `sys_oper_log` VALUES (364, '医院介绍', 2, 'com.pepper.project.cm.guide.controller.GuideController.editSave()', 'POST', 1, 'admin', '研发部门', '/cm/guide/edit', '127.0.0.1', '内网IP', '{\"id\":[\"1\"],\"title\":[\"乘坐电梯规范\"],\"content\":[\"<p>乘坐电梯规范<img src=\\\"http://localhost/profile/upload/2020/02/15/af63a7a83a4acd530f015be70a64539a.png\\\" data-filename=\\\"/profile/upload/2020/02/15/af63a7a83a4acd530f015be70a64539a.png\\\" style=\\\"width: 500px;\\\"></p>\"],\"communityId\":[\"2\"],\"status\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-15 14:50:01');
INSERT INTO `sys_oper_log` VALUES (365, '医院介绍', 2, 'com.pepper.project.cm.guide.controller.GuideController.editSave()', 'POST', 1, 'admin', '研发部门', '/cm/guide/edit', '127.0.0.1', '内网IP', '{\"id\":[\"1\"],\"title\":[\"乘坐电梯规范\"],\"content\":[\"<p>乘坐电梯规范<img src=\\\"http://localhost/profile/upload/2020/02/15/af63a7a83a4acd530f015be70a64539a.png\\\" data-filename=\\\"/profile/upload/2020/02/15/af63a7a83a4acd530f015be70a64539a.png\\\" style=\\\"width: 500px;\\\"></p><p><br></p><p><img style=\\\"width: 600px;\\\" src=\\\"http://localhost/profile/upload/2020/02/15/1d5d079c6304d571fe8e088af83cb8eb.jpg\\\" data-filename=\\\"/profile/upload/2020/02/15/1d5d079c6304d571fe8e088af83cb8eb.jpg\\\"><br></p><p><br></p>\"],\"communityId\":[\"2\"],\"status\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-15 14:51:11');
INSERT INTO `sys_oper_log` VALUES (366, '用户管理', 1, 'com.pepper.project.system.user.controller.UserController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/user/add', '127.0.0.1', '内网IP', '{\"deptId\":[\"103\"],\"userName\":[\"hanjietao1\"],\"deptName\":[\"研发部门\"],\"phonenumber\":[\"18900099990\"],\"email\":[\"hanjietao@123.com\"],\"loginName\":[\"hanjietao1\"],\"password\":[\"123456\"],\"sex\":[\"0\"],\"role\":[\"2\"],\"remark\":[\"\"],\"status\":[\"0\"],\"roleIds\":[\"2\"],\"postIds\":[\"2\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-15 16:36:07');
INSERT INTO `sys_oper_log` VALUES (367, '医院介绍', 2, 'com.pepper.project.cm.guide.controller.GuideController.editSave()', 'POST', 1, 'admin', '研发部门', '/cm/guide/edit', '127.0.0.1', '内网IP', '{\"id\":[\"1\"],\"title\":[\"乘坐电梯规范\"],\"content\":[\"<p>乘坐电梯规范<img src=\\\"http://localhost/profile/upload/2020/02/15/af63a7a83a4acd530f015be70a64539a.png\\\" data-filename=\\\"/profile/upload/2020/02/15/af63a7a83a4acd530f015be70a64539a.png\\\" style=\\\"width: 500px;\\\"></p><p><br></p><p><img style=\\\"width: 600px;\\\" src=\\\"http://localhost/profile/upload/2020/02/15/1d5d079c6304d571fe8e088af83cb8eb.jpg\\\" data-filename=\\\"/profile/upload/2020/02/15/1d5d079c6304d571fe8e088af83cb8eb.jpg\\\"><br></p><p><br></p>\"],\"communityId\":[\"2\"],\"status\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-16 05:58:10');
INSERT INTO `sys_oper_log` VALUES (368, '医院介绍', 1, 'com.pepper.project.cm.guide.controller.GuideController.addSave()', 'POST', 1, 'admin', '研发部门', '/cm/guide/add', '127.0.0.1', '内网IP', '{\"title\":[\"hello\"],\"content\":[\"<p>hello</p><p><img src=\\\"http://localhost/profile/upload/2020/02/16/1f28f43cd6ad2605d304b858489803d0.jpg\\\" data-filename=\\\"/profile/upload/2020/02/16/1f28f43cd6ad2605d304b858489803d0.jpg\\\" style=\\\"width: 800px;\\\"><br></p>\"],\"areaId\":[\"1\"],\"status\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-16 06:06:55');
INSERT INTO `sys_oper_log` VALUES (369, '医院介绍', 2, 'com.pepper.project.cm.guide.controller.GuideController.editSave()', 'POST', 1, 'admin', '研发部门', '/cm/guide/edit', '127.0.0.1', '内网IP', '{\"id\":[\"2\"],\"title\":[\"hello\"],\"content\":[\"<p>hello</p><p><img src=\\\"http://localhost/profile/upload/2020/02/16/1f28f43cd6ad2605d304b858489803d0.jpg\\\" data-filename=\\\"/profile/upload/2020/02/16/1f28f43cd6ad2605d304b858489803d0.jpg\\\" style=\\\"width: 800px;\\\"><br></p>\"],\"communityId\":[\"1\"],\"status\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-16 06:07:01');
INSERT INTO `sys_oper_log` VALUES (370, '医院介绍', 1, 'com.pepper.project.cm.guide.controller.GuideController.addSave()', 'POST', 1, 'admin', '研发部门', '/cm/guide/add', '127.0.0.1', '内网IP', '{\"title\":[\"qqqq\"],\"content\":[\"<p>qqqqqq</p>\"],\"areaId\":[\"1\"],\"status\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-16 06:07:24');
INSERT INTO `sys_oper_log` VALUES (371, '医院介绍', 2, 'com.pepper.project.cm.guide.controller.GuideController.editSave()', 'POST', 1, 'admin', '研发部门', '/cm/guide/edit', '127.0.0.1', '内网IP', '{\"id\":[\"3\"],\"title\":[\"qqqq\"],\"content\":[\"<p>qqqqqq</p>\"],\"communityId\":[\"1\"],\"status\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-16 06:08:39');
INSERT INTO `sys_oper_log` VALUES (372, '医院介绍', 1, 'com.pepper.project.cm.guide.controller.GuideController.addSave()', 'POST', 1, 'admin', '研发部门', '/cm/guide/add', '127.0.0.1', '内网IP', '{\"title\":[\"sdfsdfsd\"],\"content\":[\"<p>fsdfsdfsd</p>\"],\"communityId\":[\"1\"],\"status\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-16 06:08:47');
INSERT INTO `sys_oper_log` VALUES (373, '菜单管理', 1, 'com.pepper.project.system.menu.controller.MenuController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"1094\"],\"menuType\":[\"C\"],\"menuName\":[\"留言查看\"],\"url\":[\"/cm/note\"],\"target\":[\"menuItem\"],\"perms\":[\"cm:node:view\"],\"orderNum\":[\"4\"],\"icon\":[\"fa fa-leaf\"],\"visible\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-16 11:40:51');
INSERT INTO `sys_oper_log` VALUES (374, '菜单管理', 1, 'com.pepper.project.system.menu.controller.MenuController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"1112\"],\"menuType\":[\"F\"],\"menuName\":[\"留言查询\"],\"url\":[\"\"],\"target\":[\"menuItem\"],\"perms\":[\"cm:note:list\"],\"orderNum\":[\"1\"],\"icon\":[\"\"],\"visible\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-16 11:41:42');
INSERT INTO `sys_oper_log` VALUES (375, '菜单管理', 1, 'com.pepper.project.system.menu.controller.MenuController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"1112\"],\"menuType\":[\"F\"],\"menuName\":[\"留言删除\"],\"url\":[\"\"],\"target\":[\"menuItem\"],\"perms\":[\"cm:note:delete\"],\"orderNum\":[\"2\"],\"icon\":[\"\"],\"visible\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-16 11:42:04');
INSERT INTO `sys_oper_log` VALUES (376, '医院介绍', 1, 'com.pepper.project.cm.guide.controller.GuideController.addSave()', 'POST', 1, 'admin', '研发部门', '/cm/guide/add', '127.0.0.1', '内网IP', '{\"userId\":[\"1234444\"],\"content\":[\"nimeide \"],\"communityId\":[\"1\"],\"status\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-16 12:35:39');
INSERT INTO `sys_oper_log` VALUES (377, '医院介绍', 3, 'com.pepper.project.cm.guide.controller.GuideController.remove()', 'POST', 1, 'admin', '研发部门', '/cm/guide/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"5\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-16 12:36:50');
INSERT INTO `sys_oper_log` VALUES (378, '社区留言', 1, 'com.pepper.project.cm.note.controller.NoteController.addSave()', 'POST', 1, 'admin', '研发部门', '/cm/note/add', '127.0.0.1', '内网IP', '{\"userId\":[\"1234444\"],\"content\":[\"新建一个留言模拟试试\"],\"communityId\":[\"1\"],\"status\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-16 12:37:08');
INSERT INTO `sys_oper_log` VALUES (379, '社区留言', 3, 'com.pepper.project.cm.note.controller.NoteController.remove()', 'POST', 1, 'admin', '研发部门', '/cm/note/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"null\"]}', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2020-02-16 12:38:37');
INSERT INTO `sys_oper_log` VALUES (380, '社区留言', 1, 'com.pepper.project.cm.note.controller.NoteController.addSave()', 'POST', 1, 'admin', '研发部门', '/cm/note/add', '127.0.0.1', '内网IP', '{\"userId\":[\"1234444\"],\"content\":[\"DDDDD\"],\"communityId\":[\"1\"],\"status\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-16 12:39:08');
INSERT INTO `sys_oper_log` VALUES (381, '社区留言', 3, 'com.pepper.project.cm.note.controller.NoteController.remove()', 'POST', 1, 'admin', '研发部门', '/cm/note/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-16 12:39:18');
INSERT INTO `sys_oper_log` VALUES (382, '社区留言', 1, 'com.pepper.project.cm.note.controller.NoteController.addSave()', 'POST', 1, 'admin', '研发部门', '/cm/note/add', '127.0.0.1', '内网IP', '{\"userId\":[\"1234444\"],\"content\":[\"DDDDSSSSDDDDF\"],\"communityId\":[\"1\"],\"status\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-16 12:39:25');
INSERT INTO `sys_oper_log` VALUES (383, '社区留言', 2, 'com.pepper.project.cm.note.controller.NoteController.editSave()', 'POST', 1, 'admin', '研发部门', '/cm/note/edit', '127.0.0.1', '内网IP', '{\"id\":[\"2\"],\"userId\":[\"1234444\"],\"content\":[\"DDDDSSSSDDDDF111\"],\"communityId\":[\"1\"],\"status\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-16 12:39:30');
INSERT INTO `sys_oper_log` VALUES (384, '社区留言', 2, 'com.pepper.project.cm.note.controller.NoteController.editSave()', 'POST', 1, 'admin', '研发部门', '/cm/note/edit', '127.0.0.1', '内网IP', '{\"id\":[\"2\"],\"userId\":[\"1234444\"],\"content\":[\"DDDDSSSSDDDDF111DDD\"],\"communityId\":[\"1\"],\"status\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-16 12:39:35');
INSERT INTO `sys_oper_log` VALUES (385, '社区留言', 2, 'com.pepper.project.cm.note.controller.NoteController.editSave()', 'POST', 1, 'admin', '研发部门', '/cm/note/edit', '127.0.0.1', '内网IP', '{\"id\":[\"2\"],\"userId\":[\"1234444\"],\"content\":[\"DDDDSSSSDDDDF111DDD\"],\"communityId\":[\"1\"],\"status\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-16 13:01:50');
INSERT INTO `sys_oper_log` VALUES (386, '社区留言', 2, 'com.pepper.project.cm.note.controller.NoteController.editSave()', 'POST', 1, 'admin', '研发部门', '/cm/note/edit', '127.0.0.1', '内网IP', '{\"id\":[\"2\"],\"userId\":[\"1234444\"],\"content\":[\"DDDDSSSSDDDDF111DDD\"],\"communityId\":[\"1\"],\"status\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-16 13:01:53');
INSERT INTO `sys_oper_log` VALUES (387, '菜单管理', 1, 'com.pepper.project.system.menu.controller.MenuController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"0\"],\"menuType\":[\"M\"],\"menuName\":[\"物业管理\"],\"url\":[\"\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"6\"],\"icon\":[\"fa fa-archive\"],\"visible\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-16 13:03:09');
INSERT INTO `sys_oper_log` VALUES (388, '菜单管理', 2, 'com.pepper.project.system.menu.controller.MenuController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"1094\"],\"parentId\":[\"0\"],\"menuType\":[\"M\"],\"menuName\":[\"社区管理\"],\"url\":[\"#\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"5\"],\"icon\":[\"fa fa-home\"],\"visible\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-16 13:03:16');
INSERT INTO `sys_oper_log` VALUES (389, '菜单管理', 1, 'com.pepper.project.system.menu.controller.MenuController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"1115\"],\"menuType\":[\"C\"],\"menuName\":[\"物业列表\"],\"url\":[\"/pm/proporty\"],\"target\":[\"menuItem\"],\"perms\":[\"pm:property\"],\"orderNum\":[\"1\"],\"icon\":[\"fa fa-bank\"],\"visible\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-16 13:07:19');
INSERT INTO `sys_oper_log` VALUES (390, '菜单管理', 2, 'com.pepper.project.system.menu.controller.MenuController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"1095\"],\"parentId\":[\"1094\"],\"menuType\":[\"C\"],\"menuName\":[\"社区列表\"],\"url\":[\"/cm/community\"],\"target\":[\"menuItem\"],\"perms\":[\"cm:community:view\"],\"orderNum\":[\"1\"],\"icon\":[\"fa fa-child\"],\"visible\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-16 13:07:35');
INSERT INTO `sys_oper_log` VALUES (391, '菜单管理', 2, 'com.pepper.project.system.menu.controller.MenuController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"1116\"],\"parentId\":[\"1115\"],\"menuType\":[\"C\"],\"menuName\":[\"物业列表\"],\"url\":[\"/pm/property\"],\"target\":[\"menuItem\"],\"perms\":[\"pm:property:view\"],\"orderNum\":[\"1\"],\"icon\":[\"fa fa-bank\"],\"visible\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-16 13:08:12');
INSERT INTO `sys_oper_log` VALUES (392, '菜单管理', 1, 'com.pepper.project.system.menu.controller.MenuController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"1116\"],\"menuType\":[\"F\"],\"menuName\":[\"社区查询\"],\"url\":[\"\"],\"target\":[\"menuItem\"],\"perms\":[\"pm:property:list\"],\"orderNum\":[\"1\"],\"icon\":[\"\"],\"visible\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-16 13:08:48');
INSERT INTO `sys_oper_log` VALUES (393, '菜单管理', 2, 'com.pepper.project.system.menu.controller.MenuController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"1117\"],\"parentId\":[\"1116\"],\"menuType\":[\"F\"],\"menuName\":[\"物业列表查询\"],\"url\":[\"#\"],\"target\":[\"menuItem\"],\"perms\":[\"pm:property:list\"],\"orderNum\":[\"1\"],\"icon\":[\"#\"],\"visible\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-16 13:09:01');
INSERT INTO `sys_oper_log` VALUES (394, '菜单管理', 1, 'com.pepper.project.system.menu.controller.MenuController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"1116\"],\"menuType\":[\"F\"],\"menuName\":[\"物业新增\"],\"url\":[\"\"],\"target\":[\"menuItem\"],\"perms\":[\"pm:property:add\"],\"orderNum\":[\"2\"],\"icon\":[\"\"],\"visible\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-16 13:09:53');
INSERT INTO `sys_oper_log` VALUES (395, '菜单管理', 1, 'com.pepper.project.system.menu.controller.MenuController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"1116\"],\"menuType\":[\"F\"],\"menuName\":[\"物业修改\"],\"url\":[\"\"],\"target\":[\"menuItem\"],\"perms\":[\"pm:property:edit\"],\"orderNum\":[\"3\"],\"icon\":[\"\"],\"visible\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-16 13:10:33');
INSERT INTO `sys_oper_log` VALUES (396, '菜单管理', 1, 'com.pepper.project.system.menu.controller.MenuController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"1116\"],\"menuType\":[\"F\"],\"menuName\":[\"物业删除\"],\"url\":[\"\"],\"target\":[\"menuItem\"],\"perms\":[\"pm:property:delete\"],\"orderNum\":[\"4\"],\"icon\":[\"\"],\"visible\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-16 13:11:02');
INSERT INTO `sys_oper_log` VALUES (397, '活动', 2, 'com.pepper.project.cm.activity.controller.ActivityController.editSave()', 'POST', 1, 'admin', '研发部门', '/cm/activity/edit', '127.0.0.1', '内网IP', '{\"id\":[\"2\"],\"communityId\":[\"2\"],\"title\":[\"天山区花园社区迎接新春活动\"],\"content\":[\"<p>222</p>\"],\"status\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-16 13:37:55');
INSERT INTO `sys_oper_log` VALUES (398, '活动', 2, 'com.pepper.project.cm.activity.controller.ActivityController.editSave()', 'POST', 1, 'admin', '研发部门', '/cm/activity/edit', '127.0.0.1', '内网IP', '{\"id\":[\"1\"],\"communityId\":[\"1\"],\"title\":[\"沙依巴克区十月红社区服务中心2020防疫献爱心活动\"],\"content\":[\"<p>sfdfsf</p>\"],\"status\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-16 13:38:05');
INSERT INTO `sys_oper_log` VALUES (399, '活动', 2, 'com.pepper.project.cm.activity.controller.ActivityController.editSave()', 'POST', 1, 'admin', '研发部门', '/cm/activity/edit', '127.0.0.1', '内网IP', '{\"id\":[\"2\"],\"communityId\":[\"2\"],\"title\":[\"天山区花园社区迎接新春活动\"],\"content\":[\"<p>222</p>\"],\"status\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-16 13:40:40');
INSERT INTO `sys_oper_log` VALUES (400, '活动', 2, 'com.pepper.project.cm.activity.controller.ActivityController.editSave()', 'POST', 1, 'admin', '研发部门', '/cm/activity/edit', '127.0.0.1', '内网IP', '{\"id\":[\"1\"],\"communityId\":[\"1\"],\"title\":[\"沙依巴克区十月红社区服务中心2020防疫献爱心活动\"],\"content\":[\"<p>sfdfsf</p>\"],\"status\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-16 13:41:38');
INSERT INTO `sys_oper_log` VALUES (401, '菜单管理', 1, 'com.pepper.project.system.menu.controller.MenuController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"1115\"],\"menuType\":[\"C\"],\"menuName\":[\"活动管理\"],\"url\":[\"/pm/activity\"],\"target\":[\"menuItem\"],\"perms\":[\"pm:activity:view\"],\"orderNum\":[\"2\"],\"icon\":[\"fa fa-archive\"],\"visible\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-17 02:53:49');
INSERT INTO `sys_oper_log` VALUES (402, '菜单管理', 1, 'com.pepper.project.system.menu.controller.MenuController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"1115\"],\"menuType\":[\"C\"],\"menuName\":[\"留言管理\"],\"url\":[\"/pm/note\"],\"target\":[\"menuItem\"],\"perms\":[\"pm:note:view\"],\"orderNum\":[\"2\"],\"icon\":[\"fa fa-id-badge\"],\"visible\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-17 02:56:46');
INSERT INTO `sys_oper_log` VALUES (403, '菜单管理', 2, 'com.pepper.project.system.menu.controller.MenuController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"1122\"],\"parentId\":[\"1115\"],\"menuType\":[\"C\"],\"menuName\":[\"留言管理\"],\"url\":[\"/pm/note\"],\"target\":[\"menuItem\"],\"perms\":[\"pm:note:view\"],\"orderNum\":[\"4\"],\"icon\":[\"fa fa-id-badge\"],\"visible\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-17 02:57:35');
INSERT INTO `sys_oper_log` VALUES (404, '菜单管理', 2, 'com.pepper.project.system.menu.controller.MenuController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"1116\"],\"parentId\":[\"1115\"],\"menuType\":[\"F\"],\"menuName\":[\"物业列表\"],\"url\":[\"/pm/property\"],\"target\":[\"menuItem\"],\"perms\":[\"pm:property:view\"],\"orderNum\":[\"1\"],\"icon\":[\"fa fa-bank\"],\"visible\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-17 02:57:50');
INSERT INTO `sys_oper_log` VALUES (405, '菜单管理', 2, 'com.pepper.project.system.menu.controller.MenuController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"1116\"],\"parentId\":[\"1115\"],\"menuType\":[\"C\"],\"menuName\":[\"物业列表\"],\"url\":[\"/pm/property\"],\"target\":[\"menuItem\"],\"perms\":[\"pm:property:view\"],\"orderNum\":[\"1\"],\"icon\":[\"fa fa-bank\"],\"visible\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-17 02:58:34');
INSERT INTO `sys_oper_log` VALUES (406, '菜单管理', 2, 'com.pepper.project.system.menu.controller.MenuController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"1116\"],\"parentId\":[\"1115\"],\"menuType\":[\"C\"],\"menuName\":[\"物业管理\"],\"url\":[\"/pm/property\"],\"target\":[\"menuItem\"],\"perms\":[\"pm:property:view\"],\"orderNum\":[\"1\"],\"icon\":[\"fa fa-bank\"],\"visible\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-17 02:58:45');
INSERT INTO `sys_oper_log` VALUES (407, '菜单管理', 1, 'com.pepper.project.system.menu.controller.MenuController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"1115\"],\"menuType\":[\"C\"],\"menuName\":[\"办事指南\"],\"url\":[\"/pm/guide\"],\"target\":[\"menuItem\"],\"perms\":[\"pm:guide:view\"],\"orderNum\":[\"3\"],\"icon\":[\"fa fa-language\"],\"visible\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-17 02:59:35');
INSERT INTO `sys_oper_log` VALUES (408, '菜单管理', 1, 'com.pepper.project.system.menu.controller.MenuController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"1121\"],\"menuType\":[\"F\"],\"menuName\":[\"活动查询\"],\"url\":[\"\"],\"target\":[\"menuItem\"],\"perms\":[\"pm:activity:list\"],\"orderNum\":[\"1\"],\"icon\":[\"\"],\"visible\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-17 03:01:00');
INSERT INTO `sys_oper_log` VALUES (409, '菜单管理', 1, 'com.pepper.project.system.menu.controller.MenuController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"1121\"],\"menuType\":[\"F\"],\"menuName\":[\"活动编辑\"],\"url\":[\"\"],\"target\":[\"menuItem\"],\"perms\":[\"pm:activity:edit\"],\"orderNum\":[\"2\"],\"icon\":[\"\"],\"visible\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-17 03:01:20');
INSERT INTO `sys_oper_log` VALUES (410, '菜单管理', 1, 'com.pepper.project.system.menu.controller.MenuController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"1121\"],\"menuType\":[\"F\"],\"menuName\":[\"活动新增\"],\"url\":[\"\"],\"target\":[\"menuItem\"],\"perms\":[\"pm:activity:add\"],\"orderNum\":[\"2\"],\"icon\":[\"\"],\"visible\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-17 03:01:47');
INSERT INTO `sys_oper_log` VALUES (411, '菜单管理', 2, 'com.pepper.project.system.menu.controller.MenuController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"1125\"],\"parentId\":[\"1121\"],\"menuType\":[\"F\"],\"menuName\":[\"活动编辑\"],\"url\":[\"#\"],\"target\":[\"menuItem\"],\"perms\":[\"pm:activity:edit\"],\"orderNum\":[\"3\"],\"icon\":[\"#\"],\"visible\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-17 03:01:57');
INSERT INTO `sys_oper_log` VALUES (412, '菜单管理', 1, 'com.pepper.project.system.menu.controller.MenuController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"1121\"],\"menuType\":[\"F\"],\"menuName\":[\"活动删除\"],\"url\":[\"\"],\"target\":[\"menuItem\"],\"perms\":[\"pm:activity:delete\"],\"orderNum\":[\"4\"],\"icon\":[\"\"],\"visible\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-17 03:02:17');
INSERT INTO `sys_oper_log` VALUES (413, '菜单管理', 1, 'com.pepper.project.system.menu.controller.MenuController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"1123\"],\"menuType\":[\"F\"],\"menuName\":[\"办事指南查询\"],\"url\":[\"\"],\"target\":[\"menuItem\"],\"perms\":[\"pm:guide:list\"],\"orderNum\":[\"1\"],\"icon\":[\"\"],\"visible\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-17 03:02:45');
INSERT INTO `sys_oper_log` VALUES (414, '菜单管理', 1, 'com.pepper.project.system.menu.controller.MenuController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"1123\"],\"menuType\":[\"F\"],\"menuName\":[\"活动指南新增\"],\"url\":[\"\"],\"target\":[\"menuItem\"],\"perms\":[\"pm:activity:add\"],\"orderNum\":[\"2\"],\"icon\":[\"\"],\"visible\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-17 03:03:06');
INSERT INTO `sys_oper_log` VALUES (415, '菜单管理', 1, 'com.pepper.project.system.menu.controller.MenuController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"1123\"],\"menuType\":[\"F\"],\"menuName\":[\"办事指南编辑\"],\"url\":[\"\"],\"target\":[\"menuItem\"],\"perms\":[\"pm:guide:edit\"],\"orderNum\":[\"3\"],\"icon\":[\"\"],\"visible\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-17 03:03:53');
INSERT INTO `sys_oper_log` VALUES (416, '菜单管理', 1, 'com.pepper.project.system.menu.controller.MenuController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"1123\"],\"menuType\":[\"F\"],\"menuName\":[\"pm:guide:delete\"],\"url\":[\"\"],\"target\":[\"menuItem\"],\"perms\":[\"办事指南删除\"],\"orderNum\":[\"4\"],\"icon\":[\"\"],\"visible\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-17 03:04:15');
INSERT INTO `sys_oper_log` VALUES (417, '菜单管理', 1, 'com.pepper.project.system.menu.controller.MenuController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"1122\"],\"menuType\":[\"F\"],\"menuName\":[\"留言列表查询\"],\"url\":[\"\"],\"target\":[\"menuItem\"],\"perms\":[\"pm:note:list\"],\"orderNum\":[\"1\"],\"icon\":[\"\"],\"visible\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-17 03:04:48');
INSERT INTO `sys_oper_log` VALUES (418, '菜单管理', 1, 'com.pepper.project.system.menu.controller.MenuController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"1122\"],\"menuType\":[\"F\"],\"menuName\":[\"留言新增\"],\"url\":[\"\"],\"target\":[\"menuItem\"],\"perms\":[\"pm:note:add\"],\"orderNum\":[\"2\"],\"icon\":[\"\"],\"visible\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-17 03:05:16');
INSERT INTO `sys_oper_log` VALUES (419, '菜单管理', 1, 'com.pepper.project.system.menu.controller.MenuController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"1122\"],\"menuType\":[\"F\"],\"menuName\":[\"留言编辑\"],\"url\":[\"\"],\"target\":[\"menuItem\"],\"perms\":[\"pm:note:edit\"],\"orderNum\":[\"3\"],\"icon\":[\"\"],\"visible\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-17 03:05:36');
INSERT INTO `sys_oper_log` VALUES (420, '菜单管理', 1, 'com.pepper.project.system.menu.controller.MenuController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"1122\"],\"menuType\":[\"F\"],\"menuName\":[\"留言删除\"],\"url\":[\"\"],\"target\":[\"menuItem\"],\"perms\":[\"pm:note:delete\"],\"orderNum\":[\"4\"],\"icon\":[\"\"],\"visible\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-17 03:05:58');
INSERT INTO `sys_oper_log` VALUES (421, '物业', 1, 'com.pepper.project.pm.property.controller.PropertyController.addSave()', 'POST', 1, 'admin', '研发部门', '/pm/property/add', '127.0.0.1', '内网IP', '{\"propertyName\":[\"天山区  鼎盛物业管理\"],\"propertyCode\":[\"100292\"],\"introduction\":[\"<p>大幅降低司法局四点</p>\"],\"areaId\":[\"3\"],\"status\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-17 03:31:40');
INSERT INTO `sys_oper_log` VALUES (422, '办事指南', 1, 'com.pepper.project.pm.guide.controller.GuidePmController.addSave()', 'POST', 1, 'admin', '研发部门', '/pm/guide/add', '127.0.0.1', '内网IP', '{\"title\":[\"11111\"],\"content\":[\"<p>11111</p>\"],\"propertyId\":[\"1\"],\"status\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-17 03:41:51');
INSERT INTO `sys_oper_log` VALUES (423, '社区留言', 1, 'com.pepper.project.pm.note.controller.NotePmController.addSave()', 'POST', 1, 'admin', '研发部门', '/pm/note/add', '127.0.0.1', '内网IP', '{\"userId\":[\"1234444\"],\"content\":[\"333333\"],\"propertyId\":[\"1\"],\"status\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-17 03:43:19');
INSERT INTO `sys_oper_log` VALUES (424, '社区留言', 2, 'com.pepper.project.pm.note.controller.NotePmController.editSave()', 'POST', 1, 'admin', '研发部门', '/pm/note/edit', '127.0.0.1', '内网IP', '{\"id\":[\"1\"],\"userId\":[\"1234444\"],\"content\":[\"333333\"],\"propertyId\":[\"1\"],\"status\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-17 03:46:15');
INSERT INTO `sys_oper_log` VALUES (425, '社区留言', 2, 'com.pepper.project.pm.note.controller.NotePmController.editSave()', 'POST', 1, 'admin', '研发部门', '/pm/note/edit', '127.0.0.1', '内网IP', '{\"id\":[\"1\"],\"userId\":[\"1234444\"],\"content\":[\"333333232323\"],\"propertyId\":[\"1\"],\"status\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-17 03:46:21');
INSERT INTO `sys_oper_log` VALUES (426, '社区留言', 2, 'com.pepper.project.pm.note.controller.NotePmController.editSave()', 'POST', 1, 'admin', '研发部门', '/pm/note/edit', '127.0.0.1', '内网IP', '{\"id\":[\"1\"],\"userId\":[\"1234444\"],\"content\":[\"123456678899\"],\"propertyId\":[\"1\"],\"status\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-17 03:46:31');
INSERT INTO `sys_oper_log` VALUES (427, '办事指南', 2, 'com.pepper.project.pm.guide.controller.GuidePmController.editSave()', 'POST', 1, 'admin', '研发部门', '/pm/guide/edit', '127.0.0.1', '内网IP', '{\"id\":[\"1\"],\"title\":[\"11111\"],\"content\":[\"<p>11111</p>\"],\"propertyId\":[\"1\"],\"status\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-17 03:46:41');
INSERT INTO `sys_oper_log` VALUES (428, '活动', 1, 'com.pepper.project.pm.activity.controller.ActivityPmController.addSave()', 'POST', 1, 'admin', '研发部门', '/pm/activity/add', '127.0.0.1', '内网IP', '{\"propertyId\":[\"1\"],\"title\":[\"鼎盛物业  缴费优惠活动\"],\"content\":[\"<p>3年连续缴存 ，8折</p>\"],\"status\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-17 03:47:34');
INSERT INTO `sys_oper_log` VALUES (429, '物业', 2, 'com.pepper.project.pm.property.controller.PropertyController.editSave()', 'POST', 1, 'admin', '研发部门', '/pm/property/edit', '127.0.0.1', '内网IP', '{\"id\":[\"1\"],\"propertyName\":[\"天山区  鼎盛物业管理\"],\"propertyCode\":[\"100292\"],\"introduction\":[\"<p>大幅降低司法局四点顶顶顶顶</p>\"],\"areaId\":[\"3\"],\"status\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-17 03:52:35');
INSERT INTO `sys_oper_log` VALUES (430, '菜单管理', 2, 'com.pepper.project.system.menu.controller.MenuController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"1123\"],\"parentId\":[\"1115\"],\"menuType\":[\"C\"],\"menuName\":[\"办事指南\"],\"url\":[\"/pm/guide\"],\"target\":[\"menuItem\"],\"perms\":[\"pm:guide:view\"],\"orderNum\":[\"4\"],\"icon\":[\"fa fa-language\"],\"visible\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-17 05:20:13');
INSERT INTO `sys_oper_log` VALUES (431, '菜单管理', 2, 'com.pepper.project.system.menu.controller.MenuController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"1123\"],\"parentId\":[\"1115\"],\"menuType\":[\"C\"],\"menuName\":[\"办事指南\"],\"url\":[\"/pm/guide\"],\"target\":[\"menuItem\"],\"perms\":[\"pm:guide:view\"],\"orderNum\":[\"5\"],\"icon\":[\"fa fa-language\"],\"visible\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-17 05:20:20');
INSERT INTO `sys_oper_log` VALUES (432, '菜单管理', 1, 'com.pepper.project.system.menu.controller.MenuController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"1115\"],\"menuType\":[\"C\"],\"menuName\":[\"物业通知\"],\"url\":[\"/pm/notice\"],\"target\":[\"menuItem\"],\"perms\":[\"pm:notice:view\"],\"orderNum\":[\"3\"],\"icon\":[\"fa fa-bars\"],\"visible\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-17 05:21:13');
INSERT INTO `sys_oper_log` VALUES (433, '菜单管理', 1, 'com.pepper.project.system.menu.controller.MenuController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"1136\"],\"menuType\":[\"F\"],\"menuName\":[\"通知列表查询\"],\"url\":[\"\"],\"target\":[\"menuItem\"],\"perms\":[\"pm:notice:list\"],\"orderNum\":[\"1\"],\"icon\":[\"\"],\"visible\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-17 05:21:33');
INSERT INTO `sys_oper_log` VALUES (434, '菜单管理', 1, 'com.pepper.project.system.menu.controller.MenuController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"1136\"],\"menuType\":[\"F\"],\"menuName\":[\"通知修改\"],\"url\":[\"\"],\"target\":[\"menuItem\"],\"perms\":[\"pm:notice:edit\"],\"orderNum\":[\"2\"],\"icon\":[\"\"],\"visible\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-17 05:21:49');
INSERT INTO `sys_oper_log` VALUES (435, '菜单管理', 1, 'com.pepper.project.system.menu.controller.MenuController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"1136\"],\"menuType\":[\"F\"],\"menuName\":[\"通知新增\"],\"url\":[\"\"],\"target\":[\"menuItem\"],\"perms\":[\"pm:notice:add\"],\"orderNum\":[\"2\"],\"icon\":[\"\"],\"visible\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-17 05:22:13');
INSERT INTO `sys_oper_log` VALUES (436, '菜单管理', 2, 'com.pepper.project.system.menu.controller.MenuController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"1138\"],\"parentId\":[\"1136\"],\"menuType\":[\"F\"],\"menuName\":[\"通知修改\"],\"url\":[\"#\"],\"target\":[\"menuItem\"],\"perms\":[\"pm:notice:edit\"],\"orderNum\":[\"3\"],\"icon\":[\"#\"],\"visible\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-17 05:22:30');
INSERT INTO `sys_oper_log` VALUES (437, '菜单管理', 1, 'com.pepper.project.system.menu.controller.MenuController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"1136\"],\"menuType\":[\"F\"],\"menuName\":[\"物业通知删除\"],\"url\":[\"\"],\"target\":[\"menuItem\"],\"perms\":[\"pm:notice:delete\"],\"orderNum\":[\"4\"],\"icon\":[\"\"],\"visible\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-17 05:22:55');
INSERT INTO `sys_oper_log` VALUES (438, '社区留言', 1, 'com.pepper.project.pm.notice.controller.PmNoticeController.addSave()', 'POST', 1, 'admin', '研发部门', '/pm/notice/add', '127.0.0.1', '内网IP', '{\"title\":[\"123\"],\"content\":[\"12344566\"],\"propertyId\":[\"1\"],\"status\":[\"0\"]}', 'null', 1, 'nested exception is org.apache.ibatis.reflection.ReflectionException: There is no getter for property named \'userId\' in \'class com.pepper.project.pm.notice.domain.PmNotice\'', '2020-02-17 05:25:12');
INSERT INTO `sys_oper_log` VALUES (439, '社区留言', 1, 'com.pepper.project.pm.notice.controller.PmNoticeController.addSave()', 'POST', 1, 'admin', '研发部门', '/pm/notice/add', '127.0.0.1', '内网IP', '{\"title\":[\"9999\"],\"content\":[\"99999\"],\"propertyId\":[\"1\"],\"status\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-17 05:26:23');
INSERT INTO `sys_oper_log` VALUES (440, '社区留言', 2, 'com.pepper.project.pm.notice.controller.PmNoticeController.editSave()', 'POST', 1, 'admin', '研发部门', '/pm/notice/edit', '127.0.0.1', '内网IP', '{\"id\":[\"1\"],\"title\":[\"9999\"],\"content\":[\"99999\"],\"propertyId\":[\"1\"],\"status\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-17 05:29:27');
INSERT INTO `sys_oper_log` VALUES (441, '社区留言', 2, 'com.pepper.project.pm.notice.controller.PmNoticeController.editSave()', 'POST', 1, 'admin', '研发部门', '/pm/notice/edit', '127.0.0.1', '内网IP', '{\"id\":[\"1\"],\"title\":[\"9999\"],\"content\":[\"99999\"],\"propertyId\":[\"1\"],\"status\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-17 05:31:12');
INSERT INTO `sys_oper_log` VALUES (442, '社区留言', 2, 'com.pepper.project.pm.notice.controller.PmNoticeController.editSave()', 'POST', 1, 'admin', '研发部门', '/pm/notice/edit', '127.0.0.1', '内网IP', '{\"id\":[\"1\"],\"title\":[\"9999\"],\"content\":[\"999990000\"],\"propertyId\":[\"1\"],\"status\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-17 05:31:19');
INSERT INTO `sys_oper_log` VALUES (443, '物业', 1, 'com.pepper.project.pm.property.controller.PropertyController.addSave()', 'POST', 1, 'admin', '研发部门', '/pm/property/add', '127.0.0.1', '内网IP', '{\"propertyName\":[\"天山区时代物业\"],\"propertyCode\":[\"100984\"],\"introduction\":[\"<p>10093293838432</p>\"],\"areaId\":[\"4\"],\"status\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-17 05:33:33');
INSERT INTO `sys_oper_log` VALUES (444, '菜单管理', 1, 'com.pepper.project.system.menu.controller.MenuController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"0\"],\"menuType\":[\"M\"],\"menuName\":[\"健康宣教\"],\"url\":[\"\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"7\"],\"icon\":[\"fa fa-dashboard\"],\"visible\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-17 05:42:03');
INSERT INTO `sys_oper_log` VALUES (445, '菜单管理', 1, 'com.pepper.project.system.menu.controller.MenuController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"1141\"],\"menuType\":[\"C\"],\"menuName\":[\"宣教文章管理\"],\"url\":[\"/he/article\"],\"target\":[\"menuItem\"],\"perms\":[\"he:article:view\"],\"orderNum\":[\"1\"],\"icon\":[\"fa fa-reorder\"],\"visible\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-17 05:43:42');
INSERT INTO `sys_oper_log` VALUES (446, '菜单管理', 1, 'com.pepper.project.system.menu.controller.MenuController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"1141\"],\"menuType\":[\"C\"],\"menuName\":[\"宣教视频管理\"],\"url\":[\"/he/video\"],\"target\":[\"menuItem\"],\"perms\":[\"he:video:view\"],\"orderNum\":[\"2\"],\"icon\":[\"fa fa-toggle-right\"],\"visible\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-17 05:44:35');
INSERT INTO `sys_oper_log` VALUES (447, '菜单管理', 1, 'com.pepper.project.system.menu.controller.MenuController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"1141\"],\"menuType\":[\"C\"],\"menuName\":[\"宣教板块\"],\"url\":[\"/he/board\"],\"target\":[\"menuItem\"],\"perms\":[\"he:board:view\"],\"orderNum\":[\"1\"],\"icon\":[\"fa fa-gear\"],\"visible\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-17 05:46:01');
INSERT INTO `sys_oper_log` VALUES (448, '菜单管理', 2, 'com.pepper.project.system.menu.controller.MenuController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"1142\"],\"parentId\":[\"1141\"],\"menuType\":[\"C\"],\"menuName\":[\"宣教文章管理\"],\"url\":[\"/he/article\"],\"target\":[\"menuItem\"],\"perms\":[\"he:article:view\"],\"orderNum\":[\"2\"],\"icon\":[\"fa fa-reorder\"],\"visible\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-17 05:46:09');
INSERT INTO `sys_oper_log` VALUES (449, '菜单管理', 2, 'com.pepper.project.system.menu.controller.MenuController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"1143\"],\"parentId\":[\"1141\"],\"menuType\":[\"C\"],\"menuName\":[\"宣教视频管理\"],\"url\":[\"/he/video\"],\"target\":[\"menuItem\"],\"perms\":[\"he:video:view\"],\"orderNum\":[\"3\"],\"icon\":[\"fa fa-toggle-right\"],\"visible\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-17 05:46:21');
INSERT INTO `sys_oper_log` VALUES (450, '菜单管理', 1, 'com.pepper.project.system.menu.controller.MenuController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"1144\"],\"menuType\":[\"F\"],\"menuName\":[\"宣教板块查询\"],\"url\":[\"\"],\"target\":[\"menuItem\"],\"perms\":[\"he:board:list\"],\"orderNum\":[\"1\"],\"icon\":[\"\"],\"visible\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-17 05:47:45');
INSERT INTO `sys_oper_log` VALUES (451, '菜单管理', 1, 'com.pepper.project.system.menu.controller.MenuController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"1144\"],\"menuType\":[\"F\"],\"menuName\":[\"宣教板块新增\"],\"url\":[\"\"],\"target\":[\"menuItem\"],\"perms\":[\"he:board:add\"],\"orderNum\":[\"2\"],\"icon\":[\"\"],\"visible\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-17 05:48:16');
INSERT INTO `sys_oper_log` VALUES (452, '菜单管理', 1, 'com.pepper.project.system.menu.controller.MenuController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"1144\"],\"menuType\":[\"F\"],\"menuName\":[\"宣教板块修改\"],\"url\":[\"\"],\"target\":[\"menuItem\"],\"perms\":[\"he:board:edit\"],\"orderNum\":[\"3\"],\"icon\":[\"\"],\"visible\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-17 05:48:37');
INSERT INTO `sys_oper_log` VALUES (453, '菜单管理', 1, 'com.pepper.project.system.menu.controller.MenuController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"1144\"],\"menuType\":[\"F\"],\"menuName\":[\"宣教板块删除\"],\"url\":[\"\"],\"target\":[\"menuItem\"],\"perms\":[\"he:board:delete\"],\"orderNum\":[\"4\"],\"icon\":[\"\"],\"visible\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-17 05:49:08');
INSERT INTO `sys_oper_log` VALUES (454, '菜单管理', 1, 'com.pepper.project.system.menu.controller.MenuController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"1142\"],\"menuType\":[\"F\"],\"menuName\":[\"宣教文章查询\"],\"url\":[\"\"],\"target\":[\"menuItem\"],\"perms\":[\"he:article:list\"],\"orderNum\":[\"1\"],\"icon\":[\"\"],\"visible\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-17 05:49:45');
INSERT INTO `sys_oper_log` VALUES (455, '菜单管理', 1, 'com.pepper.project.system.menu.controller.MenuController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"1142\"],\"menuType\":[\"F\"],\"menuName\":[\"宣教文章新增\"],\"url\":[\"\"],\"target\":[\"menuItem\"],\"perms\":[\"he:article:add\"],\"orderNum\":[\"2\"],\"icon\":[\"\"],\"visible\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-17 05:50:12');
INSERT INTO `sys_oper_log` VALUES (456, '菜单管理', 1, 'com.pepper.project.system.menu.controller.MenuController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"1142\"],\"menuType\":[\"F\"],\"menuName\":[\"宣教文章编辑\"],\"url\":[\"\"],\"target\":[\"menuItem\"],\"perms\":[\"he:article:edit\"],\"orderNum\":[\"3\"],\"icon\":[\"\"],\"visible\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-17 05:50:36');
INSERT INTO `sys_oper_log` VALUES (457, '菜单管理', 1, 'com.pepper.project.system.menu.controller.MenuController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"1142\"],\"menuType\":[\"F\"],\"menuName\":[\"宣教文章删除\"],\"url\":[\"\"],\"target\":[\"menuItem\"],\"perms\":[\"he:article:delete\"],\"orderNum\":[\"4\"],\"icon\":[\"\"],\"visible\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-17 05:50:57');
INSERT INTO `sys_oper_log` VALUES (458, '菜单管理', 1, 'com.pepper.project.system.menu.controller.MenuController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"1143\"],\"menuType\":[\"F\"],\"menuName\":[\"宣教视频查询\"],\"url\":[\"\"],\"target\":[\"menuItem\"],\"perms\":[\"he:video:list\"],\"orderNum\":[\"1\"],\"icon\":[\"\"],\"visible\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-17 05:51:21');
INSERT INTO `sys_oper_log` VALUES (459, '菜单管理', 1, 'com.pepper.project.system.menu.controller.MenuController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"1143\"],\"menuType\":[\"F\"],\"menuName\":[\"宣教视频新增\"],\"url\":[\"\"],\"target\":[\"menuItem\"],\"perms\":[\"he:video:add\"],\"orderNum\":[\"2\"],\"icon\":[\"\"],\"visible\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-17 05:51:44');
INSERT INTO `sys_oper_log` VALUES (460, '菜单管理', 1, 'com.pepper.project.system.menu.controller.MenuController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"1143\"],\"menuType\":[\"F\"],\"menuName\":[\"宣教视频修改\"],\"url\":[\"\"],\"target\":[\"menuItem\"],\"perms\":[\"he:video:edit\"],\"orderNum\":[\"3\"],\"icon\":[\"\"],\"visible\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-17 05:52:03');
INSERT INTO `sys_oper_log` VALUES (461, '菜单管理', 1, 'com.pepper.project.system.menu.controller.MenuController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"1143\"],\"menuType\":[\"F\"],\"menuName\":[\"宣教视频删除\"],\"url\":[\"\"],\"target\":[\"menuItem\"],\"perms\":[\"he:video:delete\"],\"orderNum\":[\"4\"],\"icon\":[\"\"],\"visible\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-17 05:52:22');
INSERT INTO `sys_oper_log` VALUES (462, '宣教板块', 1, 'com.pepper.project.he.board.controller.BoardController.addSave()', 'POST', 1, 'admin', '研发部门', '/he/board/add', '127.0.0.1', '内网IP', '{\"boardCode\":[\"10001\"],\"boardName\":[\"食品安全\"],\"status\":[\"0\"]}', 'null', 1, 'nested exception is org.apache.ibatis.reflection.ReflectionException: There is no getter for property named \'communityId\' in \'class com.pepper.project.he.board.domain.Board\'', '2020-02-17 07:29:52');
INSERT INTO `sys_oper_log` VALUES (463, '宣教板块', 1, 'com.pepper.project.he.board.controller.BoardController.addSave()', 'POST', 1, 'admin', '研发部门', '/he/board/add', '127.0.0.1', '内网IP', '{\"boardCode\":[\"10001\"],\"boardName\":[\"食品安全\"],\"status\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-17 07:31:26');
INSERT INTO `sys_oper_log` VALUES (464, '宣教板块', 1, 'com.pepper.project.he.board.controller.BoardController.addSave()', 'POST', 1, 'admin', '研发部门', '/he/board/add', '127.0.0.1', '内网IP', '{\"boardCode\":[\"10002\"],\"boardName\":[\"用药健康\"],\"status\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-17 07:33:24');
INSERT INTO `sys_oper_log` VALUES (465, '宣教板块', 1, 'com.pepper.project.he.board.controller.BoardController.addSave()', 'POST', 1, 'admin', '研发部门', '/he/board/add', '127.0.0.1', '内网IP', '{\"boardCode\":[\"10003\"],\"boardName\":[\"儿童健康\"],\"status\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-17 07:33:34');
INSERT INTO `sys_oper_log` VALUES (466, '宣教板块', 1, 'com.pepper.project.he.board.controller.BoardController.addSave()', 'POST', 1, 'admin', '研发部门', '/he/board/add', '127.0.0.1', '内网IP', '{\"boardCode\":[\"10004\"],\"boardName\":[\"常见病护理\"],\"status\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-17 07:33:51');
INSERT INTO `sys_oper_log` VALUES (467, '宣教文章', 1, 'com.pepper.project.he.article.controller.ArticleController.addSave()', 'POST', 1, 'admin', '研发部门', '/he/article/add', '127.0.0.1', '内网IP', '{\"title\":[\"111\"],\"content\":[\"\"],\"boardId\":[\"1\"],\"status\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-17 07:42:36');
INSERT INTO `sys_oper_log` VALUES (468, '宣教文章', 1, 'com.pepper.project.he.article.controller.ArticleController.addSave()', 'POST', 1, 'admin', '研发部门', '/he/article/add', '127.0.0.1', '内网IP', '{\"title\":[\"2222\"],\"content\":[\"\"],\"boardId\":[\"2\"],\"status\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-17 07:48:03');
INSERT INTO `sys_oper_log` VALUES (469, '宣教文章', 2, 'com.pepper.project.he.article.controller.ArticleController.editSave()', 'POST', 1, 'admin', '研发部门', '/he/article/edit', '127.0.0.1', '内网IP', '{\"id\":[\"2\"],\"title\":[\"2222\"],\"content\":[\"撒犯得上发射点\"],\"boardId\":[\"2\"],\"status\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-17 07:50:36');
INSERT INTO `sys_oper_log` VALUES (470, '宣教文章', 2, 'com.pepper.project.he.article.controller.ArticleController.editSave()', 'POST', 1, 'admin', '研发部门', '/he/article/edit', '127.0.0.1', '内网IP', '{\"id\":[\"1\"],\"title\":[\"111\"],\"content\":[\"犯得上反对\"],\"boardId\":[\"1\"],\"status\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-17 07:50:40');
INSERT INTO `sys_oper_log` VALUES (471, '宣教文章', 2, 'com.pepper.project.he.article.controller.ArticleController.editSave()', 'POST', 1, 'admin', '研发部门', '/he/article/edit', '127.0.0.1', '内网IP', '{\"id\":[\"1\"],\"title\":[\"111\"],\"content\":[\"犯得上反对撒犯得上发射点\"],\"boardId\":[\"1\"],\"status\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-17 07:50:43');
INSERT INTO `sys_oper_log` VALUES (472, '宣教文章', 2, 'com.pepper.project.he.article.controller.ArticleController.editSave()', 'POST', 1, 'admin', '研发部门', '/he/article/edit', '127.0.0.1', '内网IP', '{\"id\":[\"2\"],\"title\":[\"2222\"],\"content\":[\"<p>撒犯得上发射点<img src=\\\"http://localhost/profile/upload/2020/02/17/f4c45ebd265172ee79d18a6eafd6ef80.png\\\" data-filename=\\\"/profile/upload/2020/02/17/f4c45ebd265172ee79d18a6eafd6ef80.png\\\" style=\\\"width: 500px;\\\"></p>\"],\"boardId\":[\"2\"],\"status\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-17 07:50:58');
INSERT INTO `sys_oper_log` VALUES (473, '宣教板块', 1, 'com.pepper.project.he.video.controller.VideoController.addSave()', 'POST', 1, 'admin', '研发部门', '/he/video/add', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-17 07:54:59');
INSERT INTO `sys_oper_log` VALUES (474, '宣教板块', 2, 'com.pepper.project.he.video.controller.VideoController.editSave()', 'POST', 1, 'admin', '研发部门', '/he/video/edit', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2020-02-17 09:05:07');
INSERT INTO `sys_oper_log` VALUES (475, '宣教文章', 2, 'com.pepper.project.he.article.controller.ArticleController.editSave()', 'POST', 1, 'admin', '研发部门', '/he/article/edit', '127.0.0.1', '内网IP', '{\"id\":[\"2\"],\"title\":[\"2222\"],\"content\":[\"<p>撒犯得上发射点<img src=\\\"http://localhost/profile/upload/2020/02/17/f4c45ebd265172ee79d18a6eafd6ef80.png\\\" data-filename=\\\"/profile/upload/2020/02/17/f4c45ebd265172ee79d18a6eafd6ef80.png\\\" style=\\\"width: 500px;\\\"></p>\"],\"boardId\":[\"2\"],\"status\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-17 09:24:04');
INSERT INTO `sys_oper_log` VALUES (476, '宣教文章', 2, 'com.pepper.project.he.article.controller.ArticleController.editSave()', 'POST', 1, 'admin', '研发部门', '/he/article/edit', '127.0.0.1', '内网IP', '{\"id\":[\"1\"],\"title\":[\"111\"],\"content\":[\"犯得上反对撒犯得上发射点\"],\"boardId\":[\"1\"],\"status\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-17 09:24:07');
INSERT INTO `sys_oper_log` VALUES (477, '宣教板块', 1, 'com.pepper.project.he.video.controller.VideoController.addSave()', 'POST', 1, 'admin', '研发部门', '/he/video/add', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-17 12:59:46');
INSERT INTO `sys_oper_log` VALUES (478, '宣教板块', 1, 'com.pepper.project.he.video.controller.VideoController.addSave()', 'POST', 1, 'admin', '研发部门', '/he/video/add', '127.0.0.1', '内网IP', '{\"title\":[\"钱钱钱钱钱\"],\"videoUrl\":[\"https://web-ops-test.master.live/video/7B6EE29F938B2BC42938F3A6E792BFE6.mp4\"],\"boardId\":[\"1\"],\"status\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-17 13:01:36');
INSERT INTO `sys_oper_log` VALUES (479, '宣教板块', 3, 'com.pepper.project.he.video.controller.VideoController.remove()', 'POST', 1, 'admin', '研发部门', '/he/video/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"2,1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-17 13:02:27');
INSERT INTO `sys_oper_log` VALUES (480, '宣教板块', 3, 'com.pepper.project.he.video.controller.VideoController.remove()', 'POST', 1, 'admin', '研发部门', '/he/video/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"3\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-17 13:05:03');
INSERT INTO `sys_oper_log` VALUES (481, '宣教板块', 1, 'com.pepper.project.he.video.controller.VideoController.addSave()', 'POST', 1, 'admin', '研发部门', '/he/video/add', '127.0.0.1', '内网IP', '{\"title\":[\"12344灭女\"],\"videoUrl\":[\"https://web-ops-test.master.live/video/7B6EE29F938B2BC42938F3A6E792BFE6.mp4\"],\"boardId\":[\"1\"],\"status\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-17 13:05:17');
INSERT INTO `sys_oper_log` VALUES (482, '宣教板块', 3, 'com.pepper.project.he.video.controller.VideoController.remove()', 'POST', 1, 'admin', '研发部门', '/he/video/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"4\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-17 13:06:24');
INSERT INTO `sys_oper_log` VALUES (483, '宣教板块', 1, 'com.pepper.project.he.video.controller.VideoController.addSave()', 'POST', 1, 'admin', '研发部门', '/he/video/add', '127.0.0.1', '内网IP', '{\"title\":[\"121232\"],\"videoUrl\":[\"https://web-ops-test.master.live/video/7B6EE29F938B2BC42938F3A6E792BFE6.mp4\"],\"boardId\":[\"1\"],\"status\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-17 13:06:33');
INSERT INTO `sys_oper_log` VALUES (484, '宣教板块', 3, 'com.pepper.project.he.video.controller.VideoController.remove()', 'POST', 1, 'admin', '研发部门', '/he/video/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"5\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-17 13:08:02');
INSERT INTO `sys_oper_log` VALUES (485, '宣教板块', 1, 'com.pepper.project.he.video.controller.VideoController.addSave()', 'POST', 1, 'admin', '研发部门', '/he/video/add', '127.0.0.1', '内网IP', '{\"title\":[\"12千千万万\"],\"videoUrl\":[\"https://web-ops-test.master.live/video/7B6EE29F938B2BC42938F3A6E792BFE6.mp4\"],\"boardId\":[\"1\"],\"status\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-17 13:08:15');
INSERT INTO `sys_oper_log` VALUES (486, '宣教板块', 2, 'com.pepper.project.he.video.controller.VideoController.editSave()', 'POST', 1, 'admin', '研发部门', '/he/video/edit', '127.0.0.1', '内网IP', '{\"id\":[\"6\"],\"title\":[\"12千千万万\"],\"videoUrl\":[\"https://web-ops-test.master.live/video/7B6EE29F938B2BC42938F3A6E792BFE6.mp4\"],\"boardId\":[\"1\"],\"status\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-17 13:09:41');
INSERT INTO `sys_oper_log` VALUES (487, '宣教板块', 2, 'com.pepper.project.he.video.controller.VideoController.editSave()', 'POST', 1, 'admin', '研发部门', '/he/video/edit', '127.0.0.1', '内网IP', '{\"id\":[\"6\"],\"title\":[\"12千千万万\"],\"videoUrl\":[\"https://web-ops-test.master.live/video/7B6EE29F938B2BC42938F3A6E792BFE6.mp4\"],\"boardId\":[\"1\"],\"status\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-17 13:51:40');
INSERT INTO `sys_oper_log` VALUES (488, '个人信息', 2, 'com.pepper.project.system.user.controller.ProfileController.updateAvatar()', 'POST', 1, 'admin', '研发部门', '/system/user/profile/updateAvatar', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-17 13:55:13');
INSERT INTO `sys_oper_log` VALUES (489, '宣教板块', 2, 'com.pepper.project.he.video.controller.VideoController.editSave()', 'POST', 1, 'admin', '研发部门', '/he/video/edit', '127.0.0.1', '内网IP', '{\"id\":[\"6\"],\"title\":[\"12千千万万\"],\"videoUrl\":[\"https://web-ops-test.master.live/video/7B6EE29F938B2BC42938F3A6E792BFE6.mp4\"],\"boardId\":[\"1\"],\"status\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-17 14:10:35');
INSERT INTO `sys_oper_log` VALUES (490, '宣教视频', 2, 'com.pepper.project.he.video.controller.VideoController.updateAvatar()', 'POST', 1, 'admin', '研发部门', '/he/video/edit/upload', '127.0.0.1', '内网IP', '{\"fileId\":[\"615815_7B6EE29F938B2BC42938F3A6E792BFE6.mp4\"],\"initialPreview\":[\"[]\"],\"initialPreviewConfig\":[\"[]\"],\"initialPreviewThumbTags\":[\"[]\"]}', '{\"msg\":\"filename : [7B6EE29F938B2BC42938F3A6E792BFE6.mp4], extension : [mp4], allowed extension : [[bmp, gif, jpg, jpeg, png, doc, docx, xls, xlsx, ppt, pptx, html, htm, txt, rar, zip, gz, bz2, pdf]]\",\"code\":500}', 0, NULL, '2020-02-17 14:19:16');
INSERT INTO `sys_oper_log` VALUES (491, '宣教视频', 2, 'com.pepper.project.he.video.controller.VideoController.updateAvatar()', 'POST', 1, 'admin', '研发部门', '/he/video/edit/upload', '127.0.0.1', '内网IP', '{\"fileId\":[\"615815_7B6EE29F938B2BC42938F3A6E792BFE6.mp4\"],\"initialPreview\":[\"[]\"],\"initialPreviewConfig\":[\"[]\"],\"initialPreviewThumbTags\":[\"[]\"]}', '{\"msg\":\"filename : [7B6EE29F938B2BC42938F3A6E792BFE6.mp4], extension : [mp4], allowed extension : [[bmp, gif, jpg, jpeg, png, doc, docx, xls, xlsx, ppt, pptx, html, htm, txt, rar, zip, gz, bz2, pdf]]\",\"code\":500}', 0, NULL, '2020-02-17 14:20:33');
INSERT INTO `sys_oper_log` VALUES (492, '宣教视频', 2, 'com.pepper.project.he.video.controller.VideoController.updateAvatar()', 'POST', 1, 'admin', '研发部门', '/he/video/edit/upload', '127.0.0.1', '内网IP', '{\"fileId\":[\"615815_7B6EE29F938B2BC42938F3A6E792BFE6.mp4\"],\"initialPreview\":[\"[]\"],\"initialPreviewConfig\":[\"[]\"],\"initialPreviewThumbTags\":[\"[]\"]}', '{\"msg\":\"filename : [7B6EE29F938B2BC42938F3A6E792BFE6.mp4], extension : [mp4], allowed extension : [[bmp, gif, jpg, jpeg, png, doc, docx, xls, xlsx, ppt, pptx, html, htm, txt, rar, zip, gz, bz2, pdf]]\",\"code\":500}', 0, NULL, '2020-02-17 14:21:39');
INSERT INTO `sys_oper_log` VALUES (493, '宣教视频', 2, 'com.pepper.project.he.video.controller.VideoController.updateAvatar()', 'POST', 1, 'admin', '研发部门', '/he/video/edit/upload', '127.0.0.1', '内网IP', '{\"fileId\":[\"615815_7B6EE29F938B2BC42938F3A6E792BFE6.mp4\"],\"initialPreview\":[\"[null]\"],\"initialPreviewConfig\":[\"[null]\"],\"initialPreviewThumbTags\":[\"[null]\"]}', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2020-02-17 14:25:18');
INSERT INTO `sys_oper_log` VALUES (494, '宣教视频', 2, 'com.pepper.project.he.video.controller.VideoController.updateAvatar()', 'POST', 1, 'admin', '研发部门', '/he/video/edit/upload', '127.0.0.1', '内网IP', '{\"fileId\":[\"615815_7B6EE29F938B2BC42938F3A6E792BFE6.mp4\"],\"initialPreview\":[\"[]\"],\"initialPreviewConfig\":[\"[]\"],\"initialPreviewThumbTags\":[\"[]\"]}', '{\"msg\":\"/profile/healthVideo/2020/02/17/a92c3b385d8c41bb14517a3febb7eda1.mp4\",\"code\":0}', 0, NULL, '2020-02-17 14:32:01');
INSERT INTO `sys_oper_log` VALUES (495, '宣教视频', 2, 'com.pepper.project.he.video.controller.VideoController.updateAvatar()', 'POST', 1, 'admin', '研发部门', '/he/video/edit/upload', '127.0.0.1', '内网IP', '{\"fileId\":[\"615815_7B6EE29F938B2BC42938F3A6E792BFE6.mp4\"],\"initialPreview\":[\"[]\"],\"initialPreviewConfig\":[\"[]\"],\"initialPreviewThumbTags\":[\"[]\"]}', '{\"msg\":\"/profile/healthVideo/2020/02/17/98c97323f21f190e960776891ee0edf5.mp4\",\"code\":0}', 0, NULL, '2020-02-17 14:34:51');
INSERT INTO `sys_oper_log` VALUES (496, '宣教视频', 2, 'com.pepper.project.he.video.controller.VideoController.updateAvatar()', 'POST', 1, 'admin', '研发部门', '/he/video/edit/upload', '127.0.0.1', '内网IP', '{\"fileId\":[\"615815_7B6EE29F938B2BC42938F3A6E792BFE6.mp4\"],\"initialPreview\":[\"[]\"],\"initialPreviewConfig\":[\"[]\"],\"initialPreviewThumbTags\":[\"[]\"]}', '{\"msg\":\"/profile/healthVideo/2020/02/17/99a0e39afbaf09a7d93e0bf031d5fd92.mp4\",\"code\":0}', 0, NULL, '2020-02-17 14:36:46');
INSERT INTO `sys_oper_log` VALUES (497, '宣教视频', 2, 'com.pepper.project.he.video.controller.VideoController.updateAvatar()', 'POST', 1, 'admin', '研发部门', '/he/video/edit/upload', '127.0.0.1', '内网IP', '{\"fileId\":[\"615815_7B6EE29F938B2BC42938F3A6E792BFE6.mp4\"],\"initialPreview\":[\"[]\"],\"initialPreviewConfig\":[\"[]\"],\"initialPreviewThumbTags\":[\"[]\"]}', '{\"msg\":\"/profile/healthVideo/2020/02/17/5df8f4d3c0e5dd44c869504e215d0c6c.mp4\",\"code\":0}', 0, NULL, '2020-02-17 14:40:10');
INSERT INTO `sys_oper_log` VALUES (498, '宣教视频', 2, 'com.pepper.project.he.video.controller.VideoController.updateAvatar()', 'POST', 1, 'admin', '研发部门', '/he/video/edit/upload', '127.0.0.1', '内网IP', '{\"fileId\":[\"615815_7B6EE29F938B2BC42938F3A6E792BFE6.mp4\"],\"initialPreview\":[\"[]\"],\"initialPreviewConfig\":[\"[]\"],\"initialPreviewThumbTags\":[\"[]\"]}', '{\"msg\":\"/profile/healthVideo/2020/02/17/dcb71b13e68886c3f0db9a5119a53ea2.mp4\",\"code\":0}', 0, NULL, '2020-02-17 14:40:39');
INSERT INTO `sys_oper_log` VALUES (499, '宣教视频', 2, 'com.pepper.project.he.video.controller.VideoController.updateAvatar()', 'POST', 1, 'admin', '研发部门', '/he/video/edit/upload', '127.0.0.1', '内网IP', '{\"fileId\":[\"615815_7B6EE29F938B2BC42938F3A6E792BFE6.mp4\"],\"initialPreview\":[\"[]\"],\"initialPreviewConfig\":[\"[]\"],\"initialPreviewThumbTags\":[\"[]\"]}', '{\"msg\":\"/profile/healthVideo/2020/02/17/b35a407cdcab997a63b00584371deceb.mp4\",\"code\":0}', 0, NULL, '2020-02-17 14:42:27');
INSERT INTO `sys_oper_log` VALUES (500, '宣教视频', 2, 'com.pepper.project.he.video.controller.VideoController.updateAvatar()', 'POST', 1, 'admin', '研发部门', '/he/video/edit/upload', '127.0.0.1', '内网IP', '{\"fileId\":[\"615815_7B6EE29F938B2BC42938F3A6E792BFE6.mp4\"],\"initialPreview\":[\"[]\"],\"initialPreviewConfig\":[\"[]\"],\"initialPreviewThumbTags\":[\"[]\"]}', '{\"msg\":\"/profile/healthVideo/2020/02/17/6ec5e0c8094dc0245b5084d2c1496fdc.mp4\",\"code\":0}', 0, NULL, '2020-02-17 14:44:21');
INSERT INTO `sys_oper_log` VALUES (501, '宣教视频', 2, 'com.pepper.project.he.video.controller.VideoController.updateAvatar()', 'POST', 1, 'admin', '研发部门', '/he/video/edit/upload', '127.0.0.1', '内网IP', '{\"fileId\":[\"615815_7B6EE29F938B2BC42938F3A6E792BFE6.mp4\"],\"initialPreview\":[\"[]\"],\"initialPreviewConfig\":[\"[]\"],\"initialPreviewThumbTags\":[\"[]\"]}', '{\"msg\":\"/profile/healthVideo/2020/02/17/13236c35b8c2a925781984906c50d6ff.mp4\",\"code\":0}', 0, NULL, '2020-02-17 14:46:00');
INSERT INTO `sys_oper_log` VALUES (502, '宣教板块', 2, 'com.pepper.project.he.video.controller.VideoController.editSave()', 'POST', 1, 'admin', '研发部门', '/he/video/edit', '127.0.0.1', '内网IP', '{\"id\":[\"6\"],\"videoUrl\":[\"/profile/healthVideo/2020/02/17/13236c35b8c2a925781984906c50d6ff.mp4\",\"https://web-ops-test.master.live/video/7B6EE29F938B2BC42938F3A6E792BFE6.mp4\"],\"title\":[\"12千千万万\"],\"boardId\":[\"1\"],\"status\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-17 14:46:31');
INSERT INTO `sys_oper_log` VALUES (503, '宣教视频', 2, 'com.pepper.project.he.video.controller.VideoController.updateAvatar()', 'POST', 1, 'admin', '研发部门', '/he/video/edit/upload', '127.0.0.1', '内网IP', '{\"fileId\":[\"615815_11.mp4\"],\"initialPreview\":[\"[]\"],\"initialPreviewConfig\":[\"[]\"],\"initialPreviewThumbTags\":[\"[]\"]}', '{\"msg\":\"/profile/healthVideo/2020/02/17/994bd4dc31ac23168a86217bf8e098c8.mp4\",\"code\":0}', 0, NULL, '2020-02-17 14:47:05');
INSERT INTO `sys_oper_log` VALUES (504, '宣教板块', 2, 'com.pepper.project.he.video.controller.VideoController.editSave()', 'POST', 1, 'admin', '研发部门', '/he/video/edit', '127.0.0.1', '内网IP', '{\"id\":[\"6\"],\"videoUrl\":[\"/profile/healthVideo/2020/02/17/994bd4dc31ac23168a86217bf8e098c8.mp4\",\"/profile/healthVideo/2020/02/17/13236c35b8c2a925781984906c50d6ff.mp4,https://web-ops-test.master.live/video/7B6EE29F938B2BC42938F3A6E792BFE6.mp4\"],\"title\":[\"12千千万万\"],\"boardId\":[\"1\"],\"status\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-17 14:48:25');
INSERT INTO `sys_oper_log` VALUES (505, '宣教视频', 2, 'com.pepper.project.he.video.controller.VideoController.updateAvatar()', 'POST', 1, 'admin', '研发部门', '/he/video/edit/upload', '127.0.0.1', '内网IP', '{\"fileId\":[\"615815_11.mp4\"],\"initialPreview\":[\"[]\"],\"initialPreviewConfig\":[\"[]\"],\"initialPreviewThumbTags\":[\"[]\"]}', '{\"msg\":\"/profile/healthVideo/2020/02/17/7cad081bd346f7013138e5ecefb9124d.mp4\",\"code\":0}', 0, NULL, '2020-02-17 14:49:33');
INSERT INTO `sys_oper_log` VALUES (506, '宣教视频', 2, 'com.pepper.project.he.video.controller.VideoController.updateAvatar()', 'POST', 1, 'admin', '研发部门', '/he/video/edit/upload', '127.0.0.1', '内网IP', '{\"fileId\":[\"615815_11.mp4\"],\"initialPreview\":[\"[]\"],\"initialPreviewConfig\":[\"[]\"],\"initialPreviewThumbTags\":[\"[]\"]}', '{\"msg\":\"/profile/healthVideo/2020/02/17/79744ed3a00220fc1d7e7717ea66b46d.mp4\",\"code\":0}', 0, NULL, '2020-02-17 14:50:03');
INSERT INTO `sys_oper_log` VALUES (507, '宣教板块', 2, 'com.pepper.project.he.video.controller.VideoController.editSave()', 'POST', 1, 'admin', '研发部门', '/he/video/edit', '127.0.0.1', '内网IP', '{\"id\":[\"6\"],\"videoUrl\":[\"/profile/healthVideo/2020/02/17/79744ed3a00220fc1d7e7717ea66b46d.mp4\",\"/profile/healthVideo/2020/02/17/994bd4dc31ac23168a86217bf8e098c8.mp4,/profile/healthVideo/2020/02/17/13236c35b8c2a925781984906c50d6ff.mp4,https://web-ops-test.master.live/video/7B6EE29F938B2BC42938F3A6E792BFE6.mp4\"],\"title\":[\"12千千万万\"],\"boardId\":[\"1\"],\"status\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-17 14:50:30');
INSERT INTO `sys_oper_log` VALUES (508, '宣教视频', 2, 'com.pepper.project.he.video.controller.VideoController.updateAvatar()', 'POST', 1, 'admin', '研发部门', '/he/video/edit/upload', '127.0.0.1', '内网IP', '{\"fileId\":[\"615815_11.mp4\"],\"initialPreview\":[\"[]\"],\"initialPreviewConfig\":[\"[]\"],\"initialPreviewThumbTags\":[\"[]\"]}', '{\"msg\":\"/profile/healthVideo/2020/02/17/22cd820074e6098cd7da76ccd4dc5b2f.mp4\",\"code\":0}', 0, NULL, '2020-02-17 14:50:43');
INSERT INTO `sys_oper_log` VALUES (509, '宣教视频', 2, 'com.pepper.project.he.video.controller.VideoController.updateAvatar()', 'POST', 1, 'admin', '研发部门', '/he/video/edit/upload', '127.0.0.1', '内网IP', '{\"fileId\":[\"615815_11.mp4\"],\"initialPreview\":[\"[]\"],\"initialPreviewConfig\":[\"[]\"],\"initialPreviewThumbTags\":[\"[]\"]}', '{\"msg\":\"/profile/healthVideo/2020/02/17/70ef7c8815e12878c8befdaf595cb047.mp4\",\"code\":0}', 0, NULL, '2020-02-17 14:51:44');
INSERT INTO `sys_oper_log` VALUES (510, '宣教板块', 2, 'com.pepper.project.he.video.controller.VideoController.editSave()', 'POST', 1, 'admin', '研发部门', '/he/video/edit', '127.0.0.1', '内网IP', '{\"id\":[\"6\"],\"videoUrl\":[\"/profile/healthVideo/2020/02/17/70ef7c8815e12878c8befdaf595cb047.mp4\",\"/profile/healthVideo/2020/02/17/79744ed3a00220fc1d7e7717ea66b46d.mp4,/profile/healthVideo/2020/02/17/994bd4dc31ac23168a86217bf8e098c8.mp4,/profile/healthVideo/2020/02/17/13236c35b8c2a925781984906c50d6ff.mp4,https://web-ops-test.master.live/video/7B6EE29F938B2BC42938F3A6E792BFE6.mp4\"],\"title\":[\"12千千万万\"],\"boardId\":[\"1\"],\"status\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-17 14:51:55');
INSERT INTO `sys_oper_log` VALUES (511, '宣教视频', 2, 'com.pepper.project.he.video.controller.VideoController.updateAvatar()', 'POST', 1, 'admin', '研发部门', '/he/video/edit/upload', '127.0.0.1', '内网IP', '{\"fileId\":[\"615815_11.mp4\"],\"initialPreview\":[\"[]\"],\"initialPreviewConfig\":[\"[]\"],\"initialPreviewThumbTags\":[\"[]\"]}', '{\"msg\":\"/profile/healthVideo/2020/02/17/dfbfa31757c1ff0a7bfe63e4a3b96c1d.mp4\",\"code\":0}', 0, NULL, '2020-02-17 14:52:24');
INSERT INTO `sys_oper_log` VALUES (512, '宣教板块', 2, 'com.pepper.project.he.video.controller.VideoController.editSave()', 'POST', 1, 'admin', '研发部门', '/he/video/edit', '127.0.0.1', '内网IP', '{\"id\":[\"6\"],\"videoUrl\":[\"/profile/healthVideo/2020/02/17/dfbfa31757c1ff0a7bfe63e4a3b96c1d.mp4\",\"/profile/healthVideo/2020/02/17/70ef7c8815e12878c8befdaf595cb047.mp4,/profile/healthVideo/2020/02/17/79744ed3a00220fc1d7e7717ea66b46d.mp4,/profile/healthVideo/2020/02/17/994bd4dc31ac23168a86217bf8e098c8.mp4,/profile/healthVideo/2020/02/17/13236c35b8c2a925781984906c50d6ff.mp4,https://web-ops-test.master.live/video/7B6EE29F938B2BC42938F3A6E792BFE6.mp4\"],\"title\":[\"12千千万万\"],\"boardId\":[\"1\"],\"status\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-17 14:53:53');
INSERT INTO `sys_oper_log` VALUES (513, '宣教视频', 2, 'com.pepper.project.he.video.controller.VideoController.updateAvatar()', 'POST', 1, 'admin', '研发部门', '/he/video/edit/upload', '127.0.0.1', '内网IP', '{\"fileId\":[\"615815_11.mp4\"],\"initialPreview\":[\"[]\"],\"initialPreviewConfig\":[\"[]\"],\"initialPreviewThumbTags\":[\"[]\"]}', '{\"msg\":\"/profile/healthVideo/2020/02/17/bc489d163f0215cda2bff1803b991dc3.mp4\",\"code\":0}', 0, NULL, '2020-02-17 14:54:10');
INSERT INTO `sys_oper_log` VALUES (514, '宣教板块', 2, 'com.pepper.project.he.video.controller.VideoController.editSave()', 'POST', 1, 'admin', '研发部门', '/he/video/edit', '127.0.0.1', '内网IP', '{\"id\":[\"6\"],\"videoUrl\":[\"/profile/healthVideo/2020/02/17/bc489d163f0215cda2bff1803b991dc3.mp4\",\"/profile/healthVideo/2020/02/17/bc489d163f0215cda2bff1803b991dc3.mp4\"],\"title\":[\"12千千万万\"],\"boardId\":[\"1\"],\"status\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-17 14:54:57');
INSERT INTO `sys_oper_log` VALUES (515, '宣教视频', 2, 'com.pepper.project.he.video.controller.VideoController.updateAvatar()', 'POST', 1, 'admin', '研发部门', '/he/video/edit/upload', '127.0.0.1', '内网IP', '{\"fileId\":[\"615815_11.mp4\"],\"initialPreview\":[\"[]\"],\"initialPreviewConfig\":[\"[]\"],\"initialPreviewThumbTags\":[\"[]\"]}', '{\"msg\":\"/profile/healthVideo/2020/02/17/37bc93b96ab8ed046c41b7cf894d98c6.mp4\",\"code\":0}', 0, NULL, '2020-02-17 14:55:12');
INSERT INTO `sys_oper_log` VALUES (516, '宣教视频', 2, 'com.pepper.project.he.video.controller.VideoController.updateAvatar()', 'POST', 1, 'admin', '研发部门', '/he/video/edit/upload', '127.0.0.1', '内网IP', '{\"fileId\":[\"615815_11.mp4\"],\"initialPreview\":[\"[]\"],\"initialPreviewConfig\":[\"[]\"],\"initialPreviewThumbTags\":[\"[]\"]}', '{\"msg\":\"/profile/healthVideo/2020/02/17/f09a3f4a69f01baab2714a3476e28dd4.mp4\",\"code\":0}', 0, NULL, '2020-02-17 14:55:54');
INSERT INTO `sys_oper_log` VALUES (517, '宣教视频', 2, 'com.pepper.project.he.video.controller.VideoController.updateAvatar()', 'POST', 1, 'admin', '研发部门', '/he/video/edit/upload', '127.0.0.1', '内网IP', '{\"fileId\":[\"615815_11.mp4\"],\"initialPreview\":[\"[]\"],\"initialPreviewConfig\":[\"[]\"],\"initialPreviewThumbTags\":[\"[]\"]}', '{\"msg\":\"/profile/healthVideo/2020/02/17/806b924319ba6eb2e2d4112d43e084f1.mp4\",\"code\":0}', 0, NULL, '2020-02-17 14:56:34');
INSERT INTO `sys_oper_log` VALUES (518, '宣教视频', 2, 'com.pepper.project.he.video.controller.VideoController.updateAvatar()', 'POST', 1, 'admin', '研发部门', '/he/video/edit/upload', '127.0.0.1', '内网IP', '{\"fileId\":[\"615815_11.mp4\"],\"initialPreview\":[\"[]\"],\"initialPreviewConfig\":[\"[]\"],\"initialPreviewThumbTags\":[\"[]\"]}', '{\"msg\":\"/profile/healthVideo/2020/02/17/89cc470f76a74b37fa0bd60e15721388.mp4\",\"code\":0}', 0, NULL, '2020-02-17 14:56:41');
INSERT INTO `sys_oper_log` VALUES (519, '宣教视频', 2, 'com.pepper.project.he.video.controller.VideoController.updateAvatar()', 'POST', 1, 'admin', '研发部门', '/he/video/edit/upload', '127.0.0.1', '内网IP', '{\"fileId\":[\"615815_11.mp4\"],\"initialPreview\":[\"[]\"],\"initialPreviewConfig\":[\"[]\"],\"initialPreviewThumbTags\":[\"[]\"]}', '{\"msg\":\"/profile/healthVideo/2020/02/17/2623ead2461f7a294d426eff8dfc0491.mp4\",\"code\":0}', 0, NULL, '2020-02-17 14:57:40');
INSERT INTO `sys_oper_log` VALUES (520, '宣教视频', 2, 'com.pepper.project.he.video.controller.VideoController.updateAvatar()', 'POST', 1, 'admin', '研发部门', '/he/video/edit/upload', '127.0.0.1', '内网IP', '{\"fileId\":[\"615815_11.mp4\"],\"initialPreview\":[\"[]\"],\"initialPreviewConfig\":[\"[]\"],\"initialPreviewThumbTags\":[\"[]\"]}', '{\"msg\":\"/profile/healthVideo/2020/02/17/e7b346d8dbe31f2acb2d4ef43758be92.mp4\",\"code\":0}', 0, NULL, '2020-02-17 14:58:05');
INSERT INTO `sys_oper_log` VALUES (521, '宣教视频', 2, 'com.pepper.project.he.video.controller.VideoController.updateAvatar()', 'POST', 1, 'admin', '研发部门', '/he/video/edit/upload', '127.0.0.1', '内网IP', '{\"fileId\":[\"615815_11.mp4\"],\"initialPreview\":[\"[]\"],\"initialPreviewConfig\":[\"[]\"],\"initialPreviewThumbTags\":[\"[]\"]}', '{\"msg\":\"/profile/healthVideo/2020/02/17/fc850ea1c83138f57fa08ddeb95f481b.mp4\",\"code\":0}', 0, NULL, '2020-02-17 14:58:22');
INSERT INTO `sys_oper_log` VALUES (522, '宣教视频', 2, 'com.pepper.project.he.video.controller.VideoController.updateAvatar()', 'POST', 1, 'admin', '研发部门', '/he/video/edit/upload', '127.0.0.1', '内网IP', '{\"fileId\":[\"615815_12.mp4\"],\"initialPreview\":[\"[]\"],\"initialPreviewConfig\":[\"[]\"],\"initialPreviewThumbTags\":[\"[]\"]}', '{\"msg\":\"/profile/healthVideo/2020/02/17/14305a8049054a024fc66034629a6ab7.mp4\",\"code\":0}', 0, NULL, '2020-02-17 14:59:16');
INSERT INTO `sys_oper_log` VALUES (523, '宣教视频', 2, 'com.pepper.project.he.video.controller.VideoController.updateAvatar()', 'POST', 1, 'admin', '研发部门', '/he/video/edit/upload', '127.0.0.1', '内网IP', '{\"fileId\":[\"5937291_47770-9390我.mp4\"],\"initialPreview\":[\"[]\"],\"initialPreviewConfig\":[\"[]\"],\"initialPreviewThumbTags\":[\"[]\"]}', '{\"msg\":\"/profile/healthVideo/2020/02/18/37bf15d06a7f1654495ddcb231af1c5f.mp4\",\"code\":0}', 0, NULL, '2020-02-18 03:01:55');
INSERT INTO `sys_oper_log` VALUES (524, '宣教视频', 2, 'com.pepper.project.he.video.controller.VideoController.updateAvatar()', 'POST', 1, 'admin', '研发部门', '/he/video/edit/upload', '127.0.0.1', '内网IP', '{\"fileId\":[\"5937291_47770-9390我.mp4\"],\"initialPreview\":[\"[]\"],\"initialPreviewConfig\":[\"[]\"],\"initialPreviewThumbTags\":[\"[]\"]}', '{\"msg\":\"/profile/healthVideo/2020/02/18/b146b72b0a75657a66e0b2a4f5c6f8a6.mp4\",\"code\":0}', 0, NULL, '2020-02-18 03:03:04');
INSERT INTO `sys_oper_log` VALUES (525, '宣教视频', 2, 'com.pepper.project.he.video.controller.VideoController.updateAvatar()', 'POST', 1, 'admin', '研发部门', '/he/video/edit/upload', '127.0.0.1', '内网IP', '{\"fileId\":[\"5937291_47770-9390我.mp4\"],\"initialPreview\":[\"[]\"],\"initialPreviewConfig\":[\"[]\"],\"initialPreviewThumbTags\":[\"[]\"]}', '{\"msg\":\"/profile/healthVideo/2020/02/18/feae3d50fd6482761c62e2f11d3aa9a2.mp4\",\"code\":0}', 0, NULL, '2020-02-18 03:04:33');
INSERT INTO `sys_oper_log` VALUES (526, '宣教板块', 2, 'com.pepper.project.he.video.controller.VideoController.editSave()', 'POST', 1, 'admin', '研发部门', '/he/video/edit', '127.0.0.1', '内网IP', '{\"id\":[\"6\"],\"videoUrl\":[\"https://web-ops-test.master.live/video/7B6EE29F938B2BC42938F3A6E792BFE6.mp4\"],\"title\":[\"12千千万万\"],\"boardId\":[\"1\"],\"status\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-18 03:08:08');
INSERT INTO `sys_oper_log` VALUES (527, '宣教视频', 2, 'com.pepper.project.he.video.controller.VideoController.updateAvatar()', 'POST', 1, 'admin', '研发部门', '/he/video/edit/upload', '127.0.0.1', '内网IP', '{\"fileId\":[\"5937291_47770-9390我.mp4\"],\"initialPreview\":[\"[]\"],\"initialPreviewConfig\":[\"[]\"],\"initialPreviewThumbTags\":[\"[]\"]}', '{\"msg\":\"/profile/healthVideo/2020/02/18/69ad4b77d5025026ee6e9ed4246a925a.mp4\",\"code\":0}', 0, NULL, '2020-02-18 03:08:24');
INSERT INTO `sys_oper_log` VALUES (528, '宣教板块', 2, 'com.pepper.project.he.video.controller.VideoController.editSave()', 'POST', 1, 'admin', '研发部门', '/he/video/edit', '127.0.0.1', '内网IP', '{\"id\":[\"6\"],\"videoUrl\":[\"https://web-ops-test.master.live/video/7B6EE29F938B2BC42938F3A6E792BFE6.mp4\"],\"title\":[\"12千千万万\"],\"boardId\":[\"1\"],\"status\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-18 03:08:40');
INSERT INTO `sys_oper_log` VALUES (529, '宣教视频', 2, 'com.pepper.project.he.video.controller.VideoController.updateAvatar()', 'POST', 1, 'admin', '研发部门', '/he/video/edit/upload', '127.0.0.1', '内网IP', '{\"fileId\":[\"5937291_47770-9390我.mp4\"],\"initialPreview\":[\"[]\"],\"initialPreviewConfig\":[\"[]\"],\"initialPreviewThumbTags\":[\"[]\"]}', '{\"msg\":\"/profile/healthVideo/2020/02/18/f46509065e17613e51eaae1cf48e44ca.mp4\",\"code\":0}', 0, NULL, '2020-02-18 03:09:17');
INSERT INTO `sys_oper_log` VALUES (530, '宣教板块', 2, 'com.pepper.project.he.video.controller.VideoController.editSave()', 'POST', 1, 'admin', '研发部门', '/he/video/edit', '127.0.0.1', '内网IP', '{\"id\":[\"6\"],\"videoUrl\":[\"https://web-ops-test.master.live/video/7B6EE29F938B2BC42938F3A6E792BFE6.mp4\"],\"title\":[\"12千千万万\"],\"boardId\":[\"1\"],\"status\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-18 03:10:40');
INSERT INTO `sys_oper_log` VALUES (531, '宣教视频', 2, 'com.pepper.project.he.video.controller.VideoController.updateAvatar()', 'POST', 1, 'admin', '研发部门', '/he/video/edit/upload', '127.0.0.1', '内网IP', '{\"fileId\":[\"5937291_47770-9390我.mp4\"],\"initialPreview\":[\"[]\"],\"initialPreviewConfig\":[\"[]\"],\"initialPreviewThumbTags\":[\"[]\"]}', '{\"msg\":\"/profile/healthVideo/2020/02/18/bfd99136d6959872671312d414894d89.mp4\",\"code\":0}', 0, NULL, '2020-02-18 03:11:53');
INSERT INTO `sys_oper_log` VALUES (532, '宣教板块', 2, 'com.pepper.project.he.video.controller.VideoController.editSave()', 'POST', 1, 'admin', '研发部门', '/he/video/edit', '127.0.0.1', '内网IP', '{\"id\":[\"6\"],\"videoUrl\":[\"/profile/healthVideo/2020/02/18/bfd99136d6959872671312d414894d89.mp4\"],\"title\":[\"12千千万万\"],\"boardId\":[\"1\"],\"status\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-18 03:12:28');
INSERT INTO `sys_oper_log` VALUES (533, '宣教板块', 1, 'com.pepper.project.he.video.controller.VideoController.addSave()', 'POST', 1, 'admin', '研发部门', '/he/video/add', '127.0.0.1', '内网IP', '{\"videoUrl1\":[\"\"],\"title\":[\"视频安全教育视频-欢迎点赞观看\"],\"boardId\":[\"1\"],\"status\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-18 04:22:13');
INSERT INTO `sys_oper_log` VALUES (534, '宣教板块', 3, 'com.pepper.project.he.video.controller.VideoController.remove()', 'POST', 1, 'admin', '研发部门', '/he/video/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"7\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-18 04:22:25');
INSERT INTO `sys_oper_log` VALUES (535, '宣教视频', 2, 'com.pepper.project.he.video.controller.VideoController.addUpload()', 'POST', 1, 'admin', '研发部门', '/he/video/upload', '127.0.0.1', '内网IP', '{\"fileId\":[\"5937291_47770-9390我.mp4\"],\"initialPreview\":[\"[]\"],\"initialPreviewConfig\":[\"[]\"],\"initialPreviewThumbTags\":[\"[]\"]}', '{\"msg\":\"/profile/healthVideo/2020/02/18/cfba1ac40d0b61d2bc42968349770eee.mp4\",\"code\":0}', 0, NULL, '2020-02-18 04:28:53');
INSERT INTO `sys_oper_log` VALUES (536, '宣教板块', 1, 'com.pepper.project.he.video.controller.VideoController.addSave()', 'POST', 1, 'admin', '研发部门', '/he/video/add', '127.0.0.1', '内网IP', '{\"videoUrl1\":[\"/profile/healthVideo/2020/02/18/cfba1ac40d0b61d2bc42968349770eee.mp4\"],\"title\":[\"食品安全要注意-关注家人健康\"],\"boardId\":[\"1\"],\"status\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-18 04:28:56');
INSERT INTO `sys_oper_log` VALUES (537, '宣教板块', 3, 'com.pepper.project.he.video.controller.VideoController.remove()', 'POST', 1, 'admin', '研发部门', '/he/video/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"8\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-18 04:29:02');
INSERT INTO `sys_oper_log` VALUES (538, '宣教视频', 2, 'com.pepper.project.he.video.controller.VideoController.addUpload()', 'POST', 1, 'admin', '研发部门', '/he/video/upload', '127.0.0.1', '内网IP', '{\"fileId\":[\"615815_12.mp4\"],\"initialPreview\":[\"[]\"],\"initialPreviewConfig\":[\"[]\"],\"initialPreviewThumbTags\":[\"[]\"]}', '{\"msg\":\"/profile/healthVideo/2020/02/18/1d1f28b304823eb7309b1c20559d652f.mp4\",\"code\":0}', 0, NULL, '2020-02-18 04:29:29');
INSERT INTO `sys_oper_log` VALUES (539, '宣教视频', 2, 'com.pepper.project.he.video.controller.VideoController.addUpload()', 'POST', 1, 'admin', '研发部门', '/he/video/upload', '127.0.0.1', '内网IP', '{\"fileId\":[\"615815_12.mp4\"],\"initialPreview\":[\"[]\"],\"initialPreviewConfig\":[\"[]\"],\"initialPreviewThumbTags\":[\"[]\"]}', '{\"msg\":\"/profile/healthVideo/2020/02/18/f5ff18da716b0ca8ba71c85f36de550b.mp4\",\"code\":0}', 0, NULL, '2020-02-18 04:31:09');
INSERT INTO `sys_oper_log` VALUES (540, '宣教板块', 1, 'com.pepper.project.he.video.controller.VideoController.addSave()', 'POST', 1, 'admin', '研发部门', '/he/video/add', '127.0.0.1', '内网IP', '{\"videoUrl\":[\"/profile/healthVideo/2020/02/18/f5ff18da716b0ca8ba71c85f36de550b.mp4\"],\"title\":[\"食品安全要注意-关注家人健康\"],\"boardId\":[\"1\"],\"status\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-18 04:31:11');
INSERT INTO `sys_oper_log` VALUES (541, '宣教视频', 2, 'com.pepper.project.he.video.controller.VideoController.editUpload()', 'POST', 1, 'admin', '研发部门', '/he/video/edit/upload', '127.0.0.1', '内网IP', '{\"fileId\":[\"615815_12.mp4\"],\"initialPreview\":[\"[]\"],\"initialPreviewConfig\":[\"[]\"],\"initialPreviewThumbTags\":[\"[]\"]}', '{\"msg\":\"/profile/healthVideo/2020/02/18/d508e786eb929da75d783b57fb3c655d.mp4\",\"code\":0}', 0, NULL, '2020-02-18 04:31:43');
INSERT INTO `sys_oper_log` VALUES (542, '宣教板块', 2, 'com.pepper.project.he.video.controller.VideoController.editSave()', 'POST', 1, 'admin', '研发部门', '/he/video/edit', '127.0.0.1', '内网IP', '{\"id\":[\"6\"],\"videoUrl\":[\"/profile/healthVideo/2020/02/18/d508e786eb929da75d783b57fb3c655d.mp4\"],\"title\":[\"12千千万万\"],\"boardId\":[\"1\"],\"status\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-18 04:31:47');
INSERT INTO `sys_oper_log` VALUES (543, '宣教视频', 2, 'com.pepper.project.he.video.controller.VideoController.addUpload()', 'POST', 1, 'admin', '研发部门', '/he/video/upload', '127.0.0.1', '内网IP', '{\"fileId\":[\"615815_12.mp4\",\"0099009\"],\"initialPreview\":[\"[]\"],\"initialPreviewConfig\":[\"[]\"],\"initialPreviewThumbTags\":[\"[]\"]}', '{\"msg\":\"/profile/healthVideo/2020/02/18/71c72dd71e6844b6d6e5ef2b9fc1ca10.mp4\",\"code\":0}', 0, NULL, '2020-02-18 04:35:06');
INSERT INTO `sys_oper_log` VALUES (544, '宣教板块', 2, 'com.pepper.project.he.video.controller.VideoController.editSave()', 'POST', 1, 'admin', '研发部门', '/he/video/edit', '127.0.0.1', '内网IP', '{\"id\":[\"9\"],\"videoUrl\":[\"/profile/healthVideo/2020/02/18/f5ff18da716b0ca8ba71c85f36de550b.mp4\"],\"title\":[\"食品安全要注意-关注家人健康\"],\"boardId\":[\"1\"],\"status\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-18 05:26:43');
INSERT INTO `sys_oper_log` VALUES (545, '宣教板块', 2, 'com.pepper.project.he.video.controller.VideoController.editSave()', 'POST', 1, 'admin', '研发部门', '/he/video/edit', '127.0.0.1', '内网IP', '{\"id\":[\"9\"],\"videoUrl\":[\"/profile/healthVideo/2020/02/18/f5ff18da716b0ca8ba71c85f36de550b.mp4\"],\"title\":[\"食品安全要注意-关注家人健康\"],\"boardId\":[\"1\"],\"status\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-18 05:26:46');
INSERT INTO `sys_oper_log` VALUES (546, '宣教板块', 2, 'com.pepper.project.he.video.controller.VideoController.editSave()', 'POST', 1, 'admin', '研发部门', '/he/video/edit', '127.0.0.1', '内网IP', '{\"id\":[\"9\"],\"videoUrl\":[\"/profile/healthVideo/2020/02/18/f5ff18da716b0ca8ba71c85f36de550b.mp4\"],\"title\":[\"食品安全要注意-关注家人健康\"],\"boardId\":[\"1\"],\"status\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-18 05:26:49');
INSERT INTO `sys_oper_log` VALUES (547, '菜单管理', 1, 'com.pepper.project.system.menu.controller.MenuController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"0\"],\"menuType\":[\"M\"],\"menuName\":[\"客户端用户管理\"],\"url\":[\"\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"8\"],\"icon\":[\"fa fa-user\"],\"visible\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-18 07:22:35');
INSERT INTO `sys_oper_log` VALUES (548, '菜单管理', 1, 'com.pepper.project.system.menu.controller.MenuController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"1157\"],\"menuType\":[\"C\"],\"menuName\":[\"用户列表\"],\"url\":[\"/ch/clientuser\"],\"target\":[\"menuItem\"],\"perms\":[\"ch:clientuser:view\"],\"orderNum\":[\"1\"],\"icon\":[\"fa fa-user-circle\"],\"visible\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-18 07:23:25');
INSERT INTO `sys_oper_log` VALUES (549, '菜单管理', 1, 'com.pepper.project.system.menu.controller.MenuController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"1158\"],\"menuType\":[\"F\"],\"menuName\":[\"用户列表查询\"],\"url\":[\"\"],\"target\":[\"menuItem\"],\"perms\":[\"ch:clientuser:list\"],\"orderNum\":[\"1\"],\"icon\":[\"\"],\"visible\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-18 07:23:51');
INSERT INTO `sys_oper_log` VALUES (550, '菜单管理', 2, 'com.pepper.project.system.menu.controller.MenuController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"1158\"],\"parentId\":[\"1157\"],\"menuType\":[\"C\"],\"menuName\":[\"用户列表\"],\"url\":[\"/sm/clientuser\"],\"target\":[\"menuItem\"],\"perms\":[\"ch:clientuser:view\"],\"orderNum\":[\"1\"],\"icon\":[\"fa fa-user-circle\"],\"visible\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-18 07:40:43');
INSERT INTO `sys_oper_log` VALUES (551, '菜单管理', 2, 'com.pepper.project.system.menu.controller.MenuController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"1158\"],\"parentId\":[\"1157\"],\"menuType\":[\"C\"],\"menuName\":[\"用户列表\"],\"url\":[\"/sm/clientuser\"],\"target\":[\"menuItem\"],\"perms\":[\"sm:clientuser:view\"],\"orderNum\":[\"1\"],\"icon\":[\"fa fa-user-circle\"],\"visible\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-18 07:40:54');
INSERT INTO `sys_oper_log` VALUES (552, '菜单管理', 2, 'com.pepper.project.system.menu.controller.MenuController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"1159\"],\"parentId\":[\"1158\"],\"menuType\":[\"F\"],\"menuName\":[\"用户列表查询\"],\"url\":[\"#\"],\"target\":[\"menuItem\"],\"perms\":[\"sm:clientuser:list\"],\"orderNum\":[\"1\"],\"icon\":[\"#\"],\"visible\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-18 07:41:01');
INSERT INTO `sys_oper_log` VALUES (553, '宣教文章', 2, 'com.pepper.project.he.article.controller.ArticleController.editSave()', 'POST', 1, 'admin', '研发部门', '/he/article/edit', '127.0.0.1', '内网IP', '{\"id\":[\"1\"],\"title\":[\"111\"],\"content\":[\"犯得上反对撒犯得上发射点\"],\"boardId\":[\"1\"],\"status\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-18 08:38:03');
INSERT INTO `sys_oper_log` VALUES (554, '宣教板块', 1, 'com.pepper.project.he.board.controller.BoardController.addSave()', 'POST', 1, 'admin', '研发部门', '/he/board/add', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-18 08:47:28');
INSERT INTO `sys_oper_log` VALUES (555, '宣教板块', 1, 'com.pepper.project.he.board.controller.BoardController.addSave()', 'POST', 1, 'admin', '研发部门', '/he/board/add', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-18 08:48:55');
INSERT INTO `sys_oper_log` VALUES (556, '宣教板块', 3, 'com.pepper.project.he.board.controller.BoardController.remove()', 'POST', 1, 'admin', '研发部门', '/he/board/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"6\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-18 08:50:01');
INSERT INTO `sys_oper_log` VALUES (557, '宣教板块', 3, 'com.pepper.project.he.board.controller.BoardController.remove()', 'POST', 1, 'admin', '研发部门', '/he/board/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"5\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-18 08:50:03');
INSERT INTO `sys_oper_log` VALUES (558, '宣教板块', 1, 'com.pepper.project.he.board.controller.BoardController.addSave()', 'POST', 1, 'admin', '研发部门', '/he/board/add', '127.0.0.1', '内网IP', '{\"id\":[\"4\"],\"boardCode\":[\"10004\"],\"boardName\":[\"常见病护理\"],\"sort\":[\"110\"],\"status\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-18 08:50:11');
INSERT INTO `sys_oper_log` VALUES (559, '宣教视频', 2, 'com.pepper.project.he.video.controller.VideoController.addUpload()', 'POST', 1, 'admin', '研发部门', '/he/video/upload', '127.0.0.1', '内网IP', '{\"fileId\":[\"5937291_47770-9390我.mp4\"],\"initialPreview\":[\"[]\"],\"initialPreviewConfig\":[\"[]\"],\"initialPreviewThumbTags\":[\"[]\"],\"uploadModule\":[\"healthEducation\"]}', '{\"msg\":\"/profile/healthEducation/2020/02/18/95ca7b443ecb720632d299104307a3e1.mp4\",\"code\":0}', 0, NULL, '2020-02-18 08:55:48');
INSERT INTO `sys_oper_log` VALUES (560, '宣教板块', 1, 'com.pepper.project.he.video.controller.VideoController.addSave()', 'POST', 1, 'admin', '研发部门', '/he/video/add', '127.0.0.1', '内网IP', '{\"videoUrl\":[\"/profile/healthEducation/2020/02/18/95ca7b443ecb720632d299104307a3e1.mp4\"],\"title\":[\"12121212\"],\"boardId\":[\"1\"],\"status\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-18 08:55:49');
INSERT INTO `sys_oper_log` VALUES (561, '宣教板块', 2, 'com.pepper.project.he.video.controller.VideoController.editSave()', 'POST', 1, 'admin', '研发部门', '/he/video/edit', '127.0.0.1', '内网IP', '{\"id\":[\"10\"],\"videoUrl\":[\"/profile/healthEducation/2020/02/18/95ca7b443ecb720632d299104307a3e1.mp4\"],\"title\":[\"12121212\"],\"boardId\":[\"3\"],\"status\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-18 08:56:04');
INSERT INTO `sys_oper_log` VALUES (562, '菜单管理', 1, 'com.pepper.project.system.menu.controller.MenuController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"0\"],\"menuType\":[\"M\"],\"menuName\":[\"首页管理\"],\"url\":[\"\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"9\"],\"icon\":[\"fa fa-braille\"],\"visible\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-18 13:48:44');
INSERT INTO `sys_oper_log` VALUES (563, '菜单管理', 1, 'com.pepper.project.system.menu.controller.MenuController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"1160\"],\"menuType\":[\"C\"],\"menuName\":[\"轮播广告\"],\"url\":[\"/fp/loop\"],\"target\":[\"menuItem\"],\"perms\":[\"fp:loop:view\"],\"orderNum\":[\"1\"],\"icon\":[\"fa fa-image\"],\"visible\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-18 13:50:14');
INSERT INTO `sys_oper_log` VALUES (564, '菜单管理', 1, 'com.pepper.project.system.menu.controller.MenuController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"1161\"],\"menuType\":[\"F\"],\"menuName\":[\"轮播广告查询\"],\"url\":[\"\"],\"target\":[\"menuItem\"],\"perms\":[\"fp:loop:list\"],\"orderNum\":[\"1\"],\"icon\":[\"\"],\"visible\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-18 13:50:37');
INSERT INTO `sys_oper_log` VALUES (565, '菜单管理', 1, 'com.pepper.project.system.menu.controller.MenuController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"1161\"],\"menuType\":[\"F\"],\"menuName\":[\"轮播广告新增\"],\"url\":[\"\"],\"target\":[\"menuItem\"],\"perms\":[\"fp:loop:add\"],\"orderNum\":[\"2\"],\"icon\":[\"\"],\"visible\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-18 13:51:00');
INSERT INTO `sys_oper_log` VALUES (566, '菜单管理', 1, 'com.pepper.project.system.menu.controller.MenuController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"1161\"],\"menuType\":[\"F\"],\"menuName\":[\"轮播广告编辑\"],\"url\":[\"\"],\"target\":[\"menuItem\"],\"perms\":[\"fp:loop:edit\"],\"orderNum\":[\"3\"],\"icon\":[\"\"],\"visible\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-18 13:51:23');
INSERT INTO `sys_oper_log` VALUES (567, '菜单管理', 1, 'com.pepper.project.system.menu.controller.MenuController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"1161\"],\"menuType\":[\"F\"],\"menuName\":[\"轮播广告删除\"],\"url\":[\"\"],\"target\":[\"menuItem\"],\"perms\":[\"fp:loop:delete\"],\"orderNum\":[\"4\"],\"icon\":[\"\"],\"visible\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-18 13:51:41');
INSERT INTO `sys_oper_log` VALUES (568, '宣教视频', 2, 'com.pepper.project.he.video.controller.VideoController.addUpload()', 'POST', 1, 'admin', '研发部门', '/he/video/upload', '127.0.0.1', '内网IP', '{\"fileId\":[\"371503__115814979473291.png\"],\"initialPreview\":[\"[]\"],\"initialPreviewConfig\":[\"[]\"],\"initialPreviewThumbTags\":[\"[]\"],\"uploadModule\":[\"healthEducation\"]}', '{\"msg\":\"/profile/healthEducation/2020/02/18/b08cc93e3336258fd0c28caa5a012c45.png\",\"code\":0}', 0, NULL, '2020-02-18 14:08:31');
INSERT INTO `sys_oper_log` VALUES (569, '菜单管理', 2, 'com.pepper.project.system.menu.controller.MenuController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"1161\"],\"parentId\":[\"1160\"],\"menuType\":[\"C\"],\"menuName\":[\"轮播广告\"],\"url\":[\"/fp/loopImage\"],\"target\":[\"menuItem\"],\"perms\":[\"fp:loop:view\"],\"orderNum\":[\"1\"],\"icon\":[\"fa fa-image\"],\"visible\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-18 14:15:23');
INSERT INTO `sys_oper_log` VALUES (570, '轮播图', 2, 'com.pepper.project.fp.loop.controller.LoopImageController.addUpload()', 'POST', 1, 'admin', '研发部门', '/fp/loopImage/upload', '127.0.0.1', '内网IP', '{\"fileId\":[\"371503__115814979473291.png\"],\"initialPreview\":[\"[]\"],\"initialPreviewConfig\":[\"[]\"],\"initialPreviewThumbTags\":[\"[]\"],\"uploadModule\":[\"loopImage\"]}', '{\"msg\":\"/profile/loopImage/2020/02/18/dfa5fb8c7241c8d3700a6e440cc29060.png\",\"code\":0}', 0, NULL, '2020-02-18 14:22:37');
INSERT INTO `sys_oper_log` VALUES (571, '宣教板块', 1, 'com.pepper.project.fp.loop.controller.LoopImageController.addSave()', 'POST', 1, 'admin', '研发部门', '/fp/loopImage/add', '127.0.0.1', '内网IP', '{\"imageUrl\":[\"/profile/loopImage/2020/02/18/dfa5fb8c7241c8d3700a6e440cc29060.png\"],\"title\":[\"1212\"],\"sort\":[\"1221\"],\"status\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-18 14:22:39');
INSERT INTO `sys_oper_log` VALUES (572, '轮播图', 2, 'com.pepper.project.fp.loop.controller.LoopImageController.addUpload()', 'POST', 1, 'admin', '研发部门', '/fp/loopImage/upload', '127.0.0.1', '内网IP', '{\"fileId\":[\"281882_forest.jpg\"],\"initialPreview\":[\"[]\"],\"initialPreviewConfig\":[\"[]\"],\"initialPreviewThumbTags\":[\"[]\"],\"uploadModule\":[\"loopImage\"]}', '{\"msg\":\"/profile/loopImage/2020/02/18/c9676529ceb587487d19bb163f8c4e35.jpg\",\"code\":0}', 0, NULL, '2020-02-18 14:25:13');
INSERT INTO `sys_oper_log` VALUES (573, '宣教板块', 1, 'com.pepper.project.fp.loop.controller.LoopImageController.addSave()', 'POST', 1, 'admin', '研发部门', '/fp/loopImage/add', '127.0.0.1', '内网IP', '{\"imageUrl\":[\"/profile/loopImage/2020/02/18/c9676529ceb587487d19bb163f8c4e35.jpg\"],\"title\":[\"123112321\"],\"sort\":[\"12313\"],\"status\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-18 14:25:15');
INSERT INTO `sys_oper_log` VALUES (574, '轮播图', 2, 'com.pepper.project.fp.loop.controller.LoopImageController.editUpload()', 'POST', 1, 'admin', '研发部门', '/fp/loopImage/edit/upload', '127.0.0.1', '内网IP', '{\"fileId\":[\"91514_500X500.png\"],\"initialPreview\":[\"[]\"],\"initialPreviewConfig\":[\"[]\"],\"initialPreviewThumbTags\":[\"[]\"],\"uploadModule\":[\"loopImage\"]}', '{\"msg\":\"/profile/loopImage/2020/02/18/bca2da94d386e44d5f1ceeff405cb94a.png\",\"code\":0}', 0, NULL, '2020-02-18 14:29:16');
INSERT INTO `sys_oper_log` VALUES (575, '宣教板块', 2, 'com.pepper.project.fp.loop.controller.LoopImageController.editSave()', 'POST', 1, 'admin', '研发部门', '/fp/loopImage/edit', '127.0.0.1', '内网IP', '{\"id\":[\"2\"],\"imageUrl\":[\"/profile/loopImage/2020/02/18/bca2da94d386e44d5f1ceeff405cb94a.png\"],\"title\":[\"123112321\"],\"sort\":[\"12313\"],\"status\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-18 14:29:18');
INSERT INTO `sys_oper_log` VALUES (576, '菜单管理', 3, 'com.pepper.project.system.menu.controller.MenuController.remove()', 'GET', 1, 'admin', '研发部门', '/system/menu/remove/1071', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"存在子菜单,不允许删除\",\"code\":301}', 0, NULL, '2020-02-18 15:13:55');
INSERT INTO `sys_oper_log` VALUES (577, '菜单管理', 3, 'com.pepper.project.system.menu.controller.MenuController.remove()', 'GET', 1, 'admin', '研发部门', '/system/menu/remove/1072', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-18 15:14:03');
INSERT INTO `sys_oper_log` VALUES (578, '菜单管理', 3, 'com.pepper.project.system.menu.controller.MenuController.remove()', 'GET', 1, 'admin', '研发部门', '/system/menu/remove/1074', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-18 15:14:14');
INSERT INTO `sys_oper_log` VALUES (579, '菜单管理', 3, 'com.pepper.project.system.menu.controller.MenuController.remove()', 'GET', 1, 'admin', '研发部门', '/system/menu/remove/1075', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-18 15:14:22');
INSERT INTO `sys_oper_log` VALUES (580, '菜单管理', 3, 'com.pepper.project.system.menu.controller.MenuController.remove()', 'GET', 1, 'admin', '研发部门', '/system/menu/remove/1076', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-18 15:14:30');
INSERT INTO `sys_oper_log` VALUES (581, '菜单管理', 3, 'com.pepper.project.system.menu.controller.MenuController.remove()', 'GET', 1, 'admin', '研发部门', '/system/menu/remove/1071', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-18 15:14:38');
INSERT INTO `sys_oper_log` VALUES (582, '通知公告', 2, 'com.pepper.project.system.notice.controller.NoticeController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/notice/edit', '127.0.0.1', '内网IP', '{\"noticeId\":[\"1\"],\"noticeTitle\":[\"温馨提醒：2018-07-01 若依新版本发布啦\"],\"noticeType\":[\"2\"],\"noticeContent\":[\"<p>新版本内容</p><p>管理员先新增社区或者物业</p><p>然后添加用户的时候更具物业或者社区类型，选择物业或者社区，</p><p>然后给其添加菜单，</p><p>这里给其添加得菜单都是需要做处理得，查询都需要带上所属得社区或者物业id</p>\"],\"status\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-18 16:11:59');
INSERT INTO `sys_oper_log` VALUES (583, '通知公告', 2, 'com.pepper.project.system.notice.controller.NoticeController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/notice/edit', '127.0.0.1', '内网IP', '{\"noticeId\":[\"1\"],\"noticeTitle\":[\"温馨提醒：2018-07-01 若依新版本发布啦\"],\"noticeType\":[\"2\"],\"noticeContent\":[\"<p>新版本内容</p><p>管理员先新增社区或者物业</p><p>然后添加用户的时候更具物业或者社区类型，选择物业或者社区，</p><p>然后给其添加菜单，</p><p>这里给其添加得菜单都是需要做处理得，查询都需要带上所属得社区或者物业id</p><p>操作员的化，那就给权限得时候给一个查询权限</p><p><br></p>\"],\"status\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-18 16:13:41');
INSERT INTO `sys_oper_log` VALUES (584, '用户管理', 2, 'com.pepper.project.system.user.controller.UserController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/user/edit', '127.0.0.1', '内网IP', '{\"userId\":[\"100\"],\"deptId\":[\"103\"],\"userName\":[\"hanjietao\"],\"dept.deptName\":[\"研发部门\"],\"phonenumber\":[\"18505561893\"],\"email\":[\"hjtxyr@163.com\"],\"loginName\":[\"hanjietao\"],\"sex\":[\"0\"],\"role\":[\"100\"],\"remark\":[\"test  menu\"],\"status\":[\"0\"],\"roleIds\":[\"100\"],\"postIds\":[\"4\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-19 18:05:07');
INSERT INTO `sys_oper_log` VALUES (585, '用户管理', 2, 'com.pepper.project.system.user.controller.UserController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/user/edit', '127.0.0.1', '内网IP', '{\"userId\":[\"1\"],\"deptId\":[\"103\"],\"userName\":[\"韩结涛\"],\"dept.deptName\":[\"研发部门\"],\"phonenumber\":[\"15888888888\"],\"email\":[\"ry@163.com\"],\"loginName\":[\"admin\"],\"sex\":[\"0\"],\"role\":[\"1\"],\"remark\":[\"管理员\"],\"status\":[\"0\"],\"roleIds\":[\"1\"],\"postIds\":[\"1\"]}', 'null', 1, '不允许操作超级管理员用户', '2020-02-19 18:05:18');
INSERT INTO `sys_oper_log` VALUES (586, '用户管理', 3, 'com.pepper.project.system.user.controller.UserController.remove()', 'POST', 1, 'admin', '研发部门', '/system/user/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"2\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-19 18:05:35');
INSERT INTO `sys_oper_log` VALUES (587, '部门管理', 3, 'com.pepper.project.system.dept.controller.DeptController.remove()', 'GET', 1, 'admin', '研发部门', '/system/dept/remove/107', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-19 18:15:22');
INSERT INTO `sys_oper_log` VALUES (588, '部门管理', 3, 'com.pepper.project.system.dept.controller.DeptController.remove()', 'GET', 1, 'admin', '研发部门', '/system/dept/remove/106', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-19 18:15:25');
INSERT INTO `sys_oper_log` VALUES (589, '部门管理', 3, 'com.pepper.project.system.dept.controller.DeptController.remove()', 'GET', 1, 'admin', '研发部门', '/system/dept/remove/105', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-19 18:15:27');
INSERT INTO `sys_oper_log` VALUES (590, '部门管理', 2, 'com.pepper.project.system.dept.controller.DeptController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/dept/edit', '127.0.0.1', '内网IP', '{\"deptId\":[\"103\"],\"parentId\":[\"101\"],\"parentName\":[\"业务管理\"],\"deptName\":[\"管理员\"],\"orderNum\":[\"1\"],\"leader\":[\"若依\"],\"phone\":[\"15888888888\"],\"email\":[\"ry@qq.com\"],\"status\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-19 20:19:28');
INSERT INTO `sys_oper_log` VALUES (591, '部门管理', 2, 'com.pepper.project.system.dept.controller.DeptController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/dept/edit', '127.0.0.1', '内网IP', '{\"deptId\":[\"104\"],\"parentId\":[\"101\"],\"parentName\":[\"业务管理\"],\"deptName\":[\"社区\"],\"orderNum\":[\"2\"],\"leader\":[\"若依\"],\"phone\":[\"15888888888\"],\"email\":[\"ry@qq.com\"],\"status\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-19 20:19:37');
INSERT INTO `sys_oper_log` VALUES (592, '部门管理', 1, 'com.pepper.project.system.dept.controller.DeptController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/dept/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"101\"],\"deptName\":[\"物业\"],\"orderNum\":[\"3\"],\"leader\":[\"admin\"],\"phone\":[\"18900000000\"],\"email\":[\"admin@163.com\"],\"status\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-19 20:20:23');
INSERT INTO `sys_oper_log` VALUES (593, '部门管理', 2, 'com.pepper.project.system.dept.controller.DeptController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/dept/edit', '127.0.0.1', '内网IP', '{\"deptId\":[\"104\"],\"parentId\":[\"101\"],\"parentName\":[\"业务管理\"],\"deptName\":[\"社区\"],\"orderNum\":[\"2\"],\"leader\":[\"若依\"],\"phone\":[\"15888888888\"],\"email\":[\"admin@163.com\"],\"status\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-19 20:20:41');
INSERT INTO `sys_oper_log` VALUES (594, '部门管理', 2, 'com.pepper.project.system.dept.controller.DeptController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/dept/edit', '127.0.0.1', '内网IP', '{\"deptId\":[\"103\"],\"parentId\":[\"101\"],\"parentName\":[\"业务管理\"],\"deptName\":[\"管理员\"],\"orderNum\":[\"1\"],\"leader\":[\"若依\"],\"phone\":[\"15888888888\"],\"email\":[\"admin@163.com\"],\"status\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-19 20:20:51');
INSERT INTO `sys_oper_log` VALUES (595, '部门管理', 2, 'com.pepper.project.system.dept.controller.DeptController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/dept/edit', '127.0.0.1', '内网IP', '{\"deptId\":[\"104\"],\"parentId\":[\"101\"],\"parentName\":[\"业务管理\"],\"deptName\":[\"社区\"],\"orderNum\":[\"2\"],\"leader\":[\"若依\"],\"phone\":[\"15888888888\"],\"email\":[\"admin@163.com\"],\"status\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-19 20:20:55');
INSERT INTO `sys_oper_log` VALUES (596, '部门管理', 2, 'com.pepper.project.system.dept.controller.DeptController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/dept/edit', '127.0.0.1', '内网IP', '{\"deptId\":[\"110\"],\"parentId\":[\"101\"],\"parentName\":[\"业务管理\"],\"deptName\":[\"物业\"],\"orderNum\":[\"3\"],\"leader\":[\"admin\"],\"phone\":[\"15888888888\"],\"email\":[\"admin@163.com\"],\"status\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-19 20:21:03');
INSERT INTO `sys_oper_log` VALUES (597, '部门管理', 1, 'com.pepper.project.system.dept.controller.DeptController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/dept/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"101\"],\"deptName\":[\"医院\"],\"orderNum\":[\"4\"],\"leader\":[\"admin\"],\"phone\":[\"15888888888\"],\"email\":[\"admin@163.com\"],\"status\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-19 20:21:33');
INSERT INTO `sys_oper_log` VALUES (598, '部门管理', 2, 'com.pepper.project.system.dept.controller.DeptController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/dept/edit', '127.0.0.1', '内网IP', '{\"deptId\":[\"101\"],\"parentId\":[\"100\"],\"parentName\":[\"社区医院总公司\"],\"deptName\":[\"管理员管理部\"],\"orderNum\":[\"1\"],\"leader\":[\"admin\"],\"phone\":[\"15888888888\"],\"email\":[\"admin@163.com\"],\"status\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-19 20:24:41');
INSERT INTO `sys_oper_log` VALUES (599, '部门管理', 2, 'com.pepper.project.system.dept.controller.DeptController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/dept/edit', '127.0.0.1', '内网IP', '{\"deptId\":[\"103\"],\"parentId\":[\"101\"],\"parentName\":[\"管理员管理部\"],\"deptName\":[\"超级管理员\"],\"orderNum\":[\"1\"],\"leader\":[\"若依\"],\"phone\":[\"15888888888\"],\"email\":[\"admin@163.com\"],\"status\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-19 20:24:56');
INSERT INTO `sys_oper_log` VALUES (600, '部门管理', 2, 'com.pepper.project.system.dept.controller.DeptController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/dept/edit', '127.0.0.1', '内网IP', '{\"deptId\":[\"104\"],\"parentId\":[\"101\"],\"parentName\":[\"管理员管理部\"],\"deptName\":[\"社区管理员\"],\"orderNum\":[\"2\"],\"leader\":[\"admin\"],\"phone\":[\"15888888888\"],\"email\":[\"admin@163.com\"],\"status\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-19 20:25:19');
INSERT INTO `sys_oper_log` VALUES (601, '部门管理', 2, 'com.pepper.project.system.dept.controller.DeptController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/dept/edit', '127.0.0.1', '内网IP', '{\"deptId\":[\"110\"],\"parentId\":[\"101\"],\"parentName\":[\"管理员管理部\"],\"deptName\":[\"物业管理员\"],\"orderNum\":[\"3\"],\"leader\":[\"admin\"],\"phone\":[\"15888888888\"],\"email\":[\"admin@163.com\"],\"status\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-19 20:25:30');
INSERT INTO `sys_oper_log` VALUES (602, '部门管理', 2, 'com.pepper.project.system.dept.controller.DeptController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/dept/edit', '127.0.0.1', '内网IP', '{\"deptId\":[\"111\"],\"parentId\":[\"101\"],\"parentName\":[\"管理员管理部\"],\"deptName\":[\"医院管理员\"],\"orderNum\":[\"4\"],\"leader\":[\"admin\"],\"phone\":[\"15888888888\"],\"email\":[\"admin@163.com\"],\"status\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-19 20:25:33');
INSERT INTO `sys_oper_log` VALUES (603, '用户管理', 2, 'com.pepper.project.system.user.controller.UserController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/user/edit', '127.0.0.1', '内网IP', '{\"userId\":[\"101\"],\"deptId\":[\"103\"],\"userName\":[\"hanjietao1\"],\"dept.deptName\":[\"超级管理员\"],\"phonenumber\":[\"18900099990\"],\"email\":[\"hanjietao@123.com\"],\"loginName\":[\"hanjietao1\"],\"sex\":[\"0\"],\"role\":[\"1\"],\"remark\":[\"\"],\"status\":[\"0\"],\"roleIds\":[\"1\"],\"postIds\":[\"2\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-19 20:26:57');
INSERT INTO `sys_oper_log` VALUES (604, '角色管理', 4, 'com.pepper.project.system.role.controller.RoleController.cancelAuthUser()', 'POST', 1, 'admin', '研发部门', '/system/role/authUser/cancel', '127.0.0.1', '内网IP', '{\"roleId\":[\"1\"],\"userId\":[\"101\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-19 20:31:23');
INSERT INTO `sys_oper_log` VALUES (605, '用户管理', 2, 'com.pepper.project.system.user.controller.UserController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/user/edit', '127.0.0.1', '内网IP', '{\"userId\":[\"101\"],\"deptId\":[\"103\"],\"userName\":[\"hanjietao1\"],\"dept.deptName\":[\"超级管理员\"],\"phonenumber\":[\"18900099990\"],\"email\":[\"hanjietao@123.com\"],\"loginName\":[\"hanjietao1\"],\"sex\":[\"0\"],\"role\":[\"1\"],\"remark\":[\"\"],\"status\":[\"0\"],\"roleIds\":[\"1\"],\"postIds\":[\"2\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-19 20:31:29');
INSERT INTO `sys_oper_log` VALUES (606, '角色管理', 1, 'com.pepper.project.system.role.controller.RoleController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/role/add', '127.0.0.1', '内网IP', '{\"roleName\":[\"社区总管理员\"],\"roleKey\":[\"communityBigAdmin\"],\"roleSort\":[\"3\"],\"status\":[\"0\"],\"remark\":[\"社区总管理员\"],\"menuIds\":[\"1094,1095,1096,1097,1098,1099\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-19 20:35:29');
INSERT INTO `sys_oper_log` VALUES (607, '角色管理', 1, 'com.pepper.project.system.role.controller.RoleController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/role/add', '127.0.0.1', '内网IP', '{\"roleName\":[\"物业总管理员\"],\"roleKey\":[\"propertyBigAdmin\"],\"roleSort\":[\"5\"],\"status\":[\"0\"],\"remark\":[\"物业总管理员\"],\"menuIds\":[\"1115,1116,1117,1118,1119,1120\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-19 20:37:24');
INSERT INTO `sys_oper_log` VALUES (608, '菜单管理', 1, 'com.pepper.project.system.menu.controller.MenuController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"1065\"],\"menuType\":[\"C\"],\"menuName\":[\"医院管理\"],\"url\":[\"/csc/hospital\"],\"target\":[\"menuItem\"],\"perms\":[\"csc:hospital:view\"],\"orderNum\":[\"2\"],\"icon\":[\"fa fa-bank\"],\"visible\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-19 20:40:12');
INSERT INTO `sys_oper_log` VALUES (609, '菜单管理', 1, 'com.pepper.project.system.menu.controller.MenuController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"1166\"],\"menuType\":[\"F\"],\"menuName\":[\"医院列表查询\"],\"url\":[\"\"],\"target\":[\"menuItem\"],\"perms\":[\"csc:hospital:list\"],\"orderNum\":[\"1\"],\"icon\":[\"\"],\"visible\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-19 20:40:36');
INSERT INTO `sys_oper_log` VALUES (610, '菜单管理', 1, 'com.pepper.project.system.menu.controller.MenuController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"1166\"],\"menuType\":[\"F\"],\"menuName\":[\"医院新增\"],\"url\":[\"\"],\"target\":[\"menuItem\"],\"perms\":[\"csc:hospital:add\"],\"orderNum\":[\"2\"],\"icon\":[\"\"],\"visible\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-19 20:40:59');
INSERT INTO `sys_oper_log` VALUES (611, '菜单管理', 1, 'com.pepper.project.system.menu.controller.MenuController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"1166\"],\"menuType\":[\"F\"],\"menuName\":[\"医院编辑\"],\"url\":[\"\"],\"target\":[\"menuItem\"],\"perms\":[\"csc:hospital:edit\"],\"orderNum\":[\"3\"],\"icon\":[\"\"],\"visible\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-19 20:41:17');
INSERT INTO `sys_oper_log` VALUES (612, '菜单管理', 1, 'com.pepper.project.system.menu.controller.MenuController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"1166\"],\"menuType\":[\"F\"],\"menuName\":[\"医院删除\"],\"url\":[\"\"],\"target\":[\"menuItem\"],\"perms\":[\"csc:hospital:delete\"],\"orderNum\":[\"4\"],\"icon\":[\"\"],\"visible\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-19 20:41:37');
INSERT INTO `sys_oper_log` VALUES (613, '角色管理', 1, 'com.pepper.project.system.role.controller.RoleController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/role/add', '127.0.0.1', '内网IP', '{\"roleName\":[\"医院总管理员\"],\"roleKey\":[\"hospitalBigAdmin\"],\"roleSort\":[\"6\"],\"status\":[\"0\"],\"remark\":[\"医院总管理员\"],\"menuIds\":[\"1065,1166,1167,1168,1169,1170,1078,1080,1081,1082,1083\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-19 20:42:30');
INSERT INTO `sys_oper_log` VALUES (614, '角色管理', 1, 'com.pepper.project.system.role.controller.RoleController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/role/add', '127.0.0.1', '内网IP', '{\"roleName\":[\"社区管理员\"],\"roleKey\":[\"communityAdmin\"],\"roleSort\":[\"7\"],\"status\":[\"0\"],\"remark\":[\"社区管理员\"],\"menuIds\":[\"1094,1100,1101,1102,1103,1104,1107,1108,1109,1110,1111,1112,1113,1114\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-19 20:43:14');
INSERT INTO `sys_oper_log` VALUES (615, '角色管理', 1, 'com.pepper.project.system.role.controller.RoleController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/role/add', '127.0.0.1', '内网IP', '{\"roleName\":[\"物业管理员\"],\"roleKey\":[\"propertyAdmin\"],\"roleSort\":[\"8\"],\"status\":[\"0\"],\"remark\":[\"物业管理员\"],\"menuIds\":[\"1115,1121,1124,1126,1125,1127,1136,1137,1139,1138,1140,1122,1132,1133,1134,1135,1123,1128,1129,1130,1131\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-19 20:43:47');
INSERT INTO `sys_oper_log` VALUES (616, '角色管理', 1, 'com.pepper.project.system.role.controller.RoleController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/role/add', '127.0.0.1', '内网IP', '{\"roleName\":[\"医院管理员\"],\"roleKey\":[\"hospitalAdmin\"],\"roleSort\":[\"9\"],\"status\":[\"0\"],\"remark\":[\"医院管理员\"],\"menuIds\":[\"1065,1078,1080,1081,1082,1083,1084,1085,1086,1087,1088,1089,1090,1091,1092,1093\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-19 20:44:53');
INSERT INTO `sys_oper_log` VALUES (617, '菜单管理', 1, 'com.pepper.project.system.menu.controller.MenuController.addSave()', 'POST', 1, 'admin', '超级管理员', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"0\"],\"menuType\":[\"M\"],\"menuName\":[\"社区医院管理\"],\"url\":[\"\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"6\"],\"icon\":[\"fa fa-plus-circle\"],\"visible\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-20 09:57:36');
INSERT INTO `sys_oper_log` VALUES (618, '菜单管理', 1, 'com.pepper.project.system.menu.controller.MenuController.addSave()', 'POST', 1, 'admin', '超级管理员', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"1171\"],\"menuType\":[\"C\"],\"menuName\":[\"医院管理\"],\"url\":[\"/ch/hospital\"],\"target\":[\"menuItem\"],\"perms\":[\"ch:hospital:view\"],\"orderNum\":[\"1\"],\"icon\":[\"fa fa-bank\"],\"visible\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-20 09:59:29');
INSERT INTO `sys_oper_log` VALUES (619, '菜单管理', 1, 'com.pepper.project.system.menu.controller.MenuController.addSave()', 'POST', 1, 'admin', '超级管理员', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"1172\"],\"menuType\":[\"F\"],\"menuName\":[\"医院列表查询\"],\"url\":[\"\"],\"target\":[\"menuItem\"],\"perms\":[\"ch:hospital:list\"],\"orderNum\":[\"1\"],\"icon\":[\"\"],\"visible\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-20 10:05:09');
INSERT INTO `sys_oper_log` VALUES (620, '菜单管理', 2, 'com.pepper.project.system.menu.controller.MenuController.editSave()', 'POST', 1, 'admin', '超级管理员', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"1115\"],\"parentId\":[\"0\"],\"menuType\":[\"M\"],\"menuName\":[\"物业管理\"],\"url\":[\"#\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"7\"],\"icon\":[\"fa fa-archive\"],\"visible\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-20 10:05:34');
INSERT INTO `sys_oper_log` VALUES (621, '菜单管理', 2, 'com.pepper.project.system.menu.controller.MenuController.editSave()', 'POST', 1, 'admin', '超级管理员', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"1141\"],\"parentId\":[\"0\"],\"menuType\":[\"M\"],\"menuName\":[\"健康宣教\"],\"url\":[\"#\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"8\"],\"icon\":[\"fa fa-dashboard\"],\"visible\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-20 10:05:48');
INSERT INTO `sys_oper_log` VALUES (622, '菜单管理', 2, 'com.pepper.project.system.menu.controller.MenuController.editSave()', 'POST', 1, 'admin', '超级管理员', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"1157\"],\"parentId\":[\"0\"],\"menuType\":[\"M\"],\"menuName\":[\"客户端用户管理\"],\"url\":[\"#\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"9\"],\"icon\":[\"fa fa-user\"],\"visible\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-20 10:05:55');
INSERT INTO `sys_oper_log` VALUES (623, '菜单管理', 2, 'com.pepper.project.system.menu.controller.MenuController.editSave()', 'POST', 1, 'admin', '超级管理员', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"1160\"],\"parentId\":[\"0\"],\"menuType\":[\"M\"],\"menuName\":[\"首页管理\"],\"url\":[\"#\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"10\"],\"icon\":[\"fa fa-braille\"],\"visible\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-20 10:06:00');
INSERT INTO `sys_oper_log` VALUES (624, '菜单管理', 1, 'com.pepper.project.system.menu.controller.MenuController.addSave()', 'POST', 1, 'admin', '超级管理员', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"1171\"],\"menuType\":[\"C\"],\"menuName\":[\"医疗项目\"],\"url\":[\"/ch/medical\"],\"target\":[\"menuItem\"],\"perms\":[\"ch:medical:view\"],\"orderNum\":[\"2\"],\"icon\":[\"\"],\"visible\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-20 10:07:13');
INSERT INTO `sys_oper_log` VALUES (625, '菜单管理', 1, 'com.pepper.project.system.menu.controller.MenuController.addSave()', 'POST', 1, 'admin', '超级管理员', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"1171\"],\"menuType\":[\"C\"],\"menuName\":[\"医生管理\"],\"url\":[\"/ch/doctor\"],\"target\":[\"menuItem\"],\"perms\":[\"ch:doctro:view\"],\"orderNum\":[\"3\"],\"icon\":[\"fa fa-user-circle\"],\"visible\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-20 10:08:14');
INSERT INTO `sys_oper_log` VALUES (626, '菜单管理', 2, 'com.pepper.project.system.menu.controller.MenuController.editSave()', 'POST', 1, 'admin', '超级管理员', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"1175\"],\"parentId\":[\"1171\"],\"menuType\":[\"C\"],\"menuName\":[\"医生管理\"],\"url\":[\"/ch/doctor\"],\"target\":[\"menuItem\"],\"perms\":[\"ch:doctor:view\"],\"orderNum\":[\"3\"],\"icon\":[\"fa fa-user-circle\"],\"visible\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-20 10:08:26');
INSERT INTO `sys_oper_log` VALUES (627, '菜单管理', 2, 'com.pepper.project.system.menu.controller.MenuController.editSave()', 'POST', 1, 'admin', '超级管理员', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"1174\"],\"parentId\":[\"1171\"],\"menuType\":[\"C\"],\"menuName\":[\"医疗项目\"],\"url\":[\"/ch/medical\"],\"target\":[\"menuItem\"],\"perms\":[\"ch:medical:view\"],\"orderNum\":[\"2\"],\"icon\":[\"fa fa-window-restore\"],\"visible\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-20 10:09:18');
INSERT INTO `sys_oper_log` VALUES (628, '菜单管理', 1, 'com.pepper.project.system.menu.controller.MenuController.addSave()', 'POST', 1, 'admin', '超级管理员', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"1171\"],\"menuType\":[\"C\"],\"menuName\":[\"预约管理\"],\"url\":[\"/ch/appointment\"],\"target\":[\"menuItem\"],\"perms\":[\"ch:appointment:view\"],\"orderNum\":[\"4\"],\"icon\":[\"fa fa-calendar-plus-o\"],\"visible\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-20 10:10:16');
INSERT INTO `sys_oper_log` VALUES (629, '菜单管理', 1, 'com.pepper.project.system.menu.controller.MenuController.addSave()', 'POST', 1, 'admin', '超级管理员', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"1172\"],\"menuType\":[\"F\"],\"menuName\":[\"医院新增\"],\"url\":[\"\"],\"target\":[\"menuItem\"],\"perms\":[\"ch:hospital:add\"],\"orderNum\":[\"2\"],\"icon\":[\"\"],\"visible\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-20 10:11:23');
INSERT INTO `sys_oper_log` VALUES (630, '菜单管理', 1, 'com.pepper.project.system.menu.controller.MenuController.addSave()', 'POST', 1, 'admin', '超级管理员', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"1172\"],\"menuType\":[\"F\"],\"menuName\":[\"医院编辑\"],\"url\":[\"\"],\"target\":[\"menuItem\"],\"perms\":[\"ch:hospital:edit\"],\"orderNum\":[\"4\"],\"icon\":[\"\"],\"visible\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-20 10:15:10');
INSERT INTO `sys_oper_log` VALUES (631, '菜单管理', 2, 'com.pepper.project.system.menu.controller.MenuController.editSave()', 'POST', 1, 'admin', '超级管理员', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"1178\"],\"parentId\":[\"1172\"],\"menuType\":[\"F\"],\"menuName\":[\"医院编辑\"],\"url\":[\"#\"],\"target\":[\"menuItem\"],\"perms\":[\"ch:hospital:edit\"],\"orderNum\":[\"3\"],\"icon\":[\"#\"],\"visible\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-20 10:15:26');
INSERT INTO `sys_oper_log` VALUES (632, '菜单管理', 1, 'com.pepper.project.system.menu.controller.MenuController.addSave()', 'POST', 1, 'admin', '超级管理员', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"1172\"],\"menuType\":[\"F\"],\"menuName\":[\"医院删除\"],\"url\":[\"\"],\"target\":[\"menuItem\"],\"perms\":[\"ch:hospital:delete\"],\"orderNum\":[\"4\"],\"icon\":[\"\"],\"visible\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-20 10:15:51');
INSERT INTO `sys_oper_log` VALUES (633, '菜单管理', 1, 'com.pepper.project.system.menu.controller.MenuController.addSave()', 'POST', 1, 'admin', '超级管理员', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"1174\"],\"menuType\":[\"F\"],\"menuName\":[\"医疗项目列表查询\"],\"url\":[\"\"],\"target\":[\"menuItem\"],\"perms\":[\"ch:medical:list\"],\"orderNum\":[\"1\"],\"icon\":[\"\"],\"visible\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-20 10:16:39');
INSERT INTO `sys_oper_log` VALUES (634, '菜单管理', 1, 'com.pepper.project.system.menu.controller.MenuController.addSave()', 'POST', 1, 'admin', '超级管理员', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"1174\"],\"menuType\":[\"F\"],\"menuName\":[\"医疗项目新增\"],\"url\":[\"\"],\"target\":[\"menuItem\"],\"perms\":[\"ch:medical:add\"],\"orderNum\":[\"2\"],\"icon\":[\"\"],\"visible\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-20 10:17:06');
INSERT INTO `sys_oper_log` VALUES (635, '菜单管理', 1, 'com.pepper.project.system.menu.controller.MenuController.addSave()', 'POST', 1, 'admin', '超级管理员', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"1174\"],\"menuType\":[\"F\"],\"menuName\":[\"医疗项目编辑\"],\"url\":[\"\"],\"target\":[\"menuItem\"],\"perms\":[\"ch:medical:edit\"],\"orderNum\":[\"3\"],\"icon\":[\"\"],\"visible\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-20 10:17:35');
INSERT INTO `sys_oper_log` VALUES (636, '菜单管理', 1, 'com.pepper.project.system.menu.controller.MenuController.addSave()', 'POST', 1, 'admin', '超级管理员', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"1174\"],\"menuType\":[\"F\"],\"menuName\":[\"医疗项目删除\"],\"url\":[\"\"],\"target\":[\"menuItem\"],\"perms\":[\"ch:medical:delete\"],\"orderNum\":[\"4\"],\"icon\":[\"\"],\"visible\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-20 10:17:59');
INSERT INTO `sys_oper_log` VALUES (637, '菜单管理', 1, 'com.pepper.project.system.menu.controller.MenuController.addSave()', 'POST', 1, 'admin', '超级管理员', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"1175\"],\"menuType\":[\"F\"],\"menuName\":[\"医生列表\"],\"url\":[\"\"],\"target\":[\"menuItem\"],\"perms\":[\"ch:doctor:list\"],\"orderNum\":[\"1\"],\"icon\":[\"\"],\"visible\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-20 10:18:34');
INSERT INTO `sys_oper_log` VALUES (638, '菜单管理', 1, 'com.pepper.project.system.menu.controller.MenuController.addSave()', 'POST', 1, 'admin', '超级管理员', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"1175\"],\"menuType\":[\"F\"],\"menuName\":[\"医生新增\"],\"url\":[\"\"],\"target\":[\"menuItem\"],\"perms\":[\"ch:doctor:add\"],\"orderNum\":[\"2\"],\"icon\":[\"\"],\"visible\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-20 10:19:13');
INSERT INTO `sys_oper_log` VALUES (639, '菜单管理', 1, 'com.pepper.project.system.menu.controller.MenuController.addSave()', 'POST', 1, 'admin', '超级管理员', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"1175\"],\"menuType\":[\"F\"],\"menuName\":[\"医生编辑\"],\"url\":[\"\"],\"target\":[\"menuItem\"],\"perms\":[\"ch:doctor:edit\"],\"orderNum\":[\"3\"],\"icon\":[\"\"],\"visible\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-20 10:19:39');
INSERT INTO `sys_oper_log` VALUES (640, '菜单管理', 1, 'com.pepper.project.system.menu.controller.MenuController.addSave()', 'POST', 1, 'admin', '超级管理员', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"1175\"],\"menuType\":[\"F\"],\"menuName\":[\"医生删除\"],\"url\":[\"\"],\"target\":[\"menuItem\"],\"perms\":[\"ch:doctor:delete\"],\"orderNum\":[\"4\"],\"icon\":[\"\"],\"visible\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-20 10:20:12');
INSERT INTO `sys_oper_log` VALUES (641, '菜单管理', 1, 'com.pepper.project.system.menu.controller.MenuController.addSave()', 'POST', 1, 'admin', '超级管理员', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"1176\"],\"menuType\":[\"F\"],\"menuName\":[\"预约列表查询\"],\"url\":[\"\"],\"target\":[\"menuItem\"],\"perms\":[\"ch:appointment:list\"],\"orderNum\":[\"1\"],\"icon\":[\"\"],\"visible\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-20 10:21:01');
INSERT INTO `sys_oper_log` VALUES (642, '菜单管理', 1, 'com.pepper.project.system.menu.controller.MenuController.addSave()', 'POST', 1, 'admin', '超级管理员', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"1176\"],\"menuType\":[\"F\"],\"menuName\":[\"预约新增\"],\"url\":[\"\"],\"target\":[\"menuItem\"],\"perms\":[\"ch:appointment:add\"],\"orderNum\":[\"2\"],\"icon\":[\"\"],\"visible\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-20 10:21:33');
INSERT INTO `sys_oper_log` VALUES (643, '菜单管理', 1, 'com.pepper.project.system.menu.controller.MenuController.addSave()', 'POST', 1, 'admin', '超级管理员', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"1176\"],\"menuType\":[\"F\"],\"menuName\":[\"预约编辑\"],\"url\":[\"\"],\"target\":[\"menuItem\"],\"perms\":[\"ch:appointment:edit\"],\"orderNum\":[\"3\"],\"icon\":[\"\"],\"visible\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-20 10:21:59');
INSERT INTO `sys_oper_log` VALUES (644, '菜单管理', 1, 'com.pepper.project.system.menu.controller.MenuController.addSave()', 'POST', 1, 'admin', '超级管理员', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"1176\"],\"menuType\":[\"F\"],\"menuName\":[\"预约删除\"],\"url\":[\"\"],\"target\":[\"menuItem\"],\"perms\":[\"ch:appointment:delete\"],\"orderNum\":[\"4\"],\"icon\":[\"\"],\"visible\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-20 10:23:15');
INSERT INTO `sys_oper_log` VALUES (645, '菜单管理', 3, 'com.pepper.project.system.menu.controller.MenuController.remove()', 'GET', 1, 'admin', '超级管理员', '/system/menu/remove/1167', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"菜单已分配,不允许删除\",\"code\":301}', 0, NULL, '2020-02-20 10:57:23');
INSERT INTO `sys_oper_log` VALUES (646, '角色管理', 2, 'com.pepper.project.system.role.controller.RoleController.editSave()', 'POST', 1, 'admin', '超级管理员', '/system/role/edit', '127.0.0.1', '内网IP', '{\"roleId\":[\"103\"],\"roleName\":[\"医院总管理员\"],\"roleKey\":[\"hospitalBigAdmin\"],\"roleSort\":[\"6\"],\"status\":[\"0\"],\"remark\":[\"医院总管理员\"],\"menuIds\":[\"\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-20 10:58:44');
INSERT INTO `sys_oper_log` VALUES (647, '菜单管理', 3, 'com.pepper.project.system.menu.controller.MenuController.remove()', 'GET', 1, 'admin', '超级管理员', '/system/menu/remove/1167', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-20 10:58:50');
INSERT INTO `sys_oper_log` VALUES (648, '菜单管理', 3, 'com.pepper.project.system.menu.controller.MenuController.remove()', 'GET', 1, 'admin', '超级管理员', '/system/menu/remove/1085', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"菜单已分配,不允许删除\",\"code\":301}', 0, NULL, '2020-02-20 10:59:02');
INSERT INTO `sys_oper_log` VALUES (649, '角色管理', 2, 'com.pepper.project.system.role.controller.RoleController.editSave()', 'POST', 1, 'admin', '超级管理员', '/system/role/edit', '127.0.0.1', '内网IP', '{\"roleId\":[\"106\"],\"roleName\":[\"医院管理员\"],\"roleKey\":[\"hospitalAdmin\"],\"roleSort\":[\"9\"],\"status\":[\"0\"],\"remark\":[\"医院管理员\"],\"menuIds\":[\"\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-20 10:59:24');
INSERT INTO `sys_oper_log` VALUES (650, '菜单管理', 3, 'com.pepper.project.system.menu.controller.MenuController.remove()', 'GET', 1, 'admin', '超级管理员', '/system/menu/remove/1085', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-20 10:59:32');
INSERT INTO `sys_oper_log` VALUES (651, '菜单管理', 3, 'com.pepper.project.system.menu.controller.MenuController.remove()', 'GET', 1, 'admin', '超级管理员', '/system/menu/remove/1086', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-20 10:59:41');
INSERT INTO `sys_oper_log` VALUES (652, '菜单管理', 3, 'com.pepper.project.system.menu.controller.MenuController.remove()', 'GET', 1, 'admin', '超级管理员', '/system/menu/remove/1087', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-20 10:59:46');
INSERT INTO `sys_oper_log` VALUES (653, '菜单管理', 3, 'com.pepper.project.system.menu.controller.MenuController.remove()', 'GET', 1, 'admin', '超级管理员', '/system/menu/remove/1080', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-20 10:59:51');
INSERT INTO `sys_oper_log` VALUES (654, '菜单管理', 3, 'com.pepper.project.system.menu.controller.MenuController.remove()', 'GET', 1, 'admin', '超级管理员', '/system/menu/remove/1081', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-20 10:59:56');
INSERT INTO `sys_oper_log` VALUES (655, '菜单管理', 3, 'com.pepper.project.system.menu.controller.MenuController.remove()', 'GET', 1, 'admin', '超级管理员', '/system/menu/remove/1168', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-20 11:00:02');
INSERT INTO `sys_oper_log` VALUES (656, '菜单管理', 3, 'com.pepper.project.system.menu.controller.MenuController.remove()', 'GET', 1, 'admin', '超级管理员', '/system/menu/remove/1169', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-20 11:00:07');
INSERT INTO `sys_oper_log` VALUES (657, '菜单管理', 3, 'com.pepper.project.system.menu.controller.MenuController.remove()', 'GET', 1, 'admin', '超级管理员', '/system/menu/remove/1170', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-20 11:00:11');
INSERT INTO `sys_oper_log` VALUES (658, '菜单管理', 3, 'com.pepper.project.system.menu.controller.MenuController.remove()', 'GET', 1, 'admin', '超级管理员', '/system/menu/remove/1166', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-20 11:00:16');
INSERT INTO `sys_oper_log` VALUES (659, '菜单管理', 3, 'com.pepper.project.system.menu.controller.MenuController.remove()', 'GET', 1, 'admin', '超级管理员', '/system/menu/remove/1082', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-20 11:00:21');
INSERT INTO `sys_oper_log` VALUES (660, '菜单管理', 3, 'com.pepper.project.system.menu.controller.MenuController.remove()', 'GET', 1, 'admin', '超级管理员', '/system/menu/remove/1083', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-20 11:00:25');
INSERT INTO `sys_oper_log` VALUES (661, '菜单管理', 3, 'com.pepper.project.system.menu.controller.MenuController.remove()', 'GET', 1, 'admin', '超级管理员', '/system/menu/remove/1088', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-20 11:00:30');
INSERT INTO `sys_oper_log` VALUES (662, '菜单管理', 3, 'com.pepper.project.system.menu.controller.MenuController.remove()', 'GET', 1, 'admin', '超级管理员', '/system/menu/remove/1090', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-20 11:00:35');
INSERT INTO `sys_oper_log` VALUES (663, '菜单管理', 3, 'com.pepper.project.system.menu.controller.MenuController.remove()', 'GET', 1, 'admin', '超级管理员', '/system/menu/remove/1091', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-20 11:00:40');
INSERT INTO `sys_oper_log` VALUES (664, '菜单管理', 3, 'com.pepper.project.system.menu.controller.MenuController.remove()', 'GET', 1, 'admin', '超级管理员', '/system/menu/remove/1092', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-20 11:00:44');
INSERT INTO `sys_oper_log` VALUES (665, '菜单管理', 3, 'com.pepper.project.system.menu.controller.MenuController.remove()', 'GET', 1, 'admin', '超级管理员', '/system/menu/remove/1093', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-20 11:00:48');
INSERT INTO `sys_oper_log` VALUES (666, '菜单管理', 3, 'com.pepper.project.system.menu.controller.MenuController.remove()', 'GET', 1, 'admin', '超级管理员', '/system/menu/remove/1067', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-20 11:00:54');
INSERT INTO `sys_oper_log` VALUES (667, '菜单管理', 3, 'com.pepper.project.system.menu.controller.MenuController.remove()', 'GET', 1, 'admin', '超级管理员', '/system/menu/remove/1068', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-20 11:00:59');
INSERT INTO `sys_oper_log` VALUES (668, '菜单管理', 3, 'com.pepper.project.system.menu.controller.MenuController.remove()', 'GET', 1, 'admin', '超级管理员', '/system/menu/remove/1069', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-20 11:01:04');
INSERT INTO `sys_oper_log` VALUES (669, '菜单管理', 3, 'com.pepper.project.system.menu.controller.MenuController.remove()', 'GET', 1, 'admin', '超级管理员', '/system/menu/remove/1070', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-20 11:01:09');
INSERT INTO `sys_oper_log` VALUES (670, '菜单管理', 3, 'com.pepper.project.system.menu.controller.MenuController.remove()', 'GET', 1, 'admin', '超级管理员', '/system/menu/remove/1078', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-20 11:01:25');
INSERT INTO `sys_oper_log` VALUES (671, '菜单管理', 3, 'com.pepper.project.system.menu.controller.MenuController.remove()', 'GET', 1, 'admin', '超级管理员', '/system/menu/remove/1084', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-20 11:01:29');
INSERT INTO `sys_oper_log` VALUES (672, '菜单管理', 3, 'com.pepper.project.system.menu.controller.MenuController.remove()', 'GET', 1, 'admin', '超级管理员', '/system/menu/remove/1089', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-20 11:01:33');
INSERT INTO `sys_oper_log` VALUES (673, '菜单管理', 1, 'com.pepper.project.system.menu.controller.MenuController.addSave()', 'POST', 1, 'admin', '超级管理员', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"1066\"],\"menuType\":[\"F\"],\"menuName\":[\"区域列表查询\"],\"url\":[\"\"],\"target\":[\"menuItem\"],\"perms\":[\"csc:area:list\"],\"orderNum\":[\"1\"],\"icon\":[\"\"],\"visible\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-20 11:02:01');
INSERT INTO `sys_oper_log` VALUES (674, '菜单管理', 1, 'com.pepper.project.system.menu.controller.MenuController.addSave()', 'POST', 1, 'admin', '超级管理员', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"1066\"],\"menuType\":[\"F\"],\"menuName\":[\"区域新增\"],\"url\":[\"\"],\"target\":[\"menuItem\"],\"perms\":[\"csc:area:add\"],\"orderNum\":[\"2\"],\"icon\":[\"\"],\"visible\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-20 11:02:21');
INSERT INTO `sys_oper_log` VALUES (675, '菜单管理', 1, 'com.pepper.project.system.menu.controller.MenuController.addSave()', 'POST', 1, 'admin', '超级管理员', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"1066\"],\"menuType\":[\"F\"],\"menuName\":[\"区域编辑\"],\"url\":[\"\"],\"target\":[\"menuItem\"],\"perms\":[\"csc:area:edit\"],\"orderNum\":[\"3\"],\"icon\":[\"\"],\"visible\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-20 11:02:45');
INSERT INTO `sys_oper_log` VALUES (676, '菜单管理', 1, 'com.pepper.project.system.menu.controller.MenuController.addSave()', 'POST', 1, 'admin', '超级管理员', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"1066\"],\"menuType\":[\"F\"],\"menuName\":[\"区域删除\"],\"url\":[\"\"],\"target\":[\"menuItem\"],\"perms\":[\"csc:area:delete\"],\"orderNum\":[\"4\"],\"icon\":[\"\"],\"visible\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-20 11:03:02');
INSERT INTO `sys_oper_log` VALUES (677, '医院介绍', 2, 'com.pepper.project.ch.hospital.controller.HospitalController.editSave()', 'POST', 1, 'admin', '超级管理员', '/ch/hospital/edit', '127.0.0.1', '内网IP', '{\"id\":[\"6\"],\"hosName\":[\"沙依巴克区红十月社区健康医院\"],\"hosCode\":[\"sybk red month community hospital\"],\"introduction\":[\"这是一家社区医院，提供基础的医疗救助服务！\"],\"communityIds\":[\"3\",\"4\"],\"areaId\":[\"3\"],\"status\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-20 11:03:26');
INSERT INTO `sys_oper_log` VALUES (678, '医院介绍', 2, 'com.pepper.project.ch.hospital.controller.HospitalController.editSave()', 'POST', 1, 'admin', '超级管理员', '/ch/hospital/edit', '127.0.0.1', '内网IP', '{\"id\":[\"6\"],\"hosName\":[\"沙依巴克区红十月社区健康医院\"],\"hosCode\":[\"sybk red month community hospital\"],\"introduction\":[\"这是一家社区医院，提供基础的医疗救助服务！\"],\"communityIds\":[\"3\",\"4\"],\"areaId\":[\"3\"],\"status\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-20 11:03:31');
INSERT INTO `sys_oper_log` VALUES (679, '医院介绍', 2, 'com.pepper.project.ch.hospital.controller.HospitalController.editSave()', 'POST', 1, 'admin', '超级管理员', '/ch/hospital/edit', '127.0.0.1', '内网IP', '{\"id\":[\"6\"],\"hosName\":[\"沙依巴克区红十月社区健康医院\"],\"hosCode\":[\"sybk red month community hospital\"],\"introduction\":[\"这是一家社区医院，提供基础的医疗救助服务！\"],\"communityIds\":[\"4\"],\"areaId\":[\"3\"],\"status\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-20 11:03:50');
INSERT INTO `sys_oper_log` VALUES (680, '医生管理', 2, 'com.pepper.project.ch.doctor.controller.DoctorController.editSave()', 'POST', 1, 'admin', '超级管理员', '/ch/doctor/edit', '127.0.0.1', '内网IP', '{\"id\":[\"1\"],\"doctorCode\":[\"1001\"],\"doctorName\":[\"韩结涛\"],\"majorField\":[\"小儿感冒\"],\"doctorType\":[\"1\"],\"hospitalId\":[\"6\"],\"status\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-20 11:04:04');
INSERT INTO `sys_oper_log` VALUES (681, '医生管理', 2, 'com.pepper.project.ch.doctor.controller.DoctorController.editSave()', 'POST', 1, 'admin', '超级管理员', '/ch/doctor/edit', '127.0.0.1', '内网IP', '{\"id\":[\"4\"],\"doctorCode\":[\"1004\"],\"doctorName\":[\"助理医生\"],\"majorField\":[\"hi大夫,2,2,2,2,2\"],\"doctorType\":[\"2\"],\"hospitalId\":[\"6\"],\"status\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-20 11:04:10');
INSERT INTO `sys_oper_log` VALUES (682, '医院介绍', 1, 'com.pepper.project.ch.hospital.controller.HospitalController.addSave()', 'POST', 1, 'admin', '超级管理员', '/ch/hospital/add', '127.0.0.1', '内网IP', '{\"hosName\":[\"米东区\"],\"hosCode\":[\"110002\"],\"introduction\":[\"<p>米东区社区医院&nbsp; 为您服务</p>\"],\"communityIds\":[\"3\"],\"areaId\":[\"3\"],\"status\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-20 11:10:31');
INSERT INTO `sys_oper_log` VALUES (683, '区域设置', 1, 'com.pepper.project.csc.area.controller.AreaController.addSave()', 'POST', 1, 'admin', '超级管理员', '/csc/area/add', '127.0.0.1', '内网IP', '{\"areaCode\":[\"md\"],\"areaName\":[\"米东区\"],\"coordinate\":[\"10,90877,89.09987\"],\"status\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-20 11:11:12');
INSERT INTO `sys_oper_log` VALUES (684, '医院介绍', 2, 'com.pepper.project.ch.hospital.controller.HospitalController.editSave()', 'POST', 1, 'admin', '超级管理员', '/ch/hospital/edit', '127.0.0.1', '内网IP', '{\"id\":[\"8\"],\"hosName\":[\"米东区 万福街道社区医院\"],\"hosCode\":[\"110002\"],\"introduction\":[\"<p>米东区社区医院&nbsp; 为您服务</p>\"],\"communityIds\":[\"5\"],\"areaId\":[\"5\"],\"status\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-20 11:11:56');
INSERT INTO `sys_oper_log` VALUES (685, '医院介绍', 1, 'com.pepper.project.ch.appointment.controller.AppointmentController.addSave()', 'POST', 1, 'admin', '超级管理员', '/ch/appointment/add', '127.0.0.1', '内网IP', '{\"userId\":[\"10000001\"],\"hospitalId\":[\"6\"],\"medicalProjectId\":[\"1\"],\"appointmentTimeStr\":[\"2020-02-20 00:00:00\"],\"appointmentName\":[\"hanjietao\"],\"appointmentPhone\":[\"18978786765\"],\"status\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-20 11:43:24');
INSERT INTO `sys_oper_log` VALUES (686, '医院介绍', 3, 'com.pepper.project.ch.appointment.controller.AppointmentController.remove()', 'POST', 1, 'admin', '超级管理员', '/ch/appointment/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-20 11:43:44');
INSERT INTO `sys_oper_log` VALUES (687, '医院介绍', 1, 'com.pepper.project.ch.appointment.controller.AppointmentController.addSave()', 'POST', 1, 'admin', '超级管理员', '/ch/appointment/add', '127.0.0.1', '内网IP', '{\"userId\":[\"10000001\"],\"hospitalId\":[\"2\"],\"medicalProjectId\":[\"1\"],\"appointmentTimeStr\":[\"2020-02-20 11:43:52\"],\"appointmentName\":[\"hant\"],\"appointmentPhone\":[\"18978786674\"],\"status\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-20 11:44:02');
INSERT INTO `sys_oper_log` VALUES (688, '医院介绍', 3, 'com.pepper.project.ch.appointment.controller.AppointmentController.remove()', 'POST', 1, 'admin', '超级管理员', '/ch/appointment/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"2\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-20 11:44:22');
INSERT INTO `sys_oper_log` VALUES (689, '医院介绍', 1, 'com.pepper.project.ch.appointment.controller.AppointmentController.addSave()', 'POST', 1, 'admin', '超级管理员', '/ch/appointment/add', '127.0.0.1', '内网IP', '{\"userId\":[\"10000001\"],\"hospitalId\":[\"2\"],\"medicalProjectId\":[\"2\"],\"appointmentTimeStr\":[\"2020-02-20 11:44:35\"],\"appointmentName\":[\"hant\"],\"appointmentPhone\":[\"18978790987\"],\"status\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-20 11:44:37');
INSERT INTO `sys_oper_log` VALUES (690, '部门管理', 3, 'com.pepper.project.system.dept.controller.DeptController.remove()', 'GET', 1, 'admin', '超级管理员', '/system/dept/remove/102', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"存在下级部门,不允许删除\",\"code\":301}', 0, NULL, '2020-02-20 13:17:12');
INSERT INTO `sys_oper_log` VALUES (691, '部门管理', 3, 'com.pepper.project.system.dept.controller.DeptController.remove()', 'GET', 1, 'admin', '超级管理员', '/system/dept/remove/108', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-20 13:17:15');
INSERT INTO `sys_oper_log` VALUES (692, '部门管理', 3, 'com.pepper.project.system.dept.controller.DeptController.remove()', 'GET', 1, 'admin', '超级管理员', '/system/dept/remove/109', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-20 13:17:16');
INSERT INTO `sys_oper_log` VALUES (693, '部门管理', 3, 'com.pepper.project.system.dept.controller.DeptController.remove()', 'GET', 1, 'admin', '超级管理员', '/system/dept/remove/102', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-20 13:17:19');
INSERT INTO `sys_oper_log` VALUES (694, '轮播图', 2, 'com.pepper.project.fp.loop.controller.LoopImageController.editUpload()', 'POST', 1, 'admin', '超级管理员', '/fp/loopImage/edit/upload', '127.0.0.1', '内网IP', '{\"fileId\":[\"110480_2a45127be634c2dd33f26fb21e436471.png\"],\"initialPreview\":[\"[]\"],\"initialPreviewConfig\":[\"[]\"],\"initialPreviewThumbTags\":[\"[]\"],\"uploadModule\":[\"loopImage\"]}', '{\"msg\":\"/profile/loopImage/2020/02/20/c9738e1ea0082a57c4c709665f02ca77.png\",\"code\":0}', 0, NULL, '2020-02-20 13:21:42');
INSERT INTO `sys_oper_log` VALUES (695, '宣教板块', 2, 'com.pepper.project.fp.loop.controller.LoopImageController.editSave()', 'POST', 1, 'admin', '超级管理员', '/fp/loopImage/edit', '127.0.0.1', '内网IP', '{\"id\":[\"2\"],\"imageUrl\":[\"/profile/loopImage/2020/02/20/c9738e1ea0082a57c4c709665f02ca77.png\"],\"title\":[\"123112321\"],\"sort\":[\"12313\"],\"status\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-20 13:21:45');
INSERT INTO `sys_oper_log` VALUES (696, '医疗项目', 2, 'com.pepper.project.ch.medical.controller.MedicalController.editSave()', 'POST', 1, 'admin', '超级管理员', '/ch/medical/edit', '127.0.0.1', '内网IP', '{\"id\":[\"2\"],\"name\":[\"健康检查\"],\"serviceContent\":[\"健康检查：检查血压/心率，面容情况\"],\"price\":[\"100.78\"],\"status\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-20 13:29:05');
INSERT INTO `sys_oper_log` VALUES (697, '医疗项目', 2, 'com.pepper.project.ch.medical.controller.MedicalController.editSave()', 'POST', 1, 'admin', '超级管理员', '/ch/medical/edit', '127.0.0.1', '内网IP', '{\"id\":[\"2\"],\"name\":[\"健康检查\"],\"serviceContent\":[\"健康检查：检查血压/心率，面容情况\"],\"price\":[\"100\"],\"status\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-20 13:29:10');
INSERT INTO `sys_oper_log` VALUES (698, '社区', 2, 'com.pepper.project.cm.community.controller.CommunityController.editSave()', 'POST', 1, 'admin', '超级管理员', '/cm/community/edit', '127.0.0.1', '内网IP', '{\"id\":[\"1\"],\"communityName\":[\"沙依巴克区花园社区\"],\"communityCode\":[\"sybk_beautiful\"],\"introduction\":[\"[object Object]\"],\"areaId\":[\"3\"],\"status\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-20 17:32:46');
INSERT INTO `sys_oper_log` VALUES (699, '社区', 2, 'com.pepper.project.cm.community.controller.CommunityController.editSave()', 'POST', 1, 'admin', '超级管理员', '/cm/community/edit', '127.0.0.1', '内网IP', '{\"id\":[\"1\"],\"communityName\":[\"沙依巴克区花园社区\"],\"communityCode\":[\"sybk_beautiful\"],\"introduction\":[\"3232131\"],\"areaId\":[\"3\"],\"status\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-20 17:33:48');
INSERT INTO `sys_oper_log` VALUES (700, '社区', 2, 'com.pepper.project.cm.community.controller.CommunityController.editSave()', 'POST', 1, 'admin', '超级管理员', '/cm/community/edit', '127.0.0.1', '内网IP', '{\"id\":[\"1\"],\"communityName\":[\"沙依巴克区花园社区\"],\"communityCode\":[\"sybk_beautiful\"],\"introduction\":[\"3232131\"],\"areaId\":[\"3\"],\"status\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-20 17:34:07');
INSERT INTO `sys_oper_log` VALUES (701, '社区', 2, 'com.pepper.project.cm.community.controller.CommunityController.editSave()', 'POST', 1, 'admin', '超级管理员', '/cm/community/edit', '127.0.0.1', '内网IP', '{\"id\":[\"1\"],\"communityName\":[\"沙依巴克区花园社区\"],\"communityCode\":[\"sybk_beautiful\"],\"introduction\":[\"3232131\"],\"areaId\":[\"3\"],\"status\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-20 17:34:10');
INSERT INTO `sys_oper_log` VALUES (702, '社区', 2, 'com.pepper.project.cm.community.controller.CommunityController.editSave()', 'POST', 1, 'admin', '超级管理员', '/cm/community/edit', '127.0.0.1', '内网IP', '{\"id\":[\"1\"],\"communityName\":[\"沙依巴克区花园社区\"],\"communityCode\":[\"sybk_beautiful\"],\"introduction\":[\"3232131\"],\"areaId\":[\"3\"],\"status\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-20 18:37:47');
INSERT INTO `sys_oper_log` VALUES (703, '个人信息', 2, 'com.pepper.project.system.user.controller.ProfileController.update()', 'POST', 1, 'admin', '超级管理员', '/system/user/profile/update', '127.0.0.1', '内网IP', '{\"id\":[\"\"],\"userName\":[\"韩结涛\"],\"phonenumber\":[\"15888888888\"],\"email\":[\"ry@163.com\"],\"sex\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-20 18:54:58');
INSERT INTO `sys_oper_log` VALUES (704, '商户信息user', 2, 'com.pepper.project.system.user.controller.ProfileController.updateMerchant()', 'POST', 1, 'admin', '超级管理员', '/system/user/profile/updateMerchant', '127.0.0.1', '内网IP', '{\"id\":[\"\"],\"userName\":[\"韩结涛\"],\"phonenumber\":[\"15888888888\"],\"email\":[\"ry@163.com\"],\"sex\":[\"0\"]}', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2020-02-20 18:55:39');
INSERT INTO `sys_oper_log` VALUES (705, '商户信息user', 2, 'com.pepper.project.system.user.controller.ProfileController.updateMerchant()', 'POST', 1, 'admin', '超级管理员', '/system/user/profile/updateMerchant', '127.0.0.1', '内网IP', '{\"merchantId\":[\"1\"],\"merchantName\":[\"沙依巴克区花园社区\"],\"merchantIntroduce\":[\"3232131\"]}', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2020-02-20 18:55:53');
INSERT INTO `sys_oper_log` VALUES (706, '商户信息user', 2, 'com.pepper.project.system.user.controller.ProfileController.updateMerchant()', 'POST', 1, 'admin', '超级管理员', '/system/user/profile/updateMerchant', '127.0.0.1', '内网IP', '{\"merchantId\":[\"1\"],\"merchantName\":[\"沙依巴克区花园社区\"],\"merchantIntroduce\":[\"3232131\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-20 18:56:38');
INSERT INTO `sys_oper_log` VALUES (707, '商户信息user', 2, 'com.pepper.project.system.user.controller.ProfileController.updateMerchant()', 'POST', 1, 'admin', '超级管理员', '/system/user/profile/updateMerchant', '127.0.0.1', '内网IP', '{\"merchantId\":[\"1\"],\"merchantName\":[\"沙依巴克区花园社区\"],\"merchantIntroduce\":[\"323213112221\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-20 18:56:52');
INSERT INTO `sys_oper_log` VALUES (708, '商户信息user', 2, 'com.pepper.project.system.user.controller.ProfileController.updateMerchant()', 'POST', 1, 'admin', '超级管理员', '/system/user/profile/updateMerchant', '127.0.0.1', '内网IP', '{\"merchantId\":[\"1\"],\"merchantName\":[\"沙依巴克区花园社区1\"],\"merchantIntroduce\":[\"323213112221\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-20 18:57:02');
INSERT INTO `sys_oper_log` VALUES (709, '商户信息user', 2, 'com.pepper.project.system.user.controller.ProfileController.updateMerchant()', 'POST', 1, 'admin', '超级管理员', '/system/user/profile/updateMerchant', '127.0.0.1', '内网IP', '{\"merchantId\":[\"1\"],\"merchantName\":[\"沙依巴克区花园社区\"],\"merchantIntroduce\":[\"323213112221\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-20 18:57:08');
INSERT INTO `sys_oper_log` VALUES (710, '个人信息', 2, 'com.pepper.project.system.user.controller.ProfileController.update()', 'POST', 1, 'admin', '超级管理员', '/system/user/profile/update', '127.0.0.1', '内网IP', '{\"id\":[\"\"],\"userName\":[\"韩结涛\"],\"phonenumber\":[\"15888888888\"],\"email\":[\"ry@163.com\"],\"sex\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-20 18:57:16');
INSERT INTO `sys_oper_log` VALUES (711, '个人信息', 2, 'com.pepper.project.system.user.controller.ProfileController.update()', 'POST', 1, 'admin', '超级管理员', '/system/user/profile/update', '127.0.0.1', '内网IP', '{\"id\":[\"\"],\"userName\":[\"韩结涛\"],\"phonenumber\":[\"15888888888\"],\"email\":[\"ry@163.com\"],\"sex\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-20 18:57:19');
INSERT INTO `sys_oper_log` VALUES (712, '商户信息user', 2, 'com.pepper.project.system.user.controller.ProfileController.updateMerchant()', 'POST', 1, 'admin', '超级管理员', '/system/user/profile/updateMerchant', '127.0.0.1', '内网IP', '{\"merchantId\":[\"1\"],\"merchantName\":[\"沙依巴克区花园社区\"],\"merchantIntroduce\":[\"这是一个社区\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-20 20:14:11');
INSERT INTO `sys_oper_log` VALUES (713, '角色管理', 2, 'com.pepper.project.system.role.controller.RoleController.editSave()', 'POST', 1, 'admin', '超级管理员', '/system/role/edit', '127.0.0.1', '内网IP', '{\"roleId\":[\"103\"],\"roleName\":[\"医院总管理员\"],\"roleKey\":[\"hospitalBigAdmin\"],\"roleSort\":[\"6\"],\"status\":[\"0\"],\"remark\":[\"医院总管理员\"],\"menuIds\":[\"1171,1174,1180,1181,1182,1183,1175,1184,1185,1186,1187,1176,1188,1189,1190,1191\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-20 20:14:58');
INSERT INTO `sys_oper_log` VALUES (714, '用户管理', 1, 'com.pepper.project.system.user.controller.UserController.addSave()', 'POST', 1, 'admin', '超级管理员', '/system/user/add', '127.0.0.1', '内网IP', '{\"deptId\":[\"104\"],\"userName\":[\"hant\"],\"deptName\":[\"社区管理员\"],\"phonenumber\":[\"13456789090\"],\"email\":[\"hjyxyr@163.com\"],\"loginName\":[\"hant\"],\"password\":[\"123456\"],\"sex\":[\"0\"],\"role\":[\"104\"],\"remark\":[\"\"],\"status\":[\"0\"],\"roleIds\":[\"104\"],\"postIds\":[\"4\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-20 20:30:00');
INSERT INTO `sys_oper_log` VALUES (715, '商户信息user', 2, 'com.pepper.project.system.user.controller.ProfileController.updateMerchant()', 'POST', 1, 'hant', '社区管理员', '/system/user/profile/updateMerchant', '127.0.0.1', '内网IP', '{\"merchantId\":[\"1\"],\"merchantName\":[\"沙依巴克区花园社区\"],\"merchantIntroduce\":[\"这是一个社区\"]}', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2020-02-20 20:32:27');
INSERT INTO `sys_oper_log` VALUES (716, '商户信息user', 2, 'com.pepper.project.system.user.controller.ProfileController.updateMerchant()', 'POST', 1, 'hant', '社区管理员', '/system/user/profile/updateMerchant', '127.0.0.1', '内网IP', '{\"merchantId\":[\"1\"],\"merchantName\":[\"沙依巴克区花园社区\"],\"merchantIntroduce\":[\"这是一个社区\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-20 20:33:46');
INSERT INTO `sys_oper_log` VALUES (717, '商户信息user', 2, 'com.pepper.project.system.user.controller.ProfileController.updateMerchant()', 'POST', 1, 'hant', '社区管理员', '/system/user/profile/updateMerchant', '127.0.0.1', '内网IP', '{\"merchantId\":[\"1\"],\"merchantName\":[\"沙依巴克区花园社区\"],\"merchantIntroduce\":[\"这是一个社区1222212\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-20 20:33:53');
INSERT INTO `sys_oper_log` VALUES (718, '商户信息user', 2, 'com.pepper.project.system.user.controller.ProfileController.updateMerchant()', 'POST', 1, 'hant', '社区管理员', '/system/user/profile/updateMerchant', '127.0.0.1', '内网IP', '{\"merchantId\":[\"1\"],\"merchantName\":[\"沙依巴克区花园社区\"],\"merchantIntroduce\":[\"这是一个社区1222212ddddd\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-20 20:37:54');
INSERT INTO `sys_oper_log` VALUES (719, '商户信息user', 2, 'com.pepper.project.system.user.controller.ProfileController.updateMerchant()', 'POST', 1, 'hant', '社区管理员', '/system/user/profile/updateMerchant', '127.0.0.1', '内网IP', '{\"merchantId\":[\"\"],\"merchantName\":[\"沙依巴克区花园社区1\"],\"merchantIntroduce\":[\"sfsfsdfsd\"]}', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2020-02-20 20:41:02');
INSERT INTO `sys_oper_log` VALUES (720, '商户信息user', 2, 'com.pepper.project.system.user.controller.ProfileController.updateMerchant()', 'POST', 1, 'hant', '社区管理员', '/system/user/profile/updateMerchant', '127.0.0.1', '内网IP', '{\"merchantId\":[\"1\"],\"merchantName\":[\"沙依巴克区花园社区\"],\"merchantIntroduce\":[\"这是一个社区1222212ddddd\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-20 20:46:41');
INSERT INTO `sys_oper_log` VALUES (721, '商户信息user', 2, 'com.pepper.project.system.user.controller.ProfileController.updateMerchant()', 'POST', 1, 'hant', '社区管理员', '/system/user/profile/updateMerchant', '127.0.0.1', '内网IP', '{\"merchantId\":[\"1\"],\"merchantName\":[\"沙依巴克区花园社区\"],\"merchantIntroduce\":[\"这是一个社区1222212ddddd2332\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-20 20:47:25');
INSERT INTO `sys_oper_log` VALUES (722, '商户信息user', 2, 'com.pepper.project.system.user.controller.ProfileController.updateMerchant()', 'POST', 1, 'hant', '社区管理员', '/system/user/profile/updateMerchant', '127.0.0.1', '内网IP', '{\"merchantId\":[\"1\"],\"merchantName\":[\"沙依巴克区花园社区\"],\"merchantIntroduce\":[\"这是一个社区1222212ddddddsfdsfd\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-20 20:47:34');
INSERT INTO `sys_oper_log` VALUES (723, '商户信息user', 2, 'com.pepper.project.system.user.controller.ProfileController.updateMerchant()', 'POST', 1, 'hant', '社区管理员', '/system/user/profile/updateMerchant', '127.0.0.1', '内网IP', '{\"merchantId\":[\"1\"],\"merchantName\":[\"沙依巴克区花园社区\"],\"merchantIntroduce\":[\"\"]}', '{\"msg\":\"介绍和名称不能设置为空！\",\"code\":500}', 0, NULL, '2020-02-20 20:49:45');
INSERT INTO `sys_oper_log` VALUES (724, '商户信息user', 2, 'com.pepper.project.system.user.controller.ProfileController.updateMerchant()', 'POST', 1, 'hant', '社区管理员', '/system/user/profile/updateMerchant', '127.0.0.1', '内网IP', '{\"merchantId\":[\"1\"],\"merchantName\":[\"沙依巴克区花园社区\"],\"merchantIntroduce\":[\"fsfdfsfdfdssdf\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-20 20:49:50');
INSERT INTO `sys_oper_log` VALUES (725, '商户信息user', 2, 'com.pepper.project.system.user.controller.ProfileController.updateMerchant()', 'POST', 1, 'hant', '社区管理员', '/system/user/profile/updateMerchant', '127.0.0.1', '内网IP', '{\"merchantId\":[\"1\"],\"merchantName\":[\"沙依巴克区花园社区\"],\"merchantIntroduce\":[\"fsfdfsfdfdssdf13213123\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-20 20:57:44');
INSERT INTO `sys_oper_log` VALUES (726, '菜单管理', 2, 'com.pepper.project.system.menu.controller.MenuController.editSave()', 'POST', 1, 'admin', '超级管理员', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"1100\"],\"parentId\":[\"1094\"],\"menuType\":[\"C\"],\"menuName\":[\"社区活动\"],\"url\":[\"/cm/activity\"],\"target\":[\"menuItem\"],\"perms\":[\"cm:activity:view\"],\"orderNum\":[\"2\"],\"icon\":[\"fa fa-user-plus\"],\"visible\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-20 21:03:06');
INSERT INTO `sys_oper_log` VALUES (727, '菜单管理', 2, 'com.pepper.project.system.menu.controller.MenuController.editSave()', 'POST', 1, 'admin', '超级管理员', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"1112\"],\"parentId\":[\"1094\"],\"menuType\":[\"C\"],\"menuName\":[\"留言查看\"],\"url\":[\"/cm/note\"],\"target\":[\"menuItem\"],\"perms\":[\"cm:note:view\"],\"orderNum\":[\"4\"],\"icon\":[\"fa fa-leaf\"],\"visible\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-20 21:06:39');
INSERT INTO `sys_oper_log` VALUES (728, '社区留言', 1, 'com.pepper.project.cm.note.controller.NoteController.addSave()', 'POST', 1, 'admin', '超级管理员', '/cm/note/add', '127.0.0.1', '内网IP', '{\"userId\":[\"1234444\"],\"content\":[\"hahahahahahah\"],\"communityId\":[\"2\"],\"status\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-20 21:15:26');
INSERT INTO `sys_oper_log` VALUES (729, '社区留言', 2, 'com.pepper.project.cm.note.controller.NoteController.editSave()', 'POST', 1, 'admin', '超级管理员', '/cm/note/edit', '127.0.0.1', '内网IP', '{\"id\":[\"3\"],\"userId\":[\"10000001\"],\"content\":[\"hahahahahahah\"],\"communityId\":[\"2\"],\"status\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-20 21:15:38');
INSERT INTO `sys_oper_log` VALUES (730, '社区留言', 2, 'com.pepper.project.cm.note.controller.NoteController.editSave()', 'POST', 1, 'admin', '超级管理员', '/cm/note/edit', '127.0.0.1', '内网IP', '{\"id\":[\"3\"],\"userId\":[\"10000001\"],\"content\":[\"hahahahahahah\"],\"communityId\":[\"2\"],\"status\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-20 21:15:43');
INSERT INTO `sys_oper_log` VALUES (731, '角色管理', 2, 'com.pepper.project.system.role.controller.RoleController.editSave()', 'POST', 1, 'admin', '超级管理员', '/system/role/edit', '127.0.0.1', '内网IP', '{\"roleId\":[\"104\"],\"roleName\":[\"社区管理员\"],\"roleKey\":[\"communityAdmin\"],\"roleSort\":[\"7\"],\"status\":[\"0\"],\"remark\":[\"社区管理员\"],\"menuIds\":[\"1094,1095,1096,1097,1098,1099,1100,1101,1102,1103,1104,1107,1108,1109,1110,1111,1112,1113,1114\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-20 23:31:57');
INSERT INTO `sys_oper_log` VALUES (732, '商户信息user', 2, 'com.pepper.project.system.user.controller.ProfileController.updateMerchant()', 'POST', 1, 'hant', '社区管理员', '/system/user/profile/updateMerchant', '127.0.0.1', '内网IP', '{\"merchantId\":[\"1\"],\"merchantName\":[\"沙依巴克区花园社区\"],\"merchantIntroduce\":[\"fsfdfsfdfdssdf13213123sfdafdsfafd\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-20 23:37:03');
INSERT INTO `sys_oper_log` VALUES (733, '角色管理', 2, 'com.pepper.project.system.role.controller.RoleController.editSave()', 'POST', 1, 'admin', '超级管理员', '/system/role/edit', '127.0.0.1', '内网IP', '{\"roleId\":[\"104\"],\"roleName\":[\"社区管理员\"],\"roleKey\":[\"communityAdmin\"],\"roleSort\":[\"7\"],\"status\":[\"0\"],\"remark\":[\"社区管理员\"],\"menuIds\":[\"1094,1095,1096,1098,1099,1100,1101,1102,1103,1104,1107,1108,1109,1110,1111,1112,1113,1114\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-20 23:46:59');
INSERT INTO `sys_oper_log` VALUES (734, '社区', 2, 'com.pepper.project.cm.community.controller.CommunityController.editSave()', 'POST', 1, 'hant', '社区管理员', '/cm/community/edit', '127.0.0.1', '内网IP', '{\"id\":[\"1\"],\"communityName\":[\"沙依巴克区花园社区\"],\"communityCode\":[\"sybk_beautiful\"],\"introduction\":[\"fsfdfsfdfdssdf13213123sfdafdsfafd\"],\"areaId\":[\"3\"],\"status\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-20 23:48:36');
INSERT INTO `sys_oper_log` VALUES (735, '社区', 2, 'com.pepper.project.cm.community.controller.CommunityController.editSave()', 'POST', 1, 'admin', '超级管理员', '/cm/community/edit', '127.0.0.1', '内网IP', '{\"id\":[\"2\"],\"communityName\":[\"幸福社区【沙依巴克区】\"],\"communityCode\":[\"1001001\"],\"introduction\":[\"幸福社区\"],\"areaId\":[\"4\"],\"status\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-20 23:52:37');
INSERT INTO `sys_oper_log` VALUES (736, '菜单管理', 2, 'com.pepper.project.system.menu.controller.MenuController.editSave()', 'POST', 1, 'admin', '超级管理员', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"1099\"],\"parentId\":[\"1095\"],\"menuType\":[\"F\"],\"menuName\":[\"社区删除\"],\"url\":[\"#\"],\"target\":[\"menuItem\"],\"perms\":[\"cm:community:remove\"],\"orderNum\":[\"4\"],\"icon\":[\"#\"],\"visible\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-21 09:43:51');
INSERT INTO `sys_oper_log` VALUES (737, '菜单管理', 2, 'com.pepper.project.system.menu.controller.MenuController.editSave()', 'POST', 1, 'admin', '超级管理员', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"1104\"],\"parentId\":[\"1100\"],\"menuType\":[\"F\"],\"menuName\":[\"活动删除\"],\"url\":[\"#\"],\"target\":[\"menuItem\"],\"perms\":[\"cm:activity:remove\"],\"orderNum\":[\"4\"],\"icon\":[\"#\"],\"visible\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-21 09:44:12');
INSERT INTO `sys_oper_log` VALUES (738, '菜单管理', 2, 'com.pepper.project.system.menu.controller.MenuController.editSave()', 'POST', 1, 'admin', '超级管理员', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"1111\"],\"parentId\":[\"1107\"],\"menuType\":[\"F\"],\"menuName\":[\"办事指南删除\"],\"url\":[\"#\"],\"target\":[\"menuItem\"],\"perms\":[\"cm:guide:remove\"],\"orderNum\":[\"4\"],\"icon\":[\"#\"],\"visible\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-21 09:44:21');
INSERT INTO `sys_oper_log` VALUES (739, '菜单管理', 2, 'com.pepper.project.system.menu.controller.MenuController.editSave()', 'POST', 1, 'admin', '超级管理员', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"1114\"],\"parentId\":[\"1112\"],\"menuType\":[\"F\"],\"menuName\":[\"留言删除\"],\"url\":[\"#\"],\"target\":[\"menuItem\"],\"perms\":[\"cm:note:remove\"],\"orderNum\":[\"2\"],\"icon\":[\"#\"],\"visible\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-21 09:44:30');
INSERT INTO `sys_oper_log` VALUES (740, '菜单管理', 2, 'com.pepper.project.system.menu.controller.MenuController.editSave()', 'POST', 1, 'admin', '超级管理员', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"1179\"],\"parentId\":[\"1172\"],\"menuType\":[\"F\"],\"menuName\":[\"医院删除\"],\"url\":[\"#\"],\"target\":[\"menuItem\"],\"perms\":[\"ch:hospital:remove\"],\"orderNum\":[\"4\"],\"icon\":[\"#\"],\"visible\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-21 09:44:50');
INSERT INTO `sys_oper_log` VALUES (741, '菜单管理', 2, 'com.pepper.project.system.menu.controller.MenuController.editSave()', 'POST', 1, 'admin', '超级管理员', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"1191\"],\"parentId\":[\"1176\"],\"menuType\":[\"F\"],\"menuName\":[\"预约删除\"],\"url\":[\"#\"],\"target\":[\"menuItem\"],\"perms\":[\"ch:appointment:remove\"],\"orderNum\":[\"4\"],\"icon\":[\"#\"],\"visible\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-21 09:45:08');
INSERT INTO `sys_oper_log` VALUES (742, '菜单管理', 2, 'com.pepper.project.system.menu.controller.MenuController.editSave()', 'POST', 1, 'admin', '超级管理员', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"1187\"],\"parentId\":[\"1175\"],\"menuType\":[\"F\"],\"menuName\":[\"医生删除\"],\"url\":[\"#\"],\"target\":[\"menuItem\"],\"perms\":[\"ch:doctor:remove\"],\"orderNum\":[\"4\"],\"icon\":[\"#\"],\"visible\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-21 09:45:22');
INSERT INTO `sys_oper_log` VALUES (743, '菜单管理', 2, 'com.pepper.project.system.menu.controller.MenuController.editSave()', 'POST', 1, 'admin', '超级管理员', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"1120\"],\"parentId\":[\"1116\"],\"menuType\":[\"F\"],\"menuName\":[\"物业删除\"],\"url\":[\"#\"],\"target\":[\"menuItem\"],\"perms\":[\"pm:property:remove\"],\"orderNum\":[\"4\"],\"icon\":[\"#\"],\"visible\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-21 09:45:33');
INSERT INTO `sys_oper_log` VALUES (744, '菜单管理', 2, 'com.pepper.project.system.menu.controller.MenuController.editSave()', 'POST', 1, 'admin', '超级管理员', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"1127\"],\"parentId\":[\"1121\"],\"menuType\":[\"F\"],\"menuName\":[\"活动删除\"],\"url\":[\"#\"],\"target\":[\"menuItem\"],\"perms\":[\"pm:activity:remove\"],\"orderNum\":[\"4\"],\"icon\":[\"#\"],\"visible\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-21 09:45:43');
INSERT INTO `sys_oper_log` VALUES (745, '菜单管理', 2, 'com.pepper.project.system.menu.controller.MenuController.editSave()', 'POST', 1, 'admin', '超级管理员', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"1140\"],\"parentId\":[\"1136\"],\"menuType\":[\"F\"],\"menuName\":[\"物业通知删除\"],\"url\":[\"#\"],\"target\":[\"menuItem\"],\"perms\":[\"pm:notice:remove\"],\"orderNum\":[\"4\"],\"icon\":[\"#\"],\"visible\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-21 09:45:58');
INSERT INTO `sys_oper_log` VALUES (746, '菜单管理', 2, 'com.pepper.project.system.menu.controller.MenuController.editSave()', 'POST', 1, 'admin', '超级管理员', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"1183\"],\"parentId\":[\"1174\"],\"menuType\":[\"F\"],\"menuName\":[\"医疗项目删除\"],\"url\":[\"#\"],\"target\":[\"menuItem\"],\"perms\":[\"ch:medical:remove\"],\"orderNum\":[\"4\"],\"icon\":[\"#\"],\"visible\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-21 09:46:22');
INSERT INTO `sys_oper_log` VALUES (747, '菜单管理', 2, 'com.pepper.project.system.menu.controller.MenuController.editSave()', 'POST', 1, 'admin', '超级管理员', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"1187\"],\"parentId\":[\"1175\"],\"menuType\":[\"F\"],\"menuName\":[\"医生删除\"],\"url\":[\"#\"],\"target\":[\"menuItem\"],\"perms\":[\"ch:doctor:remove\"],\"orderNum\":[\"4\"],\"icon\":[\"#\"],\"visible\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-21 09:46:36');
INSERT INTO `sys_oper_log` VALUES (748, '菜单管理', 2, 'com.pepper.project.system.menu.controller.MenuController.editSave()', 'POST', 1, 'admin', '超级管理员', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"1135\"],\"parentId\":[\"1122\"],\"menuType\":[\"F\"],\"menuName\":[\"留言删除\"],\"url\":[\"#\"],\"target\":[\"menuItem\"],\"perms\":[\"pm:note:remove\"],\"orderNum\":[\"4\"],\"icon\":[\"#\"],\"visible\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-21 09:47:01');
INSERT INTO `sys_oper_log` VALUES (749, '菜单管理', 2, 'com.pepper.project.system.menu.controller.MenuController.editSave()', 'POST', 1, 'admin', '超级管理员', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"1131\"],\"parentId\":[\"1123\"],\"menuType\":[\"F\"],\"menuName\":[\"办事指南删除\"],\"url\":[\"#\"],\"target\":[\"menuItem\"],\"perms\":[\"pm:guide:remove\"],\"orderNum\":[\"4\"],\"icon\":[\"#\"],\"visible\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-21 09:47:29');
INSERT INTO `sys_oper_log` VALUES (750, '菜单管理', 2, 'com.pepper.project.system.menu.controller.MenuController.editSave()', 'POST', 1, 'admin', '超级管理员', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"1148\"],\"parentId\":[\"1144\"],\"menuType\":[\"F\"],\"menuName\":[\"宣教板块删除\"],\"url\":[\"#\"],\"target\":[\"menuItem\"],\"perms\":[\"he:board:remove\"],\"orderNum\":[\"4\"],\"icon\":[\"#\"],\"visible\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-21 09:47:51');
INSERT INTO `sys_oper_log` VALUES (751, '菜单管理', 2, 'com.pepper.project.system.menu.controller.MenuController.editSave()', 'POST', 1, 'admin', '超级管理员', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"1152\"],\"parentId\":[\"1142\"],\"menuType\":[\"F\"],\"menuName\":[\"宣教文章删除\"],\"url\":[\"#\"],\"target\":[\"menuItem\"],\"perms\":[\"he:article:remove\"],\"orderNum\":[\"4\"],\"icon\":[\"#\"],\"visible\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-21 09:48:06');
INSERT INTO `sys_oper_log` VALUES (752, '菜单管理', 2, 'com.pepper.project.system.menu.controller.MenuController.editSave()', 'POST', 1, 'admin', '超级管理员', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"1156\"],\"parentId\":[\"1143\"],\"menuType\":[\"F\"],\"menuName\":[\"宣教视频删除\"],\"url\":[\"#\"],\"target\":[\"menuItem\"],\"perms\":[\"he:video:remove\"],\"orderNum\":[\"4\"],\"icon\":[\"#\"],\"visible\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-21 09:48:18');
INSERT INTO `sys_oper_log` VALUES (753, '菜单管理', 2, 'com.pepper.project.system.menu.controller.MenuController.editSave()', 'POST', 1, 'admin', '超级管理员', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"1165\"],\"parentId\":[\"1161\"],\"menuType\":[\"F\"],\"menuName\":[\"轮播广告删除\"],\"url\":[\"#\"],\"target\":[\"menuItem\"],\"perms\":[\"fp:loop:remove\"],\"orderNum\":[\"4\"],\"icon\":[\"#\"],\"visible\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-21 09:48:44');
INSERT INTO `sys_oper_log` VALUES (754, '角色管理', 2, 'com.pepper.project.system.role.controller.RoleController.editSave()', 'POST', 1, 'admin', '超级管理员', '/system/role/edit', '127.0.0.1', '内网IP', '{\"roleId\":[\"104\"],\"roleName\":[\"社区管理员\"],\"roleKey\":[\"communityAdmin\"],\"roleSort\":[\"7\"],\"status\":[\"0\"],\"remark\":[\"社区管理员\"],\"menuIds\":[\"1094,1095,1096,1098,1100,1101,1102,1103,1104,1107,1108,1109,1110,1111,1112,1113,1114\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-21 09:51:48');
INSERT INTO `sys_oper_log` VALUES (755, '角色管理', 1, 'com.pepper.project.system.role.controller.RoleController.addSave()', 'POST', 1, 'admin', '超级管理员', '/system/role/add', '127.0.0.1', '内网IP', '{\"roleName\":[\"客户端登陆\"],\"roleKey\":[\"client\"],\"roleSort\":[\"10\"],\"status\":[\"0\"],\"remark\":[\"客户端登陆\"],\"menuIds\":[\"\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-21 09:54:50');
INSERT INTO `sys_oper_log` VALUES (756, '用户管理', 1, 'com.pepper.project.system.user.controller.UserController.addSave()', 'POST', 1, 'admin', '超级管理员', '/system/user/add', '127.0.0.1', '内网IP', '{\"deptId\":[\"111\"],\"userName\":[\"client\"],\"deptName\":[\"医院管理员\"],\"phonenumber\":[\"19800000000\"],\"email\":[\"hjyxyr1@163.com\"],\"loginName\":[\"client\"],\"password\":[\"123456\"],\"sex\":[\"0\"],\"role\":[\"107\"],\"remark\":[\"client\"],\"status\":[\"0\"],\"roleIds\":[\"107\"],\"postIds\":[\"4\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-21 09:55:57');
INSERT INTO `sys_oper_log` VALUES (757, '字典类型', 1, 'com.pepper.project.system.dict.controller.DictTypeController.addSave()', 'POST', 1, 'admin', '超级管理员', '/system/dict/add', '127.0.0.1', '内网IP', '{\"dictName\":[\"系统用户类型\"],\"dictType\":[\"sys_user_type\"],\"status\":[\"0\"],\"remark\":[\"不要删除，用来区分用户类别0-管理员，1-社区管理员，2-医院管理员，3-物业管理员，10001-客户端用户\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-21 10:09:20');
INSERT INTO `sys_oper_log` VALUES (758, '字典类型', 2, 'com.pepper.project.system.dict.controller.DictTypeController.editSave()', 'POST', 1, 'admin', '超级管理员', '/system/dict/edit', '127.0.0.1', '内网IP', '{\"dictId\":[\"12\"],\"dictName\":[\"系统用户类型\"],\"dictType\":[\"sys_user_type\"],\"status\":[\"0\"],\"remark\":[\"不要删除！！！用来区分用户类别0-管理员，1-社区管理员，2-医院管理员，3-物业管理员，10001-客户端用户\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-21 10:09:34');
INSERT INTO `sys_oper_log` VALUES (759, '字典数据', 1, 'com.pepper.project.system.dict.controller.DictDataController.addSave()', 'POST', 1, 'admin', '超级管理员', '/system/dict/data/add', '127.0.0.1', '内网IP', '{\"dictLabel\":[\"管理员\"],\"dictValue\":[\"0\"],\"dictType\":[\"sys_user_type\"],\"cssClass\":[\"\"],\"dictSort\":[\"1\"],\"listClass\":[\"\"],\"isDefault\":[\"Y\"],\"status\":[\"0\"],\"remark\":[\"\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-21 10:10:22');
INSERT INTO `sys_oper_log` VALUES (760, '字典数据', 1, 'com.pepper.project.system.dict.controller.DictDataController.addSave()', 'POST', 1, 'admin', '超级管理员', '/system/dict/data/add', '127.0.0.1', '内网IP', '{\"dictLabel\":[\"社区管理员\"],\"dictValue\":[\"1\"],\"dictType\":[\"sys_user_type\"],\"cssClass\":[\"\"],\"dictSort\":[\"2\"],\"listClass\":[\"\"],\"isDefault\":[\"Y\"],\"status\":[\"0\"],\"remark\":[\"社区管理员\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-21 10:10:59');
INSERT INTO `sys_oper_log` VALUES (761, '字典数据', 2, 'com.pepper.project.system.dict.controller.DictDataController.editSave()', 'POST', 1, 'admin', '超级管理员', '/system/dict/data/edit', '127.0.0.1', '内网IP', '{\"dictCode\":[\"32\"],\"dictLabel\":[\"总管理员\"],\"dictValue\":[\"0\"],\"dictType\":[\"sys_user_type\"],\"cssClass\":[\"\"],\"dictSort\":[\"1\"],\"listClass\":[\"\"],\"isDefault\":[\"Y\"],\"status\":[\"0\"],\"remark\":[\"\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-21 10:11:12');
INSERT INTO `sys_oper_log` VALUES (762, '字典数据', 1, 'com.pepper.project.system.dict.controller.DictDataController.addSave()', 'POST', 1, 'admin', '超级管理员', '/system/dict/data/add', '127.0.0.1', '内网IP', '{\"dictLabel\":[\"医院管理员\"],\"dictValue\":[\"2\"],\"dictType\":[\"sys_user_type\"],\"cssClass\":[\"\"],\"dictSort\":[\"3\"],\"listClass\":[\"\"],\"isDefault\":[\"Y\"],\"status\":[\"0\"],\"remark\":[\"医院管理员\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-21 10:11:42');
INSERT INTO `sys_oper_log` VALUES (763, '字典数据', 1, 'com.pepper.project.system.dict.controller.DictDataController.addSave()', 'POST', 1, 'admin', '超级管理员', '/system/dict/data/add', '127.0.0.1', '内网IP', '{\"dictLabel\":[\"物业管理员\"],\"dictValue\":[\"3\"],\"dictType\":[\"sys_user_type\"],\"cssClass\":[\"\"],\"dictSort\":[\"4\"],\"listClass\":[\"\"],\"isDefault\":[\"Y\"],\"status\":[\"0\"],\"remark\":[\"物业管理员\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-21 10:12:11');
INSERT INTO `sys_oper_log` VALUES (764, '字典数据', 2, 'com.pepper.project.system.dict.controller.DictDataController.editSave()', 'POST', 1, 'admin', '超级管理员', '/system/dict/data/edit', '127.0.0.1', '内网IP', '{\"dictCode\":[\"32\"],\"dictLabel\":[\"总管理员\"],\"dictValue\":[\"0\"],\"dictType\":[\"sys_user_type\"],\"cssClass\":[\"\"],\"dictSort\":[\"1\"],\"listClass\":[\"\"],\"isDefault\":[\"Y\"],\"status\":[\"0\"],\"remark\":[\"超级管理员，社区总管理员，医院总管理员，物业总管理员，都是这个类别\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-21 10:12:59');
INSERT INTO `sys_oper_log` VALUES (765, '字典数据', 1, 'com.pepper.project.system.dict.controller.DictDataController.addSave()', 'POST', 1, 'admin', '超级管理员', '/system/dict/data/add', '127.0.0.1', '内网IP', '{\"dictLabel\":[\"客户端用户\"],\"dictValue\":[\"1001\"],\"dictType\":[\"sys_user_type\"],\"cssClass\":[\"\"],\"dictSort\":[\"1001\"],\"listClass\":[\"\"],\"isDefault\":[\"Y\"],\"status\":[\"0\"],\"remark\":[\"客户端用户，准备使用这个系统参数来保存用户类型\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-21 10:13:55');
INSERT INTO `sys_oper_log` VALUES (766, '字典类型', 2, 'com.pepper.project.system.dict.controller.DictTypeController.editSave()', 'POST', 1, 'admin', '超级管理员', '/system/dict/edit', '127.0.0.1', '内网IP', '{\"dictId\":[\"12\"],\"dictName\":[\"系统用户类型\"],\"dictType\":[\"sys_user_type\"],\"status\":[\"0\"],\"remark\":[\"不要删除！！！准备使用这个系统参数来保存用户类型用来区分用户类别；0-管理员，1-社区管理员，2-医院管理员，3-物业管理员，10001-客户端用户\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-21 10:14:17');
INSERT INTO `sys_oper_log` VALUES (767, '字典类型', 2, 'com.pepper.project.system.dict.controller.DictTypeController.editSave()', 'POST', 1, 'admin', '超级管理员', '/system/dict/edit', '127.0.0.1', '内网IP', '{\"dictId\":[\"12\"],\"dictName\":[\"系统用户类型\"],\"dictType\":[\"sys_user_type\"],\"status\":[\"0\"],\"remark\":[\"!!!不要删除!!! 0-管理员，1-社区管理员，2-医院管理员，3-物业管理员，10001-客户端用户\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-21 10:14:45');
INSERT INTO `sys_oper_log` VALUES (768, '社区', 2, 'com.pepper.project.cm.community.controller.CommunityController.editSave()', 'POST', 1, 'admin', '超级管理员', '/cm/community/edit', '127.0.0.1', '内网IP', '{\"id\":[\"2\"],\"communityName\":[\"幸福社区【沙依巴克区】\"],\"communityCode\":[\"1001001D\"],\"introduction\":[\"幸福社区\"],\"areaId\":[\"4\"],\"status\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-21 11:24:27');
INSERT INTO `sys_oper_log` VALUES (769, '社区', 2, 'com.pepper.project.cm.community.controller.CommunityController.editSave()', 'POST', 1, 'admin', '超级管理员', '/cm/community/edit', '127.0.0.1', '内网IP', '{\"id\":[\"2\"],\"communityName\":[\"幸福社区【沙依巴克区】\"],\"communityCode\":[\"1001001\"],\"introduction\":[\"幸福社区\"],\"areaId\":[\"4\"],\"status\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-21 11:24:34');
INSERT INTO `sys_oper_log` VALUES (770, '角色管理', 1, 'com.pepper.project.system.role.controller.RoleController.addSave()', 'POST', 1, 'admin', '超级管理员', '/system/role/add', '127.0.0.1', '内网IP', '{\"roleName\":[\"1111\"],\"roleKey\":[\"1111\"],\"roleSort\":[\"111111\"],\"status\":[\"0\"],\"remark\":[\"1\"],\"menuIds\":[\"\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-21 13:53:19');
INSERT INTO `sys_oper_log` VALUES (771, '角色管理', 2, 'com.pepper.project.system.role.controller.RoleController.editSave()', 'POST', 1, 'admin', '超级管理员', '/system/role/edit', '127.0.0.1', '内网IP', '{\"roleId\":[\"105\"],\"roleName\":[\"医院管理员1\"],\"roleKey\":[\"hospitalAdmin1\"],\"roleSort\":[\"7\"],\"status\":[\"0\"],\"remark\":[\"物业管理员\"],\"menuIds\":[\"1171,1172,1173,1178\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-21 14:06:02');
INSERT INTO `sys_oper_log` VALUES (772, '角色管理', 2, 'com.pepper.project.system.role.controller.RoleController.editSave()', 'POST', 1, 'admin', '超级管理员', '/system/role/edit', '127.0.0.1', '内网IP', '{\"roleId\":[\"106\"],\"roleName\":[\"物业管理员\"],\"roleKey\":[\"propertyAdmin\"],\"roleSort\":[\"9\"],\"status\":[\"0\"],\"remark\":[\"医院管理员\"],\"menuIds\":[\"1115,1116,1117,1119,1121,1124,1126,1125,1127,1136,1137,1139,1138,1140,1122,1132,1133,1134,1135,1123,1128,1129,1130,1131\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-21 14:07:09');
INSERT INTO `sys_oper_log` VALUES (773, '角色管理', 2, 'com.pepper.project.system.role.controller.RoleController.editSave()', 'POST', 1, 'admin', '超级管理员', '/system/role/edit', '127.0.0.1', '内网IP', '{\"roleId\":[\"105\"],\"roleName\":[\"医院管理员\"],\"roleKey\":[\"hospitalAdmin\"],\"roleSort\":[\"8\"],\"status\":[\"0\"],\"remark\":[\"物业管理员\"],\"menuIds\":[\"1171,1172,1173,1178\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-21 14:07:17');
INSERT INTO `sys_oper_log` VALUES (774, '角色管理', 2, 'com.pepper.project.system.role.controller.RoleController.editSave()', 'POST', 1, 'admin', '超级管理员', '/system/role/edit', '127.0.0.1', '内网IP', '{\"roleId\":[\"102\"],\"roleName\":[\"医院总管理员1\"],\"roleKey\":[\"propertyBigAdmin1\"],\"roleSort\":[\"5\"],\"status\":[\"0\"],\"remark\":[\"物业总管理员\"],\"menuIds\":[\"1171,1172,1173,1177,1178,1179,1174,1180,1181,1182,1183,1175,1184,1185,1186,1187,1176,1188,1189,1190,1191\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-21 14:07:57');
INSERT INTO `sys_oper_log` VALUES (775, '角色管理', 2, 'com.pepper.project.system.role.controller.RoleController.editSave()', 'POST', 1, 'admin', '超级管理员', '/system/role/edit', '127.0.0.1', '内网IP', '{\"roleId\":[\"103\"],\"roleName\":[\"物业总管理员\"],\"roleKey\":[\"propertyBigAdmin\"],\"roleSort\":[\"6\"],\"status\":[\"0\"],\"remark\":[\"医院总管理员\"],\"menuIds\":[\"1115,1116,1117,1118,1119,1120,1121,1124,1126,1125,1127,1136,1137,1139,1138,1140,1122,1132,1133,1134,1135,1123,1128,1129,1130,1131\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-21 14:08:17');
INSERT INTO `sys_oper_log` VALUES (776, '角色管理', 2, 'com.pepper.project.system.role.controller.RoleController.editSave()', 'POST', 1, 'admin', '超级管理员', '/system/role/edit', '127.0.0.1', '内网IP', '{\"roleId\":[\"102\"],\"roleName\":[\"医院总管理员\"],\"roleKey\":[\"hospitalBigAdmin\"],\"roleSort\":[\"5\"],\"status\":[\"0\"],\"remark\":[\"物业总管理员\"],\"menuIds\":[\"1171,1172,1173,1177,1178,1179,1174,1180,1181,1182,1183,1175,1184,1185,1186,1187,1176,1188,1189,1190,1191\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-21 14:08:36');
INSERT INTO `sys_oper_log` VALUES (777, '角色管理', 3, 'com.pepper.project.system.role.controller.RoleController.remove()', 'POST', 1, 'admin', '超级管理员', '/system/role/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"108\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-21 14:18:39');
INSERT INTO `sys_oper_log` VALUES (778, '角色管理', 3, 'com.pepper.project.system.role.controller.RoleController.remove()', 'POST', 1, 'admin', '超级管理员', '/system/role/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"107\"]}', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2020-02-21 14:22:48');
INSERT INTO `sys_oper_log` VALUES (779, '角色管理', 3, 'com.pepper.project.system.role.controller.RoleController.remove()', 'POST', 1, 'admin', '超级管理员', '/system/role/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"107\"]}', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2020-02-21 14:24:04');
INSERT INTO `sys_oper_log` VALUES (780, '角色管理', 3, 'com.pepper.project.system.role.controller.RoleController.remove()', 'POST', 1, 'admin', '超级管理员', '/system/role/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"107\"]}', '{\"msg\":\"系统业务角色不允许删除！\",\"code\":500}', 0, NULL, '2020-02-21 14:25:06');
INSERT INTO `sys_oper_log` VALUES (781, '角色管理', 2, 'com.pepper.project.system.role.controller.RoleController.editSave()', 'POST', 1, 'admin', '超级管理员', '/system/role/edit', '127.0.0.1', '内网IP', '{\"roleId\":[\"107\"],\"roleName\":[\"客户端登陆\"],\"roleKey\":[\"client\"],\"roleSort\":[\"10\"],\"status\":[\"0\"],\"remark\":[\"客户端登陆，不允许删除\"],\"menuIds\":[\"\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-21 14:25:25');
INSERT INTO `sys_oper_log` VALUES (782, '角色管理', 2, 'com.pepper.project.system.role.controller.RoleController.editSave()', 'POST', 1, 'admin', '超级管理员', '/system/role/edit', '127.0.0.1', '内网IP', '{\"roleId\":[\"106\"],\"roleName\":[\"物业管理员\"],\"roleKey\":[\"propertyAdmin\"],\"roleSort\":[\"9\"],\"status\":[\"0\"],\"remark\":[\"医院管理员，不允许删除\"],\"menuIds\":[\"1115,1116,1117,1119,1121,1124,1126,1125,1127,1136,1137,1139,1138,1140,1122,1132,1133,1134,1135,1123,1128,1129,1130,1131\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-21 14:25:28');
INSERT INTO `sys_oper_log` VALUES (783, '角色管理', 2, 'com.pepper.project.system.role.controller.RoleController.editSave()', 'POST', 1, 'admin', '超级管理员', '/system/role/edit', '127.0.0.1', '内网IP', '{\"roleId\":[\"105\"],\"roleName\":[\"医院管理员\"],\"roleKey\":[\"hospitalAdmin\"],\"roleSort\":[\"8\"],\"status\":[\"0\"],\"remark\":[\"物业管理员，不允许删除\"],\"menuIds\":[\"1171,1172,1173,1178\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-21 14:25:31');
INSERT INTO `sys_oper_log` VALUES (784, '角色管理', 2, 'com.pepper.project.system.role.controller.RoleController.editSave()', 'POST', 1, 'admin', '超级管理员', '/system/role/edit', '127.0.0.1', '内网IP', '{\"roleId\":[\"104\"],\"roleName\":[\"社区管理员\"],\"roleKey\":[\"communityAdmin\"],\"roleSort\":[\"7\"],\"status\":[\"0\"],\"remark\":[\"社区管理员，不允许删除\"],\"menuIds\":[\"1094,1095,1096,1098,1100,1101,1102,1103,1104,1107,1108,1109,1110,1111,1112,1113,1114\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-21 14:25:35');
INSERT INTO `sys_oper_log` VALUES (785, '用户管理', 1, 'com.pepper.project.system.user.controller.UserController.addSave()', 'POST', 1, 'admin', '超级管理员', '/system/user/add', '127.0.0.1', '内网IP', '{\"deptId\":[\"103\"],\"userName\":[\"test1\"],\"deptName\":[\"超级管理员\"],\"phonenumber\":[\"13456789012\"],\"email\":[\"hjyxyr12@163.com\"],\"loginName\":[\"test1\"],\"password\":[\"test1\"],\"sex\":[\"0\"],\"role\":[\"104\"],\"areaId\":[\"\"],\"merchantName\":[\"\"],\"remark\":[\"\"],\"status\":[\"0\"],\"roleIds\":[\"\"],\"postIds\":[\"1\"]}', 'null', 1, '', '2020-02-21 15:29:10');
INSERT INTO `sys_oper_log` VALUES (786, '用户管理', 1, 'com.pepper.project.system.user.controller.UserController.addSave()', 'POST', 1, 'admin', '超级管理员', '/system/user/add', '127.0.0.1', '内网IP', '{\"deptId\":[\"103\"],\"userName\":[\"test1\"],\"deptName\":[\"超级管理员\"],\"phonenumber\":[\"13456789012\"],\"email\":[\"hjyxyr12@163.com\"],\"loginName\":[\"test1\"],\"password\":[\"test1\"],\"sex\":[\"0\"],\"role\":[\"104\"],\"areaId\":[\"\"],\"merchantName\":[\"\"],\"remark\":[\"\"],\"status\":[\"0\"],\"roleIds\":[\"\"],\"postIds\":[\"1\"]}', 'null', 1, '', '2020-02-21 15:29:34');
INSERT INTO `sys_oper_log` VALUES (787, '用户管理', 1, 'com.pepper.project.system.user.controller.UserController.addSave()', 'POST', 1, 'admin', '超级管理员', '/system/user/add', '127.0.0.1', '内网IP', '{\"deptId\":[\"103\"],\"userName\":[\"test1\"],\"deptName\":[\"超级管理员\"],\"phonenumber\":[\"13456789012\"],\"email\":[\"hjyxyr12@163.com\"],\"loginName\":[\"test1\"],\"password\":[\"test1\"],\"sex\":[\"0\"],\"role\":[\"104\"],\"areaId\":[\"\"],\"merchantName\":[\"\"],\"remark\":[\"\"],\"status\":[\"0\"],\"roleIds\":[\"\"],\"postIds\":[\"1\"]}', 'null', 1, '', '2020-02-21 15:30:34');
INSERT INTO `sys_oper_log` VALUES (788, '用户管理', 1, 'com.pepper.project.system.user.controller.UserController.addSave()', 'POST', 1, 'admin', '超级管理员', '/system/user/add', '127.0.0.1', '内网IP', '{\"deptId\":[\"103\"],\"userName\":[\"test1\"],\"deptName\":[\"超级管理员\"],\"phonenumber\":[\"13456789012\"],\"email\":[\"hjyxyr12@163.com\"],\"loginName\":[\"test1\"],\"password\":[\"test1\"],\"sex\":[\"0\"],\"role\":[\"104\"],\"areaId\":[\"\"],\"merchantName\":[\"\"],\"remark\":[\"\"],\"status\":[\"0\"],\"roleIds\":[\"\"],\"postIds\":[\"1\"]}', 'null', 1, '', '2020-02-21 15:32:17');
INSERT INTO `sys_oper_log` VALUES (789, '用户管理', 1, 'com.pepper.project.system.user.controller.UserController.addSave()', 'POST', 1, 'admin', '超级管理员', '/system/user/add', '127.0.0.1', '内网IP', '{\"deptId\":[\"103\"],\"userName\":[\"test1\"],\"deptName\":[\"超级管理员\"],\"phonenumber\":[\"13456789012\"],\"email\":[\"hjyxyr12@163.com\"],\"loginName\":[\"test1\"],\"password\":[\"test1\"],\"sex\":[\"0\"],\"role\":[\"104\"],\"areaId\":[\"\"],\"merchantName\":[\"\"],\"remark\":[\"\"],\"status\":[\"0\"],\"roleIds\":[\"\"],\"postIds\":[\"1\"]}', 'null', 1, '', '2020-02-21 15:32:26');
INSERT INTO `sys_oper_log` VALUES (790, '用户管理', 1, 'com.pepper.project.system.user.controller.UserController.addSave()', 'POST', 1, 'admin', '超级管理员', '/system/user/add', '127.0.0.1', '内网IP', '{\"deptId\":[\"103\"],\"userName\":[\"test1\"],\"deptName\":[\"超级管理员\"],\"phonenumber\":[\"13456789012\"],\"email\":[\"hjyxyr12@163.com\"],\"loginName\":[\"test1\"],\"password\":[\"test1\"],\"sex\":[\"0\"],\"role\":[\"104\"],\"areaId\":[\"\"],\"merchantName\":[\"\"],\"remark\":[\"\"],\"status\":[\"0\"],\"roleIds\":[\"\"],\"postIds\":[\"1\"]}', 'null', 1, '', '2020-02-21 15:35:11');
INSERT INTO `sys_oper_log` VALUES (791, '用户管理', 1, 'com.pepper.project.system.user.controller.UserController.addSave()', 'POST', 1, 'admin', '超级管理员', '/system/user/add', '127.0.0.1', '内网IP', '{\"deptId\":[\"103\"],\"userName\":[\"test1\"],\"deptName\":[\"超级管理员\"],\"phonenumber\":[\"13456789012\"],\"email\":[\"hjyxyr12@163.com\"],\"loginName\":[\"test1\"],\"password\":[\"test1\"],\"sex\":[\"0\"],\"role\":[\"104\"],\"areaId\":[\"\"],\"merchantName\":[\"\"],\"remark\":[\"\"],\"status\":[\"0\"],\"roleIds\":[\"\"],\"postIds\":[\"1\"]}', 'null', 1, '', '2020-02-21 15:36:19');
INSERT INTO `sys_oper_log` VALUES (792, '用户管理', 1, 'com.pepper.project.system.user.controller.UserController.addSave()', 'POST', 1, 'admin', '超级管理员', '/system/user/add', '127.0.0.1', '内网IP', '{\"deptId\":[\"103\"],\"userName\":[\"test1\"],\"deptName\":[\"超级管理员\"],\"phonenumber\":[\"13456789091\"],\"email\":[\"hjyxyr12@163.com\"],\"loginName\":[\"test1\"],\"password\":[\"test1\"],\"sex\":[\"0\"],\"role\":[\"104\"],\"areaId\":[\"\"],\"merchantName\":[\"\"],\"remark\":[\"\"],\"status\":[\"0\"],\"roleIds\":[\"\"],\"postIds\":[\"2\"]}', 'null', 1, '', '2020-02-21 15:37:40');
INSERT INTO `sys_oper_log` VALUES (793, '用户管理', 1, 'com.pepper.project.system.user.controller.UserController.addSave()', 'POST', 1, 'admin', '超级管理员', '/system/user/add', '127.0.0.1', '内网IP', '{\"deptId\":[\"103\"],\"userName\":[\"test1\"],\"deptName\":[\"超级管理员\"],\"phonenumber\":[\"13456789013\"],\"email\":[\"hjyxy12r@163.com\"],\"loginName\":[\"test1\"],\"password\":[\"123456\"],\"sex\":[\"0\"],\"role\":[\"103\"],\"areaId\":[\"\"],\"merchantName\":[\"\"],\"remark\":[\"\"],\"status\":[\"0\"],\"roleIds\":[\"\"],\"postIds\":[\"1\"]}', 'null', 1, '', '2020-02-21 15:46:01');
INSERT INTO `sys_oper_log` VALUES (794, '用户管理', 1, 'com.pepper.project.system.user.controller.UserController.addSave()', 'POST', 1, 'admin', '超级管理员', '/system/user/add', '127.0.0.1', '内网IP', '{\"deptId\":[\"103\"],\"userName\":[\"test1\"],\"deptName\":[\"超级管理员\"],\"phonenumber\":[\"13456789012\"],\"email\":[\"hjyxy2r@163.com\"],\"loginName\":[\"test1\"],\"password\":[\"test1\"],\"sex\":[\"0\"],\"roleId\":[\"104\"],\"areaId\":[\"\"],\"merchantName\":[\"\"],\"remark\":[\"\"],\"status\":[\"0\"],\"postIds\":[\"1\"]}', '{\"msg\":\"选择社区管理员/医院管理员/物业管理员 角色，需要选择【所属区域】,填写业务系统名称，用于初始化对应业务系统\",\"code\":500}', 0, NULL, '2020-02-21 15:47:28');
INSERT INTO `sys_oper_log` VALUES (795, '用户管理', 1, 'com.pepper.project.system.user.controller.UserController.addSave()', 'POST', 1, 'admin', '超级管理员', '/system/user/add', '127.0.0.1', '内网IP', '{\"deptId\":[\"103\"],\"userName\":[\"test1\"],\"deptName\":[\"超级管理员\"],\"phonenumber\":[\"13456789012\"],\"email\":[\"hjyxy2r@163.com\"],\"loginName\":[\"test1\"],\"password\":[\"test1\"],\"sex\":[\"0\"],\"roleId\":[\"104\"],\"areaId\":[\"3\"],\"merchantName\":[\"\"],\"remark\":[\"\"],\"status\":[\"0\"],\"postIds\":[\"1\"]}', '{\"msg\":\"选择社区管理员/医院管理员/物业管理员 角色，需要选择【所属区域】,填写业务系统名称，用于初始化对应业务系统\",\"code\":500}', 0, NULL, '2020-02-21 15:47:43');
INSERT INTO `sys_oper_log` VALUES (796, '用户管理', 1, 'com.pepper.project.system.user.controller.UserController.addSave()', 'POST', 1, 'admin', '超级管理员', '/system/user/add', '127.0.0.1', '内网IP', '{\"deptId\":[\"103\"],\"userName\":[\"test1\"],\"deptName\":[\"超级管理员\"],\"phonenumber\":[\"13456789012\"],\"email\":[\"hjyxy2r@163.com\"],\"loginName\":[\"test1\"],\"password\":[\"test1\"],\"sex\":[\"0\"],\"roleId\":[\"104\"],\"areaId\":[\"3\"],\"merchantName\":[\"test1社区\"],\"remark\":[\"\"],\"status\":[\"0\"],\"postIds\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-21 15:52:33');
INSERT INTO `sys_oper_log` VALUES (797, '用户管理', 1, 'com.pepper.project.system.user.controller.UserController.addSave()', 'POST', 1, 'admin', '超级管理员', '/system/user/add', '127.0.0.1', '内网IP', '{\"deptId\":[\"103\"],\"userName\":[\"test2\"],\"deptName\":[\"超级管理员\"],\"phonenumber\":[\"13456789190\"],\"email\":[\"test2@163.com\"],\"loginName\":[\"test2\"],\"password\":[\"123456\"],\"sex\":[\"0\"],\"roleId\":[\"104\"],\"areaId\":[\"\"],\"merchantName\":[\"\"],\"remark\":[\"\"],\"status\":[\"0\"],\"postIds\":[\"2\"]}', '{\"msg\":\"选择社区管理员/医院管理员/物业管理员 角色，需要选择【所属区域】,填写业务系统名称，用于初始化对应业务系统\",\"code\":500}', 0, NULL, '2020-02-21 15:53:53');
INSERT INTO `sys_oper_log` VALUES (798, '用户管理', 1, 'com.pepper.project.system.user.controller.UserController.addSave()', 'POST', 1, 'admin', '超级管理员', '/system/user/add', '127.0.0.1', '内网IP', '{\"deptId\":[\"103\"],\"userName\":[\"test2\"],\"deptName\":[\"超级管理员\"],\"phonenumber\":[\"13456789190\"],\"email\":[\"test2@163.com\"],\"loginName\":[\"test2\"],\"password\":[\"123456\"],\"sex\":[\"0\"],\"roleId\":[\"104\"],\"areaId\":[\"3\"],\"merchantName\":[\"\"],\"remark\":[\"\"],\"status\":[\"0\"],\"postIds\":[\"2\"]}', '{\"msg\":\"选择社区管理员/医院管理员/物业管理员 角色，需要选择【所属区域】,填写业务系统名称，用于初始化对应业务系统\",\"code\":500}', 0, NULL, '2020-02-21 15:53:59');
INSERT INTO `sys_oper_log` VALUES (799, '用户管理', 1, 'com.pepper.project.system.user.controller.UserController.addSave()', 'POST', 1, 'admin', '超级管理员', '/system/user/add', '127.0.0.1', '内网IP', '{\"deptId\":[\"103\"],\"userName\":[\"test2\"],\"deptName\":[\"超级管理员\"],\"phonenumber\":[\"13456789190\"],\"email\":[\"test2@163.com\"],\"loginName\":[\"test2\"],\"password\":[\"123456\"],\"sex\":[\"0\"],\"roleId\":[\"104\"],\"areaId\":[\"3\"],\"merchantName\":[\"test2社区\"],\"remark\":[\"\"],\"status\":[\"0\"],\"postIds\":[\"2\"]}', '{\"msg\":\"系统异常！\",\"code\":500}', 0, NULL, '2020-02-21 15:55:22');
INSERT INTO `sys_oper_log` VALUES (800, '用户管理', 1, 'com.pepper.project.system.user.controller.UserController.addSave()', 'POST', 1, 'admin', '超级管理员', '/system/user/add', '127.0.0.1', '内网IP', '{\"deptId\":[\"103\"],\"userName\":[\"test2\"],\"deptName\":[\"超级管理员\"],\"phonenumber\":[\"13456789190\"],\"email\":[\"test2@163.com\"],\"loginName\":[\"test2\"],\"password\":[\"123456\"],\"sex\":[\"0\"],\"roleId\":[\"104\"],\"areaId\":[\"3\"],\"merchantName\":[\"test2社区\"],\"remark\":[\"\"],\"status\":[\"0\"],\"postIds\":[\"2\"]}', '{\"msg\":\"系统异常！\",\"code\":500}', 0, NULL, '2020-02-21 15:59:59');
INSERT INTO `sys_oper_log` VALUES (801, '用户管理', 1, 'com.pepper.project.system.user.controller.UserController.addSave()', 'POST', 1, 'admin', '超级管理员', '/system/user/add', '127.0.0.1', '内网IP', '{\"deptId\":[\"103\"],\"userName\":[\"test2\"],\"deptName\":[\"超级管理员\"],\"phonenumber\":[\"13456789123\"],\"email\":[\"hjyxyr111@163.com\"],\"loginName\":[\"test2\"],\"password\":[\"test2\"],\"sex\":[\"0\"],\"roleId\":[\"104\"],\"areaId\":[\"3\"],\"merchantName\":[\"test2社区\"],\"remark\":[\"\"],\"status\":[\"0\"],\"postIds\":[\"1\"]}', '{\"msg\":\"系统异常！\",\"code\":500}', 0, NULL, '2020-02-21 16:03:28');
INSERT INTO `sys_oper_log` VALUES (802, '用户管理', 1, 'com.pepper.project.system.user.controller.UserController.addSave()', 'POST', 1, 'admin', '超级管理员', '/system/user/add', '127.0.0.1', '内网IP', '{\"deptId\":[\"103\"],\"userName\":[\"test2\"],\"deptName\":[\"超级管理员\"],\"phonenumber\":[\"13456789096\"],\"email\":[\"hjyxyrtest2@163.com\"],\"loginName\":[\"test2\"],\"password\":[\"test2\"],\"sex\":[\"0\"],\"roleId\":[\"104\"],\"areaId\":[\"3\"],\"merchantName\":[\"test2社区\"],\"remark\":[\"\"],\"status\":[\"0\"],\"postIds\":[\"2\"]}', '{\"msg\":\"系统异常！\",\"code\":500}', 0, NULL, '2020-02-21 16:05:26');
INSERT INTO `sys_oper_log` VALUES (803, '用户管理', 1, 'com.pepper.project.system.user.controller.UserController.addSave()', 'POST', 1, 'admin', '超级管理员', '/system/user/add', '127.0.0.1', '内网IP', '{\"deptId\":[\"103\"],\"userName\":[\"test2\"],\"deptName\":[\"超级管理员\"],\"phonenumber\":[\"13456789096\"],\"email\":[\"hjyxyrtest2@163.com\"],\"loginName\":[\"test2\"],\"password\":[\"test2\"],\"sex\":[\"0\"],\"roleId\":[\"104\"],\"areaId\":[\"3\"],\"merchantName\":[\"test2社区\"],\"remark\":[\"\"],\"status\":[\"0\"],\"postIds\":[\"2\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-21 16:07:12');
INSERT INTO `sys_oper_log` VALUES (804, '用户管理', 3, 'com.pepper.project.system.user.controller.UserController.remove()', 'POST', 1, 'admin', '超级管理员', '/system/user/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"105\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-21 16:09:50');
INSERT INTO `sys_oper_log` VALUES (805, '用户管理', 1, 'com.pepper.project.system.user.controller.UserController.addSave()', 'POST', 1, 'admin', '超级管理员', '/system/user/add', '127.0.0.1', '内网IP', '{\"deptId\":[\"103\"],\"userName\":[\"ctest3\"],\"deptName\":[\"超级管理员\"],\"phonenumber\":[\"13456789093\"],\"email\":[\"ctest3@163.com\"],\"loginName\":[\"ctest3\"],\"password\":[\"ctest3\"],\"sex\":[\"0\"],\"roleId\":[\"104\"],\"areaId\":[\"3\"],\"merchantName\":[\"ctest3社区\"],\"remark\":[\"\"],\"status\":[\"0\"],\"postIds\":[\"2\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-21 16:10:41');
INSERT INTO `sys_oper_log` VALUES (806, '用户管理', 1, 'com.pepper.project.system.user.controller.UserController.addSave()', 'POST', 1, 'admin', '超级管理员', '/system/user/add', '127.0.0.1', '内网IP', '{\"deptId\":[\"103\"],\"userName\":[\"htest3\"],\"deptName\":[\"超级管理员\"],\"phonenumber\":[\"13456789034\"],\"email\":[\"htest3@163.com\"],\"loginName\":[\"htest3\"],\"password\":[\"htest3\"],\"sex\":[\"0\"],\"roleId\":[\"105\"],\"areaId\":[\"4\"],\"merchantName\":[\"htest3医院\"],\"remark\":[\"\"],\"status\":[\"0\"],\"postIds\":[\"1\"]}', '{\"msg\":\"系统异常！\",\"code\":500}', 0, NULL, '2020-02-21 16:11:50');
INSERT INTO `sys_oper_log` VALUES (807, '用户管理', 1, 'com.pepper.project.system.user.controller.UserController.addSave()', 'POST', 1, 'admin', '超级管理员', '/system/user/add', '127.0.0.1', '内网IP', '{\"deptId\":[\"103\"],\"userName\":[\"htest3\"],\"deptName\":[\"超级管理员\"],\"phonenumber\":[\"13456789034\"],\"email\":[\"htest3@163.com\"],\"loginName\":[\"htest3\"],\"password\":[\"htest3\"],\"sex\":[\"0\"],\"roleId\":[\"105\"],\"areaId\":[\"4\"],\"merchantName\":[\"htest3医院\"],\"remark\":[\"\"],\"status\":[\"0\"],\"postIds\":[\"1\"]}', '{\"msg\":\"系统异常！\",\"code\":500}', 0, NULL, '2020-02-21 16:12:48');
INSERT INTO `sys_oper_log` VALUES (808, '用户管理', 1, 'com.pepper.project.system.user.controller.UserController.addSave()', 'POST', 1, 'admin', '超级管理员', '/system/user/add', '127.0.0.1', '内网IP', '{\"deptId\":[\"103\"],\"userName\":[\"htest3\"],\"deptName\":[\"超级管理员\"],\"phonenumber\":[\"13456789034\"],\"email\":[\"htest3@163.com\"],\"loginName\":[\"htest3\"],\"password\":[\"htest3\"],\"sex\":[\"0\"],\"roleId\":[\"105\"],\"areaId\":[\"4\"],\"merchantName\":[\"htest3医院\"],\"remark\":[\"\"],\"status\":[\"0\"],\"postIds\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-21 16:13:07');
INSERT INTO `sys_oper_log` VALUES (809, '用户管理', 1, 'com.pepper.project.system.user.controller.UserController.addSave()', 'POST', 1, 'admin', '超级管理员', '/system/user/add', '127.0.0.1', '内网IP', '{\"deptId\":[\"111\"],\"userName\":[\"htest4\"],\"deptName\":[\"医院管理员\"],\"phonenumber\":[\"19800000011\"],\"email\":[\"htest4@163.com\"],\"loginName\":[\"htest4\"],\"password\":[\"htest4\"],\"sex\":[\"0\"],\"roleId\":[\"105\"],\"areaId\":[\"4\"],\"merchantName\":[\"htest4医院\"],\"remark\":[\"\"],\"status\":[\"0\"],\"postIds\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-21 16:22:34');
INSERT INTO `sys_oper_log` VALUES (810, '用户管理', 3, 'com.pepper.project.system.user.controller.UserController.remove()', 'POST', 1, 'admin', '超级管理员', '/system/user/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"107\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-21 16:25:21');
INSERT INTO `sys_oper_log` VALUES (811, '用户管理', 2, 'com.pepper.project.system.user.controller.UserController.editSave()', 'POST', 1, 'admin', '超级管理员', '/system/user/edit', '127.0.0.1', '内网IP', '{\"userId\":[\"106\"],\"deptId\":[\"104\"],\"userName\":[\"ctest3\"],\"dept.deptName\":[\"社区管理员\"],\"phonenumber\":[\"13456789093\"],\"email\":[\"ctest3@163.com\"],\"loginName\":[\"ctest3\"],\"sex\":[\"0\"],\"roleId\":[\"104\"],\"merchantName\":[\"\"],\"remark\":[\"\"],\"status\":[\"0\"],\"roleIds\":[\"\"],\"postIds\":[\"2\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-21 16:25:31');
INSERT INTO `sys_oper_log` VALUES (812, '用户管理', 1, 'com.pepper.project.system.user.controller.UserController.addSave()', 'POST', 1, 'admin', '超级管理员', '/system/user/add', '127.0.0.1', '内网IP', '{\"deptId\":[\"110\"],\"userName\":[\"ptest3\"],\"deptName\":[\"物业管理员\"],\"phonenumber\":[\"13456789095\"],\"email\":[\"ptest3@163.com\"],\"loginName\":[\"ptest3\"],\"password\":[\"ptest3\"],\"sex\":[\"0\"],\"roleId\":[\"106\"],\"areaId\":[\"3\"],\"merchantName\":[\"ptest3物业\"],\"remark\":[\"\"],\"status\":[\"0\"],\"postIds\":[\"2\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-21 16:26:59');
INSERT INTO `sys_oper_log` VALUES (813, '用户管理', 1, 'com.pepper.project.system.user.controller.UserController.addSave()', 'POST', 1, 'admin', '超级管理员', '/system/user/add', '127.0.0.1', '内网IP', '{\"deptId\":[\"104\"],\"userName\":[\"ctest5\"],\"deptName\":[\"社区管理员\"],\"phonenumber\":[\"13456789125\"],\"email\":[\"ctest5@163.com\"],\"loginName\":[\"ctest5\"],\"password\":[\"ctest5\"],\"sex\":[\"0\"],\"roleId\":[\"104\"],\"areaId\":[\"3\"],\"merchantName\":[\"ctest5社区\"],\"remark\":[\"\"],\"status\":[\"0\"],\"postIds\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-21 16:42:15');
INSERT INTO `sys_oper_log` VALUES (814, '用户管理', 1, 'com.pepper.project.system.user.controller.UserController.addSave()', 'POST', 1, 'admin', '超级管理员', '/system/user/add', '127.0.0.1', '内网IP', '{\"deptId\":[\"103\"],\"userName\":[\"ctest6\"],\"deptName\":[\"超级管理员\"],\"phonenumber\":[\"13456423451\"],\"email\":[\"ctest6@163.com\"],\"loginName\":[\"ctest6\"],\"password\":[\"ctest6\"],\"sex\":[\"0\"],\"roleId\":[\"104\"],\"areaId\":[\"3\"],\"merchantName\":[\"ctest6社区1\"],\"remark\":[\"\"],\"status\":[\"0\"],\"postIds\":[\"2\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-21 16:48:23');
INSERT INTO `sys_oper_log` VALUES (815, '社区', 2, 'com.pepper.project.cm.community.controller.CommunityController.editSave()', 'POST', 1, 'ctest6', '超级管理员', '/cm/community/edit', '127.0.0.1', '内网IP', '{\"id\":[\"10\"],\"communityName\":[\"ctest6社区1\"],\"introduction\":[\"这是一个社区！\"],\"areaId\":[\"3\"],\"status\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-21 16:48:46');
INSERT INTO `sys_oper_log` VALUES (816, '医院介绍', 2, 'com.pepper.project.ch.hospital.controller.HospitalController.editSave()', 'POST', 1, 'admin', '超级管理员', '/ch/hospital/edit', '127.0.0.1', '内网IP', '{\"id\":[\"8\"],\"hosName\":[\"米东区 万福街道社区医院\"],\"introduction\":[\"<p>米东区社区医院&nbsp; 为您服务</p>\"],\"communityIds\":[\"5\"],\"areaId\":[\"4\"],\"status\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-21 16:57:27');
INSERT INTO `sys_oper_log` VALUES (817, '用户管理', 2, 'com.pepper.project.system.user.controller.UserController.editSave()', 'POST', 1, 'admin', '超级管理员', '/system/user/edit', '127.0.0.1', '内网IP', '{\"userId\":[\"111\"],\"deptId\":[\"103\"],\"merchantFlag\":[\"1\"],\"userName\":[\"ctest6\"],\"dept.deptName\":[\"超级管理员\"],\"phonenumber\":[\"13456423451\"],\"email\":[\"ctest6@163.com\"],\"loginName\":[\"ctest6\"],\"sex\":[\"0\"],\"areaId\":[\"4\"],\"merchantName\":[\"ctest6社区1\"],\"remark\":[\"\"],\"status\":[\"0\"],\"postIds\":[\"2\"]}', 'null', 1, '', '2020-02-21 17:08:25');
INSERT INTO `sys_oper_log` VALUES (818, '用户管理', 2, 'com.pepper.project.system.user.controller.UserController.editSave()', 'POST', 1, 'admin', '超级管理员', '/system/user/edit', '127.0.0.1', '内网IP', '{\"userId\":[\"111\"],\"deptId\":[\"103\"],\"merchantFlag\":[\"1\"],\"merchantId\":[\"10\"],\"userName\":[\"ctest6\"],\"dept.deptName\":[\"超级管理员\"],\"phonenumber\":[\"13456423451\"],\"email\":[\"ctest6@163.com\"],\"loginName\":[\"ctest6\"],\"sex\":[\"0\"],\"areaId\":[\"4\"],\"merchantName\":[\"ctest6社区1\"],\"remark\":[\"\"],\"status\":[\"0\"],\"postIds\":[\"2\"]}', 'null', 1, '', '2020-02-21 17:16:46');
INSERT INTO `sys_oper_log` VALUES (819, '用户管理', 2, 'com.pepper.project.system.user.controller.UserController.editSave()', 'POST', 1, 'admin', '超级管理员', '/system/user/edit', '127.0.0.1', '内网IP', '{\"userId\":[\"111\"],\"deptId\":[\"103\"],\"merchantFlag\":[\"1\"],\"merchantId\":[\"10\"],\"userName\":[\"ctest6\"],\"dept.deptName\":[\"超级管理员\"],\"phonenumber\":[\"13456423451\"],\"email\":[\"ctest6@163.com\"],\"loginName\":[\"ctest6\"],\"sex\":[\"0\"],\"areaId\":[\"4\"],\"merchantName\":[\"ctest6社区1\"],\"remark\":[\"\"],\"status\":[\"0\"],\"postIds\":[\"2\"]}', 'null', 1, '', '2020-02-21 17:17:39');
INSERT INTO `sys_oper_log` VALUES (820, '用户管理', 2, 'com.pepper.project.system.user.controller.UserController.editSave()', 'POST', 1, 'admin', '超级管理员', '/system/user/edit', '127.0.0.1', '内网IP', '{\"userId\":[\"111\"],\"deptId\":[\"103\"],\"merchantFlag\":[\"1\"],\"merchantId\":[\"10\"],\"userName\":[\"ctest6\"],\"dept.deptName\":[\"超级管理员\"],\"phonenumber\":[\"13456423451\"],\"email\":[\"ctest6@163.com\"],\"loginName\":[\"ctest6\"],\"sex\":[\"0\"],\"areaId\":[\"4\"],\"merchantName\":[\"ctest6社区1\"],\"remark\":[\"\"],\"status\":[\"0\"],\"postIds\":[\"2\"]}', 'null', 1, '', '2020-02-21 17:17:53');
INSERT INTO `sys_oper_log` VALUES (821, '用户管理', 2, 'com.pepper.project.system.user.controller.UserController.editSave()', 'POST', 1, 'admin', '超级管理员', '/system/user/edit', '127.0.0.1', '内网IP', '{\"userId\":[\"111\"],\"deptId\":[\"103\"],\"merchantFlag\":[\"1\"],\"merchantId\":[\"10\"],\"userName\":[\"ctest6\"],\"dept.deptName\":[\"超级管理员\"],\"phonenumber\":[\"13456423451\"],\"email\":[\"ctest6@163.com\"],\"loginName\":[\"ctest6\"],\"sex\":[\"0\"],\"areaId\":[\"3\"],\"merchantName\":[\"ctest6社区1\"],\"remark\":[\"\"],\"status\":[\"0\"],\"postIds\":[\"2\"]}', 'null', 1, '', '2020-02-21 17:18:36');
INSERT INTO `sys_oper_log` VALUES (822, '用户管理', 2, 'com.pepper.project.system.user.controller.UserController.editSave()', 'POST', 1, 'admin', '超级管理员', '/system/user/edit', '127.0.0.1', '内网IP', '{\"userId\":[\"111\"],\"deptId\":[\"103\"],\"merchantFlag\":[\"1\"],\"merchantId\":[\"10\"],\"userName\":[\"ctest6\"],\"dept.deptName\":[\"超级管理员\"],\"phonenumber\":[\"13456423451\"],\"email\":[\"ctest6@163.com\"],\"loginName\":[\"ctest6\"],\"sex\":[\"0\"],\"areaId\":[\"3\"],\"merchantName\":[\"ctest6社区1\"],\"remark\":[\"\"],\"status\":[\"0\"],\"postIds\":[\"2\"]}', 'null', 1, '', '2020-02-21 17:18:47');
INSERT INTO `sys_oper_log` VALUES (823, '用户管理', 2, 'com.pepper.project.system.user.controller.UserController.editSave()', 'POST', 1, 'admin', '超级管理员', '/system/user/edit', '127.0.0.1', '内网IP', '{\"userId\":[\"111\"],\"deptId\":[\"103\"],\"merchantFlag\":[\"1\"],\"merchantId\":[\"10\"],\"userName\":[\"ctest6\"],\"dept.deptName\":[\"超级管理员\"],\"phonenumber\":[\"13456423451\"],\"email\":[\"ctest6@163.com\"],\"loginName\":[\"ctest6\"],\"sex\":[\"0\"],\"areaId\":[\"3\"],\"merchantName\":[\"ctest6社区1\"],\"remark\":[\"\"],\"status\":[\"0\"],\"postIds\":[\"2\"]}', 'null', 1, '', '2020-02-21 17:20:18');
INSERT INTO `sys_oper_log` VALUES (824, '用户管理', 2, 'com.pepper.project.system.user.controller.UserController.editSave()', 'POST', 1, 'admin', '超级管理员', '/system/user/edit', '127.0.0.1', '内网IP', '{\"userId\":[\"111\"],\"deptId\":[\"103\"],\"merchantFlag\":[\"1\"],\"merchantId\":[\"10\"],\"userName\":[\"ctest6\"],\"dept.deptName\":[\"超级管理员\"],\"phonenumber\":[\"13456423451\"],\"email\":[\"ctest6@163.com\"],\"loginName\":[\"ctest6\"],\"sex\":[\"0\"],\"areaId\":[\"3\"],\"merchantName\":[\"ctest6社区1\"],\"remark\":[\"\"],\"status\":[\"0\"],\"postIds\":[\"2\"],\"roleId\":[\"\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-21 17:25:20');
INSERT INTO `sys_oper_log` VALUES (825, '用户管理', 2, 'com.pepper.project.system.user.controller.UserController.editSave()', 'POST', 1, 'admin', '超级管理员', '/system/user/edit', '127.0.0.1', '内网IP', '{\"userId\":[\"111\"],\"deptId\":[\"103\"],\"merchantFlag\":[\"1\"],\"merchantId\":[\"10\"],\"userName\":[\"ctest6\"],\"dept.deptName\":[\"超级管理员\"],\"phonenumber\":[\"13456423451\"],\"email\":[\"ctest6@163.com\"],\"loginName\":[\"ctest6\"],\"sex\":[\"0\"],\"areaId\":[\"3\"],\"merchantName\":[\"ctest6社区1\"],\"remark\":[\"\"],\"status\":[\"0\"],\"postIds\":[\"2\"],\"roleId\":[\"\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-21 17:27:01');
INSERT INTO `sys_oper_log` VALUES (826, '用户管理', 2, 'com.pepper.project.system.user.controller.UserController.editSave()', 'POST', 1, 'admin', '超级管理员', '/system/user/edit', '127.0.0.1', '内网IP', '{\"userId\":[\"111\"],\"deptId\":[\"103\"],\"merchantFlag\":[\"1\"],\"merchantId\":[\"10\"],\"userName\":[\"ctest6\"],\"dept.deptName\":[\"超级管理员\"],\"phonenumber\":[\"13456423451\"],\"email\":[\"ctest6@163.com\"],\"loginName\":[\"ctest6\"],\"sex\":[\"0\"],\"areaId\":[\"3\"],\"merchantName\":[\"ctest6社区1\"],\"remark\":[\"\"],\"status\":[\"0\"],\"postIds\":[\"2\"],\"roleId\":[\"\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-21 17:30:21');
INSERT INTO `sys_oper_log` VALUES (827, '用户管理', 2, 'com.pepper.project.system.user.controller.UserController.editSave()', 'POST', 1, 'admin', '超级管理员', '/system/user/edit', '127.0.0.1', '内网IP', '{\"userId\":[\"111\"],\"deptId\":[\"103\"],\"merchantFlag\":[\"1\"],\"merchantId\":[\"10\"],\"userName\":[\"ctest6\"],\"dept.deptName\":[\"超级管理员\"],\"phonenumber\":[\"13456423451\"],\"email\":[\"ctest6@163.com\"],\"loginName\":[\"ctest6\"],\"sex\":[\"0\"],\"areaId\":[\"3\"],\"merchantName\":[\"ctest6社区1  admin modify\"],\"remark\":[\"\"],\"status\":[\"0\"],\"postIds\":[\"2\"],\"roleId\":[\"\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-21 17:30:50');
INSERT INTO `sys_oper_log` VALUES (828, '用户管理', 2, 'com.pepper.project.system.user.controller.UserController.editSave()', 'POST', 1, 'admin', '超级管理员', '/system/user/edit', '127.0.0.1', '内网IP', '{\"userId\":[\"111\"],\"deptId\":[\"104\"],\"merchantFlag\":[\"1\"],\"merchantId\":[\"10\"],\"userName\":[\"ctest6\"],\"dept.deptName\":[\"社区管理员\"],\"phonenumber\":[\"13456423451\"],\"email\":[\"ctest6@163.com\"],\"loginName\":[\"ctest6\"],\"sex\":[\"0\"],\"areaId\":[\"3\"],\"merchantName\":[\"ctest6社区1  admin modify\"],\"remark\":[\"\"],\"status\":[\"0\"],\"postIds\":[\"2\"],\"roleId\":[\"\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-21 17:31:48');
INSERT INTO `sys_oper_log` VALUES (829, '用户管理', 1, 'com.pepper.project.system.user.controller.UserController.addSave()', 'POST', 1, 'admin', '超级管理员', '/system/user/add', '127.0.0.1', '内网IP', '{\"deptId\":[\"103\"],\"userName\":[\"chaoguan\"],\"deptName\":[\"超级管理员\"],\"phonenumber\":[\"13456712345\"],\"email\":[\"chaoguan@163.com\"],\"loginName\":[\"chaoguan\"],\"password\":[\"chaoguan\"],\"sex\":[\"0\"],\"roleId\":[\"1\"],\"areaId\":[\"\"],\"merchantName\":[\"\"],\"remark\":[\"\"],\"status\":[\"0\"],\"postIds\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-21 17:33:46');
INSERT INTO `sys_oper_log` VALUES (830, '用户管理', 1, 'com.pepper.project.system.user.controller.UserController.addSave()', 'POST', 1, 'admin', '超级管理员', '/system/user/add', '127.0.0.1', '内网IP', '{\"deptId\":[\"103\"],\"userName\":[\"chaog1\"],\"deptName\":[\"超级管理员\"],\"phonenumber\":[\"13456719090\"],\"email\":[\"chaog1r@163.com\"],\"loginName\":[\"chaog1\"],\"password\":[\"chaog1\"],\"sex\":[\"0\"],\"roleId\":[\"1\"],\"areaId\":[\"\"],\"merchantName\":[\"\"],\"remark\":[\"\"],\"status\":[\"0\"],\"postIds\":[\"2\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-21 17:43:55');
INSERT INTO `sys_oper_log` VALUES (831, '角色管理', 2, 'com.pepper.project.system.role.controller.RoleController.editSave()', 'POST', 1, 'admin', '超级管理员', '/system/role/edit', '127.0.0.1', '内网IP', '{\"roleId\":[\"1\"],\"roleName\":[\"管理员\"],\"roleKey\":[\"admin\"],\"roleSort\":[\"1\"],\"status\":[\"0\"],\"remark\":[\"管理员\"],\"menuIds\":[\"1,100,1000,1001,1002,1003,1004,1005,1006,101,1007,1008,1009,1010,1011,102,1012,1013,1014,1015,103,1016,1017,1018,1019,104,1020,1021,1022,1023,1024,105,1025,1026,1027,1028,1029,106,1030,1031,1032,1033,1034,107,1035,1036,1037,1038,108,500,1039,1040,1041,1042,501,1043,1044,1045,1046,2,109,1047,1048,1049,110,1050,1051,1052,1053,1054,1055,1056,111,112,3,113,114,1057,1058,1059,1060,1061,115,1065,1066,1192,1193,1194,1195\"]}', 'null', 1, '不允许操作超级管理员角色', '2020-02-21 17:44:40');
INSERT INTO `sys_oper_log` VALUES (832, '用户管理', 1, 'com.ruoyi.project.system.user.controller.UserController.addSave()', 'POST', 1, 'admin', '超级管理员', '/system/user/add', '127.0.0.1', '内网IP', '{\"deptId\":[\"103\"],\"userName\":[\"chaoji\"],\"deptName\":[\"超级管理员\"],\"phonenumber\":[\"13456781090\"],\"email\":[\"chaoji@163.com\"],\"loginName\":[\"chaoji\"],\"password\":[\"chaoji\"],\"sex\":[\"0\"],\"role\":[\"1\"],\"remark\":[\"\"],\"status\":[\"0\"],\"roleIds\":[\"1\"],\"postIds\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-21 17:50:22');
INSERT INTO `sys_oper_log` VALUES (833, '用户管理', 3, 'com.ruoyi.project.system.user.controller.UserController.remove()', 'POST', 1, 'admin', '超级管理员', '/system/user/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"114\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-21 17:59:09');
INSERT INTO `sys_oper_log` VALUES (834, '用户管理', 3, 'com.ruoyi.project.system.user.controller.UserController.remove()', 'POST', 1, 'admin', '超级管理员', '/system/user/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"113\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-21 17:59:12');
INSERT INTO `sys_oper_log` VALUES (835, '用户管理', 3, 'com.ruoyi.project.system.user.controller.UserController.remove()', 'POST', 1, 'admin', '超级管理员', '/system/user/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"112\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-21 17:59:14');
INSERT INTO `sys_oper_log` VALUES (836, '用户管理', 3, 'com.pepper.project.system.user.controller.UserController.remove()', 'POST', 1, 'admin', '超级管理员', '/system/user/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"111\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-21 18:00:33');
INSERT INTO `sys_oper_log` VALUES (837, '用户管理', 3, 'com.pepper.project.system.user.controller.UserController.remove()', 'POST', 1, 'admin', '超级管理员', '/system/user/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"110\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-21 18:00:36');
INSERT INTO `sys_oper_log` VALUES (838, '用户管理', 3, 'com.pepper.project.system.user.controller.UserController.remove()', 'POST', 1, 'admin', '超级管理员', '/system/user/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"109\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-21 18:00:37');
INSERT INTO `sys_oper_log` VALUES (839, '用户管理', 3, 'com.pepper.project.system.user.controller.UserController.remove()', 'POST', 1, 'admin', '超级管理员', '/system/user/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"108\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-21 18:00:40');
INSERT INTO `sys_oper_log` VALUES (840, '用户管理', 3, 'com.pepper.project.system.user.controller.UserController.remove()', 'POST', 1, 'admin', '超级管理员', '/system/user/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"106\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-21 18:00:41');
INSERT INTO `sys_oper_log` VALUES (841, '用户管理', 3, 'com.pepper.project.system.user.controller.UserController.remove()', 'POST', 1, 'admin', '超级管理员', '/system/user/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"104\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-21 18:00:44');
INSERT INTO `sys_oper_log` VALUES (842, '用户管理', 1, 'com.pepper.project.system.user.controller.UserController.addSave()', 'POST', 1, 'admin', '超级管理员', '/system/user/add', '127.0.0.1', '内网IP', '{\"deptId\":[\"104\"],\"userName\":[\"community1\"],\"deptName\":[\"社区管理员\"],\"phonenumber\":[\"18900000001\"],\"email\":[\"community1@163.com\"],\"loginName\":[\"community1\"],\"password\":[\"community1\"],\"sex\":[\"0\"],\"roleId\":[\"104\"],\"areaId\":[\"3\"],\"merchantName\":[\"community1社区\"],\"remark\":[\"\"],\"status\":[\"0\"],\"postIds\":[\"4\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-21 18:01:58');
INSERT INTO `sys_oper_log` VALUES (843, '用户管理', 1, 'com.pepper.project.system.user.controller.UserController.addSave()', 'POST', 1, 'admin', '超级管理员', '/system/user/add', '127.0.0.1', '内网IP', '{\"deptId\":[\"104\"],\"userName\":[\"community2\"],\"deptName\":[\"社区管理员\"],\"phonenumber\":[\"18900000002\"],\"email\":[\"community2@163.com\"],\"loginName\":[\"community2\"],\"password\":[\"community2\"],\"sex\":[\"0\"],\"areaId\":[\"4\"],\"merchantName\":[\"community2\"],\"remark\":[\"\"],\"status\":[\"0\"],\"postIds\":[\"4\"]}', '{\"msg\":\"角色不可以不选！\",\"code\":500}', 0, NULL, '2020-02-21 18:02:41');
INSERT INTO `sys_oper_log` VALUES (844, '用户管理', 1, 'com.pepper.project.system.user.controller.UserController.addSave()', 'POST', 1, 'admin', '超级管理员', '/system/user/add', '127.0.0.1', '内网IP', '{\"deptId\":[\"104\"],\"userName\":[\"community2\"],\"deptName\":[\"社区管理员\"],\"phonenumber\":[\"18900000002\"],\"email\":[\"community2@163.com\"],\"loginName\":[\"community2\"],\"password\":[\"community2\"],\"sex\":[\"0\"],\"roleId\":[\"104\"],\"areaId\":[\"4\"],\"merchantName\":[\"community2\"],\"remark\":[\"\"],\"status\":[\"0\"],\"postIds\":[\"4\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-21 18:02:45');
INSERT INTO `sys_oper_log` VALUES (845, '用户管理', 1, 'com.pepper.project.system.user.controller.UserController.addSave()', 'POST', 1, 'admin', '超级管理员', '/system/user/add', '127.0.0.1', '内网IP', '{\"deptId\":[\"111\"],\"userName\":[\"hospital1\"],\"deptName\":[\"医院管理员\"],\"phonenumber\":[\"19800000003\"],\"email\":[\"hospital1@163.com\"],\"loginName\":[\"hospital1\"],\"password\":[\"hospital1\"],\"sex\":[\"0\"],\"roleId\":[\"105\"],\"areaId\":[\"5\"],\"merchantName\":[\"hospital1医院\"],\"remark\":[\"\"],\"status\":[\"0\"],\"postIds\":[\"4\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-21 18:04:17');
INSERT INTO `sys_oper_log` VALUES (846, '用户管理', 1, 'com.pepper.project.system.user.controller.UserController.addSave()', 'POST', 1, 'admin', '超级管理员', '/system/user/add', '127.0.0.1', '内网IP', '{\"deptId\":[\"111\"],\"userName\":[\"hospital2\"],\"deptName\":[\"医院管理员\"],\"phonenumber\":[\"19800000004\"],\"email\":[\"hospital2@163.com\"],\"loginName\":[\"hospital2\"],\"password\":[\"hospital2\"],\"sex\":[\"0\"],\"areaId\":[\"4\"],\"merchantName\":[\"hospital2医院\"],\"remark\":[\"\"],\"status\":[\"0\"],\"postIds\":[\"4\"]}', '{\"msg\":\"角色不可以不选！\",\"code\":500}', 0, NULL, '2020-02-21 18:04:48');
INSERT INTO `sys_oper_log` VALUES (847, '用户管理', 1, 'com.pepper.project.system.user.controller.UserController.addSave()', 'POST', 1, 'admin', '超级管理员', '/system/user/add', '127.0.0.1', '内网IP', '{\"deptId\":[\"111\"],\"userName\":[\"hospital2\"],\"deptName\":[\"医院管理员\"],\"phonenumber\":[\"19800000004\"],\"email\":[\"hospital2@163.com\"],\"loginName\":[\"hospital2\"],\"password\":[\"hospital2\"],\"sex\":[\"0\"],\"roleId\":[\"105\"],\"areaId\":[\"4\"],\"merchantName\":[\"hospital2医院\"],\"remark\":[\"\"],\"status\":[\"0\"],\"postIds\":[\"4\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-21 18:04:53');
INSERT INTO `sys_oper_log` VALUES (848, '用户管理', 1, 'com.pepper.project.system.user.controller.UserController.addSave()', 'POST', 1, 'admin', '超级管理员', '/system/user/add', '127.0.0.1', '内网IP', '{\"deptId\":[\"111\"],\"userName\":[\"hospital3\"],\"deptName\":[\"医院管理员\"],\"phonenumber\":[\"19800000006\"],\"email\":[\"hospital3@163.com\"],\"loginName\":[\"hospital3\"],\"password\":[\"hospital3\"],\"sex\":[\"0\"],\"roleId\":[\"105\"],\"areaId\":[\"3\"],\"merchantName\":[\"hospital3医院\"],\"remark\":[\"\"],\"status\":[\"0\"],\"postIds\":[\"4\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-21 18:05:26');
INSERT INTO `sys_oper_log` VALUES (849, '用户管理', 1, 'com.pepper.project.system.user.controller.UserController.addSave()', 'POST', 1, 'admin', '超级管理员', '/system/user/add', '127.0.0.1', '内网IP', '{\"deptId\":[\"110\"],\"userName\":[\"property1\"],\"deptName\":[\"物业管理员\"],\"phonenumber\":[\"19800000007\"],\"email\":[\"property1@163.com\"],\"loginName\":[\"property1\"],\"password\":[\"property1\"],\"sex\":[\"0\"],\"roleId\":[\"106\"],\"areaId\":[\"4\"],\"merchantName\":[\"property1物业\"],\"remark\":[\"\"],\"status\":[\"0\"],\"postIds\":[\"4\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-21 18:06:15');
INSERT INTO `sys_oper_log` VALUES (850, '用户管理', 1, 'com.pepper.project.system.user.controller.UserController.addSave()', 'POST', 1, 'admin', '超级管理员', '/system/user/add', '127.0.0.1', '内网IP', '{\"deptId\":[\"110\"],\"userName\":[\"property2\"],\"deptName\":[\"物业管理员\"],\"phonenumber\":[\"19800000009\"],\"email\":[\"property2@163.com\"],\"loginName\":[\"property2\"],\"password\":[\"property2\"],\"sex\":[\"0\"],\"roleId\":[\"106\"],\"areaId\":[\"4\"],\"merchantName\":[\"property2wuye\"],\"remark\":[\"\"],\"status\":[\"0\"],\"postIds\":[\"4\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-21 18:06:49');
INSERT INTO `sys_oper_log` VALUES (851, '角色管理', 2, 'com.pepper.project.system.role.controller.RoleController.editSave()', 'POST', 1, 'admin', '超级管理员', '/system/role/edit', '127.0.0.1', '内网IP', '{\"roleId\":[\"107\"],\"roleName\":[\"客户端登陆\"],\"roleKey\":[\"client\"],\"roleSort\":[\"11\"],\"status\":[\"0\"],\"remark\":[\"客户端登陆，不允许删除\"],\"menuIds\":[\"\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-21 18:07:42');
INSERT INTO `sys_oper_log` VALUES (852, '角色管理', 2, 'com.pepper.project.system.role.controller.RoleController.editSave()', 'POST', 1, 'admin', '超级管理员', '/system/role/edit', '127.0.0.1', '内网IP', '{\"roleId\":[\"106\"],\"roleName\":[\"物业管理员\"],\"roleKey\":[\"propertyAdmin\"],\"roleSort\":[\"10\"],\"status\":[\"0\"],\"remark\":[\"医院管理员，不允许删除\"],\"menuIds\":[\"1115,1116,1117,1119,1121,1124,1126,1125,1127,1136,1137,1139,1138,1140,1122,1132,1133,1134,1135,1123,1128,1129,1130,1131\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-21 18:07:46');
INSERT INTO `sys_oper_log` VALUES (853, '角色管理', 2, 'com.pepper.project.system.role.controller.RoleController.editSave()', 'POST', 1, 'admin', '超级管理员', '/system/role/edit', '127.0.0.1', '内网IP', '{\"roleId\":[\"105\"],\"roleName\":[\"医院管理员\"],\"roleKey\":[\"hospitalAdmin\"],\"roleSort\":[\"9\"],\"status\":[\"0\"],\"remark\":[\"物业管理员，不允许删除\"],\"menuIds\":[\"1171,1172,1173,1178\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-21 18:07:49');
INSERT INTO `sys_oper_log` VALUES (854, '角色管理', 2, 'com.pepper.project.system.role.controller.RoleController.editSave()', 'POST', 1, 'admin', '超级管理员', '/system/role/edit', '127.0.0.1', '内网IP', '{\"roleId\":[\"104\"],\"roleName\":[\"社区管理员\"],\"roleKey\":[\"communityAdmin\"],\"roleSort\":[\"8\"],\"status\":[\"0\"],\"remark\":[\"社区管理员，不允许删除\"],\"menuIds\":[\"1094,1095,1096,1098,1100,1101,1102,1103,1104,1107,1108,1109,1110,1111,1112,1113,1114\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-21 18:07:53');
INSERT INTO `sys_oper_log` VALUES (855, '角色管理', 2, 'com.pepper.project.system.role.controller.RoleController.editSave()', 'POST', 1, 'admin', '超级管理员', '/system/role/edit', '127.0.0.1', '内网IP', '{\"roleId\":[\"103\"],\"roleName\":[\"物业总管理员\"],\"roleKey\":[\"propertyBigAdmin\"],\"roleSort\":[\"7\"],\"status\":[\"0\"],\"remark\":[\"医院总管理员\"],\"menuIds\":[\"1115,1116,1117,1118,1119,1120,1121,1124,1126,1125,1127,1136,1137,1139,1138,1140,1122,1132,1133,1134,1135,1123,1128,1129,1130,1131\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-21 18:07:57');
INSERT INTO `sys_oper_log` VALUES (856, '角色管理', 2, 'com.pepper.project.system.role.controller.RoleController.editSave()', 'POST', 1, 'admin', '超级管理员', '/system/role/edit', '127.0.0.1', '内网IP', '{\"roleId\":[\"102\"],\"roleName\":[\"医院总管理员\"],\"roleKey\":[\"hospitalBigAdmin\"],\"roleSort\":[\"6\"],\"status\":[\"0\"],\"remark\":[\"物业总管理员\"],\"menuIds\":[\"1171,1172,1173,1177,1178,1179,1174,1180,1181,1182,1183,1175,1184,1185,1186,1187,1176,1188,1189,1190,1191\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-21 18:08:02');
INSERT INTO `sys_oper_log` VALUES (857, '角色管理', 2, 'com.pepper.project.system.role.controller.RoleController.editSave()', 'POST', 1, 'admin', '超级管理员', '/system/role/edit', '127.0.0.1', '内网IP', '{\"roleId\":[\"101\"],\"roleName\":[\"社区总管理员\"],\"roleKey\":[\"communityBigAdmin\"],\"roleSort\":[\"4\"],\"status\":[\"0\"],\"remark\":[\"社区总管理员\"],\"menuIds\":[\"1094,1095,1096,1097,1098,1099\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-21 18:08:13');
INSERT INTO `sys_oper_log` VALUES (858, '角色管理', 2, 'com.pepper.project.system.role.controller.RoleController.editSave()', 'POST', 1, 'admin', '超级管理员', '/system/role/edit', '127.0.0.1', '内网IP', '{\"roleId\":[\"102\"],\"roleName\":[\"医院总管理员\"],\"roleKey\":[\"hospitalBigAdmin\"],\"roleSort\":[\"5\"],\"status\":[\"0\"],\"remark\":[\"物业总管理员\"],\"menuIds\":[\"1171,1172,1173,1177,1178,1179,1174,1180,1181,1182,1183,1175,1184,1185,1186,1187,1176,1188,1189,1190,1191\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-21 18:08:31');
INSERT INTO `sys_oper_log` VALUES (859, '角色管理', 2, 'com.pepper.project.system.role.controller.RoleController.editSave()', 'POST', 1, 'admin', '超级管理员', '/system/role/edit', '127.0.0.1', '内网IP', '{\"roleId\":[\"103\"],\"roleName\":[\"物业总管理员\"],\"roleKey\":[\"propertyBigAdmin\"],\"roleSort\":[\"6\"],\"status\":[\"0\"],\"remark\":[\"医院总管理员\"],\"menuIds\":[\"1115,1116,1117,1118,1119,1120,1121,1124,1126,1125,1127,1136,1137,1139,1138,1140,1122,1132,1133,1134,1135,1123,1128,1129,1130,1131\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-21 18:08:35');
INSERT INTO `sys_oper_log` VALUES (860, '角色管理', 2, 'com.pepper.project.system.role.controller.RoleController.editSave()', 'POST', 1, 'admin', '超级管理员', '/system/role/edit', '127.0.0.1', '内网IP', '{\"roleId\":[\"104\"],\"roleName\":[\"社区管理员\"],\"roleKey\":[\"communityAdmin\"],\"roleSort\":[\"7\"],\"status\":[\"0\"],\"remark\":[\"社区管理员，不允许删除\"],\"menuIds\":[\"1094,1095,1096,1098,1100,1101,1102,1103,1104,1107,1108,1109,1110,1111,1112,1113,1114\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-21 18:08:42');
INSERT INTO `sys_oper_log` VALUES (861, '角色管理', 2, 'com.pepper.project.system.role.controller.RoleController.editSave()', 'POST', 1, 'admin', '超级管理员', '/system/role/edit', '127.0.0.1', '内网IP', '{\"roleId\":[\"105\"],\"roleName\":[\"医院管理员\"],\"roleKey\":[\"hospitalAdmin\"],\"roleSort\":[\"8\"],\"status\":[\"0\"],\"remark\":[\"物业管理员，不允许删除\"],\"menuIds\":[\"1171,1172,1173,1178\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-21 18:08:46');
INSERT INTO `sys_oper_log` VALUES (862, '角色管理', 2, 'com.pepper.project.system.role.controller.RoleController.editSave()', 'POST', 1, 'admin', '超级管理员', '/system/role/edit', '127.0.0.1', '内网IP', '{\"roleId\":[\"106\"],\"roleName\":[\"物业管理员\"],\"roleKey\":[\"propertyAdmin\"],\"roleSort\":[\"9\"],\"status\":[\"0\"],\"remark\":[\"医院管理员，不允许删除\"],\"menuIds\":[\"1115,1116,1117,1119,1121,1124,1126,1125,1127,1136,1137,1139,1138,1140,1122,1132,1133,1134,1135,1123,1128,1129,1130,1131\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-21 18:08:50');
INSERT INTO `sys_oper_log` VALUES (863, '角色管理', 2, 'com.pepper.project.system.role.controller.RoleController.editSave()', 'POST', 1, 'admin', '超级管理员', '/system/role/edit', '127.0.0.1', '内网IP', '{\"roleId\":[\"107\"],\"roleName\":[\"客户端登陆\"],\"roleKey\":[\"client\"],\"roleSort\":[\"10\"],\"status\":[\"0\"],\"remark\":[\"客户端登陆，不允许删除\"],\"menuIds\":[\"\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-21 18:08:55');
INSERT INTO `sys_oper_log` VALUES (864, '角色管理', 2, 'com.pepper.project.system.role.controller.RoleController.editSave()', 'POST', 1, 'admin', '超级管理员', '/system/role/edit', '127.0.0.1', '内网IP', '{\"roleId\":[\"105\"],\"roleName\":[\"医院管理员\"],\"roleKey\":[\"hospitalAdmin\"],\"roleSort\":[\"8\"],\"status\":[\"0\"],\"remark\":[\"物业管理员，不允许删除\"],\"menuIds\":[\"1171,1172,1173,1178,1174,1180,1181,1182,1183,1175,1184,1185,1186,1187,1176,1188,1189,1190,1191\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-21 18:09:50');
INSERT INTO `sys_oper_log` VALUES (865, '角色管理', 2, 'com.pepper.project.system.role.controller.RoleController.editSave()', 'POST', 1, 'admin', '超级管理员', '/system/role/edit', '127.0.0.1', '内网IP', '{\"roleId\":[\"106\"],\"roleName\":[\"物业管理员\"],\"roleKey\":[\"propertyAdmin\"],\"roleSort\":[\"9\"],\"status\":[\"0\"],\"remark\":[\"医院管理员，不允许删除\"],\"menuIds\":[\"1115,1116,1117,1119,1121,1124,1126,1125,1127,1136,1137,1139,1138,1140,1122,1132,1133,1134,1135,1123,1128,1129,1130,1131\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-21 18:09:57');
INSERT INTO `sys_oper_log` VALUES (866, '社区', 2, 'com.pepper.project.cm.community.controller.CommunityController.editSave()', 'POST', 1, 'admin', '超级管理员', '/cm/community/edit', '127.0.0.1', '内网IP', '{\"id\":[\"12\"],\"communityName\":[\"community2\"],\"introduction\":[\"这是一个社区！22222\"],\"areaId\":[\"4\"],\"status\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-21 18:19:13');
INSERT INTO `sys_oper_log` VALUES (867, '活动', 1, 'com.pepper.project.cm.activity.controller.ActivityController.addSave()', 'POST', 1, 'community2', '社区管理员', '/cm/activity/add', '127.0.0.1', '内网IP', '{\"title\":[\"community2   大活动那个\"],\"content\":[\"<p>&nbsp; 大活动那个&nbsp; 大活动那个&nbsp; 大活动那个&nbsp; 大活动那个&nbsp; 大活动那个&nbsp; 大活动那个&nbsp; 大活动那个</p><p><br></p><p>&nbsp; 大活动那个<br></p>\"],\"status\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-21 18:42:56');
INSERT INTO `sys_oper_log` VALUES (868, '活动', 1, 'com.pepper.project.cm.activity.controller.ActivityApplyController.addSave()', 'POST', 1, 'community2', '社区管理员', '/cm/activity/apply/add', '127.0.0.1', '内网IP', '{\"userId\":[\"10000001\"],\"activityId\":[\"3\"],\"userMobile\":[\"18900009999\"],\"status\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-21 18:48:59');
INSERT INTO `sys_oper_log` VALUES (869, '活动', 1, 'com.pepper.project.cm.activity.controller.ActivityController.addSave()', 'POST', 1, 'community2', '社区管理员', '/cm/activity/add', '127.0.0.1', '内网IP', '{\"title\":[\"community  大大大大大\"],\"content\":[\"<p>犯得上犯得上发射点</p>\"],\"status\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-21 20:02:06');
INSERT INTO `sys_oper_log` VALUES (870, '活动报名', 5, 'com.pepper.project.cm.activity.controller.ActivityApplyController.export()', 'POST', 1, 'admin', '超级管理员', '/cm/activity/apply/export', '127.0.0.1', '内网IP', '{\"activityId\":[\"\"],\"status\":[\"\"]}', '{\"msg\":\"7b0203b9-edbd-4682-89f6-1b32bb1fd7cf_活动报名列表_null.xlsx\",\"code\":0}', 0, NULL, '2020-02-21 20:04:32');
INSERT INTO `sys_oper_log` VALUES (871, '菜单管理', 1, 'com.pepper.project.system.menu.controller.MenuController.addSave()', 'POST', 1, 'admin', '超级管理员', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"1100\"],\"menuType\":[\"F\"],\"menuName\":[\"活动报名列表导出\"],\"url\":[\"\"],\"target\":[\"menuItem\"],\"perms\":[\"cm:activity:export\"],\"orderNum\":[\"5\"],\"icon\":[\"\"],\"visible\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-21 20:07:34');
INSERT INTO `sys_oper_log` VALUES (872, '角色管理', 2, 'com.pepper.project.system.role.controller.RoleController.editSave()', 'POST', 1, 'admin', '超级管理员', '/system/role/edit', '127.0.0.1', '内网IP', '{\"roleId\":[\"104\"],\"roleName\":[\"社区管理员\"],\"roleKey\":[\"communityAdmin\"],\"roleSort\":[\"7\"],\"status\":[\"0\"],\"remark\":[\"社区管理员，不允许删除\"],\"menuIds\":[\"1094,1095,1096,1098,1100,1101,1102,1103,1104,1196,1107,1108,1109,1110,1111,1112,1113,1114\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-21 20:07:46');
INSERT INTO `sys_oper_log` VALUES (873, '活动报名', 5, 'com.pepper.project.cm.activity.controller.ActivityApplyController.export()', 'POST', 1, 'community2', '社区管理员', '/cm/activity/apply/export', '127.0.0.1', '内网IP', '{\"activityId\":[\"3\"],\"status\":[\"\"]}', '{\"msg\":\"58f1daee-f48e-44a6-a2e7-c33d6547536f_活动报名列表_null.xlsx\",\"code\":0}', 0, NULL, '2020-02-21 20:08:05');
INSERT INTO `sys_oper_log` VALUES (874, '活动报名', 5, 'com.pepper.project.cm.activity.controller.ActivityApplyController.export()', 'POST', 1, 'community2', '社区管理员', '/cm/activity/apply/export', '127.0.0.1', '内网IP', '{\"activityId\":[\"4\"],\"status\":[\"\"]}', '{\"msg\":\"4c7a6dd1-da2f-4e30-983b-3f7d82c6712d_活动报名列表_null.xlsx\",\"code\":0}', 0, NULL, '2020-02-21 20:08:23');
INSERT INTO `sys_oper_log` VALUES (875, '活动', 1, 'com.pepper.project.pm.activity.controller.ActivityPmController.addSave()', 'POST', 1, 'property1', '物业管理员', '/pm/activity/add', '127.0.0.1', '内网IP', '{\"title\":[\"property1 物业的大活动那个\"],\"content\":[\"<p>property1 物业的大活动那个<br></p>\"],\"status\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-21 20:40:27');
INSERT INTO `sys_oper_log` VALUES (876, '菜单管理', 1, 'com.pepper.project.system.menu.controller.MenuController.addSave()', 'POST', 1, 'admin', '超级管理员', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"1121\"],\"menuType\":[\"F\"],\"menuName\":[\"物业活动报名列表导出\"],\"url\":[\"\"],\"target\":[\"menuItem\"],\"perms\":[\"pm:activity:export\"],\"orderNum\":[\"5\"],\"icon\":[\"\"],\"visible\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-21 20:48:19');
INSERT INTO `sys_oper_log` VALUES (877, '活动', 1, 'com.pepper.project.pm.activity.controller.ActivityApplyPmController.addSave()', 'POST', 1, 'property1', '物业管理员', '/pm/activity/apply/add', '127.0.0.1', '内网IP', '{\"userId\":[\"10000001\"],\"activityId\":[\"4\"],\"userMobile\":[\"14567890987\"],\"status\":[\"0\"]}', 'null', 1, '当前选择的报名的活动已下架！', '2020-02-21 21:14:26');
INSERT INTO `sys_oper_log` VALUES (878, '活动', 1, 'com.pepper.project.pm.activity.controller.ActivityApplyPmController.addSave()', 'POST', 1, 'property1', '物业管理员', '/pm/activity/apply/add', '127.0.0.1', '内网IP', '{\"userId\":[\"10000001\"],\"activityId\":[\"2\"],\"userMobile\":[\"14567890987\"],\"status\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-21 21:14:47');
INSERT INTO `sys_oper_log` VALUES (879, '活动', 1, 'com.pepper.project.pm.activity.controller.ActivityApplyPmController.addSave()', 'POST', 1, 'admin', '超级管理员', '/pm/activity/apply/add', '127.0.0.1', '内网IP', '{\"userId\":[\"10000001\"],\"activityId\":[\"1\"],\"userMobile\":[\"2132423423\"],\"status\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-21 21:15:57');
INSERT INTO `sys_oper_log` VALUES (880, '活动', 1, 'com.pepper.project.pm.activity.controller.ActivityApplyPmController.addSave()', 'POST', 1, 'admin', '超级管理员', '/pm/activity/apply/add', '127.0.0.1', '内网IP', '{\"userId\":[\"10000001\"],\"activityId\":[\"1\"],\"userMobile\":[\"1231232423\"],\"status\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-21 21:16:06');
INSERT INTO `sys_oper_log` VALUES (881, '活动报名', 5, 'com.pepper.project.pm.activity.controller.ActivityApplyPmController.export()', 'POST', 1, 'admin', '超级管理员', '/pm/activity/apply/export', '127.0.0.1', '内网IP', '{\"activityId\":[\"1\"],\"status\":[\"\"]}', '{\"msg\":\"2b32689e-3792-4aea-a36e-8e36005e84ed_活动报名列表_null.xlsx\",\"code\":0}', 0, NULL, '2020-02-21 21:16:30');
INSERT INTO `sys_oper_log` VALUES (882, '活动报名', 5, 'com.pepper.project.pm.activity.controller.ActivityApplyPmController.export()', 'POST', 1, 'admin', '超级管理员', '/pm/activity/apply/export', '127.0.0.1', '内网IP', '{\"activityId\":[\"2\"],\"status\":[\"\"]}', '{\"msg\":\"22483e95-e349-4409-bac6-3e24a663c965_活动报名列表_null.xlsx\",\"code\":0}', 0, NULL, '2020-02-21 21:16:53');
INSERT INTO `sys_oper_log` VALUES (883, '角色管理', 2, 'com.pepper.project.system.role.controller.RoleController.editSave()', 'POST', 1, 'admin', '超级管理员', '/system/role/edit', '127.0.0.1', '内网IP', '{\"roleId\":[\"106\"],\"roleName\":[\"物业管理员\"],\"roleKey\":[\"propertyAdmin\"],\"roleSort\":[\"9\"],\"status\":[\"0\"],\"remark\":[\"医院管理员，不允许删除\"],\"menuIds\":[\"1115,1116,1117,1119,1121,1124,1126,1125,1127,1197,1136,1137,1139,1138,1140,1122,1132,1133,1134,1135,1123,1128,1129,1130,1131\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-21 21:18:52');
INSERT INTO `sys_oper_log` VALUES (884, '物业', 2, 'com.pepper.project.pm.property.controller.PropertyController.editSave()', 'POST', 1, 'property1', '物业管理员', '/pm/property/edit', '127.0.0.1', '内网IP', '{\"id\":[\"4\"],\"propertyName\":[\"property1物业\"],\"introduction\":[\"这是一个物业！\"],\"areaId\":[\"4\"],\"status\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-21 21:19:15');
INSERT INTO `sys_oper_log` VALUES (885, '物业通知', 1, 'com.pepper.project.pm.notice.controller.PmNoticeController.addSave()', 'POST', 1, 'property1', '物业管理员', '/pm/notice/add', '127.0.0.1', '内网IP', '{\"title\":[\"111222122  property1\"],\"content\":[\"111222122  property1\"],\"status\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-21 21:32:56');
INSERT INTO `sys_oper_log` VALUES (886, '物业通知', 2, 'com.pepper.project.pm.notice.controller.PmNoticeController.editSave()', 'POST', 1, 'property1', '物业管理员', '/pm/notice/edit', '127.0.0.1', '内网IP', '{\"id\":[\"2\"],\"title\":[\"111222122  property1\"],\"content\":[\"111222122  property12323232\"],\"status\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-21 21:35:26');
INSERT INTO `sys_oper_log` VALUES (887, '物业留言', 1, 'com.pepper.project.pm.note.controller.NotePmController.addSave()', 'POST', 1, 'property1', '物业管理员', '/pm/note/add', '127.0.0.1', '内网IP', '{\"userId\":[\"1234444\"],\"content\":[\"11111111\"],\"status\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-21 21:43:08');
INSERT INTO `sys_oper_log` VALUES (888, '物业留言', 2, 'com.pepper.project.pm.note.controller.NotePmController.editSave()', 'POST', 1, 'property1', '物业管理员', '/pm/note/edit', '127.0.0.1', '内网IP', '{\"id\":[\"2\"],\"userId\":[\"10000001\"],\"content\":[\"11111111\"],\"status\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-21 21:43:15');
INSERT INTO `sys_oper_log` VALUES (889, '物业留言', 2, 'com.pepper.project.pm.note.controller.NotePmController.editSave()', 'POST', 1, 'property1', '物业管理员', '/pm/note/edit', '127.0.0.1', '内网IP', '{\"id\":[\"2\"],\"userId\":[\"10000001\"],\"content\":[\"11111111\"],\"status\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-21 21:45:24');
INSERT INTO `sys_oper_log` VALUES (890, '菜单管理', 2, 'com.pepper.project.system.menu.controller.MenuController.editSave()', 'POST', 1, 'admin', '超级管理员', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"1129\"],\"parentId\":[\"1123\"],\"menuType\":[\"F\"],\"menuName\":[\"活动指南新增\"],\"url\":[\"#\"],\"target\":[\"menuItem\"],\"perms\":[\"pm:guide:add\"],\"orderNum\":[\"2\"],\"icon\":[\"#\"],\"visible\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-21 22:08:34');
INSERT INTO `sys_oper_log` VALUES (891, '办事指南', 1, 'com.pepper.project.pm.guide.controller.GuidePmController.addSave()', 'POST', 1, 'property1', '物业管理员', '/pm/guide/add', '127.0.0.1', '内网IP', '{\"title\":[\"121221212112212\"],\"content\":[\"<p>12211221212121</p>\"],\"status\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-21 22:09:01');
INSERT INTO `sys_oper_log` VALUES (892, '办事指南', 2, 'com.pepper.project.pm.guide.controller.GuidePmController.editSave()', 'POST', 1, 'property1', '物业管理员', '/pm/guide/edit', '127.0.0.1', '内网IP', '{\"id\":[\"2\"],\"title\":[\"121221212112212\"],\"content\":[\"<p>1221122121212123ewweewew</p>\"],\"status\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-21 22:09:11');
INSERT INTO `sys_oper_log` VALUES (893, '办事指南', 2, 'com.pepper.project.pm.guide.controller.GuidePmController.editSave()', 'POST', 1, 'property1', '物业管理员', '/pm/guide/edit', '127.0.0.1', '内网IP', '{\"id\":[\"2\"],\"title\":[\"121221212112212111111111\"],\"content\":[\"<p>1221122121212123ewweewew</p>\"],\"status\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-21 22:09:18');
INSERT INTO `sys_oper_log` VALUES (894, '社区指南', 1, 'com.pepper.project.cm.guide.controller.GuideController.addSave()', 'POST', 1, 'community2', '社区管理员', '/cm/guide/add', '127.0.0.1', '内网IP', '{\"title\":[\"121122\"],\"content\":[\"<p>1221212121</p>\"],\"communityId\":[\"1\"],\"status\":[\"0\"]}', '{\"msg\":\"非社区业务系统用户 无法添加社区指南\",\"code\":500}', 0, NULL, '2020-02-21 22:20:32');
INSERT INTO `sys_oper_log` VALUES (895, '社区指南', 1, 'com.pepper.project.cm.guide.controller.GuideController.addSave()', 'POST', 1, 'community2', '社区管理员', '/cm/guide/add', '127.0.0.1', '内网IP', '{\"title\":[\"community12211212221\"],\"content\":[\"<p>community12211212221<br></p>\"],\"status\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-21 22:22:37');
INSERT INTO `sys_oper_log` VALUES (896, '社区指南', 2, 'com.pepper.project.cm.guide.controller.GuideController.editSave()', 'POST', 1, 'community2', '社区管理员', '/cm/guide/edit', '127.0.0.1', '内网IP', '{\"id\":[\"5\"],\"title\":[\"community12211212221\"],\"content\":[\"<p>community12211212221dd&nbsp; &nbsp;ddddd<br></p>\"],\"status\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-21 22:22:45');
INSERT INTO `sys_oper_log` VALUES (897, '医生管理', 1, 'com.pepper.project.ch.doctor.controller.DoctorController.addSave()', 'POST', 1, 'hospital1', '医院管理员', '/ch/doctor/add', '127.0.0.1', '内网IP', '{\"doctorCode\":[\"1000\"],\"doctorName\":[\"1111111\"],\"majorField\":[\"11111\"],\"doctorType\":[\"1\"],\"status\":[\"0\"]}', 'null', 1, '\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'ID\' doesn\'t have a default value\r\n### The error may involve com.pepper.project.ch.doctor.mapper.DoctorMapper.insertDoctor-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into ch_doctor (    doctor_name,      doctor_code,      major_field,      doctor_type,      hospital_id,      status,      create_by,     update_by,    create_time,   update_time   )values(    ?,      ?,      ?,      ?,     ?,      ?,      ?,     ?,    sysdate(),   sysdate()   )\r\n### Cause: java.sql.SQLException: Field \'ID\' doesn\'t have a default value\n; Field \'ID\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'ID\' doesn\'t have a default value', '2020-02-21 22:45:32');
INSERT INTO `sys_oper_log` VALUES (898, '医生管理', 1, 'com.pepper.project.ch.doctor.controller.DoctorController.addSave()', 'POST', 1, 'hospital1', '医院管理员', '/ch/doctor/add', '127.0.0.1', '内网IP', '{\"doctorCode\":[\"1000\"],\"doctorName\":[\"1111111\"],\"majorField\":[\"11111\"],\"doctorType\":[\"1\"],\"status\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-21 22:46:33');
INSERT INTO `sys_oper_log` VALUES (899, '医院介绍', 1, 'com.pepper.project.ch.appointment.controller.AppointmentController.addSave()', 'POST', 1, 'hospital1', '医院管理员', '/ch/appointment/add', '127.0.0.1', '内网IP', '{\"userId\":[\"10000001\"],\"medicalProjectId\":[\"2\"],\"appointmentTimeStr\":[\"2020-02-24 00:00:00\"],\"appointmentName\":[\"1111\"],\"appointmentPhone\":[\"1111\"],\"status\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-23 13:12:01');
INSERT INTO `sys_oper_log` VALUES (900, '医院介绍', 2, 'com.pepper.project.ch.hospital.controller.HospitalController.editSave()', 'POST', 1, 'admin', '超级管理员', '/ch/hospital/edit', '127.0.0.1', '内网IP', '{\"id\":[\"13\"],\"hosName\":[\"hospital3医院\"],\"introduction\":[\"[object Object]\"],\"communityIds\":[\"3\"],\"areaId\":[\"3\"],\"status\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-23 13:18:12');
INSERT INTO `sys_oper_log` VALUES (901, '医院介绍', 2, 'com.pepper.project.ch.hospital.controller.HospitalController.editSave()', 'POST', 1, 'admin', '超级管理员', '/ch/hospital/edit', '127.0.0.1', '内网IP', '{\"id\":[\"13\"],\"hosName\":[\"hospital3医院\"],\"introduction\":[\"[object Object]\"],\"communityIds\":[\"3\"],\"areaId\":[\"3\"],\"status\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-23 13:18:22');
INSERT INTO `sys_oper_log` VALUES (902, '医院介绍', 2, 'com.pepper.project.ch.hospital.controller.HospitalController.editSave()', 'POST', 1, 'admin', '超级管理员', '/ch/hospital/edit', '127.0.0.1', '内网IP', '{\"id\":[\"13\"],\"hosName\":[\"hospital3医院\"],\"introduction\":[\"[object Object]\"],\"communityIds\":[\"3\",\"5\",\"6\",\"7\",\"8\"],\"areaId\":[\"3\"],\"status\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-23 13:25:30');
INSERT INTO `sys_oper_log` VALUES (903, '医院介绍', 2, 'com.pepper.project.ch.hospital.controller.HospitalController.editSave()', 'POST', 1, 'hospital1', '医院管理员', '/ch/hospital/edit', '127.0.0.1', '内网IP', '{\"id\":[\"11\"],\"hosName\":[\"hospital1医院\"],\"introduction\":[\"[object Object]\"],\"communityIds\":[\"3\",\"4\"],\"areaId\":[\"5\"],\"status\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-23 13:28:10');
INSERT INTO `sys_oper_log` VALUES (904, '医院介绍', 2, 'com.pepper.project.ch.hospital.controller.HospitalController.editSave()', 'POST', 1, 'hospital1', '医院管理员', '/ch/hospital/edit', '127.0.0.1', '内网IP', '{\"id\":[\"11\"],\"hosName\":[\"hospital1医院\"],\"introduction\":[\"[object Object]\"],\"communityIds\":[\"3\",\"4\"],\"areaId\":[\"5\"],\"status\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-23 13:28:19');
INSERT INTO `sys_oper_log` VALUES (905, '医院介绍', 2, 'com.pepper.project.ch.hospital.controller.HospitalController.editSave()', 'POST', 1, 'hospital1', '医院管理员', '/ch/hospital/edit', '127.0.0.1', '内网IP', '{\"id\":[\"11\"],\"hosName\":[\"hospital1医院\"],\"introduction\":[\"111222\"],\"communityIds\":[\"3\",\"4\"],\"areaId\":[\"5\"],\"status\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-23 13:31:47');
INSERT INTO `sys_oper_log` VALUES (906, '医疗项目', 1, 'com.pepper.project.ch.medical.controller.MedicalController.addSave()', 'POST', 1, 'hospital1', '医院管理员', '/ch/medical/add', '127.0.0.1', '内网IP', '{\"name\":[\"专治各种疑难杂症\"],\"serviceContent\":[\"专治各种疑难杂症\"],\"price\":[\"12\"],\"status\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-02-23 13:32:18');

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
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`post_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '岗位信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_post
-- ----------------------------
INSERT INTO `sys_post` VALUES (1, 'ceo', '董事长', 1, '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_post` VALUES (2, 'se', '项目经理', 2, '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_post` VALUES (3, 'hr', '人力资源', 3, '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_post` VALUES (4, 'user', '普通员工', 4, '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `role_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `role_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '角色名称',
  `role_key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '角色权限字符串',
  `role_sort` int(4) NOT NULL COMMENT '显示顺序',
  `data_scope` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '1' COMMENT '数据范围（1：全部数据权限 2：自定数据权限 3：本部门数据权限 4：本部门及以下数据权限）',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '角色状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`role_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 109 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '角色信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES (1, '管理员', 'admin', 1, '1', '0', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '管理员');
INSERT INTO `sys_role` VALUES (2, '普通角色', 'common', 2, '2', '0', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '普通角色');
INSERT INTO `sys_role` VALUES (100, '运维监控', 'monitor', 3, '1', '0', '0', 'admin', '2020-02-02 11:39:22', '', NULL, NULL);
INSERT INTO `sys_role` VALUES (101, '社区总管理员', 'communityBigAdmin', 4, '1', '0', '0', 'admin', '2020-02-19 20:35:29', 'admin', '2020-02-21 18:08:13', '社区总管理员');
INSERT INTO `sys_role` VALUES (102, '医院总管理员', 'hospitalBigAdmin', 5, '1', '0', '0', 'admin', '2020-02-19 20:37:24', 'admin', '2020-02-21 18:08:31', '物业总管理员');
INSERT INTO `sys_role` VALUES (103, '物业总管理员', 'propertyBigAdmin', 6, '1', '0', '0', 'admin', '2020-02-19 20:42:30', 'admin', '2020-02-21 18:08:35', '医院总管理员');
INSERT INTO `sys_role` VALUES (104, '社区管理员', 'communityAdmin', 7, '1', '0', '0', 'admin', '2020-02-19 20:43:13', 'admin', '2020-02-21 20:07:46', '社区管理员，不允许删除');
INSERT INTO `sys_role` VALUES (105, '医院管理员', 'hospitalAdmin', 8, '1', '0', '0', 'admin', '2020-02-19 20:43:47', 'admin', '2020-02-21 18:09:50', '物业管理员，不允许删除');
INSERT INTO `sys_role` VALUES (106, '物业管理员', 'propertyAdmin', 9, '1', '0', '0', 'admin', '2020-02-19 20:44:53', 'admin', '2020-02-21 21:18:52', '医院管理员，不允许删除');
INSERT INTO `sys_role` VALUES (107, '客户端登陆', 'client', 10, '1', '0', '0', 'admin', '2020-02-21 09:54:50', 'admin', '2020-02-21 18:08:55', '客户端登陆，不允许删除');
INSERT INTO `sys_role` VALUES (108, '1111', '1111', 111111, '1', '0', '2', 'admin', '2020-02-21 13:53:19', '', NULL, '1');

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
INSERT INTO `sys_role_menu` VALUES (2, 1061);
INSERT INTO `sys_role_menu` VALUES (100, 2);
INSERT INTO `sys_role_menu` VALUES (100, 109);
INSERT INTO `sys_role_menu` VALUES (100, 110);
INSERT INTO `sys_role_menu` VALUES (100, 111);
INSERT INTO `sys_role_menu` VALUES (100, 112);
INSERT INTO `sys_role_menu` VALUES (100, 1047);
INSERT INTO `sys_role_menu` VALUES (100, 1048);
INSERT INTO `sys_role_menu` VALUES (100, 1049);
INSERT INTO `sys_role_menu` VALUES (100, 1050);
INSERT INTO `sys_role_menu` VALUES (100, 1051);
INSERT INTO `sys_role_menu` VALUES (100, 1052);
INSERT INTO `sys_role_menu` VALUES (100, 1053);
INSERT INTO `sys_role_menu` VALUES (100, 1054);
INSERT INTO `sys_role_menu` VALUES (100, 1055);
INSERT INTO `sys_role_menu` VALUES (100, 1056);
INSERT INTO `sys_role_menu` VALUES (101, 1094);
INSERT INTO `sys_role_menu` VALUES (101, 1095);
INSERT INTO `sys_role_menu` VALUES (101, 1096);
INSERT INTO `sys_role_menu` VALUES (101, 1097);
INSERT INTO `sys_role_menu` VALUES (101, 1098);
INSERT INTO `sys_role_menu` VALUES (101, 1099);
INSERT INTO `sys_role_menu` VALUES (102, 1171);
INSERT INTO `sys_role_menu` VALUES (102, 1172);
INSERT INTO `sys_role_menu` VALUES (102, 1173);
INSERT INTO `sys_role_menu` VALUES (102, 1174);
INSERT INTO `sys_role_menu` VALUES (102, 1175);
INSERT INTO `sys_role_menu` VALUES (102, 1176);
INSERT INTO `sys_role_menu` VALUES (102, 1177);
INSERT INTO `sys_role_menu` VALUES (102, 1178);
INSERT INTO `sys_role_menu` VALUES (102, 1179);
INSERT INTO `sys_role_menu` VALUES (102, 1180);
INSERT INTO `sys_role_menu` VALUES (102, 1181);
INSERT INTO `sys_role_menu` VALUES (102, 1182);
INSERT INTO `sys_role_menu` VALUES (102, 1183);
INSERT INTO `sys_role_menu` VALUES (102, 1184);
INSERT INTO `sys_role_menu` VALUES (102, 1185);
INSERT INTO `sys_role_menu` VALUES (102, 1186);
INSERT INTO `sys_role_menu` VALUES (102, 1187);
INSERT INTO `sys_role_menu` VALUES (102, 1188);
INSERT INTO `sys_role_menu` VALUES (102, 1189);
INSERT INTO `sys_role_menu` VALUES (102, 1190);
INSERT INTO `sys_role_menu` VALUES (102, 1191);
INSERT INTO `sys_role_menu` VALUES (103, 1115);
INSERT INTO `sys_role_menu` VALUES (103, 1116);
INSERT INTO `sys_role_menu` VALUES (103, 1117);
INSERT INTO `sys_role_menu` VALUES (103, 1118);
INSERT INTO `sys_role_menu` VALUES (103, 1119);
INSERT INTO `sys_role_menu` VALUES (103, 1120);
INSERT INTO `sys_role_menu` VALUES (103, 1121);
INSERT INTO `sys_role_menu` VALUES (103, 1122);
INSERT INTO `sys_role_menu` VALUES (103, 1123);
INSERT INTO `sys_role_menu` VALUES (103, 1124);
INSERT INTO `sys_role_menu` VALUES (103, 1125);
INSERT INTO `sys_role_menu` VALUES (103, 1126);
INSERT INTO `sys_role_menu` VALUES (103, 1127);
INSERT INTO `sys_role_menu` VALUES (103, 1128);
INSERT INTO `sys_role_menu` VALUES (103, 1129);
INSERT INTO `sys_role_menu` VALUES (103, 1130);
INSERT INTO `sys_role_menu` VALUES (103, 1131);
INSERT INTO `sys_role_menu` VALUES (103, 1132);
INSERT INTO `sys_role_menu` VALUES (103, 1133);
INSERT INTO `sys_role_menu` VALUES (103, 1134);
INSERT INTO `sys_role_menu` VALUES (103, 1135);
INSERT INTO `sys_role_menu` VALUES (103, 1136);
INSERT INTO `sys_role_menu` VALUES (103, 1137);
INSERT INTO `sys_role_menu` VALUES (103, 1138);
INSERT INTO `sys_role_menu` VALUES (103, 1139);
INSERT INTO `sys_role_menu` VALUES (103, 1140);
INSERT INTO `sys_role_menu` VALUES (104, 1094);
INSERT INTO `sys_role_menu` VALUES (104, 1095);
INSERT INTO `sys_role_menu` VALUES (104, 1096);
INSERT INTO `sys_role_menu` VALUES (104, 1098);
INSERT INTO `sys_role_menu` VALUES (104, 1100);
INSERT INTO `sys_role_menu` VALUES (104, 1101);
INSERT INTO `sys_role_menu` VALUES (104, 1102);
INSERT INTO `sys_role_menu` VALUES (104, 1103);
INSERT INTO `sys_role_menu` VALUES (104, 1104);
INSERT INTO `sys_role_menu` VALUES (104, 1107);
INSERT INTO `sys_role_menu` VALUES (104, 1108);
INSERT INTO `sys_role_menu` VALUES (104, 1109);
INSERT INTO `sys_role_menu` VALUES (104, 1110);
INSERT INTO `sys_role_menu` VALUES (104, 1111);
INSERT INTO `sys_role_menu` VALUES (104, 1112);
INSERT INTO `sys_role_menu` VALUES (104, 1113);
INSERT INTO `sys_role_menu` VALUES (104, 1114);
INSERT INTO `sys_role_menu` VALUES (104, 1196);
INSERT INTO `sys_role_menu` VALUES (105, 1171);
INSERT INTO `sys_role_menu` VALUES (105, 1172);
INSERT INTO `sys_role_menu` VALUES (105, 1173);
INSERT INTO `sys_role_menu` VALUES (105, 1174);
INSERT INTO `sys_role_menu` VALUES (105, 1175);
INSERT INTO `sys_role_menu` VALUES (105, 1176);
INSERT INTO `sys_role_menu` VALUES (105, 1178);
INSERT INTO `sys_role_menu` VALUES (105, 1180);
INSERT INTO `sys_role_menu` VALUES (105, 1181);
INSERT INTO `sys_role_menu` VALUES (105, 1182);
INSERT INTO `sys_role_menu` VALUES (105, 1183);
INSERT INTO `sys_role_menu` VALUES (105, 1184);
INSERT INTO `sys_role_menu` VALUES (105, 1185);
INSERT INTO `sys_role_menu` VALUES (105, 1186);
INSERT INTO `sys_role_menu` VALUES (105, 1187);
INSERT INTO `sys_role_menu` VALUES (105, 1188);
INSERT INTO `sys_role_menu` VALUES (105, 1189);
INSERT INTO `sys_role_menu` VALUES (105, 1190);
INSERT INTO `sys_role_menu` VALUES (105, 1191);
INSERT INTO `sys_role_menu` VALUES (106, 1115);
INSERT INTO `sys_role_menu` VALUES (106, 1116);
INSERT INTO `sys_role_menu` VALUES (106, 1117);
INSERT INTO `sys_role_menu` VALUES (106, 1119);
INSERT INTO `sys_role_menu` VALUES (106, 1121);
INSERT INTO `sys_role_menu` VALUES (106, 1122);
INSERT INTO `sys_role_menu` VALUES (106, 1123);
INSERT INTO `sys_role_menu` VALUES (106, 1124);
INSERT INTO `sys_role_menu` VALUES (106, 1125);
INSERT INTO `sys_role_menu` VALUES (106, 1126);
INSERT INTO `sys_role_menu` VALUES (106, 1127);
INSERT INTO `sys_role_menu` VALUES (106, 1128);
INSERT INTO `sys_role_menu` VALUES (106, 1129);
INSERT INTO `sys_role_menu` VALUES (106, 1130);
INSERT INTO `sys_role_menu` VALUES (106, 1131);
INSERT INTO `sys_role_menu` VALUES (106, 1132);
INSERT INTO `sys_role_menu` VALUES (106, 1133);
INSERT INTO `sys_role_menu` VALUES (106, 1134);
INSERT INTO `sys_role_menu` VALUES (106, 1135);
INSERT INTO `sys_role_menu` VALUES (106, 1136);
INSERT INTO `sys_role_menu` VALUES (106, 1137);
INSERT INTO `sys_role_menu` VALUES (106, 1138);
INSERT INTO `sys_role_menu` VALUES (106, 1139);
INSERT INTO `sys_role_menu` VALUES (106, 1140);
INSERT INTO `sys_role_menu` VALUES (106, 1197);

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `user_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `dept_id` bigint(20) DEFAULT NULL COMMENT '部门ID',
  `login_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '登录账号',
  `user_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户昵称',
  `user_type` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '00' COMMENT '用户类型（00系统用户）',
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '用户邮箱',
  `phonenumber` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '手机号码',
  `sex` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '0' COMMENT '用户性别（0男 1女 2未知）',
  `avatar` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '头像路径',
  `password` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '密码',
  `salt` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '盐加密',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '0' COMMENT '帐号状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `login_ip` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '最后登陆IP',
  `login_date` datetime(0) DEFAULT NULL COMMENT '最后登陆时间',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
  `merchant_flag` int(11) DEFAULT 0 COMMENT '0-管理员（默认值），1-商户',
  `merchant_Id` int(11) DEFAULT 0 COMMENT '商户id',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 122 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (1, 103, 'admin', '韩结涛', '00', 'ry@163.com', '15888888888', '1', '/profile/avatar/2020/02/17/1d3120d56f3e28a7012ff5b05a36bfd7.png', '29c67a30398638269fe600f73a054934', '111111', '0', '0', '127.0.0.1', '2020-02-23 13:13:12', 'admin', '2018-03-16 11:33:00', 'admin', '2020-02-23 13:13:11', '管理员', 0, 0);
INSERT INTO `sys_user` VALUES (2, 105, 'ry', '若依1', '00', 'ry@qq.com', '15666666666', '1', '', 'd1f37b658aa10ee2ea1662c9251d95e7', '546af6', '0', '2', '127.0.0.1', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', 'admin', '2020-02-02 11:35:12', '测试员', 0, 0);
INSERT INTO `sys_user` VALUES (100, 103, 'hanjietao', 'hanjietao', '00', 'hjtxyr@163.com', '18505561893', '0', '', '346e50ec70cf805a5c2449247fac723a', '224ac0', '0', '0', '127.0.0.1', '2020-02-15 23:20:23', 'admin', '2020-02-02 11:40:09', 'admin', '2020-02-19 18:05:07', 'test  menu', 0, 0);
INSERT INTO `sys_user` VALUES (101, 103, 'hanjietao1', 'hanjietao1', '00', 'hanjietao@123.com', '18900099990', '0', '', 'bd10b2b1ce65eb730113afe5fd12acd1', 'c54195', '0', '0', '', NULL, 'admin', '2020-02-15 16:36:06', 'admin', '2020-02-19 20:31:29', '', 0, 0);
INSERT INTO `sys_user` VALUES (102, 104, 'hant', 'hant', '00', 'hjyxyr@163.com', '13456789090', '0', '', '9c110ba03dd8ffc512f3805bb2eafe4f', '929eac', '0', '0', '127.0.0.1', '2020-02-21 11:15:28', 'admin', '2020-02-20 20:30:00', '', '2020-02-21 11:15:28', NULL, 1, 1);
INSERT INTO `sys_user` VALUES (103, 111, 'client', 'client', '00', 'hjyxyr1@163.com', '19800000000', '0', '', '2f9bd8d74b365498426ff6bfd73d52fa', '44cf19', '0', '0', '127.0.0.1', '2020-02-21 09:57:13', 'admin', '2020-02-21 09:55:57', '', '2020-02-21 09:57:13', 'client', 0, 0);
INSERT INTO `sys_user` VALUES (104, 103, 'test1', 'test1', '00', 'hjyxy2r@163.com', '13456789012', '0', '', 'b429635739fd4b9def2f505711046a62', '765dad', '0', '2', '', NULL, 'admin', '2020-02-21 15:52:33', '', NULL, NULL, 0, 0);
INSERT INTO `sys_user` VALUES (105, 103, 'test2', 'test2', '00', 'hjyxyrtest2@163.com', '13456789096', '0', '', '6a6590ccb582e300169632cb9962dec6', 'b083e3', '0', '2', '127.0.0.1', '2020-02-21 16:07:24', 'admin', '2020-02-21 16:07:12', '', '2020-02-21 16:07:24', NULL, 0, 7);
INSERT INTO `sys_user` VALUES (106, 104, 'ctest3', 'ctest3', '00', 'ctest3@163.com', '13456789093', '0', '', '8c2783e475609804bc7d5e3ba52cca4f', '8e356b', '0', '2', '127.0.0.1', '2020-02-21 16:25:47', 'admin', '2020-02-21 16:10:41', 'admin', '2020-02-21 16:25:46', '', 1, 8);
INSERT INTO `sys_user` VALUES (107, 103, 'htest3', 'htest3', '00', 'htest3@163.com', '13456789034', '0', '', 'ebb6c120214a2ee180d85aefe33cda95', 'eaf15f', '0', '2', '127.0.0.1', '2020-02-21 16:14:04', 'admin', '2020-02-21 16:13:07', '', '2020-02-21 16:14:04', NULL, 2, 0);
INSERT INTO `sys_user` VALUES (108, 111, 'htest4', 'htest4', '00', 'htest4@163.com', '19800000011', '0', '', 'b7c36c7551e6573b55f27c94776e9ad6', '28b276', '0', '2', '127.0.0.1', '2020-02-21 16:22:43', 'admin', '2020-02-21 16:22:34', '', '2020-02-21 16:22:42', NULL, 2, 10);
INSERT INTO `sys_user` VALUES (109, 110, 'ptest3', 'ptest3', '00', 'ptest3@163.com', '13456789095', '0', '', '45450dfe46fd0adccbde3bc281ed899b', '36b914', '0', '2', '127.0.0.1', '2020-02-21 16:27:10', 'admin', '2020-02-21 16:26:59', '', '2020-02-21 16:27:10', NULL, 3, 3);
INSERT INTO `sys_user` VALUES (110, 104, 'ctest5', 'ctest5', '00', 'ctest5@163.com', '13456789125', '0', '', '6d8c3310339b879a97ad17b6b830fad4', 'dc4598', '0', '2', '127.0.0.1', '2020-02-21 16:42:26', 'admin', '2020-02-21 16:42:15', '', '2020-02-21 16:42:25', NULL, 1, 9);
INSERT INTO `sys_user` VALUES (111, 104, 'ctest6', 'ctest6', '00', 'ctest6@163.com', '13456423451', '0', '', '50e2d2dbec59ebc40971978efb81c0b3', 'ef53b0', '0', '2', '127.0.0.1', '2020-02-21 17:30:59', 'admin', '2020-02-21 16:48:23', 'admin', '2020-02-21 17:31:48', '', 1, 10);
INSERT INTO `sys_user` VALUES (112, 103, 'chaoguan', 'chaoguan', '00', 'chaoguan@163.com', '13456712345', '0', '', '78ae972193a09188be35e897b9e5d365', '9b9bfc', '0', '2', '127.0.0.1', '2020-02-21 17:33:59', 'admin', '2020-02-21 17:33:46', '', '2020-02-21 17:33:59', NULL, 0, 0);
INSERT INTO `sys_user` VALUES (113, 103, 'chaog1', 'chaog1', '00', 'chaog1r@163.com', '13456719090', '0', '', '1642ed68c638d0875f586b62587f8a6f', 'a041c0', '0', '2', '127.0.0.1', '2020-02-21 17:44:10', 'admin', '2020-02-21 17:42:32', '', '2020-02-21 17:44:10', NULL, 0, 0);
INSERT INTO `sys_user` VALUES (114, 103, 'chaoji', 'chaoji', '00', 'chaoji@163.com', '13456781090', '0', '', '5868e106c2c522b7b7fce3e3cfb1e70e', '1b3128', '0', '2', '127.0.0.1', '2020-02-21 17:50:33', 'admin', '2020-02-21 17:50:22', '', '2020-02-21 17:50:33', NULL, 0, 0);
INSERT INTO `sys_user` VALUES (115, 104, 'community1', 'community1', '00', 'community1@163.com', '18900000001', '0', '', 'f9896b8a18204b5e43a65d2c769f9ab1', '4a5188', '0', '0', '', NULL, 'admin', '2020-02-21 18:01:58', '', NULL, NULL, 1, 11);
INSERT INTO `sys_user` VALUES (116, 104, 'community2', 'community2', '00', 'community2@163.com', '18900000002', '0', '', '23d713e128baa298e4dc58549b7c8b17', '2436cb', '0', '0', '127.0.0.1', '2020-02-21 22:11:03', 'admin', '2020-02-21 18:02:45', '', '2020-02-21 22:11:03', NULL, 1, 12);
INSERT INTO `sys_user` VALUES (117, 111, 'hospital1', 'hospital1', '00', 'hospital1@163.com', '19800000003', '0', '', '7ad0a2ca73483f1eeadd68ce4339fd91', '9a273a', '0', '0', '127.0.0.1', '2020-02-23 13:26:10', 'admin', '2020-02-21 18:04:17', '', '2020-02-23 13:26:10', NULL, 2, 11);
INSERT INTO `sys_user` VALUES (118, 111, 'hospital2', 'hospital2', '00', 'hospital2@163.com', '19800000004', '0', '', 'd347e05ec7cd5c3c6e144b61dcac143c', '978846', '0', '0', '', NULL, 'admin', '2020-02-21 18:04:53', '', NULL, NULL, 2, 12);
INSERT INTO `sys_user` VALUES (119, 111, 'hospital3', 'hospital3', '00', 'hospital3@163.com', '19800000006', '0', '', '76139a995bf4757504f925aaee08f0b1', '77b36f', '0', '0', '', NULL, 'admin', '2020-02-21 18:05:26', '', NULL, NULL, 2, 13);
INSERT INTO `sys_user` VALUES (120, 110, 'property1', 'property1', '00', 'property1@163.com', '19800000007', '0', '', '6e4e578c3138bb0a8a8113939ec2ac2d', '750878', '0', '0', '127.0.0.1', '2020-02-21 22:08:50', 'admin', '2020-02-21 18:06:15', '', '2020-02-21 22:08:49', NULL, 3, 4);
INSERT INTO `sys_user` VALUES (121, 110, 'property2', 'property2', '00', 'property2@163.com', '19800000009', '0', '', '8b0144d2f58d8856d9cce14f36d01742', '046286', '0', '0', '', NULL, 'admin', '2020-02-21 18:06:49', '', NULL, NULL, 3, 5);

-- ----------------------------
-- Table structure for sys_user_online
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_online`;
CREATE TABLE `sys_user_online`  (
  `sessionId` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '用户会话id',
  `login_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '登录账号',
  `dept_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '部门名称',
  `ipaddr` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '登录IP地址',
  `login_location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '登录地点',
  `browser` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '浏览器类型',
  `os` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '操作系统',
  `status` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '在线状态on_line在线off_line离线',
  `start_timestamp` datetime(0) DEFAULT NULL COMMENT 'session创建时间',
  `last_access_time` datetime(0) DEFAULT NULL COMMENT 'session最后访问时间',
  `expire_time` int(5) DEFAULT 0 COMMENT '超时时间，单位为分钟',
  PRIMARY KEY (`sessionId`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '在线用户记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_online
-- ----------------------------
INSERT INTO `sys_user_online` VALUES ('84baf412-888c-4255-9d0f-025aca5136e3', 'hospital1', '医院管理员', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', 'on_line', '2020-02-23 13:25:57', '2020-02-23 13:50:17', 1800000);

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
INSERT INTO `sys_user_post` VALUES (100, 4);
INSERT INTO `sys_user_post` VALUES (101, 2);
INSERT INTO `sys_user_post` VALUES (102, 4);
INSERT INTO `sys_user_post` VALUES (103, 4);
INSERT INTO `sys_user_post` VALUES (104, 1);
INSERT INTO `sys_user_post` VALUES (105, 2);
INSERT INTO `sys_user_post` VALUES (106, 2);
INSERT INTO `sys_user_post` VALUES (107, 1);
INSERT INTO `sys_user_post` VALUES (108, 1);
INSERT INTO `sys_user_post` VALUES (109, 2);
INSERT INTO `sys_user_post` VALUES (110, 1);
INSERT INTO `sys_user_post` VALUES (111, 2);
INSERT INTO `sys_user_post` VALUES (112, 1);
INSERT INTO `sys_user_post` VALUES (113, 2);
INSERT INTO `sys_user_post` VALUES (114, 1);
INSERT INTO `sys_user_post` VALUES (115, 4);
INSERT INTO `sys_user_post` VALUES (116, 4);
INSERT INTO `sys_user_post` VALUES (117, 4);
INSERT INTO `sys_user_post` VALUES (118, 4);
INSERT INTO `sys_user_post` VALUES (119, 4);
INSERT INTO `sys_user_post` VALUES (120, 4);
INSERT INTO `sys_user_post` VALUES (121, 4);

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
INSERT INTO `sys_user_role` VALUES (100, 100);
INSERT INTO `sys_user_role` VALUES (101, 1);
INSERT INTO `sys_user_role` VALUES (102, 104);
INSERT INTO `sys_user_role` VALUES (103, 107);
INSERT INTO `sys_user_role` VALUES (104, 104);
INSERT INTO `sys_user_role` VALUES (105, 104);
INSERT INTO `sys_user_role` VALUES (107, 105);
INSERT INTO `sys_user_role` VALUES (108, 105);
INSERT INTO `sys_user_role` VALUES (109, 106);
INSERT INTO `sys_user_role` VALUES (110, 104);
INSERT INTO `sys_user_role` VALUES (111, 104);
INSERT INTO `sys_user_role` VALUES (112, 1);
INSERT INTO `sys_user_role` VALUES (113, 1);
INSERT INTO `sys_user_role` VALUES (114, 1);
INSERT INTO `sys_user_role` VALUES (115, 104);
INSERT INTO `sys_user_role` VALUES (116, 104);
INSERT INTO `sys_user_role` VALUES (117, 105);
INSERT INTO `sys_user_role` VALUES (118, 105);
INSERT INTO `sys_user_role` VALUES (119, 105);
INSERT INTO `sys_user_role` VALUES (120, 106);
INSERT INTO `sys_user_role` VALUES (121, 106);

SET FOREIGN_KEY_CHECKS = 1;
