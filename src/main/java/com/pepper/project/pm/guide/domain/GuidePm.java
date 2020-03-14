package com.pepper.project.pm.guide.domain;

import com.pepper.framework.web.domain.BaseEntity;
import com.pepper.project.pm.property.domain.Property;

import java.util.Date;

/**
 *  @Description: 社区服务服务中心-办事指南 cm_business_guide
 *  @author: HanJieTao
 *  @mail: hjtxyr@163.com
 *  @Date: 2020/2/6 16:10
 */
public class GuidePm extends BaseEntity{

    private static final long serialVersionUID = 1L;

    /** 唯一键索引id */
    private Long id;

    /** 标题 */
    private String title;

    /** 指南内容 */
    private String content;

    /** 所属物业 */
    private Long propertyId;

    /** 区域状态（0正常 1关闭） */
    private String status;

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

    public Long getPropertyId() {
        return propertyId;
    }

    public void setPropertyId(Long propertyId) {
        this.propertyId = propertyId;
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

    public Property getProperty() {
        if(property==null){
            property = new Property();
        }
        return property;
    }

    public void setProperty(Property property) {
        this.property = property;
    }

    @Override
    public String toString() {
        return "Guide{" +
                "id=" + id +
                ", title='" + title + '\'' +
                ", content='" + content + '\'' +
                ", propertyId=" + propertyId +
                ", status='" + status + '\'' +
                ", createTime=" + createTime +
                ", createBy='" + createBy + '\'' +
                ", updateTime=" + updateTime +
                ", updateBy='" + updateBy + '\'' +
                ", property='" + getProperty() + '\'' +
                '}';
    }
}
