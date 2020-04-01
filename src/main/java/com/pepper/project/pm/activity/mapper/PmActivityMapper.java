package com.pepper.project.pm.activity.mapper;

import com.pepper.project.pm.activity.domain.PmActivity;

import java.util.List;

public interface PmActivityMapper {

    PmActivity selectActivityById(Long id);
    List<PmActivity> selectActivityList(PmActivity pmActivity);

    public int insertActivity(PmActivity pmActivity);

    int deleteActivityByIds(String[] ids);

    int updateActivity(PmActivity pmActivity);

    int updateWatchCount(Long id);
}
