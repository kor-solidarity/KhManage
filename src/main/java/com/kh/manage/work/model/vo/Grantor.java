package com.kh.manage.work.model.vo;

public class Grantor implements java.io.Serializable{
	private String memberPk;
	private String memberName;
	
	public Grantor() {}

	public Grantor(String memberPk, String memberName) {
		super();
		this.memberPk = memberPk;
		this.memberName = memberName;
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

	@Override
	public String toString() {
		return "Grantor [memberPk=" + memberPk + ", memberName=" + memberName + "]";
	}
	
	
}
