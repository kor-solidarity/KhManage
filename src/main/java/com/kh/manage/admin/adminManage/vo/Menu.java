package com.kh.manage.admin.adminManage.vo;

public class Menu {
	private String menuNo;
	private String menuName;
	private String menuLevel;
	private String highMenu;
	
	public Menu() {}

	public Menu(String menuNo, String menuName, String menuLevel, String highMenu) {
		super();
		this.menuNo = menuNo;
		this.menuName = menuName;
		this.menuLevel = menuLevel;
		this.highMenu = highMenu;
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

	@Override
	public String toString() {
		return "Menu [menuNo=" + menuNo + ", menuName=" + menuName + ", menuLevel=" + menuLevel + ", highMenu="
				+ highMenu + "]";
	}
	
	
	
}
