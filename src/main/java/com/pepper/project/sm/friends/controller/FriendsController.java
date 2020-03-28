package com.pepper.project.sm.friends.controller;

import com.pepper.common.utils.security.ShiroUtils;
import com.pepper.framework.aspectj.lang.annotation.Log;
import com.pepper.framework.aspectj.lang.enums.BusinessType;
import com.pepper.framework.web.controller.BaseController;
import com.pepper.framework.web.domain.AjaxResult;
import com.pepper.framework.web.page.TableDataInfo;
import com.pepper.framework.web.service.DictService;
import com.pepper.project.sm.friends.domain.Friends;
import com.pepper.project.sm.friends.service.IFriendsService;
import com.pepper.project.sm.point.service.IPointService;
import io.swagger.annotations.ApiOperation;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping("/sm/friends")
public class FriendsController extends BaseController {

    Logger logger = LoggerFactory.getLogger(FriendsController.class);

    private String prefix = "sm/friends";

    @Autowired
    private IFriendsService friendsService;

    @Autowired
    private IPointService pointService;

    @RequiresPermissions("sm:friends:view")
    @GetMapping()
    public String online()
    {
        return prefix + "/user";
    }

    @RequiresPermissions("sm:friends:list")
    @PostMapping("/list")
    @ResponseBody
    public TableDataInfo list(Friends clientUser)
    {
        startPage();
        List<Friends> list = friendsService.selectFriendsList(clientUser);
        return getDataTable(list);
    }

    /**
     * 新增好友
     */
    @GetMapping("/add")
    public String add(ModelMap mmap)
    {
        return prefix + "/add";
    }

    /**
     * 新增保存好友
     */
    @Log(title = "客户端用户", businessType = BusinessType.INSERT)
    @RequiresPermissions("sm:friends:add")
    @PostMapping("/add")
    @ResponseBody
    public AjaxResult addSave(Friends clientUser)
    {
        return toAjax(friendsService.insertFriends(clientUser));
    }

    /**
     * 修改好友
     */
    @GetMapping("/edit/{id}")
    public String edit(@PathVariable("id") Long id, ModelMap mmap)
    {
        mmap.put("clientUser", friendsService.selectFriendsById(id));
        return prefix + "/edit";
    }

    /**
     * 修改保存好友
     */
    @RequiresPermissions("sm:friends:edit")
    @Log(title = "活动", businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    @ResponseBody
    public AjaxResult editSave(Friends clientUser)
    {
        return toAjax(friendsService.updateFriends(clientUser));
    }

    /**
     * 删除好友
     */
    @RequiresPermissions("sm:friends:remove")
    @Log(title = "好友", businessType = BusinessType.DELETE)
    @PostMapping("/remove")
    @ResponseBody
    public AjaxResult remove(String ids)
    {
        return toAjax(friendsService.deleteFriendsByIds(ids));
    }

    /**
     * 查询好友
     * userId client user
     */
    @RequiresPermissions("sm:friends:list")
    @GetMapping("/detail/{id}")
    public String detail(@PathVariable("id") Long userId, ModelMap mmap) {
        mmap.put("clientUser", friendsService.selectFriendsById(userId));
        return "sm/point/point";
    }

    @ApiOperation("申请成为好友[logon]")
    @Log(title = "申请成为好友", businessType = BusinessType.INSERT)
    @PostMapping("/applyFriends")
    @ResponseBody
    public AjaxResult applyFriends(@RequestParam(required = true) Long friendUserId) {
        Long userId = ShiroUtils.getSysUser().getClientUser().getUserId();
        logger.info("FriendsController::applyFriends, request: userId={} , friendUserId={}",
                userId,friendUserId);
        return friendsService.applyFriends(userId,friendUserId);
    }

    @ApiOperation("同意好友[logon]")
    @Log(title = "同意好友", businessType = BusinessType.INSERT)
    @PostMapping("/agreeApply")
    @ResponseBody
    public AjaxResult agreeApply(@RequestParam(required = true) Long id) {
        Long userId = ShiroUtils.getSysUser().getClientUser().getUserId();
        logger.info("FriendsController::agreeApply, request: id={}", id);
        return friendsService.agreeApply(id, userId);
    }

    /**
     *  @Description: 通过mobilePhone获取好友列表
     *  @author: HanJieTao
     *  @mail: hjtxyr@163.com
     *  @Date: 2020/3/26 11:00
     */
    @ApiOperation("获取好友列表[logon]")
    @PostMapping("/getFriendsList")
    @ResponseBody
    public TableDataInfo getFriendsList() {
        startPage();
        Friends friends = new Friends();
        friends.setUserId(ShiroUtils.getSysUser().getClientUser().getUserId());
        List<Friends> list = friendsService.selectFriendsList(friends);
        return getDataTable(list);
    }

}
