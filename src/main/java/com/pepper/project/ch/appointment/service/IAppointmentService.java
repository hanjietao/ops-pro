package com.pepper.project.ch.appointment.service;

import com.pepper.project.ch.appointment.domain.Appointment;

import java.util.List;

public interface IAppointmentService {

    List<Appointment> selectAppointmentList(Appointment appointment);
    int insertAppointment(Appointment appointment);

    int deleteAppointmentByIds(String ids);

    Appointment selectAppointmentById(Long id);

    int updateAppointment(Appointment appointment);

    void changeStatus(Appointment appointment);
}
