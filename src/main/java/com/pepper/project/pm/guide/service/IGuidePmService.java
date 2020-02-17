package com.pepper.project.pm.guide.service;

import com.pepper.project.pm.guide.domain.GuidePm;

import java.util.List;

public interface IGuidePmService {

    List<GuidePm> selectGuideList(GuidePm guide);
    int insertGuide(GuidePm guide);

    int deleteGuideByIds(String ids);

    GuidePm selectGuideById(Integer id);

    int updateGuide(GuidePm guide);

}
