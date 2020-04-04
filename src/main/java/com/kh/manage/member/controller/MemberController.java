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
	
	@RequestMapping("/userManagement.me")
	public String userManagementMain() {

		return "admin/userManagement/userManagement";
	}
	
	@RequestMapping("/registerUser.me")
	public String registerUser() {
		
		return "admin/userManagement/registerUser";
	}
	
	@RequestMapping("myProfile.me")
	public String myProfile() {
		
		return "user/myProfile/myProfileMain";
	}
	
		
}
