package com.pepper.project.cm.community.mapper;

import com.pepper.project.cm.community.domain.Community;

import java.util.List;

public interface CommunityMapper {

    Community selectCommunityById(Integer id);
    List<Community> selectCommunityList(Community community);

    /**
     * 新增医院信息
     *
     * @param community 医院信息
     * @return 结果
     */
    public int insertCommunity(Community community);

    int deleteCommunityByIds(String[] ids);

    int updateCommunity(Community community);

}
