package com.pepper.project.csc.appointment.service;

import com.pepper.project.csc.appointment.domain.Appointment;

import java.util.List;

public interface IAppointmentService {

    List<Appointment> selectAppointmentList(Appointment appointment);
    int insertAppointment(Appointment appointment);

    int deleteAppointmentByIds(String ids);

    Appointment selectAppointmentById(Integer id);

    int updateAppointment(Appointment appointment);

    void changeStatus(Appointment appointment);
}
