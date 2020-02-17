package com.pepper.project.pm.activity.service;

import com.pepper.project.pm.activity.domain.ActivityApplyPm;

import java.util.List;

public interface IActivityApplyPmService {

    List<ActivityApplyPm> selectActivityApplyList(ActivityApplyPm activityApplyPm);
    int insertActivityApply(ActivityApplyPm activity);

    int deleteActivityApplyByIds(String ids);

    ActivityApplyPm selectActivityApplyById(Integer id);

    int updateActivityApply(ActivityApplyPm activityApplyPm);

}
