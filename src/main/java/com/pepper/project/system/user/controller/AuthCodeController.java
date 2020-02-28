package com.pepper.project.system.user.controller;

import com.google.code.kaptcha.Constants;
import com.google.code.kaptcha.Producer;
import com.pepper.common.constant.GenConstants;
import com.pepper.common.utils.StringUtils;
import com.pepper.framework.web.controller.BaseController;
import com.pepper.framework.web.domain.AjaxResult;
import com.pepper.project.cm.activity.controller.ActivityApplyController;
import com.pepper.project.csc.sms.domain.SmsCode;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.imageio.ImageIO;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.util.regex.Pattern;

/**
 *  手机短信验证码
 *
 * @author pepper
 */
@Controller
@RequestMapping("/authcode")
public class AuthCodeController extends BaseController
{
    Logger logger = LoggerFactory.getLogger(AuthCodeController.class);
    /**
     * 验证码生成
     */
    @PostMapping(value = "/gen")
    @ResponseBody
    public AjaxResult genAuthCode(HttpServletRequest request, String mobilePhone,String smsCodeType, HttpServletResponse response)
    {
        String pattern = "^[1-9]\\d*$";
        if(StringUtils.isEmpty(mobilePhone) || mobilePhone.length() != 11 || !Pattern.matches(pattern, mobilePhone)){
            return error("手机号必须为11位数字组成！");
        }

        int codeType = 0;
        if("register".equals(smsCodeType)){
            codeType = 1;
        }else {
            return error("非法短信验证码！");
        }

        String code = smsCode();
        logger.info("sms mobilePhone={}, code={}",mobilePhone,code);
        long time = System.currentTimeMillis();
        String validateStr = mobilePhone+"_"+code+"_"+time; // 手机号_验证码_时间戳
        // 保存验证码到数据库
        // 发送验证码  调用三方接口

        SmsCode smsCode = new SmsCode();
        smsCode.setCode(code);
        smsCode.setCodeType(codeType);
        smsCode.setMobilePhone(mobilePhone);
        // Dao.insert(smsCode);

        // 将验证码存在session
        HttpSession session = request.getSession();
        session.setAttribute(GenConstants.SMS_CODE_ATTR, validateStr);

        return success("验证码发送成功");
    }



    //创建验证码
    public static String smsCode(){
        String random=(int)((Math.random()*9+1)*100000)+"";
        System.out.println("验证码："+random);
        return random;
    }

}
