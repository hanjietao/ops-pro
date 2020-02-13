package com.pepper.project.csc.medical.service;

import com.pepper.common.utils.security.ShiroUtils;
import com.pepper.common.utils.text.Convert;
import com.pepper.project.csc.medical.domain.MedicalProject;
import com.pepper.project.csc.medical.mapper.MedicalProjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class MedicalProjectServiceImpl implements IMedicalProjectService {

    @Autowired
    private MedicalProjectMapper medicalProjectDao;

    @Override
    public List<MedicalProject> selectMedicalProjectList(MedicalProject medicalProject) {
        List<MedicalProject> list = medicalProjectDao.selectMedicalProjectList(medicalProject);
        return list;
    }

    @Override
    public int insertMedicalProject(MedicalProject medicalProject) {
        medicalProject.setCreateBy(ShiroUtils.getLoginName());
        medicalProject.setUpdateBy(ShiroUtils.getLoginName());
        return medicalProjectDao.insertMedicalProject(medicalProject);
    }

    @Override
    public int deleteMedicalProjectByIds(String ids) {
        return medicalProjectDao.deleteMedicalProjectByIds(Convert.toStrArray(ids));
    }

    @Override
    public MedicalProject selectMedicalProjectById(Integer id) {
        return medicalProjectDao.selectMedicalProjectById(id);
    }

    @Override
    public int updateMedicalProject(MedicalProject medicalProject) {
        return medicalProjectDao.updateMedicalProject(medicalProject);
    }
}
