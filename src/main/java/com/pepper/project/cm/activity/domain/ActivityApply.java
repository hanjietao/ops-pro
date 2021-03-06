package com.pepper.project.cm.activity.domain;

import com.pepper.framework.aspectj.lang.annotation.Excel;
import com.pepper.framework.web.domain.BaseEntity;
import com.pepper.project.sm.user.domain.ClientUser;

import java.util.Date;

/**
 *  @Description: 社区服务服务中心-医院介绍 cm_activity
 *  @author: HanJieTao
 *  @mail: hjtxyr@163.com
 *  @Date: 2020/2/6 16:10
 */
public class ActivityApply extends BaseEntity{

    private static final long serialVersionUID = 1L;

    /** 唯一键索引id */
    @Excel(name = "活动报名序号", cellType = Excel.ColumnType.NUMERIC)
    private Long id;

    /** 报名活动 */
    @Excel(name = "活动id")
    private Long activityId;

    /** 报名人id */
    private Long userId;

    /** 报名人填写的手机号。默认使用登陆手机号 */
    @Excel(name = "用户手机号")
    private String userMobile;

    /** 状态（0正常 1关闭） */
    @Excel(name = "状态", readConverterExp = "0=正常,1=停用")
    private String status;

    /** 创建时间 */
    @Excel(name = "创建时间", width = 30, dateFormat = "yyyy-MM-dd HH:mm:ss")
    private Date createTime;

    /** 创建人 */
    private String createBy;

    /** 更新时间 */
    private Date updateTime;

    /** 更新人 */
    private String updateBy;

    /** 活动 */
    private Activity activity;

    /** 客户端用户表 */
    private ClientUser clientUser;

    /** 为了在权限区分是，筛选特定社区的活动 */
    private Long communityId;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Long getActivityId() {
        return activityId;
    }

    public void setActivityId(Long activityId) {
        this.activityId = activityId;
    }

    public Long getUserId() {
        return userId;
    }

    public void setUserId(Long userId) {
        this.userId = userId;
    }

    public String getUserMobile() {
        return userMobile;
    }

    public void setUserMobile(String userMobile) {
        this.userMobile = userMobile;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    @Override
    public Date getCreateTime() {
        return createTime;
    }

    @Override
    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    @Override
    public String getCreateBy() {
        return createBy;
    }

    @Override
    public void setCreateBy(String createBy) {
        this.createBy = createBy;
    }

    @Override
    public Date getUpdateTime() {
        return updateTime;
    }

    @Override
    public void setUpdateTime(Date updateTime) {
        this.updateTime = updateTime;
    }

    @Override
    public String getUpdateBy() {
        return updateBy;
    }

    @Override
    public void setUpdateBy(String updateBy) {
        this.updateBy = updateBy;
    }

    public Activity getActivity() {
        if (activity == null)
        {
            activity = new Activity();
        }
        return activity;
    }

    public void setActivity(Activity activity) {
        this.activity = activity;
    }

    public ClientUser getClientUser() {
        if (clientUser == null)
        {
            clientUser = new ClientUser();
        }
        return clientUser;
    }

    public void setClientUser(ClientUser clientUser) {
        this.clientUser = clientUser;
    }

    public Long getCommunityId() {
        return communityId;
    }

    public void setCommunityId(Long communityId) {
        this.communityId = communityId;
    }

    @Override
    public String toString() {
        return "ActivityApply{" +
                "id=" + id +
                ", activityId='" + activityId + '\'' +
                ", userId='" + userId + '\'' +
                ", userMobile='" + userMobile + '\'' +
                ", status='" + status + '\'' +
                ", createTime=" + createTime +
                ", createBy='" + createBy + '\'' +
                ", updateTime=" + updateTime +
                ", updateBy='" + updateBy + '\'' +
                ", activity='" + getActivity() + '\'' +
                ", clientUser='" + getClientUser() + '\'' +
                ", communityId='" + communityId + '\'' +
                '}';
    }
}
