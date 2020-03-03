package com.pepper.project.fp.loop.controller;

import com.pepper.common.utils.file.FileUploadUtils;
import com.pepper.common.utils.security.ShiroUtils;
import com.pepper.framework.aspectj.lang.annotation.Log;
import com.pepper.framework.aspectj.lang.enums.BusinessType;
import com.pepper.framework.config.OpsConfig;
import com.pepper.framework.web.controller.BaseController;
import com.pepper.framework.web.domain.AjaxResult;
import com.pepper.framework.web.page.TableDataInfo;
import com.pepper.project.csc.area.domain.Area;
import com.pepper.project.csc.area.service.IAreaService;
import com.pepper.project.fp.loop.domain.LoopImage;
import com.pepper.project.fp.loop.service.ILoopImageService;
import com.pepper.project.system.user.domain.User;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

@Controller
@RequestMapping("/fp/loopImage")
public class LoopImageController extends BaseController {

    private String prefix = "fp/loopImage";

    @Autowired
    private ILoopImageService loopImageService;

    @Autowired
    private IAreaService areaService;

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
    @RequiresPermissions("fp:loop:add")
    @PostMapping("/add")
    @ResponseBody
    public AjaxResult addSave(LoopImage loopImage)
    {
        return toAjax(loopImageService.insertLoopImage(loopImage));
    }

    /**
     * 修改宣教板块
     */
    @GetMapping("/edit/{id}")
    public String edit(@PathVariable("id") Integer id, ModelMap mmap)
    {
        List<Area> areas = areaService.selectAreaList(new Area());
        mmap.put("areas",areas);
        mmap.put("loopImage", loopImageService.selectLoopImageById(id));
        return prefix + "/edit";
    }

    /**
     * 修改保存宣教板块
     */
    @RequiresPermissions("fp:loop:edit")
    @Log(title = "宣教板块", businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    @ResponseBody
    public AjaxResult editSave(LoopImage loopImage)
    {
        return toAjax(loopImageService.updateLoopImage(loopImage));
    }

    /**
     * 删除宣教板块
     */
    @RequiresPermissions("fp:loop:remove")
    @Log(title = "宣教板块", businessType = BusinessType.DELETE)
    @PostMapping("/remove")
    @ResponseBody
    public AjaxResult remove(String ids)
    {
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
    @Log(title = "轮播图", businessType = BusinessType.UPDATE)
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


    /**     客户端接口区    */

    @PostMapping("/getList")
    @ResponseBody
    public TableDataInfo getList(LoopImage loopImage)
    {
        startPage();
        User user = ShiroUtils.getSysUser();
        List<LoopImage> list = loopImageService.selectLoopImageList(loopImage);
        return getDataTable(list);
    }
}
