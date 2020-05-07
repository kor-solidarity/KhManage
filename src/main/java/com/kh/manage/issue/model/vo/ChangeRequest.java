package com.kh.manage.issue.model.vo;

import java.sql.Date;

public class ChangeRequest implements java.io.Serializable{
	private String changeNo;
	private String requestTitle;
	private String requestContent;
	private Date requestDate;
	private String workNo;
	private String workName;
	private String status;
	private String projectNo;
	private String projectName;
	private Date beginDate;
	private Date completeDate;
	private String precedeNo;
	private String completeRate;
	private String grantorNo;
	private String workLevel;
	private String highWorkNo;
	private String highWorkName;
	private String workType;
	private String workStatus;
	private String memberNo;
	private String crStatus;
	private String crGrantor1;
	private String crGrantor2;
	private String crConfirm1;
	private String crConfirm2;
	private String registerNo;
	
	public ChangeRequest() {}

	public ChangeRequest(String changeNo, String requestTitle, String requestContent, Date requestDate, String workNo,
			String workName, String status, String projectNo, String projectName, Date beginDate, Date completeDate,
			String precedeNo, String completeRate, String grantorNo, String workLevel, String highWorkNo,
			String highWorkName, String workType, String workStatus, String memberNo, String crStatus,
			String crGrantor1, String crGrantor2, String crConfirm1, String crConfirm2, String registerNo) {
		super();
		this.changeNo = changeNo;
		this.requestTitle = requestTitle;
		this.requestContent = requestContent;
		this.requestDate = requestDate;
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
		this.workType = workType;
		this.workStatus = workStatus;
		this.memberNo = memberNo;
		this.crStatus = crStatus;
		this.crGrantor1 = crGrantor1;
		this.crGrantor2 = crGrantor2;
		this.crConfirm1 = crConfirm1;
		this.crConfirm2 = crConfirm2;
		this.registerNo = registerNo;
	}

	public String getChangeNo() {
		return changeNo;
	}

	public void setChangeNo(String changeNo) {
		this.changeNo = changeNo;
	}

	public String getRequestTitle() {
		return requestTitle;
	}

	public void setRequestTitle(String requestTitle) {
		this.requestTitle = requestTitle;
	}

	public String getRequestContent() {
		return requestContent;
	}

	public void setRequestContent(String requestContent) {
		this.requestContent = requestContent;
	}

	public Date getRequestDate() {
		return requestDate;
	}

	public void setRequestDate(Date requestDate) {
		this.requestDate = requestDate;
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

	public String getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(String memberNo) {
		this.memberNo = memberNo;
	}

	public String getCrStatus() {
		return crStatus;
	}

	public void setCrStatus(String crStatus) {
		this.crStatus = crStatus;
	}

	public String getCrGrantor1() {
		return crGrantor1;
	}

	public void setCrGrantor1(String crGrantor1) {
		this.crGrantor1 = crGrantor1;
	}

	public String getCrGrantor2() {
		return crGrantor2;
	}

	public void setCrGrantor2(String crGrantor2) {
		this.crGrantor2 = crGrantor2;
	}

	public String getCrConfirm1() {
		return crConfirm1;
	}

	public void setCrConfirm1(String crConfirm1) {
		this.crConfirm1 = crConfirm1;
	}

	public String getCrConfirm2() {
		return crConfirm2;
	}

	public void setCrConfirm2(String crConfirm2) {
		this.crConfirm2 = crConfirm2;
	}

	public String getregisterNo() {
		return registerNo;
	}

	public void setregisterNo(String registerNo) {
		this.registerNo = registerNo;
	}

	@Override
	public String toString() {
		return "ChangeRequest [changeNo=" + changeNo + ", requestTitle=" + requestTitle + ", requestContent="
				+ requestContent + ", requestDate=" + requestDate + ", workNo=" + workNo + ", workName=" + workName
				+ ", status=" + status + ", projectNo=" + projectNo + ", projectName=" + projectName + ", beginDate="
				+ beginDate + ", completeDate=" + completeDate + ", precedeNo=" + precedeNo + ", completeRate="
				+ completeRate + ", grantorNo=" + grantorNo + ", workLevel=" + workLevel + ", highWorkNo=" + highWorkNo
				+ ", highWorkName=" + highWorkName + ", workType=" + workType + ", workStatus=" + workStatus
				+ ", memberNo=" + memberNo + ", crStatus=" + crStatus + ", crGrantor1=" + crGrantor1 + ", crGrantor2="
				+ crGrantor2 + ", crConfirm1=" + crConfirm1 + ", crConfirm2=" + crConfirm2 + ", registerNo="
				+ registerNo + "]";
	}

	
	
}
