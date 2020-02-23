package com.pepper.project.cm.community.service;

import com.pepper.common.utils.StringUtils;
import com.pepper.common.utils.security.ShiroUtils;
import com.pepper.common.utils.text.Convert;
import com.pepper.framework.aspectj.lang.annotation.DataScope;
import com.pepper.project.ch.hospital.domain.Hospital;
import com.pepper.project.ch.hospital.service.IHospitalService;
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
    private CommunityMapper communityDao;

    @Autowired
    private AreaMapper areaDao;

    @Autowired
    private IHospitalService hospitalService;

    /**
     *  @Description: 列表查询
     *  @author: HanJieTao
     *  @mail: hjtxyr@163.com
     *  @Date: 2020/2/6 0:23
     */
    @DataScope(areaAlias = "a", communityAlias = "c")
    public List<Community> selectCommunityList(Community community) {

        List<Community> list = communityDao.selectCommunityList(community);
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
        return communityDao.insertCommunity(area);
    }

    @Override
    public int deleteCommunityByIds(String ids) {
        return communityDao.deleteCommunityByIds(Convert.toStrArray(ids));
    }

    @Override
    public Community selectCommunityById(Integer id) {
        return communityDao.selectCommunityById(id);
    }

    @Override
    public int updateCommunity(Community area) {
        area.setUpdateBy(ShiroUtils.getLoginName());
        return communityDao.updateCommunity(area);
    }

    @Override
    public List<Community> selectCommunityListByHospitalId(Integer hospitalId) {
        Hospital hospital = hospitalService.selectHospitalById(hospitalId);
        String communityIds =hospital.getCommunityIds();
        List<Community> communitys = communityDao.selectCommunityList(new Community());
        if(!StringUtils.isEmpty(communityIds)){
            for (Community community : communitys)
            {
                if(communityIds.indexOf(community.getId().toString()) >= 0){
                    community.setFlag(true);
                }
            }
        }
        return communitys;
    }


}
