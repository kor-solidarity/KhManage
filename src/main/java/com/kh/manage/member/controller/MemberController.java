package com.kh.manage.member.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import com.kh.manage.member.model.exception.LoginException;
import com.kh.manage.member.model.service.MemberService;
import com.kh.manage.member.model.vo.Member;


@Controller
@SessionAttributes("loginUser")
public class MemberController {
	@Autowired
	private MemberService ms;
	@Autowired
	private BCryptPasswordEncoder passwordEncoder;
	

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
	
	@RequestMapping("/detailDashboard.me")
	public String detailDashboard() {
		
		return "user/main/detailDashboard";
	}
	
	@RequestMapping("synthesisDashboard.me")
	public String synthesisDashboard() {
		
		return "user/main/synthesisDashboard";
	}
	
	
	//*************************************************

//	@RequestMapping("/login.me")
//	public String loginCheck(Member m, Model model) {
////		String memberId = request.getParameter("memberId");
////		String memberPwd = request.getParameter("memberPwd");
//		
//		Member loginUser;
//		
//		try {
//			loginUser = ms.loginMember(m);
//			
//			model.addAttribute("loginUser", loginUser);
//			
//			return "user/main/userMainPage";
//		} catch (LoginException e) {
//			model.addAttribute("msg", e.getMessage());
//			
//			return "common/errorPage";
//		}
//		
//	}
//
//	
//	@RequestMapping("logout.me")
//	public String logout(SessionStatus status) {
//		 
//		status.setComplete();
//		
//		return "redirect:index.jsp";
//	}
//	
//	
//	@RequestMapping("insert.me")
//	public String inertMember(Model model, Member m) {
//		
//		System.out.println("controller member : " + m);
//		
//		m.setMemberPwd(passwordEncoder.encode(m.getMemberPwd()));
//		
//		int result = ms.insertMember(m);
//		
//		if(result > 0) {
//			
//			return "redirect:index.jsp";
//		} else {
//			model.addAttribute("msg", "회원 가입실패!");
//			
//			return "common/errorPage";
//		}
//		
//	}
		
		
	
	
	
	
	
	
	
	
	
		
}












