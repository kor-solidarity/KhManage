package com.kh.manage.project.model.vo;

import java.sql.Date;

public class GanttInfo {
	// projectTask2.jsp 에 쓰일 간트차트용 정보 수록
	
	// YYYY-MM-dd
	private String startDate;
	// private Date startDate;
	// startDate 에서 보여줄 날짜까지 총 몇일?
	private int totalDays;
	
	public GanttInfo() {
	}
	
	public GanttInfo(String startDate, int totalDays) {
		this.startDate = startDate;
		this.totalDays = totalDays;
	}
	
	@Override
	public String toString() {
		return "GanttInfo{" +
				"startDate='" + startDate + '\'' +
				", totalDays=" + totalDays +
				'}';
	}
	
	public String getStartDate() {
		return startDate;
	}
	
	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}
	
	public int getTotalDays() {
		return totalDays;
	}
	
	public void setTotalDays(int totalDays) {
		this.totalDays = totalDays;
	}
}
