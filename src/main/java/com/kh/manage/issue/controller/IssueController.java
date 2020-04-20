package com.kh.manage.issue.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.manage.common.Attachment;
import com.kh.manage.common.CommonsUtils;
import com.kh.manage.issue.model.service.IssueService;
import com.kh.manage.issue.model.vo.Issue;
import com.kh.manage.issue.model.vo.IssueProjectTeam;
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
//		for(int i = 0; i < file.length; i++) {
//			System.out.println(file[i]);
//		}
//		System.out.println(issue);
//		List<Attachment> aList = new ArrayList<Attachment>();
//		
//		if(file.length > 0) {
//			for(int i = 0; i < file.length; i++) {
//				if(file[i].getSize() > 0) {
//					String root = request.getSession().getServletContext().getRealPath("resources");
//					String filePath = root + "\\uploadfiles";
//					String originFileName = file[i].getOriginalFilename();
//					String ext = originFileName.substring(originFileName.lastIndexOf("."));
//					String changeName = CommonsUtils.getRandomString();
//					
//					try {
//						file[i].transferTo(new File(filePath + "\\" + changeName + ext));
//					} catch (IllegalStateException e) {
//						// TODO Auto-generated catch block
//						e.printStackTrace();
//					} catch (IOException e) {
//						// TODO Auto-generated catch block
//						e.printStackTrace();
//					}
//					
//					Attachment at = new Attachment();
//					at.setChangeName(changeName);
//					at.setOriginName(originFileName);
//					at.setFilePath(filePath);
//					at.setExt(ext);
//					
//					aList.add(at);
//				}
//			}
//		}
//		
//		Issue ist = is.insertIssue(issue);
//		
//		if(ist.getIssueNo() != null) {
//			for(int i = 0; i < aList.size(); i++) {
//				aList.get(i).setDivision(ist.getIssueNo());
//				int result = is.insertIssueAttachment(aList.get(i));
//			}
//		}
		
		return "";
	}
	
	
}
