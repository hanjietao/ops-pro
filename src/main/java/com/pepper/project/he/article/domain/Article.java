package com.pepper.project.he.article.domain;

import com.pepper.framework.web.domain.BaseEntity;
import com.pepper.project.he.board.domain.Board;

import java.util.Date;

/**
 *  @Description: 宣教-宣教文章 he_article
 *  @author: HanJieTao
 *  @mail: hjtxyr@163.com
 *  @Date: 2020/2/6 16:10
 */
public class Article extends BaseEntity{

    private static final long serialVersionUID = 1L;

    /** 唯一键索引id */
    private Long id;

    private Integer boardId;

    /** 区域名称 */
    private String title;

    private String content;

    private Integer watchCount;

    private String sendPoint;

    private Long awardPoints;

    private String imgUrls;

    /** 区域状态（0正常 1关闭） */
    private String status;
    /** 区域状态（0正常 1删除） */
    private String deleteFlag;

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

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
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

    public Long getAwardPoints() {
        return awardPoints;
    }

    public void setAwardPoints(Long awardPoints) {
        this.awardPoints = awardPoints;
    }

    public String getImgUrls() {
        return imgUrls;
    }

    public void setImgUrls(String imgUrls) {
        this.imgUrls = imgUrls;
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
        return "Article{" +
                "id=" + id +
                ", boardId='" + boardId + '\'' +
                ", title='" + title + '\'' +
                ", content='" + content + '\'' +
                ", watchCount=" + watchCount +
                ", sendPoint=" + sendPoint +
                ", awardPoints=" + awardPoints +
                ", imgUrls=" + imgUrls +
                ", status='" + status + '\'' +
                ", deleteFlag='" + deleteFlag + '\'' +
                ", createTime=" + createTime +
                ", createBy='" + createBy + '\'' +
                ", updateTime=" + updateTime +
                ", updateBy='" + updateBy + '\'' +
                ", board='" + getBoard() + '\'' +
                '}';
    }
}
