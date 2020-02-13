package com.pepper.project.csc.medical.mapper;

import com.pepper.project.csc.medical.domain.MedicalProject;

import java.util.List;

public interface MedicalProjectMapper {

    MedicalProject selectMedicalProjectById(Integer id);
    List<MedicalProject> selectMedicalProjectList(MedicalProject medicalProject);
    public int insertMedicalProject(MedicalProject medicalProject);
    int deleteMedicalProjectByIds(String[] ids);
    int updateMedicalProject(MedicalProject medicalProject);

}
