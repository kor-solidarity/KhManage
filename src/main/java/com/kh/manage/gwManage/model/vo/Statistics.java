package com.kh.manage.gwManage.model.vo;

public class Statistics {
	private String wStatus;
	private String issueType;
	private String hStatus;
	private int cnt;
	private int cnt2;
	private int cnt3;
	
	public Statistics() {}

	public Statistics(String wStatus, String issueType, String hStatus, int cnt, int cnt2, int cnt3) {
		super();
		this.wStatus = wStatus;
		this.issueType = issueType;
		this.hStatus = hStatus;
		this.cnt = cnt;
		this.cnt2 = cnt2;
		this.cnt3 = cnt3;
	}

	public String getwStatus() {
		return wStatus;
	}

	public void setwStatus(String wStatus) {
		this.wStatus = wStatus;
	}

	public String getIssueType() {
		return issueType;
	}

	public void setIssueType(String issueType) {
		this.issueType = issueType;
	}

	public String gethStatus() {
		return hStatus;
	}

	public void sethStatus(String hStatus) {
		this.hStatus = hStatus;
	}

	public int getCnt() {
		return cnt;
	}

	public void setCnt(int cnt) {
		this.cnt = cnt;
	}

	public int getCnt2() {
		return cnt2;
	}

	public void setCnt2(int cnt2) {
		this.cnt2 = cnt2;
	}

	public int getCnt3() {
		return cnt3;
	}

	public void setCnt3(int cnt3) {
		this.cnt3 = cnt3;
	}

	@Override
	public String toString() {
		return "Statistics [wStatus=" + wStatus + ", issueType=" + issueType + ", hStatus=" + hStatus + ", cnt=" + cnt
				+ ", cnt2=" + cnt2 + ", cnt3=" + cnt3 + "]";
	}

	

	
	

}
