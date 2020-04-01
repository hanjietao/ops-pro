package com.pepper.project.cm.activity.mapper;

import com.pepper.project.cm.activity.domain.Activity;

import java.util.List;

public interface ActivityMapper {

    Activity selectActivityById(Long id);
    List<Activity> selectActivityList(Activity activity);

    int insertActivity(Activity activity);

    int deleteActivityByIds(String[] ids);

    int updateActivity(Activity activity);

    int updateWatchCount(Long id);
}
