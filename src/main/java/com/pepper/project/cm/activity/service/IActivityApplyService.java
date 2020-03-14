package com.pepper.project.cm.activity.service;

import com.pepper.project.cm.activity.domain.Activity;
import com.pepper.project.cm.activity.domain.ActivityApply;

import java.util.List;

public interface IActivityApplyService {

    List<ActivityApply> selectActivityApplyList(ActivityApply activityApply);
    int insertActivityApply(ActivityApply activity);

    int deleteActivityApplyByIds(String ids);

    ActivityApply selectActivityApplyById(Long id);

    int updateActivityApply(ActivityApply activityApply);

}
