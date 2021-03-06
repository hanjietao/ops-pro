package com.pepper.project.cm.community.service;

import com.pepper.project.cm.community.domain.Community;

import java.util.List;

public interface ICommunityService {

    List<Community> selectCommunityList(Community community);
    int insertCommunity(Community community);

    int deleteCommunityByIds(String ids);

    Community selectCommunityById(Long id);

    int updateCommunity(Community community);

    List<Community> selectCommunityListByHospitalId(Long hospitalId);
}
