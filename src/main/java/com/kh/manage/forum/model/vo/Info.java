package com.kh.manage.forum.model.vo;

import java.sql.Date;

public class Info {

	private String infoPk;
	private String title;
	private String content;
	private Date createDate;
	private Date editDate;
	private String memberPk;
	private String status;
	
	public Info() {}

	public Info(String infoPk, String title, String content, Date createDate, Date editDate, String memberPk,
			String status) {
		super();
		this.infoPk = infoPk;
		this.title = title;
		this.content = content;
		this.createDate = createDate;
		this.editDate = editDate;
		this.memberPk = memberPk;
		this.status = status;
	}

	public String getInfoPk() {
		return infoPk;
	}

	public void setInfoPk(String infoPk) {
		this.infoPk = infoPk;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	public Date getEditDate() {
		return editDate;
	}

	public void setEditDate(Date editDate) {
		this.editDate = editDate;
	}

	public String getMemberPk() {
		return memberPk;
	}

	public void setMemberPk(String memberPk) {
		this.memberPk = memberPk;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	@Override
	public String toString() {
		return "Info [infoPk=" + infoPk + ", title=" + title + ", content=" + content + ", createDate=" + createDate
				+ ", editDate=" + editDate + ", memberPk=" + memberPk + ", status=" + status + "]";
	}

	
	
	
}
