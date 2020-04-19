package com.kh.manage.infoBoard.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.manage.infoBoard.model.service.InfoBoardService;

@Controller
public class InfoBoardController {
	
	@Autowired
	private InfoBoardService is;
	
	//게시판 메인페이지 + 리스트 조회
	@RequestMapping("/infoBoard.ib")
	public String infoBoardMain(Model m, HttpServletRequest request) {
		
		return "user/infoBoard/infoBoardMain";
	}

	
	//게시글 작성페이지
	@RequestMapping("/insertBoard.ib")
	public String insertBoard() {
		
		return "user/infoBoard/infoBoardInsert";
	}
	
	
	
}
