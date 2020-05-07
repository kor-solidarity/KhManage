package com.kh.manage.infoBoard.controller;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.Gson;
import com.amazonaws.Request;
import com.kh.manage.common.Attachment;
import com.kh.manage.common.CommonsUtils;
import com.kh.manage.common.PageInfo;
import com.kh.manage.common.Pagination;
import com.kh.manage.infoBoard.model.service.InfoBoardService;
import com.kh.manage.infoBoard.model.vo.BoReply;
import com.kh.manage.infoBoard.model.vo.InfoBoard;
import com.kh.manage.member.model.vo.Member;

@Controller
public class InfoBoardController {
	
	@Autowired
	private InfoBoardService is;
	@Autowired
	private BoReply rp;
	
	//게시판 메인페이지 + 리스트 조회
	@RequestMapping("/infoBoard.ib")
	public String infoBoardMain(Model m, HttpServletRequest request) {
		
		int currentPage = 1;
		
		if(request.getParameter("currentPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		
		int listCount = is.boardListCount();
		System.out.println("listCount : " + listCount);

		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		
		List<InfoBoard> blist = is.boardSelectAll(pi);
		
		m.addAttribute("blist", blist);
		m.addAttribute("pi", pi);
		
		return "user/infoBoard/infoBoardMain";
	}

	
	//게시글 작성페이지 이동
	@RequestMapping("/insertBoardPage.ib")
	public String insertBoardPage() {
		
		return "user/infoBoard/infoBoardInsert";
	}
	
	
	//게시글 등록
	@RequestMapping("/insertBoard.ib")
	public String insertBoard(InfoBoard ib, HttpSession session, Model model, HttpServletRequest request,
			@RequestParam MultipartFile attachmentFile) {
		
		String root = request.getSession().getServletContext().getRealPath("resources");
		System.out.println("root : " + root);
		
		String filePath = root + "\\uploadFiles";
		
		String originFileName = attachmentFile.getOriginalFilename();//원본 파일 이름
		String ext = originFileName.substring(originFileName.lastIndexOf("."));//.png , .jpg 
		String changeName = CommonsUtils.getRandomString();
		
		Attachment at = new Attachment();
		at.setChangeName(changeName);
		at.setOriginName(originFileName);
		at.setFilePath(filePath);
		at.setExt(ext);
		
		Member loginUser = (Member) request.getSession().getAttribute("loginUser");
		System.out.println("loginUser : " + loginUser);

		ib.setMemberNo(loginUser.getMemberNo());
			
		try {
			int result = is.insertBoard(ib, at);
			System.out.println("controller : " + result);
			attachmentFile.transferTo(new File(filePath + "\\" +  changeName + ext));
			
		} catch (Exception e) {
			
			new File(filePath + "\\" + changeName + ext).delete();
		}
				
		return "redirect:infoBoard.ib"; 
	}
			

	
	
	//게시글 상세보기
	@RequestMapping("selectOneBoard.ib")
	public String selectOneBoard(InfoBoard ib, Model model, HttpServletRequest request) {
		
		String boardNo = request.getParameter("boardNo");
		System.out.println("파라미터 boardNo : " + boardNo);
		
		ib.setBoardNo(boardNo);
		
		InfoBoard board = is.selectOneBoard(ib);
		 
		model.addAttribute("board", board);
		
		
		//댓글리스트
		List<BoReply> rlist = is.selectAllReply(ib);
		
		System.out.println("rlist : " + rlist);
		
		request.setAttribute("rlist", rlist);
		
		
		//
		
		
		//첨부파일 select
		Attachment at = new Attachment();
		at.setDivision(boardNo);
		
		at = is.selectAttachment(at);
		System.out.println("첨부파일 select확인 at : " + at);
		
		model.addAttribute("board", board);
		model.addAttribute("at", at);
		
		return "user/infoBoard/infoBoardDetail";
	}
	
	
	
	//댓글등록
	@RequestMapping("insertReply.ib")
	public void insertReply(HttpServletResponse response, HttpServletRequest request) {
		
		String boardNo = request.getParameter("boardNo");
		String replyContent = request.getParameter("replyContent");
		String memberNo = request.getParameter("memberNo");
//		Member loginUser = (Member) request.getSession().getAttribute("loginUser");
		
		System.out.println("boardNo : " + boardNo);
		System.out.println("replyContent : " + replyContent);
		System.out.println("memberNo : " + memberNo);
		
		rp.setMemberNo(memberNo);
		rp.setReplyContent(replyContent);
		rp.setForumNo(boardNo);
		
		int result = is.insertReply(rp);
		
		
	}
	
	
//	// 댓글 ajax조회
//	@RequestMapping("selectAllReply.ib")
//	public void selectAllReply(HttpServletResponse response, HttpServletRequest request) {
//		
//		String boardNo = request.getParameter("boardNo");
//		System.out.println("댓글 : " + boardNo);
//		
//		List<Reply> rlist = is.selectAllReply(boardNo);
//		
//		request.setAttribute("rlist", rlist);
//		response.setContentType("application/json");
//		response.setCharacterEncoding("UTF-8");
//		
////		String gson = new Gson().toJson(rlist);
//		
//		
//		
//	}
	
	
	
	//게시글 수정 select
	@RequestMapping("modifyBoardSelect.ib")
	public String updateBoardSelect(InfoBoard ib, Model model, HttpServletRequest request) {
		
		String boardNo = request.getParameter("boardNo");
		System.out.println("boardNo : " + boardNo);

		System.out.println("파라미터 boardNo : " + boardNo);
		
		ib.setBoardNo(boardNo);
		
		InfoBoard board = is.selectOneBoard(ib);
		 
		model.addAttribute("board", board);
		
		
		return "user/infoBoard/infoBoardUpdate";
	}
	
	
	
	
	//게시글 수정
	@RequestMapping("updateBoard.ib")
	public String updateBoard(HttpServletRequest request, HttpServletResponse response, HttpSession session, Model model) { 
		
		String boardNo = request.getParameter("boardNo");
		String boardTitle = request.getParameter("boardTitle");
		String boardContent = request.getParameter("boardContent");
		
		System.out.println("boardNo : " + boardNo);
		System.out.println("boardTitle : " + boardTitle);
		System.out.println("boardContent : " + boardContent);
		
		InfoBoard ib = new InfoBoard();
		ib.setBoardNo(boardNo);
		ib.setBoardTitle(boardTitle);
		ib.setBoardContent(boardContent);
		
		int result = is.updateBoard(ib);
		
		System.out.println("게시글 수정 result : " + result);
		
		if(result > 0) {
			
			//게시글 상세보기
			ib.setBoardNo(boardNo);
			InfoBoard board = is.selectOneBoard(ib);
			model.addAttribute("board", board);
			
			//댓글 상세보기
			ib.setBoardNo(boardNo);
			List<BoReply> rlist = is.selectAllReply(ib);
			request.setAttribute("rlist", rlist);
			
			
			return "user/infoBoard/infoBoardDetail";
		} else {
			
			return "user/infoBoard/infoBoardDetail";
		}
		
	}
	
	
	//게시글 삭제
	@RequestMapping("deleteBoard.ib")
	public String deleteBoard(HttpServletRequest request) {
		
		String boardNo = request.getParameter("boardNo");
		System.out.println("boardNo : " + boardNo);
		
		int result = is.deleteBoard(boardNo);
		
		System.out.println("게시글 삭제 result : " + result);
		
		
		return "redirect:infoBoard.ib";
	}
	
	
	//댓글삭제
	@RequestMapping("deleteReply.ib")
	public void deleteReply(HttpServletRequest request, HttpServletResponse response) {
		
		String replyNo = request.getParameter("replyNo");
		System.out.println("replyNo : " + replyNo);
		
		int result = is.deleteReply(replyNo);
		
	}
	
	
	//댓글삭제
	@RequestMapping("updateReply.ib")
	public void updateReply(HttpServletRequest request) {
		
		String replyNo = request.getParameter("replyNo");
		String replyContent = request.getParameter("replyContent");
		
		System.out.println("replyNo : " + replyNo);
		System.out.println("replyContent : " + replyContent);
		
		int result = is.updateReply(rp);
		
		System.out.println("댓글수정 result : " + result);
		
	}
	
	
	//첨부파일 다운로드
	@RequestMapping("download.ib")
	public void download(Model m, HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String no = request.getParameter("no");
		System.out.println("파일 no : " + no);
		
		Attachment file = is.downAttachment(no);
		System.out.println("file : " + file);
		
		
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
	
	
}
















