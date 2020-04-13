package com.kh.manage.project.controller;

import com.google.gson.Gson;
import com.kh.manage.admin.adminManage.vo.DeptMember;
import com.kh.manage.admin.department.model.vo.Dept;
import com.kh.manage.project.model.vo.ProjectType;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.manage.project.model.service.ProjectService;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
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
	public String projectCreatePage(HttpServletRequest request) {
		System.out.println("projectRegister");
		// 등록 페이지 작성하기 전에 해야하는 사전작업:
		// 개발형태목록 개발등급목록 플젝관리자 pmo 플젝템플릿 
		
		// 개발형태 목록 불러오기
		List<ProjectType> projectTypes = ps.selectProjectTypeList();
		System.out.println("projectTypes: " + projectTypes);
		
		// 개발등급 목록... 은 디비가 없다, 우선은 통과가능.
		
		// 프로젝트 관리자 - 소속부서만 뽑고 실제 사원목록은 부서를 눌렀을때 추가하면서 넣는걸로??
		// 전부 뽑는걸로.
		List<Dept> deptList = ps.selectDeptList();
		// List<DeptMember> memberList = ps.selectMemberList(deptNo);
		System.out.println("deptList: " + deptList);
		// System.out.println("memberList: " + memberList);
		
		// 목록 전부 리퀘스트에 추가
		request.setAttribute("projectTypes", projectTypes);
		// request.setAttribute("memberList", memberList);
		request.setAttribute("deptList", deptList);
		return "user/project/projectReg";
	}
	
	// model 의 역할: 간단히 말해서 request.
	// ajax 임
	// @RequestParam 을 통해 아작스 데이터값을 뽑아오는거....
	@RequestMapping("/getMemberFromDept.pr")
	public void getMemberFromDept(@RequestParam String deptNo, HttpServletRequest request, HttpServletResponse response){
		
		List<DeptMember> memberList = ps.selectMemberList(deptNo);
		
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		
		String gson = new Gson().toJson(memberList);
		
		try {
			response.getWriter().write(gson);
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}
	
	// 프로젝트 등록 실시
	@RequestMapping("/registerProject.pr")
	public String registerProject(HttpServletRequest request, HttpServletResponse response) {
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
