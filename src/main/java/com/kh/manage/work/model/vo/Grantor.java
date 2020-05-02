package com.kh.manage.work.model.vo;

public class Grantor implements java.io.Serializable{
	private String memberPk;
	private String memberName;
	private String deptName;
	private String rankName;
	
	public Grantor() {}

	public Grantor(String memberPk, String memberName, String deptName, String rankName) {
		super();
		this.memberPk = memberPk;
		this.memberName = memberName;
		this.deptName = deptName;
		this.rankName = rankName;
	}

	public String getMemberPk() {
		return memberPk;
	}

	public void setMemberPk(String memberPk) {
		this.memberPk = memberPk;
	}

	public String getMemberName() {
		return memberName;
	}

	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}

	public String getDeptName() {
		return deptName;
	}

	public void setDeptName(String deptName) {
		this.deptName = deptName;
	}

	public String getRankName() {
		return rankName;
	}

	public void setRankName(String rankName) {
		this.rankName = rankName;
	}

	@Override
	public String toString() {
		return "Grantor [memberPk=" + memberPk + ", memberName=" + memberName + ", deptName=" + deptName + ", rankName="
				+ rankName + "]";
	}

	
}
