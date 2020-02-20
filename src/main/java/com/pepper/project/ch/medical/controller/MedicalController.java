package com.pepper.project.ch.medical.controller;

import com.pepper.framework.aspectj.lang.annotation.Log;
import com.pepper.framework.aspectj.lang.enums.BusinessType;
import com.pepper.framework.web.controller.BaseController;
import com.pepper.framework.web.domain.AjaxResult;
import com.pepper.framework.web.page.TableDataInfo;
import com.pepper.project.ch.medical.domain.MedicalProject;
import com.pepper.project.ch.medical.service.IMedicalProjectService;
import com.pepper.project.csc.area.service.IAreaService;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping("/ch/medical")
public class MedicalController extends BaseController {

    private String prefix = "ch/medical";

    @Autowired
    private IMedicalProjectService medicalProjectService;

    @Autowired
    private IAreaService areaService;

    @RequiresPermissions("ch:medical:view")
    @GetMapping()
    public String online()
    {
        return prefix + "/medical";
    }

    @RequiresPermissions("ch:medical:list")
    @PostMapping("/list")
    @ResponseBody
    public TableDataInfo list(MedicalProject medicalProject)
    {
        startPage();
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

}
