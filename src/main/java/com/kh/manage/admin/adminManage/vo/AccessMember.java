package com.kh.manage.admin.adminManage.vo;

public class AccessMember {
	private String accessNo;
	private String accessName;
	private String aContent;
	private String memberNo;
	
	public AccessMember() {}

	public AccessMember(String accessNo, String accessName, String aContent, String memberNo) {
		super();
		this.accessNo = accessNo;
		this.accessName = accessName;
		this.aContent = aContent;
		this.memberNo = memberNo;
	}

	public String getAccessNo() {
		return accessNo;
	}

	public void setAccessNo(String accessNo) {
		this.accessNo = accessNo;
	}

	public String getAccessName() {
		return accessName;
	}

	public void setAccessName(String accessName) {
		this.accessName = accessName;
	}

	public String getaContent() {
		return aContent;
	}

	public void setaContent(String aContent) {
		this.aContent = aContent;
	}

	public String getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(String memberNo) {
		this.memberNo = memberNo;
	}

	@Override
	public String toString() {
		return "AccessMember [accessNo=" + accessNo + ", accessName=" + accessName + ", aContent=" + aContent
				+ ", memberNo=" + memberNo + "]";
	}

	
	
	
	
}
