package com.pepper.project.csc.message.domain;

import com.pepper.framework.web.domain.BaseEntity;

import java.util.Date;

/**
 *  @Description: 系统消息
 *  @author: HanJieTao
 *  @mail: hjtxyr@163.com
 *  @Date: 2020/3/26 14:18
 */
public class SysMessage extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 唯一键索引id */
    private Long id;
    private Long sysUserId;
    private Long userId;

    /**SysMsgTypeConstant 0-system,1-merchant*/
    private String msgType;
    private String msgContent;

    /** 区域状态（0正常 1关闭） */
    private String status;

    public static long getSerialVersionUID() {
        return serialVersionUID;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Long getSysUserId() {
        return sysUserId;
    }

    public void setSysUserId(Long sysUserId) {
        this.sysUserId = sysUserId;
    }

    public Long getUserId() {
        return userId;
    }

    public void setUserId(Long userId) {
        this.userId = userId;
    }

    public String getMsgType() {
        return msgType;
    }

    public void setMsgType(String msgType) {
        this.msgType = msgType;
    }

    public String getMsgContent() {
        return msgContent;
    }

    public void setMsgContent(String msgContent) {
        this.msgContent = msgContent;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    @Override
    public String toString() {
        return "SysMessage{" +
                "id=" + id +
                ", sysUserId=" + sysUserId +
                ", userId=" + userId +
                ", msgType='" + msgType + '\'' +
                ", msgContent='" + msgContent + '\'' +
                ", status='" + status + '\'' +
                '}';
    }
}
