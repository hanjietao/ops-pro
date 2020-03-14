package com.pepper.project.pm.activity.mapper;

import com.pepper.project.pm.activity.domain.PmActivityApply;

import java.util.List;

public interface PmActivityApplyMapper {

    PmActivityApply selectActivityApplyById(Integer id);
    List<PmActivityApply> selectActivityApplyList(PmActivityApply pmActivityApply);

    /**
     * 新增医院信息
     *
     * @param pmActivityApply 医院信息
     * @return 结果
     */
    public int insertActivityApply(PmActivityApply pmActivityApply);

    int deleteActivityApplyByIds(String[] ids);

    int updateActivityApply(PmActivityApply pmActivityApply);

}
