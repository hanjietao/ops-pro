package com.pepper.project.csc.message.service;

import com.pepper.common.utils.security.ShiroUtils;
import com.pepper.common.utils.text.Convert;
import com.pepper.project.csc.message.domain.SysMessage;
import com.pepper.project.csc.message.mapper.SysMessageMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class SysMessageServiceImpl implements ISysMessageService {

    @Autowired
    private SysMessageMapper sysMessageDao;

    @Override
    public List<SysMessage> selectSysMessageList(SysMessage sysMessage) {
        return sysMessageDao.selectSysMessageList(sysMessage);
    }

    @Override
    public int insertSysMessage(SysMessage sysMessage) {
        sysMessage.setCreateBy(ShiroUtils.getLoginName());
        sysMessage.setUpdateBy(ShiroUtils.getLoginName());
        return sysMessageDao.insertSysMessage(sysMessage);
    }

    @Override
    public int deleteSysMessageByIds(String ids) {
        return sysMessageDao.deleteSysMessageByIds(Convert.toStrArray(ids));
    }

    @Override
    public SysMessage selectSysMessageById(Integer id) {
        return sysMessageDao.selectSysMessageById(id);
    }

    @Override
    public int updateSysMessage(SysMessage sysMessage) {
        sysMessage.setUpdateBy(ShiroUtils.getLoginName());
        return sysMessageDao.updateSysMessage(sysMessage);
    }


}
