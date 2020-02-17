package com.pepper.project.he.video.service;

import com.pepper.common.utils.security.ShiroUtils;
import com.pepper.common.utils.text.Convert;
import com.pepper.framework.aspectj.lang.annotation.DataScope;
import com.pepper.project.csc.area.mapper.AreaMapper;
import com.pepper.project.he.video.domain.Video;
import com.pepper.project.he.video.mapper.VideoMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class VideoServiceImpl implements IVideoService {

    @Autowired
    private VideoMapper videoDao;

    @Autowired
    private AreaMapper areaDao;

    /**
     *  @Description: 列表查询
     *  @author: HanJieTao
     *  @mail: hjtxyr@163.com
     *  @Date: 2020/2/6 0:23
     */
    @DataScope(areaAlias = "a", videoAlias = "p")
    public List<Video> selectVideoList(Video video) {

        List<Video> list = videoDao.selectVideoList(video);
        return list;
    }

    //https://web-ops-test.master.live/video/7B6EE29F938B2BC42938F3A6E792BFE6.mp4
    @Override
    public int insertVideo(Video video) {
        video.setCreateBy(ShiroUtils.getLoginName());
        video.setUpdateBy(ShiroUtils.getLoginName());
        return videoDao.insertVideo(video);
    }

    @Override
    public int deleteVideoByIds(String ids) {
        return videoDao.deleteVideoByIds(Convert.toStrArray(ids));
    }

    @Override
    public Video selectVideoById(Integer id) {
        return videoDao.selectVideoById(id);
    }

    @Override
    public int updateVideo(Video video) {
        video.setUpdateBy(ShiroUtils.getLoginName());
        return videoDao.updateVideo(video);
    }


}
