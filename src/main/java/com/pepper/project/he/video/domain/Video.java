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
    private Integer id;

    private Integer boardId;

    /** 区域码Code */
    private String title;

    /** 区域名称 */
    private String videoUrl;

    private Integer watchCount;

    private String sendPoint;

    private Integer awardPoints;

    /** 区域状态（0正常 1关闭） */
    private String status;

    /** 创建时间 */
    private Date createTime;

    /** 创建人 */
    private String createBy;

    /** 更新时间 */
    private Date updateTime;

    /** 更新人 */
    private String updateBy;

    private Board board;


    public static long getSerialVersionUID() {
        return serialVersionUID;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
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

    public Integer getWatchCount() {
        return watchCount;
    }

    public void setWatchCount(Integer watchCount) {
        this.watchCount = watchCount;
    }

    public String getSendPoint() {
        return sendPoint;
    }

    public void setSendPoint(String sendPoint) {
        this.sendPoint = sendPoint;
    }

    public Integer getAwardPoints() {
        return awardPoints;
    }

    public void setAwardPoints(Integer awardPoints) {
        this.awardPoints = awardPoints;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    @Override
    public Date getCreateTime() {
        return createTime;
    }

    @Override
    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    @Override
    public String getCreateBy() {
        return createBy;
    }

    @Override
    public void setCreateBy(String createBy) {
        this.createBy = createBy;
    }

    @Override
    public Date getUpdateTime() {
        return updateTime;
    }

    @Override
    public void setUpdateTime(Date updateTime) {
        this.updateTime = updateTime;
    }

    @Override
    public String getUpdateBy() {
        return updateBy;
    }

    @Override
    public void setUpdateBy(String updateBy) {
        this.updateBy = updateBy;
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
                ", createTime=" + createTime +
                ", createBy='" + createBy + '\'' +
                ", updateTime=" + updateTime +
                ", updateBy='" + updateBy + '\'' +
                ", board=" + getBoard() +
                '}';
    }
}
