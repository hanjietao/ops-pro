package com.pepper.project.csc.sms.service;

import com.pepper.common.utils.security.ShiroUtils;
import com.pepper.common.utils.text.Convert;
import com.pepper.project.csc.message.domain.SysMessage;
import com.pepper.project.csc.message.mapper.SysMessageMapper;
import com.pepper.project.csc.message.service.ISysMessageService;
import com.pepper.project.csc.sms.domain.SmsCode;
import com.pepper.project.csc.sms.mapper.SmsCodeMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class SmsCodeServiceImpl implements ISmsCodeService {

    @Autowired
    private SmsCodeMapper smsCodeDao;

    @Override
    public List<SmsCode> selectSmsCodeList(SmsCode smsCode) {
        return smsCodeDao.selectSmsCodeList(smsCode);
    }

    @Override
    public int insertSmsCode(SmsCode smsCode) {
        smsCode.setCreateBy(ShiroUtils.getLoginName());
        smsCode.setUpdateBy(ShiroUtils.getLoginName());
        return smsCodeDao.insertSmsCode(smsCode);
    }

    @Override
    public int deleteSmsCodeByIds(String ids) {
        return smsCodeDao.deleteSmsCodeByIds(Convert.toStrArray(ids));
    }

    @Override
    public SmsCode selectSmsCodeById(Integer id) {
        return smsCodeDao.selectSmsCodeById(id);
    }

    @Override
    public int updateSmsCode(SmsCode smsCode) {
        smsCode.setUpdateBy(ShiroUtils.getLoginName());
        return smsCodeDao.updateSmsCode(smsCode);
    }


}
