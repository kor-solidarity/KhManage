package com.kh.manage.work.model.vo;

public class WorkProjectTeam implements java.io.Serializable{
	private String teamPk;
	private String projectPk;
	private String memberPk;
	private String role;
	private String projectName;
	
	public WorkProjectTeam() {}

	public WorkProjectTeam(String teamPk, String projectPk, String memberPk, String role, String projectName) {
		super();
		this.teamPk = teamPk;
		this.projectPk = projectPk;
		this.memberPk = memberPk;
		this.role = role;
		this.projectName = projectName;
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

	public String getProjectName() {
		return projectName;
	}

	public void setProjectName(String projectName) {
		this.projectName = projectName;
	}

	@Override
	public String toString() {
		return "WorkProjectTeam [teamPk=" + teamPk + ", projectPk=" + projectPk + ", memberPk=" + memberPk + ", role="
				+ role + ", projectName=" + projectName + "]";
	}

	
	
}
