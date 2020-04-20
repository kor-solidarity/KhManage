package com.kh.manage.member.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class Member implements Serializable {

	private String memberNo;
	private String memberId;
	private String memberPwd;
	private String memberName;
	private String phone;
	private String email;
	private String jobCode;
	private String memberType;
	private String rankNo;
	private String rankName;
	private String deptNo;
	private String deptName;
	private String deapTeamNo;
	private String deptTeamName;
	private String projectPk;
	private int countProject;
	private Date enrollDate;
	private Date modifyDate;
	private String changeName;
	private String ext;
	private String status;
	
	public Member() {}

	public Member(String memberNo, String memberId, String memberPwd, String memberName, String phone, String email,
			String jobCode, String memberType, String rankNo, String rankName, String deptNo, String deptName,
			String deapTeamNo, String deptTeamName, String projectPk, int countProject, Date enrollDate,
			Date modifyDate, String changeName, String ext, String status) {
		super();
		this.memberNo = memberNo;
		this.memberId = memberId;
		this.memberPwd = memberPwd;
		this.memberName = memberName;
		this.phone = phone;
		this.email = email;
		this.jobCode = jobCode;
		this.memberType = memberType;
		this.rankNo = rankNo;
		this.rankName = rankName;
		this.deptNo = deptNo;
		this.deptName = deptName;
		this.deapTeamNo = deapTeamNo;
		this.deptTeamName = deptTeamName;
		this.projectPk = projectPk;
		this.countProject = countProject;
		this.enrollDate = enrollDate;
		this.modifyDate = modifyDate;
		this.changeName = changeName;
		this.ext = ext;
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

	public String getMemberPwd() {
		return memberPwd;
	}

	public void setMemberPwd(String memberPwd) {
		this.memberPwd = memberPwd;
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

	public String getJobCode() {
		return jobCode;
	}

	public void setJobCode(String jobCode) {
		this.jobCode = jobCode;
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

	public String getRankName() {
		return rankName;
	}

	public void setRankName(String rankName) {
		this.rankName = rankName;
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

	public String getDeapTeamNo() {
		return deapTeamNo;
	}

	public void setDeapTeamNo(String deapTeamNo) {
		this.deapTeamNo = deapTeamNo;
	}

	public String getDeptTeamName() {
		return deptTeamName;
	}

	public void setDeptTeamName(String deptTeamName) {
		this.deptTeamName = deptTeamName;
	}

	public String getProjectPk() {
		return projectPk;
	}

	public void setProjectPk(String projectPk) {
		this.projectPk = projectPk;
	}

	public int getCountProject() {
		return countProject;
	}

	public void setCountProject(int countProject) {
		this.countProject = countProject;
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

	public String getChangeName() {
		return changeName;
	}

	public void setChangeName(String changeName) {
		this.changeName = changeName;
	}

	public String getExt() {
		return ext;
	}

	public void setExt(String ext) {
		this.ext = ext;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	@Override
	public String toString() {
		return "Member [memberNo=" + memberNo + ", memberId=" + memberId + ", memberPwd=" + memberPwd + ", memberName="
				+ memberName + ", phone=" + phone + ", email=" + email + ", jobCode=" + jobCode + ", memberType="
				+ memberType + ", rankNo=" + rankNo + ", rankName=" + rankName + ", deptNo=" + deptNo + ", deptName="
				+ deptName + ", deapTeamNo=" + deapTeamNo + ", deptTeamName=" + deptTeamName + ", projectPk="
				+ projectPk + ", countProject=" + countProject + ", enrollDate=" + enrollDate + ", modifyDate="
				+ modifyDate + ", changeName=" + changeName + ", ext=" + ext + ", status=" + status + "]";
	}
	
	
}
