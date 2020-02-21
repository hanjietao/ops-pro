package com.pepper.project.pm.note.controller;

import com.pepper.framework.aspectj.lang.annotation.Log;
import com.pepper.framework.aspectj.lang.enums.BusinessType;
import com.pepper.framework.web.controller.BaseController;
import com.pepper.framework.web.domain.AjaxResult;
import com.pepper.framework.web.page.TableDataInfo;
import com.pepper.project.csc.area.service.IAreaService;
import com.pepper.project.pm.property.domain.Property;
import com.pepper.project.pm.property.service.IPropertyService;
import com.pepper.project.pm.note.domain.NotePm;
import com.pepper.project.pm.note.service.INotePmService;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping("/pm/note")
public class NotePmController extends BaseController {

    private String prefix = "pm/note";

    @Autowired
    private INotePmService noteService;

    @Autowired
    private IAreaService areaService;

    @Autowired
    private IPropertyService propertyService;

    @RequiresPermissions("pm:note:view")
    @GetMapping()
    public String online(ModelMap mmap)
    {
        List<Property> propertys = propertyService.selectPropertyList(new Property());
        mmap.put("propertys",propertys);
        return prefix + "/note";
    }

    @RequiresPermissions("pm:note:list")
    @PostMapping("/list")
    @ResponseBody
    public TableDataInfo list(NotePm note)
    {
        startPage();
        List<NotePm> list = noteService.selectNoteList(note);
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
    @RequiresPermissions("pm:note:add")
    @PostMapping("/add")
    @ResponseBody
    public AjaxResult addSave(NotePm note)
    {
        return toAjax(noteService.insertNote(note));
    }

    /**
     * 修改社区留言
     */
    @GetMapping("/edit/{id}")
    public String edit(@PathVariable("id") Integer id, ModelMap mmap)
    {
        List<Property> propertys = propertyService.selectPropertyList(new Property());
        mmap.put("propertys",propertys);
        mmap.put("note", noteService.selectNoteById(id));
        return prefix + "/edit";
    }

    /**
     * 修改保存社区留言
     */
    @RequiresPermissions("pm:note:edit")
    @Log(title = "社区留言", businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    @ResponseBody
    public AjaxResult editSave(NotePm note)
    {
        return toAjax(noteService.updateNote(note));
    }

    /**
     * 删除社区留言
     */
    @RequiresPermissions("pm:note:remove")
    @Log(title = "社区留言", businessType = BusinessType.DELETE)
    @PostMapping("/remove")
    @ResponseBody
    public AjaxResult remove(String ids)
    {
        return toAjax(noteService.deleteNoteByIds(ids));
    }

}
