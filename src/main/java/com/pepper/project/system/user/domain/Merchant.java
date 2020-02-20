package com.pepper.project.system.user.domain;

import com.pepper.framework.aspectj.lang.annotation.Excel;
import com.pepper.framework.aspectj.lang.annotation.Excel.ColumnType;
import com.pepper.framework.aspectj.lang.annotation.Excel.Type;
import com.pepper.framework.aspectj.lang.annotation.Excels;
import com.pepper.framework.web.domain.BaseEntity;
import com.pepper.project.system.dept.domain.Dept;
import com.pepper.project.system.role.domain.Role;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import org.apache.shiro.crypto.SecureRandomNumberGenerator;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Size;
import java.util.Date;
import java.util.List;

/**
 * 商户，集合社区/物业/医院
 *
 * @author pepper
 */
public class Merchant extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    private Integer merchantId;

    private String merchantCode;

    private String merchantIntroduce;

    private String merchantName;

    private String status;

    private String imageUrl;

    public static long getSerialVersionUID() {
        return serialVersionUID;
    }

    public Integer getMerchantId() {
        return merchantId;
    }

    public void setMerchantId(Integer merchantId) {
        this.merchantId = merchantId;
    }

    public String getMerchantCode() {
        return merchantCode;
    }

    public void setMerchantCode(String merchantCode) {
        this.merchantCode = merchantCode;
    }

    public String getMerchantName() {
        return merchantName;
    }

    public void setMerchantName(String merchantName) {
        this.merchantName = merchantName;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getImageUrl() {
        return imageUrl;
    }

    public void setImageUrl(String imageUrl) {
        this.imageUrl = imageUrl;
    }

    public String getMerchantIntroduce() {
        return merchantIntroduce;
    }

    public void setMerchantIntroduce(String merchantIntroduce) {
        this.merchantIntroduce = merchantIntroduce;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("merchantId", getMerchantId())
            .append("merchantCode", getMerchantCode())
            .append("merchantIntroduce", getMerchantIntroduce())
            .append("merchantName", getMerchantName())
            .append("status", getStatus())
            .append("iamgeUrl", getImageUrl())
            .toString();
    }
}
