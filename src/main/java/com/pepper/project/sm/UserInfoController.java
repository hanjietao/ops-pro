package com.pepper.project.sm;

import com.pepper.common.constant.GenConstants;
import com.pepper.common.constant.SMSCodeEnum;
import com.pepper.common.utils.StringUtils;
import com.pepper.common.utils.security.ShiroUtils;
import com.pepper.framework.aspectj.lang.annotation.Log;
import com.pepper.framework.aspectj.lang.enums.BusinessType;
import com.pepper.framework.shiro.service.PasswordService;
import com.pepper.framework.web.controller.BaseController;
import com.pepper.framework.web.domain.AjaxResult;
import com.pepper.project.ch.appointment.domain.Appointment;
import com.pepper.project.ch.appointment.service.IAppointmentService;
import com.pepper.project.cm.note.domain.Note;
import com.pepper.project.cm.note.service.INoteService;
import com.pepper.project.csc.message.domain.SysMessage;
import com.pepper.project.csc.message.service.ISysMessageService;
import com.pepper.project.pm.note.domain.PmNote;
import com.pepper.project.pm.note.service.IPmNoteService;
import com.pepper.project.sm.point.service.IPointService;
import com.pepper.project.sm.user.domain.ClientUser;
import com.pepper.project.sm.user.service.IClientUserService;
import com.pepper.project.system.user.domain.User;
import com.pepper.project.system.user.service.IUserService;
import io.swagger.annotations.ApiOperation;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 *  @Description: 用户信息
 *  @author: HanJieTao
 *  @mail: hjtxyr@163.com
 *  @Date: 2020/3/13 17:17
 */
@Controller
public class UserInfoController extends BaseController {

    Logger logger = LoggerFactory.getLogger(UserInfoController.class);

    private String prefix = "sm/point";

    @Autowired
    private IAppointmentService appointmentService;
    @Autowired
    private INoteService noteService;
    @Autowired
    private IPmNoteService pmNoteService;
    @Autowired
    private IUserService userService;
    @Autowired
    private IClientUserService clientUserService;
    @Autowired
    private IPointService pointService;

    @Autowired
    private ISysMessageService sysMessageService;

    @Autowired
    private PasswordService passwordService;

    @ApiOperation("新增用户积分（需要登陆）orderByColumn=createTime&isAsc=desc&pageNum=1&pageSize=5")
    @Log(title = "个人中心客户数据", businessType = BusinessType.INSERT)
    @PostMapping("/userInfo")
    @ResponseBody
    //http://localhost/userinfo?orderByColumn=createTime&isAsc=desc&pageNum=1&pageSize=5
    public AjaxResult getUserInfo(@RequestParam(value = "orderByColumn", required = true)String orderByColumn,
                              @RequestParam(value = "isAsc", required = true)String isAsc,
                              @RequestParam(value = "pageNum", required = true)Integer pageNum,
                              @RequestParam(value = "pageSize", required = true)Integer pageSize)
    {
        try {
            User user = getSysUser();
            Appointment appointment = new Appointment();
            appointment.setUserId(user.getMerchantId());
            startPage();
            List<Appointment> list = appointmentService.selectAppointmentList(appointment);
            //Integer msgCount = messageService.selectCountByUserId();

            Note note = new Note();
            note.setUserId(user.getMerchantId());
            List<Note> notes = noteService.selectNoteList(note);

            PmNote pmNote = new PmNote();
            pmNote.setUserId(user.getMerchantId());
            List<PmNote> pmNotes = pmNoteService.selectNoteList(pmNote);

            Map<String,Object> map = new HashMap<>();
            map.put("appointments",list);
            SysMessage sysMessage = new SysMessage();
            sysMessage.setUserId(user.getClientUser().getUserId());
            sysMessage.setSysUserId(user.getUserId());
            map.put("msgCount",sysMessageService.unReadCount(sysMessage));
            map.put("notes",notes);
            map.put("pmNotes",pmNotes);
            map.put("userInfo",clientUserService.selectClientUserById(user.getClientUser().getUserId()));

            return AjaxResult.success(map);

        }catch (Exception e){
            logger.error(org.apache.commons.lang3.exception.ExceptionUtils.getStackTrace(e));
            return success("error");
        }

    }

