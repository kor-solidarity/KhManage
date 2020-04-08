package com.kh.manage.admin.adminManage.controller;

import java.io.IOException;

import java.util.HashMap;
import java.util.List;

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
import com.kh.manage.admin.adminManage.vo.DepartMent;
import com.kh.manage.common.PageInfo;
import com.kh.manage.common.Pagination;


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
	public String showAccessDetailPage() {
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
		
		System.out.println(list);
		return "admin/departmentManage/departmentPage";
	}
	
	@RequestMapping("/deptSelectOne.am")
	public void deptSelectOne(DepartMent dept, Model model, HttpServletRequest request,  HttpServletResponse response) {
		
		System.out.println(dept);
	}

}
