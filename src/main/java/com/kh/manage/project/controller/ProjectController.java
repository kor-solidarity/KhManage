package com.kh.manage.project.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ProjectController {
	
	@RequestMapping("/projectCenter.pr")
	public String projectSelectAll() {
		return "user/project/projectSelectAll";
	}
	
	@RequestMapping("/projectRegister.pr")
	public String projectCreatePage(){
		System.out.println("projectRegister");
		return "user/project/projectReg";
	}
	
}
