-- 社区服务中心
-- ----------------------------
-- 1、区域   表名需要小写
-- ----------------------------
drop table if exists csc_area ;
CREATE TABLE csc_area(
    ID INT AUTO_INCREMENT NOT NULL   COMMENT '区域ID 区域管理ID' ,
    AREA_CODE VARCHAR(64) NOT NULL   COMMENT '区域Code：沙区-sybk' ,
    AREA_NAME VARCHAR(128)    COMMENT '区域名称 例如：沙依巴克区' ,
    COORDINATE VARCHAR(64)    COMMENT '经纬度' ,
    STATUS CHAR(1) DEFAULT 0 COMMENT '状态 0-正常，1-关闭' ,
    UPDATE_BY VARCHAR(64)    COMMENT '更新人' ,
    UPDATE_TIME DATETIME    COMMENT '更新时间' ,
    CREATE_BY VARCHAR(64)    COMMENT '创建人' ,
    CREATE_TIME DATETIME    COMMENT '创建时间' ,
    PRIMARY KEY (ID)
)AUTO_INCREMENT = 100000 COMMENT = '社区服务服务中心-区域设置';


-- 社区

CREATE TABLE cm_community(
    ID INT  AUTO_INCREMENT  COMMENT '社区ID' ,
    COMMUNITY_CODE VARCHAR(128)    COMMENT '社区编码' ,
    COMMUNITY_NAME VARCHAR(128)    COMMENT '社区名称' ,
    AREA_ID INT    COMMENT '社区所属区域ID' ,
    INTRODUCTION TEXT    COMMENT '社区介绍' ,
    STATUS CHAR(1)    COMMENT '状态 0-正常，1-关闭（取消预约）' ,
    CREATE_BY VARCHAR(32)    COMMENT '创建人' ,
    CREATE_TIME DATETIME    COMMENT '创建时间' ,
    UPDATE_BY VARCHAR(32)    COMMENT '更新人' ,
    UPDATE_TIME DATETIME    COMMENT '更新时间',
		PRIMARY KEY(ID)
) AUTO_INCREMENT = 200000 COMMENT = '社区 ';

// TODO 需要新增活动所属社区
CREATE TABLE cm_activity(
    ID INT NOT NULL AUTO_INCREMENT  COMMENT '活动ID' ,
    COMMUNITY_ID INT COMMENT '社区',
    TITLE VARCHAR(128)    COMMENT '活动标题' ,
    CONTENT TEXT    COMMENT '活动内容' ,
    STATUS CHAR(1)    COMMENT '状态 0-正常，1-关闭' ,
    CREATE_BY VARCHAR(32)    COMMENT '创建人' ,
    CREATE_TIME DATETIME    COMMENT '创建时间' ,
    UPDATE_BY VARCHAR(32)    COMMENT '更新人' ,
    UPDATE_TIME DATETIME    COMMENT '更新时间' ,
    PRIMARY KEY (ID)
) COMMENT = '社区活动 ';

CREATE TABLE cm_activity_apply(
    ID INT NOT NULL AUTO_INCREMENT  COMMENT '活动ID' ,
    activity_id INT    COMMENT '活动id' ,
    USER_ID BIGINT(20)    COMMENT '用户id' ,
    USER_MOBILE VARCHAR(20) COMMENT '用户手机号，参加活动用',
    STATUS CHAR(1)    COMMENT '状态 0-正常，1-关闭' ,
    CREATE_BY VARCHAR(32)    COMMENT '创建人' ,
    CREATE_TIME DATETIME    COMMENT '创建时间' ,
    UPDATE_BY VARCHAR(32)    COMMENT '更新人' ,
    UPDATE_TIME DATETIME    COMMENT '更新时间' ,
    PRIMARY KEY (ID)
) COMMENT = '社区活动报名表 ';

