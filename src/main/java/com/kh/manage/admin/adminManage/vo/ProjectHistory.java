package com.kh.manage.admin.adminManage.vo;

import java.sql.Date;

public class ProjectHistory {
	private String type;
	private String historyName;
	private String name;
	private String status;
	private String date;
	
	public ProjectHistory() {}

	public ProjectHistory(String type, String historyName, String name, String status, String date) {
		super();
		this.type = type;
		this.historyName = historyName;
		this.name = name;
		this.status = status;
		this.date = date;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getHistoryName() {
		return historyName;
	}

	public void setHistoryName(String historyName) {
		this.historyName = historyName;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	@Override
	public String toString() {
		return "ProjectHistory [type=" + type + ", historyName=" + historyName + ", name=" + name + ", status=" + status
				+ ", date=" + date + "]";
	}

	
}
