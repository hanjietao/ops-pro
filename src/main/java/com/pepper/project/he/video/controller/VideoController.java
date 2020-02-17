package com.pepper.project.he.video.controller;

import com.pepper.common.utils.file.FileUploadUtils;
import com.pepper.framework.aspectj.lang.annotation.Log;
import com.pepper.framework.aspectj.lang.enums.BusinessType;
import com.pepper.framework.config.OpsConfig;
import com.pepper.framework.web.controller.BaseController;
import com.pepper.framework.web.domain.AjaxResult;
import com.pepper.framework.web.page.TableDataInfo;
import com.pepper.project.csc.area.domain.Area;
import com.pepper.project.csc.area.service.IAreaService;
import com.pepper.project.he.board.domain.Board;
import com.pepper.project.he.board.service.IBoardService;
import com.pepper.project.he.video.domain.Video;
import com.pepper.project.he.video.service.IVideoService;
import com.pepper.project.system.user.domain.User;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

@Controller
@RequestMapping("/he/video")
public class VideoController extends BaseController {

    private String prefix = "he/video";

    @Autowired
    private IVideoService videoService;

    @Autowired
    private IBoardService boardService;

    @RequiresPermissions("he:video:view")
    @GetMapping()
    public String online()
    {
        return prefix + "/video";
    }

    @RequiresPermissions("he:video:list")
    @PostMapping("/list")
    @ResponseBody
    public TableDataInfo list(Video video)
    {
        startPage();
        List<Video> list = videoService.selectVideoList(video);
        return getDataTable(list);
    }

    /**
     * 新增宣教板块
     */
    @GetMapping("/add")
    public String add(ModelMap mmap)
    {
        List<Board> boards = boardService.selectBoardList(new Board());
        mmap.put("boards",boards);
        return prefix + "/add";
    }

    /**
     * 新增保存宣教板块
     */
    @Log(title = "宣教板块", businessType = BusinessType.INSERT)
    @RequiresPermissions("he:video:add")
    @PostMapping("/add")
    @ResponseBody
    public AjaxResult addSave(Video video)
    {
        return toAjax(videoService.insertVideo(video));
    }

    /**
     * 修改宣教板块
     */
    @GetMapping("/edit/{id}")
    public String edit(@PathVariable("id") Integer id, ModelMap mmap)
    {
        List<Board> boards = boardService.selectBoardList(new Board());
        mmap.put("boards",boards);
        mmap.put("video", videoService.selectVideoById(id));
        return prefix + "/edit";
    }

    /**
     * 修改保存宣教板块
     */
    @RequiresPermissions("he:video:edit")
    @Log(title = "宣教板块", businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    @ResponseBody
    public AjaxResult editSave(Video video)
    {
        return toAjax(videoService.updateVideo(video));
    }

    /**
     * 删除宣教板块
     */
    @RequiresPermissions("he:video:remove")
    @Log(title = "宣教板块", businessType = BusinessType.DELETE)
    @PostMapping("/remove")
    @ResponseBody
    public AjaxResult remove(String ids)
    {
        return toAjax(videoService.deleteVideoByIds(ids));
    }

    /**
     * 保存头像
     */
    @Log(title = "宣教视频", businessType = BusinessType.UPDATE)
    @PostMapping("/edit/upload")
    @ResponseBody
    public AjaxResult updateAvatar(@RequestParam("file_data") MultipartFile file,@RequestParam("fileId") String fileId)
    {
        try
        {
            if (!file.isEmpty())
            {
                String healthVideoUrl = FileUploadUtils.upload(OpsConfig.getHealthVideoPath(), file);
                return success(healthVideoUrl);
            }
            return error();
        }
        catch (Exception e)
        {
            //logger.error("修改头像失败！", e);
            return error(e.getMessage());
        }
    }

}
