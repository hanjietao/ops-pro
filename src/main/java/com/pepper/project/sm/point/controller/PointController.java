package com.pepper.project.sm.point.controller;

import com.pepper.common.constant.GenConstants;
import com.pepper.common.utils.poi.ExcelUtil;
import com.pepper.common.utils.security.ShiroUtils;
import com.pepper.framework.aspectj.lang.annotation.Log;
import com.pepper.framework.aspectj.lang.enums.BusinessType;
import com.pepper.framework.web.controller.BaseController;
import com.pepper.framework.web.domain.AjaxResult;
import com.pepper.framework.web.page.TableDataInfo;
import com.pepper.project.he.article.domain.Article;
import com.pepper.project.he.article.service.IArticleService;
import com.pepper.project.he.video.domain.Video;
import com.pepper.project.he.video.service.IVideoService;
import com.pepper.project.sm.point.domain.Point;
import com.pepper.project.sm.point.service.IPointService;
import com.pepper.project.sm.user.domain.ClientUser;
import com.pepper.project.sm.user.service.IClientUserService;
import com.pepper.project.system.user.domain.User;
import com.pepper.project.system.user.service.IUserService;
import io.swagger.annotations.ApiOperation;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/sm/point")
public class PointController extends BaseController {

    Logger logger = LoggerFactory.getLogger(PointController.class);

    private String prefix = "sm/point";

    @Autowired
    private IPointService pointService;
    @Autowired
    private IUserService userService;
    @Autowired
    private IClientUserService clientUserService;
    @Autowired
    private IVideoService videoService;
    @Autowired
    private IArticleService articleService;

    @RequiresPermissions("sm:point:view")
    @GetMapping()
    public String online(ModelMap mmap)
    {
        return prefix + "/point";
    }

    @RequiresPermissions("sm:point:list")
    @PostMapping("/list")
    @ResponseBody
    public TableDataInfo list(Point point)
    {
        startPage();
        List<Point> list = pointService.selectPointList(point);
        return getDataTable(list);
    }

    /**
     * 新增用户积分
     */
    @GetMapping("/add")
    public String add(ModelMap mmap)
    {
        return prefix + "/add";
    }

    /**
     * 新增保存用户积分
     */
    @Log(title = "用户积分", businessType = BusinessType.INSERT)
    @RequiresPermissions("sm:point:add")
    @PostMapping("/add")
    @ResponseBody
    public AjaxResult addSave(Point point)
    {
        return toAjax(pointService.insertPoint(point));
    }

    /**
     * 修改用户积分
     */
    @GetMapping("/edit/{id}")
    public String edit(@PathVariable("id") Integer id, ModelMap mmap)
    {
        return prefix + "/edit";
    }

