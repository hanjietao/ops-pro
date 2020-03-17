package com.pepper.project.sm;

import com.pepper.framework.aspectj.lang.annotation.Log;
import com.pepper.framework.aspectj.lang.enums.BusinessType;
import com.pepper.framework.web.controller.BaseController;
import com.pepper.framework.web.domain.AjaxResult;
import com.pepper.project.ch.appointment.domain.Appointment;
import com.pepper.project.ch.appointment.service.IAppointmentService;
import com.pepper.project.cm.note.domain.Note;
import com.pepper.project.cm.note.service.INoteService;
import com.pepper.project.pm.note.domain.PmNote;
import com.pepper.project.pm.note.service.IPmNoteService;
import com.pepper.project.sm.point.service.IPointService;
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
            map.put("msgCount",12);
            map.put("notes",notes);
            map.put("pmNotes",pmNotes);

            return AjaxResult.success(map);

        }catch (Exception e){
            logger.error(org.apache.commons.lang3.exception.ExceptionUtils.getStackTrace(e));
            return success("error");
        }

    }

}
