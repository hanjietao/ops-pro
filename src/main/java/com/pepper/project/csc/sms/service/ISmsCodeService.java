package com.pepper.project.csc.sms.service;

import com.pepper.project.csc.sms.domain.SmsCode;

import java.util.List;

public interface ISmsCodeService {

    List<SmsCode> selectSmsCodeList(SmsCode sysMessage);
    int insertSmsCode(SmsCode sysMessage);

    int deleteSmsCodeByIds(String ids);

    SmsCode selectSmsCodeById(Integer id);

    int updateSmsCode(SmsCode sysMessage);

}
