package com.kh.manage.admin.adminManage.vo;

public class MenuAccess implements java.io.Serializable {
	private String menuName;
	private String menuNo;
	private String status;
	private String memberNo;
	private String accessGroupNo;
	
	public MenuAccess() {}

	public MenuAccess(String menuName, String menuNo, String status, String memberNo, String accessGroupNo) {
		super();
		this.menuName = menuName;
		this.menuNo = menuNo;
		this.status = status;
		this.memberNo = memberNo;
		this.accessGroupNo = accessGroupNo;
	}

	public String getMenuName() {
		return menuName;
	}

	public void setMenuName(String menuName) {
		this.menuName = menuName;
	}

	public String getMenuNo() {
		return menuNo;
	}

	public void setMenuNo(String menuNo) {
		this.menuNo = menuNo;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(String memberNo) {
		this.memberNo = memberNo;
	}

	public String getAccessGroupNo() {
		return accessGroupNo;
	}

	public void setAccessGroupNo(String accessGroupNo) {
		this.accessGroupNo = accessGroupNo;
	}

	@Override
	public String toString() {
		return "MenuAccess [menuName=" + menuName + ", menuNo=" + menuNo + ", status=" + status + ", memberNo="
				+ memberNo + ", accessGroupNo=" + accessGroupNo + "]";
	}

	
		
}
