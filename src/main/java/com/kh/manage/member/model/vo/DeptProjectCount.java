package com.kh.manage.member.model.vo;

public class DeptProjectCount {
	private String deptNo;
	private String deptName;
	private int before;
	private int proceeding;
	private int delay;
	private int complete;
	
	public DeptProjectCount() {}

	public DeptProjectCount(String deptNo, String deptName, int before, int proceeding, int delay, int complete) {
		super();
		this.deptNo = deptNo;
		this.deptName = deptName;
		this.before = before;
		this.proceeding = proceeding;
		this.delay = delay;
		this.complete = complete;
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

	public int getBefore() {
		return before;
	}

	public void setBefore(int before) {
		this.before = before;
	}

	public int getProceeding() {
		return proceeding;
	}

	public void setProceeding(int proceeding) {
		this.proceeding = proceeding;
	}

	public int getDelay() {
		return delay;
	}

	public void setDelay(int delay) {
		this.delay = delay;
	}

	public int getComplete() {
		return complete;
	}

	public void setComplete(int complete) {
		this.complete = complete;
	}

	@Override
	public String toString() {
		return "DeptProjectCount [deptNo=" + deptNo + ", deptName=" + deptName + ", before=" + before + ", proceeding="
				+ proceeding + ", delay=" + delay + ", complete=" + complete + "]";
	}

	
}
