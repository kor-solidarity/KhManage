package com.kh.manage.admin.adminManage.vo;

import java.sql.Date;

public class Access {
	private String accessGroupNo;
	private String accessName;
	private String aContent;
	private String Status;
	private Date createDate;
	private Date modifyDate;
	
	public Access() {}

	public Access(String accessGroupNo, String accessName, String aContent, String status, Date createDate,
			Date modifyDate) {
		super();
		this.accessGroupNo = accessGroupNo;
		this.accessName = accessName;
		this.aContent = aContent;
		Status = status;
		this.createDate = createDate;
		this.modifyDate = modifyDate;
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

	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	public Date getModifyDate() {
		return modifyDate;
	}

	public void setModifyDate(Date modifyDate) {
		this.modifyDate = modifyDate;
	}

	@Override
	public String toString() {
		return "Access [accessGroupNo=" + accessGroupNo + ", accessName=" + accessName + ", aContent=" + aContent
				+ ", Status=" + Status + ", createDate=" + createDate + ", modifyDate=" + modifyDate + "]";
	}

	
	
}
