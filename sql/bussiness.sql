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
    UPDATE_BY VARCHAR(64)    COMMENT '更新人' ,
    UPDATE_TIME DATETIME    COMMENT '更新时间' ,
    CREATE_BY VARCHAR(64)    COMMENT '创建人' ,
    CREATE_TIME DATETIME    COMMENT '创建时间' ,
    PRIMARY KEY (ID)
) COMMENT = '社区服务服务中心-区域设置';
