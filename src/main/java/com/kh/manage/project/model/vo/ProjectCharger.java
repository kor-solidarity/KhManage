package com.kh.manage.project.model.vo;

public class ProjectCharger {
	// 프로젝트 작업 내 담당자 목록
	private String workChargerNo;
	private String memberNo;
	private String workNo;
	// 담당자 이름. 테이블에 없는거고 따로 떼와야한다.
	private String memberName;
	
	public ProjectCharger(String workChargerNo, String memberNo, String workNo, String memberName) {
		this.workChargerNo = workChargerNo;
		this.memberNo = memberNo;
		this.workNo = workNo;
		this.memberName = memberName;
	}
	
	public ProjectCharger() {
	}
	
	@Override
	public String toString() {
		return "ProjectCharger{" +
				"workChargerNo='" + workChargerNo + '\'' +
				", memberNo='" + memberNo + '\'' +
				", workNo='" + workNo + '\'' +
				", memberName='" + memberName + '\'' +
				'}';
	}
	
	public String getWorkChargerNo() {
		return workChargerNo;
	}
	
	public void setWorkChargerNo(String workChargerNo) {
		this.workChargerNo = workChargerNo;
	}
	
	public String getMemberNo() {
		return memberNo;
	}
	
	public void setMemberNo(String memberNo) {
		this.memberNo = memberNo;
	}
	
	public String getWorkNo() {
		return workNo;
	}
	
	public void setWorkNo(String workNo) {
		this.workNo = workNo;
	}
	
	public String getMemberName() {
		return memberName;
	}
	
	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}
}

