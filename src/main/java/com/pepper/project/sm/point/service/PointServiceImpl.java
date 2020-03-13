package com.pepper.project.sm.point.service;

import com.pepper.common.utils.security.ShiroUtils;
import com.pepper.common.utils.text.Convert;
import com.pepper.project.sm.point.domain.Point;
import com.pepper.project.sm.point.mapper.PointMapper;
import com.pepper.project.sm.user.service.IClientUserService;
import com.pepper.project.system.user.service.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class PointServiceImpl implements IPointService {
    @Autowired
    private PointMapper pointDao;

    @Autowired
    private IUserService userService;

    @Autowired
    private IClientUserService clientUserService;

    /**
     *  @Description: 列表查询
     *  @author: HanJieTao
     *  @mail: hjtxyr@163.com
     *  @Date: 2020/2/6 0:23
     */
    @Override
    public List<Point> selectPointList(Point guide) {

        List<Point> list = pointDao.selectPointList(guide);
        return list;
    }

    @Override
    public int insertPoint(Point point) {
        point.setCreateBy(ShiroUtils.getLoginName());
        point.setUpdateBy(ShiroUtils.getLoginName());
        return pointDao.insertPoint(point);
    }

    @Override
    public int deletePointByIds(String ids) {
        return pointDao.deletePointByIds(Convert.toStrArray(ids));
    }

    @Override
    public Point selectPointById(Integer id) {
        return pointDao.selectPointById(id);
    }

    @Override
    public int updatePoint(Point point) {
        point.setUpdateBy(ShiroUtils.getLoginName());
        return pointDao.updatePoint(point);
    }

    @Override
    public List<Point> selectPointListByUserId(Long userId) {
        return pointDao.selectPointListByUserId(userId);
    }


}
