package com.kh.manage.member.model.vo;

import java.sql.Date;

public class AllDashBoard {
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
	 private int dDay;
	 private Date startDate;
	 private Date endDate;
	 private String detail;
	 private String remarks;
	 private String status;
	 private int workClear;
	 private int allWork;
	 private String issue;
	 private String workProduct;
	 private int start;
	 private int end;
	 private int before;
	 private int pro;
	 private int com;
	 private int del;
	 
	 public AllDashBoard() {}

	public AllDashBoard(String projectPk, String projectName, String isImportant, String projectTypePk,
			String projectTypeName, String projectRank, String projectManager, String managerName, String deptNo,
			String deptName, int dDay, Date startDate, Date endDate, String detail, String remarks, String status,
			int workClear, int allWork, String issue, String workProduct, int start, int end, int before, int pro,
			int com, int del) {
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
		this.dDay = dDay;
		this.startDate = startDate;
		this.endDate = endDate;
		this.detail = detail;
		this.remarks = remarks;
		this.status = status;
		this.workClear = workClear;
		this.allWork = allWork;
		this.issue = issue;
		this.workProduct = workProduct;
		this.start = start;
		this.end = end;
		this.before = before;
		this.pro = pro;
		this.com = com;
		this.del = del;
	}

	@Override
	public String toString() {
		return "AllDashBoard [projectPk=" + projectPk + ", projectName=" + projectName + ", isImportant=" + isImportant
				+ ", projectTypePk=" + projectTypePk + ", projectTypeName=" + projectTypeName + ", projectRank="
				+ projectRank + ", projectManager=" + projectManager + ", managerName=" + managerName + ", deptNo="
				+ deptNo + ", deptName=" + deptName + ", dDay=" + dDay + ", startDate=" + startDate + ", endDate="
				+ endDate + ", detail=" + detail + ", remarks=" + remarks + ", status=" + status + ", workClear="
				+ workClear + ", allWork=" + allWork + ", issue=" + issue + ", workProduct=" + workProduct + ", start="
				+ start + ", end=" + end + ", before=" + before + ", pro=" + pro + ", com=" + com + ", del=" + del
				+ "]";
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

	public int getdDay() {
		return dDay;
	}

	public void setdDay(int dDay) {
		this.dDay = dDay;
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

	public int getWorkClear() {
		return workClear;
	}

	public void setWorkClear(int workClear) {
		this.workClear = workClear;
	}

	public int getAllWork() {
		return allWork;
	}

	public void setAllWork(int allWork) {
		this.allWork = allWork;
	}

	public String getIssue() {
		return issue;
	}

	public void setIssue(String issue) {
		this.issue = issue;
	}

	public String getWorkProduct() {
		return workProduct;
	}

	public void setWorkProduct(String workProduct) {
		this.workProduct = workProduct;
	}

	public int getStart() {
		return start;
	}

	public void setStart(int start) {
		this.start = start;
	}

	public int getEnd() {
		return end;
	}

	public void setEnd(int end) {
		this.end = end;
	}

	public int getBefore() {
		return before;
	}

	public void setBefore(int before) {
		this.before = before;
	}

	public int getPro() {
		return pro;
	}

	public void setPro(int pro) {
		this.pro = pro;
	}

	public int getCom() {
		return com;
	}

	public void setCom(int com) {
		this.com = com;
	}

	public int getDel() {
		return del;
	}

	public void setDel(int del) {
		this.del = del;
	}

	 	
}
