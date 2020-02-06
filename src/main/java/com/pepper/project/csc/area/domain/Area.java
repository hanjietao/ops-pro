package com.pepper.project.csc.area.domain;

import com.pepper.framework.web.domain.BaseEntity;
import com.pepper.project.monitor.online.domain.OnlineSession;
import com.pepper.project.monitor.online.domain.OnlineSession.OnlineStatus;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

import java.util.Date;

/**
 *  @Description: 区域设置
 *  @author: HanJieTao
 *  @mail: hjtxyr@163.com
 *  @Date: 2020/2/6 0:12
 */
public class Area extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 唯一键索引id */
    private Integer id;

    /** 区域码Code */
    private String areaCode;

    /** 区域名称 */
    private String name;

    /** 经纬度 */
    private String coordinate;

    /** 创建时间 */
    private Date createdTime;

    /** 创建人 */
    private String createdBy;

    /** 更新时间 */
    private Date updatedTime;

    /** 更新人 */
    private String updatedBy;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getAreaCode() {
        return areaCode;
    }

    public void setAreaCode(String areaCode) {
        this.areaCode = areaCode;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getCoordinate() {
        return coordinate;
    }

    public void setCoordinate(String coordinate) {
        this.coordinate = coordinate;
    }

    public Date getCreatedTime() {
        return createdTime;
    }

    public void setCreatedTime(Date createdTime) {
        this.createdTime = createdTime;
    }

    public String getCreatedBy() {
        return createdBy;
    }

    public void setCreatedBy(String createdBy) {
        this.createdBy = createdBy;
    }

    public Date getUpdatedTime() {
        return updatedTime;
    }

    public void setUpdatedTime(Date updatedTime) {
        this.updatedTime = updatedTime;
    }

    public String getUpdatedBy() {
        return updatedBy;
    }

    public void setUpdatedBy(String updatedBy) {
        this.updatedBy = updatedBy;
    }

    @Override
    public String toString() {
        return "Area{" +
                "id=" + id +
                ", areaCode='" + areaCode + '\'' +
                ", name='" + name + '\'' +
                ", coordinate='" + coordinate + '\'' +
                ", createdTime=" + createdTime +
                ", createdBy='" + createdBy + '\'' +
                ", updatedTime=" + updatedTime +
                ", updatedBy='" + updatedBy + '\'' +
                '}';
    }
}
