package com.kh.manage.admin.adminManage.vo;

import java.sql.Date;

public class DeptHistory {
	private String deptHistoryNo;
	private String changeMember;
	private Date changeDate;
	private String cContent;
	private String originDept;
	private String changeDept;
	private String rankNo;
	
	public DeptHistory() {}

	public DeptHistory(String deptHistoryNo, String changeMember, Date changeDate, String cContent, String originDept,
			String changeDept, String rankNo) {
		super();
		this.deptHistoryNo = deptHistoryNo;
		this.changeMember = changeMember;
		this.changeDate = changeDate;
		this.cContent = cContent;
		this.originDept = originDept;
		this.changeDept = changeDept;
		this.rankNo = rankNo;
	}

	public String getDeptHistoryNo() {
		return deptHistoryNo;
	}

	public void setDeptHistoryNo(String deptHistoryNo) {
		this.deptHistoryNo = deptHistoryNo;
	}

	public String getChangeMember() {
		return changeMember;
	}

	public void setChangeMember(String changeMember) {
		this.changeMember = changeMember;
	}

	public Date getChangeDate() {
		return changeDate;
	}

	public void setChangeDate(Date changeDate) {
		this.changeDate = changeDate;
	}

	public String getcContent() {
		return cContent;
	}

	public void setcContent(String cContent) {
		this.cContent = cContent;
	}

	public String getOriginDept() {
		return originDept;
	}

	public void setOriginDept(String originDept) {
		this.originDept = originDept;
	}

	public String getChangeDept() {
		return changeDept;
	}

	public void setChangeDept(String changeDept) {
		this.changeDept = changeDept;
	}

	public String getRankNo() {
		return rankNo;
	}

	public void setRankNo(String rankNo) {
		this.rankNo = rankNo;
	}

	@Override
	public String toString() {
		return "DeptHistory [deptHistoryNo=" + deptHistoryNo + ", changeMember=" + changeMember + ", changeDate="
				+ changeDate + ", cContent=" + cContent + ", originDept=" + originDept + ", changeDept=" + changeDept
				+ ", rankNo=" + rankNo + "]";
	}

	
	
}