    @ApiOperation("修改个人信息[性别gender:0-男，1-女,2-未知，birthday:格式-yyyy-MM-dd，手机号：11位数字]")
    @Log(title = "个人中心客户数据", businessType = BusinessType.UPDATE)
    @PostMapping("/updateUserInfo")
    @ResponseBody
    public AjaxResult updateUserInfo(String gender,String birthday, String smsCode,String mobilePhone)
    {
        try {
            User user = getSysUser();
            Long userId = user.getUserId();
            Long clientUserId = user.getClientUser().getUserId();
            // 系统用户
            User newUser = userService.selectUserById(userId);
            ClientUser clientUser = clientUserService.selectClientUserById(clientUserId);

            if(!StringUtils.isEmpty(gender) && !gender.equals(newUser.getSex())){
                newUser.setSex(gender);
                clientUser.setGender(gender);
            }

            // 生日
            if(!StringUtils.isEmpty(birthday)){
                clientUser.setBirthday(birthday);
            }

            // 手机号
            if(!StringUtils.isEmpty(mobilePhone) && !mobilePhone.equals(newUser.getPhonenumber())){
                User mobilePhoneUser = userService.selectUserByPhoneNumber(mobilePhone);
                if(mobilePhoneUser != null && mobilePhoneUser.getUserId().longValue() != user.getUserId().longValue()){
                    return AjaxResult.error("手机号已经被注册，不能绑定到当前账号");
                }

                if(StringUtils.isEmpty(smsCode)){
                    return AjaxResult.error("请先获取短信验证码！");
                }
                String validateStr = (String) ShiroUtils.getSession().getAttribute(GenConstants.SMS_CODE_ATTR);
                if(StringUtils.isEmpty(validateStr)){
                    return AjaxResult.error("已失效，请重新获取短信验证码！");
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

                logger.info("history mobilePhone,userId={},mobilePhone={}",user.getUserId(),user.getPhonenumber());
                String salt = newUser.getSalt();
                newUser.setLoginName(mobilePhone);
                newUser.setPhonenumber(mobilePhone);
                newUser.setPassword(passwordService.encryptPassword(newUser.getLoginName(), user.getPwdMd5(), salt));
                clientUser.setUserMobile(mobilePhone);
            }

            userService.updateUserInfo(newUser);
            clientUserService.updateClientUser(clientUser);

            clientUser = clientUserService.selectClientUserById(clientUserId);
            newUser = userService.selectUserById(userId);
            newUser.setClientUser(clientUser);
            ShiroUtils.setSysUser(newUser);
            return AjaxResult.success("更新成功");
        }catch (Exception e){
            logger.error(org.apache.commons.lang3.exception.ExceptionUtils.getStackTrace(e));
            return success("error");
        }

    }

    @ApiOperation("修改密码[请前端自动将明文密码加密32位md5传输]")
    @Log(title = "个人中心客户数据", businessType = BusinessType.UPDATE)
    @PostMapping("/updatePwd")
    @ResponseBody
    public AjaxResult updatePwd(String oldPwd,String newPwd)
    {
        try {
            User user = getSysUser();
            User user1 = userService.selectUserById(user.getUserId());
            String salt = user1.getSalt();
            user1.setPwdMd5(user.getPassword()); // record
            user1.setPassword(passwordService.encryptPassword(user1.getLoginName(), newPwd, salt));
            return AjaxResult.success(userService.updateUserInfo(user1));

        }catch (Exception e){
            logger.error(org.apache.commons.lang3.exception.ExceptionUtils.getStackTrace(e));
            return success("error");
        }

    }

    @ApiOperation("修改个人信息[性别gender:0-男，1-女,2-未知]")
    @Log(title = "个人中心客户数据", businessType = BusinessType.UPDATE)
    @PostMapping("/updateGender")
    @ResponseBody
    public AjaxResult updateGender(String gender)
    {
        try {
            User user = getSysUser();
            user.setSex(gender);
            ClientUser clientUser = clientUserService.selectClientUserById(user.getClientUser().getUserId());
            clientUser.setGender(gender);
            user.setClientUser(clientUser);
            User newUser = userService.selectUserById(user.getUserId());
            newUser.setSex(gender);
            userService.updateUserInfo(newUser);
            return AjaxResult.success(clientUserService.updateClientUser(clientUser));

        }catch (Exception e){
            logger.error(org.apache.commons.lang3.exception.ExceptionUtils.getStackTrace(e));
            return success("error");
        }

    }

    @ApiOperation("修改个人信息[生日 yyyy-MM-dd]")
    @Log(title = "个人中心客户数据", businessType = BusinessType.UPDATE)
    @PostMapping("/updateBirthday")
    @ResponseBody
    public AjaxResult updateBirthday(String birthday)
    {
        try {
            User user = getSysUser();
            ClientUser clientUser = clientUserService.selectClientUserById(user.getClientUser().getUserId());
            clientUser.setBirthday(birthday);
            user.setClientUser(clientUser);
            return AjaxResult.success(clientUserService.updateClientUser(clientUser));

        }catch (Exception e){
            logger.error(org.apache.commons.lang3.exception.ExceptionUtils.getStackTrace(e));
            return success("error");
        }

    }



    @ApiOperation("修改手机号")
    @Log(title = "修改手机号", businessType = BusinessType.INSERT)
    @PostMapping("/updateMobilePhone")
    @ResponseBody
    public AjaxResult updateMobilePhone(String mobilePhone)
    {
        try {
            User user = getSysUser();
            User mpUser = userService.selectUserByPhoneNumber(mobilePhone);
            if(mpUser.getUserId().longValue() != user.getUserId().longValue()){
                return AjaxResult.error("手机号已经被注册，不能绑定到当前账号");
            }

            User user1 = userService.selectUserById(user.getUserId());
            String salt = user1.getSalt();
            user1.setLoginName(mobilePhone);
            user1.setPhonenumber(mobilePhone);
            user1.setPassword(passwordService.encryptPassword(user1.getLoginName(), user.getPwdMd5(), salt));
            ClientUser clientUser = clientUserService.selectClientUserById(user.getClientUser().getUserId());
            clientUser.setUserMobile(mobilePhone);
            clientUserService.updateClientUser(clientUser);

            return AjaxResult.success(userService.updateUserInfo(user1));

        }catch (Exception e){
            logger.error(org.apache.commons.lang3.exception.ExceptionUtils.getStackTrace(e));
            return error("error");
        }

    }


}
