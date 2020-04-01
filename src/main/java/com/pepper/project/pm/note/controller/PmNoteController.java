package com.pepper.project.pm.note.controller;

import com.pepper.common.utils.StringUtils;
import com.pepper.common.utils.security.ShiroUtils;
import com.pepper.framework.aspectj.lang.annotation.Log;
import com.pepper.framework.aspectj.lang.enums.BusinessType;
import com.pepper.framework.aspectj.lang.enums.SysUserType;
import com.pepper.framework.web.controller.BaseController;
import com.pepper.framework.web.domain.AjaxResult;
import com.pepper.framework.web.page.TableDataInfo;
import com.pepper.project.csc.area.service.IAreaService;
import com.pepper.project.pm.note.domain.PmNote;
import com.pepper.project.pm.property.domain.Property;
import com.pepper.project.pm.property.service.IPropertyService;
import com.pepper.project.pm.note.service.IPmNoteService;
import io.swagger.annotations.ApiOperation;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping("/pm/note")
public class PmNoteController extends BaseController {

    private String prefix = "pm/note";

    @Autowired
    private IPmNoteService noteService;

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
    public TableDataInfo list(PmNote note)
    {
        startPage();
        if(getMerchantId()!=0){
            note.setPropertyId(getMerchantId());
        }
        List<PmNote> list = noteService.selectNoteList(note);
        return getDataTable(list);
    }

    /**
     * 新增物业留言
     */
    @GetMapping("/add")
    public String add(ModelMap mmap)
    {
//        List<Property> propertys = propertyService.selectPropertyList(new Property());
//        mmap.put("propertys",propertys);
        return prefix + "/add";
    }

    /**
     * 新增保存物业留言
     */
    @Log(title = "物业留言", businessType = BusinessType.INSERT)
    @RequiresPermissions("pm:note:add")
    @PostMapping("/add")
    @ResponseBody
    public AjaxResult addSave(PmNote note)
    {
        if(getMerchantId()==null || getMerchantId() == 0 ||
                !SysUserType.padmin.getType().equals(getSysUser().getMerchantFlag())){
            return AjaxResult.error("非物业业务系统用户 无法添加物业留言");
        }
        note.setPropertyId(getMerchantId());
        return toAjax(noteService.insertNote(note));
    }

    /**
     * 修改物业留言
     */
    @GetMapping("/edit/{id}")
    public String edit(@PathVariable("id") Long id, ModelMap mmap)
    {
//        List<Property> propertys = propertyService.selectPropertyList(new Property());
//        mmap.put("propertys",propertys);
        mmap.put("note", noteService.selectNoteById(id));
        return prefix + "/edit";
    }

    /**
     * 修改保存物业留言
     */
    @RequiresPermissions("pm:note:edit")
    @Log(title = "物业留言", businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    @ResponseBody
    public AjaxResult editSave(PmNote note)
    {
        // 如果为空，则说明是在做回复操作，不是驳回
        if(StringUtils.isEmpty(note.getReplyStatus())){
            note.setReplyStatus("0");
        }
        return toAjax(noteService.updateNote(note));
    }

    /**
     * 删除物业留言
     */
    @RequiresPermissions("pm:note:remove")
    @Log(title = "物业留言", businessType = BusinessType.DELETE)
    @PostMapping("/remove")
    @ResponseBody
    public AjaxResult remove(String ids)
    {
        return toAjax(noteService.deleteNoteByIds(ids));
    }

    @ApiOperation("新增物业留言")
    @Log(title = "新增物业留言", businessType = BusinessType.INSERT)
    @PostMapping("/addNote")
    public AjaxResult addNote(@RequestParam(required = true) Long propertyId,
                              @RequestParam(required = true) String content)
    {
        PmNote pmNote = new PmNote();
        pmNote.setPropertyId(propertyId);
        pmNote.setContent(content);
        return AjaxResult.success(noteService.insertNote(pmNote));
    }

    @ApiOperation("我的留言列表[物业]")
    @Log(title = "我的留言列表[物业]", businessType = BusinessType.EXPORT)
    @PostMapping("/myNoteList")
    @ResponseBody
    public TableDataInfo myNoteList() {
        startPage();
        PmNote pmNote = new PmNote();
        pmNote.setUserId(ShiroUtils.getSysUser().getClientUser().getUserId());
        List<PmNote> list = noteService.selectNoteList(pmNote);
        return getDataTable(list);
    }
}
