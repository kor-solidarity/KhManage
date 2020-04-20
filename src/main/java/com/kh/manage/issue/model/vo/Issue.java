package com.kh.manage.issue.model.vo;

import java.sql.Date;

public class Issue implements java.io.Serializable{
	private String issueNo;
	private String issueType;
	private String issueTitle;
	private String issueContent;
	private String registerType;
	private String workNo;
	private String teamWorker;
	private Date registerDate;
	private String projectNo;
	private Date actionDate;
	
	
	public Issue() {}


	public Issue(String issueNo, String issueType, String issueTitle, String issueContent, String registerType,
			String workNo, String teamWorker, Date registerDate, String projectNo, Date actionDate) {
		super();
		this.issueNo = issueNo;
		this.issueType = issueType;
		this.issueTitle = issueTitle;
		this.issueContent = issueContent;
		this.registerType = registerType;
		this.workNo = workNo;
		this.teamWorker = teamWorker;
		this.registerDate = registerDate;
		this.projectNo = projectNo;
		this.actionDate = actionDate;
	}


	public String getIssueNo() {
		return issueNo;
	}


	public void setIssueNo(String issueNo) {
		this.issueNo = issueNo;
	}


	public String getIssueType() {
		return issueType;
	}


	public void setIssueType(String issueType) {
		this.issueType = issueType;
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


	public String getRegisterType() {
		return registerType;
	}


	public void setRegisterType(String registerType) {
		this.registerType = registerType;
	}


	public String getWorkNo() {
		return workNo;
	}


	public void setWorkNo(String workNo) {
		this.workNo = workNo;
	}


	public String getTeamWorker() {
		return teamWorker;
	}


	public void setTeamWorker(String teamWorker) {
		this.teamWorker = teamWorker;
	}


	public Date getRegisterDate() {
		return registerDate;
	}


	public void setRegisterDate(Date registerDate) {
		this.registerDate = registerDate;
	}


	public String getProjectNo() {
		return projectNo;
	}


	public void setProjectNo(String projectNo) {
		this.projectNo = projectNo;
	}


	public Date getActionDate() {
		return actionDate;
	}


	public void setActionDate(Date actionDate) {
		this.actionDate = actionDate;
	}


	@Override
	public String toString() {
		return "Issue [issueNo=" + issueNo + ", issueType=" + issueType + ", issueTitle=" + issueTitle
				+ ", issueContent=" + issueContent + ", registerType=" + registerType + ", workNo=" + workNo
				+ ", teamWorker=" + teamWorker + ", registerDate=" + registerDate + ", projectNo=" + projectNo
				+ ", actionDate=" + actionDate + "]";
	}
	
	
	
}
