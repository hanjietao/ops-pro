package com.pepper.project.ch.hospital.controller;

import com.pepper.framework.aspectj.lang.annotation.Log;
import com.pepper.framework.aspectj.lang.enums.BusinessType;
import com.pepper.framework.web.controller.BaseController;
import com.pepper.framework.web.domain.AjaxResult;
import com.pepper.framework.web.page.TableDataInfo;
import com.pepper.project.ch.hospital.domain.Hospital;
import com.pepper.project.ch.hospital.service.IHospitalService;
import com.pepper.project.csc.area.domain.Area;
import com.pepper.project.csc.area.service.IAreaService;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping("/ch/hospital")
public class HospitalController extends BaseController {

    private String prefix = "ch/hospital";

    @Autowired
    private IHospitalService hospitalService;

    @Autowired
    private IAreaService areaService;

    @RequiresPermissions("ch:hospital:view")
    @GetMapping()
    public String online()
    {
        return prefix + "/hospital";
    }

    @RequiresPermissions("ch:hospital:list")
    @PostMapping("/list")
    @ResponseBody
    public TableDataInfo list(Hospital hospital)
    {
        startPage();
        List<Hospital> list = hospitalService.selectHospitalList(hospital);
        return getDataTable(list);
    }

    /**
     * 新增区域
     */
    @GetMapping("/add")
    public String add(ModelMap mmap)
    {
        List<Area> areas = areaService.selectAreaList(new Area());
        mmap.put("areas",areas);
        return prefix + "/add";
    }

    /**
     * 新增保存区域设置
     */
    @Log(title = "医院介绍", businessType = BusinessType.INSERT)
    @RequiresPermissions("ch:hospital:add")
    @PostMapping("/add")
    @ResponseBody
    public AjaxResult addSave(Hospital hospital)
    {
        return toAjax(hospitalService.insertHospital(hospital));
    }

    /**
     * 修改区域
     */
    @GetMapping("/edit/{id}")
    public String edit(@PathVariable("id") Integer id, ModelMap mmap)
    {
        mmap.put("areas",areaService.selectAreaListByHosId(id));
        mmap.put("hospital", hospitalService.selectHospitalById(id));
        return prefix + "/edit";
    }

    /**
     * 修改保存公告
     */
    @RequiresPermissions("ch:hospital:edit")
    @Log(title = "医院介绍", businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    @ResponseBody
    public AjaxResult editSave(Hospital hospital)
    {
        return toAjax(hospitalService.updateHospital(hospital));
    }

    /**
     * 删除区域
     */
    @RequiresPermissions("ch:hospital:remove")
    @Log(title = "医院介绍", businessType = BusinessType.DELETE)
    @PostMapping("/remove")
    @ResponseBody
    public AjaxResult remove(String ids)
    {
        return toAjax(hospitalService.deleteHospitalByIds(ids));
    }

}
