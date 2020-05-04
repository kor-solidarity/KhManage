package com.kh.manage.member.model.vo;

import java.sql.Date;

public class MemberWorkProduct {

	//SELECT P.PROJECT_NAME, W.WORK_NAME, W.BEGIN_DATE, W.COMPLETE_DATE, W.COMPLETE_RATE, M.MEMBER_NAME
	
	private String projectPk;
	private String projectName;
	private String workNo;
	private String workName;
	private String originName;
	private Date enrollDate;		
	private String grantorName;			//승인자
	private Date beginDate;				//작업 시작일
	private Date completeDate;			//작업 완료일
	private String completeRate;		//작업 완료율
	
	public MemberWorkProduct() {}

	public MemberWorkProduct(String projectPk, String projectName, String workNo, String workName, String originName,
			Date enrollDate, String grantorName, Date beginDate, Date completeDate, String completeRate) {
		super();
		this.projectPk = projectPk;
		this.projectName = projectName;
		this.workNo = workNo;
		this.workName = workName;
		this.originName = originName;
		this.enrollDate = enrollDate;
		this.grantorName = grantorName;
		this.beginDate = beginDate;
		this.completeDate = completeDate;
		this.completeRate = completeRate;
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

	public String getGrantorName() {
		return grantorName;
	}

	public void setGrantorName(String grantorName) {
		this.grantorName = grantorName;
	}

	public Date getBeginDate() {
		return beginDate;
	}

	public void setBeginDate(Date beginDate) {
		this.beginDate = beginDate;
	}

	public Date getCompleteDate() {
		return completeDate;
	}

	public void setCompleteDate(Date completeDate) {
		this.completeDate = completeDate;
	}

	public String getCompleteRate() {
		return completeRate;
	}

	public void setCompleteRate(String completeRate) {
		this.completeRate = completeRate;
	}

	@Override
	public String toString() {
		return "MemberWorkProduct [projectPk=" + projectPk + ", projectName=" + projectName + ", workNo=" + workNo
				+ ", workName=" + workName + ", originName=" + originName + ", enrollDate=" + enrollDate
				+ ", grantorName=" + grantorName + ", beginDate=" + beginDate + ", completeDate=" + completeDate
				+ ", completeRate=" + completeRate + "]";
	}

	



	
}
