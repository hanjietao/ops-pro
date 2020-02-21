package com.pepper.project.cm.activity.controller;

import com.pepper.common.exception.BusinessException;
import com.pepper.common.utils.poi.ExcelUtil;
import com.pepper.framework.aspectj.lang.annotation.Log;
import com.pepper.framework.aspectj.lang.enums.BusinessType;
import com.pepper.framework.web.controller.BaseController;
import com.pepper.framework.web.domain.AjaxResult;
import com.pepper.framework.web.page.TableDataInfo;
import com.pepper.project.cm.activity.domain.ActivityApply;
import com.pepper.project.cm.activity.domain.ActivityApplyExcel;
import com.pepper.project.cm.activity.service.IActivityApplyService;
import com.pepper.project.cm.activity.service.IActivityService;
import com.pepper.project.csc.area.domain.Area;
import com.pepper.project.csc.area.service.IAreaService;
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
@RequestMapping("/cm/activity/apply")
public class ActivityApplyController extends BaseController {

    Logger logger = LoggerFactory.getLogger(ActivityApplyController.class);

    private String prefix = "cm/activity/apply";

    @Autowired
    private IActivityApplyService activityApplyService;

    @Autowired
    private IActivityService activityService;

    @Autowired
    private IAreaService areaService;

    @RequiresPermissions("cm:activity:view")
    @GetMapping()
    public String online()
    {
        return prefix + "/activity";
    }

    @RequiresPermissions("cm:activity:list")
    @PostMapping("/list")
    @ResponseBody
    public TableDataInfo list(ActivityApply activityApply)
    {
        startPage();
        if(getMerchantId()!=0){
            activityApply.setCommunityId(getMerchantId());
        }
        List<ActivityApply> list = activityApplyService.selectActivityApplyList(activityApply);
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
    @RequiresPermissions("cm:activity:add")
    @PostMapping("/add")
    @ResponseBody
    public AjaxResult addSave(ActivityApply activityApply)
    {
        if(activityService.selectActivityById(activityApply.getActivityId()) == null){
            logger.error("not find activity by the activity id={}",activityApply.getActivityId());
            throw new BusinessException("当前选择的报名的活动已下架！");
        }
        return toAjax(activityApplyService.insertActivityApply(activityApply));
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
    @RequiresPermissions("cm:activity:edit")
    @Log(title = "活动报名", businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    @ResponseBody
    public AjaxResult editSave(ActivityApply activityApply)
    {
        return toAjax(activityApplyService.updateActivityApply(activityApply));
    }

    /**
     * 删除活动报名
     */
    @RequiresPermissions("cm:activity:remove")
    @Log(title = "活动报名", businessType = BusinessType.DELETE)
    @PostMapping("/remove")
    @ResponseBody
    public AjaxResult remove(String ids)
    {
        return toAjax(activityApplyService.deleteActivityApplyByIds(ids));
    }

    @Log(title = "活动报名", businessType = BusinessType.EXPORT)
    @RequiresPermissions("cm:activity:export")
    @PostMapping("/export")
    @ResponseBody
    public AjaxResult export(ActivityApply activityApply)
    {
        if(getMerchantId()!=0){
            activityApply.setCommunityId(getMerchantId());
        }
        List<ActivityApply> list = activityApplyService.selectActivityApplyList(activityApply);
        List<ActivityApplyExcel> excelList = new ArrayList<>();
        for (ActivityApply apply: list) {
            ActivityApplyExcel excel = new ActivityApplyExcel();
            excel.setId(apply.getId());
            excel.setActivityTitle(apply.getActivity().getTitle());
            excel.setNikeName(apply.getClientUser().getNikeName());
            excel.setStatus(apply.getStatus());
            excel.setUserMobile(apply.getClientUser().getUserMobile());
            excel.setCreateTime(apply.getCreateTime());
            excelList.add(excel);
        }
        ExcelUtil<ActivityApplyExcel> util = new ExcelUtil<ActivityApplyExcel>(ActivityApplyExcel.class);
        return util.exportExcel(excelList, "活动报名列表"+"_"+activityApply.getId());
    }
}
