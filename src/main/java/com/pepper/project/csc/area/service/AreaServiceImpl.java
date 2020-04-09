package com.pepper.project.csc.area.service;

import com.pepper.common.utils.security.ShiroUtils;
import com.pepper.common.utils.text.Convert;
import com.pepper.project.csc.area.domain.Area;
import com.pepper.project.csc.area.mapper.AreaMapper;
import com.pepper.project.ch.hospital.domain.Hospital;
import com.pepper.project.ch.hospital.service.IHospitalService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class AreaServiceImpl implements IAreaService {

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
    @Override
    public List<Area> selectAreaList(Area area) {
        return areaDao.selectAreaList(area);
    }

    @Override
    public int insertArea(Area area) {
        area.setCreateBy(ShiroUtils.getLoginName());
        area.setUpdateBy(ShiroUtils.getLoginName());
        return areaDao.insertArea(area);
    }

    @Override
    public int deleteAreaByIds(String ids) {
        return areaDao.deleteAreaByIds(Convert.toStrArray(ids));
    }

    @Override
    public Area selectAreaById(Long id) {
        return areaDao.selectAreaById(id);
    }

    @Override
    public int updateArea(Area area) {
        area.setUpdateBy(ShiroUtils.getLoginName());
        return areaDao.updateArea(area);
    }

    @Override
    public Object selectAreaListByHosId(Long hosId) {
        Hospital hospital = hospitalService.selectHospitalById(hosId);
        String communityIds =hospital.getCommunityIds();
        List<Area> areas = areaDao.selectAreaList(new Area());
        for (Area area : areas)
        {
            if(communityIds.indexOf(area.getId().toString()) >= 0){
                area.setFlag(true);
            }
        }
        return areas;
    }


}
