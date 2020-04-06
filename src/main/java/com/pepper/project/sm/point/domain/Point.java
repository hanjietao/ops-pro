package com.pepper.project.sm.point.domain;

import com.pepper.framework.aspectj.lang.annotation.Excel;
import com.pepper.framework.web.domain.BaseEntity;
import com.pepper.project.sm.user.domain.ClientUser;
import com.pepper.project.system.user.domain.User;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;


/**
 *  @Description: 积分明细表 sm_user_point_detail
 *  @author: HanJieTao
 *  @mail: hjtxyr@163.com
 *  @Date: 2020/3/11 17:31
 */
public class Point extends BaseEntity {

    private static final long serialVersionUID = 1L;

    /** 唯一键索引id */
    private Long id;

    /** 用户id */
    @Excel(name = "用户id")
    private Long userId;

    @Excel(name = "系统用户id")
    private Long sysUserId;

    @Excel(name = "积分数")
    private Long points;

    @Excel(name = "增减，0-减，1-增")
    private String addOrDeduct;

    /** 0-系统赠送，1-个人中心签到，2-观看宣教视频，3-观看宣教文章，4-购物赠送，5-医疗项目消费使用 */
    private String operateType;

    @Excel(name = "操作类型")
    private String operateTypeInfo;

    private Long operateProjectId;

    /** 区域状态（0正常 1关闭） */
    private String status;


    /** 客户端用户 */
    private ClientUser clientUser;

    /** 系统用户 */
    private User sysUser;

    private String userMobile;

    private String createBy;

    //private String

    public static long getSerialVersionUID() {
        return serialVersionUID;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Long getUserId() {
        return userId;
    }

    public void setUserId(Long userId) {
        this.userId = userId;
    }

    public Long getSysUserId() {
        return sysUserId;
    }

    public void setSysUserId(Long sysUserId) {
        this.sysUserId = sysUserId;
    }

    public Long getPoints() {
        return points;
    }

    public void setPoints(Long points) {
        this.points = points;
    }

    public String getAddOrDeduct() {
        return addOrDeduct;
    }

    public void setAddOrDeduct(String addOrDeduct) {
        this.addOrDeduct = addOrDeduct;
    }

    public String getOperateType() {
        return operateType;
    }

    public void setOperateType(String operateType) {
        this.operateType = operateType;
    }

    public String getOperateTypeInfo() {
        return operateTypeInfo;
    }

    public void setOperateTypeInfo(String operateTypeInfo) {
        this.operateTypeInfo = operateTypeInfo;
    }

    public Long getOperateProjectId() {
        return operateProjectId;
    }

    public void setOperateProjectId(Long operateProjectId) {
        this.operateProjectId = operateProjectId;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public ClientUser getClientUser() {
        if(clientUser == null){
            clientUser = new ClientUser();
        }
        return clientUser;
    }

    public void setClientUser(ClientUser clientUser) {
        this.clientUser = clientUser;
    }

    public User getSysUser() {
        if(sysUser == null){
            sysUser = new User();
        }
        return sysUser;
    }

    public void setSysUser(User sysUser) {
        this.sysUser = sysUser;
    }

    public String getUserMobile() {
        return userMobile;
    }

    public void setUserMobile(String userMobile) {
        this.userMobile = userMobile;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this, ToStringStyle.MULTI_LINE_STYLE)
                .append("id", getId())
                .append("userId", getUserId())
                .append("sysUserId", getSysUserId())
                .append("points", getPoints())
                .append("addOrDeduct", getAddOrDeduct())
                .append("operateType", getOperateType())
                .append("operateTypeInfo", getOperateTypeInfo())
                .append("operateProjectId", getOperateProjectId())
                .append("status", getStatus())
                .append("createBy", getCreateBy())
                .append("createTime", getCreateTime())
                .append("updateBy", getUpdateBy())
                .append("updateTime", getUpdateTime())
                .append("sysUser", getSysUser())
                .append("clientUser", getClientUser())
                .append("userMobile", getUserMobile())
                .append("remark", getRemark())
                .toString();
    }
}
