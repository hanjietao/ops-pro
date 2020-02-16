package com.pepper.project.cm.guide.mapper;

import com.pepper.project.cm.guide.domain.Guide;

import java.util.List;

public interface GuideMapper {

    Guide selectGuideById(Integer id);
    List<Guide> selectGuideList(Guide guide);

    /**
     * 新增医院信息
     *
     * @param guide 医院信息
     * @return 结果
     */
    public int insertGuide(Guide guide);

    int deleteGuideByIds(String[] ids);

    int updateGuide(Guide guide);

}
