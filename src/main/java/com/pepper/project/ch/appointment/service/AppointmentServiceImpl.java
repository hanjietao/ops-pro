package com.pepper.project.ch.appointment.service;

import com.pepper.common.utils.security.ShiroUtils;
import com.pepper.common.utils.text.Convert;
import com.pepper.framework.aspectj.lang.annotation.DataScope;
import com.pepper.project.ch.appointment.domain.Appointment;
import com.pepper.project.ch.appointment.mapper.AppointmentMapper;
import com.pepper.project.csc.area.mapper.AreaMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class AppointmentServiceImpl implements IAppointmentService {

    @Autowired
    private AppointmentMapper appointmentDao;

    @Autowired
    private AreaMapper areaDao;

    /**
     *  @Description: 列表查询
     *  @author: HanJieTao
     *  @mail: hjtxyr@163.com
     *  @Date: 2020/2/6 0:23
     */
    @DataScope(hospitalAlias = "h", medicalProjectAlias = "mp", appointmentAlias = "a")
    public List<Appointment> selectAppointmentList(Appointment appointment) {

        List<Appointment> list = appointmentDao.selectAppointmentList(appointment);
        return list;
    }

    @Override
    public int insertAppointment(Appointment appointment) {
        appointment.setCreateBy(ShiroUtils.getLoginName());
        appointment.setUpdateBy(ShiroUtils.getLoginName());
        return appointmentDao.insertAppointment(appointment);
    }

    @Override
    public int deleteAppointmentByIds(String ids) {
        return appointmentDao.deleteAppointmentByIds(Convert.toStrArray(ids));
    }

    @Override
    public Appointment selectAppointmentById(Long id) {
        return appointmentDao.selectAppointmentById(id);
    }

    @Override
    public int updateAppointment(Appointment area) {
        area.setUpdateBy(ShiroUtils.getLoginName());
        return appointmentDao.updateAppointment(area);
    }

    @Override
    public void changeStatus(Appointment appointment) {
        appointmentDao.updateAppointment(appointment);
    }


}
