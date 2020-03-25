package com.pepper.project.sm.user.domain;

import com.pepper.framework.web.domain.BaseEntity;

import java.util.Date;

public class ClientUser extends BaseEntity {
    private static final long serialVersionUID = 1L;

    /** 唯一键索引id */
    private Long userId;

    /** nikename */
    private String nikeName;

    /** 用户累计积分 */
    private Long userCurrentPoints;

    /** 用户累计积分 */
    private Long userAccPoints;

    /** 用户已用积分 */
    private Long userUsedPoints;

    private String userName;

    private String userMobile;

    /** 用户头像地址 */
    private String avatarUrl;

    //'0-女，1-男，2-未知'
    private String gender;

    private String password;

    private Date registerTime;

    private Date lastLoginTime;

    /** 状态（0正常 1关闭） */
    private String status;

    private Integer age;

    private String birthday;

    /**辅助字段*/
    private Long pointNum;

    public static long getSerialVersionUID() {
        return serialVersionUID;
    }

    public Long getUserId() {
        return userId;
    }

    public void setUserId(Long userId) {
        this.userId = userId;
    }

    public String getNikeName() {
        return nikeName;
    }

    public void setNikeName(String nikeName) {
        this.nikeName = nikeName;
    }

    public Long getUserCurrentPoints() {
        return userCurrentPoints;
    }

    public void setUserCurrentPoints(Long userCurrentPoints) {
        this.userCurrentPoints = userCurrentPoints;
    }

    public Long getUserAccPoints() {
        return userAccPoints;
    }

    public void setUserAccPoints(Long userAccPoints) {
        this.userAccPoints = userAccPoints;
    }

    public Long getUserUsedPoints() {
        return userUsedPoints;
    }

    public void setUserUsedPoints(Long userUsedPoints) {
        this.userUsedPoints = userUsedPoints;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getUserMobile() {
        return userMobile;
    }

    public void setUserMobile(String userMobile) {
        this.userMobile = userMobile;
    }

    public String getAvatarUrl() {
        return avatarUrl;
    }

    public void setAvatarUrl(String avatarUrl) {
        this.avatarUrl = avatarUrl;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public Date getRegisterTime() {
        return registerTime;
    }

    public void setRegisterTime(Date registerTime) {
        this.registerTime = registerTime;
    }

    public Date getLastLoginTime() {
        return lastLoginTime;
    }

    public void setLastLoginTime(Date lastLoginTime) {
        this.lastLoginTime = lastLoginTime;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public Integer getAge() {
        return age;
    }

    public void setAge(Integer age) {
        this.age = age;
    }

    public String getBirthday() {
        return birthday;
    }

    public void setBirthday(String birthday) {
        this.birthday = birthday;
    }

    public Long getPointNum() {
        return pointNum;
    }

    public void setPointNum(Long pointNum) {
        this.pointNum = pointNum;
    }

    @Override
    public String toString() {
        return "ClientUser{" +
                "userId=" + userId +
                ", nikeName='" + nikeName + '\'' +
                ", userCurrentPoints=" + userCurrentPoints +
                ", userAccPoints=" + userAccPoints +
                ", userUsedPoints=" + userUsedPoints +
                ", userName='" + userName + '\'' +
                ", userMobile='" + userMobile + '\'' +
                ", avatarUrl='" + avatarUrl + '\'' +
                ", gender='" + gender + '\'' +
                ", password='" + password + '\'' +
                ", registerTime=" + registerTime +
                ", lastLoginTime=" + lastLoginTime +
                ", status='" + status + '\'' +
                ", age='" + age + '\'' +
                ", birthday='" + birthday + '\'' +
                ", pointNum='" + pointNum + '\'' +
                '}';
    }
}
