package com.kh.manage.project.controller;

import com.kh.manage.project.model.vo.ProjectType;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.manage.project.model.service.ProjectService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.List;

@Controller
public class ProjectController {
	@Autowired
	private ProjectService ps;
	
	@RequestMapping("/projectCenter.pr")
	public String projectSelectAll() {
		return "user/project/projectSelectAll";
	}
	
	// 프로젝트 등록 페이지 들어가기
	@RequestMapping("/projectRegister.pr")
	public String projectCreatePage() {
		System.out.println("projectRegister");
		// 등록 페이지 작성하기 전에 해야하는 사전작업:
		// 개발형태목록 개발등급목록 플젝관리자 pmo 플젝템플릿 
		
		// 개발형태 목록
		List<ProjectType> projectTypes = ps.selectProjectTypeList();
		
		return "user/project/projectReg";
	}
	
	// 프로젝트 등록 실시
	@RequestMapping("/registerProject.pr")
	public String RegisterProject(HttpServletRequest request, HttpServletResponse response) {
		return "";
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
