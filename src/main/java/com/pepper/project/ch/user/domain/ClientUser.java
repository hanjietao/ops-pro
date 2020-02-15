package com.pepper.project.ch.user.domain;

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

    private String password;

    private Date registerTime;

    private Date lastLoginTime;

    /** 状态（0正常 1关闭） */
    private String status;

    public Long getId() {
        return userId;
    }

    public void setId(Long userId) {
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
                ", password='" + password + '\'' +
                ", registerTime=" + registerTime +
                ", lastLoginTime=" + lastLoginTime +
                ", status='" + status + '\'' +
                '}';
    }
}
