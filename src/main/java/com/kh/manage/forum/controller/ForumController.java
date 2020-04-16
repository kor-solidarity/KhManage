package com.kh.manage.forum.controller;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.List;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.Gson;
import com.kh.manage.common.Attachment;
import com.kh.manage.common.CommonsUtils;
import com.kh.manage.common.PageInfo;
import com.kh.manage.common.Pagination;
import com.kh.manage.forum.model.service.ForumService;
import com.kh.manage.forum.model.vo.Notice;
import com.kh.manage.forum.model.vo.Reply;
import com.kh.manage.member.model.vo.Member;

@Controller
public class ForumController {
	
	
	@Autowired 
	private ForumService fs;
	@Autowired
	private Reply rp;

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
		at.setExt(ext);
		
		Member loginUser = (Member) request.getSession().getAttribute("loginUser");
		
		System.out.println(loginUser);
		
		n.setMemberNo(loginUser.getMemberNo());
		
		
		try {
			int result = fs.noticeInsert(n,at);
			System.out.println("controller : " + result);
			upfile.transferTo(new File(filePath + "\\" +  changeName + ext));
			
		} catch (Exception e) {
			
			new File(filePath + "\\" + changeName + ext).delete();
		}
		
		return "redirect:noticeMain.fo";
	}
	
	
	//공지사항 상세보기 메소드
	@RequestMapping("selectNotice.fo")
	public String selectNotice(Notice n, Model m, HttpServletRequest request) {
		
		String num = request.getParameter("num");
		System.out.println(num);
		
		n.setNoticeNo(num);
		
		Notice notice = fs.selectNotice(n);
		
		Attachment at = new Attachment();
		at.setDivision(num);
		System.out.println(at);
		
		at = fs.selectAttachment(at);
		System.out.println(at);
		
		m.addAttribute("notice", notice);
		m.addAttribute("at", at);
		
		return "user/forum/selectNotice";
	}
	
	//다운로드 메소드
	@RequestMapping("download.fo")
	public void download(Model m , HttpServletRequest request, HttpServletResponse response)throws Exception {
		
		String no = request.getParameter("no");
		System.out.println(no);
		
		Attachment file = fs.downAttachment(no);
		
		System.out.println(file);
		
		
		//폴더에서 파일을 읽을 스트림 생성
		BufferedInputStream buf = null;
		
		//클라이언트로 내보낼 출력 스트림 생성
		ServletOutputStream downOut = response.getOutputStream();
		
		//스트림으로 전송할 파일 객체 생성
		File downFile = new File(file.getFilePath() +"\\"+ file.getChangeName() + file.getExt());
		
		//응당 헤더 설정
		response.setContentType("text/plain; charset=UTF-8");
		response.setHeader("Content-Disposition", "attachment; filename=\"" + new String(file.getOriginName().getBytes("UTF-8"), "ISO-8859-1") + "\"");
		response.setContentLength((int) downFile.length());
		
		FileInputStream fin = new FileInputStream(downFile);
		buf = new BufferedInputStream(fin);
		
		int readBytes = 0;
		while((readBytes = buf.read()) != -1){
			downOut.write(readBytes);
		}
		
		downOut.close();
		buf.close();
		
	}
	
	//댓글 등록 메소드
	@RequestMapping("replyInsert.fo")
	public void replyInsert(HttpServletResponse response,HttpServletRequest request) {
		
		String content = request.getParameter("content");
		String memberNo = request.getParameter("memberNo");
		String nNo = request.getParameter("nNo");
		
		System.out.println(content);
		System.out.println(memberNo);
		System.out.println(nNo);
		
		rp.setMemberNo(memberNo);
		rp.setReplyContent(content);
		rp.setForumNo(nNo);
		
		int result = fs.replyInsert(rp);
		
		//List<Reply> list = fs.selectAllReply();
		
		/*
		 * String gson = new Gson().toJson(list);
		 * 
		 * try { response.getWriter().write(gson); } catch (IOException e) {
		 * e.printStackTrace(); }
		 */
	}
	
	
	@RequestMapping("replySelectAll.fo")
	public void replySelectALL(HttpServletResponse response,HttpServletRequest request) {
		
		String no = request.getParameter("nNo");
		
		System.out.println("댓글" + no);
		
		List<Reply> list = fs.selectAllReply(no);
		
		String gson = new Gson().toJson(list);

		try {
			response.getWriter().write(gson);
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}
	
	@RequestMapping("replyDelete.fo")
	public void replyDelete(HttpServletRequest request, HttpServletResponse response) {
		
		String no = request.getParameter("nNo");
		
		System.out.println(no);
		
		int result = fs.deleteReply(no);
		
		
	}
	
	
	@RequestMapping("deleteNotice.fo")
	public String deleteNotice(HttpServletRequest request) {
		
		String nNo = request.getParameter("nNo");
		System.out.println(nNo);
		
		int result = fs.deleteNotice(nNo);
		
		return "redirect:noticeMain.fo";
	}
	
	
	@RequestMapping("updateNoticeSelect.fo")
	public String updateNoticeSelect(HttpServletRequest request, Model m) {
		
		String nNo = request.getParameter("nNo");
		System.out.println(nNo);
		
		Notice n = new Notice();
		n.setNoticeNo(nNo);
		n = fs.selectNotice(n);
		System.out.println(n);
		
		Attachment at = new Attachment();
		at.setDivision(nNo);
		at = fs.selectAttachment(at);
		System.out.println(at);
		m.addAttribute("n",n);
		m.addAttribute("at", at);
		
		return "user/forum/updateNotice";
	}
	
	
	@RequestMapping("replyUpdate.fo")
	public void replyUpdate(HttpServletRequest request) {
		
		String nNo = request.getParameter("nNo");
		String comment = request.getParameter("comment");
		
		System.out.println(nNo);
		System.out.println(comment);
		
	}
	
	
	
	
}





















