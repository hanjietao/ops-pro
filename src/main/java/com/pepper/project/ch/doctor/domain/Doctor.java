package com.pepper.project.ch.doctor.domain;

import com.pepper.framework.web.domain.BaseEntity;
import com.pepper.project.ch.hospital.domain.Hospital;

import java.util.Date;

/**
 *  @Description: 社区医院-医生管理  ch_doctor
 *  @author: HanJieTao
 *  @mail: hjtxyr@163.com
 *  @Date: 2020/2/13 18:19
 */
public class Doctor extends BaseEntity{

    private static final long serialVersionUID = 1L;

    /** 唯一键索引id */
    private Integer id;

    /** 医生名称 */
    private String doctorName;

    /** 医生编码 */
    private String doctorCode;

    /** 主治方向 */
    private String majorField;

    /** 医生类型：1-主治医生，2-助理医生，3-实习医生 */
    private Integer doctorType;

    /** 所属医院 */
    private Integer hospitalId;

    //private String deleteFlag;

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

    private Hospital hospital;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getDoctorName() {
        return doctorName;
    }

    public void setDoctorName(String doctorName) {
        this.doctorName = doctorName;
    }

    public String getDoctorCode() {
        return doctorCode;
    }

    public void setDoctorCode(String doctorCode) {
        this.doctorCode = doctorCode;
    }

    public String getMajorField() {
        return majorField;
    }

    public void setMajorField(String majorField) {
        this.majorField = majorField;
    }

    public Integer getDoctorType() {
        return doctorType;
    }

    public void setDoctorType(Integer doctorType) {
        this.doctorType = doctorType;
    }

    public Integer getHospitalId() {
        return hospitalId;
    }

    public void setHospitalId(Integer hospitalId) {
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
        return "Doctor{" +
                "id=" + id +
                ", doctorName='" + doctorName + '\'' +
                ", doctorCode='" + doctorCode + '\'' +
                ", majorField='" + majorField + '\'' +
                ", doctorType=" + doctorType +
                ", hospitalId=" + hospitalId +
                ", status='" + status + '\'' +
                ", createTime=" + createTime +
                ", createBy='" + createBy + '\'' +
                ", updateTime=" + updateTime +
                ", updateBy='" + updateBy + '\'' +
                ", hospital='" + getHospital() + '\'' +
                '}';
    }
}