CREATE TABLE cm_business_guide(
    ID INT  AUTO_INCREMENT  COMMENT '办事指南ID' ,
    TITLE VARCHAR(128)    COMMENT '指南标题' ,
    CONTENT TEXT COMMENT '指南内容' ,
    COMMUNITY_ID INT    COMMENT '所属社区' ,
    STATUS CHAR(1)    COMMENT '状态 状态 0-正常，1-关闭' ,
    CREATE_BY VARCHAR(32)    COMMENT '创建人' ,
    CREATE_TIME DATETIME    COMMENT '创建时间' ,
    UPDATE_BY VARCHAR(32)    COMMENT '更新人' ,
    UPDATE_TIME DATETIME    COMMENT '更新时间',
    PRIMARY KEY (ID)
)AUTO_INCREMENT = 1000 COMMENT = '社区办事指南 ';

CREATE TABLE cm_note(
    ID INT  AUTO_INCREMENT  COMMENT '留言ID' ,
    CONTENT TEXT    COMMENT '留言内容' ,
    USER_ID BIGINT(20) COMMENT '用户id',
    COMMUNITY_ID INT    COMMENT '所属社区' ,
    STATUS CHAR(1)    COMMENT '状态 状态 状态 0-正常，1-关闭' ,
    CREATE_BY VARCHAR(32)    COMMENT '创建人' ,
    CREATE_TIME DATETIME    COMMENT '创建时间' ,
    UPDATE_BY VARCHAR(32)    COMMENT '更新人' ,
    UPDATE_TIME DATETIME    COMMENT '更新时间',
    PRIMARY KEY(ID)
) COMMENT = '用户留言社区 ';


-- 社区医院
drop table if exists ch_hospital ;
CREATE TABLE ch_hospital(
    ID INT NOT NULL AUTO_INCREMENT COMMENT '医院ID' ,
    HOS_NAME VARCHAR(128)    COMMENT '医院名称' ,
    HOS_CODE VARCHAR(64)    COMMENT '医院英文名' ,
    INTRODUCTION TEXT    COMMENT '医院介绍' ,
    COMMUNITY_IDS VARCHAR(32)    COMMENT '服务的社区IDS 社区1，社区2，。。。' ,
    AREA_ID VARCHAR(32)    COMMENT '所属区域' ,
    STATUS CHAR(1)    COMMENT '状态 0-正常，1-关闭' ,
    CREATE_BY VARCHAR(32)    COMMENT '创建人' ,
    CREATE_TIME DATETIME    COMMENT '创建时间' ,
    UPDATE_BY VARCHAR(32)    COMMENT '更新人' ,
    UPDATE_TIME DATETIME    COMMENT '更新时间' ,
    PRIMARY KEY (ID)
) AUTO_INCREMENT = 300000 COMMENT = '社区服务服务中心-医院介绍 ';

CREATE TABLE ch_medical_project(
    ID INT NOT NULL AUTO_INCREMENT  COMMENT '医疗项目ID' ,
    NAME VARCHAR(64)    COMMENT '医疗项目名称' ,
    SERVICE_CONTENT VARCHAR(1024)    COMMENT '服务内容' ,
    PRICE DECIMAL(32,2)    COMMENT '收费标准 45' ,
    HOSPITAL_ID INT(11)    COMMENT '医院id' ,
    DELETE_FLAG VARCHAR(1)  DEFAULT '0'  COMMENT '删除标志 1-已删除，0-未删除' ,
    STATUS CHAR(1)    COMMENT '状态 0-正常，1-关闭' ,
    CREATE_BY VARCHAR(32)    COMMENT '创建人' ,
    CREATE_TIME DATETIME    COMMENT '创建时间' ,
    UPDATE_BY VARCHAR(32)    COMMENT '更新人' ,
    UPDATE_TIME DATETIME    COMMENT '更新时间' ,
    PRIMARY KEY (ID)
) AUTO_INCREMENT = 1000 COMMENT = '医疗项目';


