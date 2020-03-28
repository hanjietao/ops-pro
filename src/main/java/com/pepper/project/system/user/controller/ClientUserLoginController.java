package com.pepper.project.system.user.controller;

import com.pepper.common.constant.GenConstants;
import com.pepper.common.constant.SMSCodeEnum;
import com.pepper.common.utils.StringUtils;
import com.pepper.common.utils.security.ShiroUtils;
import com.pepper.framework.aspectj.lang.enums.SysUserType;
import com.pepper.framework.web.controller.BaseController;
import com.pepper.framework.web.domain.AjaxResult;
import com.pepper.project.sm.user.domain.ClientUser;
import com.pepper.project.sm.user.service.IClientUserService;
import com.pepper.project.system.user.domain.User;
import com.pepper.project.system.user.service.IUserService;
import io.swagger.annotations.ApiOperation;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.DigestUtils;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

/**
 * 登录验证  客户端
 *
 * @author pepper
 */
@Controller
public class ClientUserLoginController extends BaseController
{
    Logger logger = LoggerFactory.getLogger(ClientUserLoginController.class);
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

    @ApiOperation("客户端用户登陆 手机号：18978786511 , 通过短信验证码登陆 auto register and login")
    @PostMapping("/client/sms/login")
    @ResponseBody
    public AjaxResult ajaxClientSmsLogin(String mobilePhone, String smsCode, Boolean rememberMe)
    {
        logger.info("client ajax post login,mobilePhone={},smsCode={}",mobilePhone,smsCode);
        String validateStr = (String) ShiroUtils.getSession().getAttribute(GenConstants.SMS_CODE_ATTR);
        if(StringUtils.isEmpty(validateStr)){
            return AjaxResult.error("请先发送短信验证码！");
        }

        String[] validateStrArr = validateStr.split("_");
        String mobile = validateStrArr[0];
        String smsCode1 = validateStrArr[1];
        String timeStr = validateStrArr[2];
        String codeType = validateStrArr[3];

        if(!SMSCodeEnum.L.toString().equals(codeType)){
            return AjaxResult.error("验证码非法，请重新发送！");
        }

        long time = System.currentTimeMillis();
        if(time - Long.valueOf(timeStr) > 3 * 60 * 1000){
            return AjaxResult.error("验证码已过期，时效3分钟！请重新发送短信验证码！");
        }

        if(!mobile.equals(mobilePhone)){
            return AjaxResult.error("短信验证码与手机号不一致，请重新发送短信验证码！");
        }

        if(!smsCode1.equals(smsCode)){
            return error("验证码错误！请校对验证码！");
        }

        // 注册用户
        User user1 = new User();
        user1.setPhonenumber(mobilePhone);
        List<User> list = userService.selectUserList(user1);
        User user;
        if(list.size() == 0){
            user = new User();
            user.setMerchantFlag(SysUserType.client.getType());
            user.setUserName(mobilePhone);
            user.setLoginName(mobilePhone);
            user.setPhonenumber(mobilePhone);
            user.setAvatar("/profile/avatar/profile.jpg");

            user.setPassword(DigestUtils.md5DigestAsHex(mobilePhone.getBytes()));

            // 用户名密码不用记录到 sm_client_user中
            ClientUser clientUser1 = new ClientUser();
            clientUser1.setAvatarUrl("/profile/avatar/profile.jpg");

            // 性别未知
            clientUser1.setGender("2");
            clientUser1.setUserMobile(user.getPhonenumber());

            // 这个是在岗位管理里面新增的给客户端用户得岗位类型，这个配置不能删除
            user.setPostIds(new Long[]{5L});

            // 客户端用户登陆权限，这个是在权限管理里面配置新增得角色，也是不能删除得配置
            user.setRoleId(107L);
            user.setRoleIds(new Long[]{107L});
            user.setDeptId(112L); // 配置部门 客户端用户

            // 注册客户端用户，需要将sm_client_user表得id记录到sys_user表的merchantId
            userService.insertUserClient(user,clientUser1);
        }else{
            user = list.get(0);
            if(!SysUserType.client.getType().equals(user.getMerchantFlag())){
                return error("手机号被后台占用，无法注册！");
            }
        }

        user = userService.selectUserByPhoneNumber(mobilePhone);

        String username = user.getLoginName();
        String password = user.getPwdMd5();

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
            // TODO need empty the session sms code before
            return success("login success client");
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
