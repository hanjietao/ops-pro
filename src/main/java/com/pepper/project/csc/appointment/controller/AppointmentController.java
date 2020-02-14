package com.pepper.project.csc.appointment.controller;

import com.pepper.framework.aspectj.lang.annotation.Log;
import com.pepper.framework.aspectj.lang.enums.BusinessType;
import com.pepper.framework.web.controller.BaseController;
import com.pepper.framework.web.domain.AjaxResult;
import com.pepper.framework.web.page.TableDataInfo;
import com.pepper.project.csc.appointment.domain.Appointment;
import com.pepper.project.csc.appointment.service.IAppointmentService;
import com.pepper.project.csc.area.domain.Area;
import com.pepper.project.csc.area.service.IAreaService;
import com.pepper.project.csc.hospital.domain.Hospital;
import com.pepper.project.csc.hospital.service.IHospitalService;
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
@RequestMapping("/csc/appointment")
public class AppointmentController extends BaseController {

    private String prefix = "csc/appointment";

    @Autowired
    private IAppointmentService appointmentService;

    @Autowired
    private IHospitalService hospitalService;

    @Autowired
    private IAreaService areaService;

    @RequiresPermissions("csc:appointment:view")
    @GetMapping()
    public String online(ModelMap mmp)
    {
        mmp.put("hospitals",hospitalService.selectHospitalList(new Hospital()));
        return prefix + "/appointment";
    }

    @RequiresPermissions("csc:appointment:list")
    @PostMapping("/list")
    @ResponseBody
    public TableDataInfo list(Appointment appointment,ModelMap mmp)
    {
        startPage();
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
     * 新增保存区域设置
     */
    @Log(title = "医院介绍", businessType = BusinessType.INSERT)
    @RequiresPermissions("csc:appointment:add")
    @PostMapping("/add")
    @ResponseBody
    public AjaxResult addSave(String appointmentTimeStr,Appointment appointment)
    {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        Date time = null;
        try {
            time = sdf.parse(appointmentTimeStr);
        } catch (ParseException e) {
            e.printStackTrace();
        }
        appointment.setAppointmentTime(time);
        return toAjax(appointmentService.insertAppointment(appointment));
    }

    @RequiresPermissions("csc:appointment:detail")
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
    @RequiresPermissions("csc:appointment:changeStatus")
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
     * 修改区域
     */
    @GetMapping("/edit/{id}")
    public String edit(@PathVariable("id") Integer id, ModelMap mmap)
    {
        mmap.put("areas",areaService.selectAreaListByHosId(id));
        mmap.put("appointment", appointmentService.selectAppointmentById(id));
        return prefix + "/edit";
    }

    /**
     * 修改预约信息
     */
    @RequiresPermissions("csc:appointment:edit")
    @Log(title = "医院介绍", businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    @ResponseBody
    public AjaxResult editSave(Appointment appointment)
    {
        return toAjax(appointmentService.updateAppointment(appointment));
    }

    /**
     * 删除区域
     */
    @RequiresPermissions("csc:appointment:remove")
    @Log(title = "医院介绍", businessType = BusinessType.DELETE)
    @PostMapping("/remove")
    @ResponseBody
    public AjaxResult remove(String ids)
    {
        return toAjax(appointmentService.deleteAppointmentByIds(ids));
    }

}
