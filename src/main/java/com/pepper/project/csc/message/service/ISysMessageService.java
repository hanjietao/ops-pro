package com.pepper.project.csc.message.service;

import com.pepper.project.csc.message.domain.SysMessage;

import java.util.List;

public interface ISysMessageService {

    List<SysMessage> selectSysMessageList(SysMessage sysMessage);
    int insertSysMessage(SysMessage sysMessage);

    int deleteSysMessageByIds(String ids);

    SysMessage selectSysMessageById(Integer id);

    int updateSysMessage(SysMessage sysMessage);

    int unReadCount(SysMessage sysMessage);
}
