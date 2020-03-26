package com.pepper.project.sm.friends.service;


import com.pepper.framework.web.domain.AjaxResult;
import com.pepper.project.sm.friends.domain.Friends;

import java.util.List;

public interface IFriendsService {

    List<Friends> selectFriendsList(Friends friends);
    int insertFriends(Friends friends);

    int deleteFriendsByIds(String ids);

    Friends selectFriendsById(Long userId);

    int updateFriends(Friends friends);

    int updateFriendsPoint(Friends friends);

    AjaxResult applyFriends(Long userId, Long friendUserId);

    AjaxResult agreeApply(Long id, Long userId);
}
