package com.kh.manage.project.model.vo;

import java.sql.Date;

public class TemplateWorkRead {
	private String templateWorkNo;
	private String workName;
	private Date beginDate;
	private Date completeDate;
	private String currval1;
	private String projectCurrval;
	
	public TemplateWorkRead() {}

	public TemplateWorkRead(String templateWorkNo, String workName, Date beginDate, Date completeDate, String currval1,
			String projectCurrval) {
		super();
		this.templateWorkNo = templateWorkNo;
		this.workName = workName;
		this.beginDate = beginDate;
		this.completeDate = completeDate;
		this.currval1 = currval1;
		this.projectCurrval = projectCurrval;
	}

	public String getTemplateWorkNo() {
		return templateWorkNo;
	}

	public void setTemplateWorkNo(String templateWorkNo) {
		this.templateWorkNo = templateWorkNo;
	}

	public String getWorkName() {
		return workName;
	}

	public void setWorkName(String workName) {
		this.workName = workName;
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

	public String getCurrval1() {
		return currval1;
	}

	public void setCurrval1(String currval1) {
		this.currval1 = currval1;
	}

	public String getProjectCurrval() {
		return projectCurrval;
	}

	public void setProjectCurrval(String projectCurrval) {
		this.projectCurrval = projectCurrval;
	}

	@Override
	public String toString() {
		return "TemplateWorkRead [templateWorkNo=" + templateWorkNo + ", workName=" + workName + ", beginDate="
				+ beginDate + ", completeDate=" + completeDate + ", currval1=" + currval1 + ", projectCurrval="
				+ projectCurrval + "]";
	}

	
	
	
}
