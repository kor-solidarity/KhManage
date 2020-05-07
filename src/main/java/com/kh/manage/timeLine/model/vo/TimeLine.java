package com.kh.manage.timeLine.model.vo;

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
	private int sec;
	private int min;
	private int hour;
	private int day;
	
	public TimeLine() {}

	public TimeLine(String timeLineNo, String memberNo, String memberName, String content, String enrollDate,
			String status, String aStatus, String changeName, String userChangeName, int sec, int min, int hour,
			int day) {
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
				+ ", changeName=" + changeName + ", userChangeName=" + userChangeName + ", sec=" + sec + ", min=" + min
				+ ", hour=" + hour + ", day=" + day + "]";
	}

	
}
