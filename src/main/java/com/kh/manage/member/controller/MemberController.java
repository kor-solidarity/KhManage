package com.kh.manage.member.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import com.google.gson.Gson;
import com.kh.manage.admin.adminManage.vo.DepartMent;
import com.kh.manage.admin.department.model.vo.Dept;
import com.kh.manage.admin.rank.model.vo.Rank;
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
	

//	@RequestMapping("/login.me")
//	public String loginCheck() {
//		
//		return "user/main/userMainPage";
//	}
	
	@RequestMapping("/adminShowMain.me")
	public String showAdminPage() {
		
		return "admin/main/adminMainPage";
	}
	
	@RequestMapping("/userManagement.me")
	public String userManagementMain() {

		return "admin/userManagement/userManagement";
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

	@RequestMapping("/login.me")
	public String loginCheck(Member m, Model model) {
//		String memberId = request.getParameter("memberId");
//		String memberPwd = request.getParameter("memberPwd");
		
		Member loginUser;
		
		try {
			loginUser = ms.loginMember(m);
			
			model.addAttribute("loginUser", loginUser);
			
			return "user/main/userMainPage";
		} catch (LoginException e) {
			model.addAttribute("msg", e.getMessage());
			
			return "common/errorPage";
		}
		
	}

	
	@RequestMapping("logout.me")
	public String logout(SessionStatus status) {
		 
		status.setComplete();
		
		return "redirect:index.jsp";
	}
	
	
	@RequestMapping("insert.me")
	public String inertMember(Model model, Member m) {
		
		System.out.println("controller member : " + m);
		
		m.setMemberPwd(passwordEncoder.encode(m.getMemberPwd()));
		
		int result = ms.insertMember(m);
		
		if(result > 0) {
			
			return "redirect:index.jsp";
		} else {
			model.addAttribute("msg", "회원 가입실패!");
			
			return "common/errorPage";
		}
		
	}
		
	
	//부서 + 직급리스트 조회
	@RequestMapping("registerMember.me")
	public String registerUser(Model model, HttpServletRequest request) {
		
		//부서조회 레벨1
		List<Dept> list = ms.selectDeptList();
		
		request.setAttribute("list", list);
		
		
		//직급조회
		List<Rank> rlist = ms.selectRankList();
		
		request.setAttribute("rlist", rlist);
		
		
		return "admin/userManagement/registerUser";
	}
	
	//부서 + 직급리스트 조회
	@RequestMapping("selectTeam.me")
	public void selectTeam(DepartMent dm, HttpServletRequest request,  HttpServletResponse response) {
		
		List<DepartMent> list = ms.selectTeam(dm);
		
		request.setAttribute("list", list);
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");

		String gson = new Gson().toJson(list);

		try {
			response.getWriter().write(gson);
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}
	
	
	
	
		
}












