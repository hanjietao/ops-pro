package com.pepper.project.system.user.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.pepper.common.utils.security.ShiroUtils;
import com.pepper.project.ch.hospital.domain.Hospital;
import com.pepper.project.ch.hospital.service.IHospitalService;
import com.pepper.project.cm.community.domain.Community;
import com.pepper.project.cm.community.service.ICommunityService;
import com.pepper.project.pm.property.domain.Property;
import com.pepper.project.pm.property.service.IPropertyService;
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
import com.pepper.common.utils.ServletUtils;
import com.pepper.common.utils.StringUtils;
import com.pepper.framework.web.controller.BaseController;
import com.pepper.framework.web.domain.AjaxResult;

/**
 * 登录验证
 *
 * @author pepper
 */
@Controller
public class LoginController extends BaseController
{
    @Autowired
    private ICommunityService communityService;

    @Autowired
    private IHospitalService hospitalService;

    @Autowired
    private IPropertyService propertyService;

    @GetMapping("/login")
    public String login(HttpServletRequest request, HttpServletResponse response)
    {
        // 如果是Ajax请求，返回Json字符串。
        if (ServletUtils.isAjaxRequest(request))
        {
            return ServletUtils.renderString(response, "{\"code\":\"1\",\"msg\":\"未登录或登录超时。请重新登录\"}");
        }

        return "login";
    }

    @PostMapping("/login")
    @ResponseBody
    public AjaxResult ajaxLogin(String username, String password, Boolean rememberMe)
    {
        UsernamePasswordToken token = new UsernamePasswordToken(username, password, rememberMe);
        Subject subject = SecurityUtils.getSubject();
        try
        {
            subject.login(token);
            User sysUser = getSysUser();
            if(!"0".equals(sysUser.getMerchantFlag())){
                Integer merchantId = sysUser.getMerchantId();
                Merchant merchant = new Merchant();
                String flg = sysUser.getMerchantFlag();
                String merchantIntro = null;
                String merchantName = null;
                String status = null;
                if("1".equals(flg)){
                    Community community = communityService.selectCommunityById(merchantId);
                    merchantIntro = StringUtils.isEmpty(community.getIntroduction())?"这是一个社区":community.getIntroduction();
                    merchantName = community.getCommunityName();
                    status = community.getStatus();
                }else if("2".equals(flg)){
                    Hospital hospital = hospitalService.selectHospitalById(merchantId);
                    merchantIntro = StringUtils.isEmpty(hospital.getIntroduction())?"这是一个医院":hospital.getIntroduction();
                    merchantName = hospital.getHosName();
                    status = hospital.getStatus();
                }else if("3".equals(flg)){
                    Property property = propertyService.selectPropertyById(merchantId);
                    merchantIntro = StringUtils.isEmpty(property.getIntroduction())?"这是一个物业":property.getIntroduction();
                    merchantName = property.getPropertyName();
                    status = property.getStatus();
                }
                merchant.setMerchantIntroduce(merchantIntro);
                merchant.setMerchantName(merchantName);
                merchant.setStatus(status);
                merchant.setImageUrl(sysUser.getAvatar());
                merchant.setMerchantId(merchantId);
                sysUser.setMerchant(merchant);
            }

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

    @GetMapping("/unauth")
    public String unauth()
    {
        return "error/unauth";
    }
}
