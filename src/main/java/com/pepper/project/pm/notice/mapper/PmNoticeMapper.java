package com.pepper.project.pm.notice.mapper;

import com.pepper.project.pm.notice.domain.PmNotice;

import java.util.List;

public interface PmNoticeMapper {

    PmNotice selectPmNoticeById(Integer id);
    List<PmNotice> selectPmNoticeList(PmNotice note);

    public int insertPmNotice(PmNotice note);

    int deletePmNoticeByIds(String[] ids);

    int updatePmNotice(PmNotice note);

}
