package com.pepper.project.sm.point.service;

import com.pepper.framework.web.domain.AjaxResult;
import com.pepper.project.sm.point.domain.Point;

import java.util.List;

public interface IPointService {
    List<Point> selectPointList(Point point);
    int insertPoint(Point point);

    AjaxResult sendPoint(Point point,Long merchantId);

    int deletePointByIds(String ids);

    Point selectPointById(Integer id);

    int updatePoint(Point point);

    List<Point> selectPointListByUserId(Long userId);
}
