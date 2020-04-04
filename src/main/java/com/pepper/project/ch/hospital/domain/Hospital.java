package com.pepper.project.ch.hospital.domain;

import com.pepper.framework.web.domain.BaseEntity;
import com.pepper.project.cm.community.domain.Community;
import com.pepper.project.csc.area.domain.Area;

import java.util.Date;

/**
 *  @Description: 社区医院-医院介绍 ch_hospital
 *  @author: HanJieTao
 *  @mail: hjtxyr@163.com
 *  @Date: 2020/2/6 16:10
 */
public class Hospital extends BaseEntity{

    private static final long serialVersionUID = 1L;

    /** 唯一键索引id */
    private Long id;

    /** 区域码Code */
    private String hosName;

    /** 区域名称 */
    private String hosCode;

    /** 经纬度 */
    private String introduction;

    /** 经纬度 */
    private String communityIds;

    private String areaId;

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

    /** 区域名称 */
    private String areaName;

    /** 区域 */
    private Area area;

    /** 社区 */
    private Community community;

    private String lnglat;

    private String address;

    private String cityCode;

    private String province;
    private String provinceName;

    private String city;
    private String cityName;

    private String district;
    private String districtName;
    private String contactNumber;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getHosName() {
        return hosName;
    }

    public void setHosName(String hosName) {
        this.hosName = hosName;
    }

    public String getHosCode() {
        return hosCode;
    }

    public void setHosCode(String hosCode) {
        this.hosCode = hosCode;
    }

    public String getIntroduction() {
        return introduction;
    }

    public void setIntroduction(String introduction) {
        this.introduction = introduction;
    }

    public String getCommunityIds() {
        return communityIds;
    }

    public void setCommunityIds(String communityIds) {
        this.communityIds = communityIds;
    }

    public String getAreaId() {
        return areaId;
    }

    public void setAreaId(String areaId) {
        this.areaId = areaId;
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

    public String getAreaName() {
        return areaName;
    }

    public void setAreaName(String areaName) {
        this.areaName = areaName;
    }

    public Area getArea() {
        if(area == null){
            area = new Area();
        }
        return area;
    }

    public void setArea(Area area) {
        this.area = area;
    }

    public Community getCommunity() {
        if(community == null){
            community = new Community();
        }
        return community;
    }

    public void setCommunity(Community community) {
        this.community = community;
    }

    public String getLnglat() {
        return lnglat;
    }

    public void setLnglat(String lnglat) {
        this.lnglat = lnglat;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getCityCode() {
        return cityCode;
    }

    public void setCityCode(String cityCode) {
        this.cityCode = cityCode;
    }

    public String getProvince() {
        return province;
    }

    public void setProvince(String province) {
        this.province = province;
    }

    public String getProvinceName() {
        return provinceName;
    }

    public void setProvinceName(String provinceName) {
        this.provinceName = provinceName;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getCityName() {
        return cityName;
    }

    public void setCityName(String cityName) {
        this.cityName = cityName;
    }

    public String getDistrict() {
        return district;
    }

    public void setDistrict(String district) {
        this.district = district;
    }

    public String getDistrictName() {
        return districtName;
    }

    public void setDistrictName(String districtName) {
        this.districtName = districtName;
    }

    public String getContactNumber() {
        return contactNumber;
    }

    public void setContactNumber(String contactNumber) {
        this.contactNumber = contactNumber;
    }

    @Override
    public String toString() {
        return "Appointment{" +
                "id=" + id +
                ", hosName='" + hosName + '\'' +
                ", hosCode='" + hosCode + '\'' +
                ", introduction='" + introduction + '\'' +
                ", communityIds='" + communityIds + '\'' +
                ", areaId='" + areaId + '\'' +
                ", status='" + status + '\'' +
                ", createTime=" + createTime +
                ", createBy='" + createBy + '\'' +
                ", updateTime=" + updateTime +
                ", updateBy='" + updateBy + '\'' +
                ", area=" + area +
                ", community='" + getCommunity() + '\'' +
                ", lnglat=" + lnglat +
                ", address=" + address +
                ", cityCode=" + cityCode +
                ", province=" + province +
                ", provinceName=" + provinceName +
                ", city=" + city +
                ", cityName=" + cityName +
                ", district=" + district +
                ", districtName=" + districtName +
                ", contactNumber=" + contactNumber +
                '}';
    }
}
