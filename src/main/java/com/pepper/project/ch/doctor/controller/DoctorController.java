package com.pepper.project.ch.doctor.controller;

import com.pepper.framework.aspectj.lang.annotation.Log;
import com.pepper.framework.aspectj.lang.enums.BusinessType;
import com.pepper.framework.web.controller.BaseController;
import com.pepper.framework.web.domain.AjaxResult;
import com.pepper.framework.web.page.TableDataInfo;
import com.pepper.project.ch.doctor.domain.Doctor;
import com.pepper.project.ch.doctor.service.IDoctorService;
import com.pepper.project.ch.hospital.domain.Hospital;
import com.pepper.project.ch.hospital.service.IHospitalService;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping("/ch/doctor")
public class DoctorController extends BaseController {

    private String prefix = "ch/doctor";

    @Autowired
    private IDoctorService doctorService;

    @Autowired
    private IHospitalService hospitalService;

    @RequiresPermissions("ch:doctor:view")
    @GetMapping()
    public String online(ModelMap mmap)
    {
        mmap.put("hospitals",hospitalService.selectHospitalList(new Hospital()));
        return prefix + "/doctor";
    }

    @RequiresPermissions("ch:doctor:list")
    @PostMapping("/list")
    @ResponseBody
    public TableDataInfo list(Doctor doctor)
    {
        startPage();
        List<Doctor> list = doctorService.selectDoctorList(doctor);
        return getDataTable(list);
    }

    /**
     * 新增医生
     */
    @GetMapping("/add")
    public String add(ModelMap mmap)
    {
        mmap.put("hospitals",hospitalService.selectHospitalList(new Hospital()));
        return prefix + "/add";
    }

    /**
     * 新增医生
     */
    @Log(title = "医生管理", businessType = BusinessType.INSERT)
    @RequiresPermissions("ch:doctor:add")
    @PostMapping("/add")
    @ResponseBody
    public AjaxResult addSave(Doctor doctor)
    {
        return toAjax(doctorService.insertDoctor(doctor));
    }

    /**
     * 编辑医生
     */
    @GetMapping("/edit/{id}")
    public String edit(@PathVariable("id") Integer id, ModelMap mmap)
    {
        //mmap.put("areas",areaService.selectAreaListByHosId(id));
        mmap.put("doctor", doctorService.selectDoctorById(id));
        mmap.put("hospitals",hospitalService.selectHospitalList(new Hospital()));
        //.selectAreaListByHosId(id)
        return prefix + "/edit";
    }

    /**
     * 修改医生
     */
    @RequiresPermissions("ch:doctor:edit")
    @Log(title = "医生管理", businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    @ResponseBody
    public AjaxResult editSave(Doctor doctor)
    {

        //return toAjax(hospitalService.updateHospital(hospital));
        return toAjax(doctorService.updateDoctor(doctor));
    }

    /**
     * 删除医生
     */
    @RequiresPermissions("ch:doctor:remove")
    @Log(title = "医生管理", businessType = BusinessType.DELETE)
    @PostMapping("/remove")
    @ResponseBody
    public AjaxResult remove(String ids)
    {
        return toAjax(doctorService.deleteDoctorByIds(ids));
    }

}
