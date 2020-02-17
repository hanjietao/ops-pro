package com.pepper.project.pm.notice.controller;

import com.pepper.framework.aspectj.lang.annotation.Log;
import com.pepper.framework.aspectj.lang.enums.BusinessType;
import com.pepper.framework.web.controller.BaseController;
import com.pepper.framework.web.domain.AjaxResult;
import com.pepper.framework.web.page.TableDataInfo;
import com.pepper.project.csc.area.service.IAreaService;
import com.pepper.project.pm.notice.domain.PmNotice;
import com.pepper.project.pm.notice.service.IPmNoticeService;
import com.pepper.project.pm.property.domain.Property;
import com.pepper.project.pm.property.service.IPropertyService;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping("/pm/notice")
public class PmNoticeController extends BaseController {

    private String prefix = "pm/notice";

    @Autowired
    private IPmNoticeService pmNoticeService;

    @Autowired
    private IAreaService areaService;

    @Autowired
    private IPropertyService propertyService;

    @RequiresPermissions("pm:notice:view")
    @GetMapping()
    public String online(ModelMap mmap)
    {
        List<Property> propertys = propertyService.selectPropertyList(new Property());
        mmap.put("propertys",propertys);
        return prefix + "/notice";
    }

    @RequiresPermissions("pm:notice:list")
    @PostMapping("/list")
    @ResponseBody
    public TableDataInfo list(PmNotice notice)
    {
        startPage();
        List<PmNotice> list = pmNoticeService.selectPmNoticeList(notice);
        return getDataTable(list);
    }

    /**
     * 新增社区留言
     */
    @GetMapping("/add")
    public String add(ModelMap mmap)
    {
        List<Property> propertys = propertyService.selectPropertyList(new Property());
        mmap.put("propertys",propertys);
        return prefix + "/add";
    }

    /**
     * 新增保存社区留言
     */
    @Log(title = "社区留言", businessType = BusinessType.INSERT)
    @RequiresPermissions("pm:notice:add")
    @PostMapping("/add")
    @ResponseBody
    public AjaxResult addSave(PmNotice notice)
    {
        return toAjax(pmNoticeService.insertPmNotice(notice));
    }

    /**
     * 修改社区留言
     */
    @GetMapping("/edit/{id}")
    public String edit(@PathVariable("id") Integer id, ModelMap mmap)
    {
        List<Property> propertys = propertyService.selectPropertyList(new Property());
        mmap.put("propertys",propertys);
        mmap.put("notice", pmNoticeService.selectPmNoticeById(id));
        return prefix + "/edit";
    }

    /**
     * 修改保存社区留言
     */
    @RequiresPermissions("pm:notice:edit")
    @Log(title = "社区留言", businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    @ResponseBody
    public AjaxResult editSave(PmNotice notice)
    {
        return toAjax(pmNoticeService.updatePmNotice(notice));
    }

    /**
     * 删除社区留言
     */
    @RequiresPermissions("pm:notice:remove")
    @Log(title = "社区留言", businessType = BusinessType.DELETE)
    @PostMapping("/remove")
    @ResponseBody
    public AjaxResult remove(String ids)
    {
        return toAjax(pmNoticeService.deletePmNoticeByIds(ids));
    }

}
