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
import io.swagger.annotations.ApiOperation;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("/ch/appointment")
public class AppointmentController extends BaseController {

    private String prefix = "ch/appointment";

    @Autowired
    private IAppointmentService appointmentService;

    @Autowired
    private IHospitalService hospitalService;

    @Autowired
    private IMedicalProjectService medicalProjectService;

    @Autowired
    private IAreaService areaService;

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
        appointment.setHospitalId(getMerchantId());
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
    public String detail(@PathVariable("id") Integer id, ModelMap mmap)
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
    public String edit(@PathVariable("id") Integer id, ModelMap mmap)
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
    public AjaxResult editSave(String appointmentStartTimeStr,String appointmentEndTimeStr, Appointment appointment)
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
        return toAjax(appointmentService.updateAppointment(appointment));
    }

    /**
     * 删除区域
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
}
