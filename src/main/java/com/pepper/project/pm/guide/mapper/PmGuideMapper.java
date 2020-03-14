package com.pepper.project.pm.guide.mapper;

import com.pepper.project.pm.guide.domain.PmGuide;

import java.util.List;

public interface PmGuideMapper {

    PmGuide selectGuideById(Integer id);
    List<PmGuide> selectGuideList(PmGuide guide);

    public int insertGuide(PmGuide guide);

    int deleteGuideByIds(String[] ids);

    int updateGuide(PmGuide guide);

}
