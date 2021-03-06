package com.kh.manage.admin.adminManage.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.kh.manage.admin.adminManage.service.ManageService;
import com.kh.manage.admin.adminManage.vo.Access;
import com.kh.manage.admin.adminManage.vo.AccessMember;
import com.kh.manage.admin.adminManage.vo.DepartMent;
import com.kh.manage.admin.adminManage.vo.DeptHistory;
import com.kh.manage.admin.adminManage.vo.DeptMember;
import com.kh.manage.admin.adminManage.vo.Menu;
import com.kh.manage.admin.adminManage.vo.MenuAccess;
import com.kh.manage.admin.adminManage.vo.ProjectHistory;
import com.kh.manage.admin.adminManage.vo.SelectAccessMember;
import com.kh.manage.admin.rank.model.vo.Rank;
import com.kh.manage.common.PageInfo;
import com.kh.manage.common.Pagination;
import com.kh.manage.member.model.service.MemberService;
import com.kh.manage.member.model.vo.AllDashBoard;
import com.kh.manage.member.model.vo.Member;
import com.kh.manage.project.model.vo.ProjectDetail;


@Controller
public class ManageController {

	@Autowired
	private ManageService as;
	
	@RequestMapping("/showUserManiPage.am")
	public String showUserMainPage() {
		
		return "user/main/userMainPage";
	}
	
