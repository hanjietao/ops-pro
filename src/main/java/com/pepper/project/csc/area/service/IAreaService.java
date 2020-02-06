package com.pepper.project.csc.area.service;

import com.pepper.project.csc.area.domain.Area;

import java.util.List;

public interface IAreaService {

    List<Area> selectAreaList(Area area);
    int insertArea(Area area);

}
