package com.kh.manage.project.controller;

import com.google.gson.Gson;
import com.kh.manage.admin.adminManage.vo.DeptMember;
import com.kh.manage.admin.department.model.vo.Dept;
import com.kh.manage.admin.template.model.vo.Template;
import com.kh.manage.common.PageInfo;
import com.kh.manage.common.Pagination;
import com.kh.manage.project.model.vo.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.manage.project.model.service.ProjectService;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.List;

@Controller
public class ProjectController {
	@Autowired
	private ProjectService ps;
	
	// 프로젝트 목록페이지 (프로젝트 센터)
	@RequestMapping("/projectCenter.pr")
	public String projectSelectAll(Model model, HttpServletRequest request) {
		int currentPage = 1;
		
		if (request.getParameter("currentPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		
		int listCount = ps.getProjectListCount();
		
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		// 프로젝트 목록에서 집어와야 하는 것들:
		// 프로젝트명 개발형태 담당자 담당부서 시작일 완료일
		// 	실적 산출물 과 이슈 수
		// TODO: 2020-04-15  산출물과 이슈는 아직 안만들었으니 0 처리한다
		// 우선 프로젝트명 뽑는다...
		
		List<ProjectList> teamList = ps.selectProjectList(pi);
		
		System.out.println("teamList: " + teamList);
		
		model.addAttribute("list", teamList);
		model.addAttribute("pi", pi);
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
		
		// 프로젝트 관리자 - 소속부서만 뽑고 실제 사원목록은 부서를 눌렀을때 추가하면서 넣는걸로.
		List<Dept> deptList = ps.selectDeptList();
		System.out.println("deptList: " + deptList);
		
		// 프로젝트 템플릿 목록.
		// 당장 목록만 있기 때문에 크게 할수있는게 없음..
		// 엑셀을 건들기 시작하면 그때부터 가능할거 같음.
		List<Template> templateList = ps.selectTemplateList();
		System.out.printf("templateList: " + templateList);
		
		// 목록 전부 리퀘스트에 추가
		request.setAttribute("projectTypes", projectTypes);
		request.setAttribute("templateList", templateList);
		request.setAttribute("deptList", deptList);
		return "user/project/projectReg";
	}
	
	// model 의 역할: 간단히 말해서 request.
	// ajax 임
	// @RequestParam 을 통해 아작스 데이터값을 뽑아오는거....
	@RequestMapping("/getMemberFromDept.pr")
	public void getMemberFromDept(@RequestParam String deptNo, HttpServletRequest request, HttpServletResponse response) {
		
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
	@RequestMapping(value = "/registerProject.pr", method = RequestMethod.POST)
	public String registerProject(MultipartHttpServletRequest request, HttpServletResponse response) {
		System.out.println("registerProject");
		try {
			request.setCharacterEncoding("utf-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		
		// 주요여부
		String isImportant = request.getParameter("IS_IMPORTANT");
		// 프로젝트명
		String project_name = request.getParameter("project_name");
		// 개발형태
		String projectType = request.getParameter("projectType");
		// 개발등급
		String projectRank = request.getParameter("projectRank");
		// 프로젝트 관리자
		String project_manager = request.getParameter("project_manager");
		String project_template = request.getParameter("project_template");
		if (project_template.equals("0")){
			project_template = null;
		}
		// pmo
		String pmo = request.getParameter("pmo");
		// 서브관리자 목록
		// 폼에 똑같은 네임의 인풋이 여럿이면 전부 알아서 통합돼 어레이로 가져온다.
		String[] memberNo = request.getParameterValues("memberNo");
		
		// System.out.println("memberNo: " + memberNo);
		// for (String m : memberNo) {
		// 	System.out.println(m);
		// }
		// List<String> subManagerList = Arrays.asList(sub_manager.split(","));
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		Date startDate = null;
		Date endDate = null;
		try {
			java.util.Date startUtilDate = format.parse(request.getParameter("startDate"));
			java.util.Date endUtilDate = format.parse(request.getParameter("endDate"));
			startDate = new Date(startUtilDate.getTime());
			endDate = new Date(endUtilDate.getTime());
		} catch (ParseException e) {
			e.printStackTrace();
		}
		System.out.println("startDate : " + startDate);
		// TODO: 2020-04-15 엑셀파일 추가가 없음!!!
		
		// 프로젝트 설명
		String project_details = request.getParameter("project_details");
		
		
		System.out.println("project_name: " + project_name);
		System.out.println("isImportant: " + isImportant);
		System.out.println("projectType: " + projectType);
		System.out.println("projectRank: " + projectRank);
		System.out.println("project_manager: " + project_manager);
		System.out.println("pmo " + pmo);
		System.out.println("startDate: " + startDate);
		System.out.println("endDate: " + endDate);
		System.out.println("project_details: " + project_details);
		System.out.println("project_template: " + project_template);
		// 이제 넣어봅시다
		Project project = new Project(null, project_name, isImportant,
				projectType, projectRank, project_manager, pmo,
				startDate, endDate, project_details, null, "1",
				project_template);
		String projectInsertResult = ps.insertProject(project);
		System.out.println("projectInsertResult: " + projectInsertResult);
		
		
		int memberInsertResult = 0;
		if (projectInsertResult != null) {
			// 책임자 넣기
			ProjectTeam projectManager = new ProjectTeam(null, projectInsertResult, project_manager, "PM");
			ps.insertProjectTeam(projectManager);
			// 위에 써져있던 부책임자들 다 건든다.
			if (memberNo != null) {
				for (String m : memberNo) {
					ProjectTeam team = new ProjectTeam(null, projectInsertResult, m, "PSM");
					ps.insertProjectTeam(team);
				}
			}
			
			
			return "redirect:/projectCenter.pr";
		} else {
			return "user/project/projectSelectAll";
		}
	}
	
	// 프로젝트 작업 페이지
	@RequestMapping("/projectTask.pr")
	public String projectTask(Model model, HttpServletRequest request) {
		// 프로젝트 작업을 실시할때 이게 필요할거임:
		// 우선 해당 프로젝트의 모든 작업을 불러온다.
		
		String pid = request.getParameter("pid");
		
		// 표면상 보일 목록: 작업 아이디, 작업명 상태 기간 시작일 완료일 선행작업 완료율 담당자이름
		
		// TODO: 2020-04-18 정렬은?? 우선은 시작일자 순으로 하되 추후 수정을 해야할 거.
		List<ProjectWork> projectWorkList = ps.selectProjectWorkList(pid);
		
		// 작업 담당자는 별도에서 뽑아와야 한다.
		
		System.out.println("projectWorkList: " + projectWorkList);
		// 작업 담당자 목록
		// List<ProjectCharger> projectChargerList = ps.getProj
		
		return "user/project/projectTask2";
	}
	
	// 프로젝트 작업 추가에 쓰일 AJAX
	@RequestMapping("/projectWorkInsert.pr")
	public void projectWorkInsert(){
	
	}
	
	
	
	// 프로젝트 요약정보 페이지
	@RequestMapping("/viewProject.pr")
	public String viewProject(Model model, HttpServletRequest request) {
		System.out.println("viewProject");
		
		String pid = (String) request.getParameter("pid");
		
		model.addAttribute("pid", pid);
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
