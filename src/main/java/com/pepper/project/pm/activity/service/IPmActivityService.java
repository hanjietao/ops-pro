package com.pepper.project.pm.activity.service;

import com.pepper.project.pm.activity.domain.PmActivity;

import java.util.List;

public interface IPmActivityService {

    List<PmActivity> selectActivityList(PmActivity pmActivity);
    int insertActivity(PmActivity pmActivity);

    int deleteActivityByIds(String ids);

    PmActivity selectActivityById(Long id);

    int updateActivity(PmActivity pmActivity);

    int updateWatchCount(Long id);
}
