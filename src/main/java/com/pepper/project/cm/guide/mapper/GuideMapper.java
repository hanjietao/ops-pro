package com.pepper.project.cm.guide.mapper;

import com.pepper.project.cm.guide.domain.Guide;

import java.util.List;

public interface GuideMapper {

    Guide selectGuideById(Long id);
    List<Guide> selectGuideList(Guide guide);

    int insertGuide(Guide guide);

    int deleteGuideByIds(String[] ids);

    int updateGuide(Guide guide);

}
