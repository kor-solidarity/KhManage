package com.kh.manage.gwManage.model.vo;

import java.sql.Date;

public class GWork {
	
	private String gwNo;
	private String gwName;
	private Date beginDate;
	private Date endDate;
	private Date enrollDate;
	private String gwMemo;
	private String gwType;
	private String memberNo;
	private String status;
	private String to;
	private String to2;
	private String repeatStatus;
	
	public GWork() {}

	public GWork(String gwNo, String gwName, Date beginDate, Date endDate, Date enrollDate, String gwMemo,
			String gwType, String memberNo, String status, String to, String to2, String repeatStatus) {
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
		this.to = to;
		this.to2 = to2;
		this.repeatStatus = repeatStatus;
	}

	@Override
	public String toString() {
		return "GWork [gwNo=" + gwNo + ", gwName=" + gwName + ", beginDate=" + beginDate + ", endDate=" + endDate
				+ ", enrollDate=" + enrollDate + ", gwMemo=" + gwMemo + ", gwType=" + gwType + ", memberNo=" + memberNo
				+ ", status=" + status + ", to=" + to + ", to2=" + to2 + ", repeatStatus=" + repeatStatus + "]";
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

	public String getTo() {
		return to;
	}

	public void setTo(String to) {
		this.to = to;
	}

	public String getTo2() {
		return to2;
	}

	public void setTo2(String to2) {
		this.to2 = to2;
	}

	public String getRepeatStatus() {
		return repeatStatus;
	}

	public void setRepeatStatus(String repeatStatus) {
		this.repeatStatus = repeatStatus;
	}

	

	
	
	
}
