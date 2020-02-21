package com.pepper.project.pm.activity.controller;

import com.pepper.framework.aspectj.lang.annotation.Log;
import com.pepper.framework.aspectj.lang.enums.BusinessType;
import com.pepper.framework.web.controller.BaseController;
import com.pepper.framework.web.domain.AjaxResult;
import com.pepper.framework.web.page.TableDataInfo;
import com.pepper.project.csc.area.domain.Area;
import com.pepper.project.csc.area.service.IAreaService;
import com.pepper.project.pm.activity.domain.ActivityPm;
import com.pepper.project.pm.activity.service.IActivityPmService;
import com.pepper.project.pm.property.domain.Property;
import com.pepper.project.pm.property.service.IPropertyService;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping("/pm/activity")
public class ActivityPmController extends BaseController {

    private String prefix = "pm/activity";

    @Autowired
    private IActivityPmService activityService;

    @Autowired
    private IAreaService areaService;

    @Autowired
    private IPropertyService propertyService;

    @RequiresPermissions("pm:activity:view")
    @GetMapping()
    public String online(ModelMap mmap)
    {
        mmap.put("propertys",propertyService.selectPropertyList(new Property()));
        return prefix + "/activity";
    }

    @RequiresPermissions("pm:activity:list")
    @PostMapping("/list")
    @ResponseBody
    public TableDataInfo list(ActivityPm activityPm)
    {
        startPage();
        List<ActivityPm> list = activityService.selectActivityList(activityPm);
        return getDataTable(list);
    }

    /**
     * 新增活动
     */
    @GetMapping("/add")
    public String add(ModelMap mmap)
    {
        List<Area> areas = areaService.selectAreaList(new Area());
        mmap.put("areas",areas);
        return prefix + "/add";
    }

    /**
     * 新增保存活动
     */
    @Log(title = "活动", businessType = BusinessType.INSERT)
    @RequiresPermissions("pm:activity:add")
    @PostMapping("/add")
    @ResponseBody
    public AjaxResult addSave(ActivityPm activityPm)
    {
        return toAjax(activityService.insertActivity(activityPm));
    }

    /**
     * 修改活动
     */
    @GetMapping("/edit/{id}")
    public String edit(@PathVariable("id") Integer id, ModelMap mmap)
    {
        List<Area> areas = areaService.selectAreaList(new Area());
        mmap.put("areas",areas);
        mmap.put("activityPm", activityService.selectActivityById(id));
        return prefix + "/edit";
    }

    /**
     * 修改保存社区
     */
    @RequiresPermissions("pm:activity:edit")
    @Log(title = "活动", businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    @ResponseBody
    public AjaxResult editSave(ActivityPm activityPm)
    {
        return toAjax(activityService.updateActivity(activityPm));
    }

    /**
     * 删除活动
     */
    @RequiresPermissions("pm:activity:remove")
    @Log(title = "活动", businessType = BusinessType.DELETE)
    @PostMapping("/remove")
    @ResponseBody
    public AjaxResult remove(String ids)
    {
        return toAjax(activityService.deleteActivityByIds(ids));
    }

    /**
     * 查询报名详情
     */
    @RequiresPermissions("pm:activity:list")
    @GetMapping("/detail/{id}")
    public String detail(@PathVariable("id") Integer id, ModelMap mmap)
    {
        mmap.put("activity", activityService.selectActivityById(id));//dictTypeService.selectDictTypeById(dictId));
        // 查询所有的活动
        mmap.put("activityList", activityService.selectActivityList(new ActivityPm()));//dictTypeService.selectDictTypeAll());
        return "pm/activity/apply/apply";
    }



}
