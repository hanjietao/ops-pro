package com.pepper.project.pm.guide.controller;

import com.pepper.framework.aspectj.lang.annotation.Log;
import com.pepper.framework.aspectj.lang.enums.BusinessType;
import com.pepper.framework.aspectj.lang.enums.SysUserType;
import com.pepper.framework.web.controller.BaseController;
import com.pepper.framework.web.domain.AjaxResult;
import com.pepper.framework.web.page.TableDataInfo;
import com.pepper.project.csc.area.service.IAreaService;
import com.pepper.project.pm.property.domain.Property;
import com.pepper.project.pm.property.service.IPropertyService;
import com.pepper.project.pm.guide.domain.PmGuide;
import com.pepper.project.pm.guide.service.IPmGuideService;
import io.swagger.annotations.ApiOperation;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.List;

@Controller
@RequestMapping("/pm/guide")
public class PmGuideController extends BaseController {

    private String prefix = "pm/guide";

    @Autowired
    private IPmGuideService guideService;

    @Autowired
    private IAreaService areaService;

    @Autowired
    private IPropertyService propertyService;

    @RequiresPermissions("pm:guide:view")
    @GetMapping()
    public String online(ModelMap mmap)
    {
        mmap.put("propertys",propertyService.selectPropertyList(new Property()));
        return prefix + "/guide";
    }

    @RequiresPermissions("pm:guide:list")
    @PostMapping("/list")
    @ResponseBody
    public TableDataInfo list(PmGuide guide)
    {
        startPage();
        if(getMerchantId()!=0){
            guide.setPropertyId(getMerchantId());
        }
        List<PmGuide> list = guideService.selectGuideList(guide);
        return getDataTable(list);
    }

    /**
     * 新增区域
     */
    @GetMapping("/add")
    public String add(ModelMap mmap)
    {
        List<Property> propertys = propertyService.selectPropertyList(new Property());
        mmap.put("propertys",propertys);
        return prefix + "/add";
    }

    /**
     * 新增保存区域设置
     */
    @Log(title = "办事指南", businessType = BusinessType.INSERT)
    @RequiresPermissions("pm:guide:add")
    @PostMapping("/add")
    @ResponseBody
    public AjaxResult addSave(PmGuide guide)
    {
        if(getMerchantId()==null || getMerchantId() == 0 ||
                !SysUserType.padmin.getType().equals(getSysUser().getMerchantFlag())){
            return  error("非物业业务系统用户 无法添加物业指南");
        }
        guide.setPropertyId(getMerchantId());
        return toAjax(guideService.insertGuide(guide));
    }

    /**
     * 修改区域
     */
    @GetMapping("/edit/{id}")
    public String edit(@PathVariable("id") Long id, ModelMap mmap)
    {
        List<Property> propertys = propertyService.selectPropertyList(new Property());
        mmap.put("propertys",propertys);
        mmap.put("guide", guideService.selectGuideById(id));
        return prefix + "/edit";
    }

    /**
     * 修改保存物业指南
     */
    @RequiresPermissions("pm:guide:edit")
    @Log(title = "办事指南", businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    @ResponseBody
    public AjaxResult editSave(PmGuide guide)
    {
        return toAjax(guideService.updateGuide(guide));
    }

    /**
     * 删除区域
     */
    @RequiresPermissions("pm:guide:remove")
    @Log(title = "办事指南", businessType = BusinessType.DELETE)
    @PostMapping("/remove")
    @ResponseBody
    public AjaxResult remove(String ids)
    {
        return toAjax(guideService.deleteGuideByIds(ids));
    }


    @ApiOperation("物业指南列表")
    @PostMapping("/getList")
    @ResponseBody
    public TableDataInfo getList(Long propertyId)
    {
        PmGuide pmGuide = new PmGuide();
        pmGuide.setPropertyId(propertyId);
        List<PmGuide> list = guideService.selectGuideList(pmGuide);
        return getDataTable(list);
    }

    @ApiOperation("物业指南详细")
    @PostMapping("/getDetail")
    @ResponseBody
    public Object getDetail(Long id)
    {
        if (id != 0)
        {
            return guideService.selectGuideById(id);
        }
        else
        {
            return new HashMap<>();
        }
    }
}
