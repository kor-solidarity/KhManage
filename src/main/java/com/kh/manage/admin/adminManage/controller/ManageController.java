package com.kh.manage.admin.adminManage.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
import com.kh.manage.admin.adminManage.vo.DeptMember;
import com.kh.manage.admin.adminManage.vo.SelectAccessMember;
import com.kh.manage.common.PageInfo;
import com.kh.manage.common.Pagination;
import com.kh.manage.member.model.vo.Member;


@Controller
public class ManageController {

	@Autowired
	private ManageService as;

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

	@RequestMapping("/insertaccessPage.am")
	public String showInsertAccessPage() {
		return "admin/accessManage/accessInsertForm";
	}

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

	@RequestMapping("insertAccessGroup.am")
	public String insertAccessGroup(Access ac, Model model) {

		int result = as.insertAccessGroup(ac);

		return "redirect:accessManage.am";

	}

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

	@RequestMapping("/departmentManage.am")
	public String showDepartmentManage(Model model) {

		List<DepartMent> list = as.departSelectAll();

		model.addAttribute("list", list);

		return "admin/departmentManage/departmentPage";
	}

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

	@RequestMapping("/highDeptSelectOne.am")
	public void highSelectOne(DepartMent dept, HttpServletRequest request, HttpServletResponse response) {
		DepartMent dm = as.highSelectOne(dept);
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
	
	@RequestMapping("/childrenDeptInsert.am")
	public String childrenDeptInsert(DepartMent dept) {
		
		int result = as.inserChildrenDept(dept);
		
		return "redirect:departmentManage.am";
	}

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
	
	@RequestMapping("deleteDept.am")
	public String deleteDept(DepartMent dept) {
		System.out.println(dept);
		return null;
	}
}
