package com.pepper.project.ch.hospital.mapper;

import com.pepper.project.ch.hospital.domain.Hospital;

import java.util.List;

public interface HospitalMapper {

    Hospital selectHospitalById(Long id);
    List<Hospital> selectHospitalList(Hospital hospital);

    /**
     * 新增医院信息
     *
     * @param hospital 医院信息
     * @return 结果
     */
    public int insertHospital(Hospital hospital);

    int deleteHospitalByIds(String[] ids);

    int updateHospital(Hospital hospital);

}
