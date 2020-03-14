package com.pepper.project.pm.activity.service;

import com.pepper.project.pm.activity.domain.PmActivityApply;

import java.util.List;

public interface IPmActivityApplyService {

    List<PmActivityApply> selectActivityApplyList(PmActivityApply pmActivityApply);
    int insertActivityApply(PmActivityApply activity);

    int deleteActivityApplyByIds(String ids);

    PmActivityApply selectActivityApplyById(Long id);

    int updateActivityApply(PmActivityApply pmActivityApply);

}