CREATE TABLE ch_doctor(
    ID INT NOT NULL AUTO_INCREMENT  COMMENT '医生ID' ,
    DOCTOR_CODE INT NOT NULL   COMMENT '医生ID' ,
    DOCTOR_NAME VARCHAR(64)    COMMENT '医生名称' ,
    MAJOR_FIELD VARCHAR(128)  COMMENT '专业方向介绍' ,
    DOCTOR_TYPE INT COMMENT '医生类型1-主治医生，2-助理医生，3-实习医生' ,
    HOSPITAL_ID INT    COMMENT '所属医院' ,
    STATUS CHAR(1)    COMMENT '状态 0-正常，1-关闭' ,
    CREATE_BY VARCHAR(32)    COMMENT '创建人' ,
    CREATE_TIME DATETIME    COMMENT '创建时间' ,
    UPDATE_BY VARCHAR(32)    COMMENT '更新人' ,
    UPDATE_TIME DATETIME    COMMENT '更新时间' ,
    PRIMARY KEY (ID)
) AUTO_INCREMENT = 2000 COMMENT = '医生管理 ';

CREATE TABLE ch_appointment(
    ID INT NOT NULL AUTO_INCREMENT  COMMENT '预约ID' ,
    USER_ID BIGINT(20) NOT NULL COMMENT '用户id',
    HOSPITAL_ID INT    COMMENT '预约医院ID',
    MEDICAL_PROJECT_ID INT    COMMENT '预约服务项目ID' ,
    APPOINTMENT_TIME Date    COMMENT '预约日期' ,
    APPOINTMENT_NAME VARCHAR(64)    COMMENT '预约人姓名' ,
    APPOINTMENT_PHONE VARCHAR(20)    COMMENT '预约人手机号' ,
    CANCEL_REASON VARCHAR(20) COMMENT '取消原因' ,
    STATUS CHAR(1)    COMMENT '状态 0-正常，1-关闭（取消预约）' ,
    CREATE_BY VARCHAR(32)    COMMENT '创建人' ,
    CREATE_TIME DATETIME    COMMENT '创建时间' ,
    UPDATE_BY VARCHAR(32)    COMMENT '更新人' ,
    UPDATE_TIME DATETIME    COMMENT '更新时间' ,
    PRIMARY KEY (ID)
) COMMENT = '预约管理 ';




-- 物业
CREATE TABLE pm_property(
    ID INT  AUTO_INCREMENT  COMMENT '社区ID' ,
    PROPERTY_CODE VARCHAR(128)    COMMENT '社区编码' ,
    PROPERTY_NAME VARCHAR(128)    COMMENT '社区名称' ,
    AREA_ID INT    COMMENT '社区所属区域ID' ,
    INTRODUCTION TEXT    COMMENT '社区介绍' ,
    STATUS CHAR(1)    COMMENT '状态 0-正常，1-关闭（取消预约）' ,
    CREATE_BY VARCHAR(32)    COMMENT '创建人' ,
    CREATE_TIME DATETIME    COMMENT '创建时间' ,
    UPDATE_BY VARCHAR(32)    COMMENT '更新人' ,
    UPDATE_TIME DATETIME    COMMENT '更新时间',
		PRIMARY KEY(ID)
)AUTO_INCREMENT = 400000 COMMENT = '物业 ';

-- 需要新增活动所属社区
CREATE TABLE pm_activity(
    ID INT NOT NULL AUTO_INCREMENT  COMMENT '活动ID' ,
    PROPERTY_ID INT COMMENT '物业',
    TITLE VARCHAR(128)    COMMENT '活动标题' ,
    CONTENT TEXT    COMMENT '活动内容' ,
    STATUS CHAR(1)    COMMENT '状态 0-正常，1-关闭' ,
    CREATE_BY VARCHAR(32)    COMMENT '创建人' ,
    CREATE_TIME DATETIME    COMMENT '创建时间' ,
    UPDATE_BY VARCHAR(32)    COMMENT '更新人' ,
    UPDATE_TIME DATETIME    COMMENT '更新时间' ,
    PRIMARY KEY (ID)
) COMMENT = '物业活动 ';

CREATE TABLE pm_activity_apply(
    ID INT NOT NULL AUTO_INCREMENT  COMMENT '活动ID' ,
    activity_id INT    COMMENT '活动id' ,
    USER_ID BIGINT(20)    COMMENT '用户id' ,
    USER_MOBILE VARCHAR(20) COMMENT '用户手机号，参加活动用',
    STATUS CHAR(1)    COMMENT '状态 0-正常，1-关闭' ,
    CREATE_BY VARCHAR(32)    COMMENT '创建人' ,
    CREATE_TIME DATETIME    COMMENT '创建时间' ,
    UPDATE_BY VARCHAR(32)    COMMENT '更新人' ,
    UPDATE_TIME DATETIME    COMMENT '更新时间' ,
    PRIMARY KEY (ID)
) COMMENT = '物业活动报名 ';

