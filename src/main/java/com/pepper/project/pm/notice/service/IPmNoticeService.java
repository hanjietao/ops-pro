package com.pepper.project.pm.notice.service;

import com.pepper.project.pm.notice.domain.PmNotice;

import java.util.List;

public interface IPmNoticeService {

    List<PmNotice> selectPmNoticeList(PmNotice pmNotice);
    int insertPmNotice(PmNotice pmNotice);

    int deletePmNoticeByIds(String ids);

    PmNotice selectPmNoticeById(Integer id);

    int updatePmNotice(PmNotice pmNotice);

}
