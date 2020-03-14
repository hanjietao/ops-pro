package com.pepper.project.pm.activity.service;

import com.pepper.common.utils.security.ShiroUtils;
import com.pepper.common.utils.text.Convert;
import com.pepper.project.csc.area.mapper.AreaMapper;
import com.pepper.project.pm.activity.domain.PmActivityApply;
import com.pepper.project.pm.activity.mapper.PmActivityApplyMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class PmActivityApplyServiceImpl implements IPmActivityApplyService {

    @Autowired
    private PmActivityApplyMapper activityApplyDao;

    @Autowired
    private AreaMapper areaDao;

    /**
     *  @Description: 列表查询
     *  @author: HanJieTao
     *  @mail: hjtxyr@163.com
     *  @Date: 2020/2/6 0:23
     */
    @Override
    public List<PmActivityApply> selectActivityApplyList(PmActivityApply pmActivityApply) {

        List<PmActivityApply> list = activityApplyDao.selectActivityApplyList(pmActivityApply);
//        for (PmActivity hos:list) {
//            Area area = areaDao.selectAreaById(Integer.valueOf(hos.getAreaId()));
//            hos.setAreaName(area.getAreaName());
//        }
        return list;
    }

    @Override
    public int insertActivityApply(PmActivityApply pmActivityApply) {
        pmActivityApply.setCreateBy(ShiroUtils.getLoginName());
        pmActivityApply.setUpdateBy(ShiroUtils.getLoginName());
        return activityApplyDao.insertActivityApply(pmActivityApply);
    }

    @Override
    public int deleteActivityApplyByIds(String ids) {
        return activityApplyDao.deleteActivityApplyByIds(Convert.toStrArray(ids));
    }

    @Override
    public PmActivityApply selectActivityApplyById(Long id) {
        return activityApplyDao.selectActivityApplyById(id);
    }

    @Override
    public int updateActivityApply(PmActivityApply pmActivityApply) {
        pmActivityApply.setUpdateBy(ShiroUtils.getLoginName());
        return activityApplyDao.updateActivityApply(pmActivityApply);
    }


}
