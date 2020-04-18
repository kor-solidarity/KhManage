package com.kh.manage.project.model.vo;

import java.sql.Date;

public class ProjectWork {
	private String workNo;
	private String workName;
	private String status;
	private String projectNo;
	private Date beginDate;
	private Date completeDate;
	// 선행작업 번호
	private String precedeNo;
	private String completeRate;
	private String grantorNo;
	private String workLevel;
	private String highWorkNo;
	private String memo;
	private String workType;
	private String workStatus;
	// private String[]
	
	public ProjectWork() {
	}
	
	public ProjectWork(String workNo, String workName, String status, String projectNo,
					   Date beginDate, Date completeDate, String precedeNo, String completeRate,
					   String grantorNo, String workLevel, String highWorkNo, String memo,
					   String workType, String workStatus) {
		this.workNo = workNo;
		this.workName = workName;
		this.status = status;
		this.projectNo = projectNo;
		this.beginDate = beginDate;
		this.completeDate = completeDate;
		this.precedeNo = precedeNo;
		this.completeRate = completeRate;
		this.grantorNo = grantorNo;
		this.workLevel = workLevel;
		this.highWorkNo = highWorkNo;
		this.memo = memo;
		this.workType = workType;
		this.workStatus = workStatus;
	}
	
	@Override
	public String toString() {
		return "ProjectWork{" +
				"workNo='" + workNo + '\'' +
				", workName='" + workName + '\'' +
				", status='" + status + '\'' +
				", projectNo='" + projectNo + '\'' +
				", beginDate=" + beginDate +
				", completeDate=" + completeDate +
				", precedeNo='" + precedeNo + '\'' +
				", completeRate='" + completeRate + '\'' +
				", grantorNo='" + grantorNo + '\'' +
				", workLevel='" + workLevel + '\'' +
				", highWorkNo='" + highWorkNo + '\'' +
				", memo='" + memo + '\'' +
				", workType='" + workType + '\'' +
				", workStatus='" + workStatus + '\'' +
				'}';
	}
	
	public String getWorkNo() {
		return workNo;
	}
	
	public void setWorkNo(String workNo) {
		this.workNo = workNo;
	}
	
	public String getWorkName() {
		return workName;
	}
	
	public void setWorkName(String workName) {
		this.workName = workName;
	}
	
	public String getStatus() {
		return status;
	}
	
	public void setStatus(String status) {
		this.status = status;
	}
	
	public String getProjectNo() {
		return projectNo;
	}
	
	public void setProjectNo(String projectNo) {
		this.projectNo = projectNo;
	}
	
	public Date getBeginDate() {
		return beginDate;
	}
	
	public void setBeginDate(Date beginDate) {
		this.beginDate = beginDate;
	}
	
	public Date getCompleteDate() {
		return completeDate;
	}
	
	public void setCompleteDate(Date completeDate) {
		this.completeDate = completeDate;
	}
	
	public String getPrecedeNo() {
		return precedeNo;
	}
	
	public void setPrecedeNo(String precedeNo) {
		this.precedeNo = precedeNo;
	}
	
	public String getCompleteRate() {
		return completeRate;
	}
	
	public void setCompleteRate(String completeRate) {
		this.completeRate = completeRate;
	}
	
	public String getGrantorNo() {
		return grantorNo;
	}
	
	public void setGrantorNo(String grantorNo) {
		this.grantorNo = grantorNo;
	}
	
	public String getWorkLevel() {
		return workLevel;
	}
	
	public void setWorkLevel(String workLevel) {
		this.workLevel = workLevel;
	}
	
	public String getHighWorkNo() {
		return highWorkNo;
	}
	
	public void setHighWorkNo(String highWorkNo) {
		this.highWorkNo = highWorkNo;
	}
	
	public String getMemo() {
		return memo;
	}
	
	public void setMemo(String memo) {
		this.memo = memo;
	}
	
	public String getWorkType() {
		return workType;
	}
	
	public void setWorkType(String workType) {
		this.workType = workType;
	}
	
	public String getWorkStatus() {
		return workStatus;
	}
	
	public void setWorkStatus(String workStatus) {
		this.workStatus = workStatus;
	}
}
