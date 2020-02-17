package com.pepper.project.he.board.controller;

import com.pepper.framework.aspectj.lang.annotation.Log;
import com.pepper.framework.aspectj.lang.enums.BusinessType;
import com.pepper.framework.web.controller.BaseController;
import com.pepper.framework.web.domain.AjaxResult;
import com.pepper.framework.web.page.TableDataInfo;
import com.pepper.project.csc.area.domain.Area;
import com.pepper.project.csc.area.service.IAreaService;
import com.pepper.project.he.board.domain.Board;
import com.pepper.project.he.board.service.IBoardService;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping("/he/board")
public class BoardController extends BaseController {

    private String prefix = "he/board";

    @Autowired
    private IBoardService boardService;

    @Autowired
    private IAreaService areaService;

    @RequiresPermissions("he:board:view")
    @GetMapping()
    public String online()
    {
        return prefix + "/board";
    }

    @RequiresPermissions("he:board:list")
    @PostMapping("/list")
    @ResponseBody
    public TableDataInfo list(Board board)
    {
        startPage();
        List<Board> list = boardService.selectBoardList(board);
        return getDataTable(list);
    }

    /**
     * 新增宣教板块
     */
    @GetMapping("/add")
    public String add(ModelMap mmap)
    {
        List<Area> areas = areaService.selectAreaList(new Area());
        mmap.put("areas",areas);
        return prefix + "/add";
    }

    /**
     * 新增保存宣教板块
     */
    @Log(title = "宣教板块", businessType = BusinessType.INSERT)
    @RequiresPermissions("he:board:add")
    @PostMapping("/add")
    @ResponseBody
    public AjaxResult addSave(Board board)
    {
        return toAjax(boardService.insertBoard(board));
    }

    /**
     * 修改宣教板块
     */
    @GetMapping("/edit/{id}")
    public String edit(@PathVariable("id") Integer id, ModelMap mmap)
    {
        List<Area> areas = areaService.selectAreaList(new Area());
        mmap.put("areas",areas);
        mmap.put("board", boardService.selectBoardById(id));
        return prefix + "/edit";
    }

    /**
     * 修改保存宣教板块
     */
    @RequiresPermissions("he:board:edit")
    @Log(title = "宣教板块", businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    @ResponseBody
    public AjaxResult editSave(Board board)
    {
        return toAjax(boardService.updateBoard(board));
    }

    /**
     * 删除宣教板块
     */
    @RequiresPermissions("he:board:remove")
    @Log(title = "宣教板块", businessType = BusinessType.DELETE)
    @PostMapping("/remove")
    @ResponseBody
    public AjaxResult remove(String ids)
    {
        return toAjax(boardService.deleteBoardByIds(ids));
    }

}
