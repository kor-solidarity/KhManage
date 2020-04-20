package com.kh.manage.issue.model.vo;

public class IssueProjectTeam implements java.io.Serializable{
	private String teamPk;
	private String projectPk;
	private String memberPk;
	private String role;
	private String memberName;
	
	public IssueProjectTeam() {}

	public IssueProjectTeam(String teamPk, String projectPk, String memberPk, String role, String memberName) {
		super();
		this.teamPk = teamPk;
		this.projectPk = projectPk;
		this.memberPk = memberPk;
		this.role = role;
		this.memberName = memberName;
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

	@Override
	public String toString() {
		return "IssueProjectTeam [teamPk=" + teamPk + ", projectPk=" + projectPk + ", memberPk=" + memberPk + ", role="
				+ role + ", memberName=" + memberName + "]";
	}

	
	
	
}
