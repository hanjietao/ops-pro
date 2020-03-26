package com.pepper.project.csc.message.mapper;


import com.pepper.project.csc.message.domain.SysMessage;

import java.util.List;

public interface SysMessageMapper {
    SysMessage selectSysMessageById(Integer id);
    List<SysMessage> selectSysMessageList(SysMessage sysMessage);

    /**
     * 新增区域信息
     *
     * @param sysMessage 区域信息
     * @return 结果
     */
    public int insertSysMessage(SysMessage sysMessage);

    int deleteSysMessageByIds(String[] ids);

    int updateSysMessage(SysMessage sysMessage);
}
