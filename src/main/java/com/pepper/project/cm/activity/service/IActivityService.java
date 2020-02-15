package com.pepper.project.cm.activity.service;

import com.pepper.project.cm.activity.domain.Activity;

import java.util.List;

public interface IActivityService {

    List<Activity> selectActivityList(Activity activity);
    int insertActivity(Activity activity);

    int deleteActivityByIds(String ids);

    Activity selectActivityById(Integer id);

    int updateActivity(Activity activity);

}
