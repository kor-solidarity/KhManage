package com.kh.manage.infoBoard.model.vo;

import java.sql.Date;

public class InfoBoard implements java.io.Serializable {

	private String boardNo;
	private String boardTitle;
	private String boardContent;
	private String createDate;
	private String modifyDate;
	private int viewCount;
	private String memberNo;
	private String memberName;
	private String status;
	
	public InfoBoard() {}

	public InfoBoard(String boardNo, String boardTitle, String boardContent, String createDate, String modifyDate,
			int viewCount, String memberNo, String memberName, String status) {
		super();
		this.boardNo = boardNo;
		this.boardTitle = boardTitle;
		this.boardContent = boardContent;
		this.createDate = createDate;
		this.modifyDate = modifyDate;
		this.viewCount = viewCount;
		this.memberNo = memberNo;
		this.memberName = memberName;
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

	public String getCreateDate() {
		return createDate;
	}

	public void setCreateDate(String createDate) {
		this.createDate = createDate;
	}

	public String getModifyDate() {
		return modifyDate;
	}

	public void setModifyDate(String modifyDate) {
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

	public String getMemberName() {
		return memberName;
	}

	public void setMemberName(String memberName) {
		this.memberName = memberName;
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
				+ ", memberNo=" + memberNo + ", memberName=" + memberName + ", status=" + status + "]";
	}

	

}