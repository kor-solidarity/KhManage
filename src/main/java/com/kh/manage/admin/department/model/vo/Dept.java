package com.kh.manage.admin.department.model.vo;

public class Dept {

	private String deptNo;
	private String deptName;
	private String highDept;
	private String deptLevel;
	
	public Dept() {}

	public Dept(String deptNo, String deptName, String highDept, String deptLevel) {
		super();
		this.deptNo = deptNo;
		this.deptName = deptName;
		this.highDept = highDept;
		this.deptLevel = deptLevel;
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

	public String getDeptLevel() {
		return deptLevel;
	}

	public void setDeptLevel(String deptLevel) {
		this.deptLevel = deptLevel;
	}

	@Override
	public String toString() {
		return "Dept [deptNo=" + deptNo + ", deptName=" + deptName + ", highDept=" + highDept + ", deptLevel="
				+ deptLevel + "]";
	}


	
	
	
}
