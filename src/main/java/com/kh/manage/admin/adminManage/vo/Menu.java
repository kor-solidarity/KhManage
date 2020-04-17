package com.kh.manage.admin.adminManage.vo;

public class Menu implements java.io.Serializable {
	private String menuNo;
	private String menuName;
	private String menuLevel;
	private String highMenu;
	private String icon;
	private String iAddress;
	private String status;
	
	public Menu() {}

	public Menu(String menuNo, String menuName, String menuLevel, String highMenu, String icon, String iAddress,
			String status) {
		super();
		this.menuNo = menuNo;
		this.menuName = menuName;
		this.menuLevel = menuLevel;
		this.highMenu = highMenu;
		this.icon = icon;
		this.iAddress = iAddress;
		this.status = status;
	}

	public String getMenuNo() {
		return menuNo;
	}

	public void setMenuNo(String menuNo) {
		this.menuNo = menuNo;
	}

	public String getMenuName() {
		return menuName;
	}

	public void setMenuName(String menuName) {
		this.menuName = menuName;
	}

	public String getMenuLevel() {
		return menuLevel;
	}

	public void setMenuLevel(String menuLevel) {
		this.menuLevel = menuLevel;
	}

	public String getHighMenu() {
		return highMenu;
	}

	public void setHighMenu(String highMenu) {
		this.highMenu = highMenu;
	}

	public String getIcon() {
		return icon;
	}

	public void setIcon(String icon) {
		this.icon = icon;
	}

	public String getiAddress() {
		return iAddress;
	}

	public void setiAddress(String iAddress) {
		this.iAddress = iAddress;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	@Override
	public String toString() {
		return "Menu [menuNo=" + menuNo + ", menuName=" + menuName + ", menuLevel=" + menuLevel + ", highMenu="
				+ highMenu + ", icon=" + icon + ", iAddress=" + iAddress + ", status=" + status + "]";
	}

	
	
}
