package com.pepper.project.ch.doctor.service;

import com.pepper.project.ch.doctor.domain.Doctor;

import java.util.List;

public interface IDoctorService {

    List<Doctor> selectDoctorList(Doctor medicalProject);
    int insertDoctor(Doctor medicalProject);

    int deleteDoctorByIds(String ids);

    Doctor selectDoctorById(Integer id);

    int updateDoctor(Doctor medicalProject);

    //Object selectDoctorListByHosId(Integer id);
}
