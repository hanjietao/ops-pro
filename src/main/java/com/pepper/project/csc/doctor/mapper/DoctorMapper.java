package com.pepper.project.csc.doctor.mapper;

import com.pepper.project.csc.doctor.domain.Doctor;

import java.util.List;

public interface DoctorMapper {

    Doctor selectDoctorById(Integer id);
    List<Doctor> selectDoctorList(Doctor medicalProject);
    public int insertDoctor(Doctor medicalProject);
    int deleteDoctorByIds(String[] ids);
    int updateDoctor(Doctor medicalProject);

}
