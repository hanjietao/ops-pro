package com.pepper.project.csc.appointment.mapper;

import com.pepper.project.csc.appointment.domain.Appointment;

import java.util.List;

public interface AppointmentMapper {

    Appointment selectAppointmentById(Integer id);
    List<Appointment> selectAppointmentList(Appointment appointment);

    /**
     * 新增预约
     *
     * @param appointment 预约信息
     * @return 结果
     */
    public int insertAppointment(Appointment appointment);

    int deleteAppointmentByIds(String[] ids);

    int updateAppointment(Appointment appointment);

    void changeStatus(Integer id, String status);
}
