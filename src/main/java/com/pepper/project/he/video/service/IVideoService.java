package com.pepper.project.he.video.service;

import com.pepper.project.he.video.domain.Video;

import java.util.List;

public interface IVideoService {

    List<Video> selectVideoList(Video video);
    int insertVideo(Video video);

    int deleteVideoByIds(String ids);

    Video selectVideoById(Long id);

    int updateVideo(Video video);

}
