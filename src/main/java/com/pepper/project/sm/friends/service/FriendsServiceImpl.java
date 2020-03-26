package com.pepper.project.sm.friends.service;

import com.pepper.common.utils.security.ShiroUtils;
import com.pepper.common.utils.text.Convert;
import com.pepper.framework.web.domain.AjaxResult;
import com.pepper.project.sm.friends.domain.Friends;
import com.pepper.project.sm.friends.mapper.FriendsMapper;
import com.pepper.project.sm.user.domain.ClientUser;
import com.pepper.project.sm.user.service.IClientUserService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import com.pepper.common.constant.FriendsStatusEnum;

@Service
public class FriendsServiceImpl implements IFriendsService {
    Logger logger = LoggerFactory.getLogger(FriendsServiceImpl.class);

    @Autowired
    private FriendsMapper friendsDao;

    @Autowired
    private IClientUserService clientUserService;

    @Override
    public List<Friends> selectFriendsList(Friends friends) {
        List<Friends> list = friendsDao.selectFriendsList(friends);
        return list;
    }

    @Override
    public int insertFriends(Friends friends) {
        friends.setCreateBy(ShiroUtils.getLoginName());
        friends.setUpdateBy(ShiroUtils.getLoginName());
        return friendsDao.insertFriends(friends);
    }

    @Override
    public int deleteFriendsByIds(String ids) {
        return friendsDao.deleteFriendsByIds(Convert.toStrArray(ids));
    }

    @Override
    public Friends selectFriendsById(Long id) {
        return friendsDao.selectFriendsById(id);
    }

    @Override
    public int updateFriends(Friends friends) {
        friends.setUpdateBy(ShiroUtils.getLoginName());
        return friendsDao.updateFriends(friends);
    }

    @Override
    public int updateFriendsPoint(Friends friends) {
        return friendsDao.updateFriendsCurrPoint(friends);
    }

    @Override
    @Transactional
    public AjaxResult applyFriends(Long userId, Long friendUserId) {
        ClientUser friendUserUser = clientUserService.selectClientUserById(friendUserId);
        if(friendUserUser == null){
            AjaxResult.error("目标用户不存在！");
        }
        Friends friends = new Friends();
        friends.setUserId(userId);
        friends.setFriendUserId(friendUserId);
        List<Friends> list = friendsDao.selectFriendsList(friends);
        if(list.size() > 1){
            return AjaxResult.error("数据异常！");
        }
        int listSize = list.size();
        if(listSize == 1){
            // 说明有记录
            friends = list.get(0);
            Friends friends1 = new Friends();
            friends1.setFriendUserId(userId);
            friends1.setUserId(friendUserId);
            List<Friends> list1 = friendsDao.selectFriendsList(friends);

            if(list1.size() != 1){
                return AjaxResult.error("数据异常！");
            }
            friends1 = list1.get(0);
            if(friends1.getStatus().equals(String.valueOf(FriendsStatusEnum.waitagree.getType()))){
                return AjaxResult.success("申请已经提交，等待对方同意，请勿重复申请！");
            }else{
                return AjaxResult.success("申请失败！");
            }
        }else if(listSize == 0){
            Friends frd = new Friends();
            frd.setFriendUserId(userId);
            frd.setUserId(friendUserId);
            frd.setStatus(FriendsStatusEnum.waitagree.getType().toString());
            friendsDao.insertFriends(frd);
            friends.setFriendUserId(userId);
            friends.setUserId(friendUserId);
            friends.setStatus(FriendsStatusEnum.apply.getType().toString());
            friendsDao.insertFriends(friends);
            return AjaxResult.success("申请已提交，等待对方同意！");
        }else{
            return AjaxResult.error("数据异常！");
        }
    }

    @Override
    @Transactional
    public AjaxResult agreeApply(Long id, Long userId){
        Friends friends = friendsDao.selectFriendsById(id);
        if(friends == null){
            return AjaxResult.error("该条申请不存在！");
        }
        if(friends.getUserId() != userId){
            return AjaxResult.error("数据异常，请刷新重试！");
        }
        Friends friends1 = new Friends();
        friends1.setUserId(friends.getFriendUserId());
        friends1.setFriendUserId(userId);
        List<Friends> list = friendsDao.selectFriendsList(friends1);
        if(list.size() == 0){
            return AjaxResult.error("数据异常 ！");
        }else if(list.size() == 1){
            friends1 = list.get(0);
            friends1.setStatus("0");
            friendsDao.updateFriends(friends1);
            friends.setStatus("0");
            friendsDao.updateFriends(friends);
            return AjaxResult.success("操作成功！");
        }else{
            return AjaxResult.error("数据异常，请刷新重试！");
        }

    }
}
