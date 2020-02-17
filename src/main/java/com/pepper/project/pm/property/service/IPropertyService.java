package com.pepper.project.pm.property.service;

import com.pepper.project.pm.property.domain.Property;

import java.util.List;

public interface IPropertyService {

    List<Property> selectPropertyList(Property property);
    int insertProperty(Property property);

    int deletePropertyByIds(String ids);

    Property selectPropertyById(Integer id);

    int updateProperty(Property property);

}
