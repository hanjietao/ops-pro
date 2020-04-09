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
import com.pepper.project.csc.region.domain.Region;
import com.pepper.project.csc.region.mapper.RegionMapper;
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
    private RegionMapper regionDao;

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
            Area area = areaDao.selectAreaById(Long.valueOf(hos.getAreaId()));
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
    public Community selectCommunityById(Long id) {
        return communityDao.selectCommunityById(id);
    }

    @Override
    public int updateCommunity(Community community) {
        Region region = new Region();
        region.setLevel(2);
        region.setCityCode(community.getCityCode());
        Region regionCity = regionDao.selectRegionByCityCodeAndLevel(region);
        community.setCity(regionCity.getId().toString());
        community.setProvince(regionCity.getPid().toString());

        community.setUpdateBy(ShiroUtils.getLoginName());
        return communityDao.updateCommunity(community);
    }

    @Override
    public List<Community> selectCommunityListByHospitalId(Long hospitalId) {
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
