package com.pepper.project.csc.region.controller;

import com.pepper.framework.aspectj.lang.annotation.Log;
import com.pepper.framework.aspectj.lang.enums.BusinessType;
import com.pepper.framework.web.controller.BaseController;
import com.pepper.framework.web.domain.AjaxResult;
import com.pepper.framework.web.page.TableDataInfo;
import com.pepper.project.csc.region.domain.Region;
import com.pepper.project.csc.region.service.IRegionService;
import io.swagger.annotations.ApiOperation;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping("/csc/region")
public class RegionController extends BaseController{

    private String prefix = "csc/region";

    @Autowired
    private IRegionService regionService;

    @RequiresPermissions("csc:region:view")
    @GetMapping()
    public String online()
    {
        return prefix + "/region";
    }

    @RequiresPermissions("csc:region:list")
    @PostMapping("/list")
    @ResponseBody
    public TableDataInfo list(Region region)
    {
        startPage();
        List<Region> list = regionService.selectRegionList(region);
        return getDataTable(list);
    }

    /**
     * 新增区域
     */
    @GetMapping("/add")
    public String add()
    {
        return prefix + "/add";
    }

    /**
     * 新增保存区域设置
     */
    @Log(title = "区域设置", businessType = BusinessType.INSERT)
    @RequiresPermissions("csc:region:add")
    @PostMapping("/add")
    @ResponseBody
    public AjaxResult addSave(Region region)
    {
        return toAjax(regionService.insertRegion(region));
    }

    /**
     * 修改区域
     */
    @GetMapping("/edit/{id}")
    public String edit(@PathVariable("id") Integer id, ModelMap mmap)
    {
        mmap.put("region", regionService.selectRegionById(id));
        return prefix + "/edit";
    }

    /**
     * 修改保存公告
     */
    @RequiresPermissions("csc:region:edit")
    @Log(title = "区域设置", businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    @ResponseBody
    public AjaxResult editSave(Region region)
    {
        return toAjax(regionService.updateRegion(region));
    }

    /**
     * 删除区域
     */
    @RequiresPermissions("csc:region:remove")
    @Log(title = "区域设置", businessType = BusinessType.DELETE)
    @PostMapping("/remove")
    @ResponseBody
    public AjaxResult remove(String ids)
    {
        return toAjax(regionService.deleteRegionByIds(ids));
    }

    @ApiOperation("区域列表")
    @PostMapping("/getList")
    @ResponseBody
    public TableDataInfo getList()
    {
        startPage();
        List<Region> list = regionService.selectRegionList(new Region());
        return getDataTable(list);
    }
}

