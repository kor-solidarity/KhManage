package com.kh.manage.admin.adminManage.vo;

import java.sql.Date;

public class SelectAccessMember implements java.io.Serializable {
	private String accessNo;
	private String memberNo;
	private String memberId;
	private String memberName;
	private String phone;
	private String email;
	private String memberType;
	private String rankName;
	private String deptName;
	private Date enrollDate;
	private Date modifyDate;
	private String status;
	
	public SelectAccessMember() {}

	public SelectAccessMember(String accessNo, String memberNo, String memberId, String memberName, String phone,
			String email, String memberType, String rankName, String deptName, Date enrollDate, Date modifyDate,
			String status) {
		super();
		this.accessNo = accessNo;
		this.memberNo = memberNo;
		this.memberId = memberId;
		this.memberName = memberName;
		this.phone = phone;
		this.email = email;
		this.memberType = memberType;
		this.rankName = rankName;
		this.deptName = deptName;
		this.enrollDate = enrollDate;
		this.modifyDate = modifyDate;
		this.status = status;
	}

	public String getAccessNo() {
		return accessNo;
	}

	public void setAccessNo(String accessNo) {
		this.accessNo = accessNo;
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

	public String getRankName() {
		return rankName;
	}

	public void setRankName(String rankName) {
		this.rankName = rankName;
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
		return "SelectAccessMember [accessNo=" + accessNo + ", memberNo=" + memberNo + ", memberId=" + memberId
				+ ", memberName=" + memberName + ", phone=" + phone + ", email=" + email + ", memberType=" + memberType
				+ ", rankName=" + rankName + ", deptName=" + deptName + ", enrollDate=" + enrollDate + ", modifyDate="
				+ modifyDate + ", status=" + status + "]";
	}
	
	
	
}
