package com.pepper.project.ch.hospital.service;

import com.pepper.common.utils.security.ShiroUtils;
import com.pepper.common.utils.text.Convert;
import com.pepper.project.ch.hospital.domain.Hospital;
import com.pepper.project.ch.hospital.mapper.HospitalMapper;
import com.pepper.project.csc.area.domain.Area;
import com.pepper.project.csc.area.mapper.AreaMapper;
import com.pepper.project.csc.region.domain.Region;
import com.pepper.project.csc.region.mapper.RegionMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class HospitalServiceImpl implements IHospitalService {

    @Autowired
    private HospitalMapper hospitalDao;

    @Autowired
    private AreaMapper areaDao;
    @Autowired
    private RegionMapper regionDao;

    /**
     *  @Description: 列表查询
     *  @author: HanJieTao
     *  @mail: hjtxyr@163.com
     *  @Date: 2020/2/6 0:23
     */
    @Override
    public List<Hospital> selectHospitalList(Hospital hospital) {

        List<Hospital> list = hospitalDao.selectHospitalList(hospital);
        for (Hospital hos:list) {
            Area area = areaDao.selectAreaById(Long.valueOf(hos.getAreaId()));
            hos.setAreaName(area.getAreaName());
        }
        return list;
    }

    @Override
    public int insertHospital(Hospital hospital) {
        hospital.setCreateBy(ShiroUtils.getLoginName());
        hospital.setUpdateBy(ShiroUtils.getLoginName());
        return hospitalDao.insertHospital(hospital);
    }

    @Override
    public int deleteHospitalByIds(String ids) {
        return hospitalDao.deleteHospitalByIds(Convert.toStrArray(ids));
    }

    @Override
    public Hospital selectHospitalById(Long id) {
        return hospitalDao.selectHospitalById(id);
    }

    @Override
    public int updateHospital(Hospital hospital) {
        Region region = new Region();
        region.setLevel(2);

        region.setCityCode(hospital.getCityCode());
        Region regionCity = regionDao.selectRegionByCityCodeAndLevel(region);
        hospital.setCity(regionCity.getId().toString());
        hospital.setProvince(regionCity.getPid().toString());

        hospital.setUpdateBy(ShiroUtils.getLoginName());
        return hospitalDao.updateHospital(hospital);
    }


}
