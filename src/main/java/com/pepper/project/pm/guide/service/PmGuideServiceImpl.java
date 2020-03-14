package com.pepper.project.pm.guide.service;

import com.pepper.common.utils.security.ShiroUtils;
import com.pepper.common.utils.text.Convert;
import com.pepper.project.csc.area.mapper.AreaMapper;
import com.pepper.project.pm.guide.domain.PmGuide;
import com.pepper.project.pm.guide.mapper.PmGuideMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class PmGuideServiceImpl implements IPmGuideService {

    @Autowired
    private PmGuideMapper guideDao;

    @Autowired
    private AreaMapper areaDao;

    @Override
    public List<PmGuide> selectGuideList(PmGuide guide) {

        List<PmGuide> list = guideDao.selectGuideList(guide);
//        for (Guide hos:list) {
//            Area area = areaDao.selectAreaById(Integer.valueOf(hos.getAreaId()));
//            hos.setAreaName(area.getAreaName());
//        }
        return list;
    }

    @Override
    public int insertGuide(PmGuide guide) {
        guide.setCreateBy(ShiroUtils.getLoginName());
        guide.setUpdateBy(ShiroUtils.getLoginName());
        return guideDao.insertGuide(guide);
    }

    @Override
    public int deleteGuideByIds(String ids) {
        return guideDao.deleteGuideByIds(Convert.toStrArray(ids));
    }

    @Override
    public PmGuide selectGuideById(Long id) {
        return guideDao.selectGuideById(id);
    }

    @Override
    public int updateGuide(PmGuide area) {
        area.setUpdateBy(ShiroUtils.getLoginName());
        return guideDao.updateGuide(area);
    }


}
