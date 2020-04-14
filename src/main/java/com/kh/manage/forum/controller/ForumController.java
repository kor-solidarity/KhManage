package com.kh.manage.forum.controller;

import java.io.File;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.kh.manage.admin.template.model.vo.Template;
import com.kh.manage.common.Attachment;
import com.kh.manage.common.CommonsUtils;
import com.kh.manage.common.PageInfo;
import com.kh.manage.common.Pagination;
import com.kh.manage.forum.model.service.ForumService;
import com.kh.manage.forum.model.vo.Notice;
import com.kh.manage.member.model.vo.Member;

@Controller
public class ForumController {
	
	
	@Autowired 
	private ForumService fs;

	//공지사항 리스트 조회
	@RequestMapping("/noticeMain.fo")
	public String noticeMain(Model m , HttpServletRequest request) {
		
		int currentPage = 1;

		if(request.getParameter("currentPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}

		int listCount = fs.getListCount();
		System.out.println(listCount);
		
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);

		List<Notice> list = fs.noticeSelectAll(pi);

		m.addAttribute("list", list);
		m.addAttribute("pi",pi);
		
		return "user/forum/noticeMain";
		
	}
	
	
	@RequestMapping("insertNPage.fo")
	public String insertNoticePage() {
		
		return "user/forum/insertNotice";
	}
	
	//공지사항 등록 메소드
	@RequestMapping("insertNotice.fo")
	public String insertNotice(Notice n, Model m, @RequestParam MultipartFile upfile , HttpServletRequest request) {
		
		String root = request.getSession().getServletContext().getRealPath("resources");//web밑에있는 resources이다.

		System.out.println("root : " + root);
		
		String filePath = root + "\\uploadFiles"; 
		
		String originFileName = upfile.getOriginalFilename();//원본 파일 이름
		String ext = originFileName.substring(originFileName.lastIndexOf("."));//.png , .jpg 
		String changeName = CommonsUtils.getRandomString();
		
		Attachment at = new Attachment();
		at.setChangeName(changeName);
		at.setOriginName(originFileName);
		at.setFilePath(filePath);
		
		Member loginUser = (Member) request.getSession().getAttribute("loginUser");
		
		System.out.println(loginUser);
		
		n.setMemberNo(loginUser.getMemberNo());
		
		System.out.println(n);
		
		try {
			int result = fs.noticeInsert(n,at);
			System.out.println("controller : " + result);
			upfile.transferTo(new File(filePath + "\\" +  changeName + ext));
			
		} catch (Exception e) {
			
			new File(filePath + "\\" + changeName + ext).delete();
		}
		
		return "user/forum/insertNotice";
	}
	
	
	@RequestMapping("selectNotice.fo")
	public String selectNotice(Notice n, Model m, HttpServletRequest request) {
		
		String num = request.getParameter("num");
		System.out.println(num);
		
		n.setNoticeNo(num);
		
		Notice notice = fs.selectNotice(n);
		
		m.addAttribute("notice", notice);
		
		return "user/forum/selectNotice";
	}
	
	
	
}





