    /**
     * 修改保存用户积分
     */
    @RequiresPermissions("sm:point:edit")
    @Log(title = "用户积分", businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    @ResponseBody
    public AjaxResult editSave(Point point)
    {
        return toAjax(pointService.updatePoint(point));
    }

    @RequiresPermissions("sm:point:sendPoint")
    @Log(title = "用户积分", businessType = BusinessType.UPDATE)
    @PostMapping("/sendPoint")
    @ResponseBody
    public AjaxResult sendPoint(Point point)
    {
        point.setAddOrDeduct("1");// 增加
        User sysUser = userService.selectUserByMerchantId(point.getUserId());
        if(sysUser == null){
            logger.error("异常，该用户不存在系统用户，sys_user表merchant_id字段没有该用户user_id= {}",point.getUserId());
        }
        point.setSysUserId(sysUser.getUserId());
        point.setStatus("0");
        ClientUser clientUser = clientUserService.selectClientUserById(point.getUserId());
        clientUser.setPointNum(point.getPoints());
        if(getMerchantId() == 0){
            point.setOperateProjectId("admin");
        }else{
            point.setOperateProjectId(getMerchantId().toString());
        }

        clientUserService.addClientUserPoint(clientUser);
        return toAjax(pointService.insertPoint(point));
    }


    /**
     * 删除用户积分
     */
    @RequiresPermissions("sm:point:remove")
    @Log(title = "用户积分", businessType = BusinessType.DELETE)
    @PostMapping("/remove")
    @ResponseBody
    public AjaxResult remove(String ids)
    {
        return toAjax(pointService.deletePointByIds(ids));
    }

    @Log(title = "用户积分", businessType = BusinessType.EXPORT)
    @RequiresPermissions("sm:point:export")
    @PostMapping("/export")
    @ResponseBody
    public AjaxResult export(Point point)
    {

        List<Point> list = pointService.selectPointList(point);
        ExcelUtil<Point> util = new ExcelUtil<>(Point.class);
        return util.exportExcel(list, "客户积分列表"+"_"+System.currentTimeMillis());
    }

    @ApiOperation("新增用户积分")
    @Log(title = "新增用户积分", businessType = BusinessType.INSERT)
    @PostMapping("/addPointBefore")
    public AjaxResult addBefore(@RequestParam(required = true) Long projectId)
    {
        User user = getSysUser();
        if(user == null){
            return success("success before no login");
        }
        ShiroUtils.getSession().setAttribute(GenConstants.POINT_PROJECT_INFO, projectId);
        return success("success before");
    }

    @ApiOperation("新增用户积分")
    @Log(title = "新增用户积分", businessType = BusinessType.INSERT)
    @PostMapping("/addPointAfter")
    public AjaxResult addAfter(@RequestParam(required = true) String operateType,
                               @RequestParam(required = true) String projectId)
    {
        try {
            User user = getSysUser();
            if(user == null){
                logger.warn("point add success,operate type={},project id={},fail reason={}",
                        operateType,projectId,"no login");
                return success("success(0)");
            }
            Object project = ShiroUtils.getSession().getAttribute(GenConstants.POINT_PROJECT_INFO);
            if(project == null){
                logger.warn("point add success,operate type={},project id={},fail reason={}",
                        operateType,projectId,"cache no project");
                return success("success(1)");
            }
            if(!project.toString().equals(projectId)){
                logger.warn("point add success,operate type={},project id={},fail reason={}",
                        operateType,projectId,"cache and projectId not march");
                return success("success(2)");
            }
            String sendPoint = "N";
            Integer awardPoints = 0;
            if("2".equals(operateType)){
                //video
                Video video = videoService.selectVideoById(Integer.valueOf(projectId));
                sendPoint = video.getSendPoint();
                awardPoints = video.getAwardPoints();
            }else if("3".equals(operateType)){
                //article
                Article article = articleService.selectArticleById(Integer.valueOf(projectId));
                sendPoint = article.getSendPoint();
                awardPoints = article.getAwardPoints();
            }else{
                logger.warn("point add success,operate type={},project id={},fail reason={}",
                        operateType,projectId,"operate type not exist");
                return success("success(3)");
            }
            if("Y".equals(sendPoint)){
                Point point = new Point();
                point.setSysUserId(user.getUserId()); // 系统
                point.setOperateProjectId(projectId);
                point.setOperateType(operateType);
                List<Point> list = pointService.selectPointList(point);
                if(list.size() > 0){
                    logger.warn("point add success,operate type={},project id={},fail reason={}",
                            operateType,projectId,"already see,no need to add point");
                    return success("success(4)");
                }
                point.setUserId(user.getClientUser().getUserId()); //client user
                point.setPoints(Long.valueOf(awardPoints));
                Integer count = pointService.insertPoint(point);
                if(count>0){
                    logger.info("point add success,operate type={},project id={},award points={}",
                            operateType,projectId,awardPoints);
                    return success("success(5)");
                }else{
                    logger.error("point add success,operate type={},project id={},fail reason={}",
                            operateType,projectId,"database insert fail,count = 0");
                    return success("success(6)");
                }

            }else{
                logger.error("point add success,operate type={},project id={},fail reason={}",
                        operateType,projectId,"project no send point");
                return success("success(7)");
            }
        }catch (Exception e){
            logger.error(org.apache.commons.lang3.exception.ExceptionUtils.getStackTrace(e));
            return success("error");
        }

    }

}
