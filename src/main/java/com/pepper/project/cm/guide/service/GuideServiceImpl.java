package com.pepper.project.cm.guide.service;

import com.pepper.common.utils.security.ShiroUtils;
import com.pepper.common.utils.text.Convert;
import com.pepper.project.cm.guide.domain.Guide;
import com.pepper.project.cm.guide.mapper.GuideMapper;
import com.pepper.project.cm.guide.mapper.GuideMapper;
import com.pepper.project.csc.area.domain.Area;
import com.pepper.project.csc.area.mapper.AreaMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class GuideServiceImpl implements IGuideService {

    @Autowired
    private GuideMapper guideDao;

    @Autowired
    private AreaMapper areaDao;

    /**
     *  @Description: 列表查询
     *  @author: HanJieTao
     *  @mail: hjtxyr@163.com
     *  @Date: 2020/2/6 0:23
     */
    @Override
    public List<Guide> selectGuideList(Guide guide) {

        List<Guide> list = guideDao.selectGuideList(guide);
//        for (Guide hos:list) {
//            Area area = areaDao.selectAreaById(Integer.valueOf(hos.getAreaId()));
//            hos.setAreaName(area.getAreaName());
//        }
        return list;
    }

    @Override
    public int insertGuide(Guide area) {
        area.setCreateBy(ShiroUtils.getLoginName());
        area.setUpdateBy(ShiroUtils.getLoginName());
        return guideDao.insertGuide(area);
    }

    @Override
    public int deleteGuideByIds(String ids) {
        return guideDao.deleteGuideByIds(Convert.toStrArray(ids));
    }

    @Override
    public Guide selectGuideById(Integer id) {
        return guideDao.selectGuideById(id);
    }

    @Override
    public int updateGuide(Guide area) {
        area.setUpdateBy(ShiroUtils.getLoginName());
        return guideDao.updateGuide(area);
    }


}
