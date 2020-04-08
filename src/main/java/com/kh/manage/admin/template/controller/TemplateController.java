package com.kh.manage.admin.template.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class TemplateController {
	
	@RequestMapping("/templateManage.am")
	public String templateMain() {
		
		return "admin/templateManage/templatePage";
	}
	
	@RequestMapping("/insertTemplate.am")
	public String InsertTemplate() {
		
		return "admin/templateManage/insertTemplate";
	}
	@RequestMapping("/templateManagePage.am")
	public String templateManage() {
		
		return "admin/templateManage/templateManage";
	}
	@RequestMapping("/templateExcel.am")
	public String templateExcel() {
		
		return "admin/templateManage/templateExcel";
	}

}
