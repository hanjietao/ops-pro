package com.pepper.project.ch.appointment.controller;

import com.pepper.common.utils.security.ShiroUtils;
import com.pepper.framework.aspectj.lang.annotation.Log;
import com.pepper.framework.aspectj.lang.enums.BusinessType;
import com.pepper.framework.aspectj.lang.enums.SysUserType;
import com.pepper.framework.web.controller.BaseController;
import com.pepper.framework.web.domain.AjaxResult;
import com.pepper.framework.web.page.TableDataInfo;
import com.pepper.project.ch.appointment.domain.Appointment;
import com.pepper.project.ch.appointment.service.IAppointmentService;
import com.pepper.project.ch.hospital.domain.Hospital;
import com.pepper.project.ch.hospital.service.IHospitalService;
import com.pepper.project.ch.medical.domain.MedicalProject;
import com.pepper.project.ch.medical.service.IMedicalProjectService;
import com.pepper.project.csc.area.domain.Area;
import com.pepper.project.csc.area.service.IAreaService;
import com.pepper.project.sm.point.domain.Point;
import com.pepper.project.sm.point.service.IPointService;
import com.pepper.project.sm.user.domain.ClientUser;
import com.pepper.project.sm.user.service.IClientUserService;
import com.pepper.project.system.user.domain.User;
import com.pepper.project.system.user.service.IUserService;
import io.swagger.annotations.ApiOperation;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;

@Controller
@RequestMapping("/ch/appointment")
public class AppointmentController extends BaseController {

    Logger logger = LoggerFactory.getLogger(AppointmentController.class);

    private String prefix = "ch/appointment";

    @Autowired
    private IAppointmentService appointmentService;

    @Autowired
    private IHospitalService hospitalService;

    @Autowired
    private IMedicalProjectService medicalProjectService;

    @Autowired
    private IAreaService areaService;

    @Autowired
    private IUserService userService;

    @Autowired
    private IClientUserService clientUserService;

    @Autowired
    private IPointService pointService;

    @RequiresPermissions("ch:appointment:view")
    @GetMapping()
    public String online(ModelMap mmp)
    {
        mmp.put("hospitals",hospitalService.selectHospitalList(new Hospital()));
        return prefix + "/appointment";
    }

    @RequiresPermissions("ch:appointment:list")
    @PostMapping("/list")
    @ResponseBody
    public TableDataInfo list(Appointment appointment, ModelMap mmp)
    {
        startPage();
        if(getMerchantId() != 0){
            appointment.setHospitalId(getMerchantId());
        }
        List<Appointment> list = appointmentService.selectAppointmentList(appointment);
        return getDataTable(list);
    }

    /**
     * 新增预约
     */
    @GetMapping("/add")
    public String add(ModelMap mmap)
    {
        List<Area> areas = areaService.selectAreaList(new Area());
        mmap.put("areas",areas);
        return prefix + "/add";
    }

    /**
     * 新增保存预约
     *
     */
    @Log(title = "预约检查", businessType = BusinessType.INSERT)
    @RequiresPermissions("ch:appointment:add")
    @PostMapping("/add")
    @ResponseBody
    public AjaxResult addSave(String appointmentStartTimeStr,String appointmentEndTimeStr, Appointment appointment)
    {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        Date startTime = null;
        Date endTime = null;
        try {
            startTime = sdf.parse(appointmentStartTimeStr);
            endTime = sdf.parse(appointmentEndTimeStr);
        } catch (ParseException e) {
            e.printStackTrace();
        }
        if(getMerchantId()==null || getMerchantId() == 0 ||
                !SysUserType.hadmin.getType().equals(getSysUser().getMerchantFlag())){
            return  error("非医院业务系统用户 无法添加医院预约");
        }
        appointment.setHospitalId(getMerchantId());
        appointment.setAppointmentStartTime(startTime);
        appointment.setAppointmentEndTime(endTime);
        return toAjax(appointmentService.insertAppointment(appointment));
    }

    @RequiresPermissions("ch:appointment:detail")
    @GetMapping("/detail/{id}")
    public String detail(@PathVariable("id") Long id, ModelMap mmap)
    {
        mmap.put("name", "appointment");
        mmap.put("appointment", appointmentService.selectAppointmentById(id));
        return prefix + "/detail";
    }

    /**
     * 任务调度立即执行一次
     */
    @Log(title = "预约管理", businessType = BusinessType.UPDATE)
    @RequiresPermissions("ch:appointment:changeStatus")
    @PostMapping("/changeStatus")
    @ResponseBody
    public AjaxResult changeStatus(Appointment appointment)
    {
        Appointment appointment1 = new Appointment();
        appointment1.setId(appointment.getId());
        appointment1.setStatus("1");
        appointment1.setCancelReason(appointment.getCancelReason());
        appointmentService.changeStatus(appointment1);
        return success();
    }

    /**
     * 修改预约检查
     */
    @GetMapping("/edit/{id}")
    public String edit(@PathVariable("id") Long id, ModelMap mmap)
    {
        //mmap.put("areas",areaService.selectAreaListByHosId(id));
        MedicalProject medicalProject = new MedicalProject();
        medicalProject.setHospitalId(getMerchantId());
        List<MedicalProject> medicalProjects = medicalProjectService.selectMedicalProjectList(medicalProject);
        mmap.put("medicalProjects",medicalProjects);
        mmap.put("appointment", appointmentService.selectAppointmentById(id));
        return prefix + "/edit";
    }

