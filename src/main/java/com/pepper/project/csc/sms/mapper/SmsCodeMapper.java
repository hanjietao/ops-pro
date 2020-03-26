package com.pepper.project.csc.sms.mapper;


import com.pepper.project.csc.sms.domain.SmsCode;

import java.util.List;

public interface SmsCodeMapper {
    SmsCode selectSmsCodeById(Integer id);

    List<SmsCode> selectSmsCodeList(SmsCode smsCode);

    int insertSmsCode(SmsCode smsCode);

    int deleteSmsCodeByIds(String[] ids);

    int updateSmsCode(SmsCode smsCode);
}
