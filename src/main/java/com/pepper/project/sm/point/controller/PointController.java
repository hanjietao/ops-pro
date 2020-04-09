package com.pepper.project.sm.point.controller;

import com.mysql.cj.util.Base64Decoder;
import com.pepper.common.constant.GenConstants;
import com.pepper.common.constant.PointOperateAddOrDeductConstant;
import com.pepper.common.constant.SysMsgTypeConstant;
import com.pepper.common.utils.poi.ExcelUtil;
import com.pepper.common.utils.security.ShiroUtils;
import com.pepper.framework.aspectj.lang.annotation.Log;
import com.pepper.framework.aspectj.lang.enums.BusinessType;
import com.pepper.framework.web.controller.BaseController;
import com.pepper.framework.web.domain.AjaxResult;
import com.pepper.framework.web.page.TableDataInfo;
import com.pepper.project.csc.message.domain.SysMessage;
import com.pepper.project.csc.message.service.ISysMessageService;
import com.pepper.project.he.article.domain.Article;
import com.pepper.project.he.article.service.IArticleService;
import com.pepper.project.he.video.domain.Video;
import com.pepper.project.he.video.service.IVideoService;
import com.pepper.project.sm.friends.domain.Friends;
import com.pepper.project.sm.friends.service.IFriendsService;
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
import sun.misc.BASE64Decoder;

import java.io.IOException;
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

    @Autowired
    private IFriendsService friendsService;

    @Autowired
    private ISysMessageService sysMessageService;

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
        return pointService.sendPoint(point,getMerchantId());
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

    @ApiOperation("赠送好友积分")
    @Log(title = "赠送好友积分", businessType = BusinessType.INSERT)
    @PostMapping("/sendPointToFrd")
    @ResponseBody
    public AjaxResult agreeApply(@RequestParam(required = true) Long id,String pointsSec)
            throws IOException {
        BASE64Decoder base64Decoder = new BASE64Decoder();
        Long points = Long.valueOf(new String(base64Decoder.decodeBuffer(pointsSec)));
        Friends friends = friendsService.selectFriendsById(id);
        if(friends == null){
            return AjaxResult.error("抱歉！该好友关系不存在，请稍后尝试！");
        }
        if(points == null || points <= 0L){
            return AjaxResult.error("抱歉！您输入的积分值不满足要求！");
        }
        Long youUserId = ShiroUtils.getSysUser().getClientUser().getUserId();
        Long friendUserId = friends.getFriendUserId();
        User youSysUser = ShiroUtils.getSysUser();
        User frdSysUser = userService.selectUserByMerchantId(friendUserId);

        ClientUser friendUser = clientUserService.selectClientUserById(friendUserId);
        ClientUser you = clientUserService.selectClientUserById(youUserId);
        if(you.getUserCurrentPoints() < points){
            return AjaxResult.error("抱歉！您的积分数为"+you.getUserCurrentPoints()+",不够赠送！");
        }
        Point point = new Point();
        point.setUserId(youUserId);
        point.setSysUserId(youSysUser.getUserId());
        point.setAddOrDeduct(PointOperateAddOrDeductConstant.deduct);
        point.setOperateType("7");
        point.setOperateTypeInfo("赠送好友-");
        point.setPoints(points);
        point.setOperateProjectId(friendUserId);
        pointService.insertPoint(point);
        you.setPointNum(points);
        clientUserService.deductClientUserPoint(you);

        Point point1 = new Point();
        point1.setUserId(friendUserId);
        point1.setSysUserId(frdSysUser.getUserId());
        point1.setAddOrDeduct(PointOperateAddOrDeductConstant.add);
        point1.setOperateType("8");
        point1.setOperateTypeInfo("好友赠送+");
        point1.setPoints(points);
        point1.setOperateProjectId(youUserId);
        pointService.insertPoint(point1);
        friendUser.setPointNum(points);
        clientUserService.addClientUserPoint(friendUser);

        // 发送站内信
        // 给自己
        SysMessage yMsg = new SysMessage();
        yMsg.setUserId(youUserId);
        yMsg.setSysUserId(youSysUser.getUserId());
        yMsg.setMsgTitle("赠送好友积分");
        yMsg.setMsgContent("你给你的好友"+friendUser.getNikeName()+","+points+"个积分，成功！");
        yMsg.setMsgType(SysMsgTypeConstant.friend);
        yMsg.setStatus("0");// 正常，未读
        sysMessageService.insertSysMessage(yMsg);

        // 给好友
        SysMessage fMsg = new SysMessage();
        fMsg.setUserId(friendUserId);
        fMsg.setSysUserId(frdSysUser.getUserId());
        fMsg.setMsgTitle("好友赠送积分");
        fMsg.setMsgContent("你的好友"+you.getNikeName()+",给你赠送"+points+"个积分，请查收！");
        fMsg.setMsgType(SysMsgTypeConstant.friend);
        fMsg.setStatus("0");// 正常，未读
        sysMessageService.insertSysMessage(fMsg);

        logger.info("FriendsController::agreeApply, request: id={}", id);
        return AjaxResult.success("赠送成功！");
    }

    @ApiOperation("用户积分明细查询")
    @PostMapping("/userPointList")
    @ResponseBody
    public TableDataInfo userPointList()
    {
        startPage();
        Point point = new Point();
        point.setUserId(getMerchantId());
        List<Point> list = pointService.selectPointList(point);
        return getDataTable(list);
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
                               @RequestParam(required = true) Long projectId)
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
            Long awardPoints = 0L;
            if("2".equals(operateType)){
                //video
                Video video = videoService.selectVideoById(projectId);
                sendPoint = video.getSendPoint();
                awardPoints = video.getAwardPoints();
            }else if("3".equals(operateType)){
                //article
                Article article = articleService.selectArticleById(projectId);
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

    public static void main(String[] args) throws IOException {
        BASE64Decoder base64Decoder = new BASE64Decoder();
        Long points = Long.valueOf(new String(base64Decoder.decodeBuffer("MTg4ODg4")));
        System.out.println(points);
    }

}
