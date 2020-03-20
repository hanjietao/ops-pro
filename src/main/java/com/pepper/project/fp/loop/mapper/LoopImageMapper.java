package com.pepper.project.fp.loop.mapper;

import com.pepper.project.fp.loop.domain.LoopImage;

import java.util.List;

public interface LoopImageMapper {

    LoopImage selectLoopImageById(Long id);
    List<LoopImage> selectLoopImageList(LoopImage loopImage);

    public int insertLoopImage(LoopImage loopImage);

    int deleteLoopImageByIds(String[] ids);

    int updateLoopImage(LoopImage loopImage);

}
