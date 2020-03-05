package com.pepper.project.ch.hospital.controller;

import com.pepper.framework.aspectj.lang.annotation.Log;
import com.pepper.framework.aspectj.lang.enums.BusinessType;
import com.pepper.framework.web.controller.BaseController;
import com.pepper.framework.web.domain.AjaxResult;
import com.pepper.framework.web.page.TableDataInfo;
import com.pepper.project.ch.hospital.domain.Hospital;
import com.pepper.project.ch.hospital.service.IHospitalService;
import com.pepper.project.cm.community.domain.Community;
import com.pepper.project.cm.community.service.ICommunityService;
import com.pepper.project.csc.area.domain.Area;
import com.pepper.project.csc.area.service.IAreaService;
import com.pepper.project.pm.property.domain.Property;
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

@Api("医院")
@Controller
@RequestMapping("/ch/hospital")
public class HospitalController extends BaseController {

    private String prefix = "ch/hospital";

    @Autowired
    private IHospitalService hospitalService;

    @Autowired
    private IAreaService areaService;

    @Autowired
    private ICommunityService communityService;

    @RequiresPermissions("ch:hospital:view")
    @GetMapping()
    public String online(ModelMap mmap)
    {
        mmap.put("areas",areaService.selectAreaList(new Area()));
        mmap.put("communitys",communityService.selectCommunityList(new Community()));
        return prefix + "/hospital";
    }

    @RequiresPermissions("ch:hospital:list")
    @PostMapping("/list")
    @ResponseBody
    public TableDataInfo list(Hospital hospital)
    {
        startPage();
        hospital.setId(getMerchantId());
        List<Hospital> list = hospitalService.selectHospitalList(hospital);
        return getDataTable(list);
    }

    /**
     * 新增医院
     */
    @GetMapping("/add")
    public String add(ModelMap mmap)
    {
        List<Area> areas = areaService.selectAreaList(new Area());
        mmap.put("areas",areas);
        return prefix + "/add";
    }

    /**
     * 新增保存医院设置
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
     * 修改医院
     */
    @GetMapping("/edit/{id}")
    public String edit(@PathVariable("id") Long id, ModelMap mmap)
    {
        mmap.put("areas",areaService.selectAreaList(new Area()));
        mmap.put("communitys",communityService.selectCommunityListByHospitalId(id));
        mmap.put("hospital", hospitalService.selectHospitalById(id));
        return prefix + "/edit";
    }

    /**
     * 修改保存医院
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
     * 删除医院
     */
    @RequiresPermissions("ch:hospital:remove")
    @Log(title = "医院介绍", businessType = BusinessType.DELETE)
    @PostMapping("/remove")
    @ResponseBody
    public AjaxResult remove(String ids)
    {
        return toAjax(hospitalService.deleteHospitalByIds(ids));
    }


    @ApiOperation("医院列表")
    @PostMapping("/getList")
    @ResponseBody
    public TableDataInfo getList(Integer areaId,Long communityId)
    {
        startPage();
        Hospital hospital = new Hospital();
        if(areaId != null && areaId != 0){
            hospital.setAreaId(areaId.toString());
        }
        if(communityId != null && communityId != 0L){
            hospital.setCommunityIds(communityId.toString());
        }
        List<Hospital> list = hospitalService.selectHospitalList(hospital);
        return getDataTable(list);
    }

    @ApiOperation("获取医院详细")
    @ApiImplicitParam(name = "id", value = "医院id", dataType = "Long", required = true, paramType = "query")
    @PostMapping("/getDetail")
    @ResponseBody
    public Object getDetail(Long id)
    {
        if (id != 0L)
        {
            return hospitalService.selectHospitalById(id);
        }
        else
        {
            return new HashMap<>();
        }
    }
}
