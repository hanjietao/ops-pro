package com.pepper.project.pm.activity.service;

import com.pepper.project.pm.activity.domain.PmActivity;

import java.util.List;

public interface IPmActivityService {

    List<PmActivity> selectActivityList(PmActivity pmActivity);
    int insertActivity(PmActivity pmActivity);

    int deleteActivityByIds(String ids);

    PmActivity selectActivityById(Integer id);

    int updateActivity(PmActivity pmActivity);

}
