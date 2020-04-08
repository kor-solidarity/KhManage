package com.kh.manage.project.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ProjectController {
	
	@RequestMapping("/projectCenter.pr")
	public String projectSelectAll() {
		return "user/project/projectSelectAll";
	}
	
	// 프로젝트 등록 페이지
	@RequestMapping("/projectRegister.pr")
	public String projectCreatePage() {
		System.out.println("projectRegister");
		return "user/project/projectReg";
	}
	
	// 프로젝트 작업 페이지
	@RequestMapping("/projectTask.pr")
	public String projectTask() {
		System.out.println("projectTask");
		return "user/project/projectTask2";
	}
	
	
	// 프로젝트 센터 기본페이지(요약정보)
	@RequestMapping("/viewProject.pr")
	public String viewProject(String num) {
		System.out.println("viewProject");
		return "user/project/projectView";
	}
	
	@RequestMapping("/projectIssue.pr")
	public String projectIssue() {
		return "user/project/projectIssue";
	}
	
	@RequestMapping("/projectOutput.pr")
	public String projectOutput() {
		return "user/project/projectOutput";
	}
	
	@RequestMapping("issueReg.pr")
	public String issueRegister() {
		return "user/project/issueReg";
	}
	
	@RequestMapping("/outputReg.pr")
	public String outputRegister() {
		return "user/project/outputReg";
	}
	
}
