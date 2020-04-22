package com.kh.manage.gwManage.model.vo;

public class GwRepeat {
	private String gwrNo;
	private String gwNo;
	private String gwrCycle;
	private String gwrLimit;
	private String gwrWeek;
	private String gwrMonth;
	private String endOption;
	private String endOptionDay;
	private String endOptionCount;
	
	public GwRepeat() {}

	public GwRepeat(String gwrNo, String gwNo, String gwrCycle, String gwrLimit, String gwrWeek, String gwrMonth,
			String endOption, String endOptionDay, String endOptionCount) {
		super();
		this.gwrNo = gwrNo;
		this.gwNo = gwNo;
		this.gwrCycle = gwrCycle;
		this.gwrLimit = gwrLimit;
		this.gwrWeek = gwrWeek;
		this.gwrMonth = gwrMonth;
		this.endOption = endOption;
		this.endOptionDay = endOptionDay;
		this.endOptionCount = endOptionCount;
	}

	public String getGwrNo() {
		return gwrNo;
	}

	public void setGwrNo(String gwrNo) {
		this.gwrNo = gwrNo;
	}

	public String getGwNo() {
		return gwNo;
	}

	public void setGwNo(String gwNo) {
		this.gwNo = gwNo;
	}

	public String getGwrCycle() {
		return gwrCycle;
	}

	public void setGwrCycle(String gwrCycle) {
		this.gwrCycle = gwrCycle;
	}

	public String getGwrLimit() {
		return gwrLimit;
	}

	public void setGwrLimit(String gwrLimit) {
		this.gwrLimit = gwrLimit;
	}

	public String getGwrWeek() {
		return gwrWeek;
	}

	public void setGwrWeek(String gwrWeek) {
		this.gwrWeek = gwrWeek;
	}

	public String getGwrMonth() {
		return gwrMonth;
	}

	public void setGwrMonth(String gwrMonth) {
		this.gwrMonth = gwrMonth;
	}

	public String getEndOption() {
		return endOption;
	}

	public void setEndOption(String endOption) {
		this.endOption = endOption;
	}

	public String getEndOptionDay() {
		return endOptionDay;
	}

	public void setEndOptionDay(String endOptionDay) {
		this.endOptionDay = endOptionDay;
	}

	public String getEndOptionCount() {
		return endOptionCount;
	}

	public void setEndOptionCount(String endOptionCount) {
		this.endOptionCount = endOptionCount;
	}

	@Override
	public String toString() {
		return "GwRepeat [gwrNo=" + gwrNo + ", gwNo=" + gwNo + ", gwrCycle=" + gwrCycle + ", gwrLimit=" + gwrLimit
				+ ", gwrWeek=" + gwrWeek + ", gwrMonth=" + gwrMonth + ", endOption=" + endOption + ", endOptionDay="
				+ endOptionDay + ", endOptionCount=" + endOptionCount + "]";
	}
	
	
	
	

}
