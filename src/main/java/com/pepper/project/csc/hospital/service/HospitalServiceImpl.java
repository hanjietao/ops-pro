package com.pepper.project.csc.hospital.service;

import com.pepper.common.utils.security.ShiroUtils;
import com.pepper.common.utils.text.Convert;
import com.pepper.project.csc.hospital.domain.Hospital;
import com.pepper.project.csc.hospital.mapper.HospitalMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class HospitalServiceImpl implements IHospitalService {

    @Autowired
    private HospitalMapper hospitalDao;

    /**
     *  @Description: 列表查询
     *  @author: HanJieTao
     *  @mail: hjtxyr@163.com
     *  @Date: 2020/2/6 0:23
     */
    @Override
    public List<Hospital> selectHospitalList(Hospital area) {
        return hospitalDao.selectHospitalList(area);
    }

    @Override
    public int insertHospital(Hospital area) {
        area.setCreateBy(ShiroUtils.getLoginName());
        area.setUpdateBy(ShiroUtils.getLoginName());
        return hospitalDao.insertHospital(area);
    }

    @Override
    public int deleteHospitalByIds(String ids) {
        return hospitalDao.deleteHospitalByIds(Convert.toStrArray(ids));
    }

    @Override
    public Hospital selectHospitalById(Integer id) {
        return hospitalDao.selectHospitalById(id);
    }

    @Override
    public int updateHospital(Hospital area) {
        area.setUpdateBy(ShiroUtils.getLoginName());
        return hospitalDao.updateHospital(area);
    }

}
