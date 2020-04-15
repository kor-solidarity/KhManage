package com.kh.manage.project.model.vo;

public class ProjectTeam {
	private String teamPk;
	private String projectPk;
	private String memberPk;
	private String role;
	
	public ProjectTeam() {
	}
	
	public ProjectTeam(String teamPk, String projectPk,
					   String memberPk, String role) {
		this.teamPk = teamPk;
		this.projectPk = projectPk;
		this.memberPk = memberPk;
		this.role = role;
	}
	
	@Override
	public String toString() {
		return "ProjectTeam{" +
				"teamPk='" + teamPk + '\'' +
				", projectPk='" + projectPk + '\'' +
				", memberPk='" + memberPk + '\'' +
				", role='" + role + '\'' +
				'}';
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
}
