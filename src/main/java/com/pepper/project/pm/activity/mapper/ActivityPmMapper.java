package com.pepper.project.pm.activity.mapper;

import com.pepper.project.pm.activity.domain.ActivityPm;

import java.util.List;

public interface ActivityPmMapper {

    ActivityPm selectActivityById(Integer id);
    List<ActivityPm> selectActivityList(ActivityPm activityPm);

    /**
     * 新增医院信息
     *
     * @param activityPm 医院信息
     * @return 结果
     */
    public int insertActivity(ActivityPm activityPm);

    int deleteActivityByIds(String[] ids);

    int updateActivity(ActivityPm activityPm);

}
