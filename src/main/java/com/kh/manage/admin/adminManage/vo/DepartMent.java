package com.kh.manage.admin.adminManage.vo;

public class DepartMent {
	private String deptNo;
	private String deptName;
	private String highDept;
	private String deptLevle;
	
	public DepartMent() {}

	public DepartMent(String deptNo, String deptName, String hightDept, String deptLevle) {
		super();
		this.deptNo = deptNo;
		this.deptName = deptName;
		this.highDept = hightDept;
		this.deptLevle = deptLevle;
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

	public String getHighDept() {
		return highDept;
	}

	public void setHighDept(String highDept) {
		this.highDept = highDept;
	}

	public String getDeptLevle() {
		return deptLevle;
	}

	public void setDeptLevle(String deptLevle) {
		this.deptLevle = deptLevle;
	}

	@Override
	public String toString() {
		return "DepartMent [deptNo=" + deptNo + ", deptName=" + deptName + ", hightDept=" + highDept + ", deptLevle="
				+ deptLevle + "]";
	}
	
	
}
