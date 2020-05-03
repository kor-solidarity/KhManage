package com.kh.manage.member.model.vo;

public class ProjectRank {
	private int month;
	private int ssCount;
	private int sCount;
	private int aCount;
	private int bCount;
	private int cCount;
	
	public ProjectRank() {}

	public ProjectRank(int month, int ssCount, int sCount, int aCount, int bCount, int cCount) {
		super();
		this.month = month;
		this.ssCount = ssCount;
		this.sCount = sCount;
		this.aCount = aCount;
		this.bCount = bCount;
		this.cCount = cCount;
	}

	public int getMonth() {
		return month;
	}

	public void setMonth(int month) {
		this.month = month;
	}

	public int getSsCount() {
		return ssCount;
	}

	public void setSsCount(int ssCount) {
		this.ssCount = ssCount;
	}

	public int getsCount() {
		return sCount;
	}

	public void setsCount(int sCount) {
		this.sCount = sCount;
	}

	public int getaCount() {
		return aCount;
	}

	public void setaCount(int aCount) {
		this.aCount = aCount;
	}

	public int getbCount() {
		return bCount;
	}

	public void setbCount(int bCount) {
		this.bCount = bCount;
	}

	public int getcCount() {
		return cCount;
	}

	public void setcCount(int cCount) {
		this.cCount = cCount;
	}

	@Override
	public String toString() {
		return "ProjectRank [month=" + month + ", ssCount=" + ssCount + ", sCount=" + sCount + ", aCount=" + aCount
				+ ", bCount=" + bCount + ", cCount=" + cCount + "]";
	}
	
	

}
