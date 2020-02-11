package com.pepper.project.csc.hospital.service;

import com.pepper.project.csc.hospital.domain.Hospital;

import java.util.List;

public interface IHospitalService {

    List<Hospital> selectHospitalList(Hospital hospital);
    int insertHospital(Hospital hospital);

    int deleteHospitalByIds(String ids);

    Hospital selectHospitalById(Integer id);

    int updateHospital(Hospital hospital);
}
