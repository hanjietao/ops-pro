package com.pepper.project.cm.community.mapper;

import com.pepper.project.cm.community.domain.Community;

import java.util.List;

public interface CommunityMapper {

    Community selectCommunityById(Long id);
    List<Community> selectCommunityList(Community community);

    public int insertCommunity(Community community);

    int deleteCommunityByIds(String[] ids);

    int updateCommunity(Community community);

}
