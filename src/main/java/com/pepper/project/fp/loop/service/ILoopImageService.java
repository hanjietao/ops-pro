package com.pepper.project.fp.loop.service;

import com.pepper.project.fp.loop.domain.LoopImage;

import java.util.List;

public interface ILoopImageService {

    List<LoopImage> selectLoopImageList(LoopImage loopImage);
    int insertLoopImage(LoopImage loopImage);

    int deleteLoopImageByIds(String ids);

    LoopImage selectLoopImageById(Integer id);

    int updateLoopImage(LoopImage loopImage);

}
