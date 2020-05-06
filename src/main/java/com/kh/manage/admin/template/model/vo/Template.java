package com.kh.manage.admin.template.model.vo;

import java.sql.Date;

import org.springframework.stereotype.Component;
@Component
public class Template {
	private String templatePk;		
	private String projectTypePk;
	private String memberPk;
	private String templateName;
	private String detail;
	private Date createDate;
	private Date editDate;
	private String status;
	
	public Template() {}

	public Template(String templatePk, String projectTypePk, String memberPk, String templateName, String detail,
			Date createDate, Date editDate, String status) {
		super();
		this.templatePk = templatePk;
		this.projectTypePk = projectTypePk;
		this.memberPk = memberPk;
		this.templateName = templateName;
		this.detail = detail;
		this.createDate = createDate;
		this.editDate = editDate;
		this.status = status;
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

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	@Override
	public String toString() {
		return "Template [templatePk=" + templatePk + ", projectTypePk=" + projectTypePk + ", memberPk=" + memberPk
				+ ", templateName=" + templateName + ", detail=" + detail + ", createDate=" + createDate + ", editDate="
				+ editDate + ", status=" + status + "]";
	}

	
	
	
	
}
