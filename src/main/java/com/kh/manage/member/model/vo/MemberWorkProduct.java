package com.kh.manage.member.model.vo;

import java.sql.Date;

public class MemberWorkProduct {

	private String projectPk;
	private String projectName;
	private String workNo;
	private String workName;
	private String originName;
	private Date enrollDate;
	
	public MemberWorkProduct() {}

	public MemberWorkProduct(String projectPk, String projectName, String workNo, String workName, String originName,
			Date enrollDate) {
		super();
		this.projectPk = projectPk;
		this.projectName = projectName;
		this.workNo = workNo;
		this.workName = workName;
		this.originName = originName;
		this.enrollDate = enrollDate;
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

	public String getOriginName() {
		return originName;
	}

	public void setOriginName(String originName) {
		this.originName = originName;
	}

	public Date getEnrollDate() {
		return enrollDate;
	}

	public void setEnrollDate(Date enrollDate) {
		this.enrollDate = enrollDate;
	}

	@Override
	public String toString() {
		return "WorkProduct [projectPk=" + projectPk + ", projectName=" + projectName + ", workNo=" + workNo
				+ ", workName=" + workName + ", originName=" + originName + ", enrollDate=" + enrollDate + "]";
	}


	
}
