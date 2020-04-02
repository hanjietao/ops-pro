package com.pepper.project.csc.region.domain;

import com.pepper.framework.web.domain.BaseEntity;

import java.util.Date;

/**
 *  @Description: 社区服务服务中心-区域设置  csc_area
 *  @author: HanJieTao
 *  @mail: hjtxyr@163.com
 *  @Date: 2020/2/6 0:12
 */
public class Region extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 区域主键 */
    private Long id;

    /** 区域上级标识 */
    private String name;

    /** 区域名称 */
    private Integer pid;

    private Integer level;

    /** 地名简称 */
    private String sname;

    private String cityCode;

    private String yzCode;

    private String merName;

    private Float lng;

    private Float lat;

    private String pinYin;
    /** 区域状态（0正常 1关闭） */
    private String status;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Integer getPid() {
        return pid;
    }

    public void setPid(Integer pid) {
        this.pid = pid;
    }

    public Integer getLevel() {
        return level;
    }

    public void setLevel(Integer level) {
        this.level = level;
    }

    public String getSname() {
        return sname;
    }

    public void setSname(String sname) {
        this.sname = sname;
    }

    public String getCityCode() {
        return cityCode;
    }

    public void setCityCode(String cityCode) {
        this.cityCode = cityCode;
    }

    public String getYzCode() {
        return yzCode;
    }

    public void setYzCode(String yzCode) {
        this.yzCode = yzCode;
    }

    public String getMerName() {
        return merName;
    }

    public void setMerName(String merName) {
        this.merName = merName;
    }

    public Float getLng() {
        return lng;
    }

    public void setLng(Float lng) {
        this.lng = lng;
    }

    public Float getLat() {
        return lat;
    }

    public void setLat(Float lat) {
        this.lat = lat;
    }

    public String getPinYin() {
        return pinYin;
    }

    public void setPinYin(String pinYin) {
        this.pinYin = pinYin;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
}
