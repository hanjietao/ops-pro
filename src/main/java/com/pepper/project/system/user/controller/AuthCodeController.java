package com.pepper.project.system.user.controller;

import com.alibaba.fastjson.JSONObject;
import com.pepper.common.constant.GenConstants;
import com.pepper.common.constant.SMSCodeEnum;
import com.pepper.common.utils.StringUtils;
import com.pepper.common.utils.security.ShiroUtils;
import com.pepper.framework.web.controller.BaseController;
import com.pepper.framework.web.domain.AjaxResult;
import com.pepper.project.csc.sms.domain.SmsCode;
import com.pepper.project.csc.sms.service.ISmsCodeService;
import io.swagger.annotations.ApiOperation;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
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

    @Value("${pepper.smsIntervalMiliSec}")
    private int smsIntervalMiliSec;

    @Value("${pepper.smsMobileDayMaxSendCount}")
    private int smsMobileDayMaxSendCount;

    @Autowired
    private ISmsCodeService smsCodeService;

    /**
     * 验证码生成
     */
    @ApiOperation("发送短信验证码, smsCodeType: client_register（注册）  或者  client_login（登陆）")
    @PostMapping(value = "/gen")
    @ResponseBody
    public AjaxResult genAuthCode(String mobilePhone, String smsCodeType)
    {
        logger.info("mobilePhone={}, smsCodeType={}",mobilePhone,smsCodeType);
        String pattern = "^[1-9]\\d*$";
        if(StringUtils.isEmpty(mobilePhone) || mobilePhone.length() != 11 || !Pattern.matches(pattern, mobilePhone)){
            return error("手机号必须为11位数字组成！");
        }

        String codeType;
        if("client_register".equals(smsCodeType)){
            codeType = SMSCodeEnum.R.toString();
        }else if("client_login".equals(smsCodeType)){
            codeType = SMSCodeEnum.L.toString();
        }else {
            return error("非法的短信获取短信验证码的方式！");
        }
        Long lastSendTime = (Long)ShiroUtils.getSession().getAttribute(GenConstants.SMS_CODE_SEND_TIME);
        if(lastSendTime != null && lastSendTime > System.currentTimeMillis() - smsIntervalMiliSec){
            return error("抱歉！您发送短信太频繁，请稍后重试！");
        }
        SmsCode smsCode1 = new SmsCode();
        smsCode1.setMobilePhone(mobilePhone);

        Calendar calendar = Calendar.getInstance();
        calendar.setTime(new Date());
        calendar.set(Calendar.HOUR_OF_DAY, 0);
        calendar.set(Calendar.MINUTE, 0);
        calendar.set(Calendar.SECOND, 0);
        Date zero = calendar.getTime();
        smsCode1.setCreateTime(zero);
        List<SmsCode> list = smsCodeService.selectSmsCodeList(smsCode1);
        if(list.size() > smsMobileDayMaxSendCount){
            return error("抱歉！今天您当前手机号已经发送短信超过上限，请明天再试!");
        }

        String code = smsCode();
        logger.info("sms mobilePhone={}, code={}",mobilePhone,code);
        long time = System.currentTimeMillis();
        String validateStr = mobilePhone+"_"+code+"_"+time+"_"+codeType; // 手机号_验证码_时间戳
        // 保存验证码到数据库

        // 发送验证码  调用三方接口
        SmsCode smsCode = new SmsCode();
        smsCode.setCode(code);
        smsCode.setCodeType(codeType);
        smsCode.setMobilePhone(mobilePhone);
        smsCode.setStatus("0");
        smsCodeService.insertSmsCode(smsCode);

        // 将验证码存在session
        ShiroUtils.getSession().setAttribute(GenConstants.SMS_CODE_ATTR, validateStr);
        // 保存最近的短信发送时间 毫秒
        ShiroUtils.getSession().setAttribute(GenConstants.SMS_CODE_SEND_TIME, System.currentTimeMillis());

        return success("验证码发送成功"+code);
    }

    //创建验证码
    public static String smsCode(){
        String random=(int)((Math.random()*9+1)*100000)+"";
        System.out.println("验证码："+random);
        return random;
    }







    /**
     *  测试代码   parameter json
     */
    // 客户端传递Json数据
    /*@ApiOperation("发送短信验证码, smsCodeType: client_register（注册）  或者  client_login（登陆）")
    @PostMapping(value = "/gen")
    @ResponseBody
    public AjaxResult genAuthCode(@RequestBody JSONObject jsonParam)
    {
        String mobilePhone = jsonParam.getString("mobilePhone");
        String smsCodeType = jsonParam.getString("smsCodeType");
        logger.info("mobilePhone={}, smsCodeType={}",mobilePhone,smsCodeType);
        String pattern = "^[1-9]\\d*$";
        if(StringUtils.isEmpty(mobilePhone) || mobilePhone.length() != 11 || !Pattern.matches(pattern, mobilePhone)){
            return error("手机号必须为11位数字组成！");
        }

        String codeType = null;
        if("client_register".equals(smsCodeType)){
            codeType = SMSCodeEnum.R.toString();
        }else if("client_login".equals(smsCodeType)){
            codeType = SMSCodeEnum.L.toString();
        }else {
            return error("非法的短信获取短信验证码的方式！");
        }

        String code = smsCode();
        logger.info("sms mobilePhone={}, code={}",mobilePhone,code);
        long time = System.currentTimeMillis();
        String validateStr = mobilePhone+"_"+code+"_"+time+"_"+codeType; // 手机号_验证码_时间戳
        // 保存验证码到数据库
        // 发送验证码  调用三方接口

        SmsCode smsCode = new SmsCode();
        smsCode.setCode(code);
        smsCode.setCodeType(codeType);
        smsCode.setMobilePhone(mobilePhone);
        // Dao.insert(smsCode);

        // 将验证码存在session
        ShiroUtils.getSession().setAttribute(GenConstants.SMS_CODE_ATTR, validateStr);

        return success("验证码发送成功"+code);
    }*/

}
