package com.pepper.project.pm.activity.service;

import com.pepper.project.pm.activity.domain.ActivityPm;

import java.util.List;

public interface IActivityPmService {

    List<ActivityPm> selectActivityList(ActivityPm activityPm);
    int insertActivity(ActivityPm activityPm);

    int deleteActivityByIds(String ids);

    ActivityPm selectActivityById(Integer id);

    int updateActivity(ActivityPm activityPm);

}
