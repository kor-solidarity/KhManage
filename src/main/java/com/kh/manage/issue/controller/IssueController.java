package com.kh.manage.issue.controller;

import java.io.File;
import java.io.IOException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.manage.common.Attachment;
import com.kh.manage.common.CommonsUtils;
import com.kh.manage.common.PageInfo;
import com.kh.manage.common.Pagination;
import com.kh.manage.issue.model.service.IssueService;
import com.kh.manage.issue.model.vo.Issue;
import com.kh.manage.issue.model.vo.IssueHistory;
import com.kh.manage.issue.model.vo.IssueList;
import com.kh.manage.issue.model.vo.IssueProjectTeam;
import com.kh.manage.issue.model.vo.IssueWPT;
import com.kh.manage.issue.model.vo.IssueWork;
import com.kh.manage.member.model.vo.Member;

@Controller
public class IssueController {
	
	@Autowired
	private IssueService is;

	@RequestMapping("/issueList.iu")
	public String issueList(Model m, HttpServletRequest request) {
		
		Member member = (Member) request.getSession().getAttribute("loginUser");
		
		List<IssueWPT> iwpt = is.selectProjectName(member);
		
		
		if(iwpt != null) {
			request.setAttribute("iwpt", iwpt);
			return "user/issue/issueList";
		}else {
			request.setAttribute("msg", "이슈 리스트 출력 오류");
			return "common/errorPage";
		}
		
	}
	
