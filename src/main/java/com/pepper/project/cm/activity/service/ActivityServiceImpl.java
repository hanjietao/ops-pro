package com.pepper.project.cm.activity.service;

import com.pepper.common.utils.security.ShiroUtils;
import com.pepper.common.utils.text.Convert;
import com.pepper.framework.aspectj.lang.annotation.DataScope;
import com.pepper.project.cm.activity.domain.Activity;
import com.pepper.project.cm.activity.mapper.ActivityMapper;
import com.pepper.project.csc.area.domain.Area;
import com.pepper.project.csc.area.mapper.AreaMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ActivityServiceImpl implements IActivityService {

    @Autowired
    private ActivityMapper activityDao;

    @Autowired
    private AreaMapper areaDao;

    /**
     *  @Description: 列表查询
     *  @author: HanJieTao
     *  @mail: hjtxyr@163.com
     *  @Date: 2020/2/6 0:23
     */
    @Override
    public List<Activity> selectActivityList(Activity activity) {

        List<Activity> list = activityDao.selectActivityList(activity);
//        for (PmActivity hos:list) {
//            Area area = areaDao.selectAreaById(Integer.valueOf(hos.getAreaId()));
//            hos.setAreaName(area.getAreaName());
//        }
        return list;
    }

    @Override
    public int insertActivity(Activity activity) {
        activity.setCreateBy(ShiroUtils.getLoginName());
        activity.setUpdateBy(ShiroUtils.getLoginName());
        return activityDao.insertActivity(activity);
    }

    @Override
    public int deleteActivityByIds(String ids) {
        return activityDao.deleteActivityByIds(Convert.toStrArray(ids));
    }

    @Override
    public Activity selectActivityById(Long id) {
        return activityDao.selectActivityById(id);
    }

    @Override
    public int updateActivity(Activity activity) {
        activity.setUpdateBy(ShiroUtils.getLoginName());
        return activityDao.updateActivity(activity);
    }


}
