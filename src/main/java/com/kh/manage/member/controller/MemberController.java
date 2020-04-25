package com.kh.manage.member.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.Gson;
import com.kh.manage.admin.adminManage.vo.DepartMent;
import com.kh.manage.admin.adminManage.vo.Menu;
import com.kh.manage.admin.department.model.vo.Dept;
import com.kh.manage.admin.rank.model.vo.Rank;
import com.kh.manage.common.Attachment;
import com.kh.manage.common.CommonsUtils;
import com.kh.manage.common.PageInfo;
import com.kh.manage.common.Pagination;
import com.kh.manage.infoBoard.model.vo.InfoBoard;
import com.kh.manage.member.model.exception.LoginException;
import com.kh.manage.member.model.service.MemberService;
import com.kh.manage.member.model.vo.Member;
import com.kh.manage.project.model.vo.Project;


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
	
	//member리스트 조회	
	@RequestMapping("/userManagement.me")
	public String userManagementMain(Model model, HttpServletRequest request) {
		
		
		int currentPage = 1;
		
		if(request.getParameter("currentPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		
		//페이징
		int listCount = ms.memberListCount();
		System.out.println("listCount : " + listCount);

		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		
		//memberList
		List<Member> mlist = ms.selectMemberList(pi);
		System.out.println("mlist : " + mlist);
		
		request.setAttribute("mlist", mlist);
		request.setAttribute("pi", pi);
		

		return "admin/userManagement/userManagement";
	}

	
	//개인 대시보드 이동
	@RequestMapping("/goHome.me")
	public String goHome() {
		
		return "user/main/userMainPage";
	}
	
	//디테일 대시보드 이동
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
	public String loginCheck(Member m, Model model, HttpSession session) {
//		String memberId = request.getParameter("memberId");
//		String memberPwd = request.getParameter("memberPwd");
		
		Member loginUser;
		
		try {
			loginUser = ms.loginMember(m);
			
			List<Menu> list = ms.selectAllMenu();
			
			List<Menu> removeList = ms.noAccessMenu(loginUser);
	         
	         for(int i = 0; i < list.size(); i++) {
	            for(int j = 0; j < removeList.size(); j ++) {
	               if(list.get(i).getMenuNo().equals(removeList.get(j).getMenuNo())) {
	                  list.remove(i);
	                  i--;
	                  j = removeList.size();
	               }
	            }
	         }
			
			session.setAttribute("menuAllList", list);
			
			model.addAttribute("loginUser", loginUser);
			
			return "user/main/userMainPage";
		} catch (LoginException e) {
			model.addAttribute("msg", e.getMessage());
			
			return "user/common/errorPage";
		}
		
	}

	
	@RequestMapping("logout.me")
	public String logout(SessionStatus status) {
		 
		status.setComplete();
		
		return "redirect:index.jsp";
	}
	
	
	@RequestMapping("insert.me")
	public String inertMember(Model model, Member m) {
		
//		System.out.println("controller member : " + m);
		
		m.setMemberPwd(passwordEncoder.encode(m.getMemberPwd()));
		
		int result = ms.insertMember(m);
		
		if(result > 0) {
			
			return "redirect:index.jsp";
			
		} else {
			model.addAttribute("msg", "회원 가입실패!");
			
			return "common/errorPage";
		}
		
	}
	
	
	//회원비밀번호 변경
	@RequestMapping("updatePassword.me")
	public String updatePassword(Member m, Model model, HttpSession session) {
		System.out.println("비밀번호 변경 요청");
		
		//loginUser
		Member member = (Member) session.getAttribute("loginUser");
		System.out.println(member);
		
		member.setMemberPwd(passwordEncoder.encode(m.getMemberPwd()));
		
		int result = ms.updatePassword(member);
		
		System.out.println("비번변경 result : " + result);
		
		if(result > 0) {
			
			return "redirect:index.jsp";
			
		} else { 
			
			model.addAttribute("msg", "비번 변경 실패!");
			
			return "redirect:index.jsp";
		}
		
	}
	
	//회원기본정보 변경 : 이메일, 전화번호
	@RequestMapping("updateMemberInfo.me")
	public String updateMemberInfo(HttpServletRequest request, HttpServletResponse response, HttpSession session) {
		
		Member member = (Member) session.getAttribute("loginUser");
		String email = request.getParameter("email");
		String phone = request.getParameter("phone");
		
		System.out.println("email : " + email);
		System.out.println("phone : " + phone);
		
		member.setEmail(email);
		member.setPhone(phone);
		
		
		int result = ms.updateMemberInfo(member);
		
		System.out.println("updateMemberInfo result : " + result);
		
		
		//프로필 사진 조회
		Attachment at = ms.selectProfileImg(member);

		//부서조회 레벨1
		List<Dept> list = ms.selectDeptList();
		
		System.out.println("Attacgment at : " + at);
		
		request.setAttribute("list", list);
		request.setAttribute("at", at);
		
		
		
		
		if(result > 0) {
			
			return "user/myProfile/myProfileMain";
		} else {
		
			return "user/myProfile/myProfileMain";
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
		
		
		//프로젝트 조회
		List<Project> plist = ms.selectProjectList();
		
		request.setAttribute("plist", plist);
		
		
		return "admin/userManagement/registerUser";
	}
	
	
	
	//회원정보 수정 : loginUser 정보조회
	@RequestMapping("myProfile.me")
	public String modifyUserInfo(Member m, HttpSession session, HttpServletRequest request) {
		
		Member member = (Member) session.getAttribute("loginUser");
		
		//프로필 사진 조회
		Attachment at = ms.selectProfileImg(member);

		//부서조회 레벨1
		List<Dept> list = ms.selectDeptList();
		
		System.out.println("Attacgment at : " + at);
		
		request.setAttribute("list", list);
		request.setAttribute("at", at);
		
		return "user/myProfile/myProfileMain";
//		return "redirect:myProfileMain.jsp";
	}
	
	
	
	//회원정보 수정 프로필사진 
	@RequestMapping("insertProfileImage.me")
	public String insertProfileImage(Model model, Member m, HttpServletRequest request, 
			@RequestParam MultipartFile profileImage) {
		
		System.out.println("이미지 변경요청");
		String root = request.getSession().getServletContext().getRealPath("resources");
		
		System.out.println("root : " + root);
		
		String filePath = root + "\\uploadfiles";
//		String filePath = root + "/uploadfiles/"; //Mac
		//root : C:\dev\6_Framework\Spring\workspace\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\testSpringProject\resources

		//---------파일명 변경---------------------------------------
		//파일의 원본이름 originFileName
		String originFileName = profileImage.getOriginalFilename();
		//확장자만 따로 뺴서 관리, .png , .jpg
		String ext = originFileName.substring(originFileName.lastIndexOf("."));
		String changeName = CommonsUtils.getRandomString();
		//--------------------------------------------------------
		
		Attachment at = new Attachment();
		at.setChangeName(changeName);
		at.setOriginName(originFileName);
		at.setFilePath(filePath);
		at.setExt(ext);
		
		Member loginUser = (Member) request.getSession().getAttribute("loginUser");
		at.setDivision(loginUser.getMemberNo());
			
		
		Attachment originFile = ms.selectAttachment(loginUser);

		if(originFile != null) {
			
			//기존 파일을 제거
			new File(filePath + "\\" + changeName + ext).delete();
						
			//DB 업데이트
			int result = ms.updateProfileImage(at);
			System.out.println("이미지 업데이트 result : " + result); 
			
			try {
//				profileImage.transferTo(new File(filePath + "\\" + changeName + ext));
//				profileImage.transferTo(new File(filePath + changeName + ext)); // Mac
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			
		} else {
			
			//등록
			try {
				int result = ms.insertProfileImage(at);
				System.out.println("프로필이미지 result : " + result);
//				profileImage.transferTo(new File(filePath + "\\" + changeName + ext));
//				profileImage.transferTo(new File(filePath + changeName + ext)); // Mac
				
			} catch (Exception e) {
				//실패 시 파일 삭제
				new File(filePath + "\\" + changeName + ext).delete();
			}
			
		}
		
//		return "user/myProfile/myProfileMain";
		return "redirect:myProfile.me";
	}
	
	
	
	//부서 + 직급리스트 조회 : Ajax
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
	
	
	//아이디 중복체크 : Ajax
	@RequestMapping("checkMemberId.me")
	public void checkMemberId(Member m, HttpServletRequest request, HttpServletResponse response) {
		
		int result = ms.checkMemberId(m);
		
		if(result == 1) {
			String gson = new Gson().toJson(1);
			
			try {
				response.getWriter().write(gson);
			} catch (IOException e) {
				e.printStackTrace();
			}
			
		} else {
			String gson = new Gson().toJson(0);
			
			try {
				response.getWriter().write(gson);
			} catch (IOException e) {
				e.printStackTrace();
			}
			
		}
		
	}
	
	
	//사용자 리스트 페이지내 회원명으로 검색
	@RequestMapping("searchMemberName.me")
	public void searchMemberName(Member member, Model model, HttpServletRequest request, HttpServletResponse response) {
		
		PageInfo pi = Pagination.getPageInfo(1, 1);
		List<Member> list = ms.searchMemberName(member);
		
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
	
	
	
	
	
	
	
//	//멤버 select Modal
//	@RequestMapping("selecMemberModal.me")
//	public void selecMemberModal(Member m, Model model, HttpServletRequest request) {
//	
//		Member member = new Member();
//		
//		
//		
//	}
	
	
	
	
	
		
}