    /**
     * 修改预约信息
     */
    @RequiresPermissions("ch:appointment:edit")
    @Log(title = "预约检查", businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    @ResponseBody
    @Transactional
    public AjaxResult editSave(String appointmentStartTimeStr,String appointmentEndTimeStr, Appointment appointment)
    {
        // 可以让后台修改 用户的预约时间
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        Date startTime = null;
        Date endTime = null;
        try {
            startTime = sdf.parse(appointmentStartTimeStr);
            endTime = sdf.parse(appointmentEndTimeStr);
        } catch (ParseException e) {
            e.printStackTrace();
        }
        if(getMerchantId()==null || getMerchantId() == 0 ||
                !SysUserType.hadmin.getType().equals(getSysUser().getMerchantFlag())){
            return  error("非医院业务系统用户 无法添加医院预约");
        }

        // 扣减用户积分
        if("2".equals(appointment.getStatus())){//已完成
            Appointment appointment1 = appointmentService.selectAppointmentById(appointment.getId());
            ClientUser clientUser = clientUserService.selectClientUserById(appointment1.getUserId());
            User user = userService.selectUserByMerchantId(appointment1.getUserId());
            if("Y".equals(appointment1.getMedicalProject().getPointUseFlag())
                    && clientUser.getUserCurrentPoints() < appointment1.getMedicalProject().getPointNum()){
                return  error("该用户积分不够，目前用户积分："+clientUser.getUserCurrentPoints()+
                        "，项目积分抵扣所需积分："+appointment1.getMedicalProject().getPointUseFlag()+"，可以找朋友赠送积分或者选择现金支付");
            }
            // TODO 扣减用户积分
            // 1. 扣除用户积分，记录积分扣除明细（记录扣减具体信息：医疗项目使用积分抵扣，医疗项目id）
            Point point = new Point();
            point.setUserId(appointment1.getUserId());
            point.setSysUserId(user.getUserId());
            point.setPoints(appointment1.getMedicalProject().getPointNum());
            point.setAddOrDeduct("0");
            point.setOperateProjectId(appointment1.getMedicalProject().getId().toString());
            point.setOperateType("5");
            point.setOperateTypeInfo(appointment1.getMedicalProject().getName()+"使用");
            int insertCount = pointService.insertPoint(point);

            clientUser.setPointNum(appointment1.getMedicalProject().getPointNum());
            int updateCount = clientUserService.deductClientUserPoint(clientUser);
            if(updateCount != 1){
                throw new RuntimeException("积分使用失败，请刷新重试");
            }
            appointment.setPointNum(appointment1.getMedicalProject().getPointNum());
            logger.info(""+updateCount);
        }else{
            logger.info("现金交易：appointmentId= {}, operatorId= {}",appointment.getId(),getSysUser().getUserId());
        }

        //appointment.setHospitalId(getMerchantId());
        appointment.setAppointmentStartTime(startTime);
        appointment.setAppointmentEndTime(endTime);
        return toAjax(appointmentService.updateAppointment(appointment));
    }

    /**
     * 删除预约检查
     */
    @RequiresPermissions("ch:appointment:remove")
    @Log(title = "预约检查", businessType = BusinessType.DELETE)
    @PostMapping("/remove")
    @ResponseBody
    public AjaxResult remove(String ids)
    {
        return toAjax(appointmentService.deleteAppointmentByIds(ids));
    }


    @ApiOperation("新增医院预约检查")
    @Log(title = "新增医院预约检查", businessType = BusinessType.INSERT)
    @PostMapping("/addAppointment")
    @ResponseBody
    public AjaxResult addAppointment(@RequestParam(required = true) String appointmentStartTimeStr,
                           @RequestParam(required = true) String appointmentEndTimeStr,
                           @RequestParam(required = true) Integer medicalProjectId,
                           @RequestParam(required = true) Long hospitalId,
                           @RequestParam(required = true) String appointmentReason,
                           @RequestParam(required = true) String appointmentName,
                           @RequestParam(required = true) String appointmentPhone)
    {
        Appointment appointment = new Appointment();
        appointment.setUserId(ShiroUtils.getSysUser().getClientUser().getUserId());
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        Date startTime = null;
        Date endTime = null;
        try {
            startTime = sdf.parse(appointmentStartTimeStr);
            endTime = sdf.parse(appointmentEndTimeStr);
        } catch (ParseException e) {
            e.printStackTrace();
        }
        appointment.setHospitalId(getMerchantId());
        appointment.setAppointmentStartTime(startTime);
        appointment.setAppointmentEndTime(endTime);
        appointment.setHospitalId(hospitalId);
        appointment.setAppointmentName(appointmentName);
        appointment.setAppointmentPhone(appointmentPhone);
        appointment.setMedicalProjectId(medicalProjectId);
        appointment.setAppointmentReason(appointmentReason);
        appointment.setStatus("0");
        return AjaxResult.success(appointmentService.insertAppointment(appointment));
    }

    @ApiOperation("取消医院预约检查")
    @Log(title = "取消医院预约检查", businessType = BusinessType.UPDATE)
    @PostMapping("/cancel")
    @ResponseBody
    public AjaxResult cancelAppointment(@RequestParam(required = true) Long id,
                                        @RequestParam(required = false) String cancelReason)
    {

        Appointment appointment = appointmentService.selectAppointmentById(id);
        if(appointment == null || getSysUser().getClientUser().getUserId().longValue() != appointment.getUserId().longValue()){
            return error("抱歉，您不存在该预约");
        }
        appointment.setStatus("1");// 1关闭
        appointment.setCancelReason(cancelReason);
        return AjaxResult.success(appointmentService.updateAppointment(appointment));
    }
}
