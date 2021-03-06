package com.pepper.project.ch.medical.controller;

import com.pepper.framework.aspectj.lang.annotation.Log;
import com.pepper.framework.aspectj.lang.enums.BusinessType;
import com.pepper.framework.aspectj.lang.enums.SysUserType;
import com.pepper.framework.web.controller.BaseController;
import com.pepper.framework.web.domain.AjaxResult;
import com.pepper.framework.web.page.TableDataInfo;
import com.pepper.project.ch.hospital.domain.Hospital;
import com.pepper.project.ch.hospital.service.IHospitalService;
import com.pepper.project.ch.medical.domain.MedicalProject;
import com.pepper.project.ch.medical.service.IMedicalProjectService;
import com.pepper.project.csc.area.service.IAreaService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiOperation;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.List;

@Api("医疗项目")
@Controller
@RequestMapping("/ch/medical")
public class MedicalController extends BaseController {

    private String prefix = "ch/medical";

    @Autowired
    private IMedicalProjectService medicalProjectService;

    @Autowired
    private IHospitalService hospitalService;

    @RequiresPermissions("ch:medical:view")
    @GetMapping()
    public String online(ModelMap mmp)
    {
        mmp.put("hospitals",hospitalService.selectHospitalList(new Hospital()));
        return prefix + "/medical";
    }

    @RequiresPermissions("ch:medical:list")
    @PostMapping("/list")
    @ResponseBody
    public TableDataInfo list(MedicalProject medicalProject)
    {
        startPage();
        if(getMerchantId()!=0){
            medicalProject.setHospitalId(getMerchantId());
        }
        List<MedicalProject> list = medicalProjectService.selectMedicalProjectList(medicalProject);
        return getDataTable(list);
    }

    /**
     * 新增区域
     */
    @GetMapping("/add")
    public String add(ModelMap mmap)
    {
        return prefix + "/add";
    }

    /**
     * 新增保存区域设置
     */
    @Log(title = "医疗项目", businessType = BusinessType.INSERT)
    @RequiresPermissions("ch:medical:add")
    @PostMapping("/add")
    @ResponseBody
    public AjaxResult addSave(MedicalProject medicalProject)
    {
        if(getMerchantId()==null || getMerchantId() == 0 ||
                !SysUserType.hadmin.getType().equals(getSysUser().getMerchantFlag())){
            return  error("非医院业务系统用户 无法添加医院医疗项目");
        }
        medicalProject.setHospitalId(getMerchantId());
        return toAjax(medicalProjectService.insertMedicalProject(medicalProject));
    }

    /**
     * 修改区域
     */
    @GetMapping("/edit/{id}")
    public String edit(@PathVariable("id") Integer id, ModelMap mmap)
    {
        //mmap.put("areas",areaService.selectAreaListByHosId(id));
        mmap.put("medicalProject", medicalProjectService.selectMedicalProjectById(id));
        return prefix + "/edit";
    }

    /**
     * 修改保存公告
     */
    @RequiresPermissions("ch:medical:edit")
    @Log(title = "医疗项目", businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    @ResponseBody
    public AjaxResult editSave(MedicalProject medicalProject)
    {

        //return toAjax(hospitalService.updateHospital(hospital));
        return toAjax(medicalProjectService.updateMedicalProject(medicalProject));
    }

    /**
     * 删除区域
     */
    @RequiresPermissions("ch:medical:remove")
    @Log(title = "医疗项目", businessType = BusinessType.DELETE)
    @PostMapping("/remove")
    @ResponseBody
    public AjaxResult remove(String ids)
    {
        return toAjax(medicalProjectService.deleteMedicalProjectByIds(ids));
    }

    @ApiOperation("医院医疗项目列表")
    @PostMapping("/getList")
    @ResponseBody
    public TableDataInfo getList(Long hosId)
    {
        MedicalProject medicalProject = new MedicalProject();
        medicalProject.setHospitalId(hosId);
        List<MedicalProject> list = medicalProjectService.selectMedicalProjectList(medicalProject);
        return getDataTable(list);
    }

    @ApiOperation("获取医疗项目详细")
    @PostMapping("/getDetail")
    @ResponseBody
    public Object getDetail(Integer id)
    {
        if (id != 0)
        {
            return medicalProjectService.selectMedicalProjectById(id);
        }
        else
        {
            return new HashMap<>();
        }
    }

}
