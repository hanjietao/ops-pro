package com.pepper.project.he.video.controller;

import com.pepper.common.utils.file.FileUploadUtils;
import com.pepper.framework.aspectj.lang.annotation.Log;
import com.pepper.framework.aspectj.lang.enums.BusinessType;
import com.pepper.framework.config.OpsConfig;
import com.pepper.framework.web.controller.BaseController;
import com.pepper.framework.web.domain.AjaxResult;
import com.pepper.framework.web.page.TableDataInfo;
import com.pepper.project.he.board.domain.Board;
import com.pepper.project.he.board.service.IBoardService;
import com.pepper.project.he.video.domain.Video;
import com.pepper.project.he.video.service.IVideoService;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiOperation;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.util.HashMap;
import java.util.List;

@Controller
@RequestMapping("/he/video")
public class VideoController extends BaseController {

    private String prefix = "he/video";

    @Autowired
    private IVideoService videoService;

    @Autowired
    private IBoardService boardService;

    /**

     // 判断是否承载视频动态组标签
     if(tabEntity.getType() == TAB_TYPE_VIDEO_MOMENT){
     logger.info("视频动态组标签，需要删除动态组关联视频动态关系数据：tab_id={},tab_type={},tab_name={}",tabEntity.getId(),tabEntity.getType(),tabEntity.getTab());
     tabMomentDao.deleteByTabId(tabEntity.getId());
     noticeAllTable(NoticeTableTypeEnum.tab_moment_info, httpSession);
     }

     @Transactional
     @Modifying(clearAutomatically = true)
     @Query(value = "DELETE FROM tab_moment_info t WHERE t.tab_id = ?1", nativeQuery = true)
     void deleteByTabId(int tabId);

     */

    @RequiresPermissions("he:video:view")
    @GetMapping()
    public String online(ModelMap mmap)
    {
        List<Board> boards = boardService.selectBoardList(new Board());
        mmap.put("boards",boards);
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
    public AjaxResult editSave(Video video,String videoUrl1)
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
    public AjaxResult editUpload(@RequestParam("file_data") MultipartFile file,@RequestParam("uploadModule") String uploadModule)
    {
        try
        {
            if (!file.isEmpty())
            {
                String healthVideoUrl = FileUploadUtils.upload(OpsConfig.getHealthVideoPath(uploadModule), file);
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

    //uploadModule:'healthEducation'
    @Log(title = "宣教视频", businessType = BusinessType.UPDATE)
    @PostMapping("/upload")
    @ResponseBody
    public AjaxResult addUpload(@RequestParam("file_data") MultipartFile file,@RequestParam("uploadModule") String uploadModule)
    {
        try
        {
            if (!file.isEmpty())
            {
                String healthVideoUrl = FileUploadUtils.upload(OpsConfig.getHealthVideoPath(uploadModule), file);
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



    @ApiOperation("宣教视频列表")
    @PostMapping("/getList")
    @ResponseBody
    public TableDataInfo getList(Integer boardId)
    {
        startPage();
        Video video = new Video();
        video.setBoardId(boardId);
        List<Video> list = videoService.selectVideoList(video);
        return getDataTable(list);
    }

    @ApiOperation("获取宣教视频详细")
    @PostMapping("/getDetail")
    @ResponseBody
    public Object getDetail(Integer id)
    {
        if (id != 0L)
        {
            return videoService.selectVideoById(id);
        }
        else
        {
            return new HashMap<>();
        }
    }

}
