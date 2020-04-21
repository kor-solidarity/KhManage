package com.kh.manage.common;

public class Report implements java.io.Serializable{

	private String reportNo;
	private String division;
	private String reportMember;
	
	public Report() {}

	public Report(String reportNo, String division, String reportMember) {
		super();
		this.reportNo = reportNo;
		this.division = division;
		this.reportMember = reportMember;
	}

	public String getReportNo() {
		return reportNo;
	}

	public void setReportNo(String reportNo) {
		this.reportNo = reportNo;
	}

	public String getDivision() {
		return division;
	}

	public void setDivision(String division) {
		this.division = division;
	}

	public String getReportMember() {
		return reportMember;
	}

	public void setReportMember(String reportMember) {
		this.reportMember = reportMember;
	}

	@Override
	public String toString() {
		return "Report [reportNo=" + reportNo + ", division=" + division + ", reportMember=" + reportMember + "]";
	}
	
	
	
}
