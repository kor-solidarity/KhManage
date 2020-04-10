package com.kh.manage.admin.template.model.vo;

import java.sql.Date;

public class Template implements java.io.Serializable{
	private String templatePk;		
	private String projectTypePk;
	private String memberPk;
	private String templateName;
	private String detail;
	private Date createDate;
	private Date editDate;
	
	public Template() {}

	public Template(String templatePk, String projectTypePk, String memberPk, String templateName, String detail,
			Date createDate, Date editDate) {
		super();
		this.templatePk = templatePk;
		this.projectTypePk = projectTypePk;
		this.memberPk = memberPk;
		this.templateName = templateName;
		this.detail = detail;
		this.createDate = createDate;
		this.editDate = editDate;
	}

	public String getTemplatePk() {
		return templatePk;
	}

	public void setTemplatePk(String templatePk) {
		this.templatePk = templatePk;
	}

	public String getProjectTypePk() {
		return projectTypePk;
	}

	public void setProjectTypePk(String projectTypePk) {
		this.projectTypePk = projectTypePk;
	}

	public String getMemberPk() {
		return memberPk;
	}

	public void setMemberPk(String memberPk) {
		this.memberPk = memberPk;
	}

	public String getTemplateName() {
		return templateName;
	}

	public void setTemplateName(String templateName) {
		this.templateName = templateName;
	}

	public String getDetail() {
		return detail;
	}

	public void setDetail(String detail) {
		this.detail = detail;
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

	@Override
	public String toString() {
		return "Template [templatePk=" + templatePk + ", projectTypePk=" + projectTypePk + ", memberPk=" + memberPk
				+ ", templateName=" + templateName + ", detail=" + detail + ", createDate=" + createDate + ", editDate="
				+ editDate + "]";
	}
	
	
	
	
}
