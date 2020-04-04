package com.kh.manage.issue.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class IssueController {

	@RequestMapping("/issueList.iu")
	public String issueList() {
		
		return "user/issue/issueList";
	}
	
	@RequestMapping("/issueInsertPage.iu")
	public String issueInsertPage() {
		return "user/issue/issueInsertPage";
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
	
	
	
}
