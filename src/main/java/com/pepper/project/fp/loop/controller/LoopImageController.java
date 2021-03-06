package com.pepper.project.fp.loop.controller;

import com.pepper.common.utils.StringUtils;
import com.pepper.common.utils.file.FileUploadUtils;
import com.pepper.framework.aspectj.lang.annotation.Log;
import com.pepper.framework.aspectj.lang.enums.BusinessType;
import com.pepper.framework.config.OpsConfig;
import com.pepper.framework.config.ServerConfig;
import com.pepper.framework.web.controller.BaseController;
import com.pepper.framework.web.domain.AjaxResult;
import com.pepper.framework.web.page.TableDataInfo;
import com.pepper.project.csc.area.domain.Area;
import com.pepper.project.csc.area.service.IAreaService;
import com.pepper.project.fp.loop.domain.LoopImage;
import com.pepper.project.fp.loop.service.ILoopImageService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

@Api("轮播图")
@Controller
@RequestMapping("/fp/loopImage")
public class LoopImageController extends BaseController {
    Logger logger = LoggerFactory.getLogger(LoopImageController.class);


    private String prefix = "fp/loopImage";

    @Autowired
    private ILoopImageService loopImageService;

    @Autowired
    private IAreaService areaService;

    @Autowired
    private ServerConfig serverConfig;

    @RequiresPermissions("fp:loop:view")
    @GetMapping()
    public String online()
    {
        return prefix + "/loopImage";
    }

    @RequiresPermissions("fp:loop:list")
    @PostMapping("/list")
    @ResponseBody
    public TableDataInfo list(LoopImage loopImage)
    {
        startPage();
        List<LoopImage> list = loopImageService.selectLoopImageList(loopImage);
        return getDataTable(list);
    }

    /**
     * 新增轮播图
     */
    @GetMapping("/add")
    public String add(ModelMap mmap)
    {
        List<Area> areas = areaService.selectAreaList(new Area());
        mmap.put("areas",areas);
        return prefix + "/add";
    }

    /**
     * 新增保存轮播图
     */
    @Log(title = "轮播图", businessType = BusinessType.INSERT)
    @RequiresPermissions("fp:loop:add")
    @PostMapping("/add")
    @ResponseBody
    public AjaxResult addSave(LoopImage loopImage)
    {
        return toAjax(loopImageService.insertLoopImage(loopImage));
    }

    /**
     * 修改轮播图
     */
    @GetMapping("/edit/{id}")
    public String edit(@PathVariable("id") Long id, ModelMap mmap)
    {
        logger.info("user info,sysUserId={}",getSysUser().getUserId());
        List<Area> areas = areaService.selectAreaList(new Area());
        mmap.put("areas",areas);
        mmap.put("loopImage", loopImageService.selectLoopImageById(id));
        return prefix + "/edit";
    }

    /**
     * 修改保存轮播图
     */
    @RequiresPermissions("fp:loop:edit")
    @Log(title = "轮播图", businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    @ResponseBody
    public AjaxResult editSave(LoopImage loopImage)
    {
        return toAjax(loopImageService.updateLoopImage(loopImage));
    }

    /**
     * 删除轮播图
     */
    @RequiresPermissions("fp:loop:remove")
    @Log(title = "轮播图", businessType = BusinessType.DELETE)
    @PostMapping("/remove")
    @ResponseBody
    public AjaxResult remove(@RequestParam(required = true) String ids)
    {
        logger.info("user info,sysUserId={},ids={}",getSysUser().getUserId(),ids);
        if(!StringUtils.isEmpty(ids)){
            for (String id:ids.split(",")) {
                logger.info("user info,sysUserId={},ids={}",getSysUser().getUserId(),
                        loopImageService.selectLoopImageById(Long.valueOf(id)).toString());
            }
        }
        return toAjax(loopImageService.deleteLoopImageByIds(ids));
    }


    /**
     * 保存头像
     */
    @Log(title = "轮播图", businessType = BusinessType.UPDATE)
    @PostMapping("/edit/upload")
    @ResponseBody
    public AjaxResult editUpload(@RequestParam("file_data") MultipartFile file, @RequestParam("uploadModule") String uploadModule)
    {
        try
        {
            if (!file.isEmpty())
            {
                String healthVideoUrl = serverConfig.getUrl() + FileUploadUtils.upload(OpsConfig.getHealthVideoPath(uploadModule), file);
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
    @Log(title = "轮播图", businessType = BusinessType.UPDATE)
    @PostMapping("/upload")
    @ResponseBody
    public AjaxResult addUpload(@RequestParam("file_data") MultipartFile file,@RequestParam("uploadModule") String uploadModule)
    {
        try
        {
            if (!file.isEmpty())
            {
                String healthVideoUrl = serverConfig.getUrl() + FileUploadUtils.upload(OpsConfig.getHealthVideoPath(uploadModule), file);
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


    /**     客户端接口区    */

    @ApiOperation("轮播图列表")
    @PostMapping("/getList")
    @ResponseBody
    public TableDataInfo getList()
    {
        startPage();
        List<LoopImage> list = loopImageService.selectLoopImageList(new LoopImage());
        return getDataTable(list);
    }

}
