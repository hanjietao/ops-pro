-- 社区服务中心
-- ----------------------------
-- 1、区域   表名需要小写
-- ----------------------------
drop table if exists csc_area ;
CREATE TABLE csc_area(
    ID BIGINT(20) AUTO_INCREMENT NOT NULL   COMMENT '区域ID 区域管理ID' ,
    AREA_CODE VARCHAR(64) NOT NULL   COMMENT '区域Code：沙区-sybk' ,
    AREA_NAME VARCHAR(128)  CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci   COMMENT '区域名称 例如：沙依巴克区' ,
    COORDINATE VARCHAR(64)  CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  COMMENT '经纬度' ,
    STATUS CHAR(1) DEFAULT 0 COMMENT '状态 0-正常，1-关闭' ,
    UPDATE_BY VARCHAR(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci   COMMENT '更新人' ,
    UPDATE_TIME DATETIME    COMMENT '更新时间' ,
    CREATE_BY VARCHAR(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci   COMMENT '创建人' ,
    CREATE_TIME DATETIME    COMMENT '创建时间' ,
    PRIMARY KEY (ID)
)AUTO_INCREMENT = 100000 COMMENT = '社区服务服务中心-区域设置';


-- 社区
drop table if exists cm_community ;
CREATE TABLE cm_community(
    ID BIGINT(20)  AUTO_INCREMENT  COMMENT '社区ID' ,
    COMMUNITY_CODE VARCHAR(128)  CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  COMMENT '社区编码' ,
    COMMUNITY_NAME VARCHAR(128)  CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  COMMENT '社区名称' ,
    AREA_ID INT    COMMENT '社区所属区域ID' ,
    INTRODUCTION TEXT    COMMENT '社区介绍' ,
    STATUS CHAR(1)    COMMENT '状态 0-正常，1-关闭（取消预约）' ,
    CREATE_BY VARCHAR(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci   COMMENT '创建人' ,
    CREATE_TIME DATETIME    COMMENT '创建时间' ,
    UPDATE_BY VARCHAR(32)  CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  COMMENT '更新人' ,
    UPDATE_TIME DATETIME    COMMENT '更新时间',
	PRIMARY KEY(ID)
) AUTO_INCREMENT = 200000 COMMENT = '社区 ';


drop table if exists cm_activity ;
CREATE TABLE cm_activity(
    ID BIGINT(20) NOT NULL AUTO_INCREMENT  COMMENT '活动ID' ,
    COMMUNITY_ID BIGINT(20) COMMENT '社区',
    TITLE VARCHAR(128)  CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  COMMENT '活动标题' ,
    CONTENT TEXT  CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  COMMENT '活动内容' ,
    STATUS CHAR(1)    COMMENT '状态 0-正常，1-关闭' ,
    CREATE_BY VARCHAR(32)  CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  COMMENT '创建人' ,
    CREATE_TIME DATETIME    COMMENT '创建时间' ,
    UPDATE_BY VARCHAR(32)  CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  COMMENT '更新人' ,
    UPDATE_TIME DATETIME    COMMENT '更新时间' ,
    PRIMARY KEY (ID)
) COMMENT = '社区活动 ';

drop table if exists cm_activity_apply ;
CREATE TABLE cm_activity_apply(
    ID BIGINT(20) NOT NULL AUTO_INCREMENT  COMMENT '活动ID' ,
    activity_id INT    COMMENT '活动id' ,
    USER_ID BIGINT(20)    COMMENT '用户id' ,
    USER_MOBILE VARCHAR(20) COMMENT '用户手机号，参加活动用',
    STATUS CHAR(1)    COMMENT '状态 0-正常，1-关闭' ,
    CREATE_BY VARCHAR(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci   COMMENT '创建人' ,
    CREATE_TIME DATETIME    COMMENT '创建时间' ,
    UPDATE_BY VARCHAR(32)  CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  COMMENT '更新人' ,
    UPDATE_TIME DATETIME    COMMENT '更新时间' ,
    PRIMARY KEY (ID)
) COMMENT = '社区活动报名表 ';

drop table if exists cm_business_guide ;
CREATE TABLE cm_business_guide(
    ID BIGINT(20)  AUTO_INCREMENT  COMMENT '办事指南ID' ,
    TITLE VARCHAR(128)  CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  COMMENT '指南标题' ,
    CONTENT TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci COMMENT '指南内容' ,
    COMMUNITY_ID BIGINT(20)    COMMENT '所属社区' ,
    STATUS CHAR(1)    COMMENT '状态 状态 0-正常，1-关闭' ,
    CREATE_BY VARCHAR(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci   COMMENT '创建人' ,
    CREATE_TIME DATETIME    COMMENT '创建时间' ,
    UPDATE_BY VARCHAR(32)  CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  COMMENT '更新人' ,
    UPDATE_TIME DATETIME    COMMENT '更新时间',
    PRIMARY KEY (ID)
)AUTO_INCREMENT = 1000 COMMENT = '社区办事指南 ';

drop table if exists cm_note ;
CREATE TABLE cm_note(
    ID BIGINT(20)  AUTO_INCREMENT  COMMENT '留言ID' ,
    CONTENT TEXT  CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  COMMENT '留言内容' ,
    USER_ID BIGINT(20) COMMENT '用户id',
    COMMUNITY_ID BIGINT(20)    COMMENT '所属社区' ,
    REPLY_STATUS char(1) DEFAULT '1' COMMENT '回复状态 0-已回复，1-未回复',
    REPLY_CONTENT varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci default null comment '留言回复内容',
    STATUS CHAR(1)    COMMENT '状态 状态 状态 0-正常，1-关闭' ,
    CREATE_BY VARCHAR(32)  CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  COMMENT '创建人' ,
    CREATE_TIME DATETIME    COMMENT '创建时间' ,
    UPDATE_BY VARCHAR(32)  CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  COMMENT '更新人' ,
    UPDATE_TIME DATETIME    COMMENT '更新时间',
    PRIMARY KEY(ID)
) COMMENT = '用户留言社区 ';


-- 社区医院
drop table if exists ch_hospital ;
CREATE TABLE ch_hospital(
    ID BIGINT(20) NOT NULL AUTO_INCREMENT COMMENT '医院ID' ,
    HOS_NAME VARCHAR(128)  CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  COMMENT '医院名称' ,
    HOS_CODE VARCHAR(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci   COMMENT '医院英文名' ,
    INTRODUCTION TEXT  CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  COMMENT '医院介绍' ,
    COMMUNITY_IDS VARCHAR(1024)    COMMENT '服务的社区IDS 社区1，社区2，。。。' ,
    AREA_ID VARCHAR(32)  CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  COMMENT '所属区域' ,
    STATUS CHAR(1)    COMMENT '状态 0-正常，1-关闭' ,
    CREATE_BY VARCHAR(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci   COMMENT '创建人' ,
    CREATE_TIME DATETIME    COMMENT '创建时间' ,
    UPDATE_BY VARCHAR(32)  CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  COMMENT '更新人' ,
    UPDATE_TIME DATETIME    COMMENT '更新时间' ,
    PRIMARY KEY (ID)
) AUTO_INCREMENT = 300000 COMMENT = '社区服务服务中心-医院介绍 ';

drop table if exists ch_medical_project ;
CREATE TABLE ch_medical_project(
    ID BIGINT(20) NOT NULL AUTO_INCREMENT  COMMENT '医疗项目ID' ,
    NAME VARCHAR(64)  CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  COMMENT '医疗项目名称' ,
    SERVICE_CONTENT VARCHAR(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci   COMMENT '服务内容' ,
    PRICE DECIMAL(32,2)    COMMENT '收费标准 45' ,
    HOSPITAL_ID BIGINT(20)    COMMENT '医院id' ,
    fees varchar(128) default null comment '收费标准',
    DELETE_FLAG VARCHAR(1)  DEFAULT '0'  COMMENT '删除标志 1-已删除，0-未删除' ,
    STATUS CHAR(1)    COMMENT '状态 0-正常，1-关闭' ,
    CREATE_BY VARCHAR(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci   COMMENT '创建人' ,
    CREATE_TIME DATETIME    COMMENT '创建时间' ,
    UPDATE_BY VARCHAR(32)  CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  COMMENT '更新人' ,
    UPDATE_TIME DATETIME    COMMENT '更新时间' ,
    PRIMARY KEY (ID)
) AUTO_INCREMENT = 1000 COMMENT = '医疗项目';

drop table if exists ch_doctor ;
CREATE TABLE ch_doctor(
    ID BIGINT(20) NOT NULL AUTO_INCREMENT  COMMENT '医生ID' ,
    DOCTOR_CODE INT DEFAULT NULL   COMMENT '医生ID' ,
    DOCTOR_NAME VARCHAR(64)  CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  COMMENT '医生名称' ,
    MAJOR_FIELD VARCHAR(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  COMMENT '专业方向介绍' ,
    DOCTOR_TYPE INT COMMENT '医生类型1-主治医生，2-助理医生，3-实习医生' ,
    HOSPITAL_ID BIGINT(20)    COMMENT '所属医院' ,
    STATUS CHAR(1)    COMMENT '状态 0-正常，1-关闭' ,
    CREATE_BY VARCHAR(32)  CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  COMMENT '创建人' ,
    CREATE_TIME DATETIME    COMMENT '创建时间' ,
    UPDATE_BY VARCHAR(32)  CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  COMMENT '更新人' ,
    UPDATE_TIME DATETIME    COMMENT '更新时间' ,
    PRIMARY KEY (ID)
) AUTO_INCREMENT = 2000 COMMENT = '医生管理 ';

drop table if exists ch_appointment ;
CREATE TABLE ch_appointment(
    ID BIGINT(20) NOT NULL AUTO_INCREMENT  COMMENT '预约ID' ,
    USER_ID BIGINT(20) NOT NULL COMMENT '用户id',
    HOSPITAL_ID BIGINT(20)    COMMENT '预约医院ID',
    MEDICAL_PROJECT_ID INT    COMMENT '预约服务项目ID' ,
    APPOINTMENT_TIME Date    COMMENT '预约日期' ,
    APPOINTMENT_NAME VARCHAR(64)  CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  COMMENT '预约人姓名' ,
    APPOINTMENT_PHONE VARCHAR(20)    COMMENT '预约人手机号' ,
    CANCEL_REASON VARCHAR(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci COMMENT '取消原因' ,
    APPOINTMENT_START_TIME DATETIME default null comment '预约时间起始',
    APPOINTMENT_END_TIME DATETIME default null comment '预约时间结束',
    APPOINTMENT_REASON varchar(256) default null comment '预约原因',
    STATUS CHAR(1)    COMMENT '状态 0-正常，1-关闭（取消预约）' ,
    CREATE_BY VARCHAR(32)  CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  COMMENT '创建人' ,
    CREATE_TIME DATETIME    COMMENT '创建时间' ,
    UPDATE_BY VARCHAR(32)  CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  COMMENT '更新人' ,
    UPDATE_TIME DATETIME    COMMENT '更新时间' ,
    PRIMARY KEY (ID)
) COMMENT = '预约管理 ';




-- 物业
drop table if exists pm_property ;
CREATE TABLE pm_property(
    ID BIGINT(20)  AUTO_INCREMENT  COMMENT '社区ID' ,
    PROPERTY_CODE VARCHAR(128)    COMMENT '社区编码' ,
    PROPERTY_NAME VARCHAR(128)  CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  COMMENT '社区名称' ,
    AREA_ID INT    COMMENT '社区所属区域ID' ,
    INTRODUCTION TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci   COMMENT '社区介绍' ,
    STATUS CHAR(1)    COMMENT '状态 0-正常，1-关闭（取消预约）' ,
    CREATE_BY VARCHAR(32)  CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  COMMENT '创建人' ,
    CREATE_TIME DATETIME    COMMENT '创建时间' ,
    UPDATE_BY VARCHAR(32)  CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  COMMENT '更新人' ,
    UPDATE_TIME DATETIME    COMMENT '更新时间',
	PRIMARY KEY(ID)
)AUTO_INCREMENT = 400000 COMMENT = '物业 ';

-- 需要新增活动所属社区
drop table if exists pm_activity ;
CREATE TABLE pm_activity(
    ID BIGINT(20) NOT NULL AUTO_INCREMENT  COMMENT '活动ID' ,
    PROPERTY_ID BIGINT(20) COMMENT '物业',
    TITLE VARCHAR(128)  CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  COMMENT '活动标题' ,
    CONTENT TEXT  CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  COMMENT '活动内容' ,
    STATUS CHAR(1)    COMMENT '状态 0-正常，1-关闭' ,
    CREATE_BY VARCHAR(32)  CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  COMMENT '创建人' ,
    CREATE_TIME DATETIME    COMMENT '创建时间' ,
    UPDATE_BY VARCHAR(32)  CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  COMMENT '更新人' ,
    UPDATE_TIME DATETIME    COMMENT '更新时间' ,
    PRIMARY KEY (ID)
) COMMENT = '物业活动 ';

drop table if exists pm_activity_apply ;
CREATE TABLE pm_activity_apply(
    ID BIGINT(20) NOT NULL AUTO_INCREMENT  COMMENT '活动ID' ,
    activity_id INT    COMMENT '活动id' ,
    USER_ID BIGINT(20)    COMMENT '用户id' ,
    USER_MOBILE VARCHAR(20) COMMENT '用户手机号，参加活动用',
    STATUS CHAR(1)    COMMENT '状态 0-正常，1-关闭' ,
    CREATE_BY VARCHAR(32)  CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  COMMENT '创建人' ,
    CREATE_TIME DATETIME    COMMENT '创建时间' ,
    UPDATE_BY VARCHAR(32)  CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  COMMENT '更新人' ,
    UPDATE_TIME DATETIME    COMMENT '更新时间' ,
    PRIMARY KEY (ID)
) COMMENT = '物业活动报名 ';

drop table if exists pm_business_guide ;
CREATE TABLE pm_business_guide(
    ID BIGINT(20)  AUTO_INCREMENT  COMMENT '办事指南ID' ,
    TITLE VARCHAR(128)  CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  COMMENT '指南标题' ,
    CONTENT TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci COMMENT '指南内容' ,
    PROPERTY_ID BIGINT(20)    COMMENT '所属物业' ,
    STATUS CHAR(1)    COMMENT '状态 状态 0-正常，1-关闭' ,
    CREATE_BY VARCHAR(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci   COMMENT '创建人' ,
    CREATE_TIME DATETIME    COMMENT '创建时间' ,
    UPDATE_BY VARCHAR(32)  CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  COMMENT '更新人' ,
    UPDATE_TIME DATETIME    COMMENT '更新时间',
    PRIMARY KEY (ID)
)AUTO_INCREMENT = 2000 COMMENT = '办事指南 ';

drop table if exists pm_note ;
CREATE TABLE pm_note(
    ID BIGINT(20)  AUTO_INCREMENT  COMMENT '留言ID' ,
    CONTENT TEXT  CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  COMMENT '留言内容' ,
    USER_ID BIGINT(20) COMMENT '用户id',
    PROPERTY_ID BIGINT(20) COMMENT '所属物业' ,
    REPLY_STATUS char(1) DEFAULT '1' COMMENT '回复状态 0-已回复，1-未回复',
    REPLY_CONTENT varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci default null comment '留言回复内容',
    STATUS CHAR(1)    COMMENT '状态 状态 状态 0-正常，1-关闭' ,
    CREATE_BY VARCHAR(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci   COMMENT '创建人' ,
    CREATE_TIME DATETIME    COMMENT '创建时间' ,
    UPDATE_BY VARCHAR(32)  CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  COMMENT '更新人' ,
    UPDATE_TIME DATETIME    COMMENT '更新时间',
    PRIMARY KEY(ID)
) COMMENT = '用户留言物业 ';

drop table if exists pm_notice ;
CREATE TABLE pm_notice(
    ID BIGINT(20)  AUTO_INCREMENT  COMMENT 'ID' ,
    TITLE VARCHAR(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci   COMMENT '通知内容' ,
    CONTENT TEXT   CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci COMMENT '通知内容' ,
    PROPERTY_ID BIGINT(20)    COMMENT '物业id' ,
    STATUS CHAR(1)    COMMENT '状态 状态 状态 0-正常，1-关闭' ,
    CREATE_BY VARCHAR(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci   COMMENT '创建人' ,
    CREATE_TIME DATETIME    COMMENT '创建时间' ,
    UPDATE_BY VARCHAR(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci   COMMENT '更新人' ,
    UPDATE_TIME DATETIME    COMMENT '更新时间',
    PRIMARY KEY(ID)
)AUTO_INCREMENT = 100 COMMENT = '物业通知 ';


-- 健康宣教
drop table if exists he_board ;
CREATE TABLE he_board(
    ID BIGINT(20)  AUTO_INCREMENT  COMMENT 'ID' ,
    BOARD_CODE VARCHAR(64)    COMMENT '板块编码' ,
    BOARD_NAME VARCHAR(128)  CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  COMMENT '板块名称' ,
    STATUS CHAR(1)    COMMENT '状态 状态 状态 0-正常，1-关闭' ,
    SORT INT(11)   DEFAULT 0  COMMENT '排序，越大排在前面' ,
    CREATE_BY VARCHAR(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci   COMMENT '创建人' ,
    CREATE_TIME DATETIME    COMMENT '创建时间' ,
    UPDATE_BY VARCHAR(32)   CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci COMMENT '更新人' ,
    UPDATE_TIME DATETIME    COMMENT '更新时间',
    PRIMARY KEY(ID)
) AUTO_INCREMENT = 5000 COMMENT = '健康宣教板块 ';


DROP TABLE IF EXISTS `he_article`;
CREATE TABLE `he_article`  (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `BOARD_ID` int(11) DEFAULT NULL COMMENT '板块编码',
  `TITLE` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '文章标题',
  `CONTENT` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci COMMENT '文章内容',
  `WATCH_COUNT` int(11) DEFAULT NULL COMMENT '观看数',
  `send_point` varchar(16) default null comment '是否奖励积分，Y-是，N-否',
  `award_points` int(11) default 0 comment '奖励积分数量',
  `img_urls` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  default null comment '存放图文混排的所有图片url',
  `STATUS` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '状态 状态 状态 0-正常，1-关闭',
  `CREATE_BY` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '创建人',
  `CREATE_TIME` datetime(0) DEFAULT NULL COMMENT '创建时间',
  `UPDATE_BY` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '更新人',
  `UPDATE_TIME` datetime(0) DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '健康宣教宣教文章 ' ROW_FORMAT = Dynamic;


drop table if exists he_video ;
CREATE TABLE he_video(
    ID BIGINT(20)  AUTO_INCREMENT  COMMENT 'ID' ,
    BOARD_ID INT(11)    COMMENT '板块编码' ,
    TITLE VARCHAR(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci   COMMENT '视频标题' ,
    VIDEO_URL VARCHAR(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci COMMENT '视频地址' ,
    WATCH_COUNT INT COMMENT '观看数',
    SEND_POINT varchar(16) default null comment '是否奖励积分，Y-是，N-否',
    AWARD_POINTS int(11) default 0 comment '奖励积分数量',
    STATUS CHAR(1)    COMMENT '状态 状态 状态 0-正常，1-关闭' ,
    CREATE_BY VARCHAR(32)  CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  COMMENT '创建人' ,
    CREATE_TIME DATETIME    COMMENT '创建时间' ,
    UPDATE_BY VARCHAR(32)  CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  COMMENT '更新人' ,
    UPDATE_TIME DATETIME    COMMENT '更新时间',
    PRIMARY KEY(ID)
) COMMENT = '健康宣教宣教视频 ';



-- 首页模块 front page
drop table if exists fp_loop_image ;
CREATE TABLE fp_loop_image(
    ID BIGINT(20)  AUTO_INCREMENT  COMMENT 'ID' ,
    title VARCHAR(64)  CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  COMMENT '广告标题' ,
    image_url VARCHAR(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci   COMMENT '轮播图片url' ,
    STATUS CHAR(1)    COMMENT '状态 状态 状态 0-正常，1-关闭' ,
    SORT INT(11)   DEFAULT 0  COMMENT '排序，越大排在前面' ,
    CREATE_BY VARCHAR(32)  CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  COMMENT '创建人' ,
    CREATE_TIME DATETIME    COMMENT '创建时间' ,
    UPDATE_BY VARCHAR(32)  CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  COMMENT '更新人' ,
    UPDATE_TIME DATETIME    COMMENT '更新时间',
    PRIMARY KEY(ID)
)AUTO_INCREMENT = 100 COMMENT = '首页轮播图 ';



-- 系统会员表 sm
drop table if exists sm_client_user ;
CREATE TABLE `sm_client_user` (
  `USER_ID` bigint(20) AUTO_INCREMENT NOT NULL COMMENT '用户ID',
  `NIKE_NAME` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '用户昵称',
  `USER_CURRENT_POINTS` bigint(20) DEFAULT NULL COMMENT '用户当前积分',
  `USER_ACC_POINTS` bigint(20) DEFAULT NULL COMMENT '用户累计积分',
  `USER_USED_POINTS` bigint(20) DEFAULT NULL COMMENT '用户已用积分',
  `USER_NAME` varchar(32) DEFAULT NULL COMMENT '姓名',
  `USER_MOBILE` varchar(32) DEFAULT NULL COMMENT '手机号',
  `gender` char(1) DEFAULT '2' COMMENT '0-女，1-男，2-未知',
  `PASSWORD` varchar(1024) DEFAULT NULL COMMENT '密码 MD5',
  `REGISTER_TIME` datetime DEFAULT NULL COMMENT '注册时间',
  `LAST_LOGIN_TIME` datetime DEFAULT NULL COMMENT '最近登陆时间',
  `STATUS` char(1) DEFAULT NULL COMMENT '状态 状态 0-正常，1-关闭',
  `CREATE_BY` varchar(32) DEFAULT NULL COMMENT '创建人',
  `CREATE_TIME` datetime DEFAULT NULL COMMENT '创建时间',
  `UPDATE_BY` varchar(32) DEFAULT NULL COMMENT '更新人',
  `UPDATE_TIME` datetime DEFAULT NULL COMMENT '更新时间',
  `AVATAR_URL` varchar(1024) DEFAULT NULL COMMENT '用户头像url',
  `age` int(11) DEFAULT NULL COMMENT '年龄',
  `birthday` varchar(128) DEFAULT NULL COMMENT '生日 yyyy-MM-dd',
  PRIMARY KEY (`USER_ID`)
) AUTO_INCREMENT = 10000000 ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='用户会员表 system memeber';


-- sys_user update
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

INSERT INTO `sys_user` VALUES (1, 103, 'admin', 'admin', '00', 'admin@163.com', '15888888888', '1', '/profile/avatar/2020/03/02/41abbd69b58a66d7c2f68cb804b2649b.png', 'cbc030ef6fc74743fda36e2f76d6908b', '111111', '0', '0', '127.0.0.1', '2020-03-14 14:57:55', 'admin', '2018-03-16 11:33:00', 'admin', '2020-03-14 14:57:55', '管理员', 0, 0, 'fcea920f7412b5da7be0cf42b8c93759');
INSERT INTO `sys_user` VALUES (2, 105, 'hant', 'hant', '00', 'hant@qq.com', '15666666666', '1', '', '19486052ecdfd0df9aa0b6f306cd962c', '546af6', '0', '0', '127.0.0.1', '2020-03-03 10:34:45', 'admin', '2018-03-16 11:33:00', 'admin', '2020-03-03 10:34:45', '测试员', 0, 0, 'db846859bcf906caf61ba74e22953a80');



-- TODO 这个不能单独通过alter在自增主键上修改，会导致AUTO_INCREMENT自增消失
-- alter table cm_community modify column id bigint(20);
-- alter table pm_property modify column id bigint(20);
-- alter table ch_hospital modify column id bigint(20);

-- 设置系统用户自增长值从6亿开始，为了区分与sm_client_user  user_id 很清楚得区分开
-- alter table sys_user AUTO_INCREMENT= 600000000;

 -- <p class="m-t-md">你若不离不弃，我必生死相依 admin  admin123  hant  123456</p>
-- 密码改造（原因: shiro密码登陆方式，很难进行拓展其他方式登陆，但是记录密码原文到数据库有密码泄露风险，遂计划使用md5）：
--          1. 前端页面上传登陆或者注册/重置密码，统一上传密码得md5
--          2. 从而将密码更换成md5，然后进行  loginName+密码+salt进行加密保存数据库
--          3. 保存md5密码，方便下次通过其他方式登陆（手机号，凭证自动登陆）

-- admin 29c67a30398638269fe600f73a054934
-- admin admin123 111111  cbc030ef6fc74743fda36e2f76d6908b
-- INSERT INTO `pepper-ops`.`sys_user`(`user_id`, `dept_id`, `login_name`, `user_name`, `user_type`, `email`, `phonenumber`, `sex`, `avatar`, `password`, `salt`, `status`, `del_flag`, `login_ip`, `login_date`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`, `merchant_flag`, `merchant_Id`, `pwd_md5`) VALUES (1, 103, 'admin', '韩结涛', '00', 'admin@163.com', '15888888888', '1', '/profile/avatar/2020/02/17/1d3120d56f3e28a7012ff5b05a36bfd7.png', 'cbc030ef6fc74743fda36e2f76d6908b', '111111', '0', '0', '127.0.0.1', '2020-03-01 15:17:07', 'admin', '2018-03-16 11:33:00', 'admin', '2020-03-01 15:17:06', '管理员', 0, 0, 'fcea920f7412b5da7be0cf42b8c93759');
-- INSERT INTO `pepper-ops`.`sys_user`(`user_id`, `dept_id`, `login_name`, `user_name`, `user_type`, `email`, `phonenumber`, `sex`, `avatar`, `password`, `salt`, `status`, `del_flag`, `login_ip`, `login_date`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`, `merchant_flag`, `merchant_Id`, `pwd_md5`) VALUES (2, 105, 'hant', 'hant', '00', 'hant@qq.com', '15666666666', '1', '', '19486052ecdfd0df9aa0b6f306cd962c', '546af6', '0', '0', '127.0.0.1', '2020-03-01 15:03:53', 'admin', '2018-03-16 11:33:00', 'admin', '2020-03-01 15:03:52', '测试员', 0, 0, 'db846859bcf906caf61ba74e22953a80');

-- 宣教文章/视频，新增积分激励配置
-- alter table he_article add column send_point varchar(16) default null comment '是否奖励积分，Y-是，N-否';
-- alter table he_article add column award_points int(11) default 0 comment '奖励积分数量';
-- alter table he_article add column img_urls text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  default null comment '存放图文混排的所有图片url';

-- alter table he_video add column send_point varchar(16) default null comment '是否奖励积分，Y-是，N-否';
-- alter table he_video add column award_points int(11) default 0 comment '奖励积分数量';

-- 修改医疗项目收费标准字段的类型
-- alter table ch_medical_project add column fees varchar(128) default null comment '收费标准';

-- 预约 修改成  起止时间配置
-- alter table ch_appointment add column appointment_start_time DATETIME default null comment '预约时间起始';
-- alter table ch_appointment add column appointment_end_time DATETIME default null comment '预约时间结束';
-- alter table ch_appointment add column appointment_reason varchar(256) default null comment '预约原因';

---------------------------------------ops/ops_prod execute-----------------------------------------
-- note reply
-- alter table cm_note add column reply_status char(1) DEFAULT '1' COMMENT '回复状态 0-已回复，1-未回复';
-- alter table cm_note add column reply_content varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci default null comment '留言回复内容';

-- alter table pm_note add column reply_status char(1) DEFAULT '1' COMMENT '回复状态 0-已回复，1-未回复';
-- alter table pm_note add column reply_content varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci default null comment '留言回复内容';





drop table if exists sm_user_point_detail ;
CREATE TABLE sm_user_point_detail(
    ID BIGINT(20)  AUTO_INCREMENT  COMMENT 'ID' ,
    USER_ID BIGINT(20) NOT NULL COMMENT '用户id',
    SYS_USER_ID BIGINT(20) NOT NULL COMMENT '用户系统id',
    POINTS BIGINT(20) default 0  COMMENT '积分数' ,
    ADD_OR_DEDUCT char(1) COMMENT '增加还是减少,0-减，1-加' ,
    OPERATE_TYPE char(1) COMMENT '操作类型：0-系统赠送，1-个人中心签到，2-观看宣教视频，3-观看宣教文章，4-购物赠送，5-消费使用' ,
    OPERATE_TYPE_INFO varchar(256) COMMENT '操作类型描述：0-系统赠送，1-个人中心签到，2-观看宣教视频，3-观看宣教文章，4-购物赠送，5-消费使用' ,
    OPERATE_PROJECT_ID BIGINT(20) DEFAULT NULL COMMENT '操作项目id',
    STATUS CHAR(1) DEFAULT '0'  COMMENT '状态 0-正常，1-关闭' ,
    CREATE_BY VARCHAR(32)  CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  COMMENT '创建人' ,
    CREATE_TIME DATETIME    COMMENT '创建时间' ,
    UPDATE_BY VARCHAR(32)  CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  COMMENT '更新人' ,
    UPDATE_TIME DATETIME    COMMENT '更新时间',
    PRIMARY KEY(ID)
) COMMENT = '用户积分明细表 ';



-- 系统表创建  短信验证码保存表
drop table if exists sms_code ;
CREATE TABLE sms_code(
    ID INT  AUTO_INCREMENT  COMMENT 'ID' ,
    MOBILE_PHONE varchar(32) DEFAULT NULL COMMENT '手机号',
    code VARCHAR(30)   COMMENT '验证码' ,
    code_type VARCHAR(20) COMMENT '验证码类型，R-客户端注册，L-客户端用户手机登陆。。。' ,
    STATUS CHAR(1) DEFAULT '0'  COMMENT '状态 状态 状态 0-正常，1-关闭' ,
    SEND_TIME DATETIME COMMENT '发送时间',
    PRIMARY KEY(ID)
)AUTO_INCREMENT = 1000 COMMENT = '短信验证码 ';

