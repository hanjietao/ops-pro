package com.pepper.project.cm.guide.service;

import com.pepper.project.cm.guide.domain.Guide;

import java.util.List;

public interface IGuideService {

    List<Guide> selectGuideList(Guide guide);
    int insertGuide(Guide guide);

    int deleteGuideByIds(String ids);

    Guide selectGuideById(Long id);

    int updateGuide(Guide guide);

}
