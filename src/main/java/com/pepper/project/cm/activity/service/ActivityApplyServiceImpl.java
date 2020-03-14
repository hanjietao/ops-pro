package com.pepper.project.cm.activity.service;

import com.pepper.common.utils.security.ShiroUtils;
import com.pepper.common.utils.text.Convert;
import com.pepper.project.cm.activity.domain.ActivityApply;
import com.pepper.project.cm.activity.mapper.ActivityApplyMapper;
import com.pepper.project.csc.area.mapper.AreaMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ActivityApplyServiceImpl implements IActivityApplyService {

    @Autowired
    private ActivityApplyMapper activityApplyDao;

    @Autowired
    private AreaMapper areaDao;

    /**
     *  @Description: 列表查询
     *  @author: HanJieTao
     *  @mail: hjtxyr@163.com
     *  @Date: 2020/2/6 0:23
     */
    @Override
    public List<ActivityApply> selectActivityApplyList(ActivityApply activityApply) {

        List<ActivityApply> list = activityApplyDao.selectActivityApplyList(activityApply);
//        for (PmActivity hos:list) {
//            Area area = areaDao.selectAreaById(Integer.valueOf(hos.getAreaId()));
//            hos.setAreaName(area.getAreaName());
//        }
        return list;
    }

    @Override
    public int insertActivityApply(ActivityApply activityApply) {
        activityApply.setCreateBy(ShiroUtils.getLoginName());
        activityApply.setUpdateBy(ShiroUtils.getLoginName());
        return activityApplyDao.insertActivityApply(activityApply);
    }

    @Override
    public int deleteActivityApplyByIds(String ids) {
        return activityApplyDao.deleteActivityApplyByIds(Convert.toStrArray(ids));
    }

    @Override
    public ActivityApply selectActivityApplyById(Long id) {
        return activityApplyDao.selectActivityApplyById(id);
    }

    @Override
    public int updateActivityApply(ActivityApply activityApply) {
        activityApply.setUpdateBy(ShiroUtils.getLoginName());
        return activityApplyDao.updateActivityApply(activityApply);
    }


}
