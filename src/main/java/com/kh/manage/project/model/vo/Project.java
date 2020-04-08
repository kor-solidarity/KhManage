package com.kh.manage.project.model.vo;

import java.sql.Date;

public class Project {
	//
	private String projectPk;
	private String projectName;
	private String isImportant;
	private String projectTypePk;
	private String projectRank;
	private String projectManager;
	private String deptNo;
	private Date startDate;
	private Date endDate;
	private String detail;
	private String remarks;
	private String status;
	private String templatePk;
	
	public Project() {
	}
	
	public Project(String projectPk, String projectName, String isImportant, String projectTypePk,
				   String projectRank, String projectManager, String deptNo, Date startDate, Date endDate,
				   String detail, String remarks, String status, String templatePk) {
		this.projectPk = projectPk;
		this.projectName = projectName;
		this.isImportant = isImportant;
		this.projectTypePk = projectTypePk;
		this.projectRank = projectRank;
		this.projectManager = projectManager;
		this.deptNo = deptNo;
		this.startDate = startDate;
		this.endDate = endDate;
		this.detail = detail;
		this.remarks = remarks;
		this.status = status;
		this.templatePk = templatePk;
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
	
	public String getDeptNo() {
		return deptNo;
	}
	
	public void setDeptNo(String deptNo) {
		this.deptNo = deptNo;
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
	
	public String getDetail() {
		return detail;
	}
	
	public void setDetail(String detail) {
		this.detail = detail;
	}
	
	public String getRemarks() {
		return remarks;
	}
	
	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}
	
	public String getStatus() {
		return status;
	}
	
	public void setStatus(String status) {
		this.status = status;
	}
	
	public String getTemplatePk() {
		return templatePk;
	}
	
	public void setTemplatePk(String templatePk) {
		this.templatePk = templatePk;
	}
}
