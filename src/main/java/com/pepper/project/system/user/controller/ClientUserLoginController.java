package com.pepper.project.system.user.controller;

import com.pepper.common.constant.GenConstants;
import com.pepper.common.utils.StringUtils;
import com.pepper.framework.web.controller.BaseController;
import com.pepper.framework.web.domain.AjaxResult;
import com.pepper.project.sm.user.domain.ClientUser;
import com.pepper.project.sm.user.service.IClientUserService;
import com.pepper.project.system.user.domain.User;
import com.pepper.project.system.user.service.IUserService;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

/**
 * 登录验证  客户端
 *
 * @author pepper
 */
@Controller
public class ClientUserLoginController extends BaseController
{
    @Autowired
    private IClientUserService clientUserService;

    @Autowired
    private IUserService userService;

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

    @PostMapping("/client/sms/login")
    @ResponseBody
    public AjaxResult ajaxClientSmsLogin(HttpServletRequest request, String mobilePhone, String smsCode, Boolean rememberMe)
    {
        HttpSession session = request.getSession();
        String validateStr = (String) session.getAttribute(GenConstants.SMS_CODE_ATTR);
        if(StringUtils.isEmpty(validateStr)){
            error("请先发送短信验证码！");
        }

        String[] validateStrArr = validateStr.split("_");
        String mobile = validateStrArr[0];
        String smsCode1 = validateStrArr[1];
        String timeStr = validateStrArr[2];
        String codeType = validateStrArr[3];

        if(!"2".equals(codeType)){
            error("验证码非法，请重新发送！");
        }

        long time = System.currentTimeMillis();
        if(time - Long.valueOf(timeStr) > 3 * 60 * 1000){
            error("验证码已过期，时效3分钟！请重新发送短信验证码！");
        }

        if(!mobile.equals(mobilePhone)){
            error("短信验证码与手机号不一致，请重新发送短信验证码！");
        }

        if(!smsCode1.equals(smsCode)){
            error("验证码错误！请校对验证码！");
        }

        User user = userService.selectUserByPhoneNumber(mobilePhone);

        String username = user.getLoginName();
        String password = user.getPassword();

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
            String msg = "登陆失败";
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
