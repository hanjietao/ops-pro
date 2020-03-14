package com.pepper.project.pm.activity.mapper;

import com.pepper.project.pm.activity.domain.PmActivity;

import java.util.List;

public interface PmActivityMapper {

    PmActivity selectActivityById(Long id);
    List<PmActivity> selectActivityList(PmActivity pmActivity);

    /**
     * 新增医院信息
     *
     * @param pmActivity 医院信息
     * @return 结果
     */
    public int insertActivity(PmActivity pmActivity);

    int deleteActivityByIds(String[] ids);

    int updateActivity(PmActivity pmActivity);

}
