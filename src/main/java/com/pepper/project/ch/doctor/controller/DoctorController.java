package com.pepper.project.ch.doctor.controller;

import com.pepper.framework.aspectj.lang.annotation.Log;
import com.pepper.framework.aspectj.lang.enums.BusinessType;
import com.pepper.framework.aspectj.lang.enums.SysUserType;
import com.pepper.framework.web.controller.BaseController;
import com.pepper.framework.web.domain.AjaxResult;
import com.pepper.framework.web.page.TableDataInfo;
import com.pepper.project.ch.doctor.domain.Doctor;
import com.pepper.project.ch.doctor.service.IDoctorService;
import com.pepper.project.ch.hospital.domain.Hospital;
import com.pepper.project.ch.hospital.service.IHospitalService;
import com.pepper.project.ch.medical.domain.MedicalProject;
import io.swagger.annotations.ApiOperation;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
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
        doctor.setHospitalId(getMerchantId());
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
        if(getMerchantId()==null || getMerchantId() == 0 ||
                !SysUserType.hadmin.getType().equals(getSysUser().getMerchantFlag())){
            return  error("非医院业务系统用户 无法添加医院医生");
        }
        doctor.setHospitalId(getMerchantId());
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

    @ApiOperation("医院医生列表")
    @PostMapping("/getList")
    @ResponseBody
    public TableDataInfo getList(Long hosId)
    {
        Doctor doctor = new Doctor();
        doctor.setHospitalId(hosId);
        List<Doctor> list = doctorService.selectDoctorList(doctor);
        return getDataTable(list);
    }

    @ApiOperation("获取医生详细")
    @PostMapping("/getDetail")
    @ResponseBody
    public Object getDetail(Integer id)
    {
        if (id != 0)
        {
            return doctorService.selectDoctorById(id);
        }
        else
        {
            return new HashMap<>();
        }
    }
}
