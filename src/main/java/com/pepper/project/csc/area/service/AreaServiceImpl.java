package com.pepper.project.csc.area.service;

import com.pepper.common.utils.security.ShiroUtils;
import com.pepper.common.utils.text.Convert;
import com.pepper.project.csc.area.domain.Area;
import com.pepper.project.csc.area.mapper.AreaMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class AreaServiceImpl implements IAreaService {

    @Autowired
    private AreaMapper areaDao;

    /**
     *  @Description: 列表查询
     *  @author: HanJieTao
     *  @mail: hjtxyr@163.com
     *  @Date: 2020/2/6 0:23
     */
    @Override
    public List<Area> selectAreaList(Area area) {
        return areaDao.selectAreaList(area);
    }

    @Override
    public int insertArea(Area area) {
        area.setCreateBy(ShiroUtils.getLoginName());
        area.setUpdateBy(ShiroUtils.getLoginName());
        return areaDao.insertArea(area);
    }

    @Override
    public int deleteAreaByIds(String ids) {
        return areaDao.deleteAreaByIds(Convert.toStrArray(ids));
    }

    @Override
    public Area selectAreaById(Integer id) {
        return areaDao.selectAreaById(id);
    }

    @Override
    public int updateArea(Area area) {
        area.setUpdateBy(ShiroUtils.getLoginName());
        return areaDao.updateArea(area);
    }


}
