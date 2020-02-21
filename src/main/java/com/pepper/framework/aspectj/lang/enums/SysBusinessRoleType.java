package com.pepper.framework.aspectj.lang.enums;

/**
 *  @Description: 业务系统  权限，不能删除的，与 SysUserType对应
 *  @author: HanJieTao
 *  @mail: hjtxyr@163.com
 *  @Date: 2020/2/21 14:10
 */
public enum SysBusinessRoleType
{
    cadminrole("104","社区管理员"),

    hadminrole("105","医院管理员"),

    padminrole("106","物业管理员"),

    clientrole("107","客户端登陆");

    private String type;
    private String desc;

    private SysBusinessRoleType(String type, String desc) {
        this.type = type;
        this.desc = desc;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getDesc() {
        return desc;
    }

    public void setDesc(String desc) {
        this.desc = desc;
    }


    public static boolean contains(String type) {
        for (SysBusinessRoleType typeEnum : SysBusinessRoleType.values()) {
            if (typeEnum.type.equals(type)) {
                return true;
            }
        }
        return false;
    }
}
