package com.pepper.project.csc.area.mapper;

import com.pepper.project.csc.area.domain.Area;

import java.util.List;

public interface AreaMapper {
    Area selectAreaById(Long id);
    List<Area> selectAreaList(Area area);

    /**
     * 新增区域信息
     *
     * @param area 区域信息
     * @return 结果
     */
    public int insertArea(Area area);

    int deleteAreaByIds(String[] ids);

    int updateArea(Area area);
}
