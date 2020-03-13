package com.pepper.project.sm.point.mapper;

import com.pepper.project.sm.point.domain.Point;

import java.util.List;

public interface PointMapper {
    Point selectPointById(Integer id);

    List<Point> selectPointList(Point point);

    public int insertPoint(Point point);

    int deletePointByIds(String[] ids);

    int updatePoint(Point point);

    List<Point> selectPointListByUserId(Long userId);
}