	@GetMapping("/selectIssueList.iu")
	public String issueListpno(String pno, Model m, HttpServletRequest request) {
		Member member = (Member) request.getSession().getAttribute("loginUser");
		
		int currentPage = 1;
		
		List<IssueWPT> iwpt = is.selectProjectName(member);
		
		
		if(request.getParameter("currentPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		
		int listCount = is.getListCount(pno);
		
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		
		List<Issue> list = is.selectIssueList2(pno, pi);
		
		if(iwpt != null && list != null) {
			m.addAttribute("iwpt", iwpt);
			m.addAttribute("list", list);
			m.addAttribute("pi", pi);
			return "user/issue/selectIssueList";
		}else{
			m.addAttribute("msg", "이슈 리스트 출력 오류");
			
			return "common/errorPage";
		}
		
	}
	
	@RequestMapping("/issueInsertPage.iu")
	public String issueInsertPage(Model m, HttpServletRequest request) {
		
		Member member = (Member) request.getSession().getAttribute("loginUser");
		
		List<IssueWPT> iwpt = is.selectProjectName(member);
		
		
		if(iwpt != null) {
			request.setAttribute("iwpt", iwpt);
			return "user/issue/issueInsertPage";
		}else {
			request.setAttribute("msg", "이슈 입력 페이지 출력 오류");
			return "common/errorPage";
		}
		
	}
	
	@RequestMapping("/projectWorkList.iu")
	public ModelAndView projectWorkList(@RequestParam String pno, ModelAndView mv) {
		System.out.println(pno);
		
		List<IssueWork> iw = is.selectWorkList(pno);
		
		List<IssueProjectTeam> ipt = is.selectProjectTeamList(pno);
		
		System.out.println(iw);
		mv.addObject("iw", iw);
		mv.addObject("ipt", ipt);
		mv.setViewName("jsonView");
		
		return mv;
	}
	
	@RequestMapping("/changeRequestList.iu")
	public String changeRequestList() {
		return "user/issue/changeRequestList";
	}
	
	@RequestMapping("/RequestApprovalList.iu")
	public String RequestApprovalList() {
		return "user/issue/RequestApprovalList";
	}
	
	@RequestMapping("/changeRequestPage.iu")
	public String changeRequestPage() {
		return "user/issue/changeRequestPage";
	}
	
	
	@RequestMapping("/changeRequestDetail.iu")
	public String changeRequestDetail() {
		return "user/issue/changeRequestDetail";
	}
	
	
	@RequestMapping("/reqeustApprovalDetail.iu")
	public String reqeustApprovalDetail() {
		return "user/issue/reqeustApprovalDetail";
	}
	
	
	@RequestMapping("/insertIssue.iu")
	public String insertIssue(Issue issue, HttpServletRequest request, HttpSession session, @RequestParam MultipartFile[] file) {
		int result = 0;
		for(int i = 0; i < file.length; i++) {
			System.out.println(file[i]);
		}
		List<Attachment> aList =  new ArrayList<Attachment>();
		
		if(file.length > 0) {
			for(int i = 0; i < file.length; i++) {
				if(file[i].getSize() > 0) {
					String root = request.getSession().getServletContext().getRealPath("resources");
					String filePath = root + "\\uploadfiles";
					String originFileName = file[i].getOriginalFilename();
					String ext = originFileName.substring(originFileName.lastIndexOf("."));
					String changeName = CommonsUtils.getRandomString();
					
					try {
						file[i].transferTo(new File(filePath + "\\" + changeName + ext));
					} catch (IllegalStateException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					} catch (IOException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
					
					Attachment at = new Attachment();
					at.setChangeName(changeName);
					at.setOriginName(originFileName);
					at.setFilePath(filePath);
					at.setExt(ext);
					
					aList.add(at);
					
				}
			}
			  result = is.insertIssue(issue);
			System.out.println(aList);
			if(result > 0) {
				for(int i = 0; i < aList.size(); i++) {
					int result1 = is.insertIssueAttachment(aList.get(i));
				}
			}
			
		}else {
			result = is.insertIssue(issue);
		}

		
		
		if(result > 0) {
			List<IssueProjectTeam> ipt = is.selectProjectTeamList(issue);
			int result3 = is.insertIssueHistory(issue);
			
			for(int i = 0; i < ipt.size(); i++) {
				int result2 = is.insertReportProjectTeam(ipt.get(i));
				
			}
			
			return "redirect:issueList.iu";
		}else {
			
			request.setAttribute("msg", "이슈 등록 오류");
			return "common/errorPage";
		}
	
	}
	
	@RequestMapping("selectIssueOne.iu")
	public String selectIssueOne(String issueNo, Model m) {
		System.out.println(issueNo);
		
		
		IssueList issue = is.selectIssueOne(issueNo);
		
		Attachment at = new Attachment();
		
		at.setDivision(issueNo);
		
		List<Attachment> at2 = is.selectAttachment(at);
		
		if(issue != null) {
			m.addAttribute("issue", issue);
			m.addAttribute("at", at2);
			return "user/issue/selectIssueDetail";
		}else {
			m.addAttribute("msg", "이슈 확인 실패");
			return "common/errorPage";
		}
	}
	
	@RequestMapping("issueAgree.iu")
	public String issueAgree(String issueNo, String projectNo, Model m) {
		
		int result = is.selectissueAgree(issueNo);
		
		if(result > 0) {
			List<IssueProjectTeam> ipt = is.selectProjectTeamList(projectNo);
			for(int i = 0; i < ipt.size(); i++) {
				int result2 = is.insertReportProjectTeam(ipt.get(i));
			}
			return "redirect:selectIssueOne.iu?issueNo=" + issueNo;
		}else {
			m.addAttribute("msg", "이슈 승인 실패");
			return "common/errorPage";
		}
		
	}
	
	@RequestMapping("issueComplete.iu")
	public String issueComplete(IssueHistory ih, String projectNo, Model m) {
		
		System.out.println(ih);
		
		LocalDateTime dateAndtime = LocalDateTime.now();
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("HH:mm:ss");
		String time = dateAndtime.format(formatter);
		
		ih.setDateAndTime(ih.getIhDate()+time);
		
		
		int result = is.insertIssueComplete(ih);
		
		
		
		if(result > 0) {
			
			List<IssueProjectTeam> ipt = is.selectProjectTeamList(projectNo);
			for(int i = 0; i < ipt.size(); i++) {
				int result2 = is.insertReportProjectTeam(ipt.get(i));
			}
			return "redirect:selectIssueOne.iu?issueNo=" + ih.getIssueNo();
		}else {
			m.addAttribute("msg", "이슈 승인 실패");
			return "common/errorPage";
		}
		
	}
	
}
