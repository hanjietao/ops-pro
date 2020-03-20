package com.pepper.project.fp.loop.service;

import com.pepper.common.utils.security.ShiroUtils;
import com.pepper.common.utils.text.Convert;
import com.pepper.framework.aspectj.lang.annotation.DataScope;
import com.pepper.project.csc.area.mapper.AreaMapper;
import com.pepper.project.fp.loop.domain.LoopImage;
import com.pepper.project.fp.loop.mapper.LoopImageMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class LoopImageServiceImpl implements ILoopImageService {

    @Autowired
    private LoopImageMapper loopImageDao;

    @Autowired
    private AreaMapper areaDao;

    /**
     *  @Description: 列表查询
     *  @author: HanJieTao
     *  @mail: hjtxyr@163.com
     *  @Date: 2020/2/6 0:23
     */
    @DataScope(areaAlias = "a", propertyAlias = "p")
    public List<LoopImage> selectLoopImageList(LoopImage board) {

        List<LoopImage> list = loopImageDao.selectLoopImageList(board);
        return list;
    }

    @Override
    public int insertLoopImage(LoopImage loopImage) {
        loopImage.setCreateBy(ShiroUtils.getLoginName());
        loopImage.setUpdateBy(ShiroUtils.getLoginName());
        return loopImageDao.insertLoopImage(loopImage);
    }

    @Override
    public int deleteLoopImageByIds(String ids) {
        return loopImageDao.deleteLoopImageByIds(Convert.toStrArray(ids));
    }

    @Override
    public LoopImage selectLoopImageById(Long id) {
        return loopImageDao.selectLoopImageById(id);
    }

    @Override
    public int updateLoopImage(LoopImage area) {
        area.setUpdateBy(ShiroUtils.getLoginName());
        return loopImageDao.updateLoopImage(area);
    }


}
