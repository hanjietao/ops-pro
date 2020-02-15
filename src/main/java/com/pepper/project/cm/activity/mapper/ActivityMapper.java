package com.pepper.project.cm.activity.mapper;

import com.pepper.project.cm.activity.domain.Activity;

import java.util.List;

public interface ActivityMapper {

    Activity selectActivityById(Integer id);
    List<Activity> selectActivityList(Activity activity);

    /**
     * 新增医院信息
     *
     * @param activity 医院信息
     * @return 结果
     */
    public int insertActivity(Activity activity);

    int deleteActivityByIds(String[] ids);

    int updateActivity(Activity activity);

}
