package com.pepper.project.csc.doctor.service;

import com.pepper.common.utils.security.ShiroUtils;
import com.pepper.common.utils.text.Convert;
import com.pepper.project.csc.doctor.domain.Doctor;
import com.pepper.project.csc.doctor.mapper.DoctorMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class DoctorServiceImpl implements IDoctorService {

    @Autowired
    private DoctorMapper doctorDao;

    @Override
    public List<Doctor> selectDoctorList(Doctor doctor) {
        List<Doctor> list = doctorDao.selectDoctorList(doctor);
        return list;
    }

    @Override
    public int insertDoctor(Doctor medicalProject) {
        medicalProject.setCreateBy(ShiroUtils.getLoginName());
        medicalProject.setUpdateBy(ShiroUtils.getLoginName());
        return doctorDao.insertDoctor(medicalProject);
    }

    @Override
    public int deleteDoctorByIds(String ids) {
        return doctorDao.deleteDoctorByIds(Convert.toStrArray(ids));
    }

    @Override
    public Doctor selectDoctorById(Integer id) {
        return doctorDao.selectDoctorById(id);
    }

    @Override
    public int updateDoctor(Doctor medicalProject) {
        return doctorDao.updateDoctor(medicalProject);
    }
}
