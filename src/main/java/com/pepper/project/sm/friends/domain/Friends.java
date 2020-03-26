package com.pepper.project.sm.friends.domain;

import com.pepper.framework.web.domain.BaseEntity;
import com.pepper.project.sm.user.domain.ClientUser;

import java.util.Date;

public class Friends extends BaseEntity {
    private static final long serialVersionUID = 1L;

    /** 唯一键索引id */
    private Long id;
    private Long userId;
    private Long friendUserId;

    /** 状态 0-正常已经好友，1-申请  ,2-被申请（等待同意），3-拒绝，4-删除*/
    private String status;

    private ClientUser clientUser;

    public static long getSerialVersionUID() {
        return serialVersionUID;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Long getUserId() {
        return userId;
    }

    public void setUserId(Long userId) {
        this.userId = userId;
    }

    public Long getFriendUserId() {
        return friendUserId;
    }

    public void setFriendUserId(Long friendUserId) {
        this.friendUserId = friendUserId;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public ClientUser getClientUser() {
        if(clientUser == null){
            clientUser = new ClientUser();
        }
        return clientUser;
    }

    public void setClientUser(ClientUser clientUser) {
        this.clientUser = clientUser;
    }

    @Override
    public String toString() {
        return "Friends{" +
                "id=" + id +
                ", userId=" + userId +
                ", friendUserId=" + friendUserId +
                ", status='" + status + '\'' +
                ", clientUser=" + clientUser +
                '}';
    }
}
