package com.kh.manage.admin.adminManage.vo;

import java.sql.Date;

public class DeptMember {
	private String memberNo;
	private String memberId;
	private String memberName;
	private String phone;
	private String email;
	private String memberType;
	private String rankNo;
	private String deptName;
	private Date enrollDate;
	private Date modifyDate;
	private String status;
	
	public DeptMember() {}

	public DeptMember(String memberNo, String memberId, String memberName, String phone, String email,
			String memberType, String rankNo, String deptName, Date enrollDate, Date modifyDate, String status) {
		super();
		this.memberNo = memberNo;
		this.memberId = memberId;
		this.memberName = memberName;
		this.phone = phone;
		this.email = email;
		this.memberType = memberType;
		this.rankNo = rankNo;
		this.deptName = deptName;
		this.enrollDate = enrollDate;
		this.modifyDate = modifyDate;
		this.status = status;
	}

	public String getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(String memberNo) {
		this.memberNo = memberNo;
	}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	public String getMemberName() {
		return memberName;
	}

	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getMemberType() {
		return memberType;
	}

	public void setMemberType(String memberType) {
		this.memberType = memberType;
	}

	public String getRankNo() {
		return rankNo;
	}

	public void setRankNo(String rankNo) {
		this.rankNo = rankNo;
	}

	public String getDeptName() {
		return deptName;
	}

	public void setDeptName(String deptName) {
		this.deptName = deptName;
	}

	public Date getEnrollDate() {
		return enrollDate;
	}

	public void setEnrollDate(Date enrollDate) {
		this.enrollDate = enrollDate;
	}

	public Date getModifyDate() {
		return modifyDate;
	}

	public void setModifyDate(Date modifyDate) {
		this.modifyDate = modifyDate;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	@Override
	public String toString() {
		return "DeptMember [memberNo=" + memberNo + ", memberId=" + memberId + ", memberName=" + memberName + ", phone="
				+ phone + ", email=" + email + ", memberType=" + memberType + ", rankNo=" + rankNo + ", deptName="
				+ deptName + ", enrollDate=" + enrollDate + ", modifyDate=" + modifyDate + ", status=" + status + "]";
	}
	
	
}
