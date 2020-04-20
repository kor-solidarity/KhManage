package com.kh.manage.infoBoard.model.vo;

import java.sql.Date;

import org.springframework.stereotype.Component;

@Component
public class Reply {
	
	private String replyNo;
	private String replyContent;
	private Date createDate;
	private Date modifyDate;
	private String status;
	private String memberNo;
	private String forumNo;
	
	public Reply() {}
	
	public Reply(String replyNo, String replyContent, Date createDate, Date modifyDate, String status, String memberNo,
			String forumNo) {
		super();
		this.replyNo = replyNo;
		this.replyContent = replyContent;
		this.createDate = createDate;
		this.modifyDate = modifyDate;
		this.status = status;
		this.memberNo = memberNo;
		this.forumNo = forumNo;
	}
	@Override
	public String toString() {
		return "Reply [replyNo=" + replyNo + ", replyContent=" + replyContent + ", createDate=" + createDate
				+ ", modifyDate=" + modifyDate + ", status=" + status + ", memberNo=" + memberNo + ", forumNo="
				+ forumNo + "]";
	}
	public String getReplyNo() {
		return replyNo;
	}
	public void setReplyNo(String replyNo) {
		this.replyNo = replyNo;
	}
	public String getReplyContent() {
		return replyContent;
	}
	public void setReplyContent(String replyContent) {
		this.replyContent = replyContent;
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
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getMemberNo() {
		return memberNo;
	}
	public void setMemberNo(String memberNo) {
		this.memberNo = memberNo;
	}
	public String getForumNo() {
		return forumNo;
	}
	public void setForumNo(String forumNo) {
		this.forumNo = forumNo;
	}
	
	
}
