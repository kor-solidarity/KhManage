package com.kh.manage.issue.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.manage.issue.model.service.IssueService;
import com.kh.manage.issue.model.vo.IssueWPT;
import com.kh.manage.issue.model.vo.IssueWork;
import com.kh.manage.member.model.vo.Member;

@Controller
public class IssueController {
	
	@Autowired
	private IssueService is;

	@RequestMapping("/issueList.iu")
	public String issueList() {
		
		return "user/issue/issueList";
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
		System.out.println(iw);
		mv.addObject("iw", iw);
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
	
	
	
	
	
}
