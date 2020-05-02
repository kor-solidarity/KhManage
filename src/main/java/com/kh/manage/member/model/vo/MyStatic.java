package com.kh.manage.member.model.vo;

import java.sql.Date;
import java.util.ArrayList;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.kh.manage.work.model.vo.WorkAttachment;

public class MyStatic implements java.io.Serializable{

	private String workNo;
	private String workName;
	private String status;
	private String projectNo;
	private String projectName;
	@JsonFormat(pattern="yyyy-MM-dd")
	private Date beginDate;
	@JsonFormat(pattern="yyyy-MM-dd")
	private Date completeDate;
	private String precedeNo;
	private String completeRate;
	private String grantorNo;
	private String workLevel;
	private String highWorkNo;
	private String memo;
	private String workType;
	private String memberNo;
	private String workStatus;
	private ArrayList<WorkAttachment> workAttachment;
	//'시작전', '개발중', '개발완료', '테스트완료', 'PL검토중', 'PL검토완료', '개발지연'
	private int before;
	private int developing;
	private int completed;
	private int testCompleted;
	private int plChecking;
	private int plChecked;
	private int delayed;

	public MyStatic() {}

	public MyStatic(String workNo, String workName, String status, String projectNo, String projectName, Date beginDate,
			Date completeDate, String precedeNo, String completeRate, String grantorNo, String workLevel,
			String highWorkNo, String memo, String workType, String memberNo, String workStatus,
			ArrayList<WorkAttachment> workAttachment, int before, int developing, int completed, int testCompleted,
			int plChecking, int plChecked, int delayed) {
		super();
		this.workNo = workNo;
		this.workName = workName;
		this.status = status;
		this.projectNo = projectNo;
		this.projectName = projectName;
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
		this.workAttachment = workAttachment;
		this.before = before;
		this.developing = developing;
		this.completed = completed;
		this.testCompleted = testCompleted;
		this.plChecking = plChecking;
		this.plChecked = plChecked;
		this.delayed = delayed;
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

	public String getProjectName() {
		return projectName;
	}

	public void setProjectName(String projectName) {
		this.projectName = projectName;
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

	public ArrayList<WorkAttachment> getWorkAttachment() {
		return workAttachment;
	}

	public void setWorkAttachment(ArrayList<WorkAttachment> workAttachment) {
		this.workAttachment = workAttachment;
	}

	public int getBefore() {
		return before;
	}

	public void setBefore(int before) {
		this.before = before;
	}

	public int getDeveloping() {
		return developing;
	}

	public void setDeveloping(int developing) {
		this.developing = developing;
	}

	public int getCompleted() {
		return completed;
	}

	public void setCompleted(int completed) {
		this.completed = completed;
	}

	public int getTestCompleted() {
		return testCompleted;
	}

	public void setTestCompleted(int testCompleted) {
		this.testCompleted = testCompleted;
	}

	public int getPlChecking() {
		return plChecking;
	}

	public void setPlChecking(int plChecking) {
		this.plChecking = plChecking;
	}

	public int getPlChecked() {
		return plChecked;
	}

	public void setPlChecked(int plChecked) {
		this.plChecked = plChecked;
	}

	public int getDelayed() {
		return delayed;
	}

	public void setDelayed(int delayed) {
		this.delayed = delayed;
	}

	@Override
	public String toString() {
		return "MyStatic [workNo=" + workNo + ", workName=" + workName + ", status=" + status + ", projectNo="
				+ projectNo + ", projectName=" + projectName + ", beginDate=" + beginDate + ", completeDate="
				+ completeDate + ", precedeNo=" + precedeNo + ", completeRate=" + completeRate + ", grantorNo="
				+ grantorNo + ", workLevel=" + workLevel + ", highWorkNo=" + highWorkNo + ", memo=" + memo
				+ ", workType=" + workType + ", memberNo=" + memberNo + ", workStatus=" + workStatus
				+ ", workAttachment=" + workAttachment + ", before=" + before + ", developing=" + developing
				+ ", completed=" + completed + ", testCompleted=" + testCompleted + ", plChecking=" + plChecking
				+ ", plChecked=" + plChecked + ", delayed=" + delayed + "]";
	}
	


}
