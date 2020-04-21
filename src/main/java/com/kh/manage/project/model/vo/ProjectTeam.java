package com.kh.manage.project.model.vo;

public class ProjectTeam {
	private String teamPk;
	private String projectPk;
	private String memberPk;
	private String role;
	// 이하 프로젝트 팀 테이블에 존재하진 않음.
	private String memberName;
	// 소속부서명
	private String deptName;
	// 직책
	private String rankName;
	// 작업에 팀 목록을 불러오고 있는 경우 쓰임. 해당 작업에 배정됬는지에 대한 여부.
	private int checked = 0;
	
	public ProjectTeam() {
	}
	
	public ProjectTeam(String teamPk, String projectPk, String memberPk, String role,
					   String memberName, String deptName, String rankName) {
		this.teamPk = teamPk;
		this.projectPk = projectPk;
		this.memberPk = memberPk;
		this.role = role;
		this.memberName = memberName;
		this.deptName = deptName;
		this.rankName = rankName;
	}
	
	@Override
	public String toString() {
		return "ProjectTeam{" +
				"teamPk='" + teamPk + '\'' +
				", projectPk='" + projectPk + '\'' +
				", memberPk='" + memberPk + '\'' +
				", role='" + role + '\'' +
				", memberName='" + memberName + '\'' +
				", rankName='" + rankName + '\'' +
				", checked=" + checked +
				'}';
	}
	
	public String getDeptName() {
		return deptName;
	}
	
	public void setDeptName(String deptName) {
		this.deptName = deptName;
	}
	
	public String getTeamPk() {
		return teamPk;
	}
	
	public void setTeamPk(String teamPk) {
		this.teamPk = teamPk;
	}
	
	public String getProjectPk() {
		return projectPk;
	}
	
	public void setProjectPk(String projectPk) {
		this.projectPk = projectPk;
	}
	
	public String getMemberPk() {
		return memberPk;
	}
	
	public void setMemberPk(String memberPk) {
		this.memberPk = memberPk;
	}
	
	public String getRole() {
		return role;
	}
	
	public void setRole(String role) {
		this.role = role;
	}
	
	public String getMemberName() {
		return memberName;
	}
	
	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}
	
	public String getRankName() {
		return rankName;
	}
	
	public void setRankName(String rankName) {
		this.rankName = rankName;
	}
	
	public int getChecked() {
		return checked;
	}
	
	public void setChecked(int checked) {
		this.checked = checked;
	}
}
