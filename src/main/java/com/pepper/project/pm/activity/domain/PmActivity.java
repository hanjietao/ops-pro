package com.pepper.project.pm.activity.domain;

import com.pepper.framework.web.domain.BaseEntity;
import com.pepper.project.pm.property.domain.Property;

import java.util.Date;

/**
 *  @Description: 物业管理-物业活动 pm_activity
 *  @author: HanJieTao
 *  @mail: hjtxyr@163.com
 *  @Date: 2020/2/6 16:10
 */
public class PmActivity extends BaseEntity{

    private static final long serialVersionUID = 1L;

    /** 唯一键索引id */
    private Long id;

    private Long propertyId;

    /** title */
    private String title;

    /** content */
    private String content;

    /** 区域状态（0正常 1关闭） */
    private String status;

    /** 图文混排里面的所有图片，都好分割 */
    private String imgUrls;

    /** 创建时间 */
    private Date createTime;

    /** 创建人 */
    private String createBy;

    /** 更新时间 */
    private Date updateTime;

    /** 更新人 */
    private String updateBy;

    private Property property;

    public static long getSerialVersionUID() {
        return serialVersionUID;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Long getPropertyId() {
        return propertyId;
    }

    public void setPropertyId(Long propertyId) {
        this.propertyId = propertyId;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
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

    public Property getProperty()
    {
        if(property == null){
            property = new Property();
        }
        return property;
    }

    public void setProperty(Property property) {
        this.property = property;
    }

    public String getImgUrls() {
        return imgUrls;
    }

    public void setImgUrls(String imgUrls) {
        this.imgUrls = imgUrls;
    }

    @Override
    public String toString() {
        return "PmActivity{" +
                "id=" + id +
                ", propertyId=" + propertyId +
                ", title='" + title + '\'' +
                ", content='" + content + '\'' +
                ", status='" + status + '\'' +
                ", imgUrls='" + imgUrls + '\'' +
                ", createTime=" + createTime +
                ", createBy='" + createBy + '\'' +
                ", updateTime=" + updateTime +
                ", updateBy='" + updateBy + '\'' +
                ", property=" + getProperty() +
                '}';
    }
}
