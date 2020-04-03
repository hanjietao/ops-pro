package com.pepper.project.csc.region.mapper;


import com.pepper.project.csc.region.domain.Region;

import java.util.List;

public interface RegionMapper {
    Region selectRegionById(Integer id);
    List<Region> selectRegionList(Region region);

    public int insertRegion(Region region);

    int deleteRegionByIds(String[] ids);

    int updateRegion(Region region);

    Region selectRegionByCityCodeAndLevel(Region region);

}
