package com.pepper.project.pm.property.mapper;

import com.pepper.project.pm.property.domain.Property;

import java.util.List;

public interface PropertyMapper {

    Property selectPropertyById(Long id);
    List<Property> selectPropertyList(Property property);

    /**
     * 新增医院信息
     *
     * @param property 医院信息
     * @return 结果
     */
    public int insertProperty(Property property);

    int deletePropertyByIds(String[] ids);

    int updateProperty(Property property);

}
