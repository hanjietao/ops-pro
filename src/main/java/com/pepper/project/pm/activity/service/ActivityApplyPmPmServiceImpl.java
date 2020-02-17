package com.pepper.project.pm.activity.service;

import com.pepper.common.utils.security.ShiroUtils;
import com.pepper.common.utils.text.Convert;
import com.pepper.project.csc.area.mapper.AreaMapper;
import com.pepper.project.pm.activity.domain.ActivityApplyPm;
import com.pepper.project.pm.activity.mapper.ActivityApplyPmMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ActivityApplyPmPmServiceImpl implements IActivityApplyPmService {

    @Autowired
    private ActivityApplyPmMapper activityApplyDao;

    @Autowired
    private AreaMapper areaDao;

    /**
     *  @Description: 列表查询
     *  @author: HanJieTao
     *  @mail: hjtxyr@163.com
     *  @Date: 2020/2/6 0:23
     */
    @Override
    public List<ActivityApplyPm> selectActivityApplyList(ActivityApplyPm activityApplyPm) {

        List<ActivityApplyPm> list = activityApplyDao.selectActivityApplyList(activityApplyPm);
//        for (ActivityPm hos:list) {
//            Area area = areaDao.selectAreaById(Integer.valueOf(hos.getAreaId()));
//            hos.setAreaName(area.getAreaName());
//        }
        return list;
    }

    @Override
    public int insertActivityApply(ActivityApplyPm activityApplyPm) {
        activityApplyPm.setCreateBy(ShiroUtils.getLoginName());
        activityApplyPm.setUpdateBy(ShiroUtils.getLoginName());
        return activityApplyDao.insertActivityApply(activityApplyPm);
    }

    @Override
    public int deleteActivityApplyByIds(String ids) {
        return activityApplyDao.deleteActivityApplyByIds(Convert.toStrArray(ids));
    }

    @Override
    public ActivityApplyPm selectActivityApplyById(Integer id) {
        return activityApplyDao.selectActivityApplyById(id);
    }

    @Override
    public int updateActivityApply(ActivityApplyPm activityApplyPm) {
        activityApplyPm.setUpdateBy(ShiroUtils.getLoginName());
        return activityApplyDao.updateActivityApply(activityApplyPm);
    }


}
