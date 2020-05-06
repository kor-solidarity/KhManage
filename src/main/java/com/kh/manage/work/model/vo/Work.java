package com.kh.manage.work.model.vo;

import java.sql.Date;
import java.util.ArrayList;

import com.fasterxml.jackson.annotation.JsonFormat;



public class Work implements java.io.Serializable{
	private String workNo;
	private String workName;
	private String status;
	private String projectNo;
	private String projectName;
	@JsonFormat(pattern="yyyy-MM-dd", timezone="Asia/Seoul")
	private Date beginDate;
	@JsonFormat(pattern="yyyy-MM-dd", timezone="Asia/Seoul")
	private Date completeDate;
	private String precedeNo;
	private String completeRate;
	private String grantorNo;
	private String workLevel;
	private String highWorkNo;
	private String highWorkName;
	private String memo;
	private String workType;
	private String memberNo;
	private String workStatus;
	private ArrayList<WorkAttachment> workAttachment;
	
	public Work() {}

	public Work(String workNo, String workName, String status, String projectNo, String projectName, Date beginDate,
			Date completeDate, String precedeNo, String completeRate, String grantorNo, String workLevel,
			String highWorkNo, String highWorkName, String memo, String workType, String memberNo, String workStatus,
			ArrayList<WorkAttachment> workAttachment) {
		super();
		this.workNo = workNo;
		this.workName = workName;
		this.status = status;
		this.projectNo = projectNo;
		this.projectName = projectName;
		this.beginDate = beginDate;
		this.completeDate = completeDate;
		this.precedeNo = precedeNo;
		this.completeRate = completeRate;
		this.grantorNo = grantorNo;
		this.workLevel = workLevel;
		this.highWorkNo = highWorkNo;
		this.highWorkName = highWorkName;
		this.memo = memo;
		this.workType = workType;
		this.memberNo = memberNo;
		this.workStatus = workStatus;
		this.workAttachment = workAttachment;
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

	public String getProjectName() {
		return projectName;
	}

	public void setProjectName(String projectName) {
		this.projectName = projectName;
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

	public String getHighWorkName() {
		return highWorkName;
	}

	public void setHighWorkName(String highWorkName) {
		this.highWorkName = highWorkName;
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

	public String getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(String memberNo) {
		this.memberNo = memberNo;
	}

	public String getWorkStatus() {
		return workStatus;
	}

	public void setWorkStatus(String workStatus) {
		this.workStatus = workStatus;
	}

	public ArrayList<WorkAttachment> getWorkAttachment() {
		return workAttachment;
	}

	public void setWorkAttachment(ArrayList<WorkAttachment> workAttachment) {
		this.workAttachment = workAttachment;
	}

	@Override
	public String toString() {
		return "Work [workNo=" + workNo + ", workName=" + workName + ", status=" + status + ", projectNo=" + projectNo
				+ ", projectName=" + projectName + ", beginDate=" + beginDate + ", completeDate=" + completeDate
				+ ", precedeNo=" + precedeNo + ", completeRate=" + completeRate + ", grantorNo=" + grantorNo
				+ ", workLevel=" + workLevel + ", highWorkNo=" + highWorkNo + ", highWorkName=" + highWorkName
				+ ", memo=" + memo + ", workType=" + workType + ", memberNo=" + memberNo + ", workStatus=" + workStatus
				+ ", workAttachment=" + workAttachment + "]";
	}

	

	
}
