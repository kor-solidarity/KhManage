package com.kh.manage.infoBoard.model.vo;

import java.sql.Date;

public class InfoBoard implements java.io.Serializable {

	private String boardNo;
	private String boardTitle;
	private String boardContent;
	private Date createDate;
	private Date modifyDate;
	private int viewCount;
	private String memberNo;
	private String status;
	
	public InfoBoard() {} 
	
	public InfoBoard(String boardNo, String boardTitle, String boardContent, Date createDate, Date modifyDate,
			int viewCount, String memberNo, String status) {
		super();
		this.boardNo = boardNo;
		this.boardTitle = boardTitle;
		this.boardContent = boardContent;
		this.createDate = createDate;
		this.modifyDate = modifyDate;
		this.viewCount = viewCount;
		this.memberNo = memberNo;
		this.status = status;
	}
	public String getBoardNo() {
		return boardNo;
	}
	public void setBoardNo(String boardNo) {
		this.boardNo = boardNo;
	}
	public String getBoardTitle() {
		return boardTitle;
	}
	public void setBoardTitle(String boardTitle) {
		this.boardTitle = boardTitle;
	}
	public String getBoardContent() {
		return boardContent;
	}
	public void setBoardContent(String boardContent) {
		this.boardContent = boardContent;
	}
	public Date getCreateDate() {
		return createDate;
	}
	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}
	public Date getModifyDate() {
		return modifyDate;
	}
	public void setModifyDate(Date modifyDate) {
		this.modifyDate = modifyDate;
	}
	public int getViewCount() {
		return viewCount;
	}
	public void setViewCount(int viewCount) {
		this.viewCount = viewCount;
	}
	public String getMemberNo() {
		return memberNo;
	}
	public void setMemberNo(String memberNo) {
		this.memberNo = memberNo;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	@Override
	public String toString() {
		return "InfoBoard [boardNo=" + boardNo + ", boardTitle=" + boardTitle + ", boardContent=" + boardContent
				+ ", createDate=" + createDate + ", modifyDate=" + modifyDate + ", viewCount=" + viewCount
				+ ", memberNo=" + memberNo + ", status=" + status + "]";
	}
	
	

}