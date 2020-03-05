package com.pepper.project.cm.guide.controller;

import com.pepper.framework.aspectj.lang.annotation.Log;
import com.pepper.framework.aspectj.lang.enums.BusinessType;
import com.pepper.framework.aspectj.lang.enums.SysUserType;
import com.pepper.framework.web.controller.BaseController;
import com.pepper.framework.web.domain.AjaxResult;
import com.pepper.framework.web.page.TableDataInfo;
import com.pepper.project.cm.community.domain.Community;
import com.pepper.project.cm.community.service.ICommunityService;
import com.pepper.project.cm.guide.domain.Guide;
import com.pepper.project.cm.guide.service.IGuideService;
import com.pepper.project.csc.area.domain.Area;
import com.pepper.project.csc.area.service.IAreaService;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping("/cm/guide")
public class GuideController extends BaseController {

    private String prefix = "cm/guide";

    @Autowired
    private IGuideService guideService;

    @Autowired
    private IAreaService areaService;

    @Autowired
    private ICommunityService communityService;

    @RequiresPermissions("cm:guide:view")
    @GetMapping()
    public String online(ModelMap mmap)
    {
        List<Community> communitys = communityService.selectCommunityList(new Community());
        mmap.put("communitys",communitys);
        return prefix + "/guide";
    }

    @RequiresPermissions("cm:guide:list")
    @PostMapping("/list")
    @ResponseBody
    public TableDataInfo list(Guide guide)
    {
        startPage();
        guide.setCommunityId(getMerchantId());
        List<Guide> list = guideService.selectGuideList(guide);
        return getDataTable(list);
    }

    /**
     * 新增社区指南
     */
    @GetMapping("/add")
    public String add(ModelMap mmap)
    {
        List<Community> communitys = communityService.selectCommunityList(new Community());
        mmap.put("communitys",communitys);
        return prefix + "/add";
    }

    /**
     * 新增保存社区指南
     */
    @Log(title = "社区指南", businessType = BusinessType.INSERT)
    @RequiresPermissions("cm:guide:add")
    @PostMapping("/add")
    @ResponseBody
    public AjaxResult addSave(Guide guide)
    {
        if(getMerchantId()==null || getMerchantId() == 0 ||
                !SysUserType.cadmin.getType().equals(getSysUser().getMerchantFlag())){
            return  error("非社区业务系统用户 无法添加社区指南");
        }
        guide.setCommunityId(getMerchantId());
        return toAjax(guideService.insertGuide(guide));
    }

    /**
     * 修改社区指南
     */
    @GetMapping("/edit/{id}")
    public String edit(@PathVariable("id") Integer id, ModelMap mmap)
    {
        List<Community> communitys = communityService.selectCommunityList(new Community());
        mmap.put("communitys",communitys);
        mmap.put("guide", guideService.selectGuideById(id));
        return prefix + "/edit";
    }

    /**
     * 修改保存社区指南
     */
    @RequiresPermissions("cm:guide:edit")
    @Log(title = "社区指南", businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    @ResponseBody
    public AjaxResult editSave(Guide guide)
    {
        return toAjax(guideService.updateGuide(guide));
    }

    /**
     * 删除社区指南
     */
    @RequiresPermissions("cm:guide:remove")
    @Log(title = "社区指南", businessType = BusinessType.DELETE)
    @PostMapping("/remove")
    @ResponseBody
    public AjaxResult remove(String ids)
    {
        return toAjax(guideService.deleteGuideByIds(ids));
    }

}
