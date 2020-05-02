package com.kh.manage.project.model.vo;

import java.sql.Date;

public class ProjectDetail {
	private String projectPk;
	private String projectName;
	private String isImportant;
	private String projectTypePk;
	private String projectTypeName;
	private String projectRank;
	private String projectManager;
	private String managerName;
	private String deptNo;
	private String deptName;
	private Date startDate;
	private Date endDate;
	private Date enrollDate;
	private String detail;
	private String remarks;
	private String status;
	private String teamplatePk;

	public ProjectDetail() {
	}

	public ProjectDetail(String projectPk, String projectName, String isImportant, String projectTypePk,
						 String projectTypeName, String projectRank, String projectManager, String managerName, String deptNo,
						 String deptName, Date startDate, Date endDate, String detail, String remarks, String status,
						 String teamplatePk) {
		super();
		this.projectPk = projectPk;
		this.projectName = projectName;
		this.isImportant = isImportant;
		this.projectTypePk = projectTypePk;
		this.projectTypeName = projectTypeName;
		this.projectRank = projectRank;
		this.projectManager = projectManager;
		this.managerName = managerName;
		this.deptNo = deptNo;
		this.deptName = deptName;
		this.startDate = startDate;
		this.endDate = endDate;
		this.detail = detail;
		this.remarks = remarks;
		this.status = status;
		this.teamplatePk = teamplatePk;
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

	public String getManagerName() {
		return managerName;
	}

	public void setManagerName(String managerName) {
		this.managerName = managerName;
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

	public String getTeamplatePk() {
		return teamplatePk;
	}

	public void setTeamplatePk(String teamplatePk) {
		this.teamplatePk = teamplatePk;
	}

	@Override
	public String toString() {
		return "ProjectDetail [projectPk=" + projectPk + ", projectName=" + projectName + ", isImportant=" + isImportant
				+ ", projectTypePk=" + projectTypePk + ", projectTypeName=" + projectTypeName + ", projectRank="
				+ projectRank + ", projectManager=" + projectManager + ", managerName=" + managerName + ", deptNo="
				+ deptNo + ", deptName=" + deptName + ", startDate=" + startDate + ", endDate=" + endDate + ", detail="
				+ detail + ", remarks=" + remarks + ", status=" + status + ", teamplatePk=" + teamplatePk + "]";
	}


}
