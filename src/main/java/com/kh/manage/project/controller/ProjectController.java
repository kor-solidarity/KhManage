package com.kh.manage.project.controller;

import com.google.gson.Gson;
import com.kh.manage.admin.adminManage.vo.DeptMember;
import com.kh.manage.admin.adminManage.vo.ProjectHistory;
import com.kh.manage.admin.department.model.vo.Dept;
import com.kh.manage.admin.template.model.vo.Template;
import com.kh.manage.common.Attachment;
import com.kh.manage.common.CommonsUtils;
import com.kh.manage.common.PageInfo;
import com.kh.manage.common.Pagination;
import com.kh.manage.gwManage.model.vo.Statistics;
import com.kh.manage.member.model.vo.AllDashBoard;
import com.kh.manage.member.model.vo.Member;
import com.kh.manage.project.model.vo.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.manage.project.model.service.ProjectService;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

@Controller
public class ProjectController {
	@Autowired
	private ProjectService ps;
	
	// 프로젝트 목록페이지 (프로젝트 센터)
	@RequestMapping("/projectCenter.pr")
	public String projectSelectAll(Model model, HttpServletRequest request) {
		Member loginUser = (Member) request.getSession().getAttribute("loginUser");
		
		// 시작하기 전에 모든 프로젝트 목록 확인한다.
		// 상태변경하기 위함임.
		// 완료일이 초과됬으면 지연으로 처리
		List<Project> projectList = ps.selectOutdatedProjects();
		for (Project p : projectList) {
			int result = ps.updateOutdatedProject(p.getProjectPk());
		}
		
		// 권한그룹에 속해있는지 확인. 속해있으면 모든 목록을 조회하는 것이고 아니면 로그인유저에 해당하는거만.
		boolean isAdmin = false;
		
		
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
		
		List<ProjectList> teamList = ps.selectProjectList(pi, loginUser);
		
		for (ProjectList p : teamList) {
			double clear = Double.parseDouble(p.getWorkClear());
			double all = Double.parseDouble(p.getAllWork());
			double res = clear / all;
			int perc = (int) Math.round(res * 100);
		    p.setPercentage(String.valueOf(perc));
		}
		
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
	// @RequestParam 을 통해 AJAX 데이터값을 뽑아오는거....
	@RequestMapping("/getMemberFromDept.pr")
	public void getMemberFromDept(@RequestParam String deptNo,
								  HttpServletRequest request, HttpServletResponse response) {
		
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
	
	// 프로젝트 작업 초기 등록때 필요한 자료를 뽑기 위한 AJAX.
	@RequestMapping("/viewProjectTeamList.pr")
	public void viewProjectTeamList(HttpServletResponse response, HttpServletRequest request) {
		// 작업중인 프로젝트 PK
		String pid = request.getParameter("pid");
		
		List<ProjectTeam> teamList = ps.selectProjectTeamList(pid);
		List<ProjectTeam> grantorList = ps.selectProjectTeamGrantorList(pid);
		List<ProjectWork> workList = ps.selectProjectWorkList(pid);
		
		HashMap<String, Object> map = new HashMap<>();
		map.put("teamList", teamList);
		map.put("grantorList", grantorList);
		map.put("workList", workList);
		
		String gson = new Gson().toJson(map);
		
		try {
			response.setContentType("application/json");
			response.setCharacterEncoding("UTF-8");
			response.getWriter().write(gson);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	
	// 프로젝트 등록 실시
	@RequestMapping(value = "/registerProject.pr", method = RequestMethod.POST)
	public String registerProject(MultipartHttpServletRequest request,
								  HttpServletResponse response,
								  @RequestParam MultipartFile project_excel) {
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
		if (project_template.equals("0")) {
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
		
		// int projInsertResult = ps.insertProjectHistory()
		
		if (project_template != null) {
			//성준 템플릿 읽고 작업 넣기
			List<TemplateWorkRead> tList = ps.selectAllTemplateWork(project_template);
			System.out.println("템플릿 작업 목록 : " + tList);
			String currval = "";
			String projectCurrval = ps.selectProjectCurrval();
			
			for (int i = 0; i < tList.size(); i++) {
				String work = tList.get(i).getTemplateWorkNo().split("[.]")[1];
				tList.get(i).setProjectCurrval(projectCurrval);
				if (work.equals("0")) {
					System.out.println("상위작업 : " + tList.get(i).getTemplateWorkNo());
					int highWork = ps.insertHighWork(tList.get(i));
					currval = ps.selectCurrval();
				} else {
					System.out.println("하위작업 : " + tList.get(i).getTemplateWorkNo());
					tList.get(i).setCurrval1(currval);
					int downWork = ps.insertDownWork(tList.get(i));
				}
			}
		}
		
		
		int memberInsertResult = 0;
		if (projectInsertResult != null) {
			// 책임자 넣기
			ProjectTeam projectManager = new ProjectTeam(null, projectInsertResult,
					project_manager, "PM", null, null, null);
			ps.insertProjectTeam(projectManager);
			// 위에 써져있던 부책임자들 다 건든다.
			if (memberNo != null) {
				for (String m : memberNo) {
					System.out.println("memberNo: " + memberNo);
					// 위에 책임자랑 중복되는 번호가 있으면 건너뛴다.
					if (project_manager.equals(m)) {
						continue;
					}
					ProjectTeam team = new ProjectTeam(null, projectInsertResult,
							m, "PSM", null, null, null);
					ps.insertProjectTeam(team);
				}
			}
			
			// System.out.println("project_excel: " + project_excel + ", name is: " + project_excel.getOriginalFilename());
			// System.out.println(project_excel.getOriginalFilename() == null);
			// System.out.println(request.getSession().getServletContext().getRealPath("resources"));
			// 마지막으로 엑셀파일을 넣는다.
			if (project_excel.getSize() > 0) {
				System.out.println("file exists");
				String root = request.getSession().getServletContext().getRealPath("resources");
				String filePath = root + "\\uploadfiles";
				String originFileName = project_excel.getOriginalFilename();
				String ext = originFileName.substring(originFileName.lastIndexOf("."));
				String changeName = CommonsUtils.getRandomString();
				
				try {
					project_excel.transferTo(new File(filePath + "\\" + changeName + ext));
				} catch (IllegalStateException e) {
					e.printStackTrace();
				} catch (IOException e) {
					e.printStackTrace();
				}
				
				Attachment at = new Attachment();
				at.setChangeName(changeName);
				at.setOriginName(originFileName);
				at.setFilePath(filePath);
				at.setExt(ext);
				at.setDivision(projectInsertResult);
				int result = ps.insertAttachment(at);
			}
			
			
			// 사실 리다렉트를 쓰면 안됨....
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
		
		// 표면상 보일 목록: 작업 아이디, 작업명 상태 기간 시작일 완료일 상위작업 완료율 담당자이름
		
		// TODO: 2020-04-18 정렬은?? 우선은 시작일자 순으로 하되 추후 수정을 해야할 거.
		List<ProjectWork> projectWorkList = ps.selectProjectWorkList(pid);
		
		// 작업 담당자는 별도에서 뽑아와야 한다.
		
		System.out.println("projectWorkList: " + projectWorkList);
		// 작업 담당자 목록
		// List<ProjectCharger> projectChargerList = ps.getProj
		model.addAttribute("pid", pid);
		model.addAttribute("projectWorkList", projectWorkList);
		return "user/project/projectTask2";
	}
	
	// 위에 프로젝트 작업목록 조회를 위한 AJAX
	@RequestMapping(value = "/updateWorkList.pr")
	public void updateWorkList(HttpServletResponse response, HttpServletRequest request) {
		System.out.println("updateWorkList");
		String pid = request.getParameter("pid");
		
		
		// 목록을 뽑기 전에 1차 필터를 거쳐 종료기한이 지났는데 안끝난 작업이 있으면 자동으로 지연표시.
		// List<ProjectWork> outdatedProjectWorkList = ps.selectOutdatedWorks()
		
		// 목록 뽑기.
		// 작업아이디, 작업명 상태 프로젝트번호 시작·완료일 상위작업 상위작업 완료율 담당자이름
		List<ProjectWork> projectWorkList = ps.selectProjectWorkList(pid);
		
		// 추후 고도화때 담당자가 여럿일수도 있긴 한데 지금은 고려대상이 아님.
		
		
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		
		String gson = new Gson().toJson(projectWorkList);
		
		try {
			response.getWriter().write(gson);
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}
	
	
	// 프로젝트 작업 추가에 쓰일 AJAX - 프론트에선 sendProjectWork()
	@RequestMapping(value = "/projectWorkInsert.pr")
	public void projectWorkInsert(HttpServletResponse response, HttpServletRequest request) {
		Member loginUser = (Member) request.getSession().getAttribute("loginUser");
		// 이거 이걸로 하면 안됨
		// String memberNo = loginUser.getMemberNo();
		System.out.println("projectWorkInsert");
		String workName = request.getParameter("workName");
		String memberNo = request.getParameter("memberNo");
		if (memberNo.equals("0")) {
			memberNo = null;
		}
		String grantor = request.getParameter("grantor");
		if (grantor.equals("0")) {
			grantor = null;
		}
		String memo = request.getParameter("memo");
		String highWorkNo = request.getParameter("highWorkSel");
		if (highWorkNo.equals("0")) {
			highWorkNo = null;
		}
		String pid = request.getParameter("pid");
		// String  beginDate = request.getParameter("beginDate");
		// String  endDate = request.getParameter("endDate");
		String loginUserMemberNo = loginUser.getMemberNo();
		
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		Date beginDate = null;
		Date endDate = null;
		try {
			java.util.Date startUtilDate = format.parse(request.getParameter("startDate"));
			java.util.Date endUtilDate = format.parse(request.getParameter("completeDate"));
			beginDate = new Date(startUtilDate.getTime());
			endDate = new Date(endUtilDate.getTime());
		} catch (ParseException e) {
			e.printStackTrace();
		}
		System.out.println("workName: " + workName);
		System.out.println("memberNo: " + memberNo);
		System.out.println("pid: " + pid);
		System.out.println("beginDate: " + beginDate);
		System.out.println("endDate: " + endDate);
		ProjectWork projectWork =
				new ProjectWork(null, workName, "시작전", pid,
						beginDate, endDate, null, "0",
						grantor, "1", highWorkNo, null,
						"프로젝트", memberNo, "Y");
		int result = ps.insertProjectWork(projectWork);
		
		System.out.println(result);
		
		if (result > 0) {
			String workNo = ps.selectWorkSeq();
			// 누가 이 작업을 배정한거임??
			ProjectTeam team =
					new ProjectTeam(null, pid, loginUserMemberNo,
							null, null, null, null);
			String teamNo = ps.selectProjectTeamNo(team);
			// System.out.println("teamNo: " + teamNo);
			
			WorkHistory workHistory =
					new WorkHistory(null, workNo, "시작전",
							"작업 첫 생성", null, teamNo,
							null, null, null);
			int result2 = ps.insertWorkHistory(workHistory);
		}
		
		try {
			response.getWriter().print(true);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	// 작업 상세보기 클릭했을 때 띄우는 AJAX
	@RequestMapping("selectWork.pr")
	public void selectWork(HttpServletResponse response, HttpServletRequest request) {
		System.out.println("selectWork");
		// 여기서 뽑아와야 하는 것들:
		/**
		 * 작업정보:
		 * 관리번호, 이름, 시작·종료일, 완료율, 승인자, 메모사항, 상위작업
		 * 상위작업: 위 상위작업의 이름과 관리번호
		 * 산출물: 구분, 파일명, 등록일, 등록자. (목록)
		 * 히스토리: 내용, 사람이름, 변경일
		 * 작업 승인 담당자: 멤버테이블
		 */
		String workNo = request.getParameter("workNo");
		String pid = request.getParameter("pid");
		
		// 우선 작업정보 가자.
		ProjectWork projectWork = ps.selectProjectWork(workNo);
		// 다음은 위 작업정보에 속하는 상위작업.
		ProjectWork highWork = null;
		if (projectWork.getHighWorkNo() != null) {
			highWork = ps.selectProjectWork(projectWork.getHighWorkNo());
		}
		// 선택할 수 있는 상위작업 목록
		HashMap<String, String> highWorkMap = new HashMap<>();
		highWorkMap.put("pid", pid);
		highWorkMap.put("workNo", workNo);
		List<ProjectWork> highWorkList = ps.selectProjectHighWorkList(highWorkMap);
		// 산출물:
		List<WorkProduct> workProduct = ps.selectWorkProductList(workNo);
		// history
		List<WorkHistory> workHistory = ps.selectWorkHistoryList(workNo);
		// 담당자 지정대상명단
		List<ProjectTeam> teamList = ps.selectProjectTeamList(pid);
		// 승인 담당 대상자 목록
		List<ProjectTeam> grantorList = ps.selectProjectTeamGrantorList(pid);
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("projectWork", projectWork);
		System.out.println(projectWork.getBeginDate().toString());
		map.put("highWork", highWork);
		map.put("workProduct", workProduct);
		map.put("workHistory", workHistory);
		map.put("teamList", teamList);
		map.put("grantorList", grantorList);
		map.put("highWorkList", highWorkList);
		
		
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		
		String gson = new Gson().toJson(map);
		
		try {
			response.getWriter().write(gson);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	@RequestMapping("/deleteWork.pr")
	public void deleteWork(HttpServletResponse response, HttpServletRequest request) {
		String workNo = request.getParameter("workNo");
		
		
		int check = ps.checkLowerWorks(workNo);
		
		int result = 0;
		if (check == 0) {
			result = ps.deleteWork(workNo);
		}
		
		HashMap<String, String> map = new HashMap<>();
		map.put("check", String.valueOf(check));
		map.put("result", String.valueOf(result));
		
		String gson = new Gson().toJson(map);
		
		try {
			response.setContentType("application/json");
			response.setCharacterEncoding("UTF-8");
			response.getWriter().write(gson);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	@RequestMapping(value = "/updateWork.pr", method = RequestMethod.POST)
	public void updateWork(HttpServletResponse response, HttpServletRequest request) {
		String workNo = request.getParameter("workNo");
		String workName = request.getParameter("workName");
		String memberNo = request.getParameter("memberNo");
		String grantor = request.getParameter("grantor");
		String memo = request.getParameter("memo");
		String highWorkSel = request.getParameter("highWorkSel");
		if (highWorkSel.equals("0")) {
			highWorkSel = null;
		}
		String pid = request.getParameter("pid");
		
		
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		Date startDate = null;
		Date completeDate = null;
		try {
			java.util.Date startUtilDate = format.parse(request.getParameter("startDate"));
			java.util.Date endUtilDate = format.parse(request.getParameter("completeDate"));
			startDate = new Date(startUtilDate.getTime());
			completeDate = new Date(endUtilDate.getTime());
		} catch (ParseException e) {
			e.printStackTrace();
		}
		
		// 승인자  담당자, 날짜, 상위작업 변경, 그 외 전부 수정 불허,
		ProjectWork work =
				new ProjectWork(workNo, null, null,
						null, startDate, completeDate,
						null, null, grantor,
						null, highWorkSel, null,
						null, memberNo, null);
		int result = ps.updateWork(work);
		System.out.println("res: " + result);
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("result", result);
		String gson = new Gson().toJson(map);
		
		try {
			response.getWriter().write(gson);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	// 프로젝트 기본정보 페이지
	@RequestMapping("/viewProject.pr")
	public String viewProject(Model model, HttpServletRequest request) {
		
		System.out.println("viewProject");
		
		String pid = request.getParameter("pid");
		ProjectDetail project = ps.selectOneProject(pid);
		
		// 플젝에 소속된 인원목록
		List<ProjectTeam> team = ps.selectProjectTeamList(pid);
		
		// 프로젝트 관리자 - 소속부서만 뽑고 실제 사원목록은 부서를 눌렀을때 추가하면서 넣는걸로.
		List<Dept> deptList = ps.selectDeptList();
		System.out.println("deptList: " + deptList);
		List<Attachment> attachmentList = ps.selectAttachmentList(pid);
		
		model.addAttribute("pid", pid);
		model.addAttribute("team", team);
		model.addAttribute("project", project);
		model.addAttribute("deptList", deptList);
		model.addAttribute("attachmentList", attachmentList);
		return "user/project/projectView";
	}
	
	//TW 리소스페이지 이동 : 부서리스트, 프로젝트팀원 조회 *
	@RequestMapping("/showResource.pr")
	public String showResource(Model model, HttpServletRequest request) {
		
		String pid = (String) request.getParameter("pid");
		
		//부서 조회
		List<Dept> deptList = ps.selectDeptList();
		model.addAttribute("pid", pid);
		request.setAttribute("deptList", deptList);
		
		//멤버조회
		Member member = new Member();
		List<Member> tmList = ps.selectTeamMemberList(pid);
		model.addAttribute("tmList", tmList);
		
		return "user/project/resource";
	}
	
	
	// 기본정보 페이지에서 정보변경
	@RequestMapping("/updateProject.pr")
	public String updateProject(HttpServletRequest request,
								@RequestParam MultipartFile[] file) {
		
		// 변경대상:
		// 관리자 / PMO / 서브관리자 / 시작·종료일 / 첨부파일 / 설명
		
		String pid = request.getParameter("pid");
		String project_manager = request.getParameter("project_manager");
		String pmo = request.getParameter("pmo");
		if (pmo.equals("0")) {
			pmo = null;
		}
		// 서브관리자
		String[] memberNo = request.getParameterValues("memberNo");
		// 삭제할 파일들
		String[] delFile = request.getParameterValues("delFile");
		
		// 설명
		String project_details = request.getParameter("project_details");
		if (project_details.equals("")) {
			project_details = null;
		}
		
		// 시간 파싱
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
		
		Project project = new Project(pid, null, null,
				null, null, project_manager,
				pmo, startDate, endDate,
				project_details, null, null, null);
		
		
		// PSM 추가·삭제
		// 삭제대상 목록을 불러온다. 여기선 정확히는 모든 배정인원
		List<ProjectTeam> delPsmList = ps.selectProjectTeamList(pid);
		// 제외인원 목록
		List<String> psmExcList = new ArrayList<>();
		
		// 먼저 삭제부터.
		for (ProjectTeam p : delPsmList) {
			// PSM 을 따지는 거기 때문에 PSM 만 집는다
			if (!p.getRole().equals("PSM")) {
				continue;
			}
			// 중복?
			boolean overlap = false;
			// 포문 돌려서 중복이 있는지 확인. 중복이 없으면 삭제대상.
			if (memberNo != null) {
				for (String m : memberNo) {
					if (m.equals(p.getMemberPk())) {
						overlap = true;
						psmExcList.add(m);
						break;
					}
				}
			}
			
			// 중복이 아니면 삭제처리
			if (!overlap) {
				Member member = new Member();
				member.setMemberNo(p.getMemberPk());
				member.setProjectPk(pid);
				ps.deleteProjectMember(member);
			}
		}
		
		// 이제 추가
		if (memberNo != null) {
			for (String m : memberNo) {
				boolean overlap = false;
				// 포문에 안겹치면 추기대상
				for (String exc : psmExcList) {
					if (m.equals(exc)) {
						overlap = true;
						break;
					}
				}
				if (!overlap) {
					ProjectTeam team = new ProjectTeam();
					team.setProjectPk(pid);
					team.setMemberPk(m);
					team.setRole("PSM");
					ps.insertProjectTeam(team);
				}
			}
		}
		
		// 프로젝트 수정
		int result = ps.updateProject(project);
		
		// 업뎃 다됬으면 파일도 업로드
		if (result > 0) {
			// 우선 파일 삭제부터 합시다.
			if (delFile != null) {
				for (String atNo : delFile) {
					Attachment attachment = ps.selectAttachment(atNo);
					
					File file1 = new File(attachment.getFilePath() + "\\" + attachment.getChangeName() + attachment.getExt());
					// 삭제 확인 후 디비에서도 삭제
					if (file1.exists()) {
						System.out.println("file1.exists()");
						if (file1.delete()) {
							System.out.println("file1.delete()");
							int fileResult = ps.deleteAttachment(atNo);
						}
					}
					
				}
			}
			
			for (MultipartFile f : file) {
				if (f.getSize() > 0) {
					
					System.out.println("file exists");
					String root = request.getSession().getServletContext().getRealPath("resources");
					String filePath = root + "\\uploadfiles";
					String originFileName = f.getOriginalFilename();
					String ext = originFileName.substring(originFileName.lastIndexOf("."));
					String changeName = CommonsUtils.getRandomString();
					
					try {
						f.transferTo(new File(filePath + "\\" + changeName + ext));
					} catch (IllegalStateException e) {
						e.printStackTrace();
					} catch (IOException e) {
						e.printStackTrace();
					}
					
					Attachment at = new Attachment();
					at.setChangeName(changeName);
					at.setOriginName(originFileName);
					at.setFilePath(filePath);
					at.setExt(ext);
					at.setDivision(pid);
					int result2 = ps.insertAttachment(at);
					System.out.println(result2);
				}
			}
		}
		
		// String lul = null;
		
		return "redirect:projectCenter.pr";
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
	
	//프로젝트 요약정보 조회(sj)
	@RequestMapping("/showProjectSummary.pr")
	public String showProjectSummary(Model model, HttpServletRequest request) {
		
		String pid = request.getParameter("pid");
		
		// 본격적으로 조회하기 전에 한번 필터 거친다.
		// 작업 status 가 '개발완료'로 뜨기 전에 종료일자를 넘기면 전부 '개발지연'으로 분류시킨다.
		// 또한 분류 후 작업 히스토리에 적용시킨다.
		
		List<ProjectWork> workList = ps.selectOutdatedWorks(pid);
		
		for (ProjectWork work : workList) {
			String workNo = work.getWorkNo();
			String workMember = work.getMemberNo();
			String teamPk = null;
			// 작업에 담당자가 배정돼있으면 넣고, 아니면 널처리
			if (workMember != null) {
				ProjectTeam team =
						new ProjectTeam(null, workNo, workMember,
								null, null, null, null);
				teamPk = ps.selectProjectTeamNo(team);
			}
			
			int result = ps.updateOutdatedWork(workNo);
			WorkHistory workHistory =
					new WorkHistory(null, workNo, "개발지연",
							"기한 초과로 인한 자동조치", null, teamPk,
							null, null, null);
			if (result > 0) {
				int result2 = ps.insertWorkHistory(workHistory);
			}
		}
		
		AllDashBoard ad = ps.selectOneProjectDetail(pid);
		
		List<Statistics> list3 = ps.statisticsList2(pid);
		List<ProjectHistory> hList = ps.selectHistory(pid);
		
		model.addAttribute("hList", hList);
		model.addAttribute("project", ad);
		model.addAttribute("list3", list3);
		model.addAttribute("project", ad);
		model.addAttribute("pid", pid);
		
		return "user/project/projectSummary";
	}
	
	@RequestMapping("/projectComplete.pr")
	public String projectComplete(Model model, HttpServletRequest request, HttpSession session) {
		String pid = request.getParameter("pid");
		Member m = (Member) session.getAttribute("loginUser");
		m.setProjectPk(pid);
		AllDashBoard  ad = ps.selectOneProjectDetail(pid);
		
		int result = ps.updateProjectStatus(pid);
		int result2 = ps.insertProjectHistory(m);
		
		model.addAttribute("project", ad);
		model.addAttribute("pid", pid);
		
		return "redirect:showProjectSummary.pr?="+pid;
	}
	
	//TW
	@RequestMapping("selectMember.pr")
	public void selectMember(@RequestParam String deptNo, HttpServletRequest request, HttpServletResponse response) {
		
		List<DeptMember> memberList = ps.selectMemberListResource(deptNo);
		System.out.println(memberList);
		
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		
		String gson = new Gson().toJson(memberList);
		
		try {
			response.getWriter().write(gson);
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}
	
	//TW 리소스, 팀프로젝트 member 추가
	@RequestMapping("addResource.pr")
	public void addResource(Member member, Model m, HttpServletRequest request, HttpServletResponse response) {
		
		String memberNoString = member.getMemberNo();
		//String projectPk = request.getParameter("projectPk");
		
		System.out.println("memberNoString : " + memberNoString);
		//System.out.println("projectPk : " + projectPk);
		
		String[] memberNo = memberNoString.split(",");
		
		System.out.println(memberNo[0]);
//      System.out.println(memberNo[1]);
		
		Member test[] = new Member[memberNo.length];
		
		System.out.println(test[0]);
		
		int result1 = 0;
		
		for (int i = 0; i < memberNo.length; i++) {
			Member me = new Member();
			
			me.setMemberNo(memberNo[i]);
			me.setProjectPk(member.getProjectPk());
			
			result1 = ps.insertResource(me);
			System.out.println(result1);
		}
		
		if (result1 > 0) {
			response.setContentType("application/json");
			response.setCharacterEncoding("UTF-8");
			
			String gson = new Gson().toJson(1);
			
			try {
				response.getWriter().write(gson);
			} catch (IOException e) {
				e.printStackTrace();
			}
		} else {
			
			m.addAttribute("msg", "실패 !!");
		}
		
	}
	
	//작업 배정 현황
	@RequestMapping("showAssignment.pr")
	public String showAssignment(HttpServletRequest request) {
		
		String pid = request.getParameter("pid");
		
		ProjectDetail pd = ps.selectOneProject(pid);
		
		//List<Member> list = ps.selectList
		
		
		return "user/project/workAssignment";
	}
	
	
	//TW 리소스삭제 전 work를 가진 멤버 확인
	@RequestMapping("checkWorkMember.pr")
	public void checkWorkMember(Member m, Model model, HttpServletRequest request, HttpServletResponse response) {
		
		int result = ps.selectCheckWorkMemberList(m);
		System.out.println("멤버확인 result : " + result);
		
		if (result == 0) {
			
			response.setContentType("application/json");
			response.setCharacterEncoding("UTF-8");
			
			String gson = new Gson().toJson(true);
			
			try {
				response.getWriter().write(gson);
			} catch (IOException e) {
				e.printStackTrace();
			}
			
		} else {
			
			response.setContentType("application/json");
			response.setCharacterEncoding("UTF-8");
			
			String gson = new Gson().toJson(false);
			
			try {
				response.getWriter().write(gson);
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		
	}
	
	//TW 리소스 work result == 0(true) 일 때, member 삭제
	@RequestMapping("deleteProjectMember.pr")
	public void deleteProjectMember(Member m, HttpServletRequest request, HttpServletResponse response) {
		
		int result = ps.deleteProjectMember(m);
		
		System.out.println("리소스 멤버삭제sss result : " + result);
		
		if (result > 0) {
			
			response.setContentType("application/json");
			response.setCharacterEncoding("UTF-8");
			
			String gson = new Gson().toJson(result);
			
			try {
				response.getWriter().write(gson);
			} catch (IOException e) {
				e.printStackTrace();
			}
			
		}
		
	}
	
	
	//TW 리소스삭제, 팀프로젝트 work에 있는 멤버 확인
	@RequestMapping("memberCheck.pr")
	public void memberCheck(Member m, Model model, HttpServletRequest request, HttpServletResponse response) {
		
		String member = ps.selectCheckWorkMemberName(m);
		model.addAttribute("member", member);
		
		System.out.println("work에 있는 member : " + member);
		
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		
		String gson = new Gson().toJson(member);
		
		try {
			response.getWriter().write(gson);
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}
	
	
}



















