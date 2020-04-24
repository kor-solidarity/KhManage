package com.kh.manage.issue.model.vo;

import java.sql.Date;

public class IssueList implements java.io.Serializable{
	
	private String IssueNo;
	private String projectNo;
	private String projectName;
	private String workName;
	private String issueTitle;
	private String issueContent;
	private Date registerDate;
	private String issueType;
	private String registerType;
	private String registerName;
	private String status;
	private String teamWorker;
	private String teamWorkerName;
	private Date actionDate;
	private Date ihDate;
	private String ihContent;
	
	public IssueList() {}

	public IssueList(String issueNo, String projectNo, String projectName, String workName, String issueTitle,
			String issueContent, Date registerDate, String issueType, String registerType, String registerName,
			String status, String teamWorker, String teamWorkerName, Date actionDate, Date ihDate, String ihContent) {
		super();
		IssueNo = issueNo;
		this.projectNo = projectNo;
		this.projectName = projectName;
		this.workName = workName;
		this.issueTitle = issueTitle;
		this.issueContent = issueContent;
		this.registerDate = registerDate;
		this.issueType = issueType;
		this.registerType = registerType;
		this.registerName = registerName;
		this.status = status;
		this.teamWorker = teamWorker;
		this.teamWorkerName = teamWorkerName;
		this.actionDate = actionDate;
		this.ihDate = ihDate;
		this.ihContent = ihContent;
	}

	public String getIssueNo() {
		return IssueNo;
	}

	public void setIssueNo(String issueNo) {
		IssueNo = issueNo;
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

	public String getIssueContent() {
		return issueContent;
	}

	public void setIssueContent(String issueContent) {
		this.issueContent = issueContent;
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

	public String getRegisterType() {
		return registerType;
	}

	public void setRegisterType(String registerType) {
		this.registerType = registerType;
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

	public String getTeamWorker() {
		return teamWorker;
	}

	public void setTeamWorker(String teamWorker) {
		this.teamWorker = teamWorker;
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

	public String getIhContent() {
		return ihContent;
	}

	public void setIhContent(String ihContent) {
		this.ihContent = ihContent;
	}

	@Override
	public String toString() {
		return "IssueList [IssueNo=" + IssueNo + ", projectNo=" + projectNo + ", projectName=" + projectName
				+ ", workName=" + workName + ", issueTitle=" + issueTitle + ", issueContent=" + issueContent
				+ ", registerDate=" + registerDate + ", issueType=" + issueType + ", registerType=" + registerType
				+ ", registerName=" + registerName + ", status=" + status + ", teamWorker=" + teamWorker
				+ ", teamWorkerName=" + teamWorkerName + ", actionDate=" + actionDate + ", ihDate=" + ihDate
				+ ", ihContent=" + ihContent + "]";
	}
	
	

	
}
