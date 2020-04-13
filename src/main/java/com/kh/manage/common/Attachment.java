package com.kh.manage.common;

public class Attachment implements java.io.Serializable{
	
	private String atNo;
	private String division;
	private String originName;
	private String changeName;
	private String filePath;
	
	public Attachment() {}

	public Attachment(String atNo, String division, String originName, String changeName, String filePath) {
		super();
		this.atNo = atNo;
		this.division = division;
		this.originName = originName;
		this.changeName = changeName;
		this.filePath = filePath;
	}

	public String getAtNo() {
		return atNo;
	}

	public void setAtNo(String atNo) {
		this.atNo = atNo;
	}

	public String getDivision() {
		return division;
	}

	public void setDivision(String division) {
		this.division = division;
	}

	public String getOriginName() {
		return originName;
	}

	public void setOriginName(String originName) {
		this.originName = originName;
	}

	public String getChangeName() {
		return changeName;
	}

	public void setChangeName(String changeName) {
		this.changeName = changeName;
	}

	public String getFilePath() {
		return filePath;
	}

	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}

	@Override
	public String toString() {
		return "Attachment [atNo=" + atNo + ", division=" + division + ", originName=" + originName + ", changeName="
				+ changeName + ", filePath=" + filePath + "]";
	}

	

}