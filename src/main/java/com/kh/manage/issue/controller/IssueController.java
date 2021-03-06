package com.kh.manage.issue.controller;

import java.io.File;
import java.io.IOException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.HashMap;
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
import com.kh.manage.issue.model.vo.ChangeRequest;
import com.kh.manage.issue.model.vo.Issue;
import com.kh.manage.issue.model.vo.IssueHistory;
import com.kh.manage.issue.model.vo.IssueList;
import com.kh.manage.issue.model.vo.IssueProjectTeam;
import com.kh.manage.issue.model.vo.IssueWPT;
import com.kh.manage.issue.model.vo.IssueWork;
import com.kh.manage.member.model.vo.Member;
import com.kh.manage.work.model.vo.Grantor;
import com.kh.manage.work.model.vo.Work;
import com.kh.manage.work.model.vo.WorkProjectTeam;

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
	public ModelAndView projectWorkList(@RequestParam String pno, ModelAndView mv, HttpSession session) {
		System.out.println(pno);
		Member member = (Member) session.getAttribute("loginUser");
		
		List<WorkProjectTeam> wp = is.selectTeamWork(member);
		HashMap<String, String> map = new HashMap();
		
		map.put("pno", pno);
		map.put("memberNo", member.getMemberNo());
		
		List<IssueWork> iw = null;
		
		for(int i = 0; i < wp.size(); i++) {
			if(wp.get(i).getRole().equals("PM") || wp.get(i).getRole().equals("PSM")) {
				iw = is.selectWorkList(map);
			}else {
				iw = is.selectWorkTMList(map);
			}
		}
			
		
		
		
		
		List<IssueProjectTeam> ipt = is.selectProjectTeamList(pno);
		
		System.out.println("출력확인 : " + ipt);
		mv.addObject("iw", iw);
		mv.addObject("ipt", ipt);
		mv.setViewName("jsonView");
		
		return mv;
	}
	
	@RequestMapping("/changeRequestList.iu")
	public String changeRequestList(Model m, HttpServletRequest request) {
		Member member = (Member) request.getSession().getAttribute("loginUser");
		
		List<IssueWPT> iwpt = is.selectProjectName(member);
		
		
		if(iwpt != null) {
			request.setAttribute("iwpt", iwpt);
			return "user/issue/changeRequestList";
		}else {
			request.setAttribute("msg", "이슈 리스트 출력 오류");
			return "common/errorPage";
		}
		
	}
	
	@RequestMapping("/RequestApprovalList.iu")
	public String RequestApprovalList() {
		return "user/issue/RequestApprovalList";
	}
	
	@RequestMapping("/changeRequestPage.iu")
	public String changeRequestPage(Model m, HttpServletRequest request) {
		
		Member member = (Member) request.getSession().getAttribute("loginUser");
		
		List<WorkProjectTeam> wp = is.selectTeamWork(member);
		
		if(wp != null) {
			request.setAttribute("wp", wp);
			return "user/issue/changeRequestPage";
		}else {
			request.setAttribute("msg", "이슈 입력 페이지 오류");
			return "common/errorPage";
		}
		
		
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
		
//		LocalDateTime dateAndtime = LocalDateTime.now();
//		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("HH:mm:ss");
//		String time = dateAndtime.format(formatter);
		
//		ih.setDateAndTime(ih.getIhDate()+time);
		
		
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
	
	@RequestMapping("/insertChangeRequest.iu")
	public String insertChangeRequest(ChangeRequest cr, HttpServletRequest request) {
		
		System.out.println(cr);
		int result = is.insertChangeRequest(cr);
		
		if(result > 0) {
			int result2 = is.insertChangeRequestHistory(cr);
			return "redirect:changeRequestList.iu";
		}else {
			request.setAttribute("msg", "변경요청 등록 오류");
			return "common/errorPage";
		}
	}
	
	
	@RequestMapping("/selectChangeRequestList.iu")
	public String selectChangeRequestList(String pno, Model m, HttpServletRequest request) {
		Member member = (Member) request.getSession().getAttribute("loginUser");
		
		int currentPage = 1;
		
		List<IssueWPT> iwpt = is.selectProjectName(member);
		
		
		if(request.getParameter("currentPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		
		int listCount = is.getListCount(pno);
		
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		
		List<ChangeRequest> list = is.selectChangeRequestList(pno, pi);
		
		if(list != null) {
			m.addAttribute("iwpt", iwpt);
			m.addAttribute("list", list);
			m.addAttribute("pi", pi);
			return "user/issue/selectChangeRequestList";
		}else{
			m.addAttribute("msg", "이슈 리스트 출력 오류");
			
			return "common/errorPage";
		}
		
	}
	
	
	@RequestMapping("/selectChangeRequestOne.iu")
	public String selectChangeRequestOne(String changeNo, Model m) {
		ChangeRequest cr = is.selectChangeRequestOne(changeNo);
		System.out.println("출력확인" + cr);
		
		
		if(cr != null) {
			Grantor gn1 = is.selectGrantorName(cr.getGrantorNo());
			Grantor gn2 = is.selectGrantorName(cr.getMemberNo());
			Grantor gn3 = is.selectGrantorName(cr.getCrGrantor1());
			Grantor gn4 = is.selectGrantorName(cr.getCrGrantor2());
			Grantor gn5 = is.selectGrantorName(cr.getRegisterNo());
			
			Work wk = is.selectWorkOne(cr.getWorkNo());
			
			Grantor wn1 = is.selectGrantorName(wk.getGrantorNo());
			Grantor wn2 = is.selectGrantorName(wk.getMemberNo());
			
			m.addAttribute("cr", cr);
			m.addAttribute("gn1", gn1);
			m.addAttribute("gn2", gn2);
			m.addAttribute("gn3", gn3);
			m.addAttribute("gn4", gn4);
			m.addAttribute("gn5", gn5);
			
			m.addAttribute("wk", wk);
			m.addAttribute("wn1", wn1);
			m.addAttribute("wn2", wn2);
			
			return "user/issue/changeRequestDetail";
		}else {
			m.addAttribute("msg", "변경요청 상세내역 출력 오류");
			
			return "common/errorPage";
		}
		
	}
	
	@RequestMapping("/requestUpdate1.iu")
	public String requestUpdate1(ChangeRequest cr, Model m) {
		System.out.println("넘김 확인 : " + cr);
		
		int result = is.updateRequestConfirm1(cr);
		int result1 = 0;
		
		if(result > 0) {
			result1 = is.insertChangeRequestHistory1(cr);
		}
		
		if(result1 > 0) {
			return "redirect:selectChangeRequestOne.iu?changeNo=" + cr.getChangeNo();
		}else {
			m.addAttribute("msg", "변경요청 1차 승인 오류");
			
			return "common/errorPage";
		}
		
	}
	
	@RequestMapping("/requestUpdate2.iu")
	public String requestUpdate2(ChangeRequest cr, Model m) {
		
		int result = is.updateRequestConfirm2(cr);
		int result2 = 0;
		int result3 = 0;
		ChangeRequest updateWork = null;
		
		if(result > 0) {
			updateWork = is.selectChangeRequestOne(cr.getChangeNo()); 
		}
		
		if(updateWork != null) {
			result2 = is.updateWorkChangeRequest(updateWork);
		}
		
		if(result2 > 0){
			result3 = is.insertChangeRequestHistory2(cr);
		}
		
		if(result > 0 && updateWork != null && result2 > 0 && result3 > 0) {
			return "redirect:selectChangeRequestOne.iu?changeNo=" + cr.getChangeNo();
		}else {
			m.addAttribute("msg", "변경요청 2차 승인 오류");
			
			return "common/errorPage";
		}
		
	}
	
	
	
//	@RequestMapping("/selectWork.iu")
//	public ModelAndView selectWork(@RequestParam String workNo, ModelAndView mv, HttpSession session) {
//		
//		Work w = is.selectWork(workNo);
//		System.out.println("작업정보 출력 " + w);
//		
//		List<Grantor> gt = is.selectGrantorList(w.getProjectNo());
//		System.out.println("리스트 출력 : " + gt);
//		
//		List<Work> hw = is.selectHighWorkNoList(w);
//		System.out.println("작업리스트 출력 : "+ hw);
//		
//		HashMap<String, Object> map = new HashMap();
//		
//		map.put("Work", w);
//		map.put("gt", gt);
//		map.put("hw", hw);
//		
//		
//		//mv.addObject("map", map);
//		mv.addObject("gt", gt);
//		mv.addObject("w", w);
//		mv.addObject("hw", hw);
//		
//		mv.setViewName("jsonView");
//		
//		return mv;
//	}
//	
}
