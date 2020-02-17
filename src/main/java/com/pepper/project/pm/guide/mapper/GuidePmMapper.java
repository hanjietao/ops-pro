package com.pepper.project.pm.guide.mapper;

import com.pepper.project.pm.guide.domain.GuidePm;

import java.util.List;

public interface GuidePmMapper {

    GuidePm selectGuideById(Integer id);
    List<GuidePm> selectGuideList(GuidePm guide);

    public int insertGuide(GuidePm guide);

    int deleteGuideByIds(String[] ids);

    int updateGuide(GuidePm guide);

}
