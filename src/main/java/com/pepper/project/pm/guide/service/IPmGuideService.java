package com.pepper.project.pm.guide.service;

import com.pepper.project.pm.guide.domain.PmGuide;

import java.util.List;

public interface IPmGuideService {

    List<PmGuide> selectGuideList(PmGuide guide);
    int insertGuide(PmGuide guide);

    int deleteGuideByIds(String ids);

    PmGuide selectGuideById(Integer id);

    int updateGuide(PmGuide guide);

}
