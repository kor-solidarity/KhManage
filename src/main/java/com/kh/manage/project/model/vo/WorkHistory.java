package com.kh.manage.project.model.vo;

import java.sql.Date;

public class WorkHistory {
	private String workHistoryNo;
	private String workNo;
	private String status;
	private String memo;
	private Date modifyDate;
	private String projectTeamNo;
	
	public WorkHistory() {
	}
	
	public WorkHistory(String workHistoryNo, String workNo, String status,
					   String memo, Date modifyDate, String projectTeamNo) {
		this.workHistoryNo = workHistoryNo;
		this.workNo = workNo;
		this.status = status;
		this.memo = memo;
		this.modifyDate = modifyDate;
		this.projectTeamNo = projectTeamNo;
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
}
