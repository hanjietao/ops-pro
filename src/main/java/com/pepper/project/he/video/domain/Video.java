package com.pepper.project.he.video.domain;

import com.pepper.framework.web.domain.BaseEntity;
import com.pepper.project.he.board.domain.Board;

import java.util.Date;

/**
 *  @Description: 社区服务服务中心-医院介绍 cm_community
 *  @author: HanJieTao
 *  @mail: hjtxyr@163.com
 *  @Date: 2020/2/6 16:10
 */
public class Video extends BaseEntity{

    private static final long serialVersionUID = 1L;

    /** 唯一键索引id */
    private Long id;

    private Integer boardId;

    /** 区域码Code */
    private String title;

    /** 区域名称 */
    private String videoUrl;

    private Long watchCount;

    private String sendPoint;

    private Long awardPoints;

    /** 区域状态（0正常 1关闭） */
    private String status;
    /** 区域状态（0正常 1删除） */
    private String deleteFlag;


    private Board board;


    public static long getSerialVersionUID() {
        return serialVersionUID;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Integer getBoardId() {
        return boardId;
    }

    public void setBoardId(Integer boardId) {
        this.boardId = boardId;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getVideoUrl() {
        return videoUrl;
    }

    public void setVideoUrl(String videoUrl) {
        this.videoUrl = videoUrl;
    }

    public Long getWatchCount() {
        return watchCount;
    }

    public void setWatchCount(Long watchCount) {
        this.watchCount = watchCount;
    }

    public String getSendPoint() {
        return sendPoint;
    }

    public void setSendPoint(String sendPoint) {
        this.sendPoint = sendPoint;
    }

    public Long getAwardPoints() {
        return awardPoints;
    }

    public void setAwardPoints(Long awardPoints) {
        this.awardPoints = awardPoints;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getDeleteFlag() {
        return deleteFlag;
    }

    public void setDeleteFlag(String deleteFlag) {
        this.deleteFlag = deleteFlag;
    }

    public Board getBoard() {
        if(board == null){
            board = new Board();
        }
        return board;
    }

    public void setBoard(Board board) {
        this.board = board;
    }

    @Override
    public String toString() {
        return "Video{" +
                "id=" + id +
                ", boardId=" + boardId +
                ", title='" + title + '\'' +
                ", videoUrl='" + videoUrl + '\'' +
                ", watchCount=" + watchCount +
                ", sendPoint=" + sendPoint +
                ", awardPoints=" + awardPoints +
                ", status='" + status + '\'' +
                ", deleteFlag='" + deleteFlag + '\'' +
                ", board=" + getBoard() +
                '}';
    }
}
