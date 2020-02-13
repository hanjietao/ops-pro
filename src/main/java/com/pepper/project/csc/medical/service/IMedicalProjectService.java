package com.pepper.project.csc.medical.service;

import com.pepper.project.csc.medical.domain.MedicalProject;

import java.util.List;

public interface IMedicalProjectService {

    List<MedicalProject> selectMedicalProjectList(MedicalProject medicalProject);
    int insertMedicalProject(MedicalProject medicalProject);

    int deleteMedicalProjectByIds(String ids);

    MedicalProject selectMedicalProjectById(Integer id);

    int updateMedicalProject(MedicalProject medicalProject);

    //Object selectMedicalProjectListByHosId(Integer id);
}
