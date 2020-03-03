package com.pepper.project.system.user.controller;

import com.pepper.common.constant.GenConstants;
import com.pepper.common.constant.UserConstants;
import com.pepper.common.utils.StringUtils;
import com.pepper.framework.aspectj.lang.annotation.Log;
import com.pepper.framework.aspectj.lang.enums.BusinessType;
import com.pepper.framework.aspectj.lang.enums.SysUserType;
import com.pepper.framework.web.controller.BaseController;
import com.pepper.framework.web.domain.AjaxResult;
import com.pepper.project.sm.user.domain.ClientUser;
import com.pepper.project.system.user.domain.User;
import com.pepper.project.system.user.service.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@Controller
public class ClientUserRegisterController extends BaseController {

    @Autowired
    private IUserService userService;


    @GetMapping("/register")
    public String register(HttpServletRequest request, HttpServletResponse response)
    {
        return "register";
    }

    /**
     *  注册客户端用户
     */
    @Log(title = "注册客户端用户", businessType = BusinessType.INSERT)
    @PostMapping("/register")
    @ResponseBody
    public AjaxResult ajaxRegister(HttpServletRequest request, @Validated User user)
    {

        if (UserConstants.USER_NAME_NOT_UNIQUE.equals(userService.checkLoginNameUnique(user.getLoginName())))
        {
            return error("注册用户'" + user.getLoginName() + "'失败，登录账号已存在");
        }
        else if (UserConstants.USER_PHONE_NOT_UNIQUE.equals(userService.checkPhoneUnique(user)))
        {
            return error("注册用户'" + user.getLoginName() + "'失败，手机号码已存在");
        }
        // 客户端注册，不需要邮箱，后面可以新增绑定邮箱
//        else if (UserConstants.USER_EMAIL_NOT_UNIQUE.equals(userService.checkEmailUnique(user)))
//        {
//            return error("新增用户'" + user.getLoginName() + "'失败，邮箱账号已存在");
//        }
//        if(user.getRoleId() == null || user.getRoleId() == 0){
//            return error("角色不可以不选！");
//        }
        HttpSession session = request.getSession();
        String validateStr = (String) session.getAttribute(GenConstants.SMS_CODE_ATTR);
        if(StringUtils.isEmpty(validateStr)){
            error("请先发送短信验证码！");
        }

        String[] validateStrArr = validateStr.split("_");
        String mobile = validateStrArr[0];
        String smsCode = validateStrArr[1];
        String timeStr = validateStrArr[2];
        String codeType = validateStrArr[3];
        long time = System.currentTimeMillis();
        if(time - Long.valueOf(timeStr) > 3 * 60 * 1000){
            error("验证码已过期，时效3分钟！请重新发送短信验证码！");
        }

        if(!mobile.equals(user.getPhonenumber())){
            error("短信验证码与手机号不一致，请重新发送短信验证码！");
        }

        if(!smsCode.equals(user.getSmsCode())){
            error("验证码错误！请校对验证码！");
        }

        // 设置系统用户类型为  客户端用户
        user.setMerchantFlag(SysUserType.client.getType());
        user.setUserName(user.getLoginName());

        // 用户名密码不用记录到 sm_client_user中
        ClientUser clientUser = new ClientUser();
        clientUser.setGender(user.getSex());

        clientUser.setUserMobile(user.getPhonenumber());

        user.setPostIds(new Long[]{5L}); // 这个是在岗位管理里面新增的给客户端用户得岗位类型，这个配置不能删除  TODO
        user.setRoleId(107L); // 客户端用户登陆权限，这个是在权限管理里面配置新增得角色，也是不能删除得配置
        user.setDeptId(112L); // 配置部门 客户端用户

        // 注册客户端用户，需要将sm_client_user表得id记录到sys_user表的merchantId
        return toAjax(userService.insertUserClient(user,clientUser));
    }


}