	//권한 그룹 전체 페이지 + 페이징
	@RequestMapping("/accessManage.am")
	public String showAccessPage(Model model, HttpServletRequest request) {
		int currentPage = 1;

		if(request.getParameter("currentPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}

		int listCount = as.getListCount();

		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);

		List<Access> list = as.accessSelectAll(pi);

		model.addAttribute("list", list);
		model.addAttribute("pi",pi);
		return "admin/accessManage/accessPage";
	}
	//권한 생성 페이지로 이동
	@RequestMapping("/insertaccessPage.am")
	public String showInsertAccessPage() {
		return "admin/accessManage/accessInsertForm";
	}
	//권한 그룹 상세페이지 조회
	@RequestMapping("/accessDetailPage.am")
	public String showAccessDetailPage(Access ac, Model model) {

		Access selectAccess = as.selectOneAccess(ac);
		List<DepartMent> dList = as.selectDeptList(); 
		List<SelectAccessMember> list = as.selectAccessMemberList(ac);

		model.addAttribute("list", list);
		model.addAttribute("aDetail", selectAccess);
		model.addAttribute("dList", dList);

		return "admin/accessManage/accessDetail";
	}
	//권한 그룹 생성
	@RequestMapping("insertAccessGroup.am")
	public String insertAccessGroup(Access ac, Model model) {

		int result = as.insertAccessGroup(ac);

		return "redirect:accessManage.am";

	}
	//권한 그룹 명으로 검색
	@RequestMapping("searchAccess.am")
	public void searchAccess(Access access, Model model, HttpServletRequest request,  HttpServletResponse response) {

		PageInfo pi = Pagination.getPageInfo(1, 1);
		List<Access> list = as.searchAccess(access);

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
	//전체 부서 조회
	@RequestMapping("/departmentManage.am")
	public String showDepartmentManage(Model model) {

		List<DepartMent> list = as.departSelectAll();
		List<Rank> rlist = as.selectRankList();

		model.addAttribute("list", list);
		model.addAttribute("rlist", rlist);

		return "admin/departmentManage/departmentPage";
	}
	//하위 부서 하나 선택 조회
	@RequestMapping("/deptSelectOne.am")
	public void deptSelectOne(DepartMent dept, Model model, HttpServletRequest request,  HttpServletResponse response) {
		DepartMent dm = as.deptSelectOne(dept);
		List<Member> list = as.selectMemberList(dept);
		
		request.setAttribute("dm", dm);
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("dm", dm);
		map.put("list", list);
		
		String gson = new Gson().toJson(map);

		try {
			response.getWriter().write(gson);
		} catch (IOException e) {
			e.printStackTrace();
		}

	}
	//최상위 부서 하나 선택 조회
	@RequestMapping("/highDeptSelectOne.am")
	public void highSelectOne(DepartMent dept, HttpServletRequest request, HttpServletResponse response) {
		DepartMent dm = as.highSelectOne(dept);
		List<Member> list = as.selectHighMemberList(dept);

		request.setAttribute("dm", dm);
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("dm", dm);
		map.put("list", list);
		String gson = new Gson().toJson(map);

		try {
			response.getWriter().write(gson);
		} catch (IOException e) {
			e.printStackTrace();
		}

	}
	//최상위 부서 추가
	@RequestMapping("/insertHighDept.am")
	public String insertHighDept(DepartMent dm) {
		int result = as.insertHighDept(dm);

		return "redirect:departmentManage.am";
	}
	
	@RequestMapping("/newDeptNo.am")
	public void newDeptNo(DepartMent dept, HttpServletRequest request, HttpServletResponse response) {
		DepartMent dm = as.newDeptNo(dept);
		
		request.setAttribute("dm", dm);
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");

		String gson = new Gson().toJson(dm);

		try {
			response.getWriter().write(gson);
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}
	//하위 부서 생성
	@RequestMapping("/childrenDeptInsert.am")
	public String childrenDeptInsert(DepartMent dept) {
		
		int result = as.inserChildrenDept(dept);
		
		return "redirect:departmentManage.am";
	}
	//권한 그룹 인원 조회
	@RequestMapping("/searchDeptMember.am")
	public void searchDeptMember(DepartMent dept, Model model, HttpServletRequest request,  HttpServletResponse response) {
		List<DeptMember> list = as.searchDeptMember(dept);

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
	//권한 그룹 인원 추가
	@RequestMapping("/insertAccessMember.am")
	public String insertAccessMember(AccessMember am) {
		if(am.getMemberNo() != null) {
			int result2 = as.deleteAccessMember(am);

			List<String> dnum = new ArrayList<String>();
			String[] str = am.getMemberNo().split(",");


			for(int i=0; i<str.length; i++) {
				dnum.add(str[i]);
			}
			List<AccessMember> userList = new ArrayList<AccessMember>();
			for(int i = 0; i < dnum.size(); i++) {
				AccessMember as = new AccessMember();
				as.setAccessNo(am.getAccessNo());
				as.setMemberNo(dnum.get(i));

				userList.add(as);
			}
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("list", userList);

			int result = as.insertAccessMember(am, map);

		}else {
			int result2 = as.deleteAccessMember(am);
		}

		int result3 =  as.updateAccess(am);

		return "redirect:accessManage.am";

	}
	//부서 상태 변경 
	@RequestMapping("deleteDept.am")
	public String deleteDept(DepartMent dept) {
		
		int result = as.deleteDept(dept);
		
		
		return "redirect:departmentManage.am";
	}
	//부서 이동 히스토리 생성 + 맴버 부서 업데이트
	@RequestMapping("insertDeptHistory.am")
	public String insertDeptHistory(DeptHistory dh) {
		int result = as.insertDeptHistory(dh);
		
		return "redirect:departmentManage.am";
	}
	//메뉴 전체 리스트 조회
	@RequestMapping("/menuManege.am")
	public String showMenuManagePage(Model model) {
		
		List<Menu> list = as.selectAllMenu();
		
		model.addAttribute("list", list);
		
		return "admin/menuManage/menuManage";
		//return "user/common/sidebar2";
	}
	//하나의 메뉴 정보 조회 + 메뉴가 가지고 있는 권한도 조회
	@RequestMapping("/selectOneMenu.am")
	public void selectOneMenu(Menu menu, HttpServletRequest request, HttpServletResponse response) {
		
		Menu m = as.selectOneMenu(menu);
		List<Access> aList = as.selectAllAccess();
		List<Access> useList = as.selectUseAccessList(menu);
		
			for(int i = 0; i < aList.size(); i++) {
				for(int j = 0; j < useList.size(); j ++) {
					if(aList.get(i).getAccessGroupNo().equals(useList.get(j).getAccessGroupNo())) {
						aList.remove(i);
						i--;
						j = useList.size();
					}
				}
			}
		request.setAttribute("aList", aList);
		request.setAttribute("useList", useList);
		request.setAttribute("me", m);
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("me", m);
		map.put("aList", aList);
		map.put("useList", useList);
		String gson = new Gson().toJson(map);

		try {
			response.getWriter().write(gson);
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}
	//메뉴 권한 그룹 등록
	@RequestMapping("/insertMenuAccess.am")
	public String insertMenuAccess(MenuAccess ma) {
		System.out.println(ma);
		
		int result = as.updateMenuInfo(ma);
		
		List<MenuAccess> list = new ArrayList<MenuAccess>();

		if(ma.getAccessGroupNo() != null) {
		String [] str = ma.getAccessGroupNo().split(",");
		
		for(int i = 0; i < str.length; i++) {
			MenuAccess mc = new MenuAccess();
			mc.setMenuName(ma.getMenuName());
			mc.setMenuNo(ma.getMenuNo());
			mc.setStatus(ma.getStatus());
			mc.setAccessGroupNo(str[i]);
			
			list.add(mc);
		}
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list);
		int result1 = as.cleanMenuAccess(ma);
		int result2 = as.insertMenuAccess(map);
		}else {
			int result1 = as.cleanMenuAccess(ma);
		}
		
		return "redirect:menuManege.am";
	}
	//메뉴 클릭 시 접근 권한 체크
	@RequestMapping("/checkAccessMember.am")
	public void checkAccessMember(MenuAccess menu, HttpSession session, HttpServletRequest request, HttpServletResponse response) {
		
		Member m = (Member)session.getAttribute("loginUser");
		menu.setMemberNo(m.getMemberNo());
		
		Menu me = new Menu();
		me.setMenuNo(menu.getMenuNo());
		
		List<Access> useList = as.selectUseAccessList(me);
		
		if(useList.size() >0) {
			System.out.println("접근 제한");
			System.out.println(menu);
			
			List<Menu> checkMenuList = as.checkMenuAccessMember(menu);
			
			if(checkMenuList.size() >0) {
				response.setContentType("application/json");
				response.setCharacterEncoding("UTF-8");
				
				String gson = new Gson().toJson(checkMenuList.get(0));
				
				try {
					response.getWriter().write(gson);
				} catch (IOException e) {
					e.printStackTrace();
				}
			}else {
				response.setContentType("application/json");
				response.setCharacterEncoding("UTF-8");
				
				String gson = new Gson().toJson("2");
				
				try {
					response.getWriter().write(gson);
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
			
		}else {
			Menu userMenu = as.selectOneMenu(me);
			
			response.setContentType("application/json");
			response.setCharacterEncoding("UTF-8");
			
			String gson = new Gson().toJson(userMenu);
			
			try {
				response.getWriter().write(gson);
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		
	}
	
	//관리자 페이지 프로젝트 현황 
	@RequestMapping("/projectList.am")
	public String showProjectList(Model model, HttpServletRequest request) {
		int currentPage = 1;

		if(request.getParameter("currentPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}

		int listCount = as.getProjectListCount();

		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		
		List<AllDashBoard> list = as.selectAllProjectList(pi);
		model.addAttribute("list", list);
		model.addAttribute("pi",pi);
		
		return "admin/projectManage/projectManageList";
	}
	
	@RequestMapping("/projectDetail.am")
	public String projectDetail(Model model, String pid) {
		//프로젝트 디테일 정보 조회
		AllDashBoard  pd = as.selectOneProject(pid);
		List<ProjectHistory> list = as.selectHistory(pid);
		String enrollDate = as.selectEnrollDate(pid);
		
		model.addAttribute("project", pd);
		model.addAttribute("list", list);
		model.addAttribute("enrollDate", enrollDate);
		model.addAttribute("pid", pid);
		
		return "admin/projectManage/projectDetail";
	}
	
	@RequestMapping("/projectComplete.am")
	public String projectComplete(String pid, HttpSession session) {
		Member m = (Member) session.getAttribute("loginUser");
		m.setProjectPk(pid);
		
		int result = as.updateCompleteProject(pid);
		int result1 = as.insertCompleteProjectHistory(m);
		
		return "redirect:projectList.am";
	}
}
