package com.kh.manage.admin.department;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class DepartmentManage {
	
	@RequestMapping("/departmentManage.am")
	public String showDepartmentManage() {
		return "admin/departmentManage/departmentPage";
	}
	
}
