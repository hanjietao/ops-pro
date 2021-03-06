package com.pepper.project.csc.sms.domain;

import com.pepper.framework.web.domain.BaseEntity;

import java.util.Date;

/**
 *  @Description: csc_sms_code
 *  @author: HanJieTao
 *  @mail: hjtxyr@163.com
 *  @Date: 2020/3/26 14:48
 */
public class SmsCode extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 唯一键索引id */
    private Integer id;

    /** 区域码Code */
    private String code;

    private String mobilePhone;

    /** 区域名称 */
    private String codeType;

    /** 区域状态（0正常 1关闭） */
    private String status;

    public static long getSerialVersionUID() {
        return serialVersionUID;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getCodeType() {
        return codeType;
    }

    public void setCodeType(String codeType) {
        this.codeType = codeType;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getMobilePhone() {
        return mobilePhone;
    }

    public void setMobilePhone(String mobilePhone) {
        this.mobilePhone = mobilePhone;
    }

    @Override
    public String toString() {
        return "SmsCode{" +
                "id=" + id +
                ", code='" + code + '\'' +
                ", mobilePhone='" + mobilePhone + '\'' +
                ", codeType='" + codeType + '\'' +
                ", status='" + status + '\'' +
                '}';
    }
}
