package com.pepper.project.csc.region.service;

import com.pepper.common.utils.security.ShiroUtils;
import com.pepper.common.utils.text.Convert;
import com.pepper.project.ch.hospital.domain.Hospital;
import com.pepper.project.ch.hospital.service.IHospitalService;
import com.pepper.project.csc.region.domain.Region;
import com.pepper.project.csc.region.mapper.RegionMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class RegionServiceImpl implements IRegionService {

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
    @Override
    public List<Region> selectRegionList(Region region) {
        return regionDao.selectRegionList(region);
    }

    @Override
    public int insertRegion(Region region) {
        region.setCreateBy(ShiroUtils.getLoginName());
        region.setUpdateBy(ShiroUtils.getLoginName());
        return regionDao.insertRegion(region);
    }

    @Override
    public int deleteRegionByIds(String ids) {
        return regionDao.deleteRegionByIds(Convert.toStrArray(ids));
    }

    @Override
    public Region selectRegionById(Integer id) {
        return regionDao.selectRegionById(id);
    }

    @Override
    public int updateRegion(Region region) {
        region.setUpdateBy(ShiroUtils.getLoginName());
        return regionDao.updateRegion(region);
    }

    @Override
    public Object selectRegionListByHosId(Long hosId) {
        List<Region> regions = regionDao.selectRegionList(new Region());
        return regions;
    }


}
