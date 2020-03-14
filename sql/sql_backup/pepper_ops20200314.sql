/*
 Navicat Premium Data Transfer

 Source Server         : 220-mysql
 Source Server Type    : MySQL
 Source Server Version : 50724
 Source Host           : 49.4.124.220:3306
 Source Schema         : pepper_ops

 Target Server Type    : MySQL
 Target Server Version : 50724
 File Encoding         : 65001

 Date: 14/03/2020 16:52:17
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;


-- ----------------------------
-- Table structure for QRTZ_JOB_DETAILS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_JOB_DETAILS`;
CREATE TABLE `QRTZ_JOB_DETAILS`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `job_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `job_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `description` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `job_class_name` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `is_durable` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `is_nonconcurrent` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `is_update_data` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `requests_recovery` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `job_data` blob,
  PRIMARY KEY (`sched_name`, `job_name`, `job_group`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of QRTZ_JOB_DETAILS
-- ----------------------------
INSERT INTO `QRTZ_JOB_DETAILS` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME1', 'DEFAULT', NULL, 'com.pepper.project.monitor.job.util.QuartzDisallowConcurrentExecution', '0', '1', '0', '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000F5441534B5F50524F5045525449455373720029636F6D2E7065707065722E70726F6A6563742E6D6F6E69746F722E6A6F622E646F6D61696E2E4A6F6200000000000000010200084C000A636F6E63757272656E747400124C6A6176612F6C616E672F537472696E673B4C000E63726F6E45787072657373696F6E71007E00094C000C696E766F6B6554617267657471007E00094C00086A6F6247726F757071007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C00076A6F624E616D6571007E00094C000D6D697366697265506F6C69637971007E00094C000673746174757371007E00097872002A636F6D2E7065707065722E6672616D65776F726B2E7765622E646F6D61696E2E42617365456E7469747900000000000000010200074C0008637265617465427971007E00094C000A63726561746554696D657400104C6A6176612F7574696C2F446174653B4C0006706172616D7371007E00034C000672656D61726B71007E00094C000B73656172636856616C756571007E00094C0008757064617465427971007E00094C000A75706461746554696D6571007E000C787074000561646D696E7372000E6A6176612E7574696C2E44617465686A81014B59741903000078707708000001622CDE29E078707400007070707400013174000E302F3130202A202A202A202A203F74001172795461736B2E72794E6F506172616D7374000744454641554C547372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B02000078700000000000000001740018E7B3BBE7BB9FE9BB98E8AEA4EFBC88E697A0E58F82EFBC8974000133740001317800);
INSERT INTO `QRTZ_JOB_DETAILS` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME2', 'DEFAULT', NULL, 'com.pepper.project.monitor.job.util.QuartzDisallowConcurrentExecution', '0', '1', '0', '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000F5441534B5F50524F5045525449455373720029636F6D2E7065707065722E70726F6A6563742E6D6F6E69746F722E6A6F622E646F6D61696E2E4A6F6200000000000000010200084C000A636F6E63757272656E747400124C6A6176612F6C616E672F537472696E673B4C000E63726F6E45787072657373696F6E71007E00094C000C696E766F6B6554617267657471007E00094C00086A6F6247726F757071007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C00076A6F624E616D6571007E00094C000D6D697366697265506F6C69637971007E00094C000673746174757371007E00097872002A636F6D2E7065707065722E6672616D65776F726B2E7765622E646F6D61696E2E42617365456E7469747900000000000000010200074C0008637265617465427971007E00094C000A63726561746554696D657400104C6A6176612F7574696C2F446174653B4C0006706172616D7371007E00034C000672656D61726B71007E00094C000B73656172636856616C756571007E00094C0008757064617465427971007E00094C000A75706461746554696D6571007E000C787074000561646D696E7372000E6A6176612E7574696C2E44617465686A81014B59741903000078707708000001622CDE29E078707400007070707400013174000E302F3135202A202A202A202A203F74001572795461736B2E7279506172616D7328277279272974000744454641554C547372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B02000078700000000000000002740018E7B3BBE7BB9FE9BB98E8AEA4EFBC88E69C89E58F82EFBC8974000133740001317800);
INSERT INTO `QRTZ_JOB_DETAILS` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME3', 'DEFAULT', NULL, 'com.pepper.project.monitor.job.util.QuartzDisallowConcurrentExecution', '0', '1', '0', '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000F5441534B5F50524F5045525449455373720029636F6D2E7065707065722E70726F6A6563742E6D6F6E69746F722E6A6F622E646F6D61696E2E4A6F6200000000000000010200084C000A636F6E63757272656E747400124C6A6176612F6C616E672F537472696E673B4C000E63726F6E45787072657373696F6E71007E00094C000C696E766F6B6554617267657471007E00094C00086A6F6247726F757071007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C00076A6F624E616D6571007E00094C000D6D697366697265506F6C69637971007E00094C000673746174757371007E00097872002A636F6D2E7065707065722E6672616D65776F726B2E7765622E646F6D61696E2E42617365456E7469747900000000000000010200074C0008637265617465427971007E00094C000A63726561746554696D657400104C6A6176612F7574696C2F446174653B4C0006706172616D7371007E00034C000672656D61726B71007E00094C000B73656172636856616C756571007E00094C0008757064617465427971007E00094C000A75706461746554696D6571007E000C787074000561646D696E7372000E6A6176612E7574696C2E44617465686A81014B59741903000078707708000001622CDE29E078707400007070707400013174000E302F3230202A202A202A202A203F74003872795461736B2E72794D756C7469706C65506172616D7328277279272C20747275652C20323030304C2C203331362E3530442C203130302974000744454641554C547372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B02000078700000000000000003740018E7B3BBE7BB9FE9BB98E8AEA4EFBC88E5A49AE58F82EFBC8974000133740001317800);


-- ----------------------------
-- Table structure for QRTZ_TRIGGERS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_TRIGGERS`;
CREATE TABLE `QRTZ_TRIGGERS`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `job_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `job_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `description` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `next_fire_time` bigint(13) DEFAULT NULL,
  `prev_fire_time` bigint(13) DEFAULT NULL,
  `priority` int(11) DEFAULT NULL,
  `trigger_state` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `trigger_type` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `start_time` bigint(13) NOT NULL,
  `end_time` bigint(13) DEFAULT NULL,
  `calendar_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `misfire_instr` smallint(2) DEFAULT NULL,
  `job_data` blob,
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  INDEX `sched_name`(`sched_name`, `job_name`, `job_group`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of QRTZ_TRIGGERS
-- ----------------------------
INSERT INTO `QRTZ_TRIGGERS` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME1', 'DEFAULT', 'TASK_CLASS_NAME1', 'DEFAULT', NULL, 1584174270000, -1, 5, 'PAUSED', 'CRON', 1584174269000, 0, NULL, 2, '');
INSERT INTO `QRTZ_TRIGGERS` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME2', 'DEFAULT', 'TASK_CLASS_NAME2', 'DEFAULT', NULL, 1584174270000, -1, 5, 'PAUSED', 'CRON', 1584174269000, 0, NULL, 2, '');
INSERT INTO `QRTZ_TRIGGERS` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME3', 'DEFAULT', 'TASK_CLASS_NAME3', 'DEFAULT', NULL, 1584174280000, -1, 5, 'PAUSED', 'CRON', 1584174269000, 0, NULL, 2, '');


-- ----------------------------
-- Table structure for QRTZ_BLOB_TRIGGERS
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_blob_triggers`;
CREATE TABLE `qrtz_blob_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `blob_data` blob,
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `QRTZ_BLOB_TRIGGERS_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `QRTZ_TRIGGERS` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for QRTZ_CALENDARS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_CALENDARS`;
CREATE TABLE `QRTZ_CALENDARS`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `calendar_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `calendar` blob NOT NULL,
  PRIMARY KEY (`sched_name`, `calendar_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for QRTZ_CRON_TRIGGERS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_CRON_TRIGGERS`;
CREATE TABLE `QRTZ_CRON_TRIGGERS`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `cron_expression` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `time_zone_id` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `QRTZ_CRON_TRIGGERS_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `QRTZ_TRIGGERS` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of QRTZ_CRON_TRIGGERS
-- ----------------------------
INSERT INTO `QRTZ_CRON_TRIGGERS` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME1', 'DEFAULT', '0/10 * * * * ?', 'Asia/Shanghai');
INSERT INTO `QRTZ_CRON_TRIGGERS` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME2', 'DEFAULT', '0/15 * * * * ?', 'Asia/Shanghai');
INSERT INTO `QRTZ_CRON_TRIGGERS` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME3', 'DEFAULT', '0/20 * * * * ?', 'Asia/Shanghai');

-- ----------------------------
-- Table structure for QRTZ_FIRED_TRIGGERS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_FIRED_TRIGGERS`;
CREATE TABLE `QRTZ_FIRED_TRIGGERS`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `entry_id` varchar(95) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `instance_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `fired_time` bigint(13) NOT NULL,
  `sched_time` bigint(13) NOT NULL,
  `priority` int(11) NOT NULL,
  `state` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `job_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `job_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `is_nonconcurrent` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `requests_recovery` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`sched_name`, `entry_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;


-- ----------------------------
-- Table structure for QRTZ_LOCKS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_LOCKS`;
CREATE TABLE `QRTZ_LOCKS`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `lock_name` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`sched_name`, `lock_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of QRTZ_LOCKS
-- ----------------------------
INSERT INTO `QRTZ_LOCKS` VALUES ('RuoyiScheduler', 'STATE_ACCESS');
INSERT INTO `QRTZ_LOCKS` VALUES ('RuoyiScheduler', 'TRIGGER_ACCESS');

-- ----------------------------
-- Table structure for QRTZ_PAUSED_TRIGGER_GRPS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_PAUSED_TRIGGER_GRPS`;
CREATE TABLE `QRTZ_PAUSED_TRIGGER_GRPS`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`sched_name`, `trigger_group`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for QRTZ_SCHEDULER_STATE
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_SCHEDULER_STATE`;
CREATE TABLE `QRTZ_SCHEDULER_STATE`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `instance_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `last_checkin_time` bigint(13) NOT NULL,
  `checkin_interval` bigint(13) NOT NULL,
  PRIMARY KEY (`sched_name`, `instance_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of QRTZ_SCHEDULER_STATE
-- ----------------------------
INSERT INTO `QRTZ_SCHEDULER_STATE` VALUES ('RuoyiScheduler', 'ecs-29a31584174269435', 1584175787965, 15000);

-- ----------------------------
-- Table structure for QRTZ_SIMPLE_TRIGGERS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_SIMPLE_TRIGGERS`;
CREATE TABLE `QRTZ_SIMPLE_TRIGGERS`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `repeat_count` bigint(7) NOT NULL,
  `repeat_interval` bigint(12) NOT NULL,
  `times_triggered` bigint(10) NOT NULL,
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `QRTZ_SIMPLE_TRIGGERS_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `QRTZ_TRIGGERS` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for QRTZ_SIMPROP_TRIGGERS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_SIMPROP_TRIGGERS`;
CREATE TABLE `QRTZ_SIMPROP_TRIGGERS`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `str_prop_1` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `str_prop_2` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `str_prop_3` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `int_prop_1` int(11) DEFAULT NULL,
  `int_prop_2` int(11) DEFAULT NULL,
  `long_prop_1` bigint(20) DEFAULT NULL,
  `long_prop_2` bigint(20) DEFAULT NULL,
  `dec_prop_1` decimal(13, 4) DEFAULT NULL,
  `dec_prop_2` decimal(13, 4) DEFAULT NULL,
  `bool_prop_1` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `bool_prop_2` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `QRTZ_SIMPROP_TRIGGERS_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `QRTZ_TRIGGERS` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ch_appointment
-- ----------------------------
DROP TABLE IF EXISTS `ch_appointment`;
CREATE TABLE `ch_appointment`  (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '预约ID',
  `USER_ID` bigint(20) NOT NULL COMMENT '用户id',
  `HOSPITAL_ID` bigint(20) DEFAULT NULL COMMENT '预约医院ID',
  `MEDICAL_PROJECT_ID` int(11) DEFAULT NULL COMMENT '预约服务项目ID',
  `APPOINTMENT_TIME` date DEFAULT NULL COMMENT '预约日期',
  `APPOINTMENT_NAME` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '预约人姓名',
  `APPOINTMENT_PHONE` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL COMMENT '预约人手机号',
  `CANCEL_REASON` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '取消原因',
  `APPOINTMENT_START_TIME` datetime(0) DEFAULT NULL COMMENT '预约时间起始',
  `APPOINTMENT_END_TIME` datetime(0) DEFAULT NULL COMMENT '预约时间结束',
  `APPOINTMENT_REASON` varchar(256) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL COMMENT '预约原因',
  `STATUS` char(1) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL COMMENT '状态 0-正常，1-关闭（取消预约）',
  `CREATE_BY` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '创建人',
  `CREATE_TIME` datetime(0) DEFAULT NULL COMMENT '创建时间',
  `UPDATE_BY` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '更新人',
  `UPDATE_TIME` datetime(0) DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci COMMENT = '预约管理 ' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ch_doctor
-- ----------------------------
DROP TABLE IF EXISTS `ch_doctor`;
CREATE TABLE `ch_doctor`  (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '医生ID',
  `DOCTOR_CODE` int(11) DEFAULT NULL COMMENT '医生ID',
  `DOCTOR_NAME` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '医生名称',
  `MAJOR_FIELD` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '专业方向介绍',
  `DOCTOR_TYPE` int(11) DEFAULT NULL COMMENT '医生类型1-主治医生，2-助理医生，3-实习医生',
  `HOSPITAL_ID` bigint(20) DEFAULT NULL COMMENT '所属医院',
  `STATUS` char(1) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL COMMENT '状态 0-正常，1-关闭',
  `CREATE_BY` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '创建人',
  `CREATE_TIME` datetime(0) DEFAULT NULL COMMENT '创建时间',
  `UPDATE_BY` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '更新人',
  `UPDATE_TIME` datetime(0) DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2000 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci COMMENT = '医生管理 ' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ch_hospital
-- ----------------------------
DROP TABLE IF EXISTS `ch_hospital`;
CREATE TABLE `ch_hospital`  (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '医院ID',
  `HOS_NAME` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '医院名称',
  `HOS_CODE` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '医院英文名',
  `INTRODUCTION` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci COMMENT '医院介绍',
  `COMMUNITY_IDS` varchar(1024) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL COMMENT '服务的社区IDS 社区1，社区2，。。。',
  `AREA_ID` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '所属区域',
  `STATUS` char(1) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL COMMENT '状态 0-正常，1-关闭',
  `CREATE_BY` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '创建人',
  `CREATE_TIME` datetime(0) DEFAULT NULL COMMENT '创建时间',
  `UPDATE_BY` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '更新人',
  `UPDATE_TIME` datetime(0) DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 300000 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci COMMENT = '社区服务服务中心-医院介绍 ' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ch_medical_project
-- ----------------------------
DROP TABLE IF EXISTS `ch_medical_project`;
CREATE TABLE `ch_medical_project`  (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '医疗项目ID',
  `NAME` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '医疗项目名称',
  `SERVICE_CONTENT` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '服务内容',
  `PRICE` decimal(32, 2) DEFAULT NULL COMMENT '收费标准 45',
  `HOSPITAL_ID` bigint(20) DEFAULT NULL COMMENT '医院id',
  `fees` varchar(128) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL COMMENT '收费标准',
  `DELETE_FLAG` varchar(1) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT '0' COMMENT '删除标志 1-已删除，0-未删除',
  `STATUS` char(1) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL COMMENT '状态 0-正常，1-关闭',
  `CREATE_BY` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '创建人',
  `CREATE_TIME` datetime(0) DEFAULT NULL COMMENT '创建时间',
  `UPDATE_BY` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '更新人',
  `UPDATE_TIME` datetime(0) DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1000 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci COMMENT = '医疗项目' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for cm_activity
-- ----------------------------
DROP TABLE IF EXISTS `cm_activity`;
CREATE TABLE `cm_activity`  (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '活动ID',
  `COMMUNITY_ID` bigint(20) DEFAULT NULL COMMENT '社区',
  `TITLE` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '活动标题',
  `CONTENT` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci COMMENT '活动内容',
  `STATUS` char(1) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL COMMENT '状态 0-正常，1-关闭',
  `CREATE_BY` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '创建人',
  `CREATE_TIME` datetime(0) DEFAULT NULL COMMENT '创建时间',
  `UPDATE_BY` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '更新人',
  `UPDATE_TIME` datetime(0) DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci COMMENT = '社区活动 ' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for cm_activity_apply
-- ----------------------------
DROP TABLE IF EXISTS `cm_activity_apply`;
CREATE TABLE `cm_activity_apply`  (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '活动ID',
  `activity_id` int(11) DEFAULT NULL COMMENT '活动id',
  `USER_ID` bigint(20) DEFAULT NULL COMMENT '用户id',
  `USER_MOBILE` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL COMMENT '用户手机号，参加活动用',
  `STATUS` char(1) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL COMMENT '状态 0-正常，1-关闭',
  `CREATE_BY` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '创建人',
  `CREATE_TIME` datetime(0) DEFAULT NULL COMMENT '创建时间',
  `UPDATE_BY` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '更新人',
  `UPDATE_TIME` datetime(0) DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci COMMENT = '社区活动报名表 ' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for cm_business_guide
-- ----------------------------
DROP TABLE IF EXISTS `cm_business_guide`;
CREATE TABLE `cm_business_guide`  (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '办事指南ID',
  `TITLE` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '指南标题',
  `CONTENT` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci COMMENT '指南内容',
  `COMMUNITY_ID` bigint(20) DEFAULT NULL COMMENT '所属社区',
  `STATUS` char(1) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL COMMENT '状态 状态 0-正常，1-关闭',
  `CREATE_BY` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '创建人',
  `CREATE_TIME` datetime(0) DEFAULT NULL COMMENT '创建时间',
  `UPDATE_BY` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '更新人',
  `UPDATE_TIME` datetime(0) DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1000 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci COMMENT = '社区办事指南 ' ROW_FORMAT = Dynamic;

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
  `ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '社区ID',
  `COMMUNITY_CODE` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '社区编码',
  `COMMUNITY_NAME` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '社区名称',
  `AREA_ID` int(11) DEFAULT NULL COMMENT '社区所属区域ID',
  `INTRODUCTION` text CHARACTER SET latin1 COLLATE latin1_swedish_ci COMMENT '社区介绍',
  `STATUS` char(1) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL COMMENT '状态 0-正常，1-关闭（取消预约）',
  `CREATE_BY` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '创建人',
  `CREATE_TIME` datetime(0) DEFAULT NULL COMMENT '创建时间',
  `UPDATE_BY` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '更新人',
  `UPDATE_TIME` datetime(0) DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 200000 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci COMMENT = '社区 ' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for cm_note
-- ----------------------------
DROP TABLE IF EXISTS `cm_note`;
CREATE TABLE `cm_note`  (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '留言ID',
  `CONTENT` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci COMMENT '留言内容',
  `USER_ID` bigint(20) DEFAULT NULL COMMENT '用户id',
  `COMMUNITY_ID` bigint(20) DEFAULT NULL COMMENT '所属社区',
  `REPLY_STATUS` char(1) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT '1' COMMENT '回复状态 0-已回复，1-未回复',
  `REPLY_CONTENT` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '留言回复内容',
  `STATUS` char(1) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL COMMENT '状态 状态 状态 0-正常，1-关闭',
  `CREATE_BY` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '创建人',
  `CREATE_TIME` datetime(0) DEFAULT NULL COMMENT '创建时间',
  `UPDATE_BY` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '更新人',
  `UPDATE_TIME` datetime(0) DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci COMMENT = '用户留言社区 ' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for csc_appointment
-- ----------------------------
DROP TABLE IF EXISTS `csc_appointment`;
CREATE TABLE `csc_appointment`  (
  `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '预约ID',
  `USER_ID` bigint(20) NOT NULL COMMENT '用户id',
  `HOSPITAL_ID` int(11) DEFAULT NULL COMMENT '预约医院ID',
  `MEDICAL_PROJECT_ID` int(11) DEFAULT NULL COMMENT '预约服务项目ID',
  `APPOINTMENT_TIME` date DEFAULT NULL COMMENT '预约日期',
  `APPOINTMENT_NAME` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '预约人姓名',
  `APPOINTMENT_PHONE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '预约人手机号',
  `STATUS` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '状态 0-正常，1-关闭（取消预约）',
  `CREATE_BY` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '创建人',
  `CREATE_TIME` datetime(0) DEFAULT NULL COMMENT '创建时间',
  `UPDATE_BY` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '更新人',
  `UPDATE_TIME` datetime(0) DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '预约管理 ' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of csc_appointment
-- ----------------------------
INSERT INTO `csc_appointment` VALUES (2, 1009939401, 6, 2, '2020-02-15', '韩结涛', '18505561893', '1', 'admin', '2020-02-14 07:26:23', 'admin', '2020-02-14 10:09:11');
INSERT INTO `csc_appointment` VALUES (4, 102940393459, 2, 2, '2020-02-19', 'wangtingting', '18978789098', '0', 'admin', '2020-02-14 10:11:47', 'admin', '2020-02-14 10:11:47');

-- ----------------------------
-- Table structure for csc_area
-- ----------------------------
DROP TABLE IF EXISTS `csc_area`;
CREATE TABLE `csc_area`  (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '区域ID 区域管理ID',
  `AREA_CODE` varchar(64) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL COMMENT '区域Code：沙区-sybk',
  `AREA_NAME` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '区域名称 例如：沙依巴克区',
  `COORDINATE` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '经纬度',
  `STATUS` char(1) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT '0' COMMENT '状态 0-正常，1-关闭',
  `UPDATE_BY` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '更新人',
  `UPDATE_TIME` datetime(0) DEFAULT NULL COMMENT '更新时间',
  `CREATE_BY` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '创建人',
  `CREATE_TIME` datetime(0) DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100000 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci COMMENT = '社区服务服务中心-区域设置' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for csc_doctor
-- ----------------------------
DROP TABLE IF EXISTS `csc_doctor`;
CREATE TABLE `csc_doctor`  (
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
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '医生管理 ' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of csc_doctor
-- ----------------------------
INSERT INTO `csc_doctor` VALUES (1, 1001, '韩结涛', '小儿感冒', 1, 2, '0', 'admin', '2020-02-13 12:40:07', 'admin', '2020-02-13 12:40:07');
INSERT INTO `csc_doctor` VALUES (2, 1002, '刘元坤', '小儿感冒2', 2, 2, '0', 'admin', '2020-02-13 12:43:11', 'admin', '2020-02-13 12:43:11');
INSERT INTO `csc_doctor` VALUES (3, 1003, '韩结涛', '低级的等级', 1, 2, '0', 'admin', '2020-02-13 12:58:16', 'admin', '2020-02-13 12:58:16');
INSERT INTO `csc_doctor` VALUES (4, 1004, '助理医生', 'hi大夫,2,2,2,2,2', 2, 2, '0', 'admin', '2020-02-13 12:58:55', 'admin', '2020-02-13 13:13:00');
INSERT INTO `csc_doctor` VALUES (5, 1005, 'jdjdjdj', '打击敌方基地', 1, 2, '1', 'admin', '2020-02-13 13:13:32', 'admin', '2020-02-13 13:23:17');

-- ----------------------------
-- Table structure for csc_hospital
-- ----------------------------
DROP TABLE IF EXISTS `csc_hospital`;
CREATE TABLE `csc_hospital`  (
  `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '医院ID',
  `HOS_NAME` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '医院名称',
  `HOS_CODE` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '医院英文名',
  `INTRODUCTION` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci COMMENT '医院介绍',
  `COMMUNITY_IDS` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '服务的社区IDS 社区1，社区2，。。。',
  `AREA_ID` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '所属区域',
  `STATUS` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '0' COMMENT '状态 0-正常，1-关闭',
  `CREATE_BY` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '创建人',
  `CREATE_TIME` datetime(0) DEFAULT NULL COMMENT '创建时间',
  `UPDATE_BY` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '更新人',
  `UPDATE_TIME` datetime(0) DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '社区服务服务中心-医院介绍 ' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of csc_hospital
-- ----------------------------
INSERT INTO `csc_hospital` VALUES (2, '天山花园快乐社区医院', 'sky garden happy hospital', '<span style=\"font-size: 18px; background-color: rgb(255, 231, 156);\">90909</span>', '3,4', '4', '0', 'admin', '2020-02-06 12:11:26', 'admin', '2020-02-13 13:20:00');
INSERT INTO `csc_hospital` VALUES (6, '沙依巴克区红十月社区健康医院', 'sybk red month community hospital', '这是一家社区医院，提供基础的医疗救助服务！', '3,4', '3', '1', 'admin', '2020-02-11 07:04:54', 'admin', '2020-02-12 13:12:40');

-- ----------------------------
-- Table structure for csc_medical_project
-- ----------------------------
DROP TABLE IF EXISTS `csc_medical_project`;
CREATE TABLE `csc_medical_project`  (
  `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '医疗项目ID',
  `NAME` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '医疗项目名称',
  `SERVICE_CONTENT` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '服务内容',
  `PRICE` decimal(32, 8) DEFAULT NULL COMMENT '收费标准 45',
  `DELETE_FLAG` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '0' COMMENT '删除标志 1-已删除，0-未删除',
  `STATUS` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '状态 0-正常，1-关闭',
  `CREATE_BY` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '创建人',
  `CREATE_TIME` datetime(0) DEFAULT NULL COMMENT '创建时间',
  `UPDATE_BY` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '更新人',
  `UPDATE_TIME` datetime(0) DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '医疗项目' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of csc_medical_project
-- ----------------------------
INSERT INTO `csc_medical_project` VALUES (2, '健康检查', '健康检查：检查血压/心率，面容情况', 100.00000000, '0', '0', 'admin', '2020-02-13 09:31:20', 'admin', '2020-02-14 07:23:59');

-- ----------------------------
-- Table structure for fp_loop_image
-- ----------------------------
DROP TABLE IF EXISTS `fp_loop_image`;
CREATE TABLE `fp_loop_image`  (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `title` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '广告标题',
  `image_url` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '轮播图片url',
  `STATUS` char(1) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL COMMENT '状态 状态 状态 0-正常，1-关闭',
  `SORT` int(11) DEFAULT 0 COMMENT '排序，越大排在前面',
  `CREATE_BY` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '创建人',
  `CREATE_TIME` datetime(0) DEFAULT NULL COMMENT '创建时间',
  `UPDATE_BY` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '更新人',
  `UPDATE_TIME` datetime(0) DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci COMMENT = '首页轮播图 ' ROW_FORMAT = Dynamic;

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
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '代码生成业务表' ROW_FORMAT = Dynamic;

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
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '代码生成业务表字段' ROW_FORMAT = Dynamic;

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
  `ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `BOARD_ID` int(11) DEFAULT NULL COMMENT '板块编码',
  `TITLE` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '文章标题',
  `CONTENT` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci COMMENT '文章内容',
  `WATCH_COUNT` int(11) DEFAULT NULL COMMENT '观看数',
  `send_point` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '是否奖励积分，Y-是，N-否',
  `award_points` int(11) DEFAULT 0 COMMENT '奖励积分数量',
  `img_urls` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci COMMENT '存放图文混排的所有图片url',
  `STATUS` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '状态 状态 状态 0-正常，1-关闭',
  `CREATE_BY` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '创建人',
  `CREATE_TIME` datetime(0) DEFAULT NULL COMMENT '创建时间',
  `UPDATE_BY` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '更新人',
  `UPDATE_TIME` datetime(0) DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '健康宣教宣教文章 ' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for he_board
-- ----------------------------
DROP TABLE IF EXISTS `he_board`;
CREATE TABLE `he_board`  (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `BOARD_CODE` varchar(64) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL COMMENT '板块编码',
  `BOARD_NAME` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '板块名称',
  `STATUS` char(1) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL COMMENT '状态 状态 状态 0-正常，1-关闭',
  `SORT` int(11) DEFAULT 0 COMMENT '排序，越大排在前面',
  `CREATE_BY` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '创建人',
  `CREATE_TIME` datetime(0) DEFAULT NULL COMMENT '创建时间',
  `UPDATE_BY` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '更新人',
  `UPDATE_TIME` datetime(0) DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5000 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci COMMENT = '健康宣教板块 ' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for he_video
-- ----------------------------
DROP TABLE IF EXISTS `he_video`;
CREATE TABLE `he_video`  (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `BOARD_ID` int(11) DEFAULT NULL COMMENT '板块编码',
  `TITLE` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '视频标题',
  `VIDEO_URL` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '视频地址',
  `WATCH_COUNT` int(11) DEFAULT NULL COMMENT '观看数',
  `SEND_POINT` varchar(16) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL COMMENT '是否奖励积分，Y-是，N-否',
  `AWARD_POINTS` int(11) DEFAULT 0 COMMENT '奖励积分数量',
  `STATUS` char(1) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL COMMENT '状态 状态 状态 0-正常，1-关闭',
  `CREATE_BY` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '创建人',
  `CREATE_TIME` datetime(0) DEFAULT NULL COMMENT '创建时间',
  `UPDATE_BY` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '更新人',
  `UPDATE_TIME` datetime(0) DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci COMMENT = '健康宣教宣教视频 ' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for pm_activity
-- ----------------------------
DROP TABLE IF EXISTS `pm_activity`;
CREATE TABLE `pm_activity`  (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '活动ID',
  `PROPERTY_ID` bigint(20) DEFAULT NULL COMMENT '物业',
  `TITLE` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '活动标题',
  `CONTENT` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci COMMENT '活动内容',
  `STATUS` char(1) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL COMMENT '状态 0-正常，1-关闭',
  `CREATE_BY` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '创建人',
  `CREATE_TIME` datetime(0) DEFAULT NULL COMMENT '创建时间',
  `UPDATE_BY` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '更新人',
  `UPDATE_TIME` datetime(0) DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci COMMENT = '物业活动 ' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for pm_activity_apply
-- ----------------------------
DROP TABLE IF EXISTS `pm_activity_apply`;
CREATE TABLE `pm_activity_apply`  (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '活动ID',
  `activity_id` int(11) DEFAULT NULL COMMENT '活动id',
  `USER_ID` bigint(20) DEFAULT NULL COMMENT '用户id',
  `USER_MOBILE` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL COMMENT '用户手机号，参加活动用',
  `STATUS` char(1) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL COMMENT '状态 0-正常，1-关闭',
  `CREATE_BY` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '创建人',
  `CREATE_TIME` datetime(0) DEFAULT NULL COMMENT '创建时间',
  `UPDATE_BY` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '更新人',
  `UPDATE_TIME` datetime(0) DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci COMMENT = '物业活动报名 ' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for pm_business_guide
-- ----------------------------
DROP TABLE IF EXISTS `pm_business_guide`;
CREATE TABLE `pm_business_guide`  (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '办事指南ID',
  `TITLE` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '指南标题',
  `CONTENT` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci COMMENT '指南内容',
  `PROPERTY_ID` bigint(20) DEFAULT NULL COMMENT '所属物业',
  `STATUS` char(1) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL COMMENT '状态 状态 0-正常，1-关闭',
  `CREATE_BY` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '创建人',
  `CREATE_TIME` datetime(0) DEFAULT NULL COMMENT '创建时间',
  `UPDATE_BY` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '更新人',
  `UPDATE_TIME` datetime(0) DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2000 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci COMMENT = '办事指南 ' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for pm_note
-- ----------------------------
DROP TABLE IF EXISTS `pm_note`;
CREATE TABLE `pm_note`  (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '留言ID',
  `CONTENT` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci COMMENT '留言内容',
  `USER_ID` bigint(20) DEFAULT NULL COMMENT '用户id',
  `PROPERTY_ID` bigint(20) DEFAULT NULL COMMENT '所属物业',
  `REPLY_STATUS` char(1) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT '1' COMMENT '回复状态 0-已回复，1-未回复',
  `REPLY_CONTENT` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '留言回复内容',
  `STATUS` char(1) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL COMMENT '状态 状态 状态 0-正常，1-关闭',
  `CREATE_BY` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '创建人',
  `CREATE_TIME` datetime(0) DEFAULT NULL COMMENT '创建时间',
  `UPDATE_BY` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '更新人',
  `UPDATE_TIME` datetime(0) DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci COMMENT = '用户留言物业 ' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for pm_notice
-- ----------------------------
DROP TABLE IF EXISTS `pm_notice`;
CREATE TABLE `pm_notice`  (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `TITLE` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '通知内容',
  `CONTENT` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci COMMENT '通知内容',
  `PROPERTY_ID` bigint(20) DEFAULT NULL COMMENT '物业id',
  `STATUS` char(1) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL COMMENT '状态 状态 状态 0-正常，1-关闭',
  `CREATE_BY` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '创建人',
  `CREATE_TIME` datetime(0) DEFAULT NULL COMMENT '创建时间',
  `UPDATE_BY` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '更新人',
  `UPDATE_TIME` datetime(0) DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci COMMENT = '物业通知 ' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for pm_property
-- ----------------------------
DROP TABLE IF EXISTS `pm_property`;
CREATE TABLE `pm_property`  (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '社区ID',
  `PROPERTY_CODE` varchar(128) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL COMMENT '社区编码',
  `PROPERTY_NAME` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '社区名称',
  `AREA_ID` int(11) DEFAULT NULL COMMENT '社区所属区域ID',
  `INTRODUCTION` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci COMMENT '社区介绍',
  `STATUS` char(1) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL COMMENT '状态 0-正常，1-关闭（取消预约）',
  `CREATE_BY` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '创建人',
  `CREATE_TIME` datetime(0) DEFAULT NULL COMMENT '创建时间',
  `UPDATE_BY` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '更新人',
  `UPDATE_TIME` datetime(0) DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 400000 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci COMMENT = '物业 ' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for qrtz_calendars
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_calendars`;
CREATE TABLE `qrtz_calendars`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `calendar_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `calendar` blob NOT NULL,
  PRIMARY KEY (`sched_name`, `calendar_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for qrtz_fired_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_fired_triggers`;
CREATE TABLE `qrtz_fired_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `entry_id` varchar(95) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `instance_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `fired_time` bigint(13) NOT NULL,
  `sched_time` bigint(13) NOT NULL,
  `priority` int(11) NOT NULL,
  `state` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `job_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `job_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `is_nonconcurrent` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `requests_recovery` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`sched_name`, `entry_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for qrtz_job_details
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_job_details`;
CREATE TABLE `qrtz_job_details`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `job_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `job_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `description` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `job_class_name` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `is_durable` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `is_nonconcurrent` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `is_update_data` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `requests_recovery` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `job_data` blob,
  PRIMARY KEY (`sched_name`, `job_name`, `job_group`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

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
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `lock_name` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`sched_name`, `lock_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

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
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`sched_name`, `trigger_group`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for qrtz_scheduler_state
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_scheduler_state`;
CREATE TABLE `qrtz_scheduler_state`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `instance_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `last_checkin_time` bigint(13) NOT NULL,
  `checkin_interval` bigint(13) NOT NULL,
  PRIMARY KEY (`sched_name`, `instance_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_scheduler_state
-- ----------------------------
INSERT INTO `qrtz_scheduler_state` VALUES ('RuoyiScheduler', 'DESKTOP-QGR3FOO1583047634339', 1583048127404, 15000);

-- ----------------------------
-- Table structure for sm_client_user
-- ----------------------------
DROP TABLE IF EXISTS `sm_client_user`;
CREATE TABLE `sm_client_user`  (
  `USER_ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '用户ID',
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
) ENGINE = InnoDB AUTO_INCREMENT = 10000000 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户会员表 system memeber' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sm_user_point_detail
-- ----------------------------
DROP TABLE IF EXISTS `sm_user_point_detail`;
CREATE TABLE `sm_user_point_detail`  (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `USER_ID` bigint(20) NOT NULL COMMENT '用户id',
  `SYS_USER_ID` bigint(20) NOT NULL COMMENT '用户系统id',
  `POINTS` bigint(20) DEFAULT 0 COMMENT '积分数',
  `ADD_OR_DEDUCT` char(1) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL COMMENT '增加还是减少,0-减，1-加',
  `OPERATE_TYPE` char(1) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL COMMENT '操作类型：0-系统赠送，1-个人中心签到，2-观看宣教视频，3-观看宣教文章，4-购物赠送，5-消费使用',
  `OPERATE_TYPE_INFO` varchar(256) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL COMMENT '操作类型描述：0-系统赠送，1-个人中心签到，2-观看宣教视频，3-观看宣教文章，4-购物赠送，5-消费使用',
  `OPERATE_PROJECT_ID` bigint(20) DEFAULT NULL COMMENT '操作项目id',
  `STATUS` char(1) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT '0' COMMENT '状态 0-正常，1-关闭',
  `CREATE_BY` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '创建人',
  `CREATE_TIME` datetime(0) DEFAULT NULL COMMENT '创建时间',
  `UPDATE_BY` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '更新人',
  `UPDATE_TIME` datetime(0) DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci COMMENT = '用户积分明细表 ' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sms_code
-- ----------------------------
DROP TABLE IF EXISTS `sms_code`;
CREATE TABLE `sms_code`  (
  `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `MOBILE_PHONE` varchar(32) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL COMMENT '手机号',
  `code` varchar(30) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL COMMENT '验证码',
  `code_type` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL COMMENT '验证码类型，R-客户端注册，L-客户端用户手机登陆。。。',
  `STATUS` char(1) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT '0' COMMENT '状态 状态 状态 0-正常，1-关闭',
  `SEND_TIME` datetime(0) DEFAULT NULL COMMENT '发送时间',
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1000 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci COMMENT = '短信验证码 ' ROW_FORMAT = Dynamic;

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
) ENGINE = InnoDB AUTO_INCREMENT = 113 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '部门表' ROW_FORMAT = Dynamic;

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
INSERT INTO `sys_dept` VALUES (112, 101, '0,100,101', '客户端用户', 5, 'admin', '18988888888', '18988888888@163.com', '0', '0', 'admin', '2020-03-03 15:36:38', '', NULL);

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
) ENGINE = InnoDB AUTO_INCREMENT = 50 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '字典数据表' ROW_FORMAT = Dynamic;

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
INSERT INTO `sys_dict_data` VALUES (37, 2, '奖励积分', '1', 'sys_he_reward_point', '', '', 'Y', '0', 'admin', '2020-03-08 19:42:28', 'admin', '2020-03-08 19:43:17', '');
INSERT INTO `sys_dict_data` VALUES (38, 1, '不奖励积分', '0', 'sys_he_reward_point', '', '', 'Y', '0', 'admin', '2020-03-08 19:42:50', 'admin', '2020-03-08 19:42:58', '');
INSERT INTO `sys_dict_data` VALUES (39, 1, '未回复', '1', 'note_reply_status', '', 'info', 'Y', '0', 'admin', '2020-03-11 12:46:10', 'admin', '2020-03-11 12:51:22', '');
INSERT INTO `sys_dict_data` VALUES (40, 2, '已回复', '0', 'note_reply_status', '', 'success', 'Y', '0', 'admin', '2020-03-11 12:46:27', 'admin', '2020-03-11 12:51:05', '');
INSERT INTO `sys_dict_data` VALUES (41, 2, '撤回回复', '2', 'note_reply_status', '', 'warning', 'Y', '0', 'admin', '2020-03-11 12:46:54', 'admin', '2020-03-11 12:55:05', '');
INSERT INTO `sys_dict_data` VALUES (42, 1, '积分累计', '1', 'point_add_or_deduct', '', 'primary', 'Y', '0', 'admin', '2020-03-13 10:55:39', 'admin', '2020-03-13 11:19:29', '');
INSERT INTO `sys_dict_data` VALUES (43, 2, '积分扣减', '0', 'point_add_or_deduct', '', 'warning', 'Y', '0', 'admin', '2020-03-13 10:55:55', 'admin', '2020-03-13 11:19:24', '');
INSERT INTO `sys_dict_data` VALUES (44, 1, '系统赠送', '0', 'point_operate_type', NULL, 'primary', 'Y', '0', 'admin', '2020-03-13 11:23:42', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (45, 2, '个人签到', '1', 'point_operate_type', '', 'primary', 'Y', '0', 'admin', '2020-03-13 11:24:06', 'admin', '2020-03-13 11:24:45', '');
INSERT INTO `sys_dict_data` VALUES (46, 3, '宣教视频', '2', 'point_operate_type', '', 'primary', 'Y', '0', 'admin', '2020-03-13 11:24:39', 'admin', '2020-03-13 11:25:29', '');
INSERT INTO `sys_dict_data` VALUES (47, 4, '宣教文章', '3', 'point_operate_type', NULL, 'primary', 'Y', '0', 'admin', '2020-03-13 11:25:19', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (48, 5, '购物赠送', '4', 'point_operate_type', NULL, 'primary', 'Y', '0', 'admin', '2020-03-13 11:26:04', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (49, 6, '消费抵用', '5', 'point_operate_type', NULL, 'warning', 'Y', '0', 'admin', '2020-03-13 11:26:33', '', NULL, NULL);

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
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '字典类型表' ROW_FORMAT = Dynamic;

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
INSERT INTO `sys_dict_type` VALUES (13, '宣教板块是否奖励积分', 'sys_he_reward_point', '0', 'admin', '2020-03-08 19:41:46', '', NULL, '宣教板块是否奖励积分:1-奖励积分，0-不奖励积分');
INSERT INTO `sys_dict_type` VALUES (14, '留言回复状态', 'note_reply_status', '0', 'admin', '2020-03-11 12:44:40', '', NULL, '留言回复状态note_reply_status');
INSERT INTO `sys_dict_type` VALUES (15, '积分增减状态', 'point_add_or_deduct', '0', 'admin', '2020-03-13 10:55:04', '', NULL, '积分增减状态point_add_or_deduct');
INSERT INTO `sys_dict_type` VALUES (16, '积分操作类型', 'point_operate_type', '0', 'admin', '2020-03-13 11:22:22', '', NULL, '积分操作类型point_operate_type');

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
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '系统访问记录' ROW_FORMAT = Dynamic;

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
) ENGINE = InnoDB AUTO_INCREMENT = 1201 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '菜单权限表' ROW_FORMAT = Dynamic;

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
INSERT INTO `sys_menu` VALUES (1114, '留言删除', 1112, 4, '#', 'menuItem', 'F', '0', 'cm:note:remove', '#', 'admin', '2020-02-16 11:42:04', 'admin', '2020-03-14 16:05:51', '');
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
INSERT INTO `sys_menu` VALUES (1157, '客户端管理', 0, 9, '#', 'menuItem', 'M', '0', '', 'fa fa-user', 'admin', '2020-02-18 07:22:34', 'admin', '2020-03-12 09:33:15', '');
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
INSERT INTO `sys_menu` VALUES (1199, '留言新增', 1112, 2, '#', 'menuItem', 'F', '0', 'cm:note:add', '#', 'admin', '2020-03-14 16:06:37', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1200, '留言编辑', 1112, 3, '#', 'menuItem', 'F', '0', 'cm:note:edit', '#', 'admin', '2020-03-14 16:07:16', '', NULL, '');

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
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '操作日志记录' ROW_FORMAT = Dynamic;

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
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '岗位信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_post
-- ----------------------------
INSERT INTO `sys_post` VALUES (1, 'ceo', '董事长', 1, '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_post` VALUES (2, 'se', '项目经理', 2, '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_post` VALUES (3, 'hr', '人力资源', 3, '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_post` VALUES (4, 'user', '普通员工', 4, '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_post` VALUES (5, 'client', '客户端用户', 5, '0', 'admin', '2020-02-28 14:54:57', '', NULL, '客户端用户');

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
INSERT INTO `sys_role` VALUES (1, '管理员', 'admin', 1, '1', '0', '0', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '管理员');
INSERT INTO `sys_role` VALUES (2, '普通角色', 'common', 2, '2', '0', '0', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '普通角色');
INSERT INTO `sys_role` VALUES (100, '运维监控', 'monitor', 3, '1', '0', '0', 'admin', '2020-02-02 11:39:22', '', NULL, NULL);
INSERT INTO `sys_role` VALUES (101, '社区总管理员', 'communityBigAdmin', 4, '1', '0', '0', 'admin', '2020-02-19 20:35:29', 'admin', '2020-02-21 18:08:13', '社区总管理员');
INSERT INTO `sys_role` VALUES (102, '医院总管理员', 'hospitalBigAdmin', 5, '1', '0', '0', 'admin', '2020-02-19 20:37:24', 'admin', '2020-02-21 18:08:31', '物业总管理员');
INSERT INTO `sys_role` VALUES (103, '物业总管理员', 'propertyBigAdmin', 6, '1', '0', '0', 'admin', '2020-02-19 20:42:30', 'admin', '2020-02-21 18:08:35', '医院总管理员');
INSERT INTO `sys_role` VALUES (104, '社区管理员', 'communityAdmin', 7, '1', '0', '0', 'admin', '2020-02-19 20:43:13', 'admin', '2020-02-21 20:07:46', '社区管理员，不允许删除');
INSERT INTO `sys_role` VALUES (105, '医院管理员', 'hospitalAdmin', 8, '1', '0', '0', 'admin', '2020-02-19 20:43:47', 'admin', '2020-02-21 18:09:50', '物业管理员，不允许删除');
INSERT INTO `sys_role` VALUES (106, '物业管理员', 'propertyAdmin', 9, '1', '0', '0', 'admin', '2020-02-19 20:44:53', 'admin', '2020-02-21 21:18:52', '医院管理员，不允许删除');
INSERT INTO `sys_role` VALUES (107, '客户端登陆', 'client', 10, '1', '0', '0', 'admin', '2020-02-21 09:54:50', 'admin', '2020-02-21 18:08:55', '客户端登陆，不允许删除');

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
INSERT INTO `sys_role_menu` VALUES (104, 1199);
INSERT INTO `sys_role_menu` VALUES (104, 1200);
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
INSERT INTO `sys_role_menu` VALUES (107, 3);
INSERT INTO `sys_role_menu` VALUES (107, 115);

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
  `merchant_flag` int(11) DEFAULT 0 COMMENT '0-管理员（默认值），1-社区，2-医院，3-物业，101-客户端客户',
  `merchant_Id` bigint(20) DEFAULT NULL,
  `pwd_md5` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '20200301, 修改前端传明文密码的方式，使用md5传输，并保存md5到数据库，已实现兼容shiro并实现多方式登录',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 600000000 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (1, 103, 'admin', 'admin', '00', 'admin@163.com', '15888888888', '1', '/profile/avatar/2020/03/14/4a8f53dc723253d896f88a12490015aa.png', 'cbc030ef6fc74743fda36e2f76d6908b', '111111', '0', '0', '58.248.231.240', '2020-03-14 16:24:38', 'admin', '2018-03-16 11:33:00', 'admin', '2020-03-14 16:28:21', '管理员', 0, 0, 'fcea920f7412b5da7be0cf42b8c93759');
INSERT INTO `sys_user` VALUES (2, 105, 'hant', 'hant', '00', 'hant@qq.com', '15666666666', '1', '', '19486052ecdfd0df9aa0b6f306cd962c', '546af6', '0', '0', '127.0.0.1', '2020-03-03 10:34:45', 'admin', '2018-03-16 11:33:00', 'admin', '2020-03-03 10:34:45', '测试员', 0, 0, 'db846859bcf906caf61ba74e22953a80');

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
INSERT INTO `sys_user_online` VALUES ('a9134aee-cfac-4909-9e98-311abd7ecba9', 'admin', '超级管理员', '58.248.231.240', 'XX XX', 'Chrome', 'Windows 10', 'on_line', '2020-03-14 16:24:32', '2020-03-14 16:39:15', 1800000);

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
