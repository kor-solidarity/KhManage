package com.kh.manage.issue.model.vo;

import java.sql.Date;

public class IssueList implements java.io.Serializable{
	
	private String IssueNo;
	private String projectName;
	private String workName;
	private String issueTitle;
	private Date registerDate;
	private String issueType;
	private String registerName;
	private String status;
	private String teamWorkerName;
	private Date actionDate;
	private Date ihDate;
	
	public IssueList() {}

	public IssueList(String issueNo, String projectName, String workName, String issueTitle, Date registerDate,
			String issueType, String registerName, String status, String teamWorkerName, Date actionDate, Date ihDate) {
		super();
		IssueNo = issueNo;
		this.projectName = projectName;
		this.workName = workName;
		this.issueTitle = issueTitle;
		this.registerDate = registerDate;
		this.issueType = issueType;
		this.registerName = registerName;
		this.status = status;
		this.teamWorkerName = teamWorkerName;
		this.actionDate = actionDate;
		this.ihDate = ihDate;
	}

	public String getIssueNo() {
		return IssueNo;
	}

	public void setIssueNo(String issueNo) {
		IssueNo = issueNo;
	}

	public String getProjectName() {
		return projectName;
	}

	public void setProjectName(String projectName) {
		this.projectName = projectName;
	}

	public String getWorkName() {
		return workName;
	}

	public void setWorkName(String workName) {
		this.workName = workName;
	}

	public String getIssueTitle() {
		return issueTitle;
	}

	public void setIssueTitle(String issueTitle) {
		this.issueTitle = issueTitle;
	}

	public Date getRegisterDate() {
		return registerDate;
	}

	public void setRegisterDate(Date registerDate) {
		this.registerDate = registerDate;
	}

	public String getIssueType() {
		return issueType;
	}

	public void setIssueType(String issueType) {
		this.issueType = issueType;
	}

	public String getRegisterName() {
		return registerName;
	}

	public void setRegisterName(String registerName) {
		this.registerName = registerName;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getTeamWorkerName() {
		return teamWorkerName;
	}

	public void setTeamWorkerName(String teamWorkerName) {
		this.teamWorkerName = teamWorkerName;
	}

	public Date getActionDate() {
		return actionDate;
	}

	public void setActionDate(Date actionDate) {
		this.actionDate = actionDate;
	}

	public Date getIhDate() {
		return ihDate;
	}

	public void setIhDate(Date ihDate) {
		this.ihDate = ihDate;
	}

	@Override
	public String toString() {
		return "IssueList [IssueNo=" + IssueNo + ", projectName=" + projectName + ", workName=" + workName
				+ ", issueTitle=" + issueTitle + ", registerDate=" + registerDate + ", issueType=" + issueType
				+ ", registerName=" + registerName + ", status=" + status + ", teamWorkerName=" + teamWorkerName
				+ ", actionDate=" + actionDate + ", ihDate=" + ihDate + "]";
	}

	
}
