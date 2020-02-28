package com.pepper.project.ch.hospital.service;

import com.pepper.project.ch.hospital.domain.Hospital;

import java.util.List;

public interface IHospitalService {

    List<Hospital> selectHospitalList(Hospital hospital);
    int insertHospital(Hospital hospital);

    int deleteHospitalByIds(String ids);

    Hospital selectHospitalById(Long id);

    int updateHospital(Hospital hospital);

}
