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
  `BOARD_ID` bigint(20) DEFAULT NULL COMMENT '板块编码',
  `TITLE` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '文章标题',
  `CONTENT` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci COMMENT '文章内容',
  `WATCH_COUNT` int(11) DEFAULT NULL COMMENT '观看数',
  `send_point` varchar(16) default null comment '是否奖励积分，Y-是，N-否',
  `award_points` bigint(20) default 0 comment '奖励积分数量',
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
    BOARD_ID BIGINT(20)    COMMENT '板块编码' ,
    TITLE VARCHAR(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci   COMMENT '视频标题' ,
    VIDEO_URL VARCHAR(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci COMMENT '视频地址' ,
    WATCH_COUNT INT COMMENT '观看数',
    SEND_POINT varchar(16) default null comment '是否奖励积分，Y-是，N-否',
    AWARD_POINTS bigint(20) default 0 comment '奖励积分数量',
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
) AUTO_INCREMENT = 20200000 ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='用户会员表 system memeber';


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
)AUTO_INCREMENT = 100 ENGINE=InnoDB DEFAULT CHARSET=utf8mb4  COMMENT = '用户积分明细表 ';

-- 系统表创建  短信验证码保存表
drop table if exists csc_sms_code ;
CREATE TABLE csc_sms_code(
    ID BIGINT(20)  AUTO_INCREMENT  COMMENT 'ID' ,
    MOBILE_PHONE varchar(32) DEFAULT NULL COMMENT '手机号',
    code VARCHAR(30)   COMMENT '验证码' ,
    code_type VARCHAR(20) COMMENT '验证码类型，R-客户端注册，L-客户端用户手机登陆。。。' ,
    STATUS CHAR(1) DEFAULT '0'  COMMENT '状态 状态 状态 0-正常，1-关闭' ,
    CREATE_BY VARCHAR(32)  CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  COMMENT '创建人' ,
    CREATE_TIME DATETIME    COMMENT '创建时间' ,
    UPDATE_BY VARCHAR(32)  CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  COMMENT '更新人' ,
    UPDATE_TIME DATETIME    COMMENT '更新时间',
    PRIMARY KEY(ID)
)AUTO_INCREMENT = 1000 ENGINE=InnoDB DEFAULT CHARSET=utf8mb4  COMMENT = '短信验证码 ';



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
) ENGINE = InnoDB AUTO_INCREMENT = 80000000 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户信息表' ROW_FORMAT = Dynamic;

INSERT INTO `sys_user` VALUES (1, 103, 'admin', 'admin', '00', 'admin@163.com', '15888888888', '1', '/profile/avatar/2020/03/02/41abbd69b58a66d7c2f68cb804b2649b.png', 'cbc030ef6fc74743fda36e2f76d6908b', '111111', '0', '0', '127.0.0.1', '2020-03-14 14:57:55', 'admin', '2018-03-16 11:33:00', 'admin', '2020-03-14 14:57:55', '管理员', 0, 0, 'fcea920f7412b5da7be0cf42b8c93759');
INSERT INTO `sys_user` VALUES (2, 105, 'hant', 'hant', '00', 'hant@qq.com', '15666666666', '1', '', '19486052ecdfd0df9aa0b6f306cd962c', '546af6', '0', '0', '127.0.0.1', '2020-03-03 10:34:45', 'admin', '2018-03-16 11:33:00', 'admin', '2020-03-03 10:34:45', '测试员', 0, 0, 'db846859bcf906caf61ba74e22953a80');


DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role`  (
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`user_id`, `role_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户和角色关联表' ROW_FORMAT = Dynamic;

INSERT INTO `sys_user_role` VALUES (1, 1);
INSERT INTO `sys_user_role` VALUES (2, 2);

