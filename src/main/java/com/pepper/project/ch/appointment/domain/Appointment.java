package com.pepper.project.ch.appointment.domain;

import com.pepper.framework.web.domain.BaseEntity;
import com.pepper.project.ch.hospital.domain.Hospital;
import com.pepper.project.ch.medical.domain.MedicalProject;

import java.util.Date;

/**
 *  @Description: 社区医院-预约管理 ch_appointment
 *  @author: HanJieTao
 *  @mail: hjtxyr@163.com
 *  @Date: 2020/2/6 16:10
 */
public class Appointment extends BaseEntity{

    private static final long serialVersionUID = 1L;

    /** 唯一键索引id */
    private Integer id;

    /** 用户Id */
    private Long userId;

    /** 医院id */
    private Integer hospitalId;

    /** 经纬医疗项目 */
    private Integer medicalProjectId;

    /** 预约时间 */
    private Date appointmentTime;

    /** 预约人*/
    private String appointmentName;

    /** 预约人联系手机号*/
    private String appointmentPhone;

    /** 取消原因 */
    private String cancelReason;

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

    /** 医院 */
    private Hospital hospital;

    /** 医疗项目 */
    private MedicalProject medicalProject;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Long getUserId() {
        return userId;
    }

    public void setUserId(Long userId) {
        this.userId = userId;
    }

    public Integer getHospitalId() {
        return hospitalId;
    }

    public void setHospitalId(Integer hospitalId) {
        this.hospitalId = hospitalId;
    }

    public Integer getMedicalProjectId() {
        return medicalProjectId;
    }

    public void setMedicalProjectId(Integer medicalProjectId) {
        this.medicalProjectId = medicalProjectId;
    }

    public Date getAppointmentTime() {
        return appointmentTime;
    }

    public void setAppointmentTime(Date appointmentTime) {
        this.appointmentTime = appointmentTime;
    }

    public String getAppointmentName() {
        return appointmentName;
    }

    public void setAppointmentName(String appointmentName) {
        this.appointmentName = appointmentName;
    }

    public String getAppointmentPhone() {
        return appointmentPhone;
    }

    public void setAppointmentPhone(String appointmentPhone) {
        this.appointmentPhone = appointmentPhone;
    }

    public String getCancelReason() {
        return cancelReason;
    }

    public void setCancelReason(String cancelReason) {
        this.cancelReason = cancelReason;
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
        if (hospital == null)
        {
            hospital = new Hospital();
        }
        return hospital;
    }

    public void setHospital(Hospital hospital) {
        this.hospital = hospital;
    }

    public MedicalProject getMedicalProject() {
        if (medicalProject == null)
        {
            medicalProject = new MedicalProject();
        }
        return medicalProject;
    }

    public void setMedicalProject(MedicalProject medicalProject) {
        this.medicalProject = medicalProject;
    }

    @Override
    public String toString() {
        return "Appointment{" +
                "id=" + id +
                ", userId=" + userId +
                ", hospitalId=" + hospitalId +
                ", medicalProjectId=" + medicalProjectId +
                ", appointmentTime=" + appointmentTime +
                ", appointmentName='" + appointmentName + '\'' +
                ", appointmentPhone='" + appointmentPhone + '\'' +
                ", status='" + status + '\'' +
                ", cancelReason='" + cancelReason + '\'' +
                ", createTime=" + createTime +
                ", createBy='" + createBy + '\'' +
                ", updateTime=" + updateTime +
                ", updateBy='" + updateBy + '\'' +
                ", hospital='" + getHospital() + '\'' +
                ", medicalProject='" + getMedicalProject() + '\'' +
                '}';
    }
}
