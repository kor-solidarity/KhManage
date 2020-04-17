package com.kh.manage.generalWork.model.vo;

import java.sql.Date;

public class GeneralWork implements java.io.Serializable {
	private String gwNo;
	private String gwName;
	private Date beginDate;
	private Date endDate;
	private Date enrollDate;
	private String gwMemo;
	private String gwType;
	private String memberNo;
	private String status;

	public GeneralWork() {}

	public GeneralWork(String gwNo, String gwName, Date beginDate, Date endDate, Date enrollDate, String gwMemo,
			String gwType, String memberNo, String status) {
		super();
		this.gwNo = gwNo;
		this.gwName = gwName;
		this.beginDate = beginDate;
		this.endDate = endDate;
		this.enrollDate = enrollDate;
		this.gwMemo = gwMemo;
		this.gwType = gwType;
		this.memberNo = memberNo;
		this.status = status;
	}

	public String getGwNo() {
		return gwNo;
	}

	public void setGwNo(String gwNo) {
		this.gwNo = gwNo;
	}

	public String getGwName() {
		return gwName;
	}

	public void setGwName(String gwName) {
		this.gwName = gwName;
	}

	public Date getBeginDate() {
		return beginDate;
	}

	public void setBeginDate(Date beginDate) {
		this.beginDate = beginDate;
	}

	public Date getEndDate() {
		return endDate;
	}

	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}

	public Date getEnrollDate() {
		return enrollDate;
	}

	public void setEnrollDate(Date enrollDate) {
		this.enrollDate = enrollDate;
	}

	public String getGwMemo() {
		return gwMemo;
	}

	public void setGwMemo(String gwMemo) {
		this.gwMemo = gwMemo;
	}

	public String getGwType() {
		return gwType;
	}

	public void setGwType(String gwType) {
		this.gwType = gwType;
	}

	public String getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(String memberNo) {
		this.memberNo = memberNo;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	@Override
	public String toString() {
		return "GeneralWork [gwNo=" + gwNo + ", gwName=" + gwName + ", beginDate=" + beginDate + ", endDate=" + endDate
				+ ", enrollDate=" + enrollDate + ", gwMemo=" + gwMemo + ", gwType=" + gwType + ", memberNo=" + memberNo
				+ ", status=" + status + "]";
	}


}
