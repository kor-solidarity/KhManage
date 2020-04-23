package com.kh.manage.issue.model.vo;

import java.sql.Date;

public class IssueHistory implements java.io.Serializable{
	private String ihNo;
	private String issueNo;
	private String ihContent;
	private Date ihDate;
	private String status;
	
	public IssueHistory() {}

	public IssueHistory(String ihNo, String issueNo, String ihContent, Date ihDate, String status) {
		super();
		this.ihNo = ihNo;
		this.issueNo = issueNo;
		this.ihContent = ihContent;
		this.ihDate = ihDate;
		this.status = status;
	}

	public String getIhNo() {
		return ihNo;
	}

	public void setIhNo(String ihNo) {
		this.ihNo = ihNo;
	}

	public String getIssueNo() {
		return issueNo;
	}

	public void setIssueNo(String issueNo) {
		this.issueNo = issueNo;
	}

	public String getIhContent() {
		return ihContent;
	}

	public void setIhContent(String ihContent) {
		this.ihContent = ihContent;
	}

	public Date getIhDate() {
		return ihDate;
	}

	public void setIhDate(Date ihDate) {
		this.ihDate = ihDate;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	@Override
	public String toString() {
		return "IssueHistory [ihNo=" + ihNo + ", issueNo=" + issueNo + ", ihContent=" + ihContent + ", ihDate=" + ihDate
				+ ", status=" + status + "]";
	}
	
	
}
