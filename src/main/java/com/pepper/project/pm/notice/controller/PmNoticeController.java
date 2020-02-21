package com.pepper.project.pm.notice.controller;

import com.pepper.framework.aspectj.lang.annotation.Log;
import com.pepper.framework.aspectj.lang.enums.BusinessType;
import com.pepper.framework.aspectj.lang.enums.SysUserType;
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
        notice.setPropertyId(getMerchantId());
        List<PmNotice> list = pmNoticeService.selectPmNoticeList(notice);
        return getDataTable(list);
    }

    /**
     * 新增社区通知
     */
    @GetMapping("/add")
    public String add(ModelMap mmap)
    {
//        List<Property> propertys = propertyService.selectPropertyList(new Property());
//        mmap.put("propertys",propertys);
        return prefix + "/add";
    }

    /**
     * 新增保存物业通知
     */
    @Log(title = "物业通知", businessType = BusinessType.INSERT)
    @RequiresPermissions("pm:notice:add")
    @PostMapping("/add")
    @ResponseBody
    public AjaxResult addSave(PmNotice notice)
    {
        if(getMerchantId()==null || getMerchantId() == 0 ||
                !SysUserType.padmin.getType().equals(getSysUser().getMerchantFlag())){
            return  error("非物业业务系统用户 无法添加物业通知");
        }
        notice.setPropertyId(getMerchantId());
        return toAjax(pmNoticeService.insertPmNotice(notice));
    }

    /**
     * 修改物业通知
     */
    @GetMapping("/edit/{id}")
    public String edit(@PathVariable("id") Integer id, ModelMap mmap)
    {
//        List<Property> propertys = propertyService.selectPropertyList(new Property());
//        mmap.put("propertys",propertys);
        mmap.put("notice", pmNoticeService.selectPmNoticeById(id));
        return prefix + "/edit";
    }

    /**
     * 修改保存物业通知
     */
    @RequiresPermissions("pm:notice:edit")
    @Log(title = "物业通知", businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    @ResponseBody
    public AjaxResult editSave(PmNotice notice)
    {
        return toAjax(pmNoticeService.updatePmNotice(notice));
    }

    /**
     * 删除物业通知
     */
    @RequiresPermissions("pm:notice:remove")
    @Log(title = "物业通知", businessType = BusinessType.DELETE)
    @PostMapping("/remove")
    @ResponseBody
    public AjaxResult remove(String ids)
    {
        return toAjax(pmNoticeService.deletePmNoticeByIds(ids));
    }

}
