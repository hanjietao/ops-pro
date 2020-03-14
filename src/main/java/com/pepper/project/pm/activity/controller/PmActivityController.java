package com.pepper.project.pm.activity.controller;

import com.pepper.framework.aspectj.lang.annotation.Log;
import com.pepper.framework.aspectj.lang.enums.BusinessType;
import com.pepper.framework.aspectj.lang.enums.SysUserType;
import com.pepper.framework.web.controller.BaseController;
import com.pepper.framework.web.domain.AjaxResult;
import com.pepper.framework.web.page.TableDataInfo;
import com.pepper.project.csc.area.service.IAreaService;
import com.pepper.project.pm.activity.domain.PmActivity;
import com.pepper.project.pm.activity.service.IPmActivityService;
import com.pepper.project.pm.property.domain.Property;
import com.pepper.project.pm.property.service.IPropertyService;
import io.swagger.annotations.ApiOperation;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.List;

@Controller
@RequestMapping("/pm/activity")
public class PmActivityController extends BaseController {

    private String prefix = "pm/activity";

    @Autowired
    private IPmActivityService activityService;

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
    public TableDataInfo list(PmActivity pmActivity)
    {
        startPage();
        pmActivity.setPropertyId(getMerchantId());
        List<PmActivity> list = activityService.selectActivityList(pmActivity);
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
    @RequiresPermissions("pm:activity:add")
    @PostMapping("/add")
    @ResponseBody
    public AjaxResult addSave(PmActivity pmActivity)
    {
        if(getMerchantId()==null || getMerchantId() == 0 ||
                !SysUserType.padmin.getType().equals(getSysUser().getMerchantFlag())){
            return  error("非物业业务系统无法添加物业活动");
        }
        pmActivity.setPropertyId(getMerchantId());
        return toAjax(activityService.insertActivity(pmActivity));
    }

    /**
     * 修改活动
     */
    @GetMapping("/edit/{id}")
    public String edit(@PathVariable("id") Long id, ModelMap mmap)
    {
//        List<Area> areas = areaService.selectAreaList(new Area());
//        mmap.put("areas",areas);
        mmap.put("pmActivity", activityService.selectActivityById(id));
        return prefix + "/edit";
    }

    /**
     * 修改保存社区
     */
    @RequiresPermissions("pm:activity:edit")
    @Log(title = "活动", businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    @ResponseBody
    public AjaxResult editSave(PmActivity pmActivity)
    {
        return toAjax(activityService.updateActivity(pmActivity));
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
        return error("删除，不支持操作");
        //return toAjax(activityService.deleteActivityByIds(ids));
    }

    /**
     * 查询报名详情
     */
    @RequiresPermissions("pm:activity:list")
    @GetMapping("/detail/{id}")
    public String detail(@PathVariable("id") Long id, ModelMap mmap)
    {
        String merchantFlag = getSysUser().getMerchantFlag();
        PmActivity pmActivity = new PmActivity();
        if(SysUserType.admin.getType().equals(merchantFlag)){
            // 查询所有的活动
            mmap.put("activityList", activityService.selectActivityList(pmActivity));//dictTypeService.selectDictTypeAll());
        }else if(SysUserType.padmin.getType().equals(merchantFlag)){
            pmActivity.setPropertyId(getMerchantId());
            mmap.put("activityList", activityService.selectActivityList(pmActivity));
        }else{
            return "页面打开失败，用户类型错误!";
        }

        mmap.put("activity", activityService.selectActivityById(id));//dictTypeService.selectDictTypeById(dictId));
        return "pm/activity/apply/apply";
    }

    @ApiOperation("物业活动列表")
    @PostMapping("/getList")
    @ResponseBody
    public TableDataInfo getList(Long propertyId)
    {
        PmActivity pmActivity = new PmActivity();
        pmActivity.setPropertyId(propertyId);
        List<PmActivity> list = activityService.selectActivityList(pmActivity);
        return getDataTable(list);
    }

    @ApiOperation("物业活动详细")
    @PostMapping("/getDetail")
    @ResponseBody
    public Object getDetail(Long id)
    {
        if (id != 0)
        {
            return activityService.selectActivityById(id);
        }
        else
        {
            return new HashMap<>();
        }
    }


}
