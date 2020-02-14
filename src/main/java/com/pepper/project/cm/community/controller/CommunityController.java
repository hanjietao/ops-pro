package com.pepper.project.cm.community.controller;

import com.pepper.framework.aspectj.lang.annotation.Log;
import com.pepper.framework.aspectj.lang.enums.BusinessType;
import com.pepper.framework.web.controller.BaseController;
import com.pepper.framework.web.domain.AjaxResult;
import com.pepper.framework.web.page.TableDataInfo;
import com.pepper.project.cm.community.domain.Community;
import com.pepper.project.cm.community.service.ICommunityService;
import com.pepper.project.csc.area.domain.Area;
import com.pepper.project.csc.area.service.IAreaService;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping("/cm/community")
public class CommunityController extends BaseController {

    private String prefix = "cm/community";

    @Autowired
    private ICommunityService communityService;

    @Autowired
    private IAreaService areaService;

    @RequiresPermissions("cm:community:view")
    @GetMapping()
    public String online()
    {
        return prefix + "/community";
    }

    @RequiresPermissions("cm:community:list")
    @PostMapping("/list")
    @ResponseBody
    public TableDataInfo list(Community community)
    {
        startPage();
        List<Community> list = communityService.selectCommunityList(community);
        return getDataTable(list);
    }

    /**
     * 新增社区
     */
    @GetMapping("/add")
    public String add(ModelMap mmap)
    {
        List<Area> areas = areaService.selectAreaList(new Area());
        mmap.put("areas",areas);
        return prefix + "/add";
    }

    /**
     * 新增保存社区
     */
    @Log(title = "社区", businessType = BusinessType.INSERT)
    @RequiresPermissions("cm:community:add")
    @PostMapping("/add")
    @ResponseBody
    public AjaxResult addSave(Community community)
    {
        return toAjax(communityService.insertCommunity(community));
    }

    /**
     * 修改区域
     */
    @GetMapping("/edit/{id}")
    public String edit(@PathVariable("id") Integer id, ModelMap mmap)
    {
        List<Area> areas = areaService.selectAreaList(new Area());
        mmap.put("areas",areas);
        mmap.put("community", communityService.selectCommunityById(id));
        return prefix + "/edit";
    }

    /**
     * 修改保存社区
     */
    @RequiresPermissions("cm:community:edit")
    @Log(title = "社区", businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    @ResponseBody
    public AjaxResult editSave(Community community)
    {
        return toAjax(communityService.updateCommunity(community));
    }

    /**
     * 删除社区
     */
    @RequiresPermissions("cm:community:remove")
    @Log(title = "社区", businessType = BusinessType.DELETE)
    @PostMapping("/remove")
    @ResponseBody
    public AjaxResult remove(String ids)
    {
        return toAjax(communityService.deleteCommunityByIds(ids));
    }

}