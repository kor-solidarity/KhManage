package com.kh.manage.admin.template.model.vo;

import java.sql.Date;

public class TemplateWork implements java.io.Serializable{
	
	private String twNo;
	private String tNo;
	private String wNo;
	private String wName;
	private Date beginDate;
	private Date completeDate;
	
	public TemplateWork() {}

	public TemplateWork(String twNo, String tNo, String wNo, String wName, Date beginDate, Date completeDate) {
		super();
		this.twNo = twNo;
		this.tNo = tNo;
		this.wNo = wNo;
		this.wName = wName;
		this.beginDate = beginDate;
		this.completeDate = completeDate;
	}

	public String getTwNo() {
		return twNo;
	}

	public void setTwNo(String twNo) {
		this.twNo = twNo;
	}

	public String gettNo() {
		return tNo;
	}

	public void settNo(String tNo) {
		this.tNo = tNo;
	}

	public String getwNo() {
		return wNo;
	}

	public void setwNo(String wNo) {
		this.wNo = wNo;
	}

	public String getwName() {
		return wName;
	}

	public void setwName(String wName) {
		this.wName = wName;
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

	@Override
	public String toString() {
		return "TemplateWork [twNo=" + twNo + ", tNo=" + tNo + ", wNo=" + wNo + ", wName=" + wName + ", beginDate="
				+ beginDate + ", completeDate=" + completeDate + "]";
	}
	
	
	
	
}
