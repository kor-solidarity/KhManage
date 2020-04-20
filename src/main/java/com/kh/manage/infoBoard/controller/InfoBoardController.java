package com.kh.manage.infoBoard.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;

import com.google.gson.Gson;
import com.amazonaws.Request;
import com.kh.manage.common.PageInfo;
import com.kh.manage.common.Pagination;
import com.kh.manage.infoBoard.model.service.InfoBoardService;
import com.kh.manage.infoBoard.model.vo.InfoBoard;
import com.kh.manage.infoBoard.model.vo.Reply;
import com.kh.manage.member.model.vo.Member;

@Controller
public class InfoBoardController {
	
	@Autowired
	private InfoBoardService is;
	@Autowired
	private Reply rp;
	
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
	public String insertBoard(InfoBoard ib, Model model, HttpServletRequest request) {
		
		Member loginUser = (Member) request.getSession().getAttribute("loginUser");
		
		System.out.println(loginUser);
		
		ib.setMemberNo(loginUser.getMemberNo());
		
		int result = is.insertBoard(ib);
		
		if(result > 0) {
			
			return "redirect:infoBoard.ib";
		} else {
			
			model.addAttribute("msg", "게시글 등록실패");
			
			return "common/errorPage";
		}
		
	}

	
	
	//게시글 상세보기
	@RequestMapping("selectOneBoard.ib")
	public String selectOneBoard(InfoBoard ib, Model model, HttpServletRequest request) {
		
		String boardNo = request.getParameter("boardNo");
		System.out.println("파라미터 boardNo : " + boardNo);
		
		ib.setBoardNo(boardNo);
		
		InfoBoard board = is.selectOneBoard(ib);
		 
		model.addAttribute("board", board);
		
		return "user/infoBoard/infoBoardDetail";
	}
	
	
	//댓글등록
	@RequestMapping("insertReply.ib")
	public void insertReply(HttpServletResponse response, HttpServletRequest request) {
		
		String boardNo = request.getParameter("boardNo");
		String replyContent = request.getParameter("replyContent");
		String memberNo = request.getParameter("memberNo");
		
		System.out.println("boardNo : " + boardNo);
		System.out.println("replyContent : " + replyContent);
		System.out.println("memberNo : " + memberNo);
		
		rp.setMemberNo(memberNo);
		rp.setReplyContent(replyContent);
		rp.setForumNo(boardNo);
		
		int result = is.insertReply(rp);
		
		
	}
	
	
	
	
}
















