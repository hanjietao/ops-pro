package com.pepper.project.csc.area.service;

import com.pepper.project.csc.area.domain.Area;

import java.util.List;

public interface IAreaService {

    List<Area> selectAreaList(Area area);
    int insertArea(Area area);

    int deleteAreaByIds(String ids);

    Area selectAreaById(Integer id);

    int updateArea(Area area);

    Object selectAreaListByHosId( Integer id);
}
