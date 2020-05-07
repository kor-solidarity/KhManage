package com.kh.manage.project.model.vo;

import java.sql.Date;
import java.util.List;

public class ProjectWork {
	private String workNo;
	private String workName;
	private String status;
	private String projectNo;
	private Date beginDate;
	private Date completeDate;
	// 선행작업 번호
	private String precedeNo;
	private String completeRate;
	// 작업 승인 대상자
	private String grantorNo;
	private String workLevel;
	private String highWorkNo;
	private String memo;
	private String workType;
	// 이 작업을 담당해야 하는 직원.
	private String memberNo;
	// 작업 취소/종료여부 -
	private String workStatus;
	// 여기서부턴 테이블은 아님.
	
	// highWorkNo 이름
	private String highWorkName;
	// 이 작업에 배정된 인원.
	private String memberName;
	// 총 몇일짜리 프로젝트?: completeDate - beginDate + 1
	private int days;
	
	// 간트차트때문에.
	// projectWorkListResultSet 를 썼을 경우 순서배정을 위한거임.
	private int rowNum;
	// 상위때문..
	private int highRowNum;
	
	public ProjectWork() {
	}
	
	public ProjectWork(String workNo, String workName, String status, String projectNo,
					   Date beginDate, Date completeDate, String precedeNo,
					   String completeRate, String grantorNo, String workLevel,
					   String highWorkNo, String memo, String workType, String memberNo,
					   String workStatus) {
		this.workNo = workNo;
		this.workName = workName;
		this.status = status;
		this.projectNo = projectNo;
		this.beginDate = beginDate;
		this.completeDate = completeDate;
		this.precedeNo = precedeNo;
		this.completeRate = completeRate;
		this.grantorNo = grantorNo;
		this.workLevel = workLevel;
		this.highWorkNo = highWorkNo;
		this.memo = memo;
		this.workType = workType;
		this.memberNo = memberNo;
		this.workStatus = workStatus;
	}
	
	@Override
	public String toString() {
		return "ProjectWork{" +
				"workNo='" + workNo + '\'' +
				", workName='" + workName + '\'' +
				", status='" + status + '\'' +
				", projectNo='" + projectNo + '\'' +
				", beginDate=" + beginDate +
				", completeDate=" + completeDate +
				", precedeNo='" + precedeNo + '\'' +
				", completeRate='" + completeRate + '\'' +
				", grantorNo='" + grantorNo + '\'' +
				", workLevel='" + workLevel + '\'' +
				", highWorkNo='" + highWorkNo + '\'' +
				", memo='" + memo + '\'' +
				", workType='" + workType + '\'' +
				", memberNo='" + memberNo + '\'' +
				", workStatus='" + workStatus + '\'' +
				'}';
	}
	
	public int getDays() {
		return days;
	}
	
	public void setDays(int days) {
		this.days = days + 1;
	}
	
	public String getMemberName() {
		return memberName;
	}
	
	public void setMemberName(String memberName) {
		this.memberName = memberName;
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
	
	public String getStatus() {
		return status;
	}
	
	public void setStatus(String status) {
		this.status = status;
	}
	
	public String getProjectNo() {
		return projectNo;
	}
	
	public void setProjectNo(String projectNo) {
		this.projectNo = projectNo;
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
	
	public String getPrecedeNo() {
		return precedeNo;
	}
	
	public void setPrecedeNo(String precedeNo) {
		this.precedeNo = precedeNo;
	}
	
	public String getCompleteRate() {
		return completeRate;
	}
	
	public void setCompleteRate(String completeRate) {
		this.completeRate = completeRate;
	}
	
	public String getGrantorNo() {
		return grantorNo;
	}
	
	public void setGrantorNo(String grantorNo) {
		this.grantorNo = grantorNo;
	}
	
	public String getWorkLevel() {
		return workLevel;
	}
	
	public void setWorkLevel(String workLevel) {
		this.workLevel = workLevel;
	}
	
	public String getHighWorkNo() {
		return highWorkNo;
	}
	
	public void setHighWorkNo(String highWorkNo) {
		this.highWorkNo = highWorkNo;
	}
	
	public String getHighWorkName() {
		return highWorkName;
	}
	
	public void setHighWorkName(String highWorkName) {
		this.highWorkName = highWorkName;
	}
	
	public String getMemo() {
		return memo;
	}
	
	public void setMemo(String memo) {
		this.memo = memo;
	}
	
	public String getWorkType() {
		return workType;
	}
	
	public void setWorkType(String workType) {
		this.workType = workType;
	}
	
	public String getMemberNo() {
		return memberNo;
	}
	
	public void setMemberNo(String memberNo) {
		this.memberNo = memberNo;
	}
	
	public String getWorkStatus() {
		return workStatus;
	}
	
	public void setWorkStatus(String workStatus) {
		this.workStatus = workStatus;
	}
	
	public int getRowNum() {
		return rowNum;
	}
	
	public void setRowNum(int rowNum) {
		this.rowNum = rowNum;
	}
	
	public int getHighRowNum() {
		return highRowNum;
	}
	
	public void setHighRowNum(int highRowNum) {
		this.highRowNum = highRowNum;
	}
}