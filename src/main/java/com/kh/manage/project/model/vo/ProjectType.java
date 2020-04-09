package com.kh.manage.project.model.vo;

public class ProjectType {
	private String typePk;
	private String typeName;
	
	public ProjectType() {
	}
	
	public ProjectType(String typePk, String typeName) {
		this.typePk = typePk;
		this.typeName = typeName;
	}
	
	@Override
	public String toString() {
		return "ProjectType{" +
				"typePk='" + typePk + '\'' +
				", typeName='" + typeName + '\'' +
				'}';
	}
	
	public String getTypePk() {
		return typePk;
	}
	
	public void setTypePk(String typePk) {
		this.typePk = typePk;
	}
	
	public String getTypeName() {
		return typeName;
	}
	
	public void setTypeName(String typeName) {
		this.typeName = typeName;
	}
}
