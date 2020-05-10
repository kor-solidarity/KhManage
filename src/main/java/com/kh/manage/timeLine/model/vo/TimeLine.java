package com.kh.manage.timeLine.model.vo;

import java.util.List;

public class TimeLine {
	private String timeLineNo;
	private String memberNo;
	private String memberName;
	private String content;
	private String enrollDate;
	private String status;
	private String aStatus;
	private String changeName;
	private String userChangeName;
	private String tagNo;
	private String tagName;
	private List<Tag> tagList;
	private List<TimeLine> timeLine;
	private List<Comment> tc;
	private int sec;
	private int min;
	private int hour;
	private int day;
	
	public TimeLine() {}

	public TimeLine(String timeLineNo, String memberNo, String memberName, String content, String enrollDate,
			String status, String aStatus, String changeName, String userChangeName, String tagNo, String tagName,
			List<Tag> tagList, List<TimeLine> timeLine, List<Comment> tc, int sec, int min, int hour, int day) {
		super();
		this.timeLineNo = timeLineNo;
		this.memberNo = memberNo;
		this.memberName = memberName;
		this.content = content;
		this.enrollDate = enrollDate;
		this.status = status;
		this.aStatus = aStatus;
		this.changeName = changeName;
		this.userChangeName = userChangeName;
		this.tagNo = tagNo;
		this.tagName = tagName;
		this.tagList = tagList;
		this.timeLine = timeLine;
		this.tc = tc;
		this.sec = sec;
		this.min = min;
		this.hour = hour;
		this.day = day;
	}

	public String getTimeLineNo() {
		return timeLineNo;
	}

	public void setTimeLineNo(String timeLineNo) {
		this.timeLineNo = timeLineNo;
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

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
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

	public String getaStatus() {
		return aStatus;
	}

	public void setaStatus(String aStatus) {
		this.aStatus = aStatus;
	}

	public String getChangeName() {
		return changeName;
	}

	public void setChangeName(String changeName) {
		this.changeName = changeName;
	}

	public String getUserChangeName() {
		return userChangeName;
	}

	public void setUserChangeName(String userChangeName) {
		this.userChangeName = userChangeName;
	}

	public String getTagNo() {
		return tagNo;
	}

	public void setTagNo(String tagNo) {
		this.tagNo = tagNo;
	}

	public String getTagName() {
		return tagName;
	}

	public void setTagName(String tagName) {
		this.tagName = tagName;
	}

	public List<Tag> getTagList() {
		return tagList;
	}

	public void setTagList(List<Tag> tagList) {
		this.tagList = tagList;
	}

	public List<TimeLine> getTimeLine() {
		return timeLine;
	}

	public void setTimeLine(List<TimeLine> timeLine) {
		this.timeLine = timeLine;
	}

	public List<Comment> getTc() {
		return tc;
	}

	public void setTc(List<Comment> tc) {
		this.tc = tc;
	}

	public int getSec() {
		return sec;
	}

	public void setSec(int sec) {
		this.sec = sec;
	}

	public int getMin() {
		return min;
	}

	public void setMin(int min) {
		this.min = min;
	}

	public int getHour() {
		return hour;
	}

	public void setHour(int hour) {
		this.hour = hour;
	}

	public int getDay() {
		return day;
	}

	public void setDay(int day) {
		this.day = day;
	}

	@Override
	public String toString() {
		return "TimeLine [timeLineNo=" + timeLineNo + ", memberNo=" + memberNo + ", memberName=" + memberName
				+ ", content=" + content + ", enrollDate=" + enrollDate + ", status=" + status + ", aStatus=" + aStatus
				+ ", changeName=" + changeName + ", userChangeName=" + userChangeName + ", tagNo=" + tagNo
				+ ", tagName=" + tagName + ", tagList=" + tagList + ", timeLine=" + timeLine + ", tc=" + tc + ", sec="
				+ sec + ", min=" + min + ", hour=" + hour + ", day=" + day + "]";
	}

	
}
