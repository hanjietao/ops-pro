package com.pepper.project.sm.user.controller;

import com.pepper.common.utils.security.ShiroUtils;
import com.pepper.framework.aspectj.lang.annotation.Log;
import com.pepper.framework.aspectj.lang.enums.BusinessType;
import com.pepper.framework.aspectj.lang.enums.SysUserType;
import com.pepper.framework.web.controller.BaseController;
import com.pepper.framework.web.domain.AjaxResult;
import com.pepper.framework.web.page.TableDataInfo;
import com.pepper.project.cm.activity.domain.Activity;
import com.pepper.project.sm.point.service.IPointService;
import com.pepper.project.sm.user.domain.ClientUser;
import com.pepper.project.sm.user.service.IClientUserService;
import io.swagger.annotations.ApiOperation;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping("/sm/clientuser")
public class ClientUserController extends BaseController {

    private String prefix = "sm/clientuser";

    @Autowired
    private IClientUserService clientUserService;

    @Autowired
    private IPointService pointService;

    @RequiresPermissions("sm:clientuser:view")
    @GetMapping()
    public String online()
    {
        return prefix + "/user";
    }

    @RequiresPermissions("sm:clientuser:list")
    @PostMapping("/list")
    @ResponseBody
    public TableDataInfo list(ClientUser clientUser)
    {
        startPage();
        //ShiroUtils.getSysUser().getMerchantFlag().equals(SysUserType.admin.getType())
        List<ClientUser> list = clientUserService.selectClientUserList(clientUser);
        return getDataTable(list);
    }

    /**
     * 新增客户端用户
     */
    @GetMapping("/add")
    public String add(ModelMap mmap)
    {
        return prefix + "/add";
    }

    /**
     * 新增保存客户端用户
     */
    @Log(title = "客户端用户", businessType = BusinessType.INSERT)
    @RequiresPermissions("sm:clientuser:add")
    @PostMapping("/add")
    @ResponseBody
    public AjaxResult addSave(ClientUser clientUser)
    {
        return toAjax(clientUserService.insertClientUser(clientUser));
    }

    /**
     * 修改活动
     */
    @GetMapping("/edit/{id}")
    public String edit(@PathVariable("id") Long id, ModelMap mmap)
    {
        mmap.put("clientUser", clientUserService.selectClientUserById(id));
        return prefix + "/edit";
    }

    /**
     * 修改保存社区
     */
    @RequiresPermissions("sm:clientuser:edit")
    @Log(title = "活动", businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    @ResponseBody
    public AjaxResult editSave(ClientUser clientUser)
    {
        return toAjax(clientUserService.updateClientUser(clientUser));
    }

    /**
     * 删除活动
     */
    @RequiresPermissions("sm:clientuser:remove")
    @Log(title = "活动", businessType = BusinessType.DELETE)
    @PostMapping("/remove")
    @ResponseBody
    public AjaxResult remove(String ids)
    {
        return toAjax(clientUserService.deleteClientUserByIds(ids));
    }

    /**
     * 查询报名详情
     * userId client user
     */
    @RequiresPermissions("sm:clientuser:list")
    @GetMapping("/detail/{id}")
    public String detail(@PathVariable("id") Long userId, ModelMap mmap)
    {
        mmap.put("clientUser", clientUserService.selectClientUserById(userId));
        return "sm/point/point";
    }

    /**
     *  @Description: mobilePhone获取用户列表
     *  @author: HanJieTao
     *  @mail: hjtxyr@163.com
     *  @Date: 2020/3/26 11:00
     */
    @ApiOperation("mobilePhone获取用户列表[logon]")
    @PostMapping("/getListByMobilePhone")
    @ResponseBody
    public TableDataInfo getListByMobilePhone(String mobilePhone)
    {
        startPage();
        ClientUser clientUser = new ClientUser();
        clientUser.setUserMobile(mobilePhone);
        List<ClientUser> list = clientUserService.selectClientUserList(clientUser);
        return getDataTable(list);
    }
}
