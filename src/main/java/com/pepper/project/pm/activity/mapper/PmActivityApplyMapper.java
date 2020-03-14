package com.pepper.project.pm.activity.mapper;

import com.pepper.project.pm.activity.domain.PmActivityApply;

import java.util.List;

public interface PmActivityApplyMapper {

    PmActivityApply selectActivityApplyById(Long id);

    List<PmActivityApply> selectActivityApplyList(PmActivityApply pmActivityApply);

    int insertActivityApply(PmActivityApply pmActivityApply);

    int deleteActivityApplyByIds(String[] ids);

    int updateActivityApply(PmActivityApply pmActivityApply);

}
