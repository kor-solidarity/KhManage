package com.kh.manage.issue.model.vo;

import java.sql.Date;




public class IssueWork implements java.io.Serializable{
	private String workNo;
	private String workName;
	
	public IssueWork() {}

	public IssueWork(String workNo, String workName) {
		super();
		this.workNo = workNo;
		this.workName = workName;
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

	@Override
	public String toString() {
		return "IssueWork [workNo=" + workNo + ", workName=" + workName + "]";
	}

	

}
