package com.pepper.project.cm.community.service;

import com.pepper.common.utils.security.ShiroUtils;
import com.pepper.common.utils.text.Convert;
import com.pepper.project.cm.community.domain.Community;
import com.pepper.project.cm.community.mapper.CommunityMapper;
import com.pepper.project.csc.area.domain.Area;
import com.pepper.project.csc.area.mapper.AreaMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CommunityServiceImpl implements ICommunityService {

    @Autowired
    private CommunityMapper hospitalDao;

    @Autowired
    private AreaMapper areaDao;

    /**
     *  @Description: 列表查询
     *  @author: HanJieTao
     *  @mail: hjtxyr@163.com
     *  @Date: 2020/2/6 0:23
     */
    @Override
    public List<Community> selectCommunityList(Community community) {

        List<Community> list = hospitalDao.selectCommunityList(community);
        for (Community hos:list) {
            Area area = areaDao.selectAreaById(Integer.valueOf(hos.getAreaId()));
            hos.setAreaName(area.getAreaName());
        }
        return list;
    }

    @Override
    public int insertCommunity(Community area) {
        area.setCreateBy(ShiroUtils.getLoginName());
        area.setUpdateBy(ShiroUtils.getLoginName());
        return hospitalDao.insertCommunity(area);
    }

    @Override
    public int deleteCommunityByIds(String ids) {
        return hospitalDao.deleteCommunityByIds(Convert.toStrArray(ids));
    }

    @Override
    public Community selectCommunityById(Integer id) {
        return hospitalDao.selectCommunityById(id);
    }

    @Override
    public int updateCommunity(Community area) {
        area.setUpdateBy(ShiroUtils.getLoginName());
        return hospitalDao.updateCommunity(area);
    }


}
