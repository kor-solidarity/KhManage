package com.kh.manage.report.model.vo;

import java.sql.Date;

public class Report implements java.io.Serializable {
	private String reportNo; //알림 번호
	private String division; //이슈히스토리 번호
	private String reportMemberNo; //알림 받을 회원
	private String status; //알림 상태
	private String issueNo; //알림 이슈번호
	private String issueType; // 이슈타입
	private String issueTitle; // 이슈제목
	private String issueContent; //이슈 내용
	private String createMemberNo; //이슈등록자
	private String createMemberName;//이슈등록자 이름
	private String workNo; //작업번호
	private String workName; //작업이름
	private String teamWorker; //조치자
	private String teamWorkerName; //조치자 이름
	private Date registerDate; //등록일
	private String projectNo;//프로젝트 번호
	private String projectName;//프로젝트 이름
	private String actionDate; //조치희망일자
	private String ihNo; //히스트리 번호
	private String ihContent; //히스토리 조치 내용
	private Date ihDate;//조치일자
	private String ihStatus; //이슈 히스토리 상태
	
	
	public Report() {}


	public Report(String reportNo, String division, String reportMemberNo, String status, String issueNo,
			String issueType, String issueTitle, String issueContent, String createMemberNo, String createMemberName,
			String workNo, String workName, String teamWorker, String teamWorkerName, Date registerDate,
			String projectNo, String projectName, String actionDate, String ihNo, String ihContent, Date ihDate,
			String ihStatus) {
		super();
		this.reportNo = reportNo;
		this.division = division;
		this.reportMemberNo = reportMemberNo;
		this.status = status;
		this.issueNo = issueNo;
		this.issueType = issueType;
		this.issueTitle = issueTitle;
		this.issueContent = issueContent;
		this.createMemberNo = createMemberNo;
		this.createMemberName = createMemberName;
		this.workNo = workNo;
		this.workName = workName;
		this.teamWorker = teamWorker;
		this.teamWorkerName = teamWorkerName;
		this.registerDate = registerDate;
		this.projectNo = projectNo;
		this.projectName = projectName;
		this.actionDate = actionDate;
		this.ihNo = ihNo;
		this.ihContent = ihContent;
		this.ihDate = ihDate;
		this.ihStatus = ihStatus;
	}


	public String getReportNo() {
		return reportNo;
	}


	public void setReportNo(String reportNo) {
		this.reportNo = reportNo;
	}


	public String getDivision() {
		return division;
	}


	public void setDivision(String division) {
		this.division = division;
	}


	public String getReportMemberNo() {
		return reportMemberNo;
	}


	public void setReportMemberNo(String reportMemberNo) {
		this.reportMemberNo = reportMemberNo;
	}


	public String getStatus() {
		return status;
	}


	public void setStatus(String status) {
		this.status = status;
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


	public String getCreateMemberNo() {
		return createMemberNo;
	}


	public void setCreateMemberNo(String createMemberNo) {
		this.createMemberNo = createMemberNo;
	}


	public String getCreateMemberName() {
		return createMemberName;
	}


	public void setCreateMemberName(String createMemberName) {
		this.createMemberName = createMemberName;
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


	public String getProjectName() {
		return projectName;
	}


	public void setProjectName(String projectName) {
		this.projectName = projectName;
	}


	public String getActionDate() {
		return actionDate;
	}


	public void setActionDate(String actionDate) {
		this.actionDate = actionDate;
	}


	public String getIhNo() {
		return ihNo;
	}


	public void setIhNo(String ihNo) {
		this.ihNo = ihNo;
	}


	public String getIhContent() {
		return ihContent;
	}


	public void setIhContent(String ihContent) {
		this.ihContent = ihContent;
	}


	public Date getIhDate() {
		return ihDate;
	}


	public void setIhDate(Date ihDate) {
		this.ihDate = ihDate;
	}


	public String getIhStatus() {
		return ihStatus;
	}


	public void setIhStatus(String ihStatus) {
		this.ihStatus = ihStatus;
	}


	@Override
	public String toString() {
		return "Report [reportNo=" + reportNo + ", division=" + division + ", reportMemberNo=" + reportMemberNo
				+ ", status=" + status + ", issueNo=" + issueNo + ", issueType=" + issueType + ", issueTitle="
				+ issueTitle + ", issueContent=" + issueContent + ", createMemberNo=" + createMemberNo
				+ ", createMemberName=" + createMemberName + ", workNo=" + workNo + ", workName=" + workName
				+ ", teamWorker=" + teamWorker + ", teamWorkerName=" + teamWorkerName + ", registerDate=" + registerDate
				+ ", projectNo=" + projectNo + ", projectName=" + projectName + ", actionDate=" + actionDate + ", ihNo="
				+ ihNo + ", ihContent=" + ihContent + ", ihDate=" + ihDate + ", ihStatus=" + ihStatus + "]";
	}


	
}
