package com.pepper.project.system.user.controller;

import com.pepper.common.utils.ServletUtils;
import com.pepper.common.utils.StringUtils;
import com.pepper.framework.aspectj.lang.enums.SysUserType;
import com.pepper.framework.web.controller.BaseController;
import com.pepper.framework.web.domain.AjaxResult;
import com.pepper.project.ch.hospital.domain.Hospital;
import com.pepper.project.ch.hospital.service.IHospitalService;
import com.pepper.project.cm.community.domain.Community;
import com.pepper.project.cm.community.service.ICommunityService;
import com.pepper.project.pm.property.domain.Property;
import com.pepper.project.pm.property.service.IPropertyService;
import com.pepper.project.sm.user.domain.ClientUser;
import com.pepper.project.sm.user.service.IClientUserService;
import com.pepper.project.system.user.domain.Merchant;
import com.pepper.project.system.user.domain.User;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * 登录验证
 *
 * @author pepper
 */
@Controller
public class ClientUserLoginController extends BaseController
{
    @Autowired
    private IClientUserService clientUserService;

    @PostMapping("/client/login")
    @ResponseBody
    public AjaxResult ajaxClientLogin(String username, String password, Boolean rememberMe)
    {
        if(rememberMe == null){
            rememberMe = false;
        }
        UsernamePasswordToken token = new UsernamePasswordToken(username, password, rememberMe);
        Subject subject = SecurityUtils.getSubject();
        try
        {
            subject.login(token);
            User sysUser = getSysUser();
            Long clientUserId = sysUser.getMerchantId();
            if(clientUserId==null || clientUserId == 0L){
                // 非客户端用户
                return error("用户数据错误，登陆失败！[0]");
            }
            ClientUser clientUser = clientUserService.selectClientUserById(clientUserId);
            if(clientUser == null){
                return error("用户数据错误，登陆失败！[1]");
            }
            sysUser.setClientUser(clientUser);// 将用户信息表存入系统用户对象中，方便session中获取用户信息
            setSysUser(sysUser);
            return success();
        }
        catch (AuthenticationException e)
        {
            String msg = "用户或密码错误";
            if (StringUtils.isNotEmpty(e.getMessage()))
            {
                msg = e.getMessage();
            }
            return error(msg);
        }
    }

//    @GetMapping("/unauth")
//    public String unauth()
//    {
//        return "error/unauth";
//    }
}
