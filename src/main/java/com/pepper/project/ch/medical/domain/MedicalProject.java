package com.pepper.project.ch.medical.domain;

import com.pepper.framework.web.domain.BaseEntity;
import com.pepper.project.ch.hospital.domain.Hospital;

import java.util.Date;

/**
 *  @Description: 社区医院-医疗项目 ch_medical_project
 *  @author: HanJieTao
 *  @mail: hjtxyr@163.com
 *  @Date: 2020/2/6 16:10
 */
public class MedicalProject extends BaseEntity{

    private static final long serialVersionUID = 1L;

    /** 唯一键索引id */
    private Integer id;

    /** 区域码Code */
    private String name;

    /** 区域名称 */
    private String serviceContent;

    /** 经纬度 */
    private String price;

    /** 收费标准 */
    private String fees;

    private String deleteFlag;

    private Long hospitalId;

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

    private Hospital hospital;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getServiceContent() {
        return serviceContent;
    }

    public void setServiceContent(String serviceContent) {
        this.serviceContent = serviceContent;
    }

    public String getPrice() {
        return price;
    }

    public void setPrice(String price) {
        this.price = price;
    }

    public String getFees() {
        return fees;
    }

    public void setFees(String fees) {
        this.fees = fees;
    }

    public String getDeleteFlag() {
        return deleteFlag;
    }

    public void setDeleteFlag(String deleteFlag) {
        this.deleteFlag = deleteFlag;
    }

    public Long getHospitalId() {
        return hospitalId;
    }

    public void setHospitalId(Long hospitalId) {
        this.hospitalId = hospitalId;
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

    public Hospital getHospital() {
        if(hospital == null){
            hospital = new Hospital();
        }
        return hospital;
    }

    public void setHospital(Hospital hospital) {
        this.hospital = hospital;
    }

    @Override
    public String toString() {
        return "MedicalProject{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", serviceContent='" + serviceContent + '\'' +
                ", price='" + price + '\'' +
                ", fees='" + fees + '\'' +
                ", deleteFlag='" + deleteFlag + '\'' +
                ", hospitalId='" + hospitalId + '\'' +
                ", status='" + status + '\'' +
                ", createTime=" + createTime +
                ", createBy='" + createBy + '\'' +
                ", updateTime=" + updateTime +
                ", updateBy='" + updateBy + '\'' +
                ", areaName='" + areaName + '\'' +
                ", hospital='" + getHospital() + '\'' +
                '}';
    }
}
