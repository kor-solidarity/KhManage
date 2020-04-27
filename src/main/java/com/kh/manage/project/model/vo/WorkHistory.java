package com.kh.manage.project.model.vo;

import java.sql.Date;

public class WorkHistory {
	private String workHistoryNo;
	private String workNo;
	private String status;
	private String memo;
	private Date modifyDate;
	private String projectTeamNo;
	// 테이블 여기까지
	
	// 멤버 관련
	private String rankName;
	private String deptName;
	private String memberName;
	
	public WorkHistory() {
	}
	
	public WorkHistory(String workHistoryNo, String workNo, String status,
					   String memo, Date modifyDate, String projectTeamNo,
					   String rankName, String deptName, String memberName) {
		this.workHistoryNo = workHistoryNo;
		this.workNo = workNo;
		this.status = status;
		this.memo = memo;
		this.modifyDate = modifyDate;
		this.projectTeamNo = projectTeamNo;
		this.rankName = rankName;
		this.deptName = deptName;
		this.memberName = memberName;
	}
	
	@Override
	public String toString() {
		return "WorkHistory{" +
				"workHistoryNo='" + workHistoryNo + '\'' +
				", workNo='" + workNo + '\'' +
				", status='" + status + '\'' +
				", memo='" + memo + '\'' +
				", modifyDate=" + modifyDate +
				", projectTeamNo='" + projectTeamNo + '\'' +
				", rankName='" + rankName + '\'' +
				", deptName='" + deptName + '\'' +
				", memberName='" + memberName + '\'' +
				'}';
	}
	
	public String getWorkHistoryNo() {
		return workHistoryNo;
	}
	
	public void setWorkHistoryNo(String workHistoryNo) {
		this.workHistoryNo = workHistoryNo;
	}
	
	public String getWorkNo() {
		return workNo;
	}
	
	public void setWorkNo(String workNo) {
		this.workNo = workNo;
	}
	
	public String getStatus() {
		return status;
	}
	
	public void setStatus(String status) {
		this.status = status;
	}
	
	public String getMemo() {
		return memo;
	}
	
	public void setMemo(String memo) {
		this.memo = memo;
	}
	
	public Date getModifyDate() {
		return modifyDate;
	}
	
	public void setModifyDate(Date modifyDate) {
		this.modifyDate = modifyDate;
	}
	
	public String getProjectTeamNo() {
		return projectTeamNo;
	}
	
	public void setProjectTeamNo(String projectTeamNo) {
		this.projectTeamNo = projectTeamNo;
	}
	
	public String getRankName() {
		return rankName;
	}
	
	public void setRankName(String rankName) {
		this.rankName = rankName;
	}
	
	public String getDeptName() {
		return deptName;
	}
	
	public void setDeptName(String deptName) {
		this.deptName = deptName;
	}
	
	public String getMemberName() {
		return memberName;
	}
	
	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}
}
