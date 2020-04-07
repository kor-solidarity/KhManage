package com.kh.manage.admin.access.vo;

public class Access {
	private String accessGroupNo;
	private String accessName;
	private String aContent;
	private String Status;
	
	public Access() {}

	public Access(String accessGroupNo, String accessName, String aContent, String status) {
		super();
		this.accessGroupNo = accessGroupNo;
		this.accessName = accessName;
		this.aContent = aContent;
		Status = status;
	}

	public String getAccessGroupNo() {
		return accessGroupNo;
	}

	public void setAccessGroupNo(String accessGroupNo) {
		this.accessGroupNo = accessGroupNo;
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

	public String getStatus() {
		return Status;
	}

	public void setStatus(String status) {
		Status = status;
	}

	@Override
	public String toString() {
		return "Access [accessGroupNo=" + accessGroupNo + ", accessName=" + accessName + ", aContent=" + aContent
				+ ", Status=" + Status + "]";
	}
	
	
}
