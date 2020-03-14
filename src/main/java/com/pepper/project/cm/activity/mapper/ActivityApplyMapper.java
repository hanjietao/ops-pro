package com.pepper.project.cm.activity.mapper;

import com.pepper.project.cm.activity.domain.ActivityApply;

import java.util.List;

public interface ActivityApplyMapper {

    ActivityApply selectActivityApplyById(Long id);
    List<ActivityApply> selectActivityApplyList(ActivityApply activity);

    /**
     * 新增医院信息
     *
     * @param activityApply 医院信息
     * @return 结果
     */
    public int insertActivityApply(ActivityApply activityApply);

    int deleteActivityApplyByIds(String[] ids);

    int updateActivityApply(ActivityApply activityApply);

}
