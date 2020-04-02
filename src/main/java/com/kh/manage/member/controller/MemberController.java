package com.kh.manage.member.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MemberController {

	@RequestMapping("/login.me")
	public String loginCheck() {
		
		return "user/main/userMainPage";
	}
	
	@RequestMapping("/adminShowMain.me")
	public String showAdminPage() {
		
		return "admin/main/adminMainPage";
	}
	
	@RequestMapping("/userManagement.um")
	public String userManagementMain() {

		return "admin/userManagement/userManagement";
	}
	
}
