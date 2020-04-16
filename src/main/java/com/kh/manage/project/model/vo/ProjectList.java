package com.kh.manage.project.model.vo;

import java.sql.Date;

public class ProjectList {
	// 프로젝트 목록조회 페이지에 쓰일 클래스
	private String projectPk;
	private String projectName;
	private String isImportant;
	private String projectTypePk;
	private String projectTypeName;
	private String projectRank;
	private String projectManager;
	private String projectManagerName;
	private String deptNo; // PMO
	private String deptName;
	private Date startDate;
	private Date endDate;
	private String status;
	
	public ProjectList(String projectPk, String projectName, String isImportant, String projectTypePk, String projectTypeName, String projectRank, String projectManager, String projectManagerName, String deptNo, String deptName, Date startDate, Date endDate, String status) {
		this.projectPk = projectPk;
		this.projectName = projectName;
		this.isImportant = isImportant;
		this.projectTypePk = projectTypePk;
		this.projectTypeName = projectTypeName;
		this.projectRank = projectRank;
		this.projectManager = projectManager;
		this.projectManagerName = projectManagerName;
		this.deptNo = deptNo;
		this.deptName = deptName;
		this.startDate = startDate;
		this.endDate = endDate;
		this.status = status;
	}
	
	public ProjectList() {
	}
	
	@Override
	public String toString() {
		return "ProjectList{" +
				"projectPk='" + projectPk + '\'' +
				", projectName='" + projectName + '\'' +
				", isImportant='" + isImportant + '\'' +
				", projectTypePk='" + projectTypePk + '\'' +
				", projectTypeName='" + projectTypeName + '\'' +
				", projectRank='" + projectRank + '\'' +
				", projectManager='" + projectManager + '\'' +
				", projectManagerName='" + projectManagerName + '\'' +
				", deptNo='" + deptNo + '\'' +
				", deptName='" + deptName + '\'' +
				", startDate=" + startDate +
				", endDate=" + endDate +
				", status='" + status + '\'' +
				'}';
	}
	
	public String getProjectPk() {
		return projectPk;
	}
	
	public void setProjectPk(String projectPk) {
		this.projectPk = projectPk;
	}
	
	public String getProjectName() {
		return projectName;
	}
	
	public void setProjectName(String projectName) {
		this.projectName = projectName;
	}
	
	public String getIsImportant() {
		return isImportant;
	}
	
	public void setIsImportant(String isImportant) {
		this.isImportant = isImportant;
	}
	
	public String getProjectTypePk() {
		return projectTypePk;
	}
	
	public void setProjectTypePk(String projectTypePk) {
		this.projectTypePk = projectTypePk;
	}
	
	public String getProjectTypeName() {
		return projectTypeName;
	}
	
	public void setProjectTypeName(String projectTypeName) {
		this.projectTypeName = projectTypeName;
	}
	
	public String getProjectRank() {
		return projectRank;
	}
	
	public void setProjectRank(String projectRank) {
		this.projectRank = projectRank;
	}
	
	public String getProjectManager() {
		return projectManager;
	}
	
	public void setProjectManager(String projectManager) {
		this.projectManager = projectManager;
	}
	
	public String getProjectManagerName() {
		return projectManagerName;
	}
	
	public void setProjectManagerName(String projectManagerName) {
		this.projectManagerName = projectManagerName;
	}
	
	public String getDeptNo() {
		return deptNo;
	}
	
	public void setDeptNo(String deptNo) {
		this.deptNo = deptNo;
	}
	
	public String getDeptName() {
		return deptName;
	}
	
	public void setDeptName(String deptName) {
		this.deptName = deptName;
	}
	
	public Date getStartDate() {
		return startDate;
	}
	
	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}
	
	public Date getEndDate() {
		return endDate;
	}
	
	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}
	
	public String getStatus() {
		return status;
	}
	
	public void setStatus(String status) {
		this.status = status;
	}
}
