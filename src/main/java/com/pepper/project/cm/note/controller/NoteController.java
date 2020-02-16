package com.pepper.project.cm.note.controller;

import com.pepper.framework.aspectj.lang.annotation.Log;
import com.pepper.framework.aspectj.lang.enums.BusinessType;
import com.pepper.framework.web.controller.BaseController;
import com.pepper.framework.web.domain.AjaxResult;
import com.pepper.framework.web.page.TableDataInfo;
import com.pepper.project.cm.community.domain.Community;
import com.pepper.project.cm.community.service.ICommunityService;
import com.pepper.project.cm.note.domain.Note;
import com.pepper.project.cm.note.service.INoteService;
import com.pepper.project.csc.area.service.IAreaService;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping("/cm/note")
public class NoteController extends BaseController {

    private String prefix = "cm/note";

    @Autowired
    private INoteService noteService;

    @Autowired
    private IAreaService areaService;

    @Autowired
    private ICommunityService communityService;

    @RequiresPermissions("cm:note:view")
    @GetMapping()
    public String online(ModelMap mmap)
    {
        List<Community> communitys = communityService.selectCommunityList(new Community());
        mmap.put("communitys",communitys);
        return prefix + "/note";
    }

    @RequiresPermissions("cm:note:list")
    @PostMapping("/list")
    @ResponseBody
    public TableDataInfo list(Note note)
    {
        startPage();
        List<Note> list = noteService.selectNoteList(note);
        return getDataTable(list);
    }

    /**
     * 新增社区留言
     */
    @GetMapping("/add")
    public String add(ModelMap mmap)
    {
        List<Community> communitys = communityService.selectCommunityList(new Community());
        mmap.put("communitys",communitys);
        return prefix + "/add";
    }

    /**
     * 新增保存社区留言
     */
    @Log(title = "社区留言", businessType = BusinessType.INSERT)
    @RequiresPermissions("cm:note:add")
    @PostMapping("/add")
    @ResponseBody
    public AjaxResult addSave(Note note)
    {
        return toAjax(noteService.insertNote(note));
    }

    /**
     * 修改社区留言
     */
    @GetMapping("/edit/{id}")
    public String edit(@PathVariable("id") Integer id, ModelMap mmap)
    {
        List<Community> communitys = communityService.selectCommunityList(new Community());
        mmap.put("communitys",communitys);
        mmap.put("note", noteService.selectNoteById(id));
        return prefix + "/edit";
    }

    /**
     * 修改保存社区留言
     */
    @RequiresPermissions("cm:note:edit")
    @Log(title = "社区留言", businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    @ResponseBody
    public AjaxResult editSave(Note note)
    {
        return toAjax(noteService.updateNote(note));
    }

    /**
     * 删除社区留言
     */
    @RequiresPermissions("cm:note:remove")
    @Log(title = "社区留言", businessType = BusinessType.DELETE)
    @PostMapping("/remove")
    @ResponseBody
    public AjaxResult remove(String ids)
    {
        return toAjax(noteService.deleteNoteByIds(ids));
    }

}