CREATE TABLE pm_business_guide(
    ID INT  AUTO_INCREMENT  COMMENT '办事指南ID' ,
    TITLE VARCHAR(128)    COMMENT '指南标题' ,
    CONTENT TEXT COMMENT '指南内容' ,
    PROPERTY_ID INT    COMMENT '所属物业' ,
    STATUS CHAR(1)    COMMENT '状态 状态 0-正常，1-关闭' ,
    CREATE_BY VARCHAR(32)    COMMENT '创建人' ,
    CREATE_TIME DATETIME    COMMENT '创建时间' ,
    UPDATE_BY VARCHAR(32)    COMMENT '更新人' ,
    UPDATE_TIME DATETIME    COMMENT '更新时间',
    PRIMARY KEY (ID)
)AUTO_INCREMENT = 2000 COMMENT = '办事指南 ';

CREATE TABLE pm_note(
    ID INT  AUTO_INCREMENT  COMMENT '留言ID' ,
    CONTENT TEXT    COMMENT '留言内容' ,
    USER_ID BIGINT(20) COMMENT '用户id',
    PROPERTY_ID INT    COMMENT '所属物业' ,
    STATUS CHAR(1)    COMMENT '状态 状态 状态 0-正常，1-关闭' ,
    CREATE_BY VARCHAR(32)    COMMENT '创建人' ,
    CREATE_TIME DATETIME    COMMENT '创建时间' ,
    UPDATE_BY VARCHAR(32)    COMMENT '更新人' ,
    UPDATE_TIME DATETIME    COMMENT '更新时间',
    PRIMARY KEY(ID)
) COMMENT = '用户留言物业 ';

CREATE TABLE pm_notice(
    ID INT  AUTO_INCREMENT  COMMENT 'ID' ,
    TITLE VARCHAR(1024)    COMMENT '通知内容' ,
    CONTENT TEXT    COMMENT '通知内容' ,
    PROPERTY_ID INT    COMMENT '物业id' ,
    STATUS CHAR(1)    COMMENT '状态 状态 状态 0-正常，1-关闭' ,
    CREATE_BY VARCHAR(32)    COMMENT '创建人' ,
    CREATE_TIME DATETIME    COMMENT '创建时间' ,
    UPDATE_BY VARCHAR(32)    COMMENT '更新人' ,
    UPDATE_TIME DATETIME    COMMENT '更新时间',
    PRIMARY KEY(ID)
)AUTO_INCREMENT = 100 COMMENT = '物业通知 ';


-- 健康宣教

CREATE TABLE he_board(
    ID INT  AUTO_INCREMENT  COMMENT 'ID' ,
    BOARD_CODE VARCHAR(64)    COMMENT '板块编码' ,
    BOARD_NAME VARCHAR(128)    COMMENT '板块名称' ,
    STATUS CHAR(1)    COMMENT '状态 状态 状态 0-正常，1-关闭' ,
    SORT INT(11)   DEFAULT 0  COMMENT '排序，越大排在前面' ,
    CREATE_BY VARCHAR(32)    COMMENT '创建人' ,
    CREATE_TIME DATETIME    COMMENT '创建时间' ,
    UPDATE_BY VARCHAR(32)    COMMENT '更新人' ,
    UPDATE_TIME DATETIME    COMMENT '更新时间',
    PRIMARY KEY(ID)
) AUTO_INCREMENT = 5000 COMMENT = '健康宣教板块 ';

CREATE TABLE he_article(
    ID INT  AUTO_INCREMENT  COMMENT 'ID' ,
    BOARD_ID INT(11)    COMMENT '板块编码' ,
    TITLE VARCHAR(128)    COMMENT '文章标题' ,
    CONTENT TEXT COMMENT '文章内容' ,
    WATCH_COUNT INT COMMENT '观看数',
    STATUS CHAR(1)    COMMENT '状态 状态 状态 0-正常，1-关闭' ,
    CREATE_BY VARCHAR(32)    COMMENT '创建人' ,
    CREATE_TIME DATETIME    COMMENT '创建时间' ,
    UPDATE_BY VARCHAR(32)    COMMENT '更新人' ,
    UPDATE_TIME DATETIME    COMMENT '更新时间',
    PRIMARY KEY(ID)
) COMMENT = '健康宣教宣教文章 ';

