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
) COMMENT = '社区服务服务中心-区域设置';

drop table if exists csc_hospital ;
CREATE TABLE csc_hospital(
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
) COMMENT = '社区服务服务中心-医院介绍 ';

CREATE TABLE csc_medical_project(
    ID INT NOT NULL AUTO_INCREMENT  COMMENT '医疗项目ID' ,
    NAME VARCHAR(64)    COMMENT '医疗项目名称' ,
    SERVICE_CONTENT VARCHAR(1024)    COMMENT '服务内容' ,
    PRICE DECIMAL(32,8)    COMMENT '收费标准 45' ,
    DELETE_FLAG VARCHAR(1)  DEFAULT '0'  COMMENT '删除标志 1-已删除，0-未删除' ,
    STATUS CHAR(1)    COMMENT '状态 0-正常，1-关闭' ,
    CREATE_BY VARCHAR(32)    COMMENT '创建人' ,
    CREATE_TIME DATETIME    COMMENT '创建时间' ,
    UPDATE_BY VARCHAR(32)    COMMENT '更新人' ,
    UPDATE_TIME DATETIME    COMMENT '更新时间' ,
    PRIMARY KEY (ID)
) COMMENT = '医疗项目';


CREATE TABLE csc_doctor(
    ID INT NOT NULL   COMMENT '医生ID' ,
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
) COMMENT = '医生管理 ';

CREATE TABLE csc_appointment(
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
) COMMENT = '社区 ';

// TODO 需要新增活动所属社区
CREATE TABLE cm_activity(
    ID INT NOT NULL AUTO_INCREMENT  COMMENT '活动ID' ,
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
) COMMENT = '社区活动 ';

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
) COMMENT = '办事指南 ';





-- 会员表
CREATE TABLE cm_client_user(
    USER_ID BIGINT    COMMENT '用户ID' ,
    NIKE_NAME VARCHAR(128)    COMMENT '用户昵称' ,
    USER_CURRENT_POINTS BIGINT    COMMENT '用户当前积分' ,
    USER_ACC_POINTS BIGINT    COMMENT '用户累计积分' ,
    USER_USED_POINTS BIGINT    COMMENT '用户已用积分' ,
    USER_NAME VARCHAR(32)    COMMENT '姓名' ,
    USER_MOBILE VARCHAR(32)    COMMENT '手机号' ,
    PASSWORD VARCHAR(1024)    COMMENT '密码 MD5' ,
    REGISTER_TIME DATETIME    COMMENT '注册时间' ,
    LAST_LOGIN_TIME DATETIME    COMMENT '最近登陆时间' ,
    STATUS CHAR(1)    COMMENT '状态 状态 0-正常，1-关闭' ,
    CREATED_BY VARCHAR(32)    COMMENT '创建人' ,
    CREATED_TIME DATETIME    COMMENT '创建时间' ,
    UPDATED_BY VARCHAR(32)    COMMENT '更新人' ,
    UPDATED_TIME DATETIME    COMMENT '更新时间',
    PRIMARY KEY (USER_ID)
) COMMENT = '用户会员表 community memeber';



