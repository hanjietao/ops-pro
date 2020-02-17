package com.pepper.project.pm.guide.service;

import com.pepper.common.utils.security.ShiroUtils;
import com.pepper.common.utils.text.Convert;
import com.pepper.project.csc.area.mapper.AreaMapper;
import com.pepper.project.pm.guide.domain.GuidePm;
import com.pepper.project.pm.guide.mapper.GuidePmMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class GuidePmServiceImpl implements IGuidePmService {

    @Autowired
    private GuidePmMapper guideDao;

    @Autowired
    private AreaMapper areaDao;

    @Override
    public List<GuidePm> selectGuideList(GuidePm guide) {

        List<GuidePm> list = guideDao.selectGuideList(guide);
//        for (Guide hos:list) {
//            Area area = areaDao.selectAreaById(Integer.valueOf(hos.getAreaId()));
//            hos.setAreaName(area.getAreaName());
//        }
        return list;
    }

    @Override
    public int insertGuide(GuidePm guide) {
        guide.setCreateBy(ShiroUtils.getLoginName());
        guide.setUpdateBy(ShiroUtils.getLoginName());
        return guideDao.insertGuide(guide);
    }

    @Override
    public int deleteGuideByIds(String ids) {
        return guideDao.deleteGuideByIds(Convert.toStrArray(ids));
    }

    @Override
    public GuidePm selectGuideById(Integer id) {
        return guideDao.selectGuideById(id);
    }

    @Override
    public int updateGuide(GuidePm area) {
        area.setUpdateBy(ShiroUtils.getLoginName());
        return guideDao.updateGuide(area);
    }


}