CREATE TABLE he_video(
    ID INT  AUTO_INCREMENT  COMMENT 'ID' ,
    BOARD_ID INT(11)    COMMENT '板块编码' ,
    TITLE VARCHAR(128)    COMMENT '视频标题' ,
    VIDEO_URL VARCHAR(1024) COMMENT '视频地址' ,
    WATCH_COUNT INT COMMENT '观看数',
    STATUS CHAR(1)    COMMENT '状态 状态 状态 0-正常，1-关闭' ,
    CREATE_BY VARCHAR(32)    COMMENT '创建人' ,
    CREATE_TIME DATETIME    COMMENT '创建时间' ,
    UPDATE_BY VARCHAR(32)    COMMENT '更新人' ,
    UPDATE_TIME DATETIME    COMMENT '更新时间',
    PRIMARY KEY(ID)
) COMMENT = '健康宣教宣教视频 ';



-- 首页模块 front page
CREATE TABLE fp_loop_image(
    ID INT  AUTO_INCREMENT  COMMENT 'ID' ,
    title VARCHAR(64)    COMMENT '广告标题' ,
    image_url VARCHAR(1024)    COMMENT '轮播图片url' ,
    STATUS CHAR(1)    COMMENT '状态 状态 状态 0-正常，1-关闭' ,
    SORT INT(11)   DEFAULT 0  COMMENT '排序，越大排在前面' ,
    CREATE_BY VARCHAR(32)    COMMENT '创建人' ,
    CREATE_TIME DATETIME    COMMENT '创建时间' ,
    UPDATE_BY VARCHAR(32)    COMMENT '更新人' ,
    UPDATE_TIME DATETIME    COMMENT '更新时间',
    PRIMARY KEY(ID)
)AUTO_INCREMENT = 100 COMMENT = '首页轮播图 ';



-- 系统会员表 sm
CREATE TABLE sm_client_user(
    USER_ID BIGINT    COMMENT '用户ID' ,
    NIKE_NAME VARCHAR(128)    COMMENT '用户昵称' ,
    USER_CURRENT_POINTS BIGINT    COMMENT '用户当前积分' ,
    USER_ACC_POINTS BIGINT    COMMENT '用户累计积分' ,
    USER_USED_POINTS BIGINT    COMMENT '用户已用积分' ,
    USER_NAME VARCHAR(32)    COMMENT '姓名' ,
    AVATAR_URL VARCHAR(1024)    COMMENT '用户头像url' ,
    USER_MOBILE VARCHAR(32)    COMMENT '手机号' ,
    gender CHAR(1)  default 2  COMMENT '0-男，1-女，2-未知' ,
    PASSWORD VARCHAR(1024)    COMMENT '密码 MD5' ,
    REGISTER_TIME DATETIME    COMMENT '注册时间' ,
    LAST_LOGIN_TIME DATETIME    COMMENT '最近登陆时间' ,
    age int(11) comment '年龄',
    birthday varchar(128) comment '生日 yyyy-MM-dd',
    STATUS CHAR(1)    COMMENT '状态 状态 0-正常，1-关闭' ,
    CREATED_BY VARCHAR(32)    COMMENT '创建人' ,
    CREATED_TIME DATETIME    COMMENT '创建时间' ,
    UPDATED_BY VARCHAR(32)    COMMENT '更新人' ,
    UPDATED_TIME DATETIME    COMMENT '更新时间',
    PRIMARY KEY (USER_ID)
) AUTO_INCREMENT = 10000000 COMMENT = '用户会员表 community memeber';


-- sys_user update
alter table sys_user add column merchant_flag int(11) default '0' comment '0-管理员（默认值），1-社区，2-医院，3-物业';
alter table sys_user add column merchant_Id int(11) default '0' comment '商户id';
