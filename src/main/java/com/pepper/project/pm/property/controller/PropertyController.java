package com.pepper.project.pm.property.controller;

import com.pepper.framework.aspectj.lang.annotation.Log;
import com.pepper.framework.aspectj.lang.enums.BusinessType;
import com.pepper.framework.web.controller.BaseController;
import com.pepper.framework.web.domain.AjaxResult;
import com.pepper.framework.web.page.TableDataInfo;
import com.pepper.project.csc.area.domain.Area;
import com.pepper.project.csc.area.service.IAreaService;
import com.pepper.project.pm.property.domain.Property;
import com.pepper.project.pm.property.service.IPropertyService;
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

@Api("物业")
@Controller
@RequestMapping("/pm/property")
public class PropertyController extends BaseController {

    private String prefix = "pm/property";

    @Autowired
    private IPropertyService propertyService;

    @Autowired
    private IAreaService areaService;

    @RequiresPermissions("pm:property:view")
    @GetMapping()
    public String online(ModelMap mmap)
    {
        List<Area> areas = areaService.selectAreaList(new Area());
        mmap.put("areas",areas);
        return prefix + "/property";
    }

    @RequiresPermissions("pm:property:list")
    @PostMapping("/list")
    @ResponseBody
    public TableDataInfo list(Property property)
    {
        startPage();
        property.setId(getMerchantId());
        List<Property> list = propertyService.selectPropertyList(property);
        return getDataTable(list);
    }

    /**
     * 新增物业
     */
    @GetMapping("/add")
    public String add(ModelMap mmap)
    {
        List<Area> areas = areaService.selectAreaList(new Area());
        mmap.put("areas",areas);
        return prefix + "/add";
    }

    /**
     * 新增保存物业
     */
    @Log(title = "物业", businessType = BusinessType.INSERT)
    @RequiresPermissions("pm:property:add")
    @PostMapping("/add")
    @ResponseBody
    public AjaxResult addSave(Property property)
    {
        return toAjax(propertyService.insertProperty(property));
    }

    /**
     * 修改区域
     */
    @GetMapping("/edit/{id}")
    public String edit(@PathVariable("id") Long id, ModelMap mmap)
    {
        List<Area> areas = areaService.selectAreaList(new Area());
        mmap.put("areas",areas);
        mmap.put("property", propertyService.selectPropertyById(id));
        return prefix + "/edit";
    }

    /**
     * 修改保存物业
     */
    @RequiresPermissions("pm:property:edit")
    @Log(title = "物业", businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    @ResponseBody
    public AjaxResult editSave(Property property)
    {
        return toAjax(propertyService.updateProperty(property));
    }

    /**
     * 删除物业
     */
    @RequiresPermissions("pm:property:remove")
    @Log(title = "物业", businessType = BusinessType.DELETE)
    @PostMapping("/remove")
    @ResponseBody
    public AjaxResult remove(String ids)
    {
        return toAjax(propertyService.deletePropertyByIds(ids));
    }

    @ApiOperation("物业列表")
    @PostMapping("/getList")
    @ResponseBody
    public TableDataInfo getList()
    {
        startPage();
        List<Property> list = propertyService.selectPropertyList(new Property());
        return getDataTable(list);
    }

    @ApiOperation("获取社区详细")
    @ApiImplicitParam(name = "id", value = "物业id", dataType = "Long", required = true, paramType = "query")
    @PostMapping("/getDetail")
    @ResponseBody
    public Object getDetail(Long id)
    {
        if (id != 0L)
        {
            return propertyService.selectPropertyById(id);
        }
        else
        {
            return new HashMap<>();
        }
    }
}
