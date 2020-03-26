package com.pepper.project.sm.friends.mapper;

import com.pepper.project.sm.friends.domain.Friends;

import java.util.List;

public interface FriendsMapper {
    public int updateFriends(Friends friends);

    public int deleteFriendsByIds(String[] toStrArray);

    public Friends selectFriendsById(Long id);

    public int insertFriends(Friends friends);

    public List<Friends> selectFriendsList(Friends friends);

    int updateFriendsCurrPoint(Friends friends);
}
