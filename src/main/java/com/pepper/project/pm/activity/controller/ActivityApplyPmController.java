package com.pepper.project.pm.activity.controller;

import com.pepper.common.exception.BusinessException;
import com.pepper.common.utils.poi.ExcelUtil;
import com.pepper.framework.aspectj.lang.annotation.Log;
import com.pepper.framework.aspectj.lang.enums.BusinessType;
import com.pepper.framework.web.controller.BaseController;
import com.pepper.framework.web.domain.AjaxResult;
import com.pepper.framework.web.page.TableDataInfo;
import com.pepper.project.csc.area.domain.Area;
import com.pepper.project.csc.area.service.IAreaService;
import com.pepper.project.pm.activity.domain.ActivityApplyPm;
import com.pepper.project.pm.activity.domain.ActivityApplyPmExcel;
import com.pepper.project.pm.activity.service.IActivityApplyPmService;
import com.pepper.project.pm.activity.service.IActivityPmService;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/pm/activity/apply")
public class ActivityApplyPmController extends BaseController {

    Logger logger = LoggerFactory.getLogger(ActivityApplyPmController.class);

    private String prefix = "pm/activity/apply";

    @Autowired
    private IActivityApplyPmService activityApplyService;

    @Autowired
    private IActivityPmService activityService;

    @Autowired
    private IAreaService areaService;

    @RequiresPermissions("pm:activity:view")
    @GetMapping()
    public String online()
    {
        return prefix + "/activity";
    }

    @RequiresPermissions("pm:activity:list")
    @PostMapping("/list")
    @ResponseBody
    public TableDataInfo list(ActivityApplyPm activityApplyPm)
    {
        startPage();
        List<ActivityApplyPm> list = activityApplyService.selectActivityApplyList(activityApplyPm);
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
    public AjaxResult addSave(ActivityApplyPm activityApplyPm)
    {
        if(activityService.selectActivityById(activityApplyPm.getActivityId()) == null){
            logger.error("not find activity by the activity id={}", activityApplyPm.getActivityId());
            throw new BusinessException("当前选择的报名的活动已下架！");
        }
        return toAjax(activityApplyService.insertActivityApply(activityApplyPm));
    }

    /**
     * 修改活动
     */
    @GetMapping("/edit/{id}")
    public String edit(@PathVariable("id") Integer id, ModelMap mmap)
    {
        List<Area> areas = areaService.selectAreaList(new Area());
        mmap.put("areas",areas);
        mmap.put("activityApply", activityApplyService.selectActivityApplyById(id));
        return prefix + "/edit";
    }

    /**
     * 修改保存社区
     */
    @RequiresPermissions("pm:activity:edit")
    @Log(title = "活动报名", businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    @ResponseBody
    public AjaxResult editSave(ActivityApplyPm activityApplyPm)
    {
        return toAjax(activityApplyService.updateActivityApply(activityApplyPm));
    }

    /**
     * 删除活动报名
     */
    @RequiresPermissions("pm:activity:remove")
    @Log(title = "活动报名", businessType = BusinessType.DELETE)
    @PostMapping("/remove")
    @ResponseBody
    public AjaxResult remove(String ids)
    {
        return toAjax(activityApplyService.deleteActivityApplyByIds(ids));
    }

    @Log(title = "活动报名", businessType = BusinessType.EXPORT)
    @RequiresPermissions("pm:activity:export")
    @PostMapping("/export")
    @ResponseBody
    public AjaxResult export(ActivityApplyPm activityApplyPm)
    {
        List<ActivityApplyPm> list = activityApplyService.selectActivityApplyList(activityApplyPm);
        List<ActivityApplyPmExcel> excelList = new ArrayList<>();
        for (ActivityApplyPm apply: list) {
            ActivityApplyPmExcel excel = new ActivityApplyPmExcel();
            excel.setId(apply.getId());
            excel.setActivityTitle(apply.getActivityPm().getTitle());
            excel.setNikeName(apply.getClientUser().getNikeName());
            excel.setStatus(apply.getStatus());
            excel.setUserMobile(apply.getClientUser().getUserMobile());
            excel.setCreateTime(apply.getCreateTime());
            excelList.add(excel);
        }
        ExcelUtil<ActivityApplyPmExcel> util = new ExcelUtil<ActivityApplyPmExcel>(ActivityApplyPmExcel.class);
        return util.exportExcel(excelList, "活动报名列表"+"_"+ activityApplyPm.getId());
    }
}
