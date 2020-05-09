package com.kh.manage.timeLine.model.vo;

public class Comment {
	private String timeLineNo;
	private String tCommentNo;
	private String highComment;
	private int tcLevel;
	private String tcContent;
	private String memberNo;
	private String memberName;
	private String enrollDate;
	private String status;
	
	public Comment() {}

	public Comment(String timeLineNo, String tCommentNo, String highComment, int tcLevel, String tcContent,
			String memberNo, String memberName, String enrollDate, String status) {
		super();
		this.timeLineNo = timeLineNo;
		this.tCommentNo = tCommentNo;
		this.highComment = highComment;
		this.tcLevel = tcLevel;
		this.tcContent = tcContent;
		this.memberNo = memberNo;
		this.memberName = memberName;
		this.enrollDate = enrollDate;
		this.status = status;
	}

	public String getTimeLineNo() {
		return timeLineNo;
	}

	public void setTimeLineNo(String timeLineNo) {
		this.timeLineNo = timeLineNo;
	}

	public String gettCommentNo() {
		return tCommentNo;
	}

	public void settCommentNo(String tCommentNo) {
		this.tCommentNo = tCommentNo;
	}

	public String getHighComment() {
		return highComment;
	}

	public void setHighComment(String highComment) {
		this.highComment = highComment;
	}

	public int getTcLevel() {
		return tcLevel;
	}

	public void setTcLevel(int tcLevel) {
		this.tcLevel = tcLevel;
	}

	public String getTcContent() {
		return tcContent;
	}

	public void setTcContent(String tcContent) {
		this.tcContent = tcContent;
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

	public String getEnrollDate() {
		return enrollDate;
	}

	public void setEnrollDate(String enrollDate) {
		this.enrollDate = enrollDate;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	@Override
	public String toString() {
		return "Comment [timeLineNo=" + timeLineNo + ", tCommentNo=" + tCommentNo + ", highComment=" + highComment
				+ ", tcLevel=" + tcLevel + ", tcContent=" + tcContent + ", memberNo=" + memberNo + ", memberName="
				+ memberName + ", enrollDate=" + enrollDate + ", status=" + status + "]";
	}

	
}
