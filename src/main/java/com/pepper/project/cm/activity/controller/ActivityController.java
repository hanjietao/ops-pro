package com.pepper.project.cm.activity.controller;

import com.pepper.framework.aspectj.lang.annotation.Log;
import com.pepper.framework.aspectj.lang.enums.BusinessType;
import com.pepper.framework.aspectj.lang.enums.SysUserType;
import com.pepper.framework.web.controller.BaseController;
import com.pepper.framework.web.domain.AjaxResult;
import com.pepper.framework.web.page.TableDataInfo;
import com.pepper.project.cm.activity.domain.Activity;
import com.pepper.project.cm.activity.service.IActivityService;
import com.pepper.project.cm.community.domain.Community;
import com.pepper.project.cm.community.service.ICommunityService;
import com.pepper.project.csc.area.domain.Area;
import com.pepper.project.csc.area.service.IAreaService;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/cm/activity")
public class ActivityController extends BaseController {

    private String prefix = "cm/activity";

    @Autowired
    private IActivityService activityService;

    @Autowired
    private ICommunityService communityService;

    @Autowired
    private IAreaService areaService;

    @RequiresPermissions("cm:activity:view")
    @GetMapping()
    public String online(ModelMap mmap)
    {
        List<Community> communitys = communityService.selectCommunityList(new Community());
        mmap.put("communitys",communitys);
        return prefix + "/activity";
    }

    @RequiresPermissions("cm:activity:list")
    @PostMapping("/list")
    @ResponseBody
    public TableDataInfo list(Activity activity)
    {
        startPage();
        activity.setCommunityId(getMerchantId());
        List<Activity> list = activityService.selectActivityList(activity);
        return getDataTable(list);
    }

    /**
     * 新增活动
     */
    @GetMapping("/add")
    public String add(ModelMap mmap)
    {
//        List<Area> areas = areaService.selectAreaList(new Area());
//        mmap.put("areas",areas);
        return prefix + "/add";
    }

    /**
     * 新增保存活动
     */
    @Log(title = "活动", businessType = BusinessType.INSERT)
    @RequiresPermissions("cm:activity:add")
    @PostMapping("/add")
    @ResponseBody
    public AjaxResult addSave(Activity activity)
    {
        if(getMerchantId()==null || getMerchantId() == 0 ||
                !SysUserType.cadmin.getType().equals(getSysUser().getMerchantFlag())){
            return  error("非社区业务系统无法添加社区活动");
        }
        activity.setCommunityId(getMerchantId());
        return toAjax(activityService.insertActivity(activity));
    }

    /**
     * 修改活动
     */
    @GetMapping("/edit/{id}")
    public String edit(@PathVariable("id") Integer id, ModelMap mmap)
    {
//        List<Area> areas = areaService.selectAreaList(new Area());
//        mmap.put("areas",areas);
        mmap.put("activity", activityService.selectActivityById(id));
        return prefix + "/edit";
    }

    /**
     * 修改保存社区
     */
    @RequiresPermissions("cm:activity:edit")
    @Log(title = "活动", businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    @ResponseBody
    public AjaxResult editSave(Activity activity)
    {
        return toAjax(activityService.updateActivity(activity));
    }

    /**
     * 删除活动
     */
    @RequiresPermissions("cm:activity:remove")
    @Log(title = "活动", businessType = BusinessType.DELETE)
    @PostMapping("/remove")
    @ResponseBody
    public AjaxResult remove(String ids)
    {
        return error("删除，不支持操作");
        //return toAjax(activityService.deleteActivityByIds(ids));
    }

    /**
     * 查询报名详情
     */
    @RequiresPermissions("cm:activity:list")
    @GetMapping("/detail/{id}")
    public String detail(@PathVariable("id") Integer id, ModelMap mmap)
    {
        String merchantFlag = getSysUser().getMerchantFlag();
        Activity activity = new Activity();
        if(SysUserType.admin.getType().equals(merchantFlag)){
            // 查询所有的活动
            mmap.put("activityList", activityService.selectActivityList(activity));//dictTypeService.selectDictTypeAll());
        }else if(SysUserType.cadmin.getType().equals(merchantFlag)){
            activity.setCommunityId(getMerchantId());
            mmap.put("activityList", activityService.selectActivityList(activity));
        }else{
            return "页面打开失败，用户类型错误!";
        }
        mmap.put("activity", activityService.selectActivityById(id));
        return "cm/activity/apply/apply";
    }



}
