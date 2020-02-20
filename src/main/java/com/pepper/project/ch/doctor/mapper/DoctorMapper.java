package com.pepper.project.ch.doctor.mapper;

import com.pepper.project.ch.doctor.domain.Doctor;

import java.util.List;

public interface DoctorMapper {

    Doctor selectDoctorById(Integer id);
    List<Doctor> selectDoctorList(Doctor medicalProject);
    public int insertDoctor(Doctor medicalProject);
    int deleteDoctorByIds(String[] ids);
    int updateDoctor(Doctor medicalProject);

}
