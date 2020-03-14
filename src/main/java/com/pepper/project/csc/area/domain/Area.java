package com.pepper.project.csc.area.domain;

import com.pepper.framework.web.domain.BaseEntity;
import com.pepper.project.monitor.online.domain.OnlineSession;
import com.pepper.project.monitor.online.domain.OnlineSession.OnlineStatus;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

import java.util.Date;

/**
 *  @Description: 社区服务服务中心-区域设置  csc_area
 *  @author: HanJieTao
 *  @mail: hjtxyr@163.com
 *  @Date: 2020/2/6 0:12
 */
public class Area extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 唯一键索引id */
    private Long id;

    /** 区域码Code */
    private String areaCode;

    /** 区域名称 */
    private String areaName;

    /** 经纬度 */
    private String coordinate;

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

    /** 是否存在此区域 默认不存在 */
    private boolean flag = false;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getAreaCode() {
        return areaCode;
    }

    public void setAreaCode(String areaCode) {
        this.areaCode = areaCode;
    }

    public String getAreaName() {
        return areaName;
    }

    public void setAreaName(String areaName) {
        this.areaName = areaName;
    }

    public String getCoordinate() {
        return coordinate;
    }

    public void setCoordinate(String coordinate) {
        this.coordinate = coordinate;
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

    public boolean isFlag() {
        return flag;
    }

    public void setFlag(boolean flag) {
        this.flag = flag;
    }

    @Override
    public String toString() {
        return "Area{" +
                "id=" + id +
                ", areaCode='" + areaCode + '\'' +
                ", areaName='" + areaName + '\'' +
                ", coordinate='" + coordinate + '\'' +
                ", status='" + status + '\'' +
                ", createTime=" + createTime +
                ", createBy='" + createBy + '\'' +
                ", updateTime=" + updateTime +
                ", updateBy='" + updateBy + '\'' +
                '}';
    }
}
