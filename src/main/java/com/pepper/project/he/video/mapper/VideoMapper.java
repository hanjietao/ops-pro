package com.pepper.project.he.video.mapper;

import com.pepper.project.he.video.domain.Video;

import java.util.List;

public interface VideoMapper {

    Video selectVideoById(Long id);
    List<Video> selectVideoList(Video video);

    /**
     * 新增医院信息
     *
     * @param video 医院信息
     * @return 结果
     */
    public int insertVideo(Video video);

    int deleteVideoByIds(String[] ids);

    int updateVideo(Video video);

}
