package com.kh.manage.admin.department.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.manage.admin.department.model.service.DeptService;
import com.kh.manage.admin.department.model.vo.Dept;

@Controller
public class DeptController {
	
	@Autowired
	private DeptService ds;
	
	
//	@RequestMapping("/departmentManage.am")
//	public String showDepartmentManage() {
//		return "admin/departmentManage/departmentPage";
//	}
	
	
	//부서리스트 조회
	@RequestMapping("/registerUser.de")
	public String registerUser(Model model, HttpServletRequest request) {
		
		List<Dept> list = ds.selectDeptList();
		
		return "admin/userManagement/registerUser";
	}
	
	
	
	
	
	
	
}








