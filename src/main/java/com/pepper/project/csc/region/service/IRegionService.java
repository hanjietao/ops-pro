package com.pepper.project.csc.region.service;

import com.pepper.project.csc.region.domain.Region;

import java.util.List;

public interface IRegionService {

    List<Region> selectRegionList(Region region);
    int insertRegion(Region region);

    int deleteRegionByIds(String ids);

    Region selectRegionById(Integer id);

    int updateRegion(Region region);

    Object selectRegionListByHosId(Long id);
}
