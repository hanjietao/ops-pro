package com.pepper.project.csc.area.controller;

import com.pepper.framework.aspectj.lang.annotation.Log;
import com.pepper.framework.aspectj.lang.enums.BusinessType;
import com.pepper.framework.web.controller.BaseController;
import com.pepper.framework.web.domain.AjaxResult;
import com.pepper.framework.web.page.TableDataInfo;
import com.pepper.project.csc.area.domain.Area;
import com.pepper.project.csc.area.service.IAreaService;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping("/csc/area")
public class AreaController extends BaseController{

    private String prefix = "csc/area";

    @Autowired
    private IAreaService areaService;

    @RequiresPermissions("csc:area:view")
    @GetMapping()
    public String online()
    {
        return prefix + "/area";
    }

    @RequiresPermissions("csc:area:list")
    @PostMapping("/list")
    @ResponseBody
    public TableDataInfo list(Area area)
    {
        startPage();
        List<Area> list = areaService.selectAreaList(area);
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
    @RequiresPermissions("csc:area:add")
    @PostMapping("/add")
    @ResponseBody
    public AjaxResult addSave(Area area)
    {
        return toAjax(areaService.insertArea(area));
    }

    /**
     * 修改区域
     */
    @GetMapping("/edit/{id}")
    public String edit(@PathVariable("id") Integer id, ModelMap mmap)
    {
        mmap.put("area", areaService.selectAreaById(id));
        return prefix + "/edit";
    }

    /**
     * 修改保存公告
     */
    @RequiresPermissions("csc:area:edit")
    @Log(title = "区域设置", businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    @ResponseBody
    public AjaxResult editSave(Area area)
    {
        return toAjax(areaService.updateArea(area));
    }

    /**
     * 删除区域
     */
    @RequiresPermissions("csc:area:remove")
    @Log(title = "区域设置", businessType = BusinessType.DELETE)
    @PostMapping("/remove")
    @ResponseBody
    public AjaxResult remove(String ids)
    {
        return toAjax(areaService.deleteAreaByIds(ids));
    }

}

