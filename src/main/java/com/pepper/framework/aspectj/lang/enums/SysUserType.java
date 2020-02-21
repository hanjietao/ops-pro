package com.pepper.framework.aspectj.lang.enums;

/**
 *  @Description: 业务系统  用户类型
 *  @author: HanJieTao
 *  @mail: hjtxyr@163.com
 *  @Date: 2020/2/21 14:10
 */
public enum SysUserType
{
    /**
     * 管理员
     */
    admin("0","总管理员（社区总管，物业总管，医院总管）"),

    /**
     * 失败
     */
    cadmin("1","社区管理员"),

    hadmin("2","医院管理员"),

    padmin("3","物业管理员"),

    client("1001","客户端用户");

    private String type;
    private String desc;

    private SysUserType(String type, String desc) {
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

    public static String getByValue(String value) {
        for (SysUserType typeEnum : SysUserType.values()) {
            if (typeEnum.type == value) {
                return typeEnum.getDesc();
            }
        }
        return "未知类型，请配置enum";
    }
}
