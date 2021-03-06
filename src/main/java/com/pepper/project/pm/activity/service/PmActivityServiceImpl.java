package com.pepper.project.pm.activity.service;

import com.pepper.common.utils.security.ShiroUtils;
import com.pepper.common.utils.text.Convert;
import com.pepper.project.csc.area.mapper.AreaMapper;
import com.pepper.project.pm.activity.domain.PmActivity;
import com.pepper.project.pm.activity.mapper.PmActivityMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class PmActivityServiceImpl implements IPmActivityService {

    @Autowired
    private PmActivityMapper activityDao;

    @Autowired
    private AreaMapper areaDao;

    /**
     *  @Description: 列表查询
     *  @author: HanJieTao
     *  @mail: hjtxyr@163.com
     *  @Date: 2020/2/6 0:23
     */
    @Override
    public List<PmActivity> selectActivityList(PmActivity pmActivity) {

        List<PmActivity> list = activityDao.selectActivityList(pmActivity);
//        for (PmActivity hos:list) {
//            Area area = areaDao.selectAreaById(Integer.valueOf(hos.getAreaId()));
//            hos.setAreaName(area.getAreaName());
//        }
        return list;
    }

    @Override
    public int insertActivity(PmActivity area) {
        area.setCreateBy(ShiroUtils.getLoginName());
        area.setUpdateBy(ShiroUtils.getLoginName());
        return activityDao.insertActivity(area);
    }

    @Override
    public int deleteActivityByIds(String ids) {
        return activityDao.deleteActivityByIds(Convert.toStrArray(ids));
    }

    @Override
    public PmActivity selectActivityById(Long id) {
        return activityDao.selectActivityById(id);
    }

    @Override
    public int updateActivity(PmActivity area) {
        area.setUpdateBy(ShiroUtils.getLoginName());
        return activityDao.updateActivity(area);
    }

    @Override
    public int updateWatchCount(Long id) {
        return activityDao.updateWatchCount(id);
    }

}