DROP TABLE IF EXISTS `sys_user_post`;
CREATE TABLE `sys_user_post`  (
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `post_id` bigint(20) NOT NULL COMMENT '岗位ID',
  PRIMARY KEY (`user_id`, `post_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户与岗位关联表' ROW_FORMAT = Dynamic;

INSERT INTO `sys_user_post` VALUES (1, 1);
INSERT INTO `sys_user_post` VALUES (2, 2);


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

INSERT INTO `sys_dict_type` VALUES (11, '医生类型', 'sys_doctor_type', '0', 'admin', '2020-02-13 12:47:40', 'admin', '2020-02-13 12:48:04', '医生类型列表');
INSERT INTO `sys_dict_type` VALUES (12, '系统用户类型', 'sys_user_type', '0', 'admin', '2020-02-21 10:09:20', 'admin', '2020-02-21 10:14:45', '!!!不要删除!!! 0-管理员，1-社区管理员，2-医院管理员，3-物业管理员，10001-客户端用户');
INSERT INTO `sys_dict_type` VALUES (13, '宣教板块是否奖励积分', 'sys_he_reward_point', '0', 'admin', '2020-03-08 19:41:46', '', NULL, '宣教板块是否奖励积分:1-奖励积分，0-不奖励积分');
INSERT INTO `sys_dict_type` VALUES (14, '留言回复状态', 'note_reply_status', '0', 'admin', '2020-03-11 12:44:40', '', NULL, '留言回复状态note_reply_status');
INSERT INTO `sys_dict_type` VALUES (15, '积分增减状态', 'point_add_or_deduct', '0', 'admin', '2020-03-13 10:55:04', '', NULL, '积分增减状态point_add_or_deduct');
INSERT INTO `sys_dict_type` VALUES (16, '积分操作类型', 'point_operate_type', '0', 'admin', '2020-03-13 11:22:22', '', NULL, '积分操作类型point_operate_type');


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


-- TODO 20200324 new data
INSERT INTO sys_dict_type(`dict_id`, `dict_name`, `dict_type`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (17, '医疗项目预约状态', 'medical_appoint_status', '0', 'admin', '2020-03-23 19:13:12', '', NULL, '医疗项目预约状态:medical_appoint_status\r\n1- 关闭，取消预约\r\n0-正常，待处理\r\n2-已完成');
alter table ch_appointment add column operate_info varchar(256) default null comment '商户操作，备注信息';

-- 医疗项目支持积分抵扣
alter table ch_medical_project add column point_use_flag varchar(8) default 'N' comment '医疗项目是否可用积分抵扣（全额）：Y-可以，N-不可以';
alter table ch_medical_project add column point_num bigint(20) default 0 comment '可用积分抵扣，需要积分数量';

alter table ch_appointment add column point_use_flag varchar(8) default 'N' comment '预约完成是否用积分抵扣';
alter table ch_appointment add column point_num bigint(20) default 0 comment '抵用积分数';


drop table if exists sm_friends ;
CREATE TABLE sm_friends(
    ID BIGINT(20)  AUTO_INCREMENT  COMMENT 'ID' ,
    USER_ID BIGINT(20) COMMENT '用户uid' ,
    FRIEND_USER_ID BIGINT(20) COMMENT '好友uid',
    STATUS CHAR(1)    COMMENT '状态 0-正常已经好友，1-申请  ,2-被申请（等待同意），3-拒绝，4-删除' ,
    CREATE_BY VARCHAR(32)  CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  COMMENT '创建人' ,
    CREATE_TIME DATETIME    COMMENT '创建时间' ,
    UPDATE_BY VARCHAR(32)  CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  COMMENT '更新人' ,
    UPDATE_TIME DATETIME    COMMENT '更新时间',
    UNIQUE INDEX `uniq_idx`(`USER_ID`, `FRIEND_USER_ID`) USING BTREE,
    PRIMARY KEY(ID)
)AUTO_INCREMENT = 100 ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT = '好友表 ';

drop table if exists csc_message;
CREATE TABLE csc_message(
    ID BIGINT(20)  AUTO_INCREMENT  COMMENT 'ID' ,
    USER_ID BIGINT(20) COMMENT '用户uid',
    SYS_USER_ID BIGINT(20) COMMENT '系统用户uid',
    MSG_TYPE VARCHAR(8) COMMENT '消息类型',
    MSG_TITLE VARCHAR(2048) COMMENT '消息内容',
    MSG_CONTENT VARCHAR(2048) COMMENT '消息内容',
    STATUS CHAR(1)    COMMENT '状态 状态 状态 0-正常，1-关闭' ,
    CREATE_BY VARCHAR(32)  CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  COMMENT '创建人' ,
    CREATE_TIME DATETIME    COMMENT '创建时间' ,
    UPDATE_BY VARCHAR(32)  CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  COMMENT '更新人' ,
    UPDATE_TIME DATETIME    COMMENT '更新时间',
    PRIMARY KEY(ID)
)AUTO_INCREMENT = 100 ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT = '系统消息 ';




INSERT INTO `sys_dict_data`(`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (55, 6, '充值送积分', '6', 'point_operate_type', NULL, 'primary', 'Y', '0', 'admin', '2020-03-26 12:55:03', '', NULL, NULL);
INSERT INTO `sys_dict_data`(`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (56, 1, '充值赠送积分', '6', 'point_operate_send_type', NULL, 'primary', 'Y', '0', 'admin', '2020-03-26 12:57:52', '', NULL, NULL);
INSERT INTO `sys_dict_data`(`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (57, 2, '系统赠送', '0', 'point_operate_send_type', NULL, 'primary', 'Y', '0', 'admin', '2020-03-26 12:58:23', '', NULL, NULL);


-- 2020 0329
alter table he_video add column delete_flag varchar(8) default 0 comment '删除标志1-已删除，0-未删除';
alter table he_article add column delete_flag varchar(8) default 0 comment '删除标志1-已删除，0-未删除';



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





