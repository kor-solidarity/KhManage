package com.kh.manage.infoBoard.model.vo;

import java.sql.Date;

import org.springframework.stereotype.Component;

@Component
public class BoReply implements java.io.Serializable {
	
	private String replyNo;
	private String replyContent;
	private String createDate;
	private String modifyDate;
	private String status;
	private String memberNo;
	private String memberName;
	private String forumNo;
	
	public BoReply() {}

	public BoReply(String replyNo, String replyContent, String createDate, String modifyDate, String status,
			String memberNo, String memberName, String forumNo) {
		super();
		this.replyNo = replyNo;
		this.replyContent = replyContent;
		this.createDate = createDate;
		this.modifyDate = modifyDate;
		this.status = status;
		this.memberNo = memberNo;
		this.memberName = memberName;
		this.forumNo = forumNo;
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

	public String getMemberName() {
		return memberName;
	}

	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}

	public String getForumNo() {
		return forumNo;
	}

	public void setForumNo(String forumNo) {
		this.forumNo = forumNo;
	}

	@Override
	public String toString() {
		return "BoReply [replyNo=" + replyNo + ", replyContent=" + replyContent + ", createDate=" + createDate
				+ ", modifyDate=" + modifyDate + ", status=" + status + ", memberNo=" + memberNo + ", memberName="
				+ memberName + ", forumNo=" + forumNo + "]";
	}

		
	
}
