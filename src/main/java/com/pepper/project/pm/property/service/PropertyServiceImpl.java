package com.pepper.project.pm.property.service;

import com.pepper.common.utils.security.ShiroUtils;
import com.pepper.common.utils.text.Convert;
import com.pepper.framework.aspectj.lang.annotation.DataScope;
import com.pepper.project.csc.area.domain.Area;
import com.pepper.project.csc.area.mapper.AreaMapper;
import com.pepper.project.csc.region.domain.Region;
import com.pepper.project.csc.region.mapper.RegionMapper;
import com.pepper.project.pm.property.domain.Property;
import com.pepper.project.pm.property.mapper.PropertyMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class PropertyServiceImpl implements IPropertyService {

    @Autowired
    private PropertyMapper propertyDao;

    @Autowired
    private AreaMapper areaDao;

    @Autowired
    private RegionMapper regionDao;

    /**
     *  @Description: 列表查询
     *  @author: HanJieTao
     *  @mail: hjtxyr@163.com
     *  @Date: 2020/2/6 0:23
     */
    @DataScope(areaAlias = "a", propertyAlias = "p")
    public List<Property> selectPropertyList(Property property) {

        List<Property> list = propertyDao.selectPropertyList(property);
        for (Property hos:list) {
            Area area = areaDao.selectAreaById(Long.valueOf(hos.getAreaId()));
            hos.setAreaName(area.getAreaName());
        }
        return list;
    }

    @Override
    public int insertProperty(Property area) {
        area.setCreateBy(ShiroUtils.getLoginName());
        area.setUpdateBy(ShiroUtils.getLoginName());
        return propertyDao.insertProperty(area);
    }

    @Override
    public int deletePropertyByIds(String ids) {
        return propertyDao.deletePropertyByIds(Convert.toStrArray(ids));
    }

    @Override
    public Property selectPropertyById(Long id) {
        return propertyDao.selectPropertyById(id);
    }

    @Override
    public int updateProperty(Property property) {
        Region region = new Region();
        region.setLevel(2);

        region.setCityCode(property.getCityCode());
        Region regionCity = regionDao.selectRegionByCityCodeAndLevel(region);
        property.setCity(regionCity.getId().toString());
        property.setProvince(regionCity.getPid().toString());

        property.setUpdateBy(ShiroUtils.getLoginName());
        return propertyDao.updateProperty(property);
    }


}
