package com.pepper.project.pm.activity.mapper;

import com.pepper.project.pm.activity.domain.ActivityApplyPm;

import java.util.List;

public interface ActivityApplyPmMapper {

    ActivityApplyPm selectActivityApplyById(Integer id);
    List<ActivityApplyPm> selectActivityApplyList(ActivityApplyPm activity);

    /**
     * 新增医院信息
     *
     * @param activityApplyPm 医院信息
     * @return 结果
     */
    public int insertActivityApply(ActivityApplyPm activityApplyPm);

    int deleteActivityApplyByIds(String[] ids);

    int updateActivityApply(ActivityApplyPm activityApplyPm);

}
